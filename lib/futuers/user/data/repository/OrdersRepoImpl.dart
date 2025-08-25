import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/failure/failure.dart';
import 'package:delivery_app/core/network/networkInfo.dart';
import 'package:delivery_app/futuers/user/data/dataSource/OrdersRemoteDS.dart';
import 'package:delivery_app/futuers/user/data/dataSource/localDataBase/orders_local.dart';
import 'package:delivery_app/futuers/user/data/model/BillItemModel.dart';
import 'package:delivery_app/futuers/user/data/model/ReturnReasonModel.dart';
import 'package:delivery_app/futuers/user/data/model/StatusTypeModel.dart';
import 'package:delivery_app/futuers/user/domain/repository/OrdersRepo.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/BillItem.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/ReturnReason.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/StatusType.dart';
import 'package:drift/drift.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersRemoteDS remote;
  final NetworkInfo network;
  final OrdersLocalDb db;

  OrdersRepoImpl({
    required this.remote,
    required this.network,
    required this.db,
  });

  @override
  Future<Either<Failure, List<BillItem>>> getBills({
    required String deliveryNo,
    required int langNo,
  }) async {
    try {
      // لا يوجد إنترنت → رجّع من المحلي
      if (!await network.isConnected) {
        final rows = await db.getAllBills(); // List<BillRowsData>
        final list = rows
            .map(
              (r) => BillItem(
                billNo: r.billNo,
                billSrl: '', // غير مطلوب للكارد – نضع قيمة افتراضية
                billDateTime: DateTime.fromMillisecondsSinceEpoch(
                  r.billDateMillis,
                ),
                totalAmount: r.totalAmount,
                taxAmount: 0, // ليس مطلوبًا للكارد
                deliveryAmt: 0,
                mobile: '',
                region: '',
                address: '',
                lat: 0,
                lng: 0,
                statusFlag: r.statusFlag,
              ),
            )
            .toList();
        return right(list);
      }

      // يوجد إنترنت → اجلب من API ثم خزّن الضروري محليًا
      final res = await remote.getBills(deliveryNo: deliveryNo, langNo: langNo);
      if (res.statusCode != 200) {
        return left(Failure(errorMassge: 'Server error ${res.statusCode}'));
      }

      final map = jsonDecode(res.body) as Map<String, dynamic>;
      final models = (map['Data']?['DeliveryBills'] as List? ?? [])
          .map((e) => BillItemModel.fromJson(e))
          .toList();

      final entities = models
          .map(
            (m) => BillItem(
              billNo: m.billNo,
              billSrl: m.billSrl,
              billDateTime: m.billDateTime,
              totalAmount: m.totalAmount,
              taxAmount: m.taxAmount,
              deliveryAmt: m.deliveryAmt,
              mobile: m.mobile,
              region: m.region,
              address: m.address,
              lat: m.lat,
              lng: m.lng,
              statusFlag: m.statusFlag,
            ),
          )
          .toList();

      // تخزّين الحقول التي يحتاجها الكارد فقط
      await db.replaceBills(
        models
            .map(
              (m) => BillRowsCompanion.insert(
                billNo: m.billNo,
                totalAmount: m.totalAmount,
                billDateMillis: m.billDateTime.millisecondsSinceEpoch,
                statusFlag: m.statusFlag,
              ),
            )
            .toList(),
      );

      return right(entities);
    } catch (e) {
      return left(Failure(errorMassge: 'Failed to load bills: $e'));
    }
  }

  @override
  Future<Either<Failure, List<StatusType>>> getStatusTypes(int langNo) async {
    try {
      if (!await network.isConnected) {
        final rows = await db.getAllStatuses(); // List<StatusRowsData>
        final list = rows
            .map((r) => StatusType(id: r.id, name: r.name))
            .toList();
        return right(list);
      }

      final res = await remote.getStatusTypes(langNo: langNo);
      if (res.statusCode != 200) {
        return left(Failure(errorMassge: 'Server error ${res.statusCode}'));
      }

      final map = jsonDecode(res.body) as Map<String, dynamic>;
      final models = (map['Data']?['DeliveryStatusTypes'] as List? ?? [])
          .map((e) => StatusTypeModel.fromJson(e))
          .toList();

      final entities = models
          .map((m) => StatusType(id: m.id, name: m.name))
          .toList();

      await db.replaceStatuses(
        models
            .map(
              (m) => StatusRowsCompanion.insert(
                id: Value(m.id),
                name: Value(m.name).toString(),
              ),
            )
            .toList(),
      );

      return right(entities);
    } catch (e) {
      return left(Failure(errorMassge: 'Failed to load status types'));
    }
  }

  @override
  Future<Either<Failure, List<ReturnReason>>> getReturnReasons(
    int langNo,
  ) async {
    try {
      final res = await remote.getReturnReasons(langNo: langNo);
      if (res.statusCode != 200) {
        return left(Failure(errorMassge: 'Server error ${res.statusCode}'));
      }

      final map = jsonDecode(res.body) as Map<String, dynamic>;
      final list = (map['Data']?['ReturnBillReasons'] as List? ?? [])
          .map((e) => ReturnReasonModel.fromJson(e))
          .map((m) => ReturnReason(name: m.name))
          .toList();
      return right(list);
    } catch (e) {
      return left(Failure(errorMassge: 'Failed to load return reasons'));
    }
  }
}

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/failure/failure.dart';
import 'package:delivery_app/core/network/networkInfo.dart';
import 'package:delivery_app/futuers/user/data/dataSource/OrdersRemoteDS.dart';
import 'package:delivery_app/futuers/user/data/model/BillItemModel.dart';
import 'package:delivery_app/futuers/user/data/model/ReturnReasonModel.dart';
import 'package:delivery_app/futuers/user/data/model/StatusTypeModel.dart';
import 'package:delivery_app/futuers/user/domain/repository/OrdersRepo.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/BillItem.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/ReturnReason.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/StatusType.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersRemoteDS remote;
  final NetworkInfo network;
  OrdersRepoImpl({required this.remote, required this.network});

  @override
  Future<Either<Failure, List<BillItem>>> getBills({
    required String deliveryNo,
    required int langNo,
  }) async {
    try {
      final res = await remote.getBills(deliveryNo: deliveryNo, langNo: langNo);

      if (res.statusCode != 200) {
        return left(Failure(errorMassge: 'Server error ${res.statusCode}'));
      }

      final map = jsonDecode(res.body) as Map<String, dynamic>;
      final list = (map['Data']?['DeliveryBills'] as List? ?? [])
          // 1) حوّل من JSON → Model
          .map((e) => BillItemModel.fromJson(e))
          // 2) حوّل من Model → Entity
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

      return right(list);
    } catch (e) {
      return left(Failure(errorMassge: 'Failed to load bills: $e'));
    }
  }

  @override
  Future<Either<Failure, List<StatusType>>> getStatusTypes(int langNo) async {
    try {
      final res = await remote.getStatusTypes(langNo: langNo);
      final map = jsonDecode(res.body) as Map<String, dynamic>;
      final list = (map['Data']?['DeliveryStatusTypes'] as List? ?? [])
          .map((e) => StatusTypeModel.fromJson(e))
          .map((m) => StatusType(id: m.id, name: m.name))
          .toList();
      return right(list);
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

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'package:delivery_app/futuers/user/domain/useCase/GetBillsUseCase.dart';
import 'package:delivery_app/futuers/user/domain/useCase/GetReturnReasonsUseCase.dart';
import 'package:delivery_app/futuers/user/domain/useCase/GetStatusTypesUseCase.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/BillItem.dart';
import 'package:delivery_app/core/failure/failure.dart';

// نستورد الحالة كملف عادي (بدون part/part of)
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final GetBillsUseCase getBills;
  final GetStatusTypesUseCase getStatuses;
  final GetReturnReasonsUseCase getReasons;

  OrderCubit(this.getBills, this.getStatuses, this.getReasons)
    : super(const OrderState());

  Future<void> loadAll({
    required String deliveryNo,
    required int langNo,
  }) async {
    emit(state.copyWith(loading: true, error: null));

    final billsReq = await getBills(deliveryNo: deliveryNo, langNo: langNo);
    billsReq.fold(
      (l) => emit(
        state.copyWith(loading: false, error: 'Network or server error'),
      ),
      (r) => emit(
        state.copyWith(
          loading: false,
          bills: r,
          statusNames: Map(),
          returnReasons: [],
          error: null,
        ),
      ),
    );

    // try {
    //   // final statusesE = await getStatuses(langNo);
    //   // final reasonsE = await getReasons(langNo);
    //   // final bills = await getBills(deliveryNo: deliveryNo, langNo: langNo);

    //   // Failure? failure;
    //   // // statusesE.fold((f) => failure ??= f, (_) {});
    //   // // reasonsE.fold((f) => failure ??= f, (_) {});
    //   // billsE.fold((f) => failure ??= f, (_) {});
    //   // if (failure != null) {
    //   //   emit(state.copyWith(loading: false, error: failure!.errorMassge));
    //   //   return;
    //   // }

    //   // // final statuses = statusesE.getOrElse(() => []);
    //   // // final reasons = reasonsE.getOrElse(() => []);
    //   // final bills = billsE.getOrElse(() => []);

    //   // // final Map<int, String> statusMap = {
    //   // //   for (final st in statuses) st.id: st.name,
    //   // // };

    //   emit(
    //     state.copyWith(
    //       loading: false,
    //       bills: bills,
    //       statusNames: Map(),
    //       returnReasons: [],
    //       error: null,
    //     ),
    //   );
    // } catch (e, st) {
    //   // مهم: لا تترك الاستثناء—ارسل خطأ لينطفئ الـ spinner
    //   debugPrint('loadAll error: $e\n$st');
    //   emit(state.copyWith(loading: false, error: 'Network or server error'));
    // }
  }
}

import 'package:meta/meta.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/BillItem.dart';

@immutable
class OrderState {
  final bool loading;
  final List<BillItem> bills;
  final Map<int, String> statusNames;
  final List<String> returnReasons;
  final String? error;

  const OrderState({
    this.loading = false,
    this.bills = const [],
    this.statusNames = const {},
    this.returnReasons = const [],
    this.error,
  });

  OrderState copyWith({
    bool? loading,
    List<BillItem>? bills,
    Map<int, String>? statusNames,
    List<String>? returnReasons,
    String? error,
  }) {
    return OrderState(
      loading: loading ?? this.loading,
      bills: bills ?? this.bills,
      statusNames: statusNames ?? this.statusNames,
      returnReasons: returnReasons ?? this.returnReasons,
      error: error,
    );
  }
}

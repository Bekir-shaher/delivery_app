import 'package:delivery_app/futuers/user/domain/repository/OrdersRepo.dart';

class GetBillsUseCase {
  final OrdersRepo repo;
  GetBillsUseCase(this.repo);
  call({required String deliveryNo, required int langNo}) =>
      repo.getBills(deliveryNo: deliveryNo, langNo: langNo);
}




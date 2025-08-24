import 'package:delivery_app/futuers/user/domain/repository/OrdersRepo.dart';

class GetReturnReasonsUseCase {
  final OrdersRepo repo;
  GetReturnReasonsUseCase(this.repo);
  call(int langNo) => repo.getReturnReasons(langNo);
}

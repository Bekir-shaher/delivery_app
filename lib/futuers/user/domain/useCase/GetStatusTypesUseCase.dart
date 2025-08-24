import 'package:delivery_app/futuers/user/domain/repository/OrdersRepo.dart';

class GetStatusTypesUseCase {
  final OrdersRepo repo;
  GetStatusTypesUseCase(this.repo);
  call(int langNo) => repo.getStatusTypes(langNo);
}

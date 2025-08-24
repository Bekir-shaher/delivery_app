
import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/failure/failure.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/BillItem.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/ReturnReason.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/StatusType.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<BillItem>>> getBills({
    required String deliveryNo,
    required int langNo,
  });

  Future<Either<Failure, List<StatusType>>> getStatusTypes(int langNo);
  Future<Either<Failure, List<ReturnReason>>> getReturnReasons(int langNo);
}

import 'package:delivery_app/core/data/endponts.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/subEntity/resulitEntity.dart';

class ResuiltModel extends ResulitEntity {
  ResuiltModel({required super.ErrMsg, required super.ErrNo});

  factory ResuiltModel.fromJson(Map<String, dynamic> json) {
    return ResuiltModel(ErrMsg: json[ApiKey.ErrMsg], ErrNo: json[ApiKey.ErrNo]);
  }

  Map<String, dynamic> toJson() {
    return {ApiKey.ErrMsg: ErrMsg, ApiKey.ErrNo: ErrNo};
  }
}

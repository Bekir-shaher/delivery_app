import 'package:delivery_app/futuers/user/data/model/DataModel.dart';
import 'package:delivery_app/futuers/user/data/model/ResultModel.dart';

class LoginResponseModel {
  final DataModel? data;
  final ResultModel? result;

  const LoginResponseModel({this.data, this.result});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        data: json['Data'] != null ? DataModel.fromJson(json['Data']) : null,
        result:
            json['Result'] != null ? ResultModel.fromJson(json['Result']) : null,
      );

  Map<String, dynamic> toJson() =>
      {'Data': data?.toJson(), 'Result': result?.toJson()};
}

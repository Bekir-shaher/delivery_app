
import 'package:delivery_app/core/utils/cleanText.dart';

class ReturnReasonModel {
  final String name; // DLVRY_RTRN_RSN
  ReturnReasonModel({required this.name});

  factory ReturnReasonModel.fromJson(Map<String, dynamic> j) =>
      ReturnReasonModel(name: cleanText(j['DLVRY_RTRN_RSN']));
}

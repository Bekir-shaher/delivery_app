import 'package:delivery_app/core/utils/cleanText.dart';

class StatusTypeModel {
  final int id; // TYP_NO
  final String name; // TYP_NM (عربي)
  StatusTypeModel({required this.id, required this.name});

  factory StatusTypeModel.fromJson(Map<String, dynamic> j) =>
      StatusTypeModel(id: int.parse(j['TYP_NO']), name: cleanText(j['TYP_NM']));
}

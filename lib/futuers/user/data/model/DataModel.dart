class DataModel {
  final String deliveryName;
  const DataModel({required this.deliveryName});

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      DataModel(deliveryName: json['DeliveryName'] ?? '');

  Map<String, dynamic> toJson() => {'DeliveryName': deliveryName};
}

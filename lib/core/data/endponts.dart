class Endponts {
  static String baseUrl = "/OnyxDeliveryService/Service.svc/CheckDeliveryLogin";

  static const base =
      'http://mdev.yemensoft.net:8087/OnyxDeliveryService/Service.svc';

  static const login = '$base/CheckDeliveryLogin';
  static const bills = '$base/GetDeliveryBillsItems';
  static const statusTypes = '$base/GetDeliveryStatusTypes';
  static const returnReasons = '$base/GetReturnBillReasons';
}

class ApiKey {
  static String DeliveryName = "DeliveryName";
  static String Result = "Result";
  static String ErrNo = "ErrNo";
  static String ErrMsg = "ErrMsg";
}

class BillItem {
  final String billNo;
  final String billSrl;
  final DateTime billDateTime;
  final double totalAmount;
  final double taxAmount;
  final double deliveryAmt;
  final String mobile;
  final String region;
  final String address;
  final double? lat;
  final double? lng;
  final int statusFlag;

  BillItem({
    required this.billNo,
    required this.billSrl,
    required this.billDateTime,
    required this.totalAmount,
    required this.taxAmount,
    required this.deliveryAmt,
    required this.mobile,
    required this.region,
    required this.address,
    required this.lat,
    required this.lng,
    required this.statusFlag,
  });
}

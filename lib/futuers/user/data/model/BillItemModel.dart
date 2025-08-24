import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String _clean(String? s) =>
    (s ?? '').replaceAll(RegExp(r'[\u200E\u200F\u202A-\u202E]'), '').trim();

DateTime _parseDateTime(String d, String t) =>
    DateFormat('dd/MM/yyyy HH:mm:ss').parse('${_clean(d)} ${_clean(t)}');

class BillItemModel {
  final String billNo;
  final String billSrl;
  final DateTime billDateTime;
  final double totalAmount; // BILL_AMT
  final double taxAmount; // TAX_AMT
  final double deliveryAmt; // DLVRY_AMT
  final String mobile;
  final String region;
  final String address;
  final double? lat;
  final double? lng;
  final int statusFlag; // DLVRY_STATUS_FLG

  BillItemModel({
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

  factory BillItemModel.fromJson(Map<String, dynamic> j) {
    final amt = double.tryParse(j['BILL_AMT']?.toString() ?? '') ?? 0;
    final tax = double.tryParse(j['TAX_AMT']?.toString() ?? '') ?? 0;
    final dlv = double.tryParse(j['DLVRY_AMT']?.toString() ?? '') ?? 0;
    return BillItemModel(
      billNo: _clean(j['BILL_NO']),
      billSrl: _clean(j['BILL_SRL']),
      billDateTime: _parseDateTime(j['BILL_DATE'], j['BILL_TIME']),
      totalAmount: amt,
      taxAmount: tax,
      deliveryAmt: dlv,
      mobile: _clean(j['MOBILE_NO']),
      region: _clean(j['RGN_NM']),
      address: _clean(j['CSTMR_ADDRSS']),
      lat: double.tryParse(j['LATITUDE']?.toString() ?? ''),
      lng: double.tryParse(j['LONGITUDE']?.toString() ?? ''),
      statusFlag: int.tryParse(j['DLVRY_STATUS_FLG']?.toString() ?? '0') ?? 0,
    );
  }
}

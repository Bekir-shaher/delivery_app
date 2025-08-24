class ResultModel {
  final int errNo;
  final String errMsg;
  const ResultModel({required this.errNo, required this.errMsg});

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      ResultModel(errNo: json['ErrNo'] ?? -1, errMsg: json['ErrMsg'] ?? '');

  Map<String, dynamic> toJson() => {'ErrNo': errNo, 'ErrMsg': errMsg};
}


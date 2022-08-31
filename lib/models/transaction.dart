import 'dart:convert';

Transaction transactionFromJson(String str) => Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

class Transaction {
  Transaction({
    required this.name,
    required this.id,
    this.request,
    required this.response,
  });

  String name;
  String id;
  Request ? request;
  List <dynamic> response;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    name: json["name"],
    id: json["id"],
    request: Request.fromJson(json["request"]),
    response: List<dynamic>.from(json["response"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "request": request?.toJson(),
    "response": List<dynamic>.from(response.map((x) => x)),
  };
}

class Request {
  Request({
   required this.method,
   required this.header,
    this.url,
  });

  String method;
  List<dynamic> header;
  dynamic url;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
    method: json["method"],
    header: List<dynamic>.from(json["header"].map((x) => x)),
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "header": List<dynamic>.from(header.map((x) => x)),
    "url": url,
  };
}

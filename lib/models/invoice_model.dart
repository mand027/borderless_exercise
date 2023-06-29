import 'dart:convert';

List<Invoice> invoiceFromJson(String str) =>
    List<Invoice>.from(json.decode(str).map((x) => Invoice.fromJson(x)));

String invoiceToJson(List<Invoice> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Invoice {
  int? amount;
  Currency? currency;
  String? id;
  String? invoiceNumber;
  Status? status;
  String? submittedByUserId;
  DateTime? submittedDate;
  Type? type;

  Invoice({
    this.amount,
    this.currency,
    this.id,
    this.invoiceNumber,
    this.status,
    this.submittedByUserId,
    this.submittedDate,
    this.type,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        amount: json["amount"],
        currency: currencyValues.map[json["currency"]]!,
        id: json["id"],
        invoiceNumber: json["invoiceNumber"],
        status: statusValues.map[json["status"]]!,
        submittedByUserId: json["submittedByUserId"],
        submittedDate: json["submittedDate"] == null
            ? null
            : DateTime.parse(json["submittedDate"]),
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currency": currencyValues.reverse[currency],
        "id": id,
        "invoiceNumber": invoiceNumber,
        "status": statusValues.reverse[status],
        "submittedByUserId": submittedByUserId,
        "submittedDate": submittedDate?.toIso8601String(),
        "type": typeValues.reverse[type],
      };
}

enum Currency { EUR, MXN, CAD, USD }

final currencyValues = EnumValues({
  "CAD": Currency.CAD,
  "EUR": Currency.EUR,
  "MXN": Currency.MXN,
  "USD": Currency.USD
});

enum Status { PAID, PROCESSING, APPROVED, DRAFT }

final statusValues = EnumValues({
  "approved": Status.APPROVED,
  "draft": Status.DRAFT,
  "paid": Status.PAID,
  "processing": Status.PROCESSING
});

enum Type { BASE_PAY, EXPENSE }

final typeValues =
    EnumValues({"base pay": Type.BASE_PAY, "expense": Type.EXPENSE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

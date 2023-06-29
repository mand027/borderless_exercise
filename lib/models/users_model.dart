import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  String? email;
  String? firstName;
  String? id;
  String? lastName;

  Users({
    this.email,
    this.firstName,
    this.id,
    this.lastName,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        email: json["email"],
        firstName: json["firstName"],
        id: json["id"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "firstName": firstName,
        "id": id,
        "lastName": lastName,
      };
}

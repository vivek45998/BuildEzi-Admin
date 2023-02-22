class UserData {
  UserData({
     this.email,
  this.id,
    this.firstName,
    this.type,
    this.lastName,
    this.image
  });

  String? lastName;
  String ?email;
  String ?id;
  String ?firstName;
  String ?type;
  String ?image;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    email: json["email"],
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    type: json["type"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "id": id,
    "firstName": firstName,
    "type": type,
    "lastName":lastName,
    "image":image
  };
}

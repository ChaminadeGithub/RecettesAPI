// class User {
//   int id;
//   String username;
//   String email;
//   String firstname;
//   String lastname;
//   String gender;
//   String image;
//   String token;

//   User({
//     required this.id,
//     required this.username,
//     required this.email,
//     required this.firstname,
//     required this.lastname,
//     required this.gender,
//     required this.image,
//     required this.token,
//   });

//   User copyWith({
//     int? id,
//     String? username,
//     String? email,
//     String? firstname,
//     String? lastname,
//     String? gender,
//     String? image,
//     String? token,
//   }) =>
//       User(
//           id: id ?? this.id,
//           username: username ?? this.username,
//           email: email ?? this.email,
//           firstname: firstname ?? this.firstname,
//           lastname: lastname ?? this.lastname,
//           gender: gender ?? this.gender,
//           image: image ?? this.image,
//           token: token ?? this.token);

//   factory User.fromJson(Map<String, dynamic> json) => User(
//       id: json["id"],
//       username: json["username"],
//       email: json["email"],
//       firstname: json["firstname"],
//       lastname: json["lastname"],
//       gender: json["gender"],
//       image: json["image"],
//       token: json["token"]);

//   Map<String, dynamic> toJson() =>
//   (
//     "id" :id,
//     "username" :username,
//     "email" :email,
//     "firstname" :firstname,
//     "lastname" :lastname,
//     "gender" :gender,
//     "image" :image,
//     "token" :token,
//   );
// }

class User {
  int id;
  String username;
  String email;
  String firstname;
  String lastname;
  String gender;
  String image;
  String token;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.image,
    required this.token,
  });

  User copyWith({
    int? id,
    String? username,
    String? email,
    String? firstname,
    String? lastname,
    String? gender,
    String? image,
    String? token,
  }) =>
      User(
          id: id ?? this.id,
          username: username ?? this.username,
          email: email ?? this.email,
          firstname: firstname ?? this.firstname,
          lastname: lastname ?? this.lastname,
          gender: gender ?? this.gender,
          image: image ?? this.image,
          token: token ?? this.token);

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      gender: json["gender"],
      image: json["image"],
      token: json["token"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
        "gender": gender,
        "image": image,
        "token": token,
      };
}

class UserModel {
  String? userName;
  String? email;
  String? phoneNumber;
  String? profileImage;

  UserModel({this.userName, this.email, this.phoneNumber, this.profileImage});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    profileImage = json['profileImage'];
  }
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
    };
  }
}

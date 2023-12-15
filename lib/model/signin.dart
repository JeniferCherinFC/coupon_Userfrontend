class Signin{
  String? mobileNumber;
  String? password;

  Signin({
    required this.mobileNumber,
    required this.password,
    required context,
  });

  Map<String, dynamic> toMap() {
    return {
      'mobileNumber': mobileNumber,
      'password': password,
    };
  }

}

class Logout {
  String? userId;

  Logout({
    required this.userId,
    required context,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
    };
  }
}
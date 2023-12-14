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
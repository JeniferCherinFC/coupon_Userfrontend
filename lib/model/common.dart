class Changepassword{
  String? mobileNumber;
  String? password;

  Changepassword({
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

class Subscription{
  final String subId;
  final  String dop;
  final  String couponType;
  final String branch;
  final String sDate;
  final String eDate;



  Subscription({

    required this.subId,
    required this.dop,
    required this.couponType,
    required this.branch,
    required this.sDate,
    required this.eDate,


  });

}


class Availablecoupons{
  final String qrId;
  final  String QR;
  final  int avail;

  Availablecoupons({
    required this.qrId,
    required this.QR,
    required this.avail,


  });

}


class Usedcoupons{
  final String qrId;
  final  String QR;
  final  String claimeddate;
  final  int avail;

  Usedcoupons({
    required this.qrId,
    required this.QR,
    required this.claimeddate,
    required this.avail,


  });

}


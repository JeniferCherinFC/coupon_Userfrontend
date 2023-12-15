class Getdashboard{
  String? mobileNumber;

  Getdashboard({
    required this.mobileNumber,
    required context,
  });

  Map<String, dynamic> toMap() {
    return {
      'mobileNumber': mobileNumber,
    };
  }

}

class Coupon{
  final int totalAvail;
  final  int totalUsed;
  final  int bAvail;
  final int bUsed;
  final int lAvail;
  final int lUsed;
  final int dAvail;
  final int dUsed;


  Coupon({

    required this.totalAvail,
    required this.totalUsed,
    required this. bAvail,
    required this.bUsed,
    required this.lAvail,
    required this.lUsed,
    required this.dAvail,
    required this.dUsed,


  });

}
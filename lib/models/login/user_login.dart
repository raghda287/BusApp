class UserLoginModel {
   late bool status;
   late String message;
   late UserData data;

   UserLoginModel({required this.status, required this.message, required this.data});

   UserLoginModel.fromjson( Map<String, dynamic>json){
     status=json['status'];
     message=json['message'];
     data=(json['data'] !=null ?UserData.fromjson(json['data']):null)!;

   }
   Map<String, dynamic> tojson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['status'] = this.status;
     data['message'] = this.message;
     if (this.data != null) {
       data['data'] = this.data.toJson();
     }
     return data;
   }
}

class UserData {
  int? id;
  String? fName;
  String? lName;
  String? email;
  String? password;
  int? phoneNumber;
  List? tripHistory;
  List? reports;
  List? payments;
  //int? iV;



  // String? token;




  UserData({
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.tripHistory,
    required this.reports,
    required this.payments,
    //this.iV,
    //required this.token,
  });

UserData.fromjson( Map<String, dynamic>json){
id=json['id'];
fName=json['fName'];
lName=json['fName'];
email=json['email'];
phoneNumber=json['phoneNumber'];
password=json['password'];
tripHistory=json['tripHistory'];
reports=json['reports'];
payments=json['payments'];
//iV = json['__v'];


//token=json['token'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['fName'] = this.fName;
    data['lName'] = this.lName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    if (this.tripHistory != null) {
      data['tripHistory'] = this.tripHistory!.map((v) => v.toJson()).toList();
    }
    if (this.reports != null) {
      data['reports'] = this.reports!.map((v) => v.toJson()).toList();
    }
    if (this.payments != null) {
      data['payments'] = this.payments!.map((v) => v.toJson()).toList();
    }
    //data['__v'] = this.iV;
    return data;
  }
}

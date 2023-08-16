class User{

  String name = '';
  String email = '';
  String password = '';


  User();
  User.fromJSON(Map<String, dynamic> jsonMap) {
    jsonMap['name'] != null ? name  = jsonMap['name'] : name = '';
    jsonMap['email'] != null ? email  = jsonMap['email'] : email = '';
  }


  Map toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = email;
    map["name"] = name;
    map["password"] = password;
    return map;
  }

}
class LoginBody {
  String email;
  String password;

  LoginBody({this.email, this.password});

  factory LoginBody.fromJson(Map<String, dynamic> jsonMap) {
    return LoginBody(email: jsonMap["email"], password: jsonMap["password"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["email"] = this.email;
    data["password"] = this.password;
    return data;
  }
}


class Info{
  String? email;
  String? password;

  Info(this.email, this.password);

  Info.fromJson(Map<String, dynamic> json)
      :email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() =>{
    'email': email,
    'password': password
  };
}
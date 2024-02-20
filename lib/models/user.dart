class User {
  final int id;
  final String name;
  final String email;
  final bool enabled;
  //final int zone;
  final int role;
  final String password;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.enabled,
    //required this.zone,
    required this.role,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['username'],
      email: json['email'],
      enabled: json['enabled'],
      //zone: json['zone'],
      role: json['role'],
      password: json['password'],
    );
  }
}

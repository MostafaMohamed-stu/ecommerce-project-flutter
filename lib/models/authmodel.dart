class AuthModel {
  final String messege;
  final int id;

  AuthModel({required this.messege, required this.id});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(id: json['userId'], messege: json['message'] );
  }
}

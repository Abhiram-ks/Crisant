class CreateuserEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  CreateuserEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
  });

  
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'avatar': avatar,
    };
  }
}

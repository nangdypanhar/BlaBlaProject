///
/// This model describes a  BlaBlaCar user.
///
class User {
  final String firstName;
  final String lastName;
  final String? email;
  final String phone;
  final String? profilePicture;

  final bool? verifiedProfile;

  User(
      {required this.firstName,
      required this.lastName,
      required this.phone,
      this.email,
      this.profilePicture,
      this.verifiedProfile});

  @override
   String toString(){
     return 'User : $firstName';
   }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:send_packet/utils/helpers/formatter.dart';

class UserModel {
  // Garder les valeurs dont on ne veut pas modifier a final
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String role;
  final String email;
  String phoneNumber;
  String profilePicture;

  // constructor for UserModel
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.role,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  // Helper function to get the full name
  String get fullName => '$firstName $lastName';

  // helper function to format phone number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  // Static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split('');

  //static function to generate a username from the full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split('');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';

    String camelCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = 'cwt_$camelCaseUsername';
    return usernameWithPrefix;
  }

  //Static function to create an empty user model
  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      role: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  // Factory model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Role': role,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  //Factory method to create a usermodel from a firbase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        role: data['Role'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      // Si les données du document sont nulles, retourner une instance vide de UserModel
      throw Exception('Données de document nulles');
    }
  }
}

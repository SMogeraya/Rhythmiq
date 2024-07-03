import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soul_tunes/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;
  String address;
  String city;
  String state;
  String country;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
  });

  ///Helper funct to get full name
  String get fullName => '$firstName $lastName';

  ///formAT phone number
  String get formatphoneNo => TFormatter.formatPhoneNumber(phoneNumber);

//Static functio to split fullname into first name and last name
  static List<String> nameParts(fullname) => fullname.split(" ");

  //Static function to generate a username from fullnam

  static String generatUsername(fullname) {
    List<String> nameParts = fullname.split(" ");
    String firstname = nameParts[0].toLowerCase();
    String lastname = nameParts.length > 1 ? nameParts[1].toLowerCase() : " ";
    String camelCaseUsername = '$firstname$lastname';
    String usernameWithPreix = 'cut_$camelCaseUsername';
    return usernameWithPreix;
  }
  //convert model to json structure

  ///Static function to create on empty user model

  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
        address: '',
        city: '',
        state: '',
        country: '',
      );
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Address': address,
      'City': city,
      'State': state,
      'Country': country,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'],
        profilePicture: data['ProfilePicture'],
        address: data['Address'] ?? '',
        city: data['City'] ?? '',
        state: data['State'] ?? '',
        country: data['Country'] ?? '',
      );
    }
    return UserModel.empty();
  }
}

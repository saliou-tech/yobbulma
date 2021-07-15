import 'package:shared_preferences/shared_preferences.dart';

class User {
  int id;
  String prenom;
  String username;
  SharedPreferences _preferences;

  @override
  String toString() {
    return 'User{id: $id, prenom: $prenom, email: $email, telephone: $telephone, adresse: $adresse, nom: $nom, profile: $profile}';
  }

  String email;
  String telephone;
  String adresse;
  String nom;
  String password;
  String profile;

  User(
      {this.nom,
      this.id,
      this.prenom,
      this.email,
      this.telephone,
      this.adresse,
      this.profile,
      this.password,
      this.username});

  factory User.fromJson(dynamic map) {
    return User(
        id: map['id'],
        nom: map['nom'],
        prenom: map['prenom'],
        email: map['email'],
        telephone: map['telephone'],
        adresse: map['adresse'],
        profile: map['profile']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['adresse'] = this.adresse;
    data['profile'] = this.profile;
    return data;
  }
}

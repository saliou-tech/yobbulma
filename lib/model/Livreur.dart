class LivreurModel {
  String nom;
  int id;
  String prenom;
  String Zone;
  String adresse;
  String profile;
  String email;
  String telephone;
  String password;
  // public String role;
  bool isAbonnementDone;

  LivreurModel(
      {this.nom,
      this.id,
      this.prenom,
      this.Zone,
      this.adresse,
      this.profile,
      this.email,
      this.telephone,
      this.password,
      this.isAbonnementDone});

  factory LivreurModel.fromJson(dynamic map) {
    return LivreurModel(
        id: map['id'],
        nom: map['nom'],
        prenom: map['prenom'],
        Zone: map['Zone'],
        adresse: map['adresse'],
        profile: map['profile'],
        email: map['email'],
        telephone: map['telephone'],
        password: map['password']);
  }

  @override
  String toString() {
    return 'LivreurModel{nom: $nom, id: $id, prenom: $prenom, Zone: $Zone, adresse: $adresse, profile: $profile, email: $email, telephone: $telephone}';
  }
}

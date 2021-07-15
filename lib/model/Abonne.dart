class AbonneModel {
  int id;
  String nom;
  String prenom;
  String Zone;
  String adresse;
  String profile;
  String email;
  String telephone;
  String password;
  List<dynamic> besoins;
  // public String role;
  bool isAbonnementDone;

  AbonneModel(
      {this.id,
      this.nom,
      this.prenom,
      this.Zone,
      this.adresse,
      this.profile,
      this.email,
      this.telephone,
      this.besoins,
      this.password,
      this.isAbonnementDone});
  factory AbonneModel.fromJson(dynamic map) {
    return AbonneModel(
        id: map['id'],
        nom: map['nom'],
        prenom: map['prenom'],
        Zone: map['Zone'],
        adresse: map['adresse'],
        profile: map['profile'],
        email: map['email'],
        telephone: map['telephone'],
        besoins: map['besoins'],
        password: map['password']);
  }

  @override
  String toString() {
    return 'AbonneModel{id: $id, nom: $nom, prenom: $prenom, Zone: $Zone, adresse: $adresse, profile: $profile, email: $email, telephone: $telephone, password: $password, besoins: $besoins, isAbonnementDone: $isAbonnementDone}';
  }
}

class Livraison {
  int id;
  Map<String, dynamic> besoin;

  Livraison({this.id, this.besoin});

  @override
  String toString() {
    return 'Livraison{id: $id, besoin: $besoin}';
  }

  factory Livraison.fromJson(dynamic map) {
    return Livraison(id: map['id'], besoin: map['besoin']);
  }
}

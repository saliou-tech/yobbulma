class Besoin {
  int id;
  String date;
  bool statut;

  Besoin({this.id, this.date, this.statut});
  factory Besoin.fromJson(dynamic map) {
    return Besoin(id: map['id'], date: map['date'], statut: map['statut']);
  }

  @override
  String toString() {
    return 'Besoin{id: $id, date: $date, statut: $statut}';
  }
}

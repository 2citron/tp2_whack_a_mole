class Player {
  final int id;
  final String name;
  DateTime date;
  final int score;

  Player({
    required this.id,
    required this.name,
    required this.date,
    required this.score,
  });


  // Convert a Player into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'score': score,
      'date': date,
    };
  }

  // Implement toString to make it easier to see information about
  // each player when using the print statement.
  @override
  String toString() {
    return 'Player{id: $id, name: $name, date: $date, score: $score}';
  }
}
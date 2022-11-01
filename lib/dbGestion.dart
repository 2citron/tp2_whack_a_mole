import 'dart:async';
import 'playerClass.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

 final database = openDatabase(
  // Set the path to the database. Note: Using the `join` function from the
  // `path` packscore is best practice to ensure the path is correctly
  // constructed for each platform.
    join(await getDatabasesPath(), 'player_database.db'),
// When the database is first created, create a table to store players.
    onCreate: (db, version) {
// Run the CREATE TABLE statement on the database.
return db.execute(
'CREATE TABLE players(id INTEGER PRIMARY KEY, name TEXT, date DATETIME, score INTEGER)',
);
},
// Set the version. This executes the onCreate function and provides a
// path to perform database upgrades and downgrades.
version: 1,
);

Future<void> insertPlayer(Player player, database) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the Player into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same player is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'players',
    player.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// A method that retrieves all the players from the players table.
Future<List<Player>> players(database) async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all The Players.
  final List<Map<String, dynamic>> maps = await db.query('players');

  // Convert the List<Map<String, dynamic> into a List<Player>.
  return List.generate(maps.length, (i) {
    return Player(
      id: maps[i]['id'],
      name: maps[i]['name'],
      score: maps[i]['score'],
      date: maps[i]['date'],
    );
  });
}

Future<void> updatePlayer(Player player, database) async {
  // Get a reference to the database.
  final db = await database;

  // Update the given Player.
  await db.update(
    'players',
    player.toMap(),
    // Ensure that the Player has a matching id.
    where: 'id = ?',
    // Pass the Player's id as a whereArg to prevent SQL injection.
    whereArgs: [player.id],
  );
}

Future<void> deletePlayer(int id, database) async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Player from the database.
  await db.delete(
    'players',
    // Use a `where` clause to delete a specific player.
    where: 'id = ?',
    // Pass the Player's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}
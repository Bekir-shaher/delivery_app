import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

part 'users.g.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get deliveryName => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> insertUser(String deliveryName) =>
      into(users).insert(UsersCompanion(deliveryName: Value(deliveryName)));

  Future<User?> getUser() => select(users).getSingleOrNull();

  Future<void> clearUsers() => delete(users).go();
}

// lib/futuers/user/data/dataSource/localDataBase/orders_local.dart
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'orders_local.g.dart';

/// حقول الكارد فقط: رقم الفاتورة - الإجمالي - التاريخ - حالة الطلب
class BillRows extends Table {
  TextColumn get billNo => text()();                // ex: "9"
  RealColumn get totalAmount => real()();           // ex: 6378.0
  IntColumn get billDateMillis => integer()();      // DateTime.millisecondsSinceEpoch
  IntColumn get statusFlag => integer()();          // ex: 0,1,2,3
  @override
  Set<Column> get primaryKey => {billNo};
}

/// خريطة الحالات: id -> name
class StatusRows extends Table {
  IntColumn get id => integer()();                  // ex: 0,1,2,3
  TextColumn get name => text()();                  // "New", "Delivered", ...
  @override
  Set<Column> get primaryKey => {id};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'orders_cache.db'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [BillRows, StatusRows])
class OrdersLocalDb extends _$OrdersLocalDb {
  OrdersLocalDb() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  // استبدال الفواتير بالكامل (نخزن فقط حقول الكارد)
  Future<void> replaceBills(List<BillRowsCompanion> rows) async {
    await transaction(() async {
      await delete(billRows).go();
      await batch((b) => b.insertAll(
            billRows,
            rows,
            mode: InsertMode.insertOrReplace,
          ));
    });
  }

  Future<List<BillRow>> getAllBills() => select(billRows).get();

  // استبدال الحالات بالكامل
  Future<void> replaceStatuses(List<StatusRowsCompanion> rows) async {
    await transaction(() async {
      await delete(statusRows).go();
      await batch((b) => b.insertAll(
            statusRows,
            rows,
            mode: InsertMode.insertOrReplace,
          ));
    });
  }

  Future<List<StatusRow>> getAllStatuses() => select(statusRows).get();
}

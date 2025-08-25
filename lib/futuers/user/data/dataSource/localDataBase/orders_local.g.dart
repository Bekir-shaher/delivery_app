// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_local.dart';

// ignore_for_file: type=lint
class $BillRowsTable extends BillRows with TableInfo<$BillRowsTable, BillRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BillRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _billNoMeta = const VerificationMeta('billNo');
  @override
  late final GeneratedColumn<String> billNo = GeneratedColumn<String>(
    'bill_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _billDateMillisMeta = const VerificationMeta(
    'billDateMillis',
  );
  @override
  late final GeneratedColumn<int> billDateMillis = GeneratedColumn<int>(
    'bill_date_millis',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusFlagMeta = const VerificationMeta(
    'statusFlag',
  );
  @override
  late final GeneratedColumn<int> statusFlag = GeneratedColumn<int>(
    'status_flag',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    billNo,
    totalAmount,
    billDateMillis,
    statusFlag,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bill_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<BillRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('bill_no')) {
      context.handle(
        _billNoMeta,
        billNo.isAcceptableOrUnknown(data['bill_no']!, _billNoMeta),
      );
    } else if (isInserting) {
      context.missing(_billNoMeta);
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('bill_date_millis')) {
      context.handle(
        _billDateMillisMeta,
        billDateMillis.isAcceptableOrUnknown(
          data['bill_date_millis']!,
          _billDateMillisMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_billDateMillisMeta);
    }
    if (data.containsKey('status_flag')) {
      context.handle(
        _statusFlagMeta,
        statusFlag.isAcceptableOrUnknown(data['status_flag']!, _statusFlagMeta),
      );
    } else if (isInserting) {
      context.missing(_statusFlagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {billNo};
  @override
  BillRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BillRow(
      billNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bill_no'],
      )!,
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_amount'],
      )!,
      billDateMillis: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bill_date_millis'],
      )!,
      statusFlag: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status_flag'],
      )!,
    );
  }

  @override
  $BillRowsTable createAlias(String alias) {
    return $BillRowsTable(attachedDatabase, alias);
  }
}

class BillRow extends DataClass implements Insertable<BillRow> {
  final String billNo;
  final double totalAmount;
  final int billDateMillis;
  final int statusFlag;
  const BillRow({
    required this.billNo,
    required this.totalAmount,
    required this.billDateMillis,
    required this.statusFlag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['bill_no'] = Variable<String>(billNo);
    map['total_amount'] = Variable<double>(totalAmount);
    map['bill_date_millis'] = Variable<int>(billDateMillis);
    map['status_flag'] = Variable<int>(statusFlag);
    return map;
  }

  BillRowsCompanion toCompanion(bool nullToAbsent) {
    return BillRowsCompanion(
      billNo: Value(billNo),
      totalAmount: Value(totalAmount),
      billDateMillis: Value(billDateMillis),
      statusFlag: Value(statusFlag),
    );
  }

  factory BillRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BillRow(
      billNo: serializer.fromJson<String>(json['billNo']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      billDateMillis: serializer.fromJson<int>(json['billDateMillis']),
      statusFlag: serializer.fromJson<int>(json['statusFlag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'billNo': serializer.toJson<String>(billNo),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'billDateMillis': serializer.toJson<int>(billDateMillis),
      'statusFlag': serializer.toJson<int>(statusFlag),
    };
  }

  BillRow copyWith({
    String? billNo,
    double? totalAmount,
    int? billDateMillis,
    int? statusFlag,
  }) => BillRow(
    billNo: billNo ?? this.billNo,
    totalAmount: totalAmount ?? this.totalAmount,
    billDateMillis: billDateMillis ?? this.billDateMillis,
    statusFlag: statusFlag ?? this.statusFlag,
  );
  BillRow copyWithCompanion(BillRowsCompanion data) {
    return BillRow(
      billNo: data.billNo.present ? data.billNo.value : this.billNo,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      billDateMillis: data.billDateMillis.present
          ? data.billDateMillis.value
          : this.billDateMillis,
      statusFlag: data.statusFlag.present
          ? data.statusFlag.value
          : this.statusFlag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BillRow(')
          ..write('billNo: $billNo, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('billDateMillis: $billDateMillis, ')
          ..write('statusFlag: $statusFlag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(billNo, totalAmount, billDateMillis, statusFlag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BillRow &&
          other.billNo == this.billNo &&
          other.totalAmount == this.totalAmount &&
          other.billDateMillis == this.billDateMillis &&
          other.statusFlag == this.statusFlag);
}

class BillRowsCompanion extends UpdateCompanion<BillRow> {
  final Value<String> billNo;
  final Value<double> totalAmount;
  final Value<int> billDateMillis;
  final Value<int> statusFlag;
  final Value<int> rowid;
  const BillRowsCompanion({
    this.billNo = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.billDateMillis = const Value.absent(),
    this.statusFlag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BillRowsCompanion.insert({
    required String billNo,
    required double totalAmount,
    required int billDateMillis,
    required int statusFlag,
    this.rowid = const Value.absent(),
  }) : billNo = Value(billNo),
       totalAmount = Value(totalAmount),
       billDateMillis = Value(billDateMillis),
       statusFlag = Value(statusFlag);
  static Insertable<BillRow> custom({
    Expression<String>? billNo,
    Expression<double>? totalAmount,
    Expression<int>? billDateMillis,
    Expression<int>? statusFlag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (billNo != null) 'bill_no': billNo,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (billDateMillis != null) 'bill_date_millis': billDateMillis,
      if (statusFlag != null) 'status_flag': statusFlag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BillRowsCompanion copyWith({
    Value<String>? billNo,
    Value<double>? totalAmount,
    Value<int>? billDateMillis,
    Value<int>? statusFlag,
    Value<int>? rowid,
  }) {
    return BillRowsCompanion(
      billNo: billNo ?? this.billNo,
      totalAmount: totalAmount ?? this.totalAmount,
      billDateMillis: billDateMillis ?? this.billDateMillis,
      statusFlag: statusFlag ?? this.statusFlag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (billNo.present) {
      map['bill_no'] = Variable<String>(billNo.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (billDateMillis.present) {
      map['bill_date_millis'] = Variable<int>(billDateMillis.value);
    }
    if (statusFlag.present) {
      map['status_flag'] = Variable<int>(statusFlag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BillRowsCompanion(')
          ..write('billNo: $billNo, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('billDateMillis: $billDateMillis, ')
          ..write('statusFlag: $statusFlag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StatusRowsTable extends StatusRows
    with TableInfo<$StatusRowsTable, StatusRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatusRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'status_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<StatusRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StatusRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StatusRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $StatusRowsTable createAlias(String alias) {
    return $StatusRowsTable(attachedDatabase, alias);
  }
}

class StatusRow extends DataClass implements Insertable<StatusRow> {
  final int id;
  final String name;
  const StatusRow({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  StatusRowsCompanion toCompanion(bool nullToAbsent) {
    return StatusRowsCompanion(id: Value(id), name: Value(name));
  }

  factory StatusRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StatusRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  StatusRow copyWith({int? id, String? name}) =>
      StatusRow(id: id ?? this.id, name: name ?? this.name);
  StatusRow copyWithCompanion(StatusRowsCompanion data) {
    return StatusRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StatusRow(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StatusRow && other.id == this.id && other.name == this.name);
}

class StatusRowsCompanion extends UpdateCompanion<StatusRow> {
  final Value<int> id;
  final Value<String> name;
  const StatusRowsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  StatusRowsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<StatusRow> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  StatusRowsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return StatusRowsCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatusRowsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

abstract class _$OrdersLocalDb extends GeneratedDatabase {
  _$OrdersLocalDb(QueryExecutor e) : super(e);
  $OrdersLocalDbManager get managers => $OrdersLocalDbManager(this);
  late final $BillRowsTable billRows = $BillRowsTable(this);
  late final $StatusRowsTable statusRows = $StatusRowsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [billRows, statusRows];
}

typedef $$BillRowsTableCreateCompanionBuilder =
    BillRowsCompanion Function({
      required String billNo,
      required double totalAmount,
      required int billDateMillis,
      required int statusFlag,
      Value<int> rowid,
    });
typedef $$BillRowsTableUpdateCompanionBuilder =
    BillRowsCompanion Function({
      Value<String> billNo,
      Value<double> totalAmount,
      Value<int> billDateMillis,
      Value<int> statusFlag,
      Value<int> rowid,
    });

class $$BillRowsTableFilterComposer
    extends Composer<_$OrdersLocalDb, $BillRowsTable> {
  $$BillRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get billNo => $composableBuilder(
    column: $table.billNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get billDateMillis => $composableBuilder(
    column: $table.billDateMillis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get statusFlag => $composableBuilder(
    column: $table.statusFlag,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BillRowsTableOrderingComposer
    extends Composer<_$OrdersLocalDb, $BillRowsTable> {
  $$BillRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get billNo => $composableBuilder(
    column: $table.billNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get billDateMillis => $composableBuilder(
    column: $table.billDateMillis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get statusFlag => $composableBuilder(
    column: $table.statusFlag,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BillRowsTableAnnotationComposer
    extends Composer<_$OrdersLocalDb, $BillRowsTable> {
  $$BillRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get billNo =>
      $composableBuilder(column: $table.billNo, builder: (column) => column);

  GeneratedColumn<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get billDateMillis => $composableBuilder(
    column: $table.billDateMillis,
    builder: (column) => column,
  );

  GeneratedColumn<int> get statusFlag => $composableBuilder(
    column: $table.statusFlag,
    builder: (column) => column,
  );
}

class $$BillRowsTableTableManager
    extends
        RootTableManager<
          _$OrdersLocalDb,
          $BillRowsTable,
          BillRow,
          $$BillRowsTableFilterComposer,
          $$BillRowsTableOrderingComposer,
          $$BillRowsTableAnnotationComposer,
          $$BillRowsTableCreateCompanionBuilder,
          $$BillRowsTableUpdateCompanionBuilder,
          (BillRow, BaseReferences<_$OrdersLocalDb, $BillRowsTable, BillRow>),
          BillRow,
          PrefetchHooks Function()
        > {
  $$BillRowsTableTableManager(_$OrdersLocalDb db, $BillRowsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BillRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BillRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BillRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> billNo = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<int> billDateMillis = const Value.absent(),
                Value<int> statusFlag = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BillRowsCompanion(
                billNo: billNo,
                totalAmount: totalAmount,
                billDateMillis: billDateMillis,
                statusFlag: statusFlag,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String billNo,
                required double totalAmount,
                required int billDateMillis,
                required int statusFlag,
                Value<int> rowid = const Value.absent(),
              }) => BillRowsCompanion.insert(
                billNo: billNo,
                totalAmount: totalAmount,
                billDateMillis: billDateMillis,
                statusFlag: statusFlag,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BillRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$OrdersLocalDb,
      $BillRowsTable,
      BillRow,
      $$BillRowsTableFilterComposer,
      $$BillRowsTableOrderingComposer,
      $$BillRowsTableAnnotationComposer,
      $$BillRowsTableCreateCompanionBuilder,
      $$BillRowsTableUpdateCompanionBuilder,
      (BillRow, BaseReferences<_$OrdersLocalDb, $BillRowsTable, BillRow>),
      BillRow,
      PrefetchHooks Function()
    >;
typedef $$StatusRowsTableCreateCompanionBuilder =
    StatusRowsCompanion Function({Value<int> id, required String name});
typedef $$StatusRowsTableUpdateCompanionBuilder =
    StatusRowsCompanion Function({Value<int> id, Value<String> name});

class $$StatusRowsTableFilterComposer
    extends Composer<_$OrdersLocalDb, $StatusRowsTable> {
  $$StatusRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StatusRowsTableOrderingComposer
    extends Composer<_$OrdersLocalDb, $StatusRowsTable> {
  $$StatusRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StatusRowsTableAnnotationComposer
    extends Composer<_$OrdersLocalDb, $StatusRowsTable> {
  $$StatusRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$StatusRowsTableTableManager
    extends
        RootTableManager<
          _$OrdersLocalDb,
          $StatusRowsTable,
          StatusRow,
          $$StatusRowsTableFilterComposer,
          $$StatusRowsTableOrderingComposer,
          $$StatusRowsTableAnnotationComposer,
          $$StatusRowsTableCreateCompanionBuilder,
          $$StatusRowsTableUpdateCompanionBuilder,
          (
            StatusRow,
            BaseReferences<_$OrdersLocalDb, $StatusRowsTable, StatusRow>,
          ),
          StatusRow,
          PrefetchHooks Function()
        > {
  $$StatusRowsTableTableManager(_$OrdersLocalDb db, $StatusRowsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StatusRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StatusRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StatusRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => StatusRowsCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  StatusRowsCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StatusRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$OrdersLocalDb,
      $StatusRowsTable,
      StatusRow,
      $$StatusRowsTableFilterComposer,
      $$StatusRowsTableOrderingComposer,
      $$StatusRowsTableAnnotationComposer,
      $$StatusRowsTableCreateCompanionBuilder,
      $$StatusRowsTableUpdateCompanionBuilder,
      (StatusRow, BaseReferences<_$OrdersLocalDb, $StatusRowsTable, StatusRow>),
      StatusRow,
      PrefetchHooks Function()
    >;

class $OrdersLocalDbManager {
  final _$OrdersLocalDb _db;
  $OrdersLocalDbManager(this._db);
  $$BillRowsTableTableManager get billRows =>
      $$BillRowsTableTableManager(_db, _db.billRows);
  $$StatusRowsTableTableManager get statusRows =>
      $$StatusRowsTableTableManager(_db, _db.statusRows);
}

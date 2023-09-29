import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'AddIncomeScreen.dart';
import 'AddExpenseScreen.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    // Jika database belum ada, inisialisasi dan buat database baru
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'income_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    // Buat tabel 'incomes' untuk pendapatan
    await db.execute('''
      CREATE TABLE incomes(
        date TEXT,
        amount REAL,
        description TEXT
      )
    ''');

    // Buat tabel 'expenses' untuk pengeluaran
    await db.execute('''
      CREATE TABLE expenses(
        date TEXT,
        amount REAL,
        description TEXT
      )
    ''');
  }

  Future<void> saveExpenseData(
      double amount, DateTime date, String description) async {
    // Buka database
    final db = await database;

    // Sisipkan data pengeluaran ke dalam tabel 'expenses'
    await db.insert(
      'expenses',
      {
        'amount': amount,
        'date': date.toIso8601String(),
        'description': description,
      },
    );
  }

  Future<void> insertIncome(
      double amount, DateTime date, String description) async {
    final db = await database;
    await db.insert(
      'incomes',
      {
        'amount': amount,
        'date': date.toIso8601String(),
        'description': description,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAllIncomes() async {
    final db = await database;
    return await db.query('incomes');
  }

  // Contoh metode untuk mengambil semua data pengeluaran dari tabel 'expenses'
  Future<List<Map<String, dynamic>>> getAllExpenses() async {
    final db = await database;
    return await db.query('expenses');
  }

  // Tambahkan metode lain untuk mengelola data dalam database sesuai kebutuhan aplikasi Anda.
}

import 'dart:io';
import 'package:excel/excel.dart';

// ─── INTERFACE ────────────────────────────────────────────────────────────────
abstract class GradeEvaluator {
  String getLetterGrade(double average);
  String getStatus(double average);
}

// ─── DATA MODEL ───────────────────────────────────────────────────────────────
class StudentRecord {
  final String name;
  final List<double> scores;

  StudentRecord(this.name, this.scores);
}

// ─── CLASS ────────────────────────────────────────────────────────────────────
class StudentGradeCalculator implements GradeEvaluator {
  final List<StudentRecord> students;

  StudentGradeCalculator(this.students);

  // Higher-order function — accepts a custom processor lambda
  double calculateAverage(
      List<double> scores, List<double> Function(List<double>) processor) {
    final processed = processor(scores);
    final total = processed.fold(0.0, (sum, grade) => sum + grade);
    return total / processed.length;
  }

  @override
  String getLetterGrade(double average) {
    if (average >= 90) return 'A';
    if (average >= 80) return 'B';
    if (average >= 70) return 'C';
    if (average >= 60) return 'D';
    return 'F';
  }

  @override
  String getStatus(double average) => average >= 60 ? 'PASS ✅' : 'FAIL ❌';

  void processAndPrintAll() {
    print('\n==============================');
    print('         RESULTS');
    print('==============================');

    // Lambda passed to higher-order function
    for (var student in students) {
      final average =
          calculateAverage(student.scores, (gradeList) => gradeList);
      print('Student  : ${student.name}');
      print('Average  : ${average.toStringAsFixed(2)}%');
      print('Grade    : ${getLetterGrade(average)}');
      print('Status   : ${getStatus(average)}');
      print('------------------------------');
    }
    print('');
  }
}

// ─── EXCEL READER ─────────────────────────────────────────────────────────────
List<StudentRecord> readFromExcel(String filePath) {
  final bytes = File(filePath).readAsBytesSync();
  final excel = Excel.decodeBytes(bytes);
  final List<StudentRecord> records = [];

  final sheet = excel.tables[excel.tables.keys.first]!;

  // Lambda used with map + where to filter valid rows
  final rows = sheet.rows
      .skip(1) // skip header row
      .where((row) => row.length >= 2 && row[0] != null && row[1] != null)
      .toList();

  for (var row in rows) {
    final name = row[0]!.value.toString();
    final scores = row
        .skip(1)
        .where((cell) => cell != null)
        .map((cell) => double.tryParse(cell!.value.toString()) ?? 0.0)
        .toList();
    records.add(StudentRecord(name, scores));
  }

  return records;
}

// ─── MANUAL INPUT ─────────────────────────────────────────────────────────────
List<StudentRecord> readManually() {
  final List<StudentRecord> records = [];

  stdout.write('How many students? ');
  int numStudents = int.parse(stdin.readLineSync() ?? '1');

  for (int i = 1; i <= numStudents; i++) {
    print('\n--- Student $i ---');
    stdout.write('Enter student name: ');
    String name = stdin.readLineSync() ?? 'Unknown';

    stdout.write('How many subjects? ');
    int numSubjects = int.parse(stdin.readLineSync() ?? '0');

    List<double> grades = [];
    for (int j = 1; j <= numSubjects; j++) {
      stdout.write('Enter grade for Subject $j (0-100): ');
      double grade = double.parse(stdin.readLineSync() ?? '0');
      grades.add(grade);
    }

    records.add(StudentRecord(name, grades));
  }

  return records;
}

// ─── MAIN ─────────────────────────────────────────────────────────────────────
void main() {
  print('==============================');
  print('  Student Grade Calculator');
  print('==============================\n');
  print('1. Manual input');
  print('2. Load from Excel file');
  stdout.write('\nChoose option (1 or 2): ');

  final choice = stdin.readLineSync() ?? '1';
  List<StudentRecord> students = [];

  if (choice == '2') {
    stdout.write('Enter full path to Excel file (.xlsx): ');
    final path = stdin.readLineSync() ?? '';
    if (File(path).existsSync()) {
      students = readFromExcel(path);
      print('✅ Loaded ${students.length} student(s) from Excel.');
    } else {
      print('❌ File not found. Switching to manual input.');
      students = readManually();
    }
  } else {
    students = readManually();
  }

  final calculator = StudentGradeCalculator(students);
  calculator.processAndPrintAll();
}
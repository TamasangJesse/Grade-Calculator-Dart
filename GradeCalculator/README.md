# 🎓 Student Grade Calculator — Dart

**Course:** SE 3242 Android Application Development  
**Student:** TamasangJesse  
**Language:** Dart  

---

## 📌 Overview
A console-based Student Grade Calculator built in Dart, demonstrating core OOP concepts
including classes, interfaces, lambdas, and higher-order functions.

---

## ✨ Features
- Manual input of student names and grades
- Excel file (.xlsx) import for batch processing
- Calculates average, letter grade (A–F), and pass/fail status
- Supports multiple students in one session

---

## 🏗️ OOP Concepts Demonstrated

| Concept | Where Used |
|---|---|
| **Abstract class (Interface)** | `GradeEvaluator` — defines `getLetterGrade()` and `getStatus()` |
| **Class** | `StudentGradeCalculator` — implements `GradeEvaluator` |
| **Higher-order function** | `calculateAverage()` — accepts a lambda as parameter |
| **Lambda** | Passed to `calculateAverage()` and used in Excel row filtering |
| **Data model** | `StudentRecord` — holds student name and scores |

---

## 📁 Project Structure
```
GradeCalculator/
├── src/
│   └── grade_calculator.dart   # Main application code
├── assets/
│   └── students.xlsx           # Sample Excel test file
├── pubspec.yaml                # Dart dependencies
└── README.md                   # This file
```

## ▶️ How to Run

**Prerequisites:** Dart SDK installed (comes with Flutter)

**Manual input mode:**
```bash
dart run src/grade_calculator.dart
# Choose option 1, enter student names and grades manually
```

**Excel mode:**
```bash
dart run src/grade_calculator.dart
# Choose option 2, enter path to your .xlsx file
# Format: first column = student name, remaining columns = scores
```

---

## 📊 Excel File Format

| Name | Score1 | Score2 | Score3 |
|---|---|---|---|
| Alice | 85 | 90 | 78 |
| Bob | 55 | 60 | 50 |

---

## 🔗 Dart vs Kotlin Equivalents

| Kotlin | Dart |
|---|---|
| `interface` | `abstract class` |
| `data class` | Regular class with final fields |
| `{ it -> ... }` lambda | `(x) => ...` lambda |
| `list.filter { }` | `list.where((x) => )` |
| `fun` | `void` / return type |
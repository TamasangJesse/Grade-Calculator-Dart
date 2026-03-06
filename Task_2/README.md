# Task 2: Higher-Order Functions

## What are Higher-Order Functions?
A higher-order function (HOF) is a function that either:
- **Takes another function as a parameter**, or
- **Returns a function**

## HOFs implemented in this task

| Function | What it does |
|---|---|
| `processGrades(grades, processor)` | Takes a function and applies it to each grade |
| `filterGrades(grades, condition)` | Takes a condition function to filter grades |
| `makeGradeChecker(passMark)` | Returns a function that checks pass/fail |
| `processStudents(students, action)` | Takes a function and applies it to each student |

## Dart vs Kotlin
| Dart | Kotlin |
|---|---|
| `double Function(double)` | `(Double) -> Double` |
| `bool Function(double)` | `(Double) -> Boolean` |
| `list.map(processor)` | `list.map { processor(it) }` |
| `list.where(condition)` | `list.filter { condition(it) }` |
# Task 1: Lambda Functions

## What are Lambdas?
Lambdas are anonymous functions — functions without a name that can be
assigned to variables or passed directly as arguments.

## In Dart, lambdas look like this:
```dart
var square = (int x) => x * x;
```

## Lambdas used in this task

| Lambda | Purpose |
|---|---|
| `(int x) => x * x` | Squares a number |
| `(int a, int b) => a * b` | Multiplies two numbers |
| `(grade) => grade >= 60` | Filters passing grades |
| `(sum, grade) => sum + grade` | Accumulates total with fold |

## Dart vs Kotlin
| Dart | Kotlin |
|---|---|
| `(x) => x * x` | `{ x -> x * x }` |
| `list.where((x) => ...)` | `list.filter { ... }` |
| `list.fold(0, (acc, x) => ...)` | `list.fold(0) { acc, x -> ...}` |
## Notes
Lambdas are heavily used throughout the GradeCalculator project.
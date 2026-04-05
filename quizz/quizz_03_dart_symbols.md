# Quiz 03 — Dart Symbols & Punctuation

**Date**: 2026-04-05
**Topic**: What every symbol means in Dart code
**Level**: Beginner → Intermediate → Advanced

---

## Assignment & Comparison

**Q1**: What is the difference between `=`, `==`, and `!=`?
**Answer**:

---

**Q2**: What does `??` do? And `??=`?
```dart
String name = nickname ?? 'Guest';
nickname ??= 'Guest';
```
**Answer**:

---

## Punctuation

**Q3**: What does `;` do? What happens if you forget it?
**Answer**:

---

**Q4**: What does `:` do? Give 3 different uses in Dart.
**Answer**:

---

**Q5**: What does `,` do at the end of a parameter? Why do we add a trailing comma?
```dart
Dog(
  name: 'Rex',
  age: 5,  // <-- this comma
)
```
**Answer**:

---

## Arrows & Returns

**Q6**: What is the difference between `=>` and `{}`?
```dart
// A
int get age => 2026 - birthYear;
// B
int get age { return 2026 - birthYear; }
```
**Answer**:

---

**Q7**: What does `->` mean in Dart? (Trick question!)
**Answer**:

---

## Dots & Access

**Q8**: What is the difference between `.` and `..` (cascade)?
```dart
// A
dog.name;
// B
dog..name = 'Rex'..age = 5;
```
**Answer**:

---

**Q9**: What does `?.` do? When do you use it?
```dart
String? name = user?.name;
```
**Answer**:

---

**Q10**: What does `!` do after a variable? Why is it dangerous?
```dart
String name = nullableName!;
```
**Answer**:

---

## Brackets & Braces

**Q11**: What is the difference between `()`, `[]`, `{}`, and `<>`?
**Answer**:

---

**Q12**: What does `$` and `${}` do in a String?
```dart
'My name is $name and I am ${age + 1} years old'
```
**Answer**:

---

## Type Symbols

**Q13**: What does `?` mean after a type? And `late` before a type?
```dart
String? name;
late String name;
```
**Answer**:

---

**Q14**: What does `_` (underscore) mean at the start of a variable or class name?
```dart
final _name = 'Rex';
class _MyWidget extends StatelessWidget {}
```
**Answer**:

---

## Advanced

**Q15**: `{}` has 4 different meanings in Dart. Name them all and give an example of each.
**Answer**:

---

**Q16**: Read this line and explain every symbol:
```dart
final List<String> names = pets?.map((p) => p.name).toList() ?? [];
```
**Answer**:

---

## Corrections

*(Corrections will be added after your answers)*

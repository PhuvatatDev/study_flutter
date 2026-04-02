# Quiz 01 — Dart & OOP Fundamentals

**Date**: 2026-04-02
**Topic**: Dart keywords, classes, OOP
**Level**: Beginner → Intermediate → Advanced

---

## Beginner

**Q1**: What is the difference between `final` and `const`?
**Answer**: final the variable is initialise on the runtime and the value of the variable can't be change after. 
const is user before the runtime for a variable the are initialise and will never change their value.

---

**Q2**: What does `required` mean in front of a parameter?
**Answer**: is mean when use creat the objets you will need to initialise this value that is required! c'est un parrametre nommer aussi! 

---

**Q3**: What is a constructor? What is it used for?
**Answer**: is use for initialise the variable... is a part of the null safety systeme of the framwork! the variable can be create without the value or the promese of value! 

---

**Q4**: What is the difference between a positional parameter and a named parameter?
```dart
// A
Dog(this.name, this.age);
// B
Dog({required this.name, required this.age});
```
**Answer**: positional parameter is mean you need to give de value in the order the is define in the constructor! And the named parameter you can call in witch order you want but like is said is required! so you need tu give a value! 

---

**Q5**: What does the `this` keyword do in a constructor?
**Answer**: il saying to the framwork that variable will be initialise with a variable the call the same! 

---

**Q6**: What is `null safety` in Dart? What does `String?` mean vs `String`?
**Answer**: the variable can't be null ... but if you anonce it , then is ok! 
String? can be null but juste String dart will wait the value that is not null ... can be a empty string but need to be a string! String name = "";

---

## Intermediate

**Q7**: What is the difference between `extends` and `implements`?
**Answer**: extends is use to acces all methode and propriety from the widget parent! 
implement is when you fil up the methode describ in abstract class 
---

**Q8**: Why can't an `abstract` class be instantiated? What is it used for then?
**Answer**: abstract class is use for be a interface between other class for keep the code maintenable and scalable! so you don't put the logique in there! 

---

**Q9**: What is a getter? How is it different from a regular field?
```dart
// A — field
final int age;
// B — getter
int get age => DateTime.now().year - birthYear;
```
**Answer**: is a simple methode that you can call went you need to calculate in the class directely... is went you need to transforme a value of one of the variable in the class! 

note: to dois me reexpliquer car c'est pas claire dans ma tete! 

---

**Q10**: What does `@override` do? What happens if you forget it?
**Answer**: il rewrite methode for the widget parent that is herited from! if i forget il will not get accese to the mothode! 

---

**Q11**: What is the difference between `late` and `?` (nullable)?
```dart
late String name;
String? name;
```
**Answer**: late is mean is will be initialise in the future! is can't be null! but at the moment is non value but is ok! 
String? mean the variable can be null! 

---

**Q12**: What is `copyWith`? Why use it instead of modifying the object directly?
**Answer**: the entities need to be stable! don't touche to the business logique! copyWith change the objets from the orriginale! the orriginale stay stable! 

---

## Advanced

**Q13**: Explain this code line by line. What does each keyword do?
```dart
class CounterState extends Equatable {
  final int count;
  const CounterState({required this.count});

  @override
  List<Object?> get props => [count];
}
```
**Answer**: the class CounterState is herited propriety for the package Equatable that is use for change the value of the objets without all rewrite it! juste one value can be change ! 

declare final int count; variable that will stock a int!
constructor declare a const CounterState that required to give a value to the variable count! 
override the methode of the widget Equatable! 
use methode get props to modifier count and returne a List a Object (CounterState)

---

**Q14**: Why are States in Flutter/Bloc immutable? What problem does it solve?
**Answer**: stability of the code! everything is enum! the state do one thing and can't change... 

---

**Q15**: What is the difference between these 3 approaches? When should you use each one?
```dart
// A — Inheritance
class Dog extends Animal {}

// B — Interface
class Dog implements Animal {}

// C — Mixin
class Dog with Swimmer {}
```
**Answer**: extends Dog can the methode from Animal
implement Dog need to implement the methode for the abstract class Animal
with Dog use methode Swimer??  

---

## Corrections

### Q1 ✅ Correct!
**Your answer (translated):**
`final`: the variable is initialized at runtime and its value can't be changed after. `const`: the variable is initialized before runtime (at compile time) and will never change its value.

**Correction:** Good understanding! Small precision: `const` values are determined at **compile time** (before the app runs). `final` values are set at **runtime** (when the app runs) but can't change after.

> 🇫🇷 `final` = initialisé à l'exécution, ne change plus. `const` = initialisé à la compilation, ne change jamais.

---

### Q2 ✅ Correct!
**Your answer (translated):**
It means when you create the object, you must initialize this value that is required. It's also a named parameter.

**Correction:** Exactly right. `required` forces the caller to provide a value. And yes, `required` only works with named parameters `{}`.

> 🇫🇷 `required` oblige à fournir une valeur lors de la création. Ne s'utilise qu'avec les paramètres nommés `{}`.

---

### Q3 ⚠️ Partially correct
**Your answer (translated):**
It's used to initialize variables. It's part of the null safety system. Variables can't be created without a value or a promise of value.

**Correction:** A constructor is a **special method that creates an instance of a class**. It initializes the object's fields. It's related to null safety (fields must have values), but the constructor's main role is **object creation**, not just null safety.

**In English:** "A constructor is a special method called when creating a new instance of a class. It initializes the object's fields with the provided values."

> 🇫🇷 Un constructeur est une méthode spéciale appelée quand on crée une instance d'une classe. Il initialise les champs de l'objet.

---

### Q4 ✅ Correct!
**Your answer (translated):**
Positional parameter: you must give values in the order defined in the constructor. Named parameter: you can pass them in any order, but if marked `required`, you must provide a value.

**Correction:** Perfect. One addition: named parameters don't have to be `required` — they can be optional with a default value: `Dog({this.name = 'Rex'})`.

> 🇫🇷 Positionnel = ordre obligatoire. Nommé = ordre libre, peut être optionnel avec valeur par défaut.

---

### Q5 ⚠️ Partially correct
**Your answer (translated):**
It tells the framework that the variable will be initialized with a variable that has the same name.

**Correction:** `this` refers to **the current instance of the class**. In a constructor, `this.name` means "assign the parameter value to **this object's** `name` field". It's not a framework feature — it's Dart language itself.

**In English:** "`this` refers to the current instance. `this.name` in a constructor is a shorthand that assigns the parameter directly to the instance field `name`."

> 🇫🇷 `this` fait référence à l'instance actuelle. `this.name` dans un constructeur assigne le paramètre au champ `name` de l'objet.

---

### Q6 ✅ Correct!
**Your answer (translated):**
Variables can't be null. But if you declare it with `?`, then it's OK. `String?` can be null, but `String` expects a non-null value — can be empty but must be a String.

**Correction:** Good understanding.

**In English:** "Null safety means variables are non-nullable by default. `String` must always hold a String value. `String?` means the variable can hold a String or `null`."

> 🇫🇷 Par défaut, les variables ne peuvent pas être null. `String?` accepte null, `String` non.

---

### Q7 ⚠️ Partially correct
**Your answer (translated):**
`extends`: access all methods and properties from the parent. `implements`: you fill in the methods described in an abstract class.

**Correction:** Close, but `implements` is not limited to abstract classes. You can implement ANY class. The key difference:
- `extends` = you **inherit** everything (code included), you can override what you want
- `implements` = you get **nothing**, you must rewrite **every** method and property yourself

**In English:** "`extends` inherits the parent's code. `implements` creates a contract — you must provide your own implementation for every method and property."

> 🇫🇷 `extends` = tu hérites du code. `implements` = tu dois tout réécrire toi-même, c'est un contrat.

---

### Q8 ✅ Correct!
**Your answer (translated):**
Abstract class is used as an interface between other classes to keep the code maintainable and scalable. You don't put logic in there.

**Correction:** Good! One precision: you CAN put logic (method implementations) in an abstract class. The key point is **you can't do `AbstractClass()` to create an instance**. It exists to be extended or implemented by concrete classes.

**In English:** "An abstract class defines a contract (abstract methods) and can also provide shared implementation. It can't be instantiated directly — only its concrete subclasses can."

> 🇫🇷 Une classe abstraite définit un contrat. Elle PEUT contenir du code partagé. Elle ne peut pas être instanciée — seules ses sous-classes concrètes le peuvent.

---

### Q9 ⚠️ Needs clarification — as you asked!
**Your answer (translated):**
A simple method you call when you need to calculate something directly in the class. It's for transforming a value from one of the class variables.

**Correction:** You're on the right track. Here's the clear explanation:

- A **field** stores a value: `final int age = 25;` → the value is saved in memory
- A **getter** calculates a value each time you access it: `int get age => DateTime.now().year - birthYear;` → no value stored, computed every time

You call them the same way: `person.age`. The caller doesn't know if it's a field or a getter.

**When to use a getter:** when the value depends on other fields and should always be up-to-date.

> 🇫🇷 Un **champ** stocke une valeur en mémoire. Un **getter** calcule une valeur à chaque appel — rien n'est stocké. On les appelle de la même façon : `objet.age`.

---

### Q10 ❌ Incorrect
**Your answer (translated):**
It rewrites a method from the parent widget that is inherited. If you forget it, you won't have access to the method.

**Correction:** `@override` is just an **annotation** — a safety label. It tells Dart: "I know this method exists in the parent, I'm rewriting it on purpose." If you forget `@override`:
- **The code still works!** The method is still overridden
- But Dart analyzer shows a **warning** (not an error)

`@override` doesn't give or remove access. It's a best practice for readability and safety.

**In English:** "`@override` is an annotation that signals you're intentionally replacing a parent method. Forgetting it causes a warning, not an error — the override still works."

> 🇫🇷 `@override` est une annotation de sécurité. Si tu l'oublies, le code marche quand même — tu reçois juste un warning. Ça ne donne ni retire aucun accès.

---

### Q11 ✅ Correct!
**Your answer (translated):**
`late` means it will be initialized in the future. It can't be null, but for now it has no value and that's OK. `String?` means the variable can be null.

**Correction:** Good! One important detail: if you access a `late` variable before initializing it, your app **crashes** with a `LateInitializationError`. It's a promise you make to Dart: "trust me, I'll set it before using it."

**In English:** "`late` promises the variable will be initialized before first use — if not, the app crashes. `?` means the variable can legitimately hold `null` at any time."

> 🇫🇷 `late` = promesse d'initialiser avant d'utiliser (sinon crash). `?` = la variable peut être null à tout moment, c'est prévu.

---

### Q12 ⚠️ Partially correct
**Your answer (translated):**
Entities must be stable. Don't touch the business logic. `copyWith` changes the object from the original. The original stays stable.

**Correction:** Right idea! More precisely: `copyWith` creates a **new object** that is a copy of the original, with only some fields changed. The original is never modified.

Why? Because States are **immutable** (`final` fields). You can't do `state.count = 5`. Instead: `state.copyWith(count: 5)` → new object with `count = 5`, everything else unchanged.

**In English:** "`copyWith` creates a new instance with some fields changed, leaving the original unchanged. This is necessary because objects with `final` fields can't be modified after creation."

> 🇫🇷 `copyWith` crée un **nouvel objet** avec certains champs modifiés. L'original ne bouge jamais. Nécessaire car les champs `final` ne peuvent pas être modifiés.

---

### Q13 ⚠️ Partially correct
**Your answer (translated):**
CounterState inherits from Equatable to change object values without rewriting everything. Declares `final int count`. Constructor is const and requires count. Override Equatable method. Uses getter `props` to modify count and return a list.

**Correction:** Equatable is not for changing values — it's for **comparing objects by value**. Line by line:

1. `class CounterState extends Equatable` → inherits Equatable to compare states by their content (not memory address)
2. `final int count` → immutable field storing the count
3. `const CounterState({required this.count})` → const constructor, requires count value
4. `@override List<Object?> get props => [count]` → tells Equatable **which fields to use for comparison**. If two CounterStates have the same `count`, they are considered equal

`props` doesn't modify anything. It tells Equatable: "compare me using these fields."

> 🇫🇷 Equatable sert à **comparer** les objets par valeur. `props` liste les champs utilisés pour la comparaison. Si deux states ont le même `count`, ils sont considérés égaux.

---

### Q14 ⚠️ Partially correct
**Your answer (translated):**
Stability of the code. Everything is emitted. The state does one thing and can't change.

**Correction:** The real reason: Bloc/Cubit needs to **detect changes** to rebuild widgets. It compares old state vs new state. If you mutated the same object, old and new would be the same reference → Bloc thinks nothing changed → no rebuild.

Immutability guarantees: new state = new object → Bloc detects the difference → widget rebuilds.

**In English:** "States are immutable so Bloc can compare old vs new state. If you mutate the same object, Bloc can't detect the change. A new immutable object guarantees change detection and widget rebuilds."

> 🇫🇷 L'immutabilité permet à Bloc de détecter les changements. Ancien state ≠ nouveau state → rebuild du widget. Si on mutait le même objet, Bloc ne verrait aucune différence.

---

### Q15 ⚠️ Partially correct
**Your answer (translated):**
`extends`: Dog can use methods from Animal. `implements`: Dog must implement methods from abstract class Animal. `with`: Dog uses methods from Swimmer (unsure).

**Correction:**
- **`extends`** (inheritance): Dog **IS an** Animal. Gets all code for free, can override some. Single parent only.
- **`implements`** (interface): Dog **promises to behave like** Animal. Must rewrite everything. Can implement multiple classes.
- **`with`** (mixin): Dog **gains abilities** from Swimmer. Gets the code for free (like extends), but it's not a parent-child relationship. Can use multiple mixins.

**When to use:**
- `extends` → "my class IS a type of parent" (CounterCubit extends Cubit)
- `implements` → "my class follows this contract" (TodoRepositoryImpl implements TodoRepository)
- `with` → "my class gains this capability" (adding serialization, logging, etc.)

> 🇫🇷 `extends` = EST un (héritage, 1 seul parent). `implements` = PROMET de se comporter comme (contrat, doit tout réécrire). `with` = GAGNE des capacités (mixin, peut en avoir plusieurs).

---

## Score: 5/15 ✅ | 7/15 ⚠️ | 1/15 ❌

**Points forts:** `final` vs `const`, `required`, paramètres, null safety, `late` vs `?`
**À revoir:** Equatable & `props`, `@override`, `extends` vs `implements` vs `with`, immutabilité des States

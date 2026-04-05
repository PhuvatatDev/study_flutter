# Quiz 02 — Dev Culture (What You Forget)

**Date**: 2026-04-05
**Topic**: Dart, Patterns, Flutter lifecycle, State management, Clean Architecture
**Level**: Intermediate → Advanced

---

## Dart Async & Collections

**Q1**: What is a `Future`? What does it represent?
**Answer**: It's a delayed operation on the function. It will execute at runtime and it needs async and await operations. It tells Dart the operation is delayed, that's why the app doesn't crash!

---

**Q2**: What is the difference between `async/await` and `.then()`? When do you use each?
**Answer**: async/await makes operations in order by awaiting one by one. When you use .then() you can chain many actions with .then().

---

**Q3**: What happens if you forget `await` before a Future call? Does the app crash?
**Answer**: The app doesn't crash but the function will not be executed. You can have a Future function with only async. Await is like telling that we wait for something before doing other things!

---

**Q4**: What is a `Stream`? How is it different from a `Future`?
**Answer**: Stream, like the name says, keeps the operation continuous. Future is executed one time or one by one.


---

**Q5**: What does `try/catch` do? When MUST you use it?
**Answer**: try/catch is the protection for async operations because you can have an error between server for example. So if the async operation goes wrong we can manage the error without crashing the app!

---

## Design Patterns

**Q6**: What is a **Singleton** pattern? Give a real example from Flutter.
**Answer**: I think it's when you use enum. You give the child class the name of the variable that this class can only use.

---

**Q7**: What is the **Repository** pattern? Why not call the database directly from the UI?
**Answer**: I know already... answered this question 100 times!!!
---

**Q8**: What is the **Factory** pattern? How is `factory` constructor different from a normal constructor in Dart?
**Answer**: Factory is a special constructor that gives a class the possibility to map the values of the variables of the class.

---

## Flutter Lifecycle

**Q9**: What is `initState()`? When is it called and what do you put in it?
**Answer**: It's when you load something one time at the beginning on the runtime!

---

**Q10**: What is `dispose()`? What happens if you forget to use it?
**Answer**: Protects from memory leak. Disposes the controller that observes an operation (animation, textfield, etc.). Don't know why it's not automatic when you navigate!?

---

**Q11**: When does a widget **rebuild**? What triggers it?
**Answer**: build method or BlocBuilder. When the state changes we can build a new view for example.

---

**Q12**: Why does adding `const` to a widget improve performance?
**Answer**: It's already calculated on creation!

---

## State Management (Cubit/Bloc)

**Q13**: Describe the full Cubit flow: from user tap to UI update. What happens step by step?
**Answer**: User taps a button -> calls cubit method -> cubit calls usecase which is connected with the repository (domain) which is implemented by repositoryImpl (data) -> cubit emits the right state -> builds new view!

---

**Q14**: What is the difference between `BlocProvider`, `BlocBuilder`, and `BlocListener`? When do you use each?
**Answer**: BlocProvider is like a constructor of the package. It provides all cubit/bloc to the app. BlocBuilder builds the view after the state is emitted. BlocListener reacts on change, like a stream!

---

## Clean Architecture

**Q15**: Why do we use **UseCases** even when they just call the repository with no extra logic?
**Answer**: Good practice! Can be just a passthrough.

---

## Corrections

### Q1 ⚠️ Partially correct
A Future represents a **value that will be available later**. It's a promise: "I don't have the result now, but I will." It's not just a delay — it represents an asynchronous operation (API call, file read, database query) that takes time to complete. The app doesn't crash because Dart **doesn't block** — it continues running other code while waiting.

> 🇫🇷 Un Future = une promesse de valeur future. Dart n'attend pas, il continue le reste du code.

---

### Q2 ⚠️ Partially correct
`async/await` makes code **look synchronous** — easier to read, executes line by line. `.then()` chains callbacks. The result is the same. `await` is preferred for readability. `.then()` is useful for simple one-liners or when you don't want to mark the whole function `async`.

> 🇫🇷 `await` = plus lisible, ligne par ligne. `.then()` = callback chaîné. Même résultat, `await` est préféré.

---

### Q3 ⚠️ Partially correct
The app doesn't crash, correct. The function **IS executed**, but you don't wait for the result. The code continues immediately without the result. This can cause bugs: data not loaded yet when you try to use it, operations happening in wrong order. The Future "fires and forgets."

> 🇫🇷 Sans `await`, la fonction s'exécute quand même, mais tu n'attends pas le résultat. Le code continue sans la donnée → bugs possibles.

---

### Q4 ✅ Correct!
A Stream emits **multiple values over time** (like a river flowing). A Future gives **one value, one time**. Stream = continuous flow (real-time updates, Firestore snapshots). Future = single result (one API call).

> 🇫🇷 Stream = plusieurs valeurs dans le temps (flux continu). Future = une seule valeur, une seule fois.

---

### Q5 ✅ Correct!
Good understanding. One precision: `try/catch` is not ONLY for async operations. You use it for **any operation that can fail**: parsing JSON, converting types, file operations, network calls. The key: it catches **runtime errors** so your app can handle them gracefully instead of crashing.

> 🇫🇷 `try/catch` = pour toute opération qui peut échouer (pas seulement async). Gère l'erreur au lieu de crasher.

---

### Q6 ❌ Incorrect
A Singleton has nothing to do with enums. A Singleton is a class that can have **only ONE instance** in the entire app. You always get the same object. Example in Flutter: a `DatabaseService` — you want ONE connection to the database, not a new one every time.

```dart
class DatabaseService {
  static final DatabaseService _instance = DatabaseService._();
  factory DatabaseService() => _instance; // always returns same object
  DatabaseService._(); // private constructor
}
```

> 🇫🇷 Singleton = une seule instance dans toute l'app. Toujours le même objet. Ex: une connexion base de données.

---

### Q7 ✅ Skipped (already mastered)

---

### Q8 ⚠️ Partially correct
A `factory` constructor can **return an existing instance** or a **different type** (subclass). A normal constructor always creates a **new** instance. Main use cases: `fromJson()` to create an object from a Map, returning a cached instance (Singleton), or returning different subclasses based on input.

```dart
factory Animal.fromJson(Map<String, dynamic> json) {
  return Animal(name: json['name'], age: json['age']);
}
```

> 🇫🇷 `factory` peut retourner un objet existant ou un sous-type. Constructeur normal = toujours un nouvel objet. Usage courant : `fromJson()`.

---

### Q9 ⚠️ Partially correct
Right idea. More precisely: `initState()` is called **once** when the StatefulWidget is inserted into the widget tree. You put there: controller initialization, initial data loading, subscriptions. It runs **before** the first `build()`.

> 🇫🇷 `initState()` = appelé une seule fois quand le widget est créé. Pour : init controllers, charger data, abonnements.

---

### Q10 ✅ Correct!
Good understanding. To answer your question: Flutter doesn't auto-dispose because **it doesn't know what you created**. You manually created the controller, you manually dispose it. It's your responsibility. If you forget → the controller keeps listening in memory even after the widget is gone → memory leak.

> 🇫🇷 Flutter ne sait pas ce que tu as créé, donc c'est à toi de le détruire. Si tu oublies → le controller reste en mémoire → fuite mémoire.

---

### Q11 ⚠️ Partially correct
A widget rebuilds when:
1. **`setState()`** is called (StatefulWidget)
2. **Parent rebuilds** and passes new data
3. **BlocBuilder** detects a new state emitted
4. **InheritedWidget** changes (like Theme, MediaQuery)

`build()` is the method that runs, it's not what triggers the rebuild.

> 🇫🇷 Rebuild déclenché par : `setState()`, parent qui rebuild, nouveau state émis (BlocBuilder), ou InheritedWidget qui change.

---

### Q12 ⚠️ Partially correct
Close. A `const` widget is created **once at compile time** and **reused**. When the parent rebuilds, Flutter sees the `const` widget is the same object → **skips rebuilding it entirely**. Without `const`, Flutter recreates the widget object every rebuild, even if nothing changed.

> 🇫🇷 `const` = créé une seule fois, réutilisé. Flutter le voit identique → skip le rebuild. Sans `const` = recréé à chaque rebuild.

---

### Q13 ✅ Correct!
The flow is right. Clean Architecture path: UI → Cubit → UseCase → Repository (domain) → RepositoryImpl (data) → DataSource → back up with result → Cubit emits new State → BlocBuilder rebuilds UI.

> 🇫🇷 Flux correct ! UI → Cubit → UseCase → Repository → DataSource → retour → emit → rebuild.

---

### Q14 ⚠️ Partially correct
Good start. More precise:
- **BlocProvider**: **creates and provides** a Cubit/Bloc to the widget tree. Widgets below can access it.
- **BlocBuilder**: **rebuilds UI** every time a new state is emitted. Use for: displaying data.
- **BlocListener**: **executes an action once** on state change (no rebuild). Use for: navigation, snackbar, dialog.

Key difference: BlocBuilder = rebuild UI. BlocListener = side effect (navigate, show message).

> 🇫🇷 BlocProvider = fournit le Cubit. BlocBuilder = reconstruit l'UI (afficher). BlocListener = action unique (naviguer, snackbar).

---

### Q15 ⚠️ Partially correct
"Good practice" is true but vague. The real reasons:
1. **Single entry point** for each business action → easier to find and test
2. **Future-proof**: today it's a passthrough, tomorrow you add validation, caching, or logging — without touching the Cubit
3. **Testability**: you can test the UseCase in isolation

> 🇫🇷 UseCase = point d'entrée unique pour chaque action métier. Aujourd'hui passthrough, demain tu ajoutes de la logique sans toucher au Cubit.

---

## Score: 4/15 ✅ | 9/15 ⚠️ | 1/15 ❌ | 1 skipped

**Points forts:** Stream vs Future, try/catch, dispose, flux Cubit complet
**À revoir:** Singleton, Factory, widget rebuild triggers, BlocBuilder vs BlocListener, Future (le concept précis)

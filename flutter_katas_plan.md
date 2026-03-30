# Programme d'Entraînement Complet — Katas + Quizz

## Objectif

Se ré-entraîner à penser et coder comme un ingénieur Flutter.
Pas juste écrire des widgets — résoudre des problèmes, orchestrer la logique, gérer le state.

Chaque kata = un problème concret → tu dois concevoir la solution complète.

---

## Setup du projet

```bash
flutter create study_flutter
cd study_flutter
flutter pub add flutter_bloc equatable dartz
```

Structure recommandée :

```
lib/
  katas/
    kata_01_counter_logic/
      domain/
      presentation/
    kata_02_todo_state/
      data/
      domain/
      presentation/
    ...
```

Chaque kata est isolé. Tu peux les lancer un par un via `main.dart`.

---

## Niveau 1 — Les Fondations (State + Cubit)

### Kata 01 — Counter avec logique métier

**Problème** : Un compteur qui ne peut pas dépasser 10 ni descendre sous 0.
Affiche un message d'erreur si l'utilisateur essaie.

**Ce que tu dois créer** :
- Un `CounterState` avec `count` et `errorMessage`
- Un `CounterCubit` avec `increment()` et `decrement()`
- La logique de validation dans le Cubit (pas dans le widget)
- Un widget avec deux boutons et l'affichage

**Réflexion** : Où mettre la règle "max 10" ? Dans le widget ? Dans le Cubit ? Pourquoi ?

---

### Kata 02 — Toggle Favoris

**Problème** : Une liste de 5 éléments. L'utilisateur peut les marquer/démarquer comme favoris.
Affiche le compteur de favoris en haut.

**Ce que tu dois créer** :
- Une entité `Item` avec `id`, `name`, `isFavorite`
- Un `FavoriteState` avec `List<Item>` et un getter `favoriteCount`
- Un `FavoriteCubit` avec `toggleFavorite(int id)`
- Le widget liste avec icône coeur qui change

**Réflexion** : Comment modifier UN item dans une liste immutable ?

---

### Kata 03 — Formulaire avec validation

**Problème** : Un formulaire avec email + mot de passe.
Validation en temps réel : email valide, mot de passe > 8 caractères.
Le bouton "Connexion" est désactivé tant que le formulaire est invalide.

**Ce que tu dois créer** :
- Un `LoginState` avec `email`, `password`, `isValid`, messages d'erreur par champ
- Un `LoginCubit` avec `updateEmail()`, `updatePassword()`, `submit()`
- La logique de validation (RegExp pour email)
- Le widget formulaire avec `TextFormField`

**Réflexion** : À quel moment valider ? À chaque frappe ? Au submit ? Les deux ?

---

## Niveau 2 — Architecture (UseCase + Repository)

### Kata 04 — Liste avec chargement

**Problème** : Affiche une liste d'articles. Simule un chargement de 2 secondes.
Affiche un loader pendant le chargement, la liste après, ou une erreur si ça échoue.

**Ce que tu dois créer** :
- Une entité `Article` avec `id`, `title`, `content`
- Un `ArticleRepository` (abstract) avec `getArticles()`
- Un `FakeArticleRepository` qui simule un délai avec `Future.delayed`
- Un `GetArticles` usecase
- Les states : `Initial`, `Loading`, `Loaded`, `Error`
- Un `ArticleCubit` qui utilise le usecase
- Le widget avec `BlocBuilder` et les 3 états visuels

**Réflexion** : Pourquoi un repository abstract + une fake implémentation ?

---

### Kata 05 — Système de quota (inspiré MindTarot)

**Problème** : L'utilisateur free a droit à 3 actions par jour. Premium = illimité.
Affiche le compteur restant. Bloque l'action si quota épuisé.

**Ce que tu dois créer** :
- Une entité `UserQuota` avec `tier` (free/premium), `usedToday`, `maxDaily`
- Un `QuotaRepository` avec `getQuota()` et `useQuota()`
- Un `CheckQuotaUseCase` qui retourne `Either<String, bool>`
- Un `UseQuotaUseCase` qui décrémente
- Un `QuotaCubit` qui orchestre le check → action → mise à jour
- Le widget avec bouton d'action + affichage quota

**Réflexion** : Le check du quota se fait dans le widget, le cubit, ou le usecase ? Pourquoi ?

---

### Kata 06 — Filtre et recherche

**Problème** : Une liste de produits avec nom, catégorie, prix.
L'utilisateur peut filtrer par catégorie (dropdown) ET chercher par nom (TextField).
Les deux filtres se combinent.

**Ce que tu dois créer** :
- Une entité `Product` avec `name`, `category`, `price`
- Un `ProductState` avec `allProducts`, `filteredProducts`, `selectedCategory`, `searchQuery`
- Un `ProductCubit` avec `filterByCategory()`, `search()`, `clearFilters()`
- La logique de filtrage combiné (catégorie + recherche en même temps)
- Le widget avec dropdown + search bar + liste filtrée

**Réflexion** : Filtrer dans le Cubit ou créer un usecase `FilterProducts` ?

---

## Niveau 3 — Orchestration (Multi-Cubit + Navigation)

### Kata 07 — Authentification complète

**Problème** : Écran login → si connecté → écran home avec nom.
Bouton déconnexion → retour login. Pas de backend, juste simulé.

**Ce que tu dois créer** :
- Entité `User` avec `id`, `name`, `email`
- `AuthRepository` avec `login()`, `logout()`, `getCurrentUser()`
- `FakeAuthRepository` qui stocke l'état en mémoire
- States : `AuthInitial`, `AuthLoading`, `Authenticated(user)`, `Unauthenticated`
- `AuthCubit` avec `login()`, `logout()`, `checkAuth()`
- Navigation conditionnelle : login si non connecté, home si connecté
- `go_router` avec redirect basé sur l'état auth

**Réflexion** : Comment go_router sait si l'utilisateur est connecté ? Qui décide de la redirection ?

---

### Kata 08 — Multi-étapes (Flow)

**Problème** : Un processus en 3 étapes :
1. Choisir un type (3 options)
2. Remplir un formulaire (titre + description)
3. Confirmation + résumé

Bouton retour à chaque étape. Les données persistent entre les étapes.

**Ce que tu dois créer** :
- Un `FlowState` avec `currentStep`, `selectedType`, `title`, `description`
- Un `FlowCubit` avec `selectType()`, `fillForm()`, `confirm()`, `goBack()`
- 3 widgets distincts pour chaque étape
- Un widget parent qui affiche la bonne étape selon `currentStep`
- Stepper ou indicateur de progression

**Réflexion** : Un seul Cubit pour tout le flow ou un par étape ?

---

### Kata 09 — Communication entre Cubits

**Problème** : Un panier d'achat.
`CartCubit` gère les items. `TotalCubit` affiche le total.
Quand on ajoute un item au panier, le total se met à jour automatiquement.

**Ce que tu dois créer** :
- Entité `CartItem` avec `name`, `price`, `quantity`
- `CartCubit` avec `addItem()`, `removeItem()`, `updateQuantity()`
- `CartState` avec `List<CartItem>`
- `TotalCubit` qui écoute `CartCubit` via `stream.listen`
- Widget panier + widget total séparés
- Le total se recalcule automatiquement

**Réflexion** : `TotalCubit` écoute `CartCubit` — est-ce un bon pattern ou vaut-il mieux un seul Cubit ?

---

## Niveau 4 — Problèmes Réels (inspirés MindTarot)

### Kata 10 — Journal avec pagination

**Problème** : Une liste d'entrées de journal (titre + date + extrait).
Charge 10 items à la fois. Scroll en bas → charge les 10 suivants.
Affiche un loader en bas pendant le chargement.

**Ce que tu dois créer** :
- Entité `JournalEntry` avec `id`, `title`, `date`, `excerpt`
- `JournalRepository` avec `getEntries(page, limit)` qui retourne `Either<Error, List<JournalEntry>>`
- `FakeJournalRepository` avec 50 entrées simulées
- `JournalState` : `entries`, `isLoadingMore`, `hasMore`
- `JournalCubit` avec `loadInitial()`, `loadMore()`
- `ScrollController` qui détecte la fin de scroll
- Le widget liste avec loader en bas

**Réflexion** : Comment gérer `hasMore` ? Cursor pagination vs offset pagination ?

---

### Kata 11 — Système de notification avec actions

**Problème** : Des notifications arrivent (simulées). Chaque notification a un type (info, warning, action).
Les notifications "action" ont un bouton qui déclenche quelque chose.
Badge avec compteur de non-lues.

**Ce que tu dois créer** :
- Entité `AppNotification` avec `id`, `title`, `type`, `isRead`, `actionRoute`
- `NotificationCubit` avec `markAsRead()`, `markAllRead()`, `handleAction()`
- States avec `unreadCount` getter
- Widget liste avec style différent par type
- Badge dans l'AppBar
- Swipe to dismiss ou bouton marquer comme lu

**Réflexion** : Comment structurer les "actions" des notifications ? Callback ? Route ? Event ?

---

### Kata 12 — Thème dynamique + persistance

**Problème** : L'utilisateur choisit entre 3 thèmes (clair, sombre, nature).
Le choix persiste au redémarrage (SharedPreferences).
Tout l'app change instantanément.

**Ce que tu dois créer** :
- `ThemeRepository` avec `getTheme()`, `saveTheme()` (SharedPreferences)
- `ThemeCubit` avec `switchTheme(ThemeType)`
- 3 `ThemeData` personnalisés
- `MaterialApp` qui réagit au state du `ThemeCubit`
- Écran settings avec sélecteur de thème

**Réflexion** : Le `ThemeCubit` va dans `MaterialApp` — comment structurer ça avec `BlocProvider` ?

---

## Comment pratiquer

### Règles d'or

1. **ZÉRO copier-coller** — tout écrire de tête
2. **Réfléchir AVANT de coder** — dessine le flux sur papier si besoin
3. **Commencer par le domain** — entités et logique d'abord, widgets après
4. **Tester manuellement** — lance et vérifie chaque comportement
5. **Refaire les katas ratés** — jusqu'à ce que ce soit fluide

### Progression recommandée

```
Semaine 1 : Katas 01-03 (state management de base)
Semaine 2 : Katas 04-06 (architecture + usecase)
Semaine 3 : Katas 07-09 (orchestration multi-cubit)
Semaine 4 : Katas 10-12 (problèmes réels)
```

### Critères de réussite par kata

- [ ] Le code compile et tourne sans erreur
- [ ] La logique est dans le Cubit/UseCase, PAS dans le widget
- [ ] Les states sont immutables avec Equatable
- [ ] Tu peux expliquer pourquoi chaque fichier existe
- [ ] Tu peux le refaire sans regarder ta solution précédente

---

---

# QUIZZ — Système d'entraînement théorique

## Comment ça marche

Demande-moi un quizz sur n'importe quel sujet ci-dessous :
- `"quizz flutter"` → je te pose des questions Flutter dans le chat
- `"quizz réseau débutant"` → questions réseau niveau débutant
- `"quizz firebase avancé"` → questions Firebase niveau avancé

Chaque quizz :
1. Je pose les questions dans le **chat** — tu réponds en temps réel
2. Je sauvegarde le quizz + tes réponses + corrections dans un fichier `.md`
3. Tu peux relire et réviser plus tard

---

## Catégories disponibles

### 1. Flutter & Dart

| Thème | Exemples de questions |
|-------|----------------------|
| **Widgets** | StatelessWidget vs StatefulWidget ? Quand utiliser `const` ? Qu'est-ce que le BuildContext ? |
| **State Management** | Cubit vs Bloc ? Quand émettre un state ? `BlocBuilder` vs `BlocListener` ? |
| **Navigation** | go_router : comment fonctionne le redirect ? Deep linking c'est quoi ? |
| **Layout** | Column vs ListView ? Pourquoi `Expanded` ? Comment fonctionne `MediaQuery` ? |
| **Lifecycle** | `initState` vs `didChangeDependencies` ? Quand `dispose` est appelé ? |
| **Dart pur** | Null safety, `late`, `final` vs `const`, `async/await`, `Stream`, `Future` |
| **Architecture** | Clean Architecture : rôle de chaque couche ? Pourquoi un UseCase ? |
| **Tests** | Unit test vs widget test ? Comment mocker un repository ? |

### 2. Firebase

| Thème | Exemples de questions |
|-------|----------------------|
| **Firestore** | Document vs Collection ? Requête composée ? Règles de sécurité ? |
| **Auth** | OAuth flow ? Token refresh ? Différence session vs token ? |
| **Cloud Functions** | Trigger vs callable ? Cold start c'est quoi ? |
| **Storage** | Règles d'accès ? Upload sécurisé ? |
| **FCM** | Notification vs data message ? Topic vs token ? |

### 3. Programmation générale

| Thème | Exemples de questions |
|-------|----------------------|
| **POO** | Héritage vs composition ? Polymorphisme ? Interface vs abstract ? |
| **Design Patterns** | Singleton, Observer, Factory, Repository — quand les utiliser ? |
| **SOLID** | Expliquer chaque principe avec un exemple concret |
| **Structures de données** | List vs Set vs Map ? Stack vs Queue ? Complexité O(n) ? |
| **Algorithmes** | Tri, recherche binaire, récursion, Big O notation |
| **Clean Code** | Nommage, fonctions courtes, couplage, cohésion |
| **Git** | Rebase vs merge ? Cherry-pick ? Résoudre un conflit ? |

### 4. Réseau & Web

| Thème | Exemples de questions |
|-------|----------------------|
| **HTTP** | GET vs POST vs PUT vs PATCH ? Status codes (200, 401, 404, 500) ? |
| **REST API** | Principes REST ? Authentification API (Bearer, API Key) ? |
| **DNS** | Comment un nom de domaine est résolu ? |
| **TCP/IP** | Modèle OSI simplifié ? TCP vs UDP ? |
| **WebSocket** | Différence avec HTTP ? Quand l'utiliser ? |
| **CORS** | C'est quoi ? Pourquoi ça bloque ? Comment résoudre ? |
| **SSL/TLS** | HTTPS fonctionne comment ? Certificat c'est quoi ? |

### 5. Systèmes d'exploitation & Infrastructure

| Thème | Exemples de questions |
|-------|----------------------|
| **OS concepts** | Processus vs thread ? RAM vs stockage ? Kernel c'est quoi ? |
| **Linux** | Commandes de base ? Permissions fichiers ? |
| **Conteneurs** | Docker : image vs container ? Pourquoi utiliser Docker ? |
| **CI/CD** | Pipeline c'est quoi ? GitHub Actions : workflow basique ? |
| **Cloud** | SaaS vs PaaS vs IaaS ? Serverless c'est quoi ? |

### 6. Cybersécurité

| Thème | Exemples de questions |
|-------|----------------------|
| **OWASP Top 10** | Injection, XSS, CSRF — c'est quoi et comment se protéger ? |
| **Authentification** | Hashing vs encryption ? Salt c'est quoi ? JWT comment ça marche ? |
| **Mobile Security** | Stocker un token en sécurité ? Certificate pinning ? |
| **Réseau** | Man-in-the-middle ? VPN ? Firewall ? |
| **Bonnes pratiques** | Principe du moindre privilège ? Defense in depth ? |

---

## Niveaux de difficulté

- **Débutant** : définitions, concepts de base, "c'est quoi ?"
- **Intermédiaire** : "comment ça marche ?", "quand utiliser ?", comparaisons
- **Avancé** : scénarios réels, debugging, architecture decisions, trade-offs

---

## Format d'un quizz

Chaque quizz contient **10 questions** :
- 4 questions débutant
- 4 questions intermédiaire
- 2 questions avancé

Types de questions :
- **QCM** — choix multiples (A, B, C, D)
- **Vrai/Faux** — avec justification
- **Question ouverte** — expliquer avec tes mots
- **Scénario** — "tu as ce problème, que fais-tu ?"

---

## Après les katas

Quand les 12 katas sont fluides, tu seras capable de :
- Concevoir une feature complète de A à Z
- Savoir où mettre chaque morceau de logique
- Orchestrer des Cubits ensemble
- Gérer le state proprement
- Revenir sur MindTarot avec confiance

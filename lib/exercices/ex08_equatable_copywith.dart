// ignore_for_file: avoid_print

import 'package:equatable/equatable.dart';

// Equatable : génère == et hashCode automatiquement via props
// copyWith : crée un nouvel objet avec des champs modifiés
// toString : affiche les valeurs quand on fait print()
//
// Avec Freezed, tout ça est généré automatiquement :
// @freezed
// class UserProfile with _$UserProfile {
//   const factory UserProfile({
//     required String name,
//     required int age,
//     required String email,
//   }) = _UserProfile;
// }
// → génère ==, hashCode, copyWith, toString dans un fichier .freezed.dart

class UserProfile extends Equatable {
  final String name;
  final int age;
  final String email;

  const UserProfile(
      {required this.name, required this.age, required this.email});

  // Sans Equatable, il faudrait écrire tout ça manuellement :
  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;
  //   return other is UserProfile &&
  //       other.name == name &&
  //       other.age == age &&
  //       other.email == email;
  // }
  // @override
  // int get hashCode => name.hashCode ^ age.hashCode ^ email.hashCode;

  // Equatable : liste des champs à comparer entre deux objets
  @override
  List<Object?> get props => [name, age, email];

  // copyWith : retourne un NOUVEL objet avec les champs modifiés
  // ?? = si null (pas fourni), garde la valeur actuelle (this.champ)
  UserProfile copyWith({String? name, int? age, String? email}) {
    return UserProfile(
        name: name ?? this.name,
        age: age ?? this.age,
        email: email ?? this.email);
  }

  // toString : appelé automatiquement par print()
  // Sans override, print() affiche juste "UserProfile"
  @override
  String toString() => 'UserProfile(name: $name, age: $age, email: $email)';
}

void main() {
  const user1 = UserProfile(name: 'Dany', age: 33, email: 'test@email.fr');

  final user2 = user1.copyWith(
    name: 'Kiki',
    age: 34,
  );

  print(user1);
  print(user2);
  print(user1 == user2);
}

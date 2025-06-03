
/*
🧠 Description :
Écris une fonction qui vérifie si deux chaînes sont des anagrammes l’une de l’autre.

Deux mots sont des anagrammes s’ils contiennent exactement les mêmes lettres, dans un ordre différent.

Exemple : "listen" et "silent" sont des anagrammes.

*/

bool isAnagram (String str1, String str2) {
  // Convert both strings to lowercase and remove non-letter characters
  String filteredStr1 = str1.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
  String filteredStr2 = str2.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');

  List<String> chars1 = filteredStr1.split('')..sort();
  List<String> chars2 = filteredStr2.split('')..sort();
  return chars1.join() == chars2.join();
}

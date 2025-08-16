// 🧠 Consigne :
// Écris une fonction qui compte combien de mots dans une liste commencent par une lettre donnée (insensible à la casse).

int countWordsStartingWith(List<String> words, String char) {
  int count = 0;
  for (String word in words) {
    if (word.isNotEmpty && word[0].toLowerCase() == char.toLowerCase()) {
      count++;
    }
  }
  return count;
}
void main() {
  List<String> words = ['Apple', 'avion', 'Banane', 'abricot', 'chat'];
  // print(countWordsStartingWith(words, 'a')); // Affiche 3
  countWordsStartingWith(words, 'a'); // Result: 3
}
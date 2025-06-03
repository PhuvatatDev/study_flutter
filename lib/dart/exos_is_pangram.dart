
/*

Écris une fonction qui vérifie si une phrase est un pangramme.
Un pangramme est une phrase contenant toutes les lettres de l’alphabet au moins une fois.

📥 Input : Une String (par exemple : "The quick brown fox jumps over the lazy dog")

📤 Output : Un bool — true si c’est un pangramme, false sinon.

*/

bool isPangram (String input){
  // Convert to lowercase and keep only letters from a to z
  String filteredInput = input.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');

  // Create a set of unique letters
  Set<String> letters = filteredInput.split('').toSet();

  // Check if the set contains 26 different letters
  return letters.length == 26;
}

/*
🧠 Description :
Write a function that groups words by their length.

📥 Input : A List<String> containing words
📤 Output : A Map<int, List<String>>
(key = word length, value = list of words of that length)

*/

Map<int, List<String>> groupWordsByLength(List<String> words) {
  // Create a map to store the result
  Map<int, List<String>> map = {};
  // Loop through the list of words to get the length and use it as the key in the map
  for (var word in words) {
    final length = word.length;
    // If the key does not exist in the map, initialize a new list
    // This prevents an error when adding the word to a non-existent list
    if (map[length] == null) {
      map[length] = [];
    }
    // Add the word to the list corresponding to its length
    map[length]!.add(word);
  }
  return map;
  // Return the map that groups words by their length
}

// Write a function that takes a list of words and returns the word length that appears the most often.

int mostFrequentWordLength(List<String> words) {
  if (words.isEmpty) return 0; // Gère le cas vide

  Map<int, int> frequency = {};
  for (String word in words) {
    int length = word.length;
    frequency[length] = (frequency[length] ?? 0) + 1;
  }

  int mostFrequent = 0;
  int maxCount = 0;

  for (var entry in frequency.entries) {
    if (entry.value > maxCount ||
      (entry.value == maxCount && (entry.key < mostFrequent || maxCount == 0))) {
      mostFrequent = entry.key;
      maxCount = entry.value;
    }
  }
  return mostFrequent;
}

// Write a function that returns the list of common letters between two words,
// without duplicates, sorted alphabetically.

List<String> commonLetter(String str1, String str2) {
  // Convert both strings to lowercase and remove non-letter characters
  String filteredStr1 = str1.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
  String filteredStr2 = str2.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');

  // Use sets to find common letters
  Set<String> set1 = filteredStr1.split('').toSet();
  Set<String> set2 = filteredStr2.split('').toSet();

  // Find the intersection of the two sets
  List<String> common = set1.intersection(set2).toList();

  // Sort the list alphabetically
  common.sort();

  // Return the list of common letters
  return common;
}

/*
🧠 Description :
Tu reçois une liste d’entiers. Calcule la somme des valeurs qui apparaissent une seule fois dans cette liste.

📥 Input : Une List<int> (ex : [1, 2, 3, 2, 4, 3, 5])
📤 Output : Un int (ex : 1 + 4 + 5 = 10)

*/

int sumOfUniqueValues(List<int> numbers) {
  Map<int, int> count = {};

  for (int num in numbers) {
    count[num] = (count[num] ?? 0) + 1;
  }
  Set<int> setUniqueNum = {};

  for (var entry in count.entries) {
    if (entry.value == 1) {
      setUniqueNum.add(entry.key);
    }
  }
  return setUniqueNum.fold(0, (a, b) => a + b);
}

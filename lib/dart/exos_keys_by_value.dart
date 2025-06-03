/*
exos_07_keys_by_value.dart
*/


List <String> keyByValue (Map<String, int> map , int target){

  // creer une liste pour contenir le resultat
  List<String> result = [];
  // creer une boucle pour entrer dans la map 
  // le boucle dois comparer les value avec le int target 
  // add la key correspondent a la value target a la liste result
  for( var entry in map.entries){
    if (entry.value == target){
      result.add(entry.key);
    }
  }
  return result;

}



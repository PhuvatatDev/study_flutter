// Write a function that finds the missing number in a list of consecutive integers.
// Example: [1, 2, 3, 5] → missing number is 4.

int missingNumber(List<int> numbers, int N) {
  
  int expectedSum = N * (N + 1) ~/ 2;
  int actualSum = numbers.reduce((a, b) => a + b);
  return expectedSum - actualSum;
}

void main(){
  List<int> numbers = [1, 2, 4, 5]; // manquant : 3
  // print(missingNumber(numbers, 5));
  missingNumber(numbers, 5); // Result: 3

}
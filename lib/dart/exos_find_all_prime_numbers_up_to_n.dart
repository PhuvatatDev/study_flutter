/*
exos_04_find_all_prime_numbers_up_to_n.dart

*/

bool isPrime(int n) {
  if (n < 2) {
    return false;
  }
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

List<int> allPrime(int N) {
  List<int> primes = [];
  for (int i = 2; i <= N; i++) {
    if (isPrime(i)) {
      primes.add(i);
    }
  }
  return primes;
}

void main() {
  // ignore: avoid_print
  print(allPrime(41)); // [2, 3, 5, 7,......., 41];
}

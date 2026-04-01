// ignore_for_file: avoid_print

class BankAccount {
  final String owner;
  double balance;

  BankAccount({required this.owner, this.balance = 0});

  void deposite(double amount) {
    balance = balance + amount;
  }

  void withdraw(double amount) {
    if (balance >= amount) {
      balance = balance - amount;
    } else {
      print('Solde insuffisant!');
    }
  }

  String summary() {
    return '$owner: $balance';
  }
}

void main() {
  final myAccount = BankAccount(owner: 'phuvatat');
  print(myAccount.summary()); // phuvatat: 0.0€

  myAccount.deposite(100);
  print(myAccount.summary()); // phuvatat: 100.0€

  myAccount.withdraw(30);
  print(myAccount.summary()); // phuvatat: 70.0€

  myAccount.withdraw(200); // refusé, pas assez
  print(myAccount.summary()); // phuvatat: 70.0€
}

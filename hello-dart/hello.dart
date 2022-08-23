import 'dart:io';

void main() {
  stdout.write('Name: ');
  String nome = stdin.readLineSync()!;

  stdout.write('Salary: ');
  double salario = double.parse(stdin.readLineSync()!);

  stdout.write('Age: ');
  var idade = int.parse(stdin.readLineSync()!);

  print('Hello Dart!');
  print(
      'Hi ${nome.toUpperCase()}, you are $idade years old and your salary is R\$ ${salario.toStringAsFixed(2)}');
}

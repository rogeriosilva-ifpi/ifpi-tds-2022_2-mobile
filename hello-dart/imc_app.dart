import 'dart:io';

void main() {
  // 1. Pedir nome (String)
  stdout.write('Name: ');
  var name = stdin.readLineSync()!;

  // 2. Pedir altura(m) (double)
  stdout.write('Height: ');
  var height = double.parse(stdin.readLineSync()!);

  // 3. Pedir peso (kg) (double)
  stdout.write('Weight: ');
  var weight = double.parse(stdin.readLineSync()!);

  // 4. chamar funcao calcular_imc
  double BMI = calculate_BMI(height, weight);

  // 5. exibir o IMC
  print('> $name your BMI is ${BMI.toStringAsFixed(2)}');
}

double calculate_BMI(double height, double weight) {
  var result = weight / (height * height);

  return result;
}

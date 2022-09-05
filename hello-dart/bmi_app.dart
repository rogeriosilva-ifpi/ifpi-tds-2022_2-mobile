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

  String category = calculate_BMI_category(BMI);

  // 5. exibir o IMC
  print('> $name your BMI is ${BMI.toStringAsFixed(2)}');
  print('> $name you are $category');
}

double calculate_BMI(double height, double weight) {
  var result = weight / (height * height);

  return result;
}

String calculate_BMI_category(double BMI) {
  if (BMI < 18.5) {
    return 'UNDERWEIGHT';
  } else if (BMI >= 18.5 && BMI <= 24.9) {
    return 'NORMAL';
  } else if (BMI >= 25 && BMI <= 29.9) {
    return 'OVERWEIGHT';
  } else if (BMI >= 30 && BMI <= 34.9) {
    return 'OBESE';
  } else {
    return 'EXTREMELY OBESE';
  }
}

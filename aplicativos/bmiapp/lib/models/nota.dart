class Nota {
  final String nome;
  final double nota1;
  final double nota2;

  Nota({
    required this.nome,
    required this.nota1,
    required this.nota2,
  });

  double get media {
    return (nota1 + nota2) / 2.0;
  }
}

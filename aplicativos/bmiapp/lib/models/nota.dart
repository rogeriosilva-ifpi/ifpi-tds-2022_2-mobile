class Nota {
  int? id;
  String nome;
  double nota1;
  double nota2;

  Nota({
    this.id,
    required this.nome,
    required this.nota1,
    required this.nota2,
  });

  double get media {
    return (nota1 + nota2) / 2.0;
  }

  Map<String, Object?> toMap() => {
        "id": id,
        "nome": nome,
        "nota1": nota1,
        "nota2": nota2,
      };

  factory Nota.fromMap(Map<String, dynamic> map) {
    return Nota(
      id: map['id'],
      nome: map['nome'],
      nota1: map['nota1'],
      nota2: map['nota2'],
    );
  }
}
class Carro {
  int? id;
  String nome;

  Carro({
    this.id,
    required this.nome,
  });

  // Métodos de Serialização e Deserialização
  Map<String, dynamic> toJson() {
    return {"id": id, "nome": nome};
  }

  factory Carro.fromJson(Map<String, dynamic> json) {
    return Carro(
      id: json['id'],
      nome: json['nome'],
    );
  }
}

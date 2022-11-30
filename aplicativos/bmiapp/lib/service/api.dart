import 'package:bmiapp/models/nota.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  final baseUrl = 'http://localhost:3000/notas';

  // Métodos CRUD

  Future<List<Nota>> getNotas() async {
    Response response = await _dio.get(baseUrl);

    final notas = (response.data as List).map((item) => Nota.fromJson(item));

    return notas.toList();
  }

  Future<Nota?> addNota(Nota nota) async {
    Nota? novaNota;

    try {
      Response response = await _dio.post(baseUrl, data: nota.toJson());

      if (response.statusCode == 201) {
        //ok
      }

      novaNota = Nota.fromJson(response.data);
    } catch (e) {
      print("Erro: $e");
    }

    return novaNota;
  }

  Future<Nota?> updateNota(Nota nota) async {
    Nota? notaAtualizada;

    try {
      Response response =
          await _dio.put("$baseUrl/${nota.id}", data: nota.toJson());

      notaAtualizada = Nota.fromJson(response.data);
    } catch (e) {
      print("Erro: $e");
    }

    return notaAtualizada;
  }

  Future<Nota?> deleteNota(int id) async {
    try {
      await _dio.delete("$baseUrl/$id");
    } catch (e) {
      print("Erro: $e");
    }
  }
}

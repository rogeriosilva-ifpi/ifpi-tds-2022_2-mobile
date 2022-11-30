import 'package:bmiapp/models/carro.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _client = Dio();

  final baseURL = 'http://localhost:3000';

  Future<List<Carro>> obterCarros() async {
    final response = await _client.get<List>('$baseURL/carros');

    List<Carro> carros = [];

    if (response.statusCode == 200) {
      carros = response.data!.map((item) => Carro.fromJson(item)).toList();
    }

    return carros;
  }
}

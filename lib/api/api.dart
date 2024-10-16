import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'models/rhymes.dart';

class RhymesApiClient {
  Future<Rhymes> getRhymesList({required String word}) async {
    final apiUrl = dotenv.env['API_URL'];
    final apiKey = dotenv.env['API_KEY'];

    var headers = {'X-Api-Key': apiKey};
    var response = await Dio().request(
      '$apiUrl/rhyme?word=$word',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      List<String> rhymesList = (response.data as List)
          .map(
            (item) => item as String,
          )
          .toList();

      return Rhymes(words: rhymesList);
    } else {
      return const Rhymes(words: []);
    }
  }
}

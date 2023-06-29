import 'dart:convert';
import 'package:http/http.dart' as http;

Future<T> genericApiCall<T>(String url, String method, dynamic body) async {
  var responseJson;

  try {
    var headers = {'Content-Type': 'application/json'};
    var response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      responseJson = json.decode(response.body);
      // You can parse the responseJson to a specific model/class if needed
      return responseJson as T;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  } catch (exception) {
    throw Exception('Error: $exception');
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(Uri.parse(this.url));
    if (response.statusCode == 200) {
      String data = response.body;
      //print(data);
      var decoded = jsonDecode(data);
      return decoded;
    }
    else {
      print(response.statusCode);
    }
  }
}
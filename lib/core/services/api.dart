import "dart:convert";

import "package:http/http.dart" as http;

class Api {
  postRequest(String link, Map data) async {
    var response = await http.post(Uri.parse(link), body: data);
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      return responsebody;
    } else {
      print("Error${response.statusCode}");
    }
  }
  multiPostRequest(String link, Map data) async {
    var response = await http.post(Uri.parse(link), body: data);
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      return responsebody;
    } else {
      print("Error${response.statusCode}");
    }
  }
}

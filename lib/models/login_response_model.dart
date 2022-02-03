import 'package:http/http.dart' as http;
import 'dart:convert'; // json.decode 함수를 사용하기 위함

// API 서버와의 통신을 통해 받아오는 token을 class형으로 바꾸기 위한 선언

class LoginResponse {
  final String id;
  final String pw;
  LoginResponse({required this.id, required this.pw});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(id: json['id'], pw: json['id']);
  }
}

// http post로 ID 와 PW를 API server로 전송하고, Response을 받아오는 작업을 수행하는 함수
Future<LoginResponse> postRequest(String id, String pw) async {
  final response = await http.post(
    Uri.parse('http://0.0.0.0:8000/login/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id': id,
      'pw': pw,
    }),
  );
  print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

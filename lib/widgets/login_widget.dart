import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_route/models/login_response_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  final idController = TextEditingController();
  final pwController = TextEditingController();

  static const secureStorage = FlutterSecureStorage();

  Future<LoginResponse>? loginResponse;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Center(
        child: (loginResponse == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        const Text("APP LOGIN"),
        const SizedBox(height: 4.0), // 요소간 간격 조정용
        TextField(
          controller: idController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'ID',
          ),
        ),
        const SizedBox(height: 4.0),
        TextField(
          controller: pwController,
          obscureText: true, // 비밀번호 입력시 마지막 커서를 제외한 나머지를 검은 점으로
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'PW',
          ),
        ),
        const SizedBox(height: 4.0),
        ElevatedButton(
          onPressed: () {
            setState(() {
              loginResponse = postRequest(idController.text, pwController.text);
            });
          },
          child: const Text("LOGIN"),
        ),
      ],
    );
  }

  FutureBuilder<LoginResponse> buildFutureBuilder() {
    return FutureBuilder<LoginResponse>(
      future: loginResponse,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          setState(() async {
            await secureStorage.write(
                key: 'access token', value: snapshot.data!.id);
          });
          return Text(snapshot.data!.id);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

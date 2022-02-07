import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_route/models/login_response_model.dart';
import 'package:login_route/models/probider_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  static const secureStorage = FlutterSecureStorage();
  Future<LoginResponse>? loginResponse;
  var localLoginState = false;

  // login stage
  Column buildColumn() {
    final idController = TextEditingController();
    final pwController = TextEditingController();
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
              debugPrint("${loginResponse}");
            });
          },
          child: const Text("LOGIN"),
        ),
      ],
    );
  }

  // login 이후 결과창 출력 stage
  FutureBuilder<LoginResponse> buildFutureBuilder() {
    return FutureBuilder<LoginResponse>(
      future: loginResponse,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          setState(() async {
            // // secure storage에 값 저장
            // await secureStorage.write(
            //     key: 'access token', value: snapshot.data!.id);
          });
          return Text(snapshot.data!.token);
        } else if (snapshot.hasError) {
          context.read<myLogin>().changeLogin();
          debugPrint(
              "login page provider : ${context.watch<myLogin>().loginState}");
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () => Navigator.pushNamed(context, '/'),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Center(
            child:
                (loginResponse == null) ? buildColumn() : buildFutureBuilder(),
          ),
        ),
      ),
    );
  }
}

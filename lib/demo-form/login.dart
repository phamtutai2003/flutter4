import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Đây là nơi xử lý đăng nhập. Bạn có thể kiểm tra username và password ở đây.
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Ví dụ kiểm tra đơn giản
    if (username == "your_username" && password == "your_password") {
      // Đăng nhập thành công, thực hiện các hành động cần thiết ở đây.
      print("Đăng nhập thành công");
    } else {
      // Đăng nhập không thành công, hiển thị thông báo lỗi hoặc thực hiện xử lý khác.
      print("Đăng nhập không thành công");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng nhập"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Tên đăng nhập",
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true, // Ẩn mật khẩu
              decoration: InputDecoration(
                labelText: "Mật khẩu",
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _login,
              child: Text("Đăng nhập"),
            ),
          ],
        ),
      ),
    );
  }
}

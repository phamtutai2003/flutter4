import 'package:flutter/material.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Login App',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:Text('Login'),
      ),
      body: Padding(
        padding:EdgeInsets.all(16.0),
        child: Form(
          key:_formKey,
          child:Column(
            children:<Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value){
                  _email = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator:  (value){
                  if (value!.isEmpty){
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value){
                  _password = value!;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(onPressed: _submit,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit (){
    if (_formKey.currentState!.validate()){
      _formKey.currentState!.save();
    }
  }
}
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 120,
        ),
      SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            "Login",
            style:
            TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
          ),
          Text("Get started with your account"),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: TextFormField(
              validator: (value) =>
              value!.isEmpty ? "Email cannot be empty." : null,
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
              ),
            )),
        ],
      ),
    ),
    SizedBox(
      height: 10,
    ),
    SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: TextFormField(
        validator: (value) => value!.length < 8
        ? "Password should have at least 8 characters."
        : null,
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Password")
        ),
      )),
      SizedBox(
        height: 10,
      ),
      Row( mainAxisAlignment: MainAxisAlignment.end,children: [
        TextButton(onPressed: (){

        }, child: Text("Forget Password")),
      ],),
      SizedBox(
        height:10,
      ),
      SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width * .9,
        child: ElevatedButton(
          onPressed: (){

          },
          child: Text(
            "Login",
            style: TextStyle(fontSize: 16),
          ))),
          SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Dont have and account?"),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/signup");
                },
                child: Text("Sign Up"))              
            ],
          )
    ],),
    );
  }
}


import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
            "Sign Up",
            style:
            TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
          ),
          Text("Create a new account and get started"),
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
      
      SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width * .9,
        child: ElevatedButton(
          onPressed: (){

          },
          child: Text(
            "Sign Up",
            style: TextStyle(fontSize: 16),
          ))),
          SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have and account?"),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Login"))              
            ],
          )
    ],),
    );
  }
}
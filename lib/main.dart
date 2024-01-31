//import 'package:flutter/cupertino.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:second_task/show_data.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: LoginScreen()),
      title: 'Login Screen',
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final _usercontroller = TextEditingController(text: 'sam23@gmail.com');
  final _passwordcontroller = TextEditingController(text: 'sam12345');


  void _showSnackbar(BuildContext context,String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.white,
    ));
  }

  static String? validateUsername(final String uname) {
    String? msg;
    if (uname.isEmpty)
      {msg= "please enter username";}
  /*  else if (uname != 'sam23@gmail.com')
      msg= "wrong username";
    else
      msg="valid username";*/
    return msg;
  }

  static String? validatePassword(String pass) {

    String? msg;
    if (pass.isEmpty){
      msg="please enter password";
    }
    return msg;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          /*appBar: AppBar(
              title: Center(
                child: Text("App For Showing Weather Info",
                    style: TextStyle(
                      fontSize: 22,
                      // shadows: [Shadow(color: Colors.white,
                      //     offset: Offset(2, 1),
                      //     blurRadius: 15.0
                      // )]
                    )),
              ),
            ),*/

          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/login_page.jpg"),
            fit: BoxFit.fill,
          )),
          height: MediaQuery.of(context).size.height / 1,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: TextFormField(
                    key: const Key('username'),
                    controller: _usercontroller,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.account_box, color: Colors.white),
                        hintText: 'Username',
                        hintStyle: TextStyle(fontSize: 19.0, color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))
                        ),
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                    validator: (value)=> validateUsername(value!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
                  child: TextFormField(
                    key: const Key('password'),
                    controller: _passwordcontroller,
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                    decoration: const InputDecoration(
                        icon: Icon(Icons.lock, color: Colors.white),
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: 19.0, color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))
                        ),
                    obscureText: true,

                    validator:(value)=>validatePassword(value!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: ElevatedButton(
                      key: const Key('log in'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.withOpacity(0.50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          )),
                      onPressed: () {

                       /* Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const ShowData()));*/

                          if(formKey.currentState!.validate() && _usercontroller.text=='sam23@gmail.com' && _passwordcontroller.text=='sam12345'){

                              _showSnackbar(context,"login successful");
                              Timer(const Duration(seconds: 1),() async {
                               await Navigator.push(context, MaterialPageRoute(builder: (
                                    context) =>const ShowData()));
                              }
                              );
                          }
                          else{
                            _showSnackbar(context, 'please enter valid username and password');
                          }

                          /*if(_usercontroller == 'sam23@gmail.com' && _passwordcontroller== 'sam12345') {
                            _showSnackbar(context,"login successful");


                          }*/

                      },
                      child: const Text('Log In', style: TextStyle(fontSize: 23)),


                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

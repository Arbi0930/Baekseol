import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lapp/Home_page.dart';
import 'package:lapp/api/index.dart';
import 'package:lapp/jolooch_home.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final _LoginName = TextEditingController();
  final _LoginPass = TextEditingController();
  AjiltanEnum ajiltan = AjiltanEnum.Borluulagch;
  String Radvalue = "1";
  void OnSubmit() {
    if (_formkey.currentState!.validate()) {
      final api = ApiService();
      final data = api.getRequest('');
      print(data);
      if (ajiltan == AjiltanEnum.Borluulagch) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => JoloochPage()));
      }
    }
  }

  void _onHttpRequest() async {
    final api = ApiService();
    final data = api.getRequest('');
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.jpg'), fit: BoxFit.fitWidth),
        ),
        child: SafeArea(
          child: Form(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('images/baekseol.png'),
                              height: 254,
                              width: 253,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 100.0),
                            child: Radio(
                              value: AjiltanEnum.Borluulagch,
                              groupValue: ajiltan,
                              onChanged: ((value) {
                                if (value != null)
                                  setState(() {
                                    ajiltan = value;
                                  });
                              }),
                            ),
                          ),
                          Text(
                            "Борлуулагч",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 100.0),
                            child: Radio(
                                value: AjiltanEnum.Hurgegch,
                                groupValue: ajiltan,
                                onChanged: ((value) {
                                  if (value != null)
                                    setState(() {
                                      ajiltan = value;
                                    });
                                })),
                          ),
                          Text(
                            "Жолооч",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: _LoginName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Хоосон байж болохгүй";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: "Нэвтрэх нэр",
                                  labelStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: _LoginPass,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Хоосон байж болохгүй";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "Нууц үг",
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 112),
                        child: Container(
                          padding: EdgeInsets.all(12),

                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          // child: SizedBox(
                          //   width: 177,
                          //   height: 54,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                elevation: MaterialStateProperty.all(0)),
                            onPressed: OnSubmit,
                            child: Text(
                              "Нэвтрэх",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: 150,
                      ),
                    ], //Column Children
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum AjiltanEnum {
  Borluulagch,
  Hurgegch;
}

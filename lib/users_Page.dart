import 'package:flutter/material.dart';
import 'package:lapp/Home_page.dart';
import 'package:http/http.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _UserFormKey = GlobalKey<FormState>();
  void _checkButton() {
    if (_UserFormKey.currentState!.validate()) {}
  }

  void _registerButton() {
    if (_UserFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Амжилттай Бүртгэлээ"),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
    ;
  }

  void _logOutButton() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Text(
              'Бат',
              style: TextStyle(
                backgroundColor: Color(0xffCbebf9),
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: true,
        toolbarHeight: 90,
        backgroundColor: Color(0xffCBEBF9),
        actions: [
          Image(
            image: AssetImage('images/baekseol.png'),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/back1.jpg'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Form(
              key: _UserFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Хэрэглэгч бүртгэх",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Утасны дугаар хоосон байна";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text("Утасны дугаар"),
                                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                keyboardType: TextInputType.number,
                                maxLength: 8,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: SizedBox(
                            width: 145,
                            height: 77,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.redAccent), color: Color(0xffB0ECFF), borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Color(0xffB0ECFF)),
                                    foregroundColor: MaterialStateProperty.all(Colors.black),
                                    elevation: MaterialStateProperty.all<double>(0),
                                  ),
                                  onPressed: _checkButton,
                                  child: Text(
                                    "Шалгах",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration:
                            BoxDecoration(color: Colors.white, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Хэрэглэгчийн нэр хоосон байна";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              label: Text("Хэрэглэгчийн нэр"),
                              labelStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration:
                            BoxDecoration(color: Colors.white, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Хэрэглэгчийн мэйл хаяг хоосон байна";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              label: Text("Хэрэглэгчийн мэйл хаяг"),
                              labelStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration:
                            BoxDecoration(color: Colors.white, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Хэрэглэгчийн гэрийн хаяг хоосон байна";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text("Хэрэглэгчийн гэрийн хаяг"),
                            labelStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 60, right: 60, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(0),
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: _registerButton,
                          child: Text(
                            "Бүртгэх",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

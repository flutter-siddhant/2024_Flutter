//import 'package:basictodolist/todoList.dart';
import 'package:flutter/material.dart';
import 'information.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State createState() => _LoginState();
}

class _LoginState extends State {
  int userInfoIsCorrect = 0;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool loginInfoIsCorrect() {
    if (_formKey.currentState!.validate()) {
      if (UserInfo.getObject()
              .isUserpresent(username: usernameController.text) &&
          (UserInfo.getObject()
                  .getPassword(username: usernameController.text) ==
              passwordController.text)) {
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color.fromARGB(255, 255, 127, 118),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Username or password is wrong !",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ],
            ),
          ),
        );
      }
    }
    return false;
  }

  void login() {
    if (loginInfoIsCorrect()) {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 150),
          pageBuilder: (context, animation, _) {
            return FadeTransition(
              opacity: animation,
              //child: const ToDOList(),
            );
          },
        ),
      );
    }
  }

  void createNewAccount() {
    usernameController.clear();
    passwordController.clear();
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, _) {
          return FadeTransition(
            opacity: animation,
            child: const NewAccount(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Stack(children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset(
                "assets/images/background4.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 5.0,
                  ),
                  Image.asset(
                    "assets/images/user.png",
                    height: 160,
                    width: 160,
                  ),
                  const Text(
                    'Hello Again !',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: "SF UI Text",
                      letterSpacing: 0.4,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Text(
                    "Welcome back you have\n          been missed!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "SF UI Text",
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter username ';
                                }
                                return null;
                              },
                              controller: usernameController,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10.0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 19, 182, 188),
                                          width: 1.5)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: const BorderSide(
                                          color: Colors.black12)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide(
                                          color: Colors.red.shade800)),
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    //color: Colors.orange,
                                  ),
                                  labelText: 'Username',
                                  labelStyle: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromRGBO(0, 0, 0, 0.6)),
                                  fillColor:
                                      const Color.fromARGB(255, 231, 233, 238),
                                  filled: true),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password ';
                                }
                                return null;
                              },
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 13.0, horizontal: 10.0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 2, 167, 172),
                                          width: 1.5)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 80, 78, 78))),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide(
                                          color: Colors.red.shade800)),
                                  prefixIcon: const Icon(Icons.key),
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromRGBO(0, 0, 0, 0.6)),
                                  fillColor:
                                      const Color.fromARGB(255, 231, 233, 238),
                                  filled: true),
                            ),
                          )
                        ],
                      )),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const SizedBox(
                      width: 150,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(),
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                          letterSpacing: (0.5),
                          color: Color.fromARGB(221, 27, 27, 27),
                          fontSize: 15,
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      width: 300,
                      height: 43,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 0,
                            blurRadius: 14,
                            offset: const Offset(2, 8))
                      ]),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 2, 167, 172),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: login,
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      )),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.5,
                        width: 100,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(13, 103, 102, 102),
                              Color.fromARGB(85, 103, 102, 102),
                              Color.fromARGB(150, 87, 86, 86),
                              Color.fromARGB(234, 41, 41, 41),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Or login with",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        height: 1.5,
                        width: 100,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(234, 41, 41, 41),
                              Color.fromARGB(150, 87, 86, 86),
                              Color.fromARGB(85, 103, 102, 102),
                              Color.fromARGB(13, 103, 102, 102),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {/*logic aplye karaych ahe*/},
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                            height: 45,
                            width: 45,
                            child: Image.asset(
                              "assets/images/googlelogo.png",
                              //"assets/images/googlelogo.png",
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            height: 45,
                            width: 45,
                            child: Image.asset(
                              "assets/images/facebook.png",
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          height: 42,
                          width: 42,
                          child: Image.asset(
                            "assets/images/linkdin2.png",
                            height: 18,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "   Don't have an account?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        onPressed: createNewAccount,
                        style: const ButtonStyle(),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 167, 177),
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
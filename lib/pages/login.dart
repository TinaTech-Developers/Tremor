import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class Login extends StatefulWidget {
  final VoidCallback showRegisterPage;
  Login({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _passwordVisible = false;
  }

  bool _passwordVisible = true;
// email validation
  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid email address';
    else {
      return null;
    }
  }

//password validation
  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: CupertinoColors.black,
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
              image: AssetImage('assets/technology-background.jpg')),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Tremor-Admin Panel")),
          ),
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            Container(
                padding: EdgeInsets.only(left: 35, top: 60),
                child: Text(
                  "Welcome\nBack",
                  style: TextStyle(color: Colors.white, fontSize: 33),
                )),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.3,
                    right: 35,
                    left: 35),
                child: Column(children: [
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: TextFormField(
                      validator: (value) => validateEmail(value),
                      controller: _emailController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    // obscureText: true,
                    obscureText: !_passwordVisible,
                    validator: Validators.compose([
                      Validators.required('Password is required'),
                      Validators.patternString(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                          'Invalid Password')
                    ]),
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                  SizedBox(height: 30),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                          onTap: signIn,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.arrow_forward),
                          ),
                        )
                      ]),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Not a member?",
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                            ),
                          )),
                      GestureDetector(
                          onTap: widget.showRegisterPage,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                              color: Colors.blue,
                            ),
                          )),
                    ],
                  )
                ]),
              ),
            ),
          ]),
        ));
  }
}

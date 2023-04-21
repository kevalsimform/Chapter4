import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/signup_button.dart';
import '../constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

///
///ONE TEXT FIELD IS VALIDATED WITH TEXTFIELDCONTROLLER AND
///ANOTHER IS VALIDATED WITH TEXTFORMFIELD
///

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  bool showPassword = true;
  bool? validate = null;

  TextEditingController controller = TextEditingController();

  void _validate() {
    setState(() {
      if (controller.text != null) {
        validate = controller.text.length >= 8 ? true : false;
      } else {
        validate = false;
      }
    });
  }

  bool isEnabled() {
    if (email != null && controller.text != null) {
      return email!.contains('@') && controller.text!.length >= 8;
    }
    return false;
  }

  String? _errorText() {
    if (validate == null) {
      return null;
    } else {
      if (validate == true) {
        return null;
      } else {
        return 'Password must be 8 letter long';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15, top: height * 0.12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          logoPath,
                          height: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Leafboard', style: titleStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 25, letterSpacing: .1)),
                      ],
                    ),
                  ),
                  Text('Work without limits', style: subTitleStyle),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20, bottom: 0),
                    child: Text(
                      'Your email address',
                      style: subTitleStyle.copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.1),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      child: TextFormField(
                        autofocus: true,
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 15),
                        decoration: inputDecoration.copyWith(
                          errorText: _errorText(),
                          errorStyle: TextStyle(fontSize: 18),
                          hintText: 'abcdef@email.com',
                          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          email = value;
                        },
                        validator: (value) {
                          return (value != null && value.contains('@')) ? null : 'Invalid Email';
                        },
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20, bottom: 0),
                    child: Text(
                      'Choose a password',
                      style: subTitleStyle.copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.1),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      child: TextField(
                        controller: controller,
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 15),
                        obscureText: showPassword,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        decoration: inputDecoration.copyWith(
                          hintText: 'min. 8 characters',
                          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                          errorText: _errorText(),
                          errorStyle: TextStyle(fontSize: 18),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              child: Icon(
                                showPassword ? CupertinoIcons.eye_slash : Icons.remove_red_eye_outlined,
                                color: Colors.grey,
                                size: 20,
                              )),
                        ),
                        onChanged: (value) {
                          setState(() {
                            isEnabled();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
                child: ActionButton(
                  onTap: () {
                    setState(() {
                      _validate();
                    });
                    if (_formKey.currentState!.validate()) {}
                  },
                  isEnabled: isEnabled(),
                  isBigger: true,
                  title: 'Continue',
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      color: Colors.grey.shade100,
                      height: 1,
                    ),
                  ),
                  Container(
                    width: 50,
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      'or',
                      style: TextStyle(color: Colors.grey, fontFamily: 'Roboto', fontSize: 15),
                    )),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 10),
                    child: SignUpButton(
                      path: googleLogoPath,
                      title: 'Sign up with Google',
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 30),
                    child: SignUpButton(
                      path: appleLogoPath,
                      title: 'Sign up with Apple',
                      onTap: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

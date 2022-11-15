import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rail_food/Screens/Auth/SignUp.dart';
import 'package:rail_food/Screens/AppAfterLogin.dart';
import 'package:rail_food/utilities.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailcontroller = new TextEditingController();
  final passwordcontroller = new TextEditingController();
  bool circular= false;


  final _auth = FirebaseAuth.instance;


  @override
  void dispose(){
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: Column(
              children: [

                SizedBox(height: size.height * 5/100,),

                Center(child: Image.asset('images/login.png',),),

                SizedBox(height: size.height * 6/100,),

                //login text
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('LOGIN',
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'font',
                        color: Colors.white,
                        fontSize: 35,
                      ),),
                    ),
                  ],
                ),

                SizedBox(height: size.height * 8/100,),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Column(
                    children: [

                       //email field
                        TextformfieldSignup(emailcontroller, Icons.mail, 'Email', false,
                              (email) =>
                          email !=null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null,
                        ),


                        SizedBox(height: size.height * 3/100,),


                        //password field
                       TextformfieldSignup(passwordcontroller, Icons.vpn_key, 'Password', true, (value) =>
                         value !=null && value.length <8
                             ? 'Enter min 8 characters'
                             : null,
                       ),


                      SizedBox(height: size.height * 5/100,),

                  //Login button
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            // color: Colors.lightBlue,
                              gradient: const LinearGradient(
                                colors: [
                                Color(0xfffd746c),
                                Color(0xffff9068),
                                Color(0xfffd746c),
                              ],
                            ),
                          ),

                            child: MaterialButton(
                            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                              minWidth: MediaQuery.of(context).size.width,
                            onPressed: () {
                              setState(() {
                                circular = true;
                              });

                            FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: emailcontroller.text, password: passwordcontroller.text).then((value) {
                                  Fluttertoast.showToast(msg: "Login Successful");
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AppAfterLogin()));
                                setState(() {
                                  circular = false;
                                });
                            }).catchError((e)
                            {
                              Fluttertoast.showToast(msg: e!.message);
                              setState(() {
                                circular = false;
                              });
                            });
                          },

                            child: circular
                                ? CircularProgressIndicator()
                                : const Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'font',
                                fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),


                    ],
                  ),
                ),

                SizedBox(height: size.height * 1/100,),

                //signup button
                endstatement("Don't have and account?  ", 'Sign Up',
                      () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp(),),);
                  }
                ),


              ],
            ),
        ),
    );
  }
}

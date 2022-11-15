import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rail_food/Screens/Auth/LoginScreen.dart';
import '../../utilities.dart';
import '../AppAfterLogin.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;

  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  bool circular = false;


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black87,
        body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: size.height * 6/100,),

            //main image
            Padding(
              padding: const EdgeInsets.only(left: 60.0, right: 60.0),
              child: Center(child: Image.asset('images/signup.png',),),
            ),

            SizedBox(height: size.height * 3/100,),

            //signup text
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text('SIGN UP',
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

            SizedBox(height: size.height * 2.5/100,),

            //all fields
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [


                  //first name
                  TextformfieldSignup(firstNameEditingController, Icons.account_circle,
                      'First Name', false, (value) =>
                    value == null
                        ? 'Enter a valid name'
                        : null,
                  ),


                  SizedBox(height: size.height * 2/100,),



                  //second name
                  TextformfieldSignup(secondNameEditingController, Icons.account_circle,
                      'Second Name', false, (value) =>
                    value == null
                        ? 'Enter a valid last name'
                        : null,
                  ),



                  SizedBox(height: size.height * 2/100,),




                  //email
                  TextformfieldSignup(emailEditingController, Icons.mail,
                      'Email', false, (email) =>
                    email !=null && !EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null,
                  ),



                  SizedBox(height: size.height * 2/100,),




                  //password field
                  TextformfieldSignup(passwordEditingController, Icons.vpn_key,
                      'Password', true, (value) =>
                    value !=null && value.length <8
                        ? 'Enter min 8 characters'
                        : null,
                  ),



                  SizedBox(height: size.height * 2/100,),

                  //confirm password
                  TextformfieldSignup(confirmPasswordEditingController, Icons.vpn_key,
                      'Confirm Password', true, (value) =>
                    value !=null && passwordEditingController.text != confirmPasswordEditingController.text
                        ? 'Password do not match'
                        : null,
                  ),


                ],
              ),
            ),


            //signup button
          Padding(
            padding: const EdgeInsets.fromLTRB(30,30,30,0),
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
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailEditingController.text,
                      password: passwordEditingController.text).then((value) {
                    Fluttertoast.showToast(msg: "Sign Up Successful");
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AppAfterLogin()));
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
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'font',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),




            SizedBox(height: size.height * 2.5/100,),


            //back to login
            endstatement('Already have an account?  ', 'Log In',
                    () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen(),),);
              }
            ),


          ],
        )


      ),
    );
  }
}


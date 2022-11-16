import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//text form box for signup and login page for
Widget TextformfieldSignup(
    controller, icon, labeltext, bool obscure, validation) {
  return TextFormField(
    controller: controller,
    obscureText: obscure,
    textInputAction: TextInputAction.next,
    style: const TextStyle(
      fontFamily: 'font',
      color: Colors.white,
    ),
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: validation,
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      labelText: labeltext,
      labelStyle: const TextStyle(
        fontFamily: 'font',
        color: Colors.white,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.amber,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white70,
        ),
      ),
    ),
  );
}

//ending statement of already have an acc or create a new acc
Widget endstatement(String text1, String text2, ontap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text1,
        style: const TextStyle(color: Colors.white, fontFamily: 'font'),
      ),
      GestureDetector(
        onTap: ontap,
        child: Text(
          text2,
          style: const TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
            fontFamily: 'font',
            fontSize: 15,
          ),
        ),
      ),
    ],
  );
}

//menu of Accounts page except logout option
Widget Accountfeatures(BuildContext context, text, page) {
  return TextButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    },
    style: TextButton.styleFrom(
      foregroundColor: Colors.grey,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
              fontFamily: 'font', fontSize: 15, color: Colors.black),
        ),
        const Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.black54,
        ),
      ],
    ),
  );
}

//text form for profile information
Widget TextformProfile(initialvalue, labeltext) {
  return TextFormField(
    // controller: controller,
    initialValue: initialvalue,
    textInputAction: TextInputAction.next,
    style: const TextStyle(
      fontFamily: 'font',
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),

    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(15, 10, 20, 10),
      labelText: labeltext,
      labelStyle: const TextStyle(
        fontFamily: 'font',
        color: Colors.black54,
        fontSize: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.amber,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
    ),
  );
}

Future addUserDetails(
    String firstName, String secondName, String email, int phoneNumber) async {
  await FirebaseFirestore.instance.collection('user').add({
    'first name': firstName,
    'second name': secondName,
    'email': email,
    'phone number': phoneNumber
  });
}

Widget Searchbar(controller, TextInputType, text, ) {
  return Container(
    margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.grey,
      ),
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.deepOrange[300],
              controller: controller,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType,
              style: const TextStyle(
                fontFamily: 'font',
                color: Colors.white,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                hintText: text,
                hintStyle: const TextStyle(
                  fontFamily: 'font',
                  fontSize: 15,
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: TextButton(
              onPressed: (){},
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
              ),
              child: Container(
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.deepOrange[300],
                ),
                child: const Center(
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontFamily: 'font',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
}

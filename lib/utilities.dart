import 'package:flutter/material.dart';

//text form box for signup and login page for
Widget TextformfieldSignup(controller, icon,  labeltext, bool obscure, validation){
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
      prefixIcon: Icon(icon, color: Colors.white,),
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
Widget endstatement(String text1, String text2, ontap){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text1,
        style: const TextStyle(color: Colors.white,fontFamily: 'font'),
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
Widget Accountfeatures(BuildContext context, text, page){

  return TextButton(
    onPressed: (){
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => page,),);
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
              fontFamily: 'font',
              fontSize: 15,
              color: Colors.black
          ),
        ),
        Icon(Icons.arrow_forward_ios_outlined,color: Colors.black54,),
      ],
    ),
  );
}




//text form for profile information
Widget TextformProfile(initialvalue, labeltext){
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
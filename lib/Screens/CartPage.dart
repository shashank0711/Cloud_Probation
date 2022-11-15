import 'package:flutter/material.dart';
import 'package:rail_food/Screens/AppAfterLogin.dart';
import 'package:rail_food/Screens/HomePage.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 1 / 100,
              ),

              //My Cart text
              const Text(
                'My Cart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'font',
                  color: Colors.black87,
                  fontSize: 25,
                ),
              ),

              SizedBox(
                height: size.height * 20 / 100,
              ),

              Column(
                children: [
                  Center(
                      child: Image.asset(
                    'images/cart_image.png',
                    scale: 5,
                  )),

                  SizedBox(height: size.height * .05,),

                  //cart empty text
                  const Text(
                    'Your Cart is empty.!',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black26,
                      fontFamily: 'font',
                    ),
                  ),

                  SizedBox(height: size.height * .09,),

                  TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => AppAfterLogin(),),);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                    ),
                    child: Container(
                      height: 46,
                      width: 155,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.black12,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Home Page',
                        style: TextStyle(
                           fontFamily: 'font',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

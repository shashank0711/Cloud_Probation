import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: const Text(
            'Orders',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'font',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
             Center(child: Image.asset('images/no_order.png',scale: 2.7,)),

             SizedBox(height: size.height * 5/100,),

              const Text("You haven't placed any order yet.!",
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'font',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: size.height * 1.5/100,),

            const Text("Place an order now and it will show up here",
              style: TextStyle(
                fontSize: 12.5,
                fontFamily: 'font',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),



          ],
        ),
      ),
    );
  }
}

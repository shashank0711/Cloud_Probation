import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TabController _tabcontroller = new TabController(length: 3, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //main image
              Container(
                height: size.height * 32 / 100,
                child: Stack(
                  children: [
                    Image.asset('images/main_image.jpg'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * 44 / 100,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Get your favourite\n\nfood delivered at\n\nyour train seat',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'font',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),


              SizedBox(height: size.height*1/100,),


            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rail_food/utilities.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final pnrController = TextEditingController();
  final trainNumberController = TextEditingController();
  final stationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TabController _tabcontroller = TabController(length: 3, vsync: this);

    return DefaultTabController(
        length: 3,
        child: Scaffold(
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

                  //nav bar
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TabBar(
                          indicator: BoxDecoration(
                              color: Colors.deepOrange[300],
                              borderRadius: BorderRadius.circular(25)),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black87,
                          tabs: const [
                            Tab(
                              child: Text(
                                'PNR',
                                style: TextStyle(
                                  fontFamily: 'font',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'TRAIN NO.',
                                style: TextStyle(
                                  fontFamily: 'font',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'STATION',
                                style: TextStyle(
                                  fontFamily: 'font',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //search bars
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
                    child: SizedBox(
                      height: 80,
                      child: TabBarView(
                        children: [
                          SearchbarforPNRandTrain(pnrController, 'Enter PNR Number', 10),
                          SearchbarforPNRandTrain(trainNumberController, 'Enter Train Number', 5),
                          Searchbarforstation(stationController, 'Enter Station Name'),
                        ],
                      ),
                    ),
                  ),
                  

                  SizedBox(height: size.height*4/100,),

                   //text
                   const Padding(
                     padding: EdgeInsets.all(10.0),
                     child: Text('Order food on train with easy steps :-',
                  style: TextStyle(
                        fontSize: 24,
                      fontFamily: 'font',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      ),
                     ),
                   ),

                  SizedBox(height: size.height* 2/100,),

                  //steps
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset('images/Enter.png', scale: 2,),
                            SizedBox(height: size.height * 1/100,),
                            const Text('Enter Train/\nPNR number',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'font',
                                fontSize: 10,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),


                        Column(
                          children: [
                            Image.asset('images/Select.png', scale: 2.2,),
                            SizedBox(height: size.height * 1/100,),
                            const Text('Choose\nRestaurant',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'font',
                                fontSize: 10,
                                fontWeight: FontWeight.bold
                              ),
                            ),

                          ],
                        ),


                        Column(
                          children: [
                            Image.asset('images/payment.png', scale: 1.7,),
                            SizedBox(height: size.height * 2.5/100,),
                            const Text('Do the\npayment',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'font',
                                fontSize: 10,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),


                        Column(
                          children: [
                            Image.asset('images/enjoy.png', scale: 2,),
                            SizedBox(height: size.height * 1/100,),
                            const Text('On seat\nDelivery',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'font',
                                fontSize: 10,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

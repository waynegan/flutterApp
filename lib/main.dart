import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      if (_counter < 100) _counter++;
    });
  }

  TextEditingController _textController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var imageSrc = '../assets/question-mark.png';

  void setNewValue(double value) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      _counter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(
      body: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'BROWSE CATEGORIES',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Not sure about exactly which recipe you\'re looking for? Do a search, or dive into our most popular categories.',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 10),
            Text(
              'BY MEAT',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        "assets/1.jpeg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          "Beef",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 1.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        "assets/2.jpg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          "Chicken",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 1.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        "assets/3.jpg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          "Pork",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 1.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        "assets/4.jpeg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          "SeaFood",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 1.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              'BY COURSE',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset(
                          "assets/5.jpeg",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10), // Space between image and text
                            Text(
                              "Main Dishes",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),


                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset(
                          "assets/6.jpeg",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      SizedBox(height: 10),
                      Positioned(
                        bottom: 0,
                        child: Center(
                          child: Text(
                            "Salad Recipes",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset(
                          "assets/7.jpg",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      SizedBox(height: 10),
                      Positioned(
                        bottom: 0,
                        child: Center(
                          child: Text(
                            "Side Dishes",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset(
                          "assets/8.jpeg",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      SizedBox(height: 10),
                      Positioned(
                        bottom: 0,
                        child: Center(
                          child: Text(
                            "Crockpot",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
            Text(
              'BY DESSERT',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset(
                          "assets/5.jpeg",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      SizedBox(height: 10),
                      Positioned(
                        bottom: 0,
                        child: Center(
                          child: Text(
                            "Ice Cream",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset(
                          "assets/6.jpeg",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      SizedBox(height: 10),
                      Positioned(
                        bottom: 0,
                        child: Center(
                          child: Text(
                            "Brownies",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset(
                          "assets/7.jpg",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      SizedBox(height: 10),
                      Positioned(
                        bottom: 0,
                        child: Center(
                          child: Text(
                            "Pies",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset(
                          "assets/8.jpeg",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      SizedBox(height: 10),
                      Positioned(
                        bottom: 0,
                        child: Center(
                          child: Text(
                            "Cookies",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
          ],
        ),
      ),

    );
  }
}

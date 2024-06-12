import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late TextEditingController
      _loginController; // for user name text, initialize later, but not null
  late TextEditingController
      _passwordController; // for passowrd text, initialize later, but not null
  static const String correctPassword = 'QWERTY123'; // The correct password
  String _imagePath = '../assets/question-mark.png'; // initialise the picture

  @override
  void initState() {
    //loading page, Initialize the controllers
    super.initState();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    _loadPreferences();
  }

  _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _loginController.text = prefs.getString('login') ?? '';
    _passwordController.text = prefs.getString('password') ?? '';
    if (_loginController.text.isNotEmpty ||
        _passwordController.text.isNotEmpty) {
      SnackBar snackBar = SnackBar(
        content: Text("Username and password loaded"),
        duration: Duration(seconds: 5),
        // a button to clear username and password
        action: SnackBarAction(
          label: 'Clear',
          onPressed: () {
            SharedPreferences.getInstance().then((prefs) {
              prefs.remove('login');
              prefs.remove('password');
            });
            _loginController.text = '';
            _passwordController.text = '';
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    // unloading page, dispose the controllers to free up resources
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // function for buttonClicked
  void buttonClicked() {
    var userTyped = _passwordController.value.text;
    setState(() {
      _imagePath = userTyped == correctPassword
          ? '../assets/idea.png'
          : '../assets/stop.png';
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
                controller: _loginController,
                decoration: InputDecoration(
                  hintText: "Login",
                  border: OutlineInputBorder(),
                  labelText: "Login",
                )),
            TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  labelText: "Password",
                )),
            ElevatedButton(
                onPressed: buttonClicked, // Lambda function, anonymous function
                child: Text("Login")),
            Image.asset(_imagePath, width: 300.0, height: 300.0),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  final String username;

  ProfilePage({required this.username});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late Repository _repository;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _repository = Repository();
    _loadData();
  }

  @override
  void dispose() {
    _saveData();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  _loadData() async {
    await _repository.loadData();
    setState(() {
      _firstNameController.text = _repository.firstName ?? '';
      _lastNameController.text = _repository.lastName ?? '';
      _phoneController.text = _repository.phone ?? '';
      _emailController.text = _repository.email ?? '';
    });
  }

  _saveData() {
    _repository.firstName = _firstNameController.text;
    _repository.lastName = _lastNameController.text;
    _repository.phone = _phoneController.text;
    _repository.email = _emailController.text;
    _repository.saveData();
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("URL is not supported on this device"),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                hintText: "First Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                hintText: "Last Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      hintText: "Phone Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    _launchURL("tel:${_phoneController.text}");
                  },
                  child: Icon(Icons.phone),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    _launchURL("sms:${_phoneController.text}");
                  },
                  child: Icon(Icons.sms),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    _launchURL("mailto:${_emailController.text}");
                  },
                  child: Icon(Icons.email),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Repository {
  String? firstName;
  String? lastName;
  String? phone;
  String? email;

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    firstName = prefs.getString('firstName');
    lastName = prefs.getString('lastName');
    phone = prefs.getString('phone');
    email = prefs.getString('email');
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('firstName', firstName ?? '');
    prefs.setString('lastName', lastName ?? '');
    prefs.setString('phone', phone ?? '');
    prefs.setString('email', email ?? '');
  }
}

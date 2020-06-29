import 'package:flutter/material.dart';
import 'Screens/SignInScreen.dart';
import 'Screens/SignUpScreen.dart';
import 'Screens/HomeScreen.dart';
import 'call/call.dart';
import 'geolocation/location.dart';
void main() {
  runApp(MyApp());
}
  
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign In Screen',
      //
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.purple,
     
      ),
      initialRoute: 'SignIn',
      routes: {
        'SignIn': (context)=> SignInScreen(),
        'SignUp': (context)=> SignUpScreen(),
        'Home': (context)=> Homescreen(),
        'Location': (context)=> CurrentLocation(),
        'Call': (context)=> CallWidget()

      },

      home: CallWidget(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);


//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
     
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
   
//     return Scaffold(
//       appBar: AppBar(
   
//         title: Text(widget.title),
//       ),
//       body: Center(
    
//         child: Column(
     
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), 
//     );
//   }
// }

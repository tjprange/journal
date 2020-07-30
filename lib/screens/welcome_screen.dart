import 'package:flutter/material.dart';
import 'package:journal/app.dart';
import 'package:journal/components/drawer_widget.dart';

class WelcomeScreen extends StatefulWidget {

  final void Function() updateTheme;
  WelcomeScreen({this.updateTheme});
  // final bool isDark;
  // WelcomeScreen({Key key, this.isDark});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState(/*isDark: isDark*/);
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // bool isDark;
  // _WelcomeScreenState({this.isDark});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  // void _closeEndDrawer() {
  //   Navigator.of(context).pop();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(child: Text('Welcome')),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              _openEndDrawer();
            },
          )
        ],
      ),
      endDrawer: DrawerWidget(/*isDark: isDark*/ /*updateTheme: WelcomeScreen.updateTheme*/),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'new_entry');
        },
        child: Icon(Icons.add),
      ),
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

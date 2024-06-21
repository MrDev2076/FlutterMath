import 'package:flutter/material.dart';
import 'package:myapp/calculator.dart';

// Suggested code may be subject to a license. Learn more: ~LicenseLog:2220234157.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:634704890.
void main() => runApp(MyApp());
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2473333861.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 int _selectedIndex = 0;

 static const List<Widget> _WidgetOptions  = <Widget>[


Text( 'MyBucket', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),),
Text( 'Cart', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),),
Text( 'Profile', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),),




 ];

 
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


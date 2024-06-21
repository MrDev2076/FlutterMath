import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IceBucket',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),


    home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {

int _selectedIndex = 0;

  static const List<Widget> _WidgetOptions  = <Widget>[
    Text(
      'MyBucket',
      style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
      ),

       Text(
      'Cart',
      style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
      ),


       Text(
      'Profile',
      style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
      ),
  ];

void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
}


  @override
  Widget build(BuildContext context) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3975350688.
    return Scaffold(appBar: AppBar(
      title: Text('IceBucket'),
    ),
    
    
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3501552997.
  
    body: Center(
      child: _WidgetOptions.elementAt(_selectedIndex,),
     ),
     
     bottomNavigationBar: BottomNavigationBar(
      items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.coffee_rounded),
            label: 'MyBucket')
// Suggested code may be subject to a license. Learn more: ~LicenseLog:237037959.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1554574495.
            ,
            BottomNavigationBarItem(
            icon:Icon(Icons.shopping_cart_outlined),
            label: 'Cart')
            ,
            BottomNavigationBarItem(
            icon:Icon(Icons.person_outline),
            label: 'Profile'),
            
            
            







     ],
     
     currentIndex: _selectedIndex,
        onTap: _onItemTapped,
     
     
     
     
     
     ),
     
     
     
     
     
     
     
     
     
     );


    




  }
}
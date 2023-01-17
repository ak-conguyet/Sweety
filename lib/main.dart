import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sweety/AccountPage.dart';
import 'package:sweety/CartPage.dart';
import 'package:sweety/Favoritepage.dart';
import 'package:sweety/MyColors.dart';
import 'package:sweety/RateAndCmtPage.dart';
import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sweetly',
      theme: ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: MyColors.color4,
          secondary: MyColors.color4
        )
      ),
      debugShowCheckedModeBanner: false,
      home: RateAndCmtPage(),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  final List<Widget> _page = const [HomePage(),CartPage(),FavoritePage(),AccountPage()];
  final List<Widget> _icons = const [Icon(Icons.home),Icon(Icons.shopping_cart),Icon(Icons.favorite),Icon(Icons.person),];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _page[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: _icons,
        onTap: <int>(index){
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: MyColors.color4,
      )
    );
  }
}




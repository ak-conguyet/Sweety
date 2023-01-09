import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sweety/AccountPage.dart';
import 'package:sweety/CartPage.dart';
import 'package:sweety/Favoritepage.dart';
import 'package:sweety/MyColors.dart';
import 'package:sweety/ProfilePage.dart';
import 'package:sweety/main.dart';
import 'HomePage.dart';
import 'Login.dart';

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
          secondary: MyColors.color2
        )
      ),
      debugShowCheckedModeBanner: false,
      home:const CartPage(),
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
  final List<Widget> _icons = const [Icon(Iconsax.home),Icon(Iconsax.shopping_cart),Icon(Iconsax.heart),Icon(Iconsax.profile_circle),];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: _icons,
        onTap: <int>(index){
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: MyColors.color2,
      )
    );
  }
}




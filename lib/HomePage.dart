import 'package:flutter/material.dart';
import 'package:sweety/Component/CustomItemGrid.dart';
import 'package:sweety/MyColors.dart';
import 'package:sweety/SearchPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late PageController _catoryControler;
  List<String> categorye = ['Donut','Kitkat','Donut','Kitkat','Donut','Kitkat','Donut','Kitkat','Donut','Kitkat',];
  int _currentIndex = 0;

  @override
  void initState() {
    _catoryControler = PageController(initialPage: 0, viewportFraction: 0.2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_,inner){
          return[
            SliverAppBar(
              backgroundColor: MyColors.color4,
              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                background: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        height: 75,
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Sweety",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ),
                            Expanded(child: Container()),
                            IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>SearchPage())), icon: const Icon(Icons.search_rounded, color: Colors.white,)),
                            //IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_bag, color: Colors.white,))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 300,
                          child: Stack(
                            children: [
                              Positioned(
                                  right: 0,
                                  child: Image.asset('images/donut.png',width: 250,height: 250,)
                              ),
                              const Positioned(
                                  left: 20,
                                  bottom: 20,
                                  child: Text(
                                    'Top\nPicks',
                                    style: TextStyle(
                                        fontSize: 50,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                collapseMode: CollapseMode.pin,
              ),
            )
          ];
        },
        body: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                decoration: BoxDecoration(
                  color: MyColors.color4,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50))
                ),
              ),
              Container(
                height: 140,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: PageView.builder(
                  controller: _catoryControler,
                  itemCount: categorye.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: index == _currentIndex ? MyColors.color4 : Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: index == _currentIndex ?
                              [
                                BoxShadow(
                                  color: MyColors.color1.withOpacity(0.8),
                                  offset: const Offset(0,5),
                                  blurRadius: 2
                                )
                              ] : null
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.asset(
                                  'images/donut.png',
                              fit: BoxFit.fitWidth,
                                width: 50,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Donut',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: index == _currentIndex ? Colors.white : Colors.black
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: (){
                        _catoryControler.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInBack);
                      },
                    );
                  },
                  onPageChanged: (index){
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              CustomItemGrid()
            ],
          ),
        ),
      )
    );
  }



}


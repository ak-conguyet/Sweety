import 'package:flutter/material.dart';
import 'package:sweety/Component/CustomBloc.dart';
import 'package:sweety/Component/CustomItemGrid.dart';
import 'package:sweety/Component/LoadingSc.dart';
import 'package:sweety/HomeBloc/CategoryBloc.dart';
import 'package:sweety/HomeBloc/CategoryEvent.dart';
import 'package:sweety/HomeBloc/CategoryState.dart';
import 'package:sweety/HomeBloc/HomeBloc.dart';
import 'package:sweety/HomeBloc/HomeEvent.dart';
import 'package:sweety/HomeBloc/HomeState.dart';
import 'package:sweety/Models/Categories.dart';
import 'package:sweety/MyColors.dart';
import 'package:sweety/SearchPage.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  final HomeBloc _contentBloc = HomeBloc();
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
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                decoration: BoxDecoration(
                    color: MyColors.color4,
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(50))
                ),
              ),
              SizedBox(
                height: 140,
                child: _CategorybarB(_contentBloc),
              ),
              Expanded(child: SizedBox(child: _Content(bloc: _contentBloc)))
            ],
          ),
        )
    );
  }
}

class _Content extends CustomBloc<HomeBloc, HomeState>{
  _Content({required super.bloc});

  @override
  void listener(BuildContext context, HomeState state) {
    // TODO: implement listener
  }

  @override
  Widget stateBuilder(HomeState state) {
    if(state is Home_Initical){
      return LoadingAni();
    }

    if(state is Home_Loading){
      return LoadingAni();
    }

    if(state is Home_Successful){
      return CustomItemGrid(bloc.products);
    }

    return Scaffold(
      body: Center(
        child: Text(
            'Failure'
        ),
      ),
    );
  }

  @override
  Widget blocState(HomeState state,
      {Duration duration = const Duration(milliseconds: 300),
        Curve inCurve = Curves.linear,
        Curve outCurve = Curves.linear}) {
    return stateBuilder(state);
  }

}

class _CategorybarB extends CustomBloc<CategoryBloc,CategoryState>{
  _CategorybarB(this.contentBloc):super(bloc: CategoryBloc());
  final HomeBloc contentBloc;
  @override
  void listener(BuildContext context, CategoryState state) {
    // TODO: implement listener
  }

  @override
  Widget stateBuilder(CategoryState state) {
    if(state == CategoryState.Initical){
      bloc.add(CategoryEvent.request);
      contentBloc.add(Home_request());
      return LoadingAni();
    }

    if(state == CategoryState.Loading){
      return LoadingAni();
    }

    if(state == CategoryState.Successful){
      return _CategoryBar(
          category: bloc.categories,
          onCategoryChoose: (values){
            contentBloc.add(Home_request(categoryId: values));
          }
      );
    }

    return Scaffold(
      body: Center(
        child: Text(
            'Failure'
        ),
      ),
    );
  }
}

class _CategoryBar extends StatefulWidget {
  const _CategoryBar({Key? key,required this.category, required this.onCategoryChoose}) : super(key: key);
  final List<Category> category;
  final Function(String categoryID) onCategoryChoose;
  @override
  State<_CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<_CategoryBar> {

  late PageController _catoryControler;
  int _currentIndex = 0;

  @override
  void initState() {
    _catoryControler = PageController(initialPage: 0, viewportFraction: 0.2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: PageView.builder(
        controller: _catoryControler,
        itemCount: widget.category.length,
        itemBuilder: (context,index){
          return GestureDetector(
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: index == _currentIndex ? MyColors.color4 : Colors.grey.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
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
                    child: Center(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(25)),
                        child: Image.network(
                          '${widget.category[index].img}',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${widget.category[index].name}',
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
          widget.onCategoryChoose.call(widget.category[index].id);
        },
      ),
    );
  }
}





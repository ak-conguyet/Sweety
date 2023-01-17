import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class RateAndCmtPage extends StatelessWidget {
  RateAndCmtPage({Key? key}) : super(key: key);

  List<Emj> _listIcon = [
    Emj('Yumi', 'fat-emoji.png'),
    Emj('Fresh and clean', 'leaf.png'),
    Emj('Nice packaging', 'bag.png'),
    Emj('Eat full', 'hamburger.png'),
    Emj('Worth of money', 'save-money.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isInner){
          return [
            SliverAppBar(
              expandedHeight: 230,
              flexibleSpace: FlexibleSpaceBar(
                background: SafeArea(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '4.3',
                                        style: TextStyle(
                                            fontSize: 40, fontWeight: FontWeight.bold),
                                      ),
                                      RatingStars(
                                        value: 4.5,
                                        valueLabelVisibility: false,
                                        starSize: 12,
                                      ),
                                      Text(
                                        '2435 rating',
                                        style:
                                        TextStyle(color: Colors.grey, fontSize: 12),
                                      )
                                    ],
                                  )),
                              Container(
                                height: 120,
                                width: 1,
                                decoration: BoxDecoration(color: Colors.grey),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                      height: 120,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text('1'),
                                                Text('2'),
                                                Text('3'),
                                                Text('4'),
                                                Text('5'),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                LinearProgressIndicator(
                                                  value: 0.4,
                                                ),
                                                LinearProgressIndicator(
                                                  value: 0.3,
                                                ),
                                                LinearProgressIndicator(
                                                  value: 0.5,
                                                ),
                                                LinearProgressIndicator(
                                                  value: 0.6,
                                                ),
                                                LinearProgressIndicator(
                                                  value: 0.6,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )))
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _listIcon.length,
                            itemBuilder: (_, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'images/icons/${_listIcon[index].icon}',
                                      width: 24,
                                      height: 24,
                                    ),
                                    Text('${_listIcon[index].text}')
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                              );
                            },
                          ),
                        )
                      ],
                    )),
                collapseMode: CollapseMode.pin,
                expandedTitleScale: 1,
              ),
              backgroundColor: Colors.white,
            ),
          ];
        },
        body: ListView.builder(
          physics:const BouncingScrollPhysics(),
          itemBuilder: (_,index){
            return _itemBuider();
          },
        ),
      ),
    );
  }

  Widget _itemBuider() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Text(
                    'Jonh',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                    '13/12/2023',
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Image.asset('images/icons/avatar_none.png',height: 50,width: 50,),
          ),
          SizedBox(height: 10,),
          Flexible(
            child: Text(
              'Good food'
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5
          )
        )
      ),
    );
  }

}

class Emj {
  final String icon;
  final String text;

  const Emj(this.text, this.icon);
}

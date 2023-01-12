import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sweety/MyColors.dart';

class CartPage extends StatefulWidget  {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with SingleTickerProviderStateMixin{
  late ScrollController _scrollController;

  double _oldOffset = 0;
  final Tween<double> _tween = Tween(begin: -200,end: 0);
  late AnimationController _animationController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        if(_scrollController.position.userScrollDirection == ScrollDirection.reverse)
          print('up');

        if(_scrollController.position.userScrollDirection == ScrollDirection.forward)
          print('down');

        if(_scrollController.position.userScrollDirection == ScrollDirection.idle)
          print('idle');


      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context,isInner){
              return [
                SliverAppBar(
                  pinned: true,
                  title: Row(
                    children: [
                      Icon(Iconsax.location),
                      SizedBox(width: 10,),
                      Text(
                        'Delivery to HCM',
                        style: TextStyle(
                            fontSize: 14
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                    child: Container(
                        height: 50,
                        padding:const EdgeInsets.symmetric(horizontal: 20),
                        color: MyColors.color4,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Your cart',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic
                            ),
                          ),
                        )
                    )
                ),
              ];
            },
            body: Stack(
              children: [
                ListView.builder(
                  controller: _scrollController,
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return _itemBuilder();
                  },
                ),
              ],
            )
        )
    );
  }

  Container _itemBuilder() {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 10,horizontal: 35),
      padding:const EdgeInsets.all(10),
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: MyColors.color1.withOpacity(0.5),
                offset:const Offset(4,4),
                blurRadius: 1
            )
          ]
      ),
      child: Row(
        children: [
          ClipRRect(
            child: Image.asset('images/products/oreo_cookie.jpg'),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Oreo Ice Cream',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  RatingStars(
                    value: 3.5,
                    starBuilder: (index,color){
                      return Icon(Icons.star,color: color,);
                    },
                    valueLabelVisibility: false,
                    starSize: 18,
                  ),
                  RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: '\$',
                              style: TextStyle(
                                  fontSize: 12
                              )
                          ),
                          TextSpan(
                              text: '16.0',
                              style: TextStyle(
                                  fontSize: 18
                              )
                          )
                        ],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  )
                ],
              )
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: 45,
                    height: 25,
                    decoration: BoxDecoration(
                        color: MyColors.color4,
                        borderRadius:const BorderRadius.all(Radius.circular(5))
                    ),
                    child: Icon(FontAwesomeIcons.add,size: 14,color: Colors.white,),
                  ),
                ),
                SizedBox(
                    width: 45,
                    height: 25,
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                ),
                GestureDetector(
                  child: Container(
                    width: 45,
                    height: 25,
                    decoration: BoxDecoration(
                        color: MyColors.color4,
                        borderRadius:const BorderRadius.all(Radius.circular(5))
                    ),
                    child: Icon(FontAwesomeIcons.minus,size: 14,color: Colors.white,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:sweety/MyColors.dart';

class CustomItemSearch extends StatelessWidget {
  const CustomItemSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin:const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      padding:const EdgeInsets.all( 10),
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
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Image.asset('images/products/oreo_cookie.jpg'),
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
        ],
      ),
    );
  }

}

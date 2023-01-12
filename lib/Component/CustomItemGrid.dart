import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:sweety/DetailsPage.dart';
import 'package:sweety/MyColors.dart';

class CustomItemGrid extends StatelessWidget {
  const CustomItemGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 100,
        itemBuilder: (_,index){
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                        color: MyColors.color1.withOpacity(0.5),
                        offset: Offset(4,4),
                        blurRadius: 2
                    )
                  ]
              ),
              child: ClipRRect(
                borderRadius:const BorderRadius.all(Radius.circular(25)),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        'images/donut.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Donut',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                RatingStars(
                                  value: 3.5,
                                  starBuilder: (index,color){
                                    return Icon(Icons.star,color: color,size: 12,);
                                  },
                                  valueLabelVisibility: false,
                                  starSize: 12,
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
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.add,color: Colors.white,size: 16,),
                              decoration: BoxDecoration(
                                  color: MyColors.color4,
                                  borderRadius: BorderRadius.all(Radius.circular(25))
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),
            ),
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage())),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3/4
        ),
      ),
    );
  }
}

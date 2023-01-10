import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sweety/MyColors.dart';

class CustomListItem extends StatefulWidget {
  CustomListItem({Key? key, this.onChecked, this.checked:false}) : super(key: key);
  final Function(bool)? onChecked;
  bool checked;
  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {



  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 35),
        height: 120,
        child: Row(
          children: [
            SizedBox(
              width: 25,
              child: Center(
                child: Checkbox(
                  value: widget.checked,
                  onChanged: (v){
                    setState(() {
                      widget.checked = v ?? false;
                      widget.onChecked?.call(widget.checked);
                    });
                  },
                ),
              ),
            ),
            Expanded(
                child: Container(
                  padding:const EdgeInsets.all(10),
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
                )
            )
          ],
        )
    );
  }
}

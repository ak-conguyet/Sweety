import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:sweety/FavoriteBloc/FavoriteBloc.dart';
import 'package:sweety/Models/Products.dart';
import 'package:sweety/MyColors.dart';

class CustomFavoriteItem extends StatefulWidget {
  CustomFavoriteItem(this.product,{Key? key,required this.parentBloc}) : super(key: key);
  Product product;
  final FavoriteBloc parentBloc;
  @override
  State<CustomFavoriteItem> createState() => _CustomFavoriteItemState();
}

class _CustomFavoriteItemState extends State<CustomFavoriteItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin:const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      padding:const EdgeInsets.all( 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
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
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Image.network(widget.product.image,width: 100,height: 100,fit: BoxFit.cover,),
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
                    '${widget.product.name}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  RatingStars(
                    value: widget.product.rating,
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
                              text: '${widget.product.prices}',
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
          Center(
            child: IconButton(
              onPressed: ()=>setState(() {
                widget.product.isFavorite = !widget.product.isFavorite;
              }),
              icon: Icon(
                Icons.favorite,
                color: widget.product.isFavorite ? Colors.red : Colors.black,
              ),
            )
          )
        ],
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    if(!widget.product.isFavorite){
      widget.parentBloc.removeProduct(widget.product.id);
      print('remove ${widget.product.name}');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:sweety/MyColors.dart';

class CouponBoxPage extends StatelessWidget {
  const CouponBoxPage({Key? key}) : super(key: key);

  List<BoxShadow> _listShadow(){
    return [
      BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          offset: const Offset(0.1,0.1),
          blurRadius: 1,
          spreadRadius: 1
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (_,index){
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 75,
                  decoration: BoxDecoration(
                      color: MyColors.color4,
                      borderRadius:const BorderRadius.horizontal(
                          left: Radius.circular(15)
                      ),
                      boxShadow: _listShadow()
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 75,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: _listShadow(),
                      borderRadius:const BorderRadius.horizontal(
                          right: Radius.circular(15)
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Image.asset('images/icons/img_default_coupon_logo.png',width: 50,height: 50,),
                        const SizedBox(width: 10,),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  child: Text(
                                    'Giảm 50k cho đơn 600k',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                    'EXP: Dec 31, 2023',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12
                                  ),
                                )
                              ],
                            )
                        ),
                      ],
                    )
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Container(
                      height: 75,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: _listShadow(),
                          borderRadius:const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: Text(
                            'Use',
                          style: TextStyle(
                            color: MyColors.color4,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    onTap: (){},
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

}

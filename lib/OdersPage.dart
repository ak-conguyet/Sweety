import 'package:flutter/material.dart';
import 'package:sweety/MyColors.dart';
import 'OderDetails.dart';

class OdersPage extends StatelessWidget {
  const OdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          physics:const BouncingScrollPhysics(),
          itemBuilder: (context,index){
            return InkWell(
                child: _itemBuider(),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>OderDetails())),
            );
          },
        ),
      ),
    );
  }

  Container _itemBuider() {
    return Container(
            margin:const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
            child: Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('images/donut.png',width: 100,height: 100,),
                      SizedBox(width: 10,),
                      Container(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Donut - S - Chawberry',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Total: \$ '
                                  ),
                                  TextSpan(
                                      text: '16.0'
                                  )
                                ],
                                style: TextStyle(
                                  color: Colors.black
                                )
                              ),
                            ),
                            Text(
                              '13 Jan. 2023',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        )
                      ),
                    ],
                  ),
                 Container(
                   height: 0.5,
                   decoration:const BoxDecoration(
                     color: Colors.grey
                   ),
                 ),
                  InkWell(
                    child: Padding(
                      padding:const EdgeInsets.all(5),
                      child: Text(
                        'ReOder',
                        style: TextStyle(
                          color: MyColors.color4,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    onTap: (){},
                  )
                ],
              )
            ),
          );
  }

}

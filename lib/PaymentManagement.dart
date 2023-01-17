import 'package:flutter/material.dart';
import 'package:sweety/MyColors.dart';

class PaymentManagement extends StatelessWidget {
  const PaymentManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
                'List of linked bank',
              style: TextStyle(
                color: Colors.grey
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 1 + 1,
              itemBuilder: (_,index){
                if(index == 1){
                  return Center(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: MyColors.color4,),
                          Text(
                              'Add other bank',
                            style: TextStyle(
                              color: MyColors.color4
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: MyColors.color1.withOpacity(0.5),
                        borderRadius:const BorderRadius.all(Radius.circular(25))
                      ),
                    ),
                  );
                }
                return _itemBuider();
              },
            ),
          )
        ],
      )
    );
  }
  
  Widget _itemBuider(){
    return Container(
      height: 90,
      margin:const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:const Color(0xfff7f7f7),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: ClipRRect(
                child: Image.asset('images/icons/momo.png',width: 50,height: 50,fit: BoxFit.scaleDown),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            )
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    'Momo Wallet',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                    '083***464',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Icon(Icons.more_horiz,color: Colors.grey,),
            ),
          )
        ],
      ),
    );
  }
  
}

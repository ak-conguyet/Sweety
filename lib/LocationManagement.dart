import 'package:flutter/material.dart';
import 'package:sweety/MyColors.dart';

class LocationManagement extends StatelessWidget {
  LocationManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:const Text('My Address'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding:const EdgeInsets.all(10),
            color: Colors.grey.withOpacity(0.2),
            child: Row(
              children:const[
                Text(
                  'My location',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
                Spacer(),
                Text('3/5')
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3 + 1,
              itemBuilder: (context,index){
                
                if(index == 3){
                  return InkWell(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(Icons.add,color: MyColors.color4,),
                          SizedBox(width: 10,),
                          Text(
                            'Add other address',
                            style: TextStyle(
                              color: MyColors.color4,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: (){},
                  );
                }

                return InkWell(
                  child: Container(
                    padding:const EdgeInsets.all(10),
                    height: 75,
                    child: Row(
                        children: [
                          const Icon(Icons.flag),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text(
                                  'Home',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  '110 Nguyễn Thị Thập, Thanh Khê, Đà nẵng',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 13
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Icon(Icons.edit)
                        ]
                    ),
                  ),
                  onTap: (){},
                );
              }
            )
          )
        ],
      )
    );
  }
}



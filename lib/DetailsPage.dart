import 'package:flutter/material.dart';
import 'package:sweety/MyColors.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: ()=> Navigator.pop(context,this),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.heart_broken, color: Colors.black,),
            onPressed: (){},
          )
        ],
        elevation: 0, 
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Center(
              child: Text(
                  'Donu',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Container(
              padding:const EdgeInsets.all(20),
              margin:const EdgeInsets.only(bottom: 20),
              height: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset(
                'images/donut.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '\$ ',
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    ),
                    TextSpan(
                      text: '10.000',
                      style: TextStyle(
                        color: Colors.black,
                      )
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  margin:const EdgeInsets.only(right: 10),
                  child: Center(
                    child: Text(
                        '-',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: MyColors.color1,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                Text(
                  '02',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  margin:const EdgeInsets.only(left: 10,),
                  child: Center(
                    child: Icon(Icons.add,color: Colors.white,),
                  ),
                  decoration: BoxDecoration(
                      color: MyColors.color1,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildText('69 Calories'),
                _buildText('20-30 phút'),
                _buildText('4.9'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Mô tả',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Design Exploration for Cake Shop App Design, This App will allow you to find the best and tastiest cakes in town for your party, you can order cakes by clicking on the link in the app and place your order right away. What do you think?',
            ),
          ],
        )
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.all(15),
        child: ElevatedButton(
          child: Text(
            'Thêm vào giỏ hàng',
            style: TextStyle(
              fontSize: 18
            ),
          ),
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.color1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))
            )
          ),
        ),
      ),
    );
  }

  Text _buildText(String text) {
    return Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                ),
              );
  }
}

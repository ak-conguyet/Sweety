import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sweety/MyColors.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  List<String> sizeOptions = ['S','M','L'];
  List<String> options = ['Chocolate','Strawberry','Vanilla'];
  int? _sizeOptionsIndex;
  int? _optionsIndex;

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
            icon: Icon(Iconsax.heart, color: Colors.black,),
            onPressed: (){},
          )
        ],
        elevation: 0, 
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding:const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Center(
              child: Text(
                  'Donut',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Container(
              padding:const EdgeInsets.all(20),
              margin:const EdgeInsets.only(bottom: 20),
              height: MediaQuery.of(context).size.width * 0.6,
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
            OptionList(
              items: sizeOptions,
              selectedColor: MyColors.color4,
              unSelectedColor: Colors.black,
              selectedIndex: (index){
                setState(() {
                  _sizeOptionsIndex = index;
                });
              },
            ),
            OptionList(
              items: options,
              selectedColor: MyColors.color4,
              unSelectedColor: Colors.black,
              selectedIndex: (index){
                setState(() {
                  _optionsIndex = index;
                });
              },
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
                    color: MyColors.color4,
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
                      color: MyColors.color4,
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
                _buildText('69 Calories','calories.png'),
                _buildText('20-30 Minutes','clock.png'),
                _buildText('4.9','star.png'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'View the rating',
                  style: TextStyle(
                    color: MyColors.color4
                  ),
                  )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Description',
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
            'Add to cart',
            style: TextStyle(
              fontSize: 18
            ),
          ),
          onPressed: (){
            if(!_checkVali()){
              _showSnackBar();
              return;
            }

          },
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.color4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))
            )
          ),
        ),
      ),
    );
  }

  bool _checkVali(){
    return _sizeOptionsIndex!=null && _optionsIndex != null;
  }

  void _showSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Container(
          height: 50,
          padding: EdgeInsets.all(5),
          decoration:const BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Nofitication!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'You must be choose the options!'
              )
            ],
          ),
        ),
      )
    );
  }

  Widget _buildText(String text,String iconName) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('images/icons/$iconName', height: 20,width: 20,),
        const SizedBox(width: 5,),
        Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                ),
              )
      ],
    );
  }
}

class OptionList extends StatefulWidget {
  OptionList({
    Key? key,
    required this.items,
    required this.unSelectedColor,
    required this.selectedColor,
    this.selectedIndex,
  }) : super(key: key);
  final List<String> items;
  final Color unSelectedColor;
  final Color selectedColor;
  final Function(int?)? selectedIndex;
  @override
  State<OptionList> createState() => _OptionListState();
}

class _OptionListState extends State<OptionList> {

  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (_,index) => GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            child: Text(
              widget.items[index],
              style: TextStyle(
                  color: _selectedIndex == null || _selectedIndex!=index ? widget.unSelectedColor : widget.selectedColor,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
          ),
          onTap: ()=>setState((){
            _selectedIndex = index;
            widget.selectedIndex?.call(index);
          }),
        ),
      )
    );
  }
}


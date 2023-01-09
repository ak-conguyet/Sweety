import 'package:flutter/material.dart';
import 'package:sweety/MyColors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _profileBuider(),
              const Text(
                'Jonh',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          _billAndaddressBuilder(),
          _itemBuider(
              iconName: 'avatar_none.png',
              text: 'Account'
          ),
          _itemBuider(
            iconName: 'coupon.png',
            text: 'Ví coupon'
            ),
          _itemBuider(
              iconName: 'wallet.png',
              text: 'Quản lý thanh toán'
            ),
          _itemBuider(
              iconName: 'star.png',
              text: 'Đánh giá'
            ),
          _itemBuider(
              iconName: 'nofitication.png',
              text: 'Thông báo'
            ),
          _itemBuider(
              iconName: 'support.png',
              text: 'Hỗ trợ'
            ),
          _itemBuider(
              iconName: 'infor.png',
              text: 'Thông tin'
            ),
          ],
        ),
      ),
    );
  }

  Container _itemBuider({required String iconName, required String text}) {
    return Container(
          padding:const EdgeInsets.all(10),
          height: 75,
          decoration:const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 0.5
              )
            )
          ),
          child: Row(
            children: [
              Image.asset('images/icons/$iconName',width: 30,height: 30,fit: BoxFit.cover,),
              const SizedBox(width: 10,),
              Text(
                  text,
                style:const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        );
  }

  Container _billAndaddressBuilder() {
    return Container(
          height: 75,
          decoration:const BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                color: Colors.grey,
                width: 0.5
              )
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                        vertical: BorderSide(
                            color: Colors.grey,
                            width: 0.5
                      )
                    ),
                  ),
                  child: GestureDetector(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('images/icons/my_orders.png',width: 24,height: 24,),
                          Text(
                            'Đơn hàng',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: (){

                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                        vertical: BorderSide(
                            color: Colors.grey,
                            width: 0.5
                        )
                    ),
                  ),
                  child: GestureDetector(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('images/icons/saved_place.png',width: 24,height: 24,),
                          Text(
                            'Sổ địa chỉ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: (){

                    },
                  ),
                ),
              ),
            ],
          ),
        );
  }

  Widget _profileBuider() {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(top: 20,bottom: 10),
        child: ClipRRect(
          child: Image.asset('images/avt_person.png', width: 150, height: 150, fit: BoxFit.cover,),
          borderRadius: BorderRadius.all(Radius.circular(80)),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(80)),
          boxShadow: [
            BoxShadow(
              color: MyColors.color1,
            )
          ]
        ),
      ),
    );
  }

}
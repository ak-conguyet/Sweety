import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sweety/Component/CustomListItem.dart';
import 'package:sweety/MyColors.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();

}

class _CartPageState extends State<CartPage>
    with SingleTickerProviderStateMixin {
  bool _checkAll = false;
  int _selectProductCount = 0;
  List<bool> checkList = List.filled(10, false);
  int arrLength = 10;

  void _countProduct() {
    int count = 0;
    checkList.forEach((element) {
      if (element) count++;
    });
    setState(() {
      _selectProductCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: const [
              Icon(Iconsax.location),
              SizedBox(
                width: 10,
              ),
              Text(
                'Delivery to HCM',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: arrLength + 1,
                itemBuilder: (context, index) {
                  if (index == 10) {
                    return Container(
                      height: 150,
                    );
                  }
                  return CustomListItem(
                    checked: checkList[index],
                    onChecked: (v) {
                      setState(() {
                        checkList[index] = v;
                        _countProduct();
                        if (_selectProductCount == arrLength) {
                          _checkAll = true;
                        } else {
                          _checkAll = false;
                        }
                      });
                    },
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, -2),
                            color: MyColors.color2,
                            blurRadius: 5)
                      ],
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20))),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Checkbox(
                                value: _checkAll,
                                onChanged: (v) => setState(() {
                                      _checkAll = v ?? false;
                                      if (_checkAll) {
                                        checkList = List.filled(10, true);
                                      } else {
                                        checkList = List.filled(10, false);
                                      }
                                      _countProduct();
                                    })),
                            Text(
                              'All ( $_selectProductCount products)',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            const Expanded(child: SizedBox()),
                            IconButton(
                              icon: const Icon(
                                Iconsax.trash,
                                size: 18,
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Image.asset(
                              'images/icons/coupon.png',
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Sweety coupon',
                              style: TextStyle(fontSize: 15),
                            ),
                            Expanded(child: SizedBox()),
                            const Text(
                              'Choose the coupon',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Total:',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    '\$ 100',
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('Buy'),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}

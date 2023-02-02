import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sweety/CartBloc/CartBloc.dart';
import 'package:sweety/CartBloc/CartEvent.dart';
import 'package:sweety/CartBloc/CartState.dart';
import 'package:sweety/Component/CustomBloc.dart';
import 'package:sweety/Component/CustomListItem.dart';
import 'package:sweety/Component/LoadingSc.dart';
import 'package:sweety/CouponBoxPage.dart';
import 'package:sweety/Models/Products.dart';
import 'package:sweety/MyColors.dart';
import 'package:sweety/Utils/Utils.dart';

class CartPage extends CustomBloc<CartBloc,CartState>{
  CartPage({super.key}):super(bloc: CartBloc());

  @override
  void listener(BuildContext context, CartState state) {

  }

  @override
  Widget stateBuilder(CartState state) {

    if(state is Cart_Initical){
      bloc.add(Cart_request());
      return LoadingAni();
    }

    if(state is Cart_Loading){
      return LoadingAni();
    }

    if(state is Cart_Successful){
      return _ContentBuider(state.products);
    }

    return Scaffold(
      body: Center(
        child: Text('Error'),
      ),
    );

  }
}

class _ContentBuider extends StatefulWidget {
  const _ContentBuider(this.products,{Key? key}) : super(key: key);
  final List<Product> products;
  @override
  State<_ContentBuider> createState() => _ContentBuiderState();
}

class _ContentBuiderState extends State<_ContentBuider> {

  bool _checkAll = false;
  int _selectProductCount = 0;
  late int _length;
  late List<bool> checkList;
  double totalPrices = 0;
  String? cupon;

  @override
  void initState() {
    _length = widget.products.length;
    checkList = List.filled(_length, false);
    super.initState();
  }

  void _countProduct() {
    int count = 0;
    totalPrices = 0;
    for (int i = 0; i <_length ; i ++) {
      if (checkList[i]) {
        count ++;
        totalPrices += widget.products[i].prices * widget.products[i].count;
      }
    }
    setState(() {
      _selectProductCount = count;
    });
  }

  void _removeProduct(){
    setState(() {
      for(int i = 0; i< _length; i++){
        if(checkList[i]){
          widget.products.removeAt(i);
          _length --;
        }
      }
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
        body: _bodyBuider(widget.products)
    );
  }

  Widget _buidLoading()=>Center(
    child: CircularProgressIndicator(),
  );

  Widget _bodyBuider(List<Product> products)=>SafeArea(
    child: Stack(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: _length + 1,
          itemBuilder: (context, index) {
            if (index == _length) {
              return Container(
                height: 150,
              );
            }
            return CustomListItem(
              value: widget.products[index].count,
              product: products[index],
              checked: checkList[index],
              onChecked: (v) {
                setState(() {
                  checkList[index] = v;
                  _countProduct();
                  if (_selectProductCount == _length) {
                    _checkAll = true;
                  } else {
                    _checkAll = false;
                  }
                });
              },
              onValueChange: (value){
                widget.products[index].count = value;
                _countProduct();
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
                              checkList = List.filled(_length, true);
                            } else {
                              checkList = List.filled(_length, false);
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
                        onPressed: ()=>_removeProduct(),
                      )
                    ],
                  ),
                ),
                InkWell(
                  child: Container(
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
                        Text(
                          cupon ?? 'Choose the coupon',
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
                  onTap: () async {
                    cupon = await startActivity<String>(context, const CouponBoxPage());
                    setState(() {

                    });
                  },
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
                              '\$ ${totalPrices.roundToDouble()}',
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
  );

}


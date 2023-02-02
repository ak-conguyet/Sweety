import 'package:flutter/material.dart';
import 'package:sweety/Component/CustomBloc.dart';
import 'package:sweety/Component/LoadingSc.dart';
import 'package:sweety/CupponDetailsBloc/CupponDetailsBloc.dart';
import 'package:sweety/CupponDetailsBloc/CupponDetailsEvent.dart';
import 'package:sweety/CupponDetailsBloc/CupponDetailsState.dart';
import 'package:sweety/MyColors.dart';
import 'package:sweety/Utils/Utils.dart';

class CupponDetailsPage extends CustomBloc<CupponDetailsBloc,CupponDetailsState>{
  CupponDetailsPage():super(bloc: CupponDetailsBloc());

  @override
  void listener(BuildContext context, state) {
    // TODO: implement listener
  }

  @override
  Widget stateBuilder(state) {
    if(state is CupponDetailsInitical){
      bloc.add(CupponDetailsEvent.Request);
      return LoadingAni();
    }

    if(state is CupponDetailsLoading)
      return LoadingAni();

    return _BuildBody();
  }


class _BuildBody extends StatelessWidget {
  const _BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(25)),
              color: MyColors.color2,
            ),
            child: Image.network('https://vuakhuyenmai.vn/wp-content/uploads/Ma-Giam-Gia-Grab-moi-nhat.jpg',height: 350,fit: BoxFit.cover,),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(4,4),
                    blurRadius: 2,
                  )
                ]
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Exp'),
                      SizedBox(width: 10,),
                      Text('15/02/2023'),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('Nhưng đối với việc custom transition, Flutter cung cấp cho chúng ta các transition widget khác nhau. Hãy xem cách chúng ta có thể sử dụng chúng.Chúng ta biết rằng Navigator.push nhận hai tham số (BuildContext context, Route<T> route). Chúng ta có thể tạo page route tùy chỉnh của riêng mình với một số transition animation.. Hãy bắt đầu với một cái gì đó đơn giản như slide transition.'),
                  SizedBox(height: 10,),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: (){

                        },
                        child: Text(
                            'USE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.color1
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }

}

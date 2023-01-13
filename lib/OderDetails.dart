import 'package:flutter/material.dart';
import 'package:sweety/MyColors.dart';

class OderDetails extends StatelessWidget {
  const OderDetails({Key? key}) : super(key: key);

  List<Widget> _createList() {
    List<String> matHang = List.filled(5, 'Donut', growable: false);
    return matHang
        .map((e) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 75,
              child: Row(
                children: [
                  Text('x3',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    'images/donut.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'Donut',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '\$ 16.0',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  'Sweety',
                  style: TextStyle(
                      fontSize: 50,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            _lineBuilder(),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Payment receipt'.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildText(title: 'CUSTOMER\'S NAME', text: 'jonh'),
                  _buildText(title: 'Phone', text: '0123456778'),
                  _buildText(title: 'Email', text: 'igg.anhkiet1@gmail.com'),
                  _buildText(title: 'Address', text: 'Thanh Khe, Da Nang'),
                  _buildText(title: 'Date', text: DateTime.now().toString()),
                ],
              ),
            ),
            _lineBuilder(),
            SizedBox(
              child: Column(children: _createList()),
            ),
            _lineBuilder(),
            SizedBox(
              child: Column(
                children: [
                  _buildTextP(title: 'Subtotal:', text: '\$ 16.0'),
                  _buildTextP(
                      title: 'Coupon:', text: '- \$ 6.0', color: Colors.red),
                ],
              ),
            ),
            _lineBuilder(),
            SizedBox(child: _buildTextP(title: 'Total:', text: '\$ 10.0')),
            _lineBuilder(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Paid by:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Image.asset(
                    'images/icons/momo.png',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('Momo payment')
                ],
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  Padding _buildTextP(
      {required String title,
      required String text,
      Color color: Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16, color: color, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          Text(
            text,
            style: TextStyle(fontSize: 16, color: color),
          )
        ],
      ),
    );
  }

  Widget _buildText({required String title, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: '${title.toUpperCase()}:  ',
              style: TextStyle(
                color: Colors.grey,
              )),
          TextSpan(
              text: text.toUpperCase(), style: TextStyle(color: Colors.black))
        ], style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  LayoutBuilder _lineBuilder() {
    return LayoutBuilder(
      builder: (_, constrainType) {
        return Container(
          height: 1,
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: constrainType.maxWidth * 0.8,
          color: Colors.grey.withOpacity(0.5),
        );
      },
    );
  }
}

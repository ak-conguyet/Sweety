import 'package:flutter/material.dart';
import 'package:sweety/MyColors.dart';

class EditAddressPage extends StatelessWidget {
  const EditAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Address edit'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 75,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Ex: School, Home',
                    labelText: 'Name *',
                  ),
                )
              ),
              SizedBox(
                  height: 75,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ex: Street, City,...',
                      labelText: 'Address *',
                    ),
                  )
              ),
              SizedBox(
                  height: 75,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Note *',
                    ),
                  )
              ),
              const Spacer(),
              InkWell(
                child: Container(
                  height: 50,
                  margin:const EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: MyColors.color4,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                onTap: (){},
              )
            ],
          ),
        ),
      ),
    );
  }
}

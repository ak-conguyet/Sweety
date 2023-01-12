import 'package:flutter/material.dart';
import 'package:sweety/Component/CustomItemGrid.dart';
import 'package:sweety/Component/CustomItemSearch.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Row(
          children: [
            Expanded(
              child:Card(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Please type the keyword',
                      hintStyle: TextStyle(
                          fontSize: 12
                      ),
                      contentPadding: EdgeInsets.all(5)
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: (){},
                icon: const Icon(Icons.search)
            )
          ],
        ),
      ),
      body: SafeArea(
        child: CustomItemGrid()
      ),
    );
  }

}

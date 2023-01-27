import 'package:flutter/material.dart';
import 'package:sweety/Component/CustomBloc.dart';
import 'package:sweety/Component/CustomItemGrid.dart';
import 'package:sweety/Component/CustomItemSearch.dart';
import 'package:sweety/SearchBloc/SearchBloc.dart';
import 'package:sweety/SearchBloc/SearchEvent.dart';
import 'package:sweety/SearchBloc/SearchState.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final SeachBloc _bloc = SeachBloc();
  final TextEditingController _controller = TextEditingController();

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
                  controller: _controller,
                  decoration: const InputDecoration(
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
                onPressed: (){
                  _bloc.add(SearchEvent(_controller.text));
                },
                icon: const Icon(Icons.search)
            )
          ],
        ),
      ),
      body: SafeArea(
        child: _BodyBuild(
          bloc: _bloc,
        )
      ),
    );
  }

}

class _BodyBuild extends CustomBloc<SeachBloc,SearchState>{
  _BodyBuild({required super.bloc});

  @override
  void listener(BuildContext context, SearchState state) {

  }

  @override
  Widget stateBuilder(SearchState state) {
    if(state == SearchState.Initical){
      return SafeArea(child: Container());
    }

    if(state == SearchState.Loading){
      return const Center(
        child: CircularProgressIndicator()
      );
    }

    if(state == SearchState.Successful){
      return CustomItemGrid(bloc.products);
    }

    return Center(
      child: Text(
        'Failure'
      ),
    );

  }
}

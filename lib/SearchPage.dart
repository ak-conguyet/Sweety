import 'package:flutter/material.dart';
import 'package:sweety/Component/CustomBloc.dart';
import 'package:sweety/Component/CustomItemGrid.dart';
import 'package:sweety/Component/CustomItemSearch.dart';
import 'package:sweety/SearchBloc/SearchBloc.dart';
import 'package:sweety/SearchBloc/SearchEvent.dart';
import 'package:sweety/SearchBloc/SearchState.dart';

class SearchPage extends StatefulWidget {
  const SearchPage(this.value,{Key? key}) : super(key: key);
  final String value;

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
        title: Text(
          'Result for: ${widget.value} '
        ),
      ),
      body: SafeArea(
        child: _BodyBuild(
          widget.value,
          bloc: _bloc,
        )
      ),
    );
  }

}

class _BodyBuild extends CustomBloc<SeachBloc,SearchState>{
  _BodyBuild(this.value,{required super.bloc});
  final String value;

  @override
  void listener(BuildContext context, SearchState state) {

  }

  @override
  Widget stateBuilder(SearchState state) {
    if(state == SearchState.Initical){
      bloc.add(SearchEvent(value));
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

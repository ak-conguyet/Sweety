
import 'package:flutter/material.dart';
import 'package:sweety/Component/CustomBloc.dart';
import 'package:sweety/Component/CustomFavoriteItem.dart';
import 'package:sweety/Component/LoadingSc.dart';
import 'package:sweety/FavoriteBloc/FavoriteBloc.dart';
import 'package:sweety/FavoriteBloc/FavoriteEvent.dart';
import 'package:sweety/FavoriteBloc/FavoriteState.dart';
import 'package:sweety/Models/Products.dart';

class FavoritePage extends CustomBloc<FavoriteBloc,FavoriteState>{
  FavoritePage({super.key}) : super(bloc: FavoriteBloc());

  @override
  void listener(BuildContext context, FavoriteState state) {
    // TODO: implement listener
  }

  @override
  Widget stateBuilder(FavoriteState state) {
    if(state is Favorite_Initical){
      bloc.add(Favorite_request());
      return LoadingAni();
    }

    if(state is Favorite_Loading){
      return LoadingAni();
    }

    if(state is Favorite_Successful){
      return _buildBody(state.products);
    }

    return Scaffold(
      body: Center(
        child: Text(
            'Failure'
        ),
      ),
    );
  }

  Widget _buildBody(List<Product> products){
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context,index){
          return CustomFavoriteItem(
              products[index],
              parentBloc: bloc,
          );
        },
      )
    );
  }

}

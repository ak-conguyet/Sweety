

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweety/HomeBloc/CategoryEvent.dart';
import 'package:sweety/Models/Categories.dart';

import 'CategoryState.dart';

class CategoryBloc extends Bloc<CategoryEvent,CategoryState>{
  CategoryBloc():super(CategoryState.Initical){
    on((event, emit){
      switch(event){
        case CategoryEvent.request:
        _request();
        return;
      }
    });
  }

  List<Category> categories = [
    Category(id: '1', name: 'Cake', img: 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimg1.cookinglight.timeinc.net%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F4_3_horizontal_-_1200x900%2Fpublic%2F1542062283%2Fchocolate-and-cream-layer-cake-1812-cover.jpg%3Fitok%3DR_xDiShk'),
    Category(id: '2', name: 'Cupcake', img: 'https://www.recipetineats.com/wp-content/uploads/2020/09/Vanilla-Cupcakes-with-Vanilla-Swiss-Meringue-SQ.jpg'),
    Category(id: '3', name: 'Crepe', img: 'https://www.onceuponachef.com/images/2022/07/Crepes.jpg'),
    Category(id: '4', name: 'Croissant', img: 'https://bizweb.dktcdn.net/100/438/465/files/croissant.jpg?v=1663636478509'),
    Category(id: '5', name: 'Tea', img: 'https://www.selecta.com/.imaging/mte/selecta/lg/dam/stories/Tea-blog/Tea-General.jpg/jcr:content/Tea%20General.jpg'),
    Category(id: '6', name: 'Coffe', img: 'http://enjoycoffee.vn/wp-content/uploads/2020/01/coffee.2-810x524-1.jpg'),
  ];

  void _request() async{
    emit(CategoryState.Loading);
    await Future.delayed(Duration(seconds: 2));
    emit(CategoryState.Successful);
  }

}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweety/FavoriteBloc/FavoriteEvent.dart';
import 'package:sweety/FavoriteBloc/FavoriteState.dart';
import 'package:sweety/Models/Products.dart';

class FavoriteBloc extends Bloc<FavoriteEvent,FavoriteState>{

  List<Product> products = [
    Product(
      id: '1',
      name: 'Donut',
      description: 'It is popular in many countries and is prepared in various forms as a sweet snack that can be homemade or purchased in bakeries, supermarkets, food stalls, and franchised specialty vendors. Doughnut is the traditional spelling, while donut is the simplified version; the terms are used interchangeably.',
      sizeOtp: ['S','M','L'],
      otp: ['Chocolate','Strawbery','Orange'],
      calories: '69',
      time: '20 - 30 minute',
      rating: 4.3,
      prices: 6.8,
      isFavorite: true,
      image: 'http://file.hstatic.net/1000396324/article/banh-donut-socola-2_987c680f3a634f5dbd776a01a1969a3e_1024x1024.jpg',
    ),
    Product(
      id: '2',
      name: 'Kitkat',
      description: 'Kit Kat (stylised as KitKat in various countries) is a chocolate-covered wafer bar confection created by Rowntree\'s of York, United Kingdom, and is now produced globally by Nestlé (which acquired Rowntree\'s in 1988),[1] except in the United States, where it is made under licence by the H. B. Reese Candy Company, a division of the Hershey Company (an agreement Rowntree\'s first made with Hershey in 1970).[2]',
      sizeOtp: ['S','M','L'],
      otp: ['Chocolate','Strawbery','Orange'],
      calories: '69',
      time: '20 - 30 minute',
      rating: 3.5,
      prices: 6.8,
      isFavorite: true,
      image: 'https://glutenfreecuppatea.co.uk/wp-content/uploads/2020/01/gluten-free-kit-kat-bunny-cupcakes-easter-recipe-featured.jpg',
    ),
    Product(
      id: '3',
      name: 'Mochi',
      description: 'Mochi (もち, 餅) is a Japanese rice cake made of mochigome (もち米), a short-grain japonica glutinous rice, and sometimes other ingredients such as water, sugar, and cornstarch. The rice is pounded into paste and molded into the desired shape. In Japan, it is traditionally made in a ceremony called mochitsuki (餅搗き).[1] While eaten year-round, mochi is a traditional food for the Japanese New Year, and is commonly sold and eaten during that time.',
      sizeOtp: ['S','M','L'],
      otp: ['Chocolate','Strawbery','Orange'],
      calories: '69',
      time: '20 - 30 minute',
      rating: 3.4,
      prices: 6.8,
      isFavorite: true,
      image: 'http://pm1.narvii.com/6035/041d377ca5e3957972ff538a2882434847ef20d3_00.jpg',
    ),
    Product(
      id: '4',
      name: 'Tiramisu',
      description: 'Tiramisu (Italian: tiramisù [ˌtiramiˈsu], from tirami su, "pick me up" or "cheer me up")[1] is a coffee-flavoured Italian dessert. It is made of ladyfingers (savoiardi) dipped in coffee, layered with a whipped mixture of eggs, sugar, and mascarpone cheese, flavoured with cocoa. The recipe has been adapted into many varieties of cakes and other desserts.[2] Its origins are often disputed among Italian regions Veneto and Friuli Venezia Giulia.',
      sizeOtp: ['S','M','L'],
      otp: ['Chocolate','Strawbery','Orange'],
      calories: '69',
      time: '20 - 30 minute',
      rating: 4.3,
      prices: 6.8,
      isFavorite: true,
      image: 'http://cdn.shopify.com/s/files/1/1725/5449/articles/Tiramisu_60d36fa2-d8fb-4547-9628-02a5ba32dd05_1200x1200.png?v=1660728388',
    ),
    Product(
      id: '5',
      name: 'Macaron',
      description: 'The macaron has been introduced in France by the Italian chef of queen Catherine de Medici during the Renaissance. Since the 19th century, a typical Parisian-style macaron is presented with a ganache, buttercream or jam filling sandwiched between two such cookies, akin to a sandwich cookie. The confection is characterized by a smooth squared top, a ruffled circumference—referred to as the "crown" or "foot" (or "pied")—and a flat base. It is mildly moist and easily melts in the mouth. Macarons can be found in a wide variety of flavours that range from traditional (raspberry, chocolate) to unusual (foie gras, matcha).',
      sizeOtp: ['S','M','L'],
      otp: ['Chocolate','Strawbery','Orange'],
      calories: '69',
      time: '20 - 30 minute',
      rating: 3.4,
      prices: 6.8,
      isFavorite: true,
      image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Brigitte_Tohm_2016-10-10_%28Unsplash%29.jpg/1200px-Brigitte_Tohm_2016-10-10_%28Unsplash%29.jpg',
    ),
  ];

  FavoriteBloc():super(Favorite_Initical()){
    on<Favorite_request>((event, emit) => _request());
  }

  void _request() async{
    emit(Favorite_Loading());

    await Future.delayed(Duration(seconds: 2));

    emit(Favorite_Successful(products));

  }

  void removeProduct(String id){
    products.removeAt(products.indexWhere((element) => element.id == id));
  }
}
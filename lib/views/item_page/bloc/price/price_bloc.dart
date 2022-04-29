// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:fruit_store_app/controllers/home_page_controller.dart';
// import 'package:fruit_store_app/models/product.dart';

// part 'price_event.dart';
// part 'price_state.dart';

// final _controller = HomePageController();

// List<Product> get fruitsList => _controller.fruitsList;

// class PriceBloc extends Bloc<PriceEvent, PriceState> {
//   PriceBloc() : super(PriceState(product: fruitsList)) {
//     on<IncrementPrice>((event, emit) {
//       final myProducts = state.product;
//       Product currentProduct =
//           myProducts.where((element) => element.name == event.name) as Product;

//       myProducts.elementAt(myProducts.indexOf(currentProduct)).qtdd++;

//       emit(state.copyWith(product: myProducts));
//     });

//     on<DecrementPrice>((event, emit) {
//       final myProducts = state.product;
//       Product currentProduct =
//           myProducts.where((element) => element.name == event.name) as Product;

//       myProducts.elementAt(myProducts.indexOf(currentProduct)).qtdd--;

//       emit(state.copyWith(product: myProducts));
//     });
//   }
// }

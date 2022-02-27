import 'package:bloc/bloc.dart';
import 'package:fruit_store_app/controllers/home_page_controller.dart';
import 'package:fruit_store_app/models/product.dart';

part 'price_event.dart';
part 'price_state.dart';

final _controller = HomePageController();

List<Product> get fruitsList => _controller.fruitsList;

class PriceBloc extends Bloc<PriceEvent, PriceState> {
  PriceBloc() : super(PriceState(product: fruitsList, index: 0)) {
    on<ChangePrice>((event, emit) {
      List<Product> productList = _controller.fruitsList;
      productList[event.index] = event.product;

      emit(PriceState(product: productList, index: event.index));
    });
  }
}

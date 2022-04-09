import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_store_app/models/catalog.dart';
import 'package:fruit_store_app/repositories/shopping_repository.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final ShoppingRepository shoppingRepository;

  CatalogBloc({required this.shoppingRepository}) : super(CatalogLoading()) {
    on<CatalogStarted>((event, emit) async {
      emit(CatalogLoading());
      try {
        final catalog = await shoppingRepository.loadCatalog();
        emit(CatalogLoaded(Catalog(itemNames: catalog)));
      } catch (e) {
        emit(CatalogError());
      }
    });
  }
}

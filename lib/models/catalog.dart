import 'package:equatable/equatable.dart';
import 'package:fruit_store_app/models/product.dart';

class Catalog extends Equatable {
  final List<String> itemNames;

  const Catalog({required this.itemNames});

  Product getById(int id) => Product(
        id: id,
        name: itemNames[id % itemNames.length],
      );

  Product getByPosition(int position) => getById(position);

  @override
  List<Object?> get props => [itemNames];
}

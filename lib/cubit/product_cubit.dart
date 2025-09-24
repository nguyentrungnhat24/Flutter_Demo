import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product.dart';

class ProductState {
  final Product product;
  final int quantity;
  final bool isLiked;

  ProductState({
    required this.product,
    this.quantity = 1,
    this.isLiked = false,
  });

  ProductState copyWith({Product? product, int? quantity, bool? isLiked}) {
    return ProductState(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(Product product) : super(ProductState(product: product));

  void increaseQuantity() {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  void decreaseQuantity() {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  void toggleLike() {
    emit(state.copyWith(isLiked: !state.isLiked));
  }
}

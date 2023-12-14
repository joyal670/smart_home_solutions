import 'package:apaniot/presentation/dashboard/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/* --------------------------------------------------------------------------------------  */
// state

class ProductDetailsBlocState {
  bool isLoading;
  List<aModel> images;
  int currentImageIndex;
  dModel data;
  bool isError;
  List<aModel> colors;
  List<aModel> sizes;
  int qty;

  ProductDetailsBlocState({
    required this.isLoading,
    required this.images,
    required this.isError,
    required this.currentImageIndex,
    required this.data,
    required this.colors,
    required this.sizes,
    required this.qty,
  });

  factory ProductDetailsBlocState.initial() => ProductDetailsBlocState(
        isLoading: true,
        images: [],
        isError: false,
        currentImageIndex: 0,
        data: dModel(title: '', price: '', image: '', rating: '', discount: ''),
        colors: [],
        sizes: [],
        qty: 1,
      );
}

/* --------------------------------------------------------------------------------------  */
// events

abstract class ProductDetailsEvent {}

class GetDetails extends ProductDetailsEvent {
  final dModel model;

  GetDetails({required this.model});
}

class OnClickImage extends ProductDetailsEvent {
  final int index;

  OnClickImage({required this.index});
}

class OnClickColor extends ProductDetailsEvent {
  final int index;

  OnClickColor({required this.index});
}

class OnClickSize extends ProductDetailsEvent {
  final int index;

  OnClickSize({required this.index});
}

class OnClickAddCart extends ProductDetailsEvent {}

class OnClickRemoveCart extends ProductDetailsEvent {}

/* --------------------------------------------------------------------------------------  */
// bloc
class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsBlocState> {
  ProductDetailsBloc() : super(ProductDetailsBlocState.initial()) {
    on<GetDetails>((event, emit) async {
      // loading
      emit(ProductDetailsBlocState(
        isLoading: true,
        images: [],
        isError: false,
        currentImageIndex: 0,
        data: dModel(title: '', price: '', image: '', rating: '', discount: ''),
        colors: [],
        sizes: [],
        qty: 1,
      ));

      List<aModel> imageList = [];
      print(event.model.image);
      imageList.add(aModel(name: event.model.image, isSelected: true));
      imageList.add(aModel(
          name: 'http://apaniot.com/images/virtuemart/product/162.jpg',
          isSelected: false));
      imageList.add(aModel(
          name: 'http://apaniot.com/images/virtuemart/product/551.jpg',
          isSelected: false));
      imageList.add(aModel(
          name: 'http://apaniot.com/images/virtuemart/product/88.jpg',
          isSelected: false));
      imageList.add(aModel(
          name: 'http://apaniot.com/images/virtuemart/product/118.jpg',
          isSelected: false));
      imageList.add(aModel(
          name: 'http://apaniot.com/images/virtuemart/product/162.jpg',
          isSelected: false));
      imageList.add(aModel(
          name: 'http://apaniot.com/images/virtuemart/product/551.jpg',
          isSelected: false));
      imageList.add(aModel(
          name: 'http://apaniot.com/images/virtuemart/product/551.jpg',
          isSelected: false));
      imageList.add(aModel(
          name: 'http://apaniot.com/images/virtuemart/product/162.jpg',
          isSelected: true));
      imageList.add(aModel(
          name: 'http://apaniot.com/images/virtuemart/product/551.jpg',
          isSelected: false));
      imageList.add(aModel(
          name: 'http://apaniot.com/images/virtuemart/product/88.jpg',
          isSelected: false));
      imageList.add(aModel(
          name: 'http://apaniot.com/images/virtuemart/product/118.jpg',
          isSelected: false));
      imageList.add(aModel(
          name: 'http://apaniot.com/images/virtuemart/product/162.jpg',
          isSelected: false));
      imageList.add(aModel(
          name: 'http://apaniot.com/images/virtuemart/product/551.jpg',
          isSelected: false));

      List<aModel> colorList = [];
      colorList.add(aModel(name: '0xFF9CCC65', isSelected: true));
      colorList.add(aModel(name: '0xFFFFEBEE', isSelected: false));
      colorList.add(aModel(name: '0xFFFFF8E1', isSelected: false));
      colorList.add(aModel(name: '0xFF0097A7', isSelected: false));

      List<aModel> sizesList = [];
      sizesList.add(aModel(name: 'US 6', isSelected: true));
      sizesList.add(aModel(name: 'US 7', isSelected: false));
      sizesList.add(aModel(name: 'US 8', isSelected: false));
      sizesList.add(aModel(name: 'US 9', isSelected: false));

      emit(
        ProductDetailsBlocState(
          isLoading: false,
          images: imageList,
          isError: false,
          currentImageIndex: 0,
          data: event.model,
          colors: colorList,
          sizes: sizesList,
          qty: 1,
        ),
      );
    });

    on<OnClickImage>((event, emit) async {
      for (var element in state.images) {
        element.isSelected = false;
      }
      state.images[event.index].isSelected = true;

      // result
      emit(ProductDetailsBlocState(
        isLoading: false,
        images: state.images,
        isError: false,
        currentImageIndex: event.index,
        data: state.data,
        colors: state.colors,
        sizes: state.sizes,
        qty: state.qty,
      ));
    });

    on<OnClickColor>((event, emit) async {
      for (var element in state.colors) {
        element.isSelected = false;
      }
      state.colors[event.index].isSelected = true;

      // result
      emit(ProductDetailsBlocState(
        isLoading: false,
        images: state.images,
        isError: false,
        currentImageIndex: state.currentImageIndex,
        data: state.data,
        colors: state.colors,
        sizes: state.sizes,
        qty: state.qty,
      ));
    });

    on<OnClickSize>((event, emit) async {
      for (var element in state.sizes) {
        element.isSelected = false;
      }
      state.sizes[event.index].isSelected = true;

      // result
      emit(ProductDetailsBlocState(
        isLoading: false,
        images: state.images,
        isError: false,
        currentImageIndex: state.currentImageIndex,
        data: state.data,
        colors: state.colors,
        sizes: state.sizes,
        qty: state.qty,
      ));
    });

    on<OnClickAddCart>((event, emit) {
      int currentQty = state.qty;
      currentQty++;
      // result
      emit(ProductDetailsBlocState(
        isLoading: false,
        images: state.images,
        isError: false,
        currentImageIndex: state.currentImageIndex,
        data: state.data,
        colors: state.colors,
        sizes: state.sizes,
        qty: currentQty,
      ));
    });

    on<OnClickRemoveCart>((event, emit) {
      int currentQty = state.qty;
      currentQty--;
      if (currentQty <= 1) currentQty = 1;
      // result
      emit(ProductDetailsBlocState(
        isLoading: false,
        images: state.images,
        isError: false,
        currentImageIndex: state.currentImageIndex,
        data: state.data,
        colors: state.colors,
        sizes: state.sizes,
        qty: currentQty,
      ));
    });
  }
}

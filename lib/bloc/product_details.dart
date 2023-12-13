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

  ProductDetailsBlocState({
    required this.isLoading,
    required this.images,
    required this.isError,
    required this.currentImageIndex,
    required this.data,
    required this.colors,
  });

  factory ProductDetailsBlocState.initial() => ProductDetailsBlocState(
      isLoading: true,
      images: [],
      isError: false,
      currentImageIndex: 0,
      data: dModel(title: '', price: '', image: '', rating: '', discount: ''),
      colors: []);
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
          data:
              dModel(title: '', price: '', image: '', rating: '', discount: ''),
          colors: []));

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

      emit(
        ProductDetailsBlocState(
            isLoading: false,
            images: imageList,
            isError: false,
            currentImageIndex: 0,
            data: event.model,
            colors: colorList),
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
          colors: state.colors));
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
          colors: state.colors));
    });
  }
}

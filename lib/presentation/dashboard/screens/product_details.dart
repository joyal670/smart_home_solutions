// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apaniot/presentation/dashboard/home/homepage.dart';
import 'package:apaniot/utils/colors.dart';
import 'package:apaniot/utils/common_widgets.dart';
import 'package:apaniot/utils/dims.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../bloc/product_details.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.data});

  final dModel data;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductDetailsBloc>(context).add(
      GetDetails(model: data),
    );

    ItemScrollController _scrollController = ItemScrollController();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: colorBlue,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Added to cart"),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  label: "Dismiss",
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  textColor: colorOrange,
                ),
              ),
            );
          },
          child: Icon(
            Icons.add_shopping_cart_outlined,
            color: colorWhite,
          ),
        ),
        backgroundColor: colorWildSand2,
        body: BlocBuilder<ProductDetailsBloc, ProductDetailsBlocState>(
          builder: (BuildContext ctx, state) {
            if (state.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                color: Colors.transparent,
                child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxScrolled) {
                      return [
                        AppbarWidget(
                          scrollController: _scrollController,
                          state: state,
                        )
                      ];
                    },
                    body: ListView(
                      padding: EdgeInsets.all(10),
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextWidget(
                                title: state.data.title,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                )),
                            width15,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextWidget(
                                          title: '\$',
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: colorRed,
                                            fontSize: 20,
                                          )),
                                      width5,
                                      TextWidget(
                                          title: state.data.price,
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          )),
                                    ],
                                  ),
                                  RatingBar.builder(
                                    initialRating:
                                        double.parse(state.data.rating),
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 15,
                                    ignoreGestures: true,
                                    // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: colorBlue,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            width15
                          ],
                        ),
                        height20,
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                BlocProvider.of<ProductDetailsBloc>(context)
                                    .add(
                                  OnClickRemoveCart(),
                                );
                              },
                              icon: Icon(
                                Icons.remove,
                              ),
                              iconSize: 20,
                            ),
                            Container(
                                width: 40,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: colorGrey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:
                                    Center(child: Text(state.qty.toString()))),
                            IconButton(
                              onPressed: () {
                                BlocProvider.of<ProductDetailsBloc>(context)
                                    .add(
                                  OnClickAddCart(),
                                );
                              },
                              icon: Icon(Icons.add),
                              iconSize: 20,
                            )
                          ],
                        ),
                        height20,
                        TextWidget(
                          title: 'Availabe sizes',
                          textStyle: TextStyle(
                              color: colorBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        height10,
                        SizedBox(
                          height: 40,
                          child: SizeWidget(
                            state: state,
                          ),
                        ),
                        height20,
                        TextWidget(
                          title: 'Color',
                          textStyle: TextStyle(
                              color: colorBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        height10,
                        SizedBox(
                          height: 30,
                          child: ColorWidget(
                            state: state,
                          ),
                        ),
                        height20,
                        TextWidget(
                          title: 'Description',
                          textStyle: TextStyle(
                              color: colorBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        height10,
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                          style: TextStyle(
                            letterSpacing: 1,
                            wordSpacing: 2,
                          ),
                        )
                      ],
                    )),
              );
            }
          },
        ));
  }
}

class ColorWidget extends StatelessWidget {
  final ProductDetailsBlocState state;
  const ColorWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: state.colors.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext ctx, index) {
          return SizedBox(
            width: 50,
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<ProductDetailsBloc>(context).add(
                  OnClickColor(index: index),
                );
              },
              style: ElevatedButton.styleFrom(
                // fixedSize: const Size(10, 10),
                // maximumSize: Size(30, 50),
                backgroundColor: Color(int.parse(state.colors[index].name)),
                shape: CircleBorder(),
                padding: EdgeInsets.all(0),
              ),
              child: state.colors[index].isSelected
                  ? Icon(
                      Icons.task_alt,
                      size: 17,
                      color: colorBlue,
                    )
                  : null,
            ),
          );
        });
  }
}

class SizeWidget extends StatelessWidget {
  final ProductDetailsBlocState state;
  const SizeWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: state.sizes.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext ctx, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              height: 15,
              child: OutlinedButton(
                onPressed: () {
                  BlocProvider.of<ProductDetailsBloc>(context).add(
                    OnClickSize(index: index),
                  );
                },
                style: ElevatedButton.styleFrom(
                    //  fixedSize: const Size(20, 10),
                    backgroundColor:
                        state.sizes[index].isSelected ? colorBlue : colorWhite,
                    side: BorderSide(color: colorMobyDick),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                child: Text(
                  state.sizes[index].name,
                  style: TextStyle(
                      color: state.sizes[index].isSelected
                          ? colorWhite
                          : colorBlack),
                ),
              ),
            ),
          );
        });
  }
}

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    Key? key,
    required ItemScrollController scrollController,
    required ProductDetailsBlocState state,
  })  : _scrollController = scrollController,
        _state = state,
        super(key: key);

  final ItemScrollController _scrollController;
  final ProductDetailsBlocState _state;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: colorWildSand,
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(color: colorBlack),
      toolbarHeight: 70,
      leading: IconButton.outlined(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(colorWildSand2),
            side: MaterialStatePropertyAll(BorderSide(color: colorGrey))),
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context, false),
      ),
      expandedHeight: 500.0,
      floating: false,
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var top = constraints.biggest.height;

          return FlexibleSpaceBar(
            centerTitle: false,
            collapseMode: CollapseMode.parallax,
            stretchModes: [
              StretchMode.blurBackground,
              StretchMode.fadeTitle,
              StretchMode.zoomBackground,
            ],
            background: Image.network(
              _state.images[_state.currentImageIndex].name,
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
            titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            title: _buildThumbnailList(top),
          );
        },
      ),
      actions: [
        CircleAvatar(
          radius: 20,
          backgroundColor: colorWhite,
          child: IconButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(colorWildSand2),
            ),
            icon: const Icon(
              Icons.favorite_border,
              color: colorRed,
            ),
            onPressed: () {},
          ),
        ),
        width15,
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          decoration: BoxDecoration(
            color: colorWildSand2,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Center(
            child: Container(
              width: 60,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: colorGrey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnailList(double top) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 100),
      opacity: top > 0 && top < 300 ? 0.0 : 1.0,
      child: top > 0 && top < 300
          ? const SizedBox()
          : SizedBox(
              height: 50,
              child: ScrollablePositionedList.builder(
                itemScrollController: _scrollController,
                itemCount: _state.images.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      BlocProvider.of<ProductDetailsBloc>(context).add(
                        OnClickImage(index: index),
                      );
                    },
                    child: Container(
                      width: 35,
                      height: 40,
                      clipBehavior: Clip.hardEdge,
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: colorWhite,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: _state.images[index].isSelected
                              ? colorBlue
                              : colorMobyDick,
                        ),
                      ),
                      child: Image.network(
                        _state.images[index].name,
                        width: 40,
                        height: 35,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

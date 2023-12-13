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
                          child: ListView.builder(
                              itemCount: state.colors.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext ctx, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: SizedBox(
                                    height: 20,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        BlocProvider.of<ProductDetailsBloc>(
                                                context)
                                            .add(
                                          OnClickColor(index: index),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(int.parse(
                                              state.colors[index].name)),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                      child: state.colors[index].isSelected
                                          ? Icon(Icons.task_alt)
                                          : null,
                                    ),
                                  ),
                                );
                              }),
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
                          height: 50,
                          child: ListView.builder(
                              itemCount: state.colors.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext ctx, index) {
                                return ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<ProductDetailsBloc>(context)
                                        .add(
                                      OnClickColor(index: index),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(10, 10),
                                    backgroundColor: Color(
                                        int.parse(state.colors[index].name)),
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(0),
                                  ),
                                  child: state.colors[index].isSelected
                                      ? Icon(Icons.task_alt)
                                      : null,
                                );
                              }),
                        )
                      ],
                    )),
              );
            }
          },
        ));
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
      leading: IconButton.outlined(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(colorWildSand2),
        ),
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
                              ? colorBlack
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

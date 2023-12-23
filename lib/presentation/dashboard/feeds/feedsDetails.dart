// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:apaniot/presentation/dashboard/feeds/newfeeds.dart';
import 'package:apaniot/utils/dims.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/common_widgets.dart';

class FeedsDetails extends StatelessWidget {
  FeedsDetails({super.key, required this.data});
  final Model data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Container(
        color: Colors.transparent,
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: colorWildSand,
                  automaticallyImplyLeading: true,
                  iconTheme: const IconThemeData(color: colorBlack),
                  leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context, false)),
                  expandedHeight: 300.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    background: Hero(
                      tag: data,
                      child: Image.network(
                        data.image,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  actions: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: colorWhite,
                      child: IconButton(
                        icon: Icon(
                          Icons.bookmark_outline,
                          color: colorBlack,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    width15
                  ],
                  bottom: PreferredSize(
                      preferredSize: Size.fromHeight(20),
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                            color: colorWhite,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            )),
                      )),
                )
              ];
            },
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  TextWidget(
                    title: data.sub.toUpperCase(),
                    textStyle: TextStyle(
                      fontSize: 10,
                      color: colorBlue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  height3,
                  TextWidget(
                    title: data.title,
                    textStyle: TextStyle(
                        fontSize: 17,
                        color: colorBlack,
                        fontWeight: FontWeight.bold),
                  ),
                  height3,
                  Row(
                    children: [
                      width10,
                      Icon(
                        Icons.date_range,
                        color: colorGrey,
                        size: 18,
                      ),
                      width5,
                      Text(
                        data.date,
                        style: TextStyle(
                          color: colorGrey,
                          fontSize: 13,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.thumb_up_outlined,
                            color: colorGrey,
                            size: 16,
                          ),
                          width5,
                          Text(
                            data.like,
                            style: TextStyle(
                              color: colorGrey,
                              fontSize: 13,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      width10
                    ],
                  ),
                  height25,
                  TextWidget(
                    title:
                        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum. Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi. Curabitur ligula sapien, tincidunt non, euismod vitae, posuere imperdiet, leo. Maecenas malesuada. Praesent congue erat at massa. Sed cursus turpis vitae tortor. Donec posuere vulputate arcu. Phasellus accumsan cursus velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac placerat dolor lectus quis orci. Phasellus consectetuer vestibulum elit. Aenean tellus metus, bibendum sed, posuere ac, mattis non, nunc. Vestibulum fringilla pede sit amet augue. In turpis. Pellentesque posuere. Praesent turpis. Aenean posuere, tortor sed cursus feugiat, nunc augue blandit nunc, eu sollicitudin urna dolor sagittis lacus. Donec elit libero, sodales nec, volutpat a, suscipit non, turpis. Nullam sagittis. Suspendisse pulvinar, augue ac venenatis condimentum, sem libero volutpat nibh, nec pellentesque velit pede quis nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce id purus. Ut varius tincidunt libero. Phasellus dolor. Maecenas vestibulum mollis diam. Pellentesque ut neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dui magna, posuere eget, vestibulum et, tempor auctor, justo. In ac felis quis tortor malesuada pretium. Pellentesque auctor neque nec urna. Proin sapien ipsum, porta a, auctor quis, euismod ut, mi. Aenean viverra rhoncus pede. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut non enim eleifend felis pretium feugiat. Vivamus quis mi. Phasellus a est. Phasellus magna. In hac habitasse platea dictumst. Curabitur at lacus ac velit ornare lobortis. Curabitur a felis in nunc fringilla tristique.',
                    textStyle: TextStyle(
                        fontSize: 13,
                        color: colorGrey,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

// class FeedsDetails extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             toolbarHeight: 80,
//             bottom: PreferredSize(
//               preferredSize: Size.fromHeight(20),
//               child: Container(
//                 width: double.maxFinite,
//                 padding: EdgeInsets.only(
//                   top: 20,
//                   bottom: 10,
//                 ),
//                 decoration: BoxDecoration(
//                     color: colorWhite,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(40),
//                         topRight: Radius.circular(40))),
//                 child: Text(""),
//               ),
//             ),
//             pinned: true,
//             expandedHeight: 350,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Image.network(
//                 'https://images.pexels.com/photos/62389/pexels-photo-62389.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//                 width: double.maxFinite,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Column(
//               children: [
//                 Text(
//                     'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.'),
//                 Text(
//                     'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.'),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class FeedsDetails extends StatelessWidget {
//   const FeedsDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: colorWhite,
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 350,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text(
//                 "",
//                 style: TextStyle(color: colorBlack),
//               ),
//               background: Stack(
//                 children: [
//                   Positioned.fill(
//                     child: Image.network(
//                       'http://apaniot.com/cache/resized/26fb2c72a9468b1d5f7acb26129437e6.jpg',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Positioned(
//                     child: Container(
//                       height: 50,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.vertical(
//                           top: Radius.circular(40),
//                         ),
//                       ),
//                     ),
//                     bottom: -2,
//                     left: 0,
//                     right: 0,
//                   )
//                 ],
//               ),
//             ),
//             actions: [
//               IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.bookmark_outline,
//                     color: colorBlack,
//                     size: 25,
//                   )),
//             ],
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               decoration: BoxDecoration(
//                   color: colorAmber,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(40),
//                       topRight: Radius.circular(40))),
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: List<int>.generate(20, (index) => index)
//                     .map((index) => Container(
//                           height: 40,
//                           margin: EdgeInsets.symmetric(vertical: 10),
//                           color: Colors.grey[300],
//                           alignment: Alignment.center,
//                           child: Text('$index item'),
//                         ))
//                     .toList(),
//               ),
//             ),
//           ),

//           // SliverList(
//           //     delegate: SliverChildBuilderDelegate((context, index) {
//           //   return Column(
//           //     children: [
//           //       TextWidget(
//           //           title: "dsfdfsdd", textStyle: TextStyle(color: colorBlack))
//           //     ],
//           //   );
//           // }, childCount: 60))
//           // SliverFillRemaining(
//           //   child: SingleChildScrollView(
//           //     physics: NeverScrollableScrollPhysics(),
//           //     child: Container(
//           //       clipBehavior: Clip.hardEdge,
//           //       decoration: BoxDecoration(
//           //           borderRadius: BorderRadius.only(
//           //               topLeft: Radius.circular(40),
//           //               topRight: Radius.circular(40))),
//           //       child: Column(
//           //         children: List<int>.generate(20, (index) => index)
//           //             .map((index) => Container(
//           //                   height: 40,
//           //                   margin: EdgeInsets.symmetric(vertical: 10),
//           //                   color: Colors.grey[300],
//           //                   alignment: Alignment.center,
//           //                   child: Text('$index item'),
//           //                 ))
//           //             .toList(),
//           //       ),
//           //     ),
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }

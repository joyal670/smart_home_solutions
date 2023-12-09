// ignore_for_file: prefer_const_constructors

import 'package:apaniot/utils/common_widgets.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../utils/colors.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});

  final List<String> images = [
    "https://plus.unsplash.com/premium_photo-1661883964999-c1bcb57a7357?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c21hcnQlMjBob21lfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1558002038-1055907df827?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c21hcnQlMjBob21lfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1545259741-2ea3ebf61fa3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c21hcnQlMjBob21lfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1514803400321-3ca29fc47334?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1663090151769-ef8c1bb6465a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1633194883650-df448a10d554?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjd8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1565620731358-e8c038abc8d1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/flagged/photo-1573168710465-7f7da9a23a15?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1663090042792-ee54547ef415?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDF8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3Dg",
    "https://images.unsplash.com/photo-1556922404-e13d9ff95de8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1663091913481-130b550baf57?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDl8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1623970440870-9e0935f7d08b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDh8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1619140099965-06d74aaf51fa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1606812667169-0e1991ed3742?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTZ8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1687558246422-e94f0864d467?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjF8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1593784991188-c899ca07263b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1688678097958-0620a452f0e8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjV8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1621647861321-82eee5143ce3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1530545002211-21753020f4c8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzJ8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1661883964999-c1bcb57a7357?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c21hcnQlMjBob21lfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1558002038-1055907df827?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c21hcnQlMjBob21lfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1545259741-2ea3ebf61fa3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c21hcnQlMjBob21lfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1514803400321-3ca29fc47334?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1663090151769-ef8c1bb6465a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1633194883650-df448a10d554?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjd8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1565620731358-e8c038abc8d1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/flagged/photo-1573168710465-7f7da9a23a15?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1663090042792-ee54547ef415?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDF8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3Dg",
    "https://images.unsplash.com/photo-1556922404-e13d9ff95de8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1663091913481-130b550baf57?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDl8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1623970440870-9e0935f7d08b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDh8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1619140099965-06d74aaf51fa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1606812667169-0e1991ed3742?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTZ8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1687558246422-e94f0864d467?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjF8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1593784991188-c899ca07263b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1688678097958-0620a452f0e8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjV8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1621647861321-82eee5143ce3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1530545002211-21753020f4c8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzJ8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1661883964999-c1bcb57a7357?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c21hcnQlMjBob21lfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1558002038-1055907df827?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c21hcnQlMjBob21lfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1545259741-2ea3ebf61fa3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c21hcnQlMjBob21lfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1514803400321-3ca29fc47334?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1663090151769-ef8c1bb6465a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1633194883650-df448a10d554?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjd8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1565620731358-e8c038abc8d1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/flagged/photo-1573168710465-7f7da9a23a15?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1663090042792-ee54547ef415?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDF8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3Dg",
    "https://images.unsplash.com/photo-1556922404-e13d9ff95de8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1663091913481-130b550baf57?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDl8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1623970440870-9e0935f7d08b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDh8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1619140099965-06d74aaf51fa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1606812667169-0e1991ed3742?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTZ8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1687558246422-e94f0864d467?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjF8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1593784991188-c899ca07263b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1688678097958-0620a452f0e8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjV8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1621647861321-82eee5143ce3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1530545002211-21753020f4c8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzJ8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1661883964999-c1bcb57a7357?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c21hcnQlMjBob21lfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1558002038-1055907df827?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c21hcnQlMjBob21lfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1545259741-2ea3ebf61fa3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c21hcnQlMjBob21lfGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1514803400321-3ca29fc47334?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1663090151769-ef8c1bb6465a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1633194883650-df448a10d554?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjd8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1565620731358-e8c038abc8d1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/flagged/photo-1573168710465-7f7da9a23a15?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1663090042792-ee54547ef415?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDF8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3Dg",
    "https://images.unsplash.com/photo-1556922404-e13d9ff95de8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1663091913481-130b550baf57?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDl8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1623970440870-9e0935f7d08b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDh8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1619140099965-06d74aaf51fa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1606812667169-0e1991ed3742?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTZ8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1687558246422-e94f0864d467?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjF8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1593784991188-c899ca07263b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1688678097958-0620a452f0e8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjV8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1621647861321-82eee5143ce3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzR8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1530545002211-21753020f4c8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzJ8fHNtYXJ0JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextWidget(
            title: 'Photo gallery'.toUpperCase(),
            textStyle: TextStyle(color: colorBlue, fontSize: 12)),
      ),
      body: GridView.custom(
        padding: EdgeInsets.only(
          bottom: 16,
          left: 16,
          right: 16,
        ),
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 6,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: const [
            QuiltedGridTile(4, 4),
            QuiltedGridTile(2, 2),
            QuiltedGridTile(2, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return InkWell(
            onTap: () {
              MultiImageProvider multiImageProvider = MultiImageProvider(
                  images.map((url) => NetworkImage(url)).toList(),
                  initialIndex: index);

              showImageViewerPager(context, multiImageProvider,
                  onPageChanged: (page) {
                print("page changed to $page");
              }, onViewerDismissed: (page) {
                print("dismissed while on page $page");
              });
            },
            child: Image.network(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        }, childCount: images.length),
      ),
    );
  }
}

import 'package:carousel_pro/carousel_pro.dart';
import 'package:dailypickings/widgets/widget_home_categories.dart';
import 'package:dailypickings/widgets/widget_home_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../config.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.white,
      child: ListView(
        children: [
          imageCarousel(context),
          WidgetCategories(),
          WidgetHomeProducts(labelName: "Offers today!", tagId: Config.offerTagId,),
          WidgetHomeProducts(labelName: "Top sellers!", tagId: Config.topSellingTagId,)
        ],
      ),
      ),
    );
  }

  Widget imageCarousel(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 200.00,
      child: new Carousel(
        overlayShadow: false,
        borderRadius: true,
        boxFit: BoxFit.none,
        autoplay: true,
        dotSize: 4.0,
        images: [
          FittedBox(
            fit: BoxFit.fill,
            child: Image.network("https://jenessastore.dewtech.asia/wp/wp-content/uploads/2021/09/header_photo.2e16d0ba.fill-1200x800-1.jpg"),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Image.network("https://jenessastore.dewtech.asia/wp/wp-content/uploads/2021/09/other-small.jpg"),
          ),
        ],
      ),
    );
  }
}

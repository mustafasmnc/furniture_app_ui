// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:furniture_app_ui/components/title_text.dart';
import 'package:furniture_app_ui/models/categories.dart';
import 'package:furniture_app_ui/models/product.dart';
import 'package:furniture_app_ui/screens/home/components/categories.dart';
import 'package:furniture_app_ui/services/fetch_categories.dart';
import 'package:furniture_app_ui/services/fetch_products.dart';
import 'package:furniture_app_ui/size_config.dart';

import 'recommend_products.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
        child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(defaultSize! * 2), //20
            child: titleText(
              title: "Browse by Categories",
            ),
          ),
          FutureBuilder(
            future: fetchCategories(),
            builder: (context, snapshot) => snapshot.hasData
                ? Categories(categories: snapshot.data as List<Category>)
                : Center(child: Image.asset("assets/ripple.gif")),
          ),
          const Divider(height: 5),
          Padding(
            padding: EdgeInsets.all(defaultSize * 2), //20
            child: titleText(title: "Recommends For You"),
          ),
          FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? RecommandProducts(
                        products: snapshot.data as List<Product>,
                      )
                    : Center(child: Image.asset("assets/ripple.gif"));
              })
        ],
      ),
    ));
  }
}

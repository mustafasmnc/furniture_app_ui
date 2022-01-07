import 'package:flutter/material.dart';
import 'package:furniture_app_ui/models/product.dart';
import 'package:furniture_app_ui/screens/details/components/product_description.dart';
import 'package:furniture_app_ui/screens/details/components/product_info.dart';
import 'package:furniture_app_ui/size_config.dart';

class DetailsBody extends StatelessWidget {
  final Product product;
  const DetailsBody({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    print(SizeConfig.screenHeight);
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.portrait
            ? SizeConfig.screenHeight
            : SizeConfig.screenWidth,
        child: Stack(
          children: [
            ProductInfo(product: product),
            Positioned(
              top: SizeConfig.orientation == Orientation.portrait
                  ? defaultSize! * 47
                  : defaultSize! * 39,
              left: 0,
              right: 0,
              child: ProductDescription(
                product: product,
                press: () {},
              ),
            ),
            Positioned(
              top: SizeConfig.orientation == Orientation.portrait
                  ? defaultSize * 15
                  : defaultSize * 4,
              right: SizeConfig.orientation == Orientation.portrait
                  ? -defaultSize * 2
                  : defaultSize * 8,
              child: Hero(
                tag: product.id!,
                child: Image.network(
                  product.image!,
                  fit: BoxFit.cover,
                  height: defaultSize * 32,
                  width: defaultSize * 31,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

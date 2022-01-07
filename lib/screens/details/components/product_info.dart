import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app_ui/constants.dart';
import 'package:furniture_app_ui/models/product.dart';
import 'package:furniture_app_ui/size_config.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize! * 2),
      height: defaultSize * 35, //300
      width: SizeConfig.orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width / 2,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.category!.toUpperCase(), style: lightTextStyle),
            SizedBox(height: defaultSize),
            Text(
              product.title!,
              style: TextStyle(
                fontSize: defaultSize * 2.4,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
                height: 1.4,
              ),
            ),
            SizedBox(height: defaultSize * 2),
            Container(
              width: SizeConfig.orientation == Orientation.portrait
                  ? defaultSize * 12
                  : defaultSize * 35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("From", style: lightTextStyle),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: defaultSize * 1.6,
                      fontWeight: FontWeight.bold,
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: defaultSize * 2),
                  Text(
                    "Avaliable Colors",
                    style: lightTextStyle,
                  ),
                  Wrap(
                    children: [
                      buildColorBox(
                        defaultSize,
                        color: Color(0xFF7BA275),
                      ),
                      buildColorBox(
                        defaultSize,
                        color: Color(0xFFD7D7D7),
                      ),
                      buildColorBox(
                        defaultSize,
                        color: kTextColor,
                      ),
                      buildColorBox(
                        defaultSize,
                        color: Color(0xFF7B3E19),
                        isActive: true,
                      ),
                      buildColorBox(
                        defaultSize,
                        color: Color(0xFFFFC800),
                      ),
                      buildColorBox(
                        defaultSize,
                        color: Color(0xFFB279A7),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildColorBox(double defaultSize,
      {Color? color, bool isActive = false}) {
    return Container(
      margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
      padding: const EdgeInsets.all(5),
      height: defaultSize * 2.4,
      width: defaultSize * 2.4,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(6), color: color),
      child: isActive ? SvgPicture.asset("assets/icons/check.svg") : SizedBox(),
    );
  }
}

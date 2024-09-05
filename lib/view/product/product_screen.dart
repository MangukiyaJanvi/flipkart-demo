import 'package:flipkart_ui_demo/model/list/list.dart';
import 'package:flipkart_ui_demo/services/app_routes.dart';
import 'package:flipkart_ui_demo/utils/size_utils.dart';
import 'package:flipkart_ui_demo/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(text: 'Products'),
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: height(context, 0.001),
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
          ),
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color:
                        index < 2 ? Colors.grey.shade400 : Colors.transparent,
                    width: 2.0,
                  ),
                  left: BorderSide(
                    color: index % 2 == 1
                        ? Colors.grey.shade400
                        : Colors.transparent,
                    width: index % 2 == 1 ? 1 : 2.0,
                  ),
                  right: BorderSide(
                    color: index % 2 == 0
                        ? Colors.grey.shade400
                        : Colors.transparent,
                    width: index % 2 == 0 ? 1 : 2.0,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey.shade400,
                    width: 2.0,
                  ),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.productDetailScreen,
                      arguments: productList[index]);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          productList[index].image,
                          height: 20.h,
                        ),
                        constHeight10(),
                        customText(
                          text: productList[index].name,
                          maxLines: 1,
                          fontWeight: FontWeight.w600,
                        ),
                        customText(
                          text: productList[index].price,
                          maxLines: 1,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
            ;
          },
        ),
      ),
    );
  }
}

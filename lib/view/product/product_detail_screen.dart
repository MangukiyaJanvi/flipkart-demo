import 'package:flipkart_ui_demo/constant/color_constant.dart';
import 'package:flipkart_ui_demo/model/common_model.dart';
import 'package:flipkart_ui_demo/utils/size_utils.dart';
import 'package:flipkart_ui_demo/utils/text.dart';
import 'package:flipkart_ui_demo/viewVM/product_vm.dart';
import 'package:flipkart_ui_demo/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductModel? productModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProductVM>().setPageIndex(0);
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    productModel = ModalRoute.of(context)?.settings.arguments as ProductModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 30.h,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.share),
                          ),
                        ),
                        PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) => Image.asset(
                            productModel?.image ?? '',
                            height: 30.h,
                          ),
                          onPageChanged: (value) {
                            context.read<ProductVM>().setPageIndex(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  constHeight20(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...[0, 1, 2, 3, 4].map(
                        (e) => Container(
                          margin: const EdgeInsets.only(left: 2),
                          height: 5,
                          width: context.watch<ProductVM>().pageIndex == e
                              ? 10
                              : 5,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ],
                  ),
                  constHeight20(),
                  customText(text: productModel?.description ?? ''),
                  h(30),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "79% off\t",
                          style: customStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.green.shade700,
                            decoration: TextDecoration.none,
                            fontSize: 18.sp,
                          ),
                        ),
                        TextSpan(
                          text: "5,545",
                          style: customStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 18.sp,
                          ),
                        ),
                        TextSpan(
                          text: "\t${productModel?.price ?? ''}",
                          style: customStyle(
                            fontWeight: FontWeight.w600,
                            color: black,
                            decoration: TextDecoration.none,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                      style: DefaultTextStyle.of(context).style,
                    ),
                  ),
                  h(5),
                  customText(
                    text: 'Free delivery',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  constHeight20(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        text: 'Find a seller that delivers to you',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      customTextButton(onTap: () {}, title: 'Enter Pincode'),
                    ],
                  ),
                ],
              ),
            ),
            Row(children: [
              Expanded(child: customButton(onTap: () {}, title: 'Add to cart')),
              Expanded(
                  child: customButton(
                      onTap: () {},
                      title: 'Buy now',
                      buttonColor: Colors.amber)),
            ]),
          ],
        ),
      ),
    );
  }
}

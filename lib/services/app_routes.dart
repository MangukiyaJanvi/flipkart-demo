import 'package:flipkart_ui_demo/export/route_export.dart';

class AppRoutes {
  static const String productScreen = 'ProductScreen';
  static const String productDetailScreen = 'ProductDetailScreen';

  static getRoute() {
    return {
      productScreen: (context) => const ProductScreen(),
      productDetailScreen: (context) => const ProductDetailScreen(),
    };
  }
}

import 'package:flipkart_ui_demo/constant/constants.dart';
import 'package:flipkart_ui_demo/services/app_routes.dart';
import 'package:flipkart_ui_demo/utils/theme.dart';
import 'package:flipkart_ui_demo/viewVM/product_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<ProductVM>(create: (context) => ProductVM()),
          ],
          child: MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            initialRoute: AppRoutes.productScreen,
            routes: AppRoutes.getRoute(),
          ),
        );
      },
    );
  }
}

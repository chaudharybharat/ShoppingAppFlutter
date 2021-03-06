import 'package:flutter/material.dart';
import 'package:groceries_shopping_app/product_provider.dart';
import 'package:groceries_shopping_app/screens/home.dart';
import 'package:groceries_shopping_app/screens/login_screen.dart';
import 'package:groceries_shopping_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:response/response.dart';
import 'local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: Response(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
      create: (BuildContext context) => ProductsOperationsController(),
    );
  }
}

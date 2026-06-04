import 'package:flowershop/viewmodels/cart_view_model.dart';
import 'package:flowershop/views/flower_page_firestore.dart';
import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flowershop/views/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flowershop/views/cart_page.dart';
import 'package:flowershop/views/message_page.dart';
import 'package:flowershop/views/info_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flowershop/views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: FlowerApp(),
    );
  }
}

class FlowerApp extends StatelessWidget {
  FlowerApp({super.key});
  final CartViewModel cartViewModel = CartViewModel();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Botanica Obscura',
              style: AppTextStyles.title(context),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: AppTheme.mutedPurple),
            ),
            child: TabBar(
              isScrollable: false,
              dividerColor: Colors.transparent,

              unselectedLabelColor: AppTheme.mutedPurple,
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.houseChimney)),
                Tab(icon: Icon(FontAwesomeIcons.spa)),
                Tab(icon: Icon(FontAwesomeIcons.solidMessage)),
                Tab(icon: Icon(FontAwesomeIcons.basketShopping)),
                Tab(icon: Icon(FontAwesomeIcons.creditCard)),
                Tab(icon: Icon(FontAwesomeIcons.circleInfo)),
              ],
            ),
          ),
        ),

        body: TabBarView(
          children: [
            HomePage(),
            FlowerPage(cartViewModel: cartViewModel),
            MessagePage(cartViewModel: cartViewModel),
            CartPage(cartViewModel: cartViewModel),
            PaymentPage(cartViewModel: cartViewModel),
            InfoPage(),
          ],
        ),
      ),
    );
  }
}

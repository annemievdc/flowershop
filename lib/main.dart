import 'package:flowershop/viewmodels/cart_view_model.dart';
import 'package:flowershop/views/flower_page_firestore.dart';
import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
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

  runApp(AppRoot());
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
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Botanica Obscura',
              style: AppTextStyles.title(context),
            ),
          ),
        ),
        bottomNavigationBar: TabBar(
          indicatorColor: AppTheme.boneWhite,
          labelColor: AppTheme.boneWhite,
          unselectedLabelColor: AppTheme.mutedPurple,
          tabs: [
            Tab(icon: Icon(FontAwesomeIcons.house), text: "Home"),
            Tab(icon: Icon(FontAwesomeIcons.fan), text: "Bloemen"),
            Tab(icon: Icon(FontAwesomeIcons.featherPointed), text: "Boodschap"),
            Tab(icon: Icon(FontAwesomeIcons.basketShopping), text: "Mand"),
            Tab(icon: Icon(FontAwesomeIcons.eye), text: "Info"),
          ],
        ),

        body: TabBarView(
          children: [
            HomePage(),
            FlowerPage(cartViewModel: cartViewModel),
            MessagePage(cartViewModel: cartViewModel),
            CartPage(cartViewModel: cartViewModel),
            InfoPage(),
          ],
        ),
      ),
    );
  }
}

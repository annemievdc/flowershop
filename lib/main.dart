import 'package:flowershop/views/flower_page.dart';
import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flowershop/views/cart_page.dart';
import 'package:flowershop/views/message_page.dart';
import 'package:flowershop/views/info_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const FlowerApp(),
    );
  }
}

class FlowerApp extends StatelessWidget {
  const FlowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
            Tab(icon: Icon(FontAwesomeIcons.leaf), text: "Bloemen"),
            Tab(icon: Icon(FontAwesomeIcons.scroll), text: "Boodschap"),
            Tab(icon: Icon(FontAwesomeIcons.basketShopping), text: "Mand"),
            Tab(icon: Icon(FontAwesomeIcons.eye), text: "Info"),
          ],
        ),

        body: TabBarView(
          children: [FlowerPage(), MessagePage(), CartPage(), InfoPage()],
        ),
      ),
    );
  }
}

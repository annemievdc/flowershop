import 'package:flutter/material.dart';

Widget flowerImage(String imageUrl) {
  if (imageUrl.startsWith('assets/')) {
    return Image.asset(imageUrl, fit: BoxFit.cover);
  } else {
    return Image.network(imageUrl, fit: BoxFit.cover);
  }
}

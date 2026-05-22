import 'package:flutter/material.dart';

Widget flowerImage(String imageUrl) {
  //print('IMAGE URL: $imageUrl');

  if (imageUrl.startsWith('assets/')) {
    //print('image url ontvangen : $imageUrl');
    return Image.asset(imageUrl, fit: BoxFit.cover);
  }
  return Image.asset('assets/images/fallback.jpg', fit: BoxFit.cover);
}

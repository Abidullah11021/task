import 'package:flutter/material.dart';

class ItemModel {
  final int id;
  final String image;
  final String title;
  final String location;
  final String price;
  final String status;
  final Color statusColor;

  ItemModel({
    required this.id,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.status,
    required this.statusColor,
  });
}

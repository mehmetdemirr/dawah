import 'package:davet/core/utilty/images_items.dart';
import 'package:flutter/material.dart';

class AppsModel {
  int id;
  String name;
  String description;
  IconData icon;
  Color color;

  AppsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
  });
}

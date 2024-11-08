import 'package:davet/core/utilty/border_radius_items.dart';
import 'package:flutter/material.dart';

InputDecoration customInputDecoration(
  String hintText,
  String labelText,
  BuildContext context,
) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: Theme.of(context).textTheme.bodyMedium,
    labelText: labelText,
    labelStyle: Theme.of(context).textTheme.bodyMedium,
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 3, color: Colors.black26),
      borderRadius: BorderRadiusItem.small.str(),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 3, color: Colors.black26),
      borderRadius: BorderRadiusItem.small.str(),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: Colors.red.shade400),
      borderRadius: BorderRadiusItem.small.str(),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 3, color: Colors.brown),
      borderRadius: BorderRadiusItem.small.str(),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: Colors.red.shade700),
      borderRadius: BorderRadiusItem.small.str(),
    ),
  );
}

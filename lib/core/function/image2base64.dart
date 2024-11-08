import 'dart:convert';

import 'package:davet/core/function/print_function.dart';
import 'package:image_picker/image_picker.dart';

Future<String?> convertXFileToBase64(XFile? file) async {
  try {
    if (file == null) {
      // XFile null ise, null döndür
      return null;
    }
    final List<int> bytes = await file.readAsBytes();
    final base64Image = base64Encode(bytes);
    return base64Image;
  } catch (e) {
    printf('hata imaage2base64 : $e');
  }
  return null;
}

// import 'dart:convert';
// import 'dart:typed_data';

// Future<String?> convertFileToBase64(FilePickerResult? file) async {
//   if (file == null) {
//     return null;
//   }

//   try {
//     // Dosyanın verilerini al
//     Uint8List fileBytes = file.files.first.bytes!;

//     // Veriyi base64'e çevir
//     String base64String = base64Encode(fileBytes);

//     return base64String;
//   } catch (e) {
//     print('Base64 çevrimi sırasında bir hata oluştu: $e');
//     return null;
//   }
// }

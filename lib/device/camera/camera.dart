import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class Camera {
  static Future<String?> openCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 15);
    if (image != null) {
      File _image = File(image.path);
      List<int> base64Byte = _image.readAsBytesSync();
      String base64Encoded = base64Encode(base64Byte);
      return "data:image/png;base64," + base64Encoded;
    }
  }

  static Future<String?> openGallery({bool getBase64 = true}) async {
    final ImagePicker _picker = ImagePicker();
    final image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    if (image != null) {
      File _image = File(image.path);
      List<int> base64Byte = _image.readAsBytesSync();
      String base64Encoded = base64Encode(base64Byte);
      return base64Encoded;
    }
  }

  static Uint8List base64ToFile(String image) => base64.decode(image);
}

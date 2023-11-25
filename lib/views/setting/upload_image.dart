import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

Future<Uint8List?> uploadImage() async {
  XFile? pickedFile =
      await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    List<int> imageBytes = await pickedFile.readAsBytes();
    Uint8List uint8list = Uint8List.fromList(imageBytes);

    return uint8list;
  }
  return null;
}

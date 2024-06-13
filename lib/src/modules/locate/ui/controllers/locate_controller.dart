import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LocateController extends ChangeNotifier {
  ValueNotifier<bool> isEnabledButton = ValueNotifier<bool>(false);
  ValueNotifier<File?> imageNotifier = ValueNotifier<File?>(null);

  TextEditingController chipController = TextEditingController();

  ValueNotifier<List> locatePetList = ValueNotifier<List>([]);

  void verifyFields({required String value}) {
    if (value.isEmpty && imageNotifier.value == null) {
      isEnabledButton.value = false;
    } else {
      isEnabledButton.value = true;
    }

    notifyListeners();
  }

  void setImage(File? newImage) {
    imageNotifier.value = newImage;
    notifyListeners();
  }

  Future<void> getImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImage(File(pickedImage.path));
      verifyFields(value: chipController.text);
    }
  }
}

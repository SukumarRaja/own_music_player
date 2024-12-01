import 'package:flutter/material.dart';

import 'text.dart';

imagePickerDialog(context, {cameraOnTap, galleryOnTap, removeOnTap}) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: CommonText(text: "Choose Option")),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextButton.icon(
                  onPressed: () {
                    cameraOnTap();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  label: const Text("Camera"),
                  icon: const Icon(Icons.camera),
                ),
                TextButton.icon(
                  onPressed: () {
                    galleryOnTap();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  label: const Text("Gallery"),
                  icon: const Icon(Icons.image),
                ),
                TextButton.icon(
                  onPressed: () {
                    removeOnTap();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  label: const Text("Remove"),
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
        );
      });
}

import 'package:flutter/material.dart';

class ModalWidget {
  showFullModal(BuildContext context, Widget isi) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "Modal",
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, __, ___) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Detail Buku"),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: isi,
        );
      },
    );
  }
}

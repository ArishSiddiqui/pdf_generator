import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf_generator/pages/create_pdf/create_pdf_controller.dart';

class CreatePdf extends StatelessWidget {
  const CreatePdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            bool picking = ref.watch(CreatePdfController.pickingFile);
            return Center(
              child: picking
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () => CreatePdfController.pickFile(ref),
                      child: const Text('Pick Signature'),
                    ),
            );
          },
        ),
      ),
    );
  }
}

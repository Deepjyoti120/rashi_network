import 'package:flutter/material.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/views/home_controller.dart';

class AstroDocumentsUpload extends StatefulWidget {
  const AstroDocumentsUpload({super.key});

  @override
  State<AstroDocumentsUpload> createState() => _AstroDocumentsUploadState();
}

class _AstroDocumentsUploadState extends State<AstroDocumentsUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Upload Documents',
          color: Colors.white,
          fontSize: 20,
          fontWeight: 600,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: FloatingActionButton.extended(
            backgroundColor: DesignColor.darkTeal,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeController(),
                  ));
            },
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            label: const DesignText(
              "Continue",
              color: Colors.white,
              fontSize: 14,
              fontWeight: 600,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 228,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: DesignColor.lightGrey1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.upload,
                      color: DesignColor.lightGrey1,
                    ),
                  ),
                  const DesignText(
                    'Upload all your documents in one pdf',
                    color: DesignColor.lightGrey1,
                    fontSize: 14,
                    fontWeight: 500,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const DesignText(
              'Uploaded Files',
              fontSize: 16,
              fontWeight: 500,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.description_outlined),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      DesignText(
                        '50%',
                        fontSize: 12,
                        fontWeight: 500,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 5,
                        child:
                            LinearProgressIndicator(color: DesignColor.green),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

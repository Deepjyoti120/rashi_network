import 'package:flutter/material.dart';
import 'package:rashi_network/ui/custom/custom_text_form.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/views/login_astrologer/document/astrologer_documents_upload.dart';

class AstrologerDetailsForm extends StatefulWidget {
  const AstrologerDetailsForm({super.key});

  @override
  State<AstrologerDetailsForm> createState() => _AstrologerDetailsFormState();
}

class _AstrologerDetailsFormState extends State<AstrologerDetailsForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Details',
          color: Colors.white,
          fontSize: 20,
          fontWeight: 700,
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
                    builder: (context) => const AstroDocumentsUpload(),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DesignFormField(
                controller: TextEditingController(),
                hintText: 'Enter your name*',
              ),
              const SizedBox(height: 10),
              DesignFormField(
                controller: TextEditingController(),
                hintText: 'Enter your mobile no*',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              DesignFormField(
                controller: TextEditingController(),
                hintText: 'Enter your email*',
              ),
              const SizedBox(height: 10),
              DesignFormField(
                controller: TextEditingController(),
                hintText: 'Enter your message*',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

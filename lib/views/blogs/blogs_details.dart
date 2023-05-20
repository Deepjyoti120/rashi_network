import 'package:flutter/material.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:html/parser.dart';

class LatestBlogsDetails extends StatefulWidget {
  const LatestBlogsDetails(
      {super.key, required this.text, required this.image});
  final String text;
  final String image;
  @override
  State<LatestBlogsDetails> createState() => _LatestBlogsDetailsState();
}

class _LatestBlogsDetailsState extends State<LatestBlogsDetails> {
  @override
  Widget build(BuildContext context) {
    var document = parse(widget.text);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Blog Details',
          color: Colors.white,
          fontSize: 20,
          fontWeight: 700,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DesignText(
                  document.body!.text,
                  fontSize: 12,
                  fontWeight: 600,
                ))
          ],
        ),
      ),
    );
  }
}

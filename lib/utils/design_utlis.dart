import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class DesignUtlis {
  static flutterToast(msg) {
    Fluttertoast.showToast(
        msg: msg, backgroundColor: Colors.black.withOpacity(0.75));
  }

  // static Future<String> get sessionGet async {
  //   DateTime ntp = await NTP.now();
  //   String session = DateFormat.y().format(ntp) +
  //       (int.parse(DateFormat.y().format(ntp)) + 1).toString();
  //   return session;
  // }

  // static String currentMonth(DateTime ntp) {
  //   String currentMonth = DateFormat("MMM").format(ntp);
  //   return currentMonth;
  // }

  // Generates a random string of given length
  static String generateRandomString(int length) {
    final random = Random.secure();
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    return base64Url.encode(values).substring(0, length);
  }

  /// Removes all non-numeric characters from the input string and parses the resulting string into an integer.
  ///
  /// `string`: The input string to parse.
  ///
  /// Returns an integer value that was extracted from the input string.
  static int removeStringGetINT(String string) {
    int classSchool = int.parse(string.replaceAll(RegExp(r'[^0-9]'), ""));
    return classSchool;
  }

  /// Removes all numeric characters from the input string.
  ///
  /// `string`: The input string to modify.
  ///
  /// Returns a new string with all numeric characters removed from the input string.
  static String removedNumberFromString(String string) {
    String classSchool = string.replaceAll(RegExp(r'\d+'), "");
    return classSchool;
  }

  // Lunch URL
  static launchURL(
    String url, {
    LaunchMode? mode,
  }) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url),
          mode: mode ?? LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Html Text Extrack
  static String removeHtmlTags(String html) {
    RegExp exp = RegExp(r"<[^>]*>");
    return html.replaceAll(exp, '');
  }

  static String extractTextWithDot(String text) {
    RegExp exp = RegExp(r"[^\s]*\.[^\s]*");
    return exp.allMatches(text).map((m) => m.group(0)).join(' ');
  }
}

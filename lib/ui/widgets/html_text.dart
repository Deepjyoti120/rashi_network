import 'package:flutter/material.dart';
import 'package:rashi_network/utils/design_utlis.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
// #docregion platform_imports
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class HtmlText extends StatefulWidget {
  final String htmlText;

  const HtmlText(
    this.htmlText, {
    super.key,
  });
  @override
  State<HtmlText> createState() => _HtmlTextState();
}

class _HtmlTextState extends State<HtmlText> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          // onProgress: (int progress) {
          //   debugPrint('WebView is loading (progress : $progress%)');
          // },
          // onPageStarted: (String url) {
          //   debugPrint('Page started loading: $url');
          // },
          // onPageFinished: (String url) {
          //   debugPrint('Page finished loading: $url');
          // },
          onNavigationRequest: (NavigationRequest request) async {
            // Prevent the WebView from loading the redirect_url
            return NavigationDecision.prevent;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.dataFromString(
        widget.htmlText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ));

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}

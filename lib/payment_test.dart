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

class InstamojoPaymentScreen extends StatefulWidget {
  final String paymentRequestUrl;
  final String paymentRequestId;

  const InstamojoPaymentScreen(
      {super.key,
      required this.paymentRequestUrl,
      required this.paymentRequestId});

  @override
  State<InstamojoPaymentScreen> createState() => _InstamojoPaymentScreenState();
}

class _InstamojoPaymentScreenState extends State<InstamojoPaymentScreen> {
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
            // Check if the URL is your redirect_url
            print("request"+request.url);
            if (request.url.startsWith('thetaramandal.com/user/wallet/payments')) {
              //https://thetaramandal.com/user/wallet/payments/success/?orderId=191
              // await ApiAccess()
              //     .verifyInstamojoPayment(
              //         paymentRequestId: widget.paymentRequestId)
              //     .then((isDone) => Navigator.pop(context, isDone));

              final Uri url = Uri.parse(request.url);
              // Get the payment status from the URL
              final String paymentStatus =
                  url.queryParameters['payment_status'] ?? '';
              // Get the payment request ID from the URL
              final String paymentRequestId =
                  url.queryParameters['payment_request_id'] ?? '';
              // Handle the payment status
              if (paymentStatus == 'Credit') {
                Navigator.pop(context, true);
              } else {
                Navigator.pop(context, false);
              }
            }
            if (request.url.startsWith('intent')) {
              print('object 44${request.url}');
              DesignUtlis.launchURL(request.url.replaceAll('intent', 'upi'));
              // return NavigationDecision.prevent;
              // if (platform.isAndroid) {
              // AndroidIntent intent = AndroidIntent(
              //     action: 'action_view',
              //     data: request.url,
              //     package: 'package=net.one97.paytm',
              //     // arguments: {'authAccount': currentUserEmail},
              //     );
              // await intent.launch();
              // }
            }
            // Prevent the WebView from loading the redirect_url
            return NavigationDecision.prevent;
          },
          // onUrlChange: (UrlChange change) {
          //   debugPrint('url change to ${change.url}');
          // },
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
      ..loadRequest(Uri.parse(widget.paymentRequestUrl));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}

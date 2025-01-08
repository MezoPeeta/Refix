import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatelessWidget {
  const PaymentWebView({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
          NavigationDelegate(onNavigationRequest: (request) {
        if (request.url.contains("success")) {
          context.go("/success");
          return NavigationDecision.prevent;
        }
        if (request.url.contains("failure")) {
          context.go("/failure");
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      }))
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

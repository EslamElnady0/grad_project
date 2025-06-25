import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PdfWebViewPage extends StatefulWidget {
  static const String routeName = '/pdfWebView';

  const PdfWebViewPage({super.key});

  @override
  State<PdfWebViewPage> createState() => _PdfWebViewPageState();
}

class _PdfWebViewPageState extends State<PdfWebViewPage> {
  late final WebViewController controller;
  bool isLoading = true;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Prevent multiple initializations when dependencies change
    if (_initialized) return;
    _initialized = true;

    final pdfUrl = GoRouterState.of(context).extra as String;
    final fullUrl = 'https://$pdfUrl';
    final viewerUrl =
        'https://docs.google.com/gview?embedded=true&url=$fullUrl';

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            setState(() => isLoading = true);
          },
          onPageFinished: (_) {
            setState(() => isLoading = false);
          },
        ),
      )
      ..loadRequest(Uri.parse(viewerUrl));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
        child: Column(
          children: [
            CustomInnerScreensAppBar(title: S.of(context).assignment_preview),
            Expanded(
              child: Stack(
                children: [
                  if (_initialized)
                    WebViewWidget(controller: controller),
                  if (isLoading)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

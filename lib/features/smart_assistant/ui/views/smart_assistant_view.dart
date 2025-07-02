import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/shared_pref_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';

class SmartAssistantView extends StatefulWidget {
  static const String routeName = '/smart-assistant';
  const SmartAssistantView({super.key});

  @override
  State<SmartAssistantView> createState() => _SmartAssistantViewState();
}

class _SmartAssistantViewState extends State<SmartAssistantView> {
  late final WebViewController controller;
  bool isLoading = true;
  String? assistantUrl;
  String? errorText;

  @override
  void initState() {
    super.initState();
    _loadUserUniCodeAndInitWebView();
  }

  Future<void> _loadUserUniCodeAndInitWebView() async {
    setState(() {
      isLoading = true;
      errorText = null;
    });
    final userUniCode = await SharedPrefHelper.getString(Constants.userUniCode);
    final url =
        'https://nextgenedu-database.azurewebsites.net/chat/$userUniCode';
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
          onWebResourceError: (error) {
            setState(() {
              isLoading = false;
              assistantUrl = null;
              errorText = 'Failed to load the page: ${error.description}';
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
    setState(() {
      assistantUrl = url;
    });
  }

  Widget _buildErrorWidget() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: SvgPicture.asset(
                'assets/images/svgs/robot_line_icon.svg',
                height: 120,
                width: 120,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              errorText ?? 'An unknown error occurred.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: Colors.red),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _loadUserUniCodeAndInitWebView,
              icon: const Icon(
                Icons.refresh,
                color: AppColors.white,
              ),
              label: const Text('Refresh'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          if (assistantUrl != null && !isLoading)
            WebViewWidget(controller: controller),
          if (isLoading) const Center(child: CircularProgressIndicator()),
          if (!isLoading && assistantUrl == null) _buildErrorWidget(),
        ],
      ),
    );
  }
}

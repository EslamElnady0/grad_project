import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:open_file/open_file.dart'; // To open downloaded files

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

  late String fileUrl;
  late String fileExtension;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;

    fileUrl = GoRouterState.of(context).extra as String;
    fileExtension = fileUrl.split('.').last.toLowerCase();

    if (_isOfficeFile(fileExtension)) {
      final viewerUrl =
          'https://docs.google.com/gview?embedded=true&url=https://$fileUrl';
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (_) => setState(() => isLoading = true),
            onPageFinished: (_) => setState(() => isLoading = false),
          ),
        )
        ..loadRequest(Uri.parse(viewerUrl));
    }
  }

  bool _isOfficeFile(String ext) {
    return ['pdf', 'doc', 'docx', 'ppt', 'pptx', 'xls', 'xlsx'].contains(ext);
  }

  bool _isImageFile(String ext) {
    return ['jpg', 'jpeg', 'png', 'gif', 'webp'].contains(ext);
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
              child: _buildFilePreview(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilePreview() {
    if (_isOfficeFile(fileExtension)) {
      return Stack(
        children: [
          if (_initialized) WebViewWidget(controller: controller),
          if (isLoading) const Center(child: CircularProgressIndicator()),
        ],
      );
    } else if (_isImageFile(fileExtension)) {
      return Center(
        child: Image.network(
          'https://$fileUrl',
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Text('Failed to load image.'));
          },
        ),
      );
    } else {
      return Center(
        child: ElevatedButton.icon(
          onPressed: () async {
            final result = await OpenFile.open(fileUrl);
            if (result.type != ResultType.done) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Unable to open file')),
              );
            }
          },
          icon: const Icon(Icons.download),
          label: const Text('Download & Open File'),
        ),
      );
    }
  }
}

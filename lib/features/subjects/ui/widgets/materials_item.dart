import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/data/models/get_course_materials_response_model.dart';
import 'package:grad_project/core/helpers/file_utils.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

import '../../../../core/helpers/app_assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../../../core/widgets/custom_text_and_icon_button.dart';
import '../../../../generated/l10n.dart';
class MaterialsItem extends StatelessWidget {
  final CourseMaterialData item;

  const MaterialsItem({super.key, required this.item});

  // Function to open file
  Future<void> _openFile(BuildContext context) async {
    try {
      final fileUrl = item.file;
      if (fileUrl == null || fileUrl.isEmpty) {
        Fluttertoast.showToast(
          msg: "No file URL available",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        return;
      }

      // Add https:// if not present
      final url = fileUrl.startsWith('http') ? fileUrl : 'https://$fileUrl';
      
      // Try different launch modes in order of preference
      try {
        // First try: External application
        final uri = Uri.parse(url);
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } catch (externalError) {
        try {
          // Second try: In-app browser view
          final uri = Uri.parse(url);
          await launchUrl(
            uri,
            mode: LaunchMode.inAppBrowserView,
          );
        } catch (browserError) {
          try {
            // Third try: Platform default
            final uri = Uri.parse(url);
            await launchUrl(uri);
          } catch (defaultError) {
            // If all fail, open in WebView
            // Check if context is still mounted before using it
            if (context.mounted) {
              _openInWebView(context, url);
            }
          }
        }
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error opening file",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  // Function to open file in WebView
  void _openInWebView(BuildContext context, String url) {
    try {
      // Navigate to a new screen with WebView
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(item.title ?? "File Viewer"),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            body: WebViewWidget(
              controller: WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..loadRequest(Uri.parse(url)),
            ),
          ),
        ),
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Cannot open file",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  // Function to download file
  Future<void> _downloadFile() async {
    try {
      final fileUrl = item.file;
      if (fileUrl == null || fileUrl.isEmpty) {
        Fluttertoast.showToast(
          msg: "No file URL available",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        return;
      }

      // Show loading message
      Fluttertoast.showToast(
        msg: "Starting download...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

      // Request storage permission for Android 10 and below
      if (Platform.isAndroid) {
        final permission = await Permission.storage.request();
        if (permission != PermissionStatus.granted) {
          final managePermission = await Permission.manageExternalStorage.request();
          if (managePermission != PermissionStatus.granted) {
            Fluttertoast.showToast(
              msg: "Storage permission required",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
            return;
          }
        }
      }

      // Add https:// if not present
      final url = fileUrl.startsWith('http') ? fileUrl : 'https://$fileUrl';
      
      // Get downloads directory
      Directory? downloadsDirectory;
      if (Platform.isAndroid) {
        downloadsDirectory = Directory('/storage/emulated/0/Download');
        // Fallback to app documents directory if Downloads folder is not accessible
        if (!await downloadsDirectory.exists()) {
          downloadsDirectory = await getApplicationDocumentsDirectory();
        }
      } else {
        downloadsDirectory = await getDownloadsDirectory();
      }

      if (downloadsDirectory != null) {
        // Extract filename from URL
        final uri = Uri.parse(url);
        String fileName = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : 'file';
        
        // Add file extension if missing
        if (!fileName.contains('.') && item.title != null) {
          final extension = getFileExtension(url);
          fileName = '${item.title}.$extension';
        }
        
        final filePath = '${downloadsDirectory.path}/$fileName';

        // Download file
        final dio = Dio();
        await dio.download(
          url,
          filePath,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              final progress = (received / total * 100).toInt();
              if (progress % 20 == 0) { // Show progress every 20%
                Fluttertoast.showToast(
                  msg: "Downloading... $progress%",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
              }
            }
          },
        );

        Fluttertoast.showToast(
          msg: "File downloaded successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Cannot access downloads folder",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Download failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  // Helper function to get file extension
  String getFileExtension(String url) {
    final uri = Uri.parse(url);
    final path = uri.path;
    if (path.contains('.')) {
      return path.split('.').last;
    }
    return 'file'; // default extension
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Add this
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Add this
                children: [
                  CustomIconButton(
                    icon: Icon(
                      getFileIcon(
                        getFileType(item.file),
                      ),
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded( // Wrap Column with Expanded
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title ?? "",
                          style: AppTextStyles.font13DarkBlueBold,
                          maxLines: 2, 
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          item.createdAt ?? "",
                          style: AppTextStyles.font8DarkBlueSemiBold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          hGap(5),
          SizedBox( // Wrap Column with SizedBox to give it a fixed width
            width: 65.w,
            child: Column(
              children: [
                CustomTextAndIconButton(
                  width: 70.w,
                  text: S.of(context).open,
                  style: AppTextStyles.font8WhiteSemiBold,
                  onTap: () => _openFile(context),
                  icon: SvgPicture.asset(Assets.imagesSvgsOpenIcon),
                  primaryButton: false,
                ),
                vGap(8),
                CustomTextAndIconButton(
                  width:70.w,
                  text: S.of(context).download,
                  style: AppTextStyles.font8WhiteSemiBold,
                  onTap: _downloadFile,
                  icon: SvgPicture.asset(Assets.imagesSvgsDewenloadIcon),
                  primaryButton: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
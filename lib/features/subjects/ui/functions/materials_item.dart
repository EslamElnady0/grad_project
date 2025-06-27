  // Function to open file
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/data/models/get_course_materials_response_model.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';
import '../../../../core/helpers/spacing.dart';
import '../../../../features/subjects/ui/views/add_lecture_view.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../logic/delete_course_material/delete_course_material_cubit.dart';

Future<void> openFile(BuildContext context , CourseMaterialData item)  async {
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
              openInWebView(context, url, item);
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
  void openInWebView(BuildContext context, String url , CourseMaterialData item) {
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
  Future<void> downloadFile(CourseMaterialData item) async {
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

  // Function to show admin options bottom sheet
  void showAdminOptionsBottomSheet(BuildContext context, CourseMaterialData item, {VoidCallback? onDeleteConfirmed}) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                width: 40.w,
                height: 4.h,
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              
              // Edit option
              ListTile(
                leading: const Icon(Icons.edit, color: AppColors.primaryColordark),
                title: Text(
                  S.of(context).edit,
                  style: AppTextStyles.font16BlackSemiBold.copyWith(
                    color: AppColors.primaryColordark,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  editMaterial(context, item);
                },
              ),
              
              const Divider(),
              
              // Delete option
              ListTile(
                leading:   const Icon(Icons.delete, color: AppColors.redDark),
                title: Text(
                  S.of(context).delete,
                  style: AppTextStyles.font16BlackSemiBold.copyWith(color: AppColors.redDark),
                ),
                onTap: () {
                  Navigator.pop(context);
                  deleteMaterial(context, item, onDeleteConfirmed: onDeleteConfirmed);
                },
              ),
              
              vGap(16),
            ],
          ),
        );
      },
    );
  }

  // Function to navigate to edit material
  void editMaterial(BuildContext context, CourseMaterialData item) {
    // Navigate to AddLectureView with the course ID
    // Note: We need the course ID to pass to AddLectureView
    // This might need to be passed down from the parent widget
    if (item.id != null) {
      GoRouter.of(context).push(
        AddLectureView.routeName,
        extra: item.id, // Using material ID as course ID for now
      );
    }
  }

  // Function to delete material
  void deleteMaterial(BuildContext context, CourseMaterialData item, {VoidCallback? onDeleteConfirmed}) {
    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          title: Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: AppColors.redDark,
                size: 24.w,
              ),
              hGap(8),
              Text(
                S.of(dialogContext).delete,
                style: AppTextStyles.font16BlackSemiBold.copyWith(
                  color: AppColors.redDark,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title ?? S.of(dialogContext).material,
                style: AppTextStyles.font14BlackSemiBold.copyWith(
                  color: AppColors.blackText,
                ),
              ),
              vGap(8),
              Text(
                S.of(dialogContext).are_you_sure_you_want_to_delete_this_material,
                style: AppTextStyles.font14BlackMedium.copyWith(
                  color: AppColors.gray,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              ),
              child: Text(
                S.of(dialogContext).cancel,
                style: AppTextStyles.font14BlackSemiBold.copyWith(
                  color: AppColors.primaryColordark,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                // Call the callback if provided, otherwise use the cubit
                if (onDeleteConfirmed != null) {
                  onDeleteConfirmed();
                } else {
                  // Use the original context to access the cubit from the widget tree
                  try {
                    context.read<DeleteCourseMaterialCubit>().deleteCourseMaterial(item.id!);
                  } catch (e) {
                    // Fallback to getIt if context.read fails
                    final deleteCourseMaterialCubit = getIt<DeleteCourseMaterialCubit>();
                    deleteCourseMaterialCubit.deleteCourseMaterial(item.id!);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.redDark,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                S.of(dialogContext).delete,
                style: AppTextStyles.font14BlackSemiBold.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );   
  }

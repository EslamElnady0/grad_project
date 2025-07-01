import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/get_messages_response.dart';
import 'user_avatar_and_name.dart';

/// Widget for displaying text messages with file attachments
class ChatTextWithFilesWidget extends StatefulWidget {
  final Message message;
  final String userId;

  const ChatTextWithFilesWidget({
    super.key,
    required this.message,
    required this.userId,
  });

  @override
  State<ChatTextWithFilesWidget> createState() =>
      _ChatTextWithFilesWidgetState();
}

class _ChatTextWithFilesWidgetState extends State<ChatTextWithFilesWidget> {
  @override
  Widget build(BuildContext context) {
    final isMe = widget.message.sender.id.toString() == widget.userId;
    final timeString = DateFormat('h:mm a').format(widget.message.createdAt);
    final attachments = widget.message.attachments ?? [];

    // Filter only file attachments
    final fileAttachments = attachments.where((attachment) {
      return attachment.type == AttachmentType.file;
    }).toList();

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        UserAvatarAndName(flag: isMe, sender: widget.message.sender),
        Container(
          constraints: BoxConstraints(maxWidth: 0.6.sw),
          margin: EdgeInsets.only(top: 4.h, right: 8.w, left: 8.w),
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: isMe ? AppColors.gray : Colors.black87,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text content
              if (widget.message.content != null &&
                  widget.message.content!.isNotEmpty) ...[
                Text(
                  widget.message.content!,
                  style: AppTextStyles.font10GraySemiBold
                      .copyWith(color: Colors.white, fontSize: 11.sp),
                ),
                const SizedBox(height: 8),
              ],
              // File attachments
              _buildFileAttachments(fileAttachments),
              const SizedBox(height: 4),
              // Status and time row
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isMe) ...[
                    _buildMessageStatus(widget.message.status, iconSize: 14),
                    SizedBox(width: 2.w),
                  ],
                  Text(
                    timeString,
                    style: AppTextStyles.font10GraySemiBold
                        .copyWith(color: Colors.white70, fontSize: 8.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
        UserAvatarAndName(flag: !isMe, sender: widget.message.sender),
      ],
    );
  }

  Widget _buildFileAttachments(List<MessageAttachement> attachments) {
    if (attachments.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: attachments.map((attachment) {
        return Container(
          margin: EdgeInsets.only(bottom: 4.h),
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getFileIcon(attachment.fileType),
                color: Colors.white,
                size: 20.r,
              ),
              SizedBox(width: 8.w),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      attachment.name ?? 'File',
                      style: AppTextStyles.font10GraySemiBold
                          .copyWith(color: Colors.white, fontSize: 10.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      _getFileTypeText(attachment.fileType),
                      style: AppTextStyles.font10GraySemiBold
                          .copyWith(color: Colors.white70, fontSize: 8.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              IconButton(
                onPressed: () => _openFileOnline(attachment),
                icon: Icon(
                  Icons.open_in_new,
                  color: Colors.white,
                  size: 16.r,
                ),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(
                  minWidth: 24.w,
                  minHeight: 24.h,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  IconData _getFileIcon(String fileType) {
    final type = fileType.toLowerCase();
    if (type.contains('pdf')) {
      return Icons.picture_as_pdf;
    } else if (type.contains('doc') || type.contains('docx')) {
      return Icons.description;
    } else if (type.contains('xls') || type.contains('xlsx')) {
      return Icons.table_chart;
    } else if (type.contains('ppt') || type.contains('pptx')) {
      return Icons.slideshow;
    } else if (type.contains('txt')) {
      return Icons.text_snippet;
    } else if (type.contains('zip') || type.contains('rar')) {
      return Icons.folder_zip;
    } else {
      return Icons.insert_drive_file;
    }
  }

  String _getFileTypeText(String fileType) {
    final type = fileType.toLowerCase();
    if (type.contains('pdf')) {
      return 'PDF Document';
    } else if (type.contains('doc') || type.contains('docx')) {
      return 'Word Document';
    } else if (type.contains('xls') || type.contains('xlsx')) {
      return 'Excel Spreadsheet';
    } else if (type.contains('ppt') || type.contains('pptx')) {
      return 'PowerPoint Presentation';
    } else if (type.contains('txt')) {
      return 'Text File';
    } else if (type.contains('zip') || type.contains('rar')) {
      return 'Compressed File';
    } else {
      return 'File';
    }
  }

  Widget _buildMessageStatus(Status status, {double iconSize = 12}) {
    // Remove self from seenBy and deliveredTo
    final deliveredTo = status.deliveredTo.map((e) => e.id.toString()).toSet();
    final seenBy = status.seenBy.map((e) => e.id.toString()).toSet();
    deliveredTo.remove(widget.userId);
    seenBy.remove(widget.userId);
    // If any user (other than self) has seen the message, show blue
    if (seenBy.isNotEmpty) {
      return Icon(Icons.done_all, color: Colors.blue, size: iconSize);
    } else if (deliveredTo.isNotEmpty) {
      return Icon(Icons.done_all, color: Colors.white, size: iconSize);
    } else {
      return Icon(Icons.check, color: Colors.white, size: iconSize);
    }
  }

  Future<void> _openFileOnline(MessageAttachement attachment) async {
    try {
      final url = Uri.parse(attachment.fileUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open file'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error opening file: $e'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}

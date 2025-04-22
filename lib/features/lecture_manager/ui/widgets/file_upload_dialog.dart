import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_text_button.dart';
import 'package:path/path.dart' as path;
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/file_upload_cubit.dart';

class FileUploadDialog extends StatelessWidget {
  const FileUploadDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FileUploadCubit>(),
      child: BlocBuilder<FileUploadCubit, List<PlatformFile>>(
        builder: (context, uploadedFiles) {
          final fileUploadCubit = context.read<FileUploadCubit>();

          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).uploadFiles,
                    style: AppTextStyles.font16DarkerBlueSemiBold,
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: fileUploadCubit.pickFiles,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                        const    Icon(Icons.cloud_upload,
                              size: 50, color: AppColors.primaryColordark), 
                          const SizedBox(height: 10),
                          Text(
                            
                            S.of(context).clickheretoaddmorefiles,
                            style: AppTextStyles.font14GrayMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextButton(
                      width: 150,
                      fontSize: 14,
                      text: S.of(context).uploadFiles,
                      onTap: () {},
                      primary: true),
                  const SizedBox(height: 16),
                  if (uploadedFiles.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: uploadedFiles.length,
                        itemBuilder: (context, index) {
                          final file = uploadedFiles[index];
                          final extension =
                              path.extension(file.name).replaceFirst('.', '');
                          final icon = _getFileIcon(extension);

                          return ListTile(
                            leading: Icon(icon, color: Colors.blue),
                            title: Text(file.name,
                                overflow: TextOverflow.ellipsis),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () =>
                                  fileUploadCubit.removeFile(index),
                            ),
                          );
                        },
                      ),
                    )
                  else
                    Text(
                      S.of(context).noFilesUploaded,
                      style: AppTextStyles.font14GrayMedium,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _getFileIcon(String extension) {
    switch (extension.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow;
      case 'xls':
      case 'xlsx':
        return Icons.table_chart;
      case 'png':
      case 'jpg':
      case 'jpeg':
      case 'gif':
        return Icons.image;
      case 'mp4':
      case 'avi':
      case 'mkv':
        return Icons.video_library;
      case 'mp3':
      case 'wav':
        return Icons.music_note;
      case 'zip':
      case 'rar':
        return Icons.folder_zip;
      default:
        return Icons.insert_drive_file;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_text_button.dart';
import 'package:path/path.dart' as path;
import '../../../../core/helpers/file_utils.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../manager/file_upload_cubit.dart';

class FileUploadDialog extends StatelessWidget {
  const FileUploadDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FileUploadCubit, List<FileWithMetadata>>(
      builder: (context, uploadedFiles) {
        final fileUploadCubit = context.read<FileUploadCubit>();
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.1),
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
                      border: Border.all(color: AppColors.gray),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.cloud_upload,
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
                if (uploadedFiles.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: uploadedFiles.length,
                      itemBuilder: (context, index) {
                        final fileWithMeta = uploadedFiles[index];
                        final file = fileWithMeta.platformFile;
                        final extension =
                            path.extension(file.name).replaceFirst('.', '');
                        final icon = getFileIcon(extension);

                        return ListTile(
                          leading: Icon(icon, color: AppColors.primaryColordark),
                          title: Text(
                              file.name, 
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.font14BlackSemiBold,
                            ),
                          subtitle: fileWithMeta.isExisting 
                              ? Text(S.of(context).existing_file, style: AppTextStyles.font10greenMedium)
                              : Text(S.of(context).new_file, style: AppTextStyles.font12DarkBlueMedium),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: AppColors.redDark),
                            onPressed: () => fileUploadCubit.removeFile(index),
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
                const SizedBox(height: 16),
                CustomTextButton(
                    width: 150,
                    fontSize: 14,
                    text: S.of(context).ok,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    primary: true),
              ],
            ),
          ),
        );
      },
    );
  }
}

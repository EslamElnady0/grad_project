import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/file_utils.dart';
import 'package:grad_project/features/subjects/ui/manager/file_upload_cubit.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:path/path.dart' as path;

class FilesListView extends StatelessWidget {
  const FilesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FileUploadCubit, List<FileWithMetadata>>(
      builder: (context, uploadedFiles) {
        if (uploadedFiles.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: uploadedFiles.length,
            itemBuilder: (context, index) {
              final fileWithMeta = uploadedFiles[index];
              final file = fileWithMeta.platformFile;
              final extension = path.extension(file.name).replaceFirst('.', '');
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
                  onPressed: () =>
                      context.read<FileUploadCubit>().removeFile(index),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

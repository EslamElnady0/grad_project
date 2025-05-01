import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grad_project/core/helpers/file_utils.dart';

import 'package:grad_project/features/lecture_manager/ui/cubit/file_upload_cubit.dart';

import 'package:path/path.dart' as path;

class FilesListView extends StatelessWidget {
  const FilesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FileUploadCubit, List<PlatformFile>>(
      builder: (context, uploadedFiles) {
        if (uploadedFiles.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: uploadedFiles.length,
            itemBuilder: (context, index) {
              final file = uploadedFiles[index];
              final extension = path.extension(file.name).replaceFirst('.', '');
              final icon = getFileIcon(extension);

              return ListTile(
                leading: Icon(icon, color: Colors.blue),
                title: Text(
                  file.name,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
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

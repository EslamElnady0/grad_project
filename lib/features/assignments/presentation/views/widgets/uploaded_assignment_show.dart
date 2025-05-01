import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/file_utils.dart';
import 'package:grad_project/features/assignments/logic/cubits/assignment_upload_cubit.dart/assignment_upload_cubit.dart';
import 'package:path/path.dart' as path;

class UploadedAssignmentShow extends StatelessWidget {
  const UploadedAssignmentShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignmentUploadCubit, PlatformFile?>(
      builder: (context, uploadedAssignment) {
        if (uploadedAssignment == null) {
          return const SizedBox.shrink();
        }
        final file = uploadedAssignment;
        final extension = path.extension(file.name).replaceFirst('.', '');
        final icon = getFileIcon(extension);
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.blue),
            title: Text(
              file.name,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () =>
                  context.read<AssignmentUploadCubit>().removeAssignment(),
            ),
          ),
        );
      },
    );
  }
}

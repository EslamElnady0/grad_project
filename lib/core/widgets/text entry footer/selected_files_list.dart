import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../features/chat/ui/cubit/file_picker_cubit.dart';
import 'selected_file_preview.dart';

class SelectedFilesList extends StatelessWidget {
  final List<File> files;

  const SelectedFilesList({required this.files, super.key});

  @override
  Widget build(BuildContext context) {
    if (files.isEmpty) return const SizedBox.shrink();

    return Container(
      height: 80.h,
      margin: EdgeInsets.only(bottom: 10.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: files.length,
        itemBuilder: (context, index) => SelectedFilePreview(
          file: files[index],
          onRemove: () => context.read<FilePickerCubit>().removeFile(index),
        ),
      ),
    );
  }
}

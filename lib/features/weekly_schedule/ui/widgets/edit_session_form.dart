import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_text_button.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';
import 'package:grad_project/features/weekly_schedule/data/models/update_session_request_model.dart';
import 'package:grad_project/features/weekly_schedule/logic/update_session_cubit.dart';
import 'package:grad_project/features/weekly_schedule/logic/update_session_state.dart';
import 'package:grad_project/generated/l10n.dart';

class EditSessionForm extends StatefulWidget {
  final SessionResponse lecture;

  const EditSessionForm({
    super.key,
    required this.lecture,
  });

  @override
  State<EditSessionForm> createState() => _EditSessionFormState();
}

class _EditSessionFormState extends State<EditSessionForm> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _dateController;
  late TextEditingController _fromController;
  late TextEditingController _toController;
  late TextEditingController _hallIdController;
  
  String _selectedDay = '';
  String _selectedAttendance = '';
  
  final List<String> _days = [
    'saturday',
    'sunday', 
    'monday',
    'tuesday',
    'wednesday',
    'thursday'
  ];
  
  final List<String> _attendanceTypes = ['online', 'offline'];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    // Initialize with current data if postponed exists, otherwise with default values
    Map<String, dynamic> data = widget.lecture.postponed ?? {
      'date': '2025-05-24',
      'day': 'sunday',
      'from': '08:30',
      'to': '10:30',
      'hall_id': 1,
      'attendance': 'offline'
    };
    
    _dateController = TextEditingController(text: data['date'] ?? '2025-05-24');
    _fromController = TextEditingController(text: data['from'] ?? '08:30');
    _toController = TextEditingController(text: data['to'] ?? '10:30');
    _hallIdController = TextEditingController(text: (data['hall_id'] ?? 1).toString());
    _selectedDay = data['day'] ?? 'sunday';
    _selectedAttendance = data['attendance'] ?? 'offline';
  }

  @override
  void dispose() {
    _dateController.dispose();
    _fromController.dispose();
    _toController.dispose();
    _hallIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpdateSessionCubit>(),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header (fixed)
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
              child: _buildHeader(),
            ),
            
            // Scrollable content
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vGap(5),
                      _buildDaySelector(),
                      vGap(12),
                      _buildDateField(),
                      vGap(12),
                      _buildTimeFields(),
                      vGap(12),
                      _buildAttendanceSelector(),
                      vGap(12),
                      _buildHallIdField(),
                      vGap(20),
                      _buildSubmitButton(),
                      vGap(16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).edit_session_details,
          style: AppTextStyles.font16BlackBold,
        ),
        vGap(6),
        Text(
          S.of(context).edit_session_info,
          style: AppTextStyles.font12GrayMedium,
        ),
      ],
    );
  }

  Widget _buildDaySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).select_day,
          style: AppTextStyles.font14BlackMedium,
        ),
        vGap(6),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedDay,
              items: _days.map((day) {
                return DropdownMenuItem<String>(
                  value: day,
                  child: Text(
                    _getDayDisplayName(day, context),
                    style: AppTextStyles.font14BlackMedium,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDay = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).select_date,
          style: AppTextStyles.font14BlackMedium,
        ),
        vGap(6),
        TextFormField(
          controller: _dateController,
          style: AppTextStyles.font14BlackMedium,
          decoration: InputDecoration(
            hintText: S.of(context).date_format_hint,
            hintStyle: AppTextStyles.font12GrayMedium,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.gray),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.gray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.primaryColordark),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).please_fill_all_fields;
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildTimeFields() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).start_time,
                style: AppTextStyles.font14BlackMedium,
              ),
              vGap(6),
              TextFormField(
                controller: _fromController,
                style: AppTextStyles.font14BlackMedium,
                decoration: InputDecoration(
                  hintText: S.of(context).time_format_hint,
                  hintStyle: AppTextStyles.font12GrayMedium,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: AppColors.gray),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: AppColors.gray),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: AppColors.primaryColordark),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).please_fill_all_fields;
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        hGap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).end_time,
                style: AppTextStyles.font14BlackMedium,
              ),
              vGap(6),
              TextFormField(
                controller: _toController,
                style: AppTextStyles.font14BlackMedium,
                decoration: InputDecoration(
                  hintText: S.of(context).time_format_hint,
                  hintStyle: AppTextStyles.font12GrayMedium,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: AppColors.gray),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: AppColors.gray),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: AppColors.primaryColordark),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).please_fill_all_fields;
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAttendanceSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).attendance_type,
          style: AppTextStyles.font14BlackMedium,
        ),
        vGap(6),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedAttendance,
              items: _attendanceTypes.map((attendance) {
                return DropdownMenuItem<String>(
                  value: attendance,
                  child: Text(
                    attendance == 'online' ? S.of(context).online : S.of(context).offline,
                    style: AppTextStyles.font14BlackMedium,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedAttendance = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHallIdField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).select_hall,
          style: AppTextStyles.font14BlackMedium,
        ),
        vGap(6),
        TextFormField(
          controller: _hallIdController,
          style: AppTextStyles.font14BlackMedium,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: S.of(context).hall_id_hint,
            hintStyle: AppTextStyles.font12GrayMedium,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.gray),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.gray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.primaryColordark),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).please_fill_all_fields;
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return BlocConsumer<UpdateSessionCubit, UpdateSessionState>(
      listener: (context, state) {
        if (state is UpdateSessionSuccess) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).session_updated_successfully),
              backgroundColor: AppColors.primaryColordark,
            ),
          );
        } else if (state is UpdateSessionError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: AppColors.redDark,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is UpdateSessionLoading) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.gray,
            ),
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.white,
              ),
            ),
          );
        }
        
        return CustomTextButton(
          fontSize: 14,
          text: S.of(context).change,
          onTap: () => _submitForm(context),
          primary: true,
        );
      },
    );
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final requestModel = UpdateSessionRequestModel(
        day: _selectedDay,
        date: _dateController.text,
        from: _fromController.text,
        to: _toController.text,
        attendance: _selectedAttendance,
        hallId: int.parse(_hallIdController.text),
      );

      context.read<UpdateSessionCubit>().updateSession(
        widget.lecture.id,
        requestModel,
      );
    }
  }

  String _getDayDisplayName(String day, BuildContext context) {
    switch (day) {
      case 'saturday':
        return S.of(context).saturday;
      case 'sunday':
        return S.of(context).sunday;
      case 'monday':
        return S.of(context).monday;
      case 'tuesday':
        return S.of(context).tuesday;
      case 'wednesday':
        return S.of(context).wednesday;
      case 'thursday':
        return S.of(context).thursday;
      default:
        return day;
    }
  }
}

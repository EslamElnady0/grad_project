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
    Map<String, dynamic> data = widget.lecture.postponed ??
        {
          'date': '2025-05-24',
          'day': 'sunday',
          'from': '8:30',
          'to': '10:30',
          'attendance': 'offline'
        };

    _dateController = TextEditingController(text: data['date'] ?? '2025-05-24');
    _fromController = TextEditingController(text: data['from'] ?? '8:30');
    _toController = TextEditingController(text: data['to'] ?? '10:30');
    _selectedDay = data['day'] ?? 'sunday';
    _selectedAttendance = data['attendance'] ?? 'offline';
  }

  @override
  void dispose() {
    _dateController.dispose();
    _fromController.dispose();
    _toController.dispose();
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
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            hintText: S.of(context).date_format_hint,
            hintStyle: AppTextStyles.font12GrayMedium,
            suffixIcon: Icon(Icons.calendar_today, color: AppColors.gray),
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
                readOnly: true,
                onTap: () => _selectTime(context, _fromController),
                decoration: InputDecoration(
                  hintText: S.of(context).time_format_hint,
                  hintStyle: AppTextStyles.font12GrayMedium,
                  suffixIcon: Icon(Icons.access_time, color: AppColors.gray),
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
                readOnly: true,
                onTap: () => _selectTime(context, _toController),
                decoration: InputDecoration(
                  hintText: S.of(context).time_format_hint,
                  hintStyle: AppTextStyles.font12GrayMedium,
                  suffixIcon: Icon(Icons.access_time, color: AppColors.gray),
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
                    attendance == 'online'
                        ? S.of(context).online
                        : S.of(context).offline,
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

  Widget _buildSubmitButton() {
    return BlocConsumer<UpdateSessionCubit, UpdateSessionState>(
      listener: (context, state) {
        if (state is UpdateSessionSuccess) {
          // Pop with result to indicate success and need to refresh
          Navigator.of(context).pop(true);
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
    // Custom validation instead of using form validation
    String? validationError = _validateForm();
    
    if (validationError != null) {
      _showValidationDialog(context, validationError);
      return;
    }

    final requestModel = UpdateSessionRequestModel(
      day: _selectedDay,
      date: _dateController.text,
      from: _fromController.text,
      to: _toController.text,
      attendance: _selectedAttendance,
    );

    // Debug print to check the exact format being sent
    print('Sending request with:');
    print('Day: ${requestModel.day}');
    print('Date: ${requestModel.date}');
    print('From: ${requestModel.from}');
    print('To: ${requestModel.to}');
    print('Attendance: ${requestModel.attendance}');

    context.read<UpdateSessionCubit>().updateSession(
          widget.lecture.id,
          requestModel,
        );
  }

  String? _validateForm() {
    // Check if date is empty or invalid
    if (_dateController.text.isEmpty) {
      return S.of(context).please_fill_all_fields;
    }
    if (!_isValidDateFormat(_dateController.text)) {
      return S.of(context).date_format_hint;
    }

    // Check if start time is empty or invalid
    if (_fromController.text.isEmpty) {
      return S.of(context).please_fill_all_fields;
    }
    if (!_isValidTimeFormat(_fromController.text)) {
      return S.of(context).time_format_hint;
    }

    // Check if end time is empty or invalid
    if (_toController.text.isEmpty) {
      return S.of(context).please_fill_all_fields;
    }
    if (!_isValidTimeFormat(_toController.text)) {
      return S.of(context).time_format_hint;
    }

    // Check if end time is after start time
    if (!_isTimeAfter(_toController.text, _fromController.text)) {
      return S.of(context).invalid_time_range;
    }

    return null; // No validation errors
  }

  void _showValidationDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'خطأ في البيانات',
            style: AppTextStyles.font16BlackBold,
          ),
          content: Text(
            message,
            style: AppTextStyles.font14BlackMedium,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'موافق',
                style: AppTextStyles.font14BlackMedium.copyWith(
                  color: AppColors.primaryColordark,
                ),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        );
      },
    );
  }

  // Time picker helper method
  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    // Parse current time or default to 8:00
    TimeOfDay initialTime = TimeOfDay(hour: 8, minute: 0);
    if (controller.text.isNotEmpty && _isValidTimeFormat(controller.text)) {
      final parts = controller.text.split(':');
      initialTime = TimeOfDay(
        hour: int.parse(parts[0]),
        minute: int.parse(parts[1]),
      );
    }

    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (selectedTime != null) {
      // Always use 24-hour format with leading zeros for consistency
      // This should match server expectations for H:i format
      final hour = selectedTime.hour.toString().padLeft(2, '0');
      final minute = selectedTime.minute.toString().padLeft(2, '0');
      final formattedTime = '$hour:$minute';
      controller.text = formattedTime;
      
      // Debug print to verify format
      print('Time picker selected: ${selectedTime.hour}:${selectedTime.minute}');
      print('Formatted time: $formattedTime');
    }
  }

  // Date picker helper method
  Future<void> _selectDate(BuildContext context) async {
    // Parse current date or default to today
    DateTime initialDate = DateTime.now();
    if (_dateController.text.isNotEmpty &&
        _isValidDateFormat(_dateController.text)) {
      try {
        initialDate = DateTime.parse(_dateController.text);
      } catch (e) {
        initialDate = DateTime.now();
      }
    }

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (selectedDate != null) {
      // Format to YYYY-MM-DD format
      final formattedDate =
          '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}';
      _dateController.text = formattedDate;
    }
  }

  // Date format validation (YYYY-MM-DD format)
  bool _isValidDateFormat(String date) {
    final dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!dateRegex.hasMatch(date)) return false;

    try {
      DateTime.parse(date);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Time format validation (accepts both HH:MM and H:MM formats)
  bool _isValidTimeFormat(String time) {
    // Accept formats like: 02:00, 14:30, 2:00, 23:59
    final timeRegex = RegExp(r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$');
    return timeRegex.hasMatch(time);
  }

 // Check if time1 is after time2
  bool _isTimeAfter(String time1, String time2) {
    if (!_isValidTimeFormat(time1) || !_isValidTimeFormat(time2)) {
      return false;
    }

    final parts1 = time1.split(':');
    final parts2 = time2.split(':');

    final minutes1 = int.parse(parts1[0]) * 60 + int.parse(parts1[1]);
    final minutes2 = int.parse(parts2[0]) * 60 + int.parse(parts2[1]);

    return minutes1 > minutes2;
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

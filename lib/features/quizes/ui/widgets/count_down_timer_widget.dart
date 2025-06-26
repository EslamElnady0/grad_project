import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';
import '../../data/models/get_quiz_using_id_response.dart';
import '../../logic/submit_quiz_cubit/submit_quiz_cubit.dart';
import '../cubit/quiz_cubit/quiz_cubit.dart';

class CountdownTimerWidget extends StatefulWidget {
  const CountdownTimerWidget({super.key});

  @override
  State<CountdownTimerWidget> createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late Duration _remainingTime;
  late Timer _timer;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeRemainingTime();
    if (!_hasError) {
      _startTimer();
    }
  }

  void _initializeRemainingTime() {
    try {
      final quizData = context.read<GetQuizByIdResponse>();
      final durationMinutes = quizData.data.duration; // e.g., 20 minutes
      final startTimeStr = quizData.data.startTime; // e.g., "02:29:00"

      // Split start time into hours, minutes, seconds
      final timeParts = startTimeStr.split(':');
      if (timeParts.length != 3) {
        throw FormatException('Invalid startTime format: $startTimeStr');
      }

      // Parse hours, minutes, seconds
      final hours = int.tryParse(timeParts[0]);
      final minutes = int.tryParse(timeParts[1]);
      final seconds = int.tryParse(timeParts[2]);

      // Validate parsed values
      if (hours == null ||
          minutes == null ||
          seconds == null ||
          hours < 0 ||
          hours > 23 ||
          minutes < 0 ||
          minutes > 59 ||
          seconds < 0 ||
          seconds > 59) {
        throw FormatException(
            'Invalid time values in startTime: $startTimeStr');
      }

      // Create DateTime for start time on current day
      final now = DateTime.now();
      final startDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        hours,
        minutes,
        seconds,
      );

      // Calculate elapsed time since start
      final elapsed = now.difference(startDateTime);
      final totalDuration = Duration(minutes: durationMinutes);
      _remainingTime = (totalDuration - elapsed) - const Duration(seconds: 10);

      // Handle edge cases
      if (_remainingTime.isNegative) {
        _remainingTime = Duration.zero; // Quiz has ended
      } else if (_remainingTime > totalDuration) {
        _remainingTime = totalDuration; // Quiz hasn't started
      }
    } catch (e) {
      _hasError = true;
      _remainingTime = Duration.zero; // Fallback to avoid crashes
      debugPrint('Error parsing startTime: $e');
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds > 0) {
        setState(() {
          _remainingTime = _remainingTime - const Duration(seconds: 1);
        });
      } else {
        _timer.cancel();
        final quizData = context.read<GetQuizByIdResponse>();
        context.read<QuizCubit>().prepareSubmission(quizData.data.questions);
        final submission = context.read<QuizCubit>().getSubmission();
        context.read<SubmitQuizCubit>().submitQuiz(
            quizId: quizData.data.id.toString(),
            submitQuizRequestModel: submission);
      }
    });
  }

  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.darkblue, width: 1.5),
            color: Colors.white,
          ),
          child: Text(
            _hasError
                ? '${S.of(context).timeRemaining} '
                : '${S.of(context).timeRemaining}  ${_formatTime(_remainingTime)}',
            textAlign: TextAlign.center,
            style: AppTextStyles.font13BlackSemiBold
                .copyWith(color: AppColors.darkblue),
          ),
        ),
      ],
    );
  }
}

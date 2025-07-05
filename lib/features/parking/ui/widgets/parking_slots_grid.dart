import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/parking/data/enums/parking_enum.dart';
import 'package:grad_project/features/parking/data/models/get_parking_slots_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../logic/parking_cubit/parking_cubit.dart';

class ParkingSlotsGrid extends StatelessWidget {
  final List<ParkingSlot> slots;
  const ParkingSlotsGrid({super.key, required this.slots});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = 2;
    final rowCount = (slots.length / crossAxisCount).ceil();
    return RefreshIndicator(
      color: AppColors.primaryColorlight,
      onRefresh: () async {
        await context.read<ParkingCubit>().fetchParkingSlots();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final cellWidth = constraints.maxWidth / crossAxisCount;
            final cellHeight = cellWidth * 0.5; // match childAspectRatio
            final gridHeight = cellHeight * rowCount;
            return SizedBox(
              width: constraints.maxWidth,
              height: gridHeight,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(constraints.maxWidth, gridHeight),
                    painter: _FullGridPainter(
                      columns: crossAxisCount,
                      rows: rowCount,
                    ),
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      childAspectRatio: 1 / 0.5,
                    ),
                    itemCount: slots.length,
                    itemBuilder: (context, index) {
                      final slot = slots[index];
                      return Center(
                        child: slot.parkingEnum == ParkingEnum.full
                            ? Transform.rotate(
                                angle: index % 2 != 0 ? 3.14 : 0,
                                child: Image.asset(
                                  Assets.imagesParkingCar,
                                ),
                              )
                            : Text(
                                slot.spotNumber.toString(),
                                style: AppTextStyles.font22GreenSemiBold
                                    .copyWith(color: AppColors.black),
                              ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FullGridPainter extends CustomPainter {
  final int columns;
  final int rows;
  _FullGridPainter({required this.columns, required this.rows});

  @override
  void paint(Canvas canvas, Size size) {
    final cellWidth = size.width / columns;
    final cellHeight = size.height / rows;
    final linePaint = Paint()..strokeWidth = 2.0;

    // Draw vertical lines
    for (int c = 1; c < columns; c++) {
      final x = cellWidth * c;
      linePaint.shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.grey.shade400,
          Colors.grey.shade400,
          Colors.grey.shade400,
          Colors.grey.shade400,
        ],
      ).createShader(Rect.fromLTWH(x, 0, 0, size.height));
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), linePaint);
    }
    // Draw horizontal lines
    for (int r = 0; r <= rows; r++) {
      final y = cellHeight * r;
      linePaint.shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.grey.shade400.withOpacity(0),
          Colors.grey.shade400,
          Colors.grey.shade400,
          Colors.grey.shade400.withOpacity(0),
        ],
        stops: const [0.0, 0.495, 0.505, 1.0],
      ).createShader(Rect.fromLTWH(0, y, size.width, 0));
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

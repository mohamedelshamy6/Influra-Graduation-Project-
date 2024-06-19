import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadio extends StatefulWidget {
  final int value;
  final int? groupValue;
  final String title;
  final void Function(int) onChanged;
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return Padding(
      padding: EdgeInsets.all(8.r),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        onTap: () => widget.onChanged(widget.value),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.title,
              //todo Change this style
              //*  style: AppTextStyles.cairo16SemiBoldBlack,
            ),
            SizedBox(width: 10.w),
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? Colors.white : Colors.grey[200],
                //todo Change this border
                //* border: selected
                //*     ? Border.all(color: AppColors.mainColor, width: 2)
                //*     : Border.all(color: AppColors.radioBorderColor, width: 2),
              ),
              child: Center(
                child: selected
                    ? const Icon(
                        Icons.circle,
                        size: 12,
                        //todo Change this color
                        //*  color: AppColors.mainColor,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

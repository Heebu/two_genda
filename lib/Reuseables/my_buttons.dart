import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartButton extends StatelessWidget {
  CartButton({
    super.key,
    required this.text,
    required this.isClicked,
    this.color,
  });

  final String text;
  final bool isClicked;
  Color? color = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      decoration: BoxDecoration(
          color: isClicked == true ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(width: isClicked ? 0 : 2)),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 12.sp,
            color: isClicked == true ? Colors.white : Colors.black),
      ),
    );
  }
}

class LiveButton extends StatelessWidget {
  const LiveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(30.r)),
      child: Text(
        'Live',
        style: TextStyle(color: Colors.white, fontSize: 12.sp),
      ),
    );
  }
}

class AppBarIcon extends StatelessWidget {
  AppBarIcon({
    super.key,
    required this.icon,
    this.color,
  });

  final IconData icon;
  Color? color = Colors.grey.shade200.withOpacity(.3);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.r)),
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Center(
        child: Icon(icon),
      ),
    );
  }
}

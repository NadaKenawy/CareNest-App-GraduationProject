import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Class for Baby Data Fields
class BabyDataFields extends StatefulWidget {
  final String hintText;
  final Gradient gradient;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool readOnly;
  final String? gender; // New parameter to track gender

  const BabyDataFields({
    super.key,
    required this.hintText,
    required this.gradient,
    required this.prefixIcon,
    this.controller,
    this.onTap,
    this.readOnly = false,
    this.gender, // Initialize gender
  });

  @override
  _BabyDataFieldsState createState() => _BabyDataFieldsState();
}

class _BabyDataFieldsState extends State<BabyDataFields> {
  bool isFieldEmpty = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    isFieldEmpty = widget.controller?.text.isEmpty ?? true;
  }

  Color _getBorderColor() {
    switch (widget.gender?.toLowerCase()) {
      case 'male':
        return ColorsManager.secondryBlueColor;
      case 'female':
        return ColorsManager.primaryPinkColor;
      default:
        return Colors.transparent;
    }
  }

  Color _getTextColor() {
    if (widget.gender == null || widget.gender!.isEmpty) {
      return Colors.black;
    }
    switch (widget.gender!.toLowerCase()) {
      case 'male':
        return ColorsManager.secondryBlueColor;
      case 'female':
        return ColorsManager.primaryPinkColor;
      default:
        return Colors.black;
    }
  }

  Color _getIconColor() {
    if (widget.gender == null || widget.gender!.isEmpty) {
      return Colors.white;
    }
    switch (widget.gender!.toLowerCase()) {
      case 'male':
        return ColorsManager.secondryBlueColor;
      case 'female':
        return ColorsManager.primaryPinkColor;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: _getBorderColor(),
        ),
        gradient: !hasError && isFieldEmpty ? widget.gradient : null,
        color: hasError ? Colors.white : null,
      ),
      child: TextFormField(
        controller: widget.controller,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        keyboardType: widget.hintText == 'Weight' || widget.hintText == 'Height'
            ? TextInputType.number
            : TextInputType.text,
        inputFormatters:
            widget.hintText == 'Weight' || widget.hintText == 'Height'
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: widget.gender == null || widget.gender!.isEmpty
              ? TextStyle(
                  foreground: Paint()
                    ..shader = widget.gradient.createShader(
                      const Rect.fromLTWH(0.0, 0.0, 200.0, 50.0),
                    ),
                )
              : TextStyle(color: _getTextColor()),
          prefixIcon: widget.gender == null || widget.gender!.isEmpty
              ? ShaderMask(
                  shaderCallback: (bounds) {
                    return widget.gradient.createShader(bounds);
                  },
                  child: Icon(
                    widget.prefixIcon,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                )
              : Icon(
                  widget.prefixIcon,
                  color: _getIconColor(),
                  size: 18.sp,
                ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: _getBorderColor(),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: _getBorderColor(),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: _getBorderColor(),
            ),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        validator: (value) {
          setState(() {
            hasError = value == null || value.isEmpty;
          });
          if (value == null || value.isEmpty) {
            return '${widget.hintText} is required';
          }
          return null;
        },
        style: TextStyle(
          color: _getTextColor(),
          fontSize: 14.sp,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BabyDataFields extends StatefulWidget {
  final String hintText;
  final Gradient gradient;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool readOnly;

  const BabyDataFields({
    super.key,
    required this.hintText,
    required this.gradient,
    required this.prefixIcon,
    this.controller,
    this.onTap,
    this.readOnly = false,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          width: 2.0,
          color: Colors.transparent,
        ),
        gradient: !hasError && isFieldEmpty
            ? widget.gradient
            : null, 
        color:
            hasError ? Colors.white : null, 
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
          hintStyle: TextStyle(
            foreground: Paint()
              ..shader = widget.gradient.createShader(
                const Rect.fromLTWH(0.0, 0.0, 200.0, 50.0),
              ),
          ),
          prefixIcon: ShaderMask(
            shaderCallback: (bounds) {
              return widget.gradient.createShader(bounds);
            },
            child: Icon(
              widget.prefixIcon,
              color: Colors.white,
              size: 18.sp,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              width: 2.0,
              style: BorderStyle.solid,
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              width: 2.0,
              style: BorderStyle.solid,
              color: Colors.transparent,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              width: 2.0,
              style: BorderStyle.solid,
              color: Colors.transparent,
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
          foreground: Paint()
            ..shader = widget.gradient.createShader(
              const Rect.fromLTWH(0.0, 0.0, 200.0, 50.0),
            ),
          fontSize: 14.sp,
        ),
      ),
    );
  }
}

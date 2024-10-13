import 'package:care_nest/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class FirstAndLastNameFields extends StatelessWidget{
  const FirstAndLastNameFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppTextFormField(
            hintText: "First Name",
            width: MediaQuery.of(context).size.width * 0.4,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: AppTextFormField(
            hintText: "Last Name",
            width: MediaQuery.of(context).size.width * 0.4,
          ),
        ),
      ],
    );
  }
}
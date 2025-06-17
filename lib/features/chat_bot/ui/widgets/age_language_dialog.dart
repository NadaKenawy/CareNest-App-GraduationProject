import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/text_styless.dart';

class AgeLanguageDialog extends StatefulWidget {
  final int? initialAge;
  final String? initialLanguage;
  final Function(int age, String language) onConfirm;

  const AgeLanguageDialog({
    super.key,
    this.initialAge,
    this.initialLanguage,
    required this.onConfirm,
  });

  @override
  State<AgeLanguageDialog> createState() => _AgeLanguageDialogState();
}

class _AgeLanguageDialogState extends State<AgeLanguageDialog> {
  int? selectedAge;
  String? selectedLang;

  @override
  void initState() {
    super.initState();
    selectedAge = widget.initialAge;
    selectedLang = widget.initialLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, size: 20, color: Colors.grey[600]),
                ),
              ),
              Text(
                'Welcome to BabyBot!',
                style: TextStyles.font20BlackSemiMedium.copyWith(
                  color: ColorsManager.primaryPinkColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please select your baby\'s age and preferred language',
                textAlign: TextAlign.center,
                style: TextStyles.font16BlackMedium.copyWith(
                  color: Colors.grey[600],
                  fontSize: 14.sp,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonFormField<int>(
                  value: selectedAge,
                  decoration: const InputDecoration(
                    labelText: 'Baby Age (months)',
                    border: InputBorder.none,
                  ),
                  items: List.generate(25, (i) => i)
                      .map((i) => DropdownMenuItem(value: i, child: Text('$i')))
                      .toList(),
                  onChanged: (v) => setState(() => selectedAge = v),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedLang,
                  decoration: const InputDecoration(
                    labelText: 'Language',
                    border: InputBorder.none,
                  ),
                  items: const [
                    DropdownMenuItem(value: 'en', child: Text('English')),
                    DropdownMenuItem(value: 'ar', child: Text('العربية')),
                  ],
                  onChanged: (v) => setState(() => selectedLang = v),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: AppTextButton(
                  buttonText: 'Start Chat',
                  textStyle: TextStyles.font16WhiteMedium,
                  onPressed: () {
                    if (selectedAge != null && selectedLang != null) {
                      widget.onConfirm(selectedAge!, selectedLang!);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

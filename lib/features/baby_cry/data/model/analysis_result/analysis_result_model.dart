import 'package:flutter/material.dart';

class AnalysisResultModel {
  final String icon, title, percentage;
 final Color color;

  const AnalysisResultModel( {
    required this.icon,
    required this.title,
    required this.percentage,
    required this.color,
  });
}

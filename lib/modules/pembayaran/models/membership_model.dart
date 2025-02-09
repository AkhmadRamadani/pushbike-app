import 'package:flutter/material.dart';

class MembershipModel {
  final String title;
  final String price;
  final String description;
  final bool isCurrent;
  final bool hasTerms;
  final LinearGradient gradient;
  final IconData icon;
  final List<String> terms;
  final bool isComingSoon;
  final String? errorText;

  MembershipModel({
    required this.title,
    required this.price,
    required this.description,
    required this.isCurrent,
    required this.hasTerms,
    required this.gradient,
    required this.icon,
    required this.terms,
    this.isComingSoon = false,
    this.errorText,
  });
}

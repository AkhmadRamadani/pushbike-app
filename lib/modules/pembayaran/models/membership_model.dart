import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/modules/authentication/models/responses/user_data.response.model.dart';

class MembershipModel {
  final String title;
  final String price;
  final String description;
  final bool isCurrent;
  final bool hasTerms;
  final LinearGradient gradient;
  final IconData icon;
  final List<String> terms;
  final String errorText;
  final bool isComingSoon;

  MembershipModel({
    required this.title,
    required this.price,
    required this.description,
    required this.isCurrent,
    required this.hasTerms,
    required this.gradient,
    required this.icon,
    required this.terms,
    this.errorText = "",
    this.isComingSoon = false,
  });

  factory MembershipModel.fromDataMembership(MembershipData data) {
    List<String> parsedTerms =
        List<String>.from(jsonDecode(data.syaratKetentuan ?? '[]'));

    return MembershipModel(
      title: data.judulMember ?? '',
      price: formatPrice(data.harga ?? '0'),
      description: (data.isPurchased ?? false)
          ? 'Anda saat ini sedang terdaftar di ${data.judulMember ?? ''}'
          : '',
      isCurrent: (data.isPurchased ?? false),
      hasTerms: parsedTerms.isNotEmpty,
      gradient: _getGradient(data.kategoriPembayaran ?? ''),
      icon: (data.isPurchased ?? false)
          ? Icons.verified_user_rounded
          : Icons.info_rounded,
      terms: parsedTerms,
      errorText: (data.isPurchased ?? false)
          ? "Maksimal batas pembayaran bulanan H+3"
          : "Anda belum memenuhi syarat. Silahkan cek S&K",
      isComingSoon:
          (data.kategoriPembayaran ?? "").toLowerCase().contains("pro"),
    );
  }

  static String formatPrice(String price) {
    double parsedPrice = double.tryParse(price) ?? 0.0;
    return parsedPrice > 0
        ? "IDR ${parsedPrice.toStringAsFixed(0).replaceAllMapped(
              RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
              (Match match) => '${match[1]}.',
            )}"
        : "COMING SOON";
  }

  static LinearGradient _getGradient(String title) {
    switch (title.toLowerCase()) {
      case 'reguler':
        return ColorConst.gradientGreen;
      case 'plus':
        return ColorConst.gradientYellow;
      case 'pro':
        return const LinearGradient(
          colors: [
            ColorGradientConst.textColour20,
            ColorGradientConst.textColour20
          ],
        );
      default:
        return ColorGradientConst.gradientRed;
    }
  }
}

// Color Constants
class ColorGradientConst {
  static const LinearGradient gradientRed = LinearGradient(
    colors: [Colors.red, Colors.redAccent],
  );

  static const Color textColour20 = Colors.grey;
}

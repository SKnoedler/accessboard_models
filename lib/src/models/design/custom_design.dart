import 'package:accessboard_models/src/models/design/design_enums.dart';
import 'package:flutter/material.dart';

// this design class can be used in individual widgets

class CustomDesign {
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? tertiaryColor;

  final BorderRadiusEnum? borderRadiusEnum;
  final BorderEnum? borderEnum;
  final ShadowEnum? shadowEnum;

  CustomDesign({
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
    this.borderRadiusEnum,
    this.borderEnum,
    this.shadowEnum,
  });

  factory CustomDesign.fromJson(Map<String, dynamic> json) {
    return CustomDesign(
      primaryColor: json['primaryColor'] != null
          ? Color(json['primaryColor'] as int)
          : null,
      secondaryColor: json['secondaryColor'] != null
          ? Color(json['secondaryColor'] as int)
          : null,
      tertiaryColor: json['tertiaryColor'] != null
          ? Color(json['tertiaryColor'] as int)
          : null,
      borderRadiusEnum: json['borderRadiusEnum'] != null
          ? BorderRadiusEnum.values
              .firstWhere((e) => e.name == json['borderRadiusEnum'])
          : null,
      borderEnum: json['borderEnum'] != null
          ? BorderEnum.values.firstWhere((e) => e.name == json['borderEnum'])
          : null,
      shadowEnum: json['shadowEnum'] != null
          ? ShadowEnum.values.firstWhere((e) => e.name == json['shadowEnum'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'primaryColor': primaryColor?.value,
      'secondaryColor': secondaryColor?.value,
      'tertiaryColor': tertiaryColor?.value,
      'borderRadiusEnum': borderRadiusEnum?.name,
      'borderEnum': borderEnum?.name,
      'shadowEnum': shadowEnum?.name,
    };
  }

  static BorderRadius? getBorderRadius(BorderRadiusEnum? value) {
    switch (value) {
      case BorderRadiusEnum.none:
        return BorderRadius.zero;
      case BorderRadiusEnum.small:
        return BorderRadius.circular(4);
      case BorderRadiusEnum.medium:
        return BorderRadius.circular(8);
      case BorderRadiusEnum.large:
        return BorderRadius.circular(16);
      default:
        return null;
    }
  }

  static Border? getBorder(BorderEnum? value) {
    switch (value) {
      case BorderEnum.none:
        return null;
      case BorderEnum.small:
        return Border.all(width: 1, color: Colors.grey.shade300);
      case BorderEnum.medium:
        return Border.all(width: 2, color: Colors.grey.shade300);
      case BorderEnum.large:
        return Border.all(width: 4, color: Colors.grey.shade300);
      default:
        return null;
    }
  }

  static Shadow? getShadow(ShadowEnum? value) {
    switch (value) {
      case ShadowEnum.none:
        return null;
      case ShadowEnum.small:
        return BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 4,
          offset: const Offset(0, 2),
        );
      case ShadowEnum.medium:
        return BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 8,
          offset: const Offset(0, 4),
        );
      case ShadowEnum.large:
        return BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 16,
          offset: const Offset(0, 8),
        );
      default:
        return null;
    }
  }
}

import 'package:accessboard_models/src/models/design/design_enums.dart';
import 'package:flutter/material.dart';

class CustomDesign {
  final int? primaryColor;
  final int? secondaryColor;
  final int? tertiaryColor;

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
      primaryColor: json['primaryColor'] as int?,
      secondaryColor: json['secondaryColor'] as int?,
      tertiaryColor: json['tertiaryColor'] as int?,
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
      'primaryColor': primaryColor,
      'secondaryColor': secondaryColor,
      'tertiaryColor': tertiaryColor,
      'borderRadiusEnum': borderRadiusEnum?.name,
      'borderEnum': borderEnum?.name,
      'shadowEnum': shadowEnum?.name,
    };
  }

  BorderRadius? get borderRadius {
    switch (borderRadiusEnum) {
      case BorderRadiusEnum.small:
        return BorderRadius.circular(5.0);
      case BorderRadiusEnum.medium:
        return BorderRadius.circular(10.0);
      case BorderRadiusEnum.large:
        return BorderRadius.circular(15.0);
      case BorderRadiusEnum.none:
        return BorderRadius.zero;
      case null:
        return null;
    }
  }

  BorderSide? getBorder() {
    switch (borderEnum) {
      case BorderEnum.thin:
        return BorderSide(width: 1.0);
      case BorderEnum.medium:
        return BorderSide(width: 2.0);
      case BorderEnum.thick:
        return BorderSide(width: 3.0);
      case BorderEnum.none:
        return BorderSide.none;
      case null:
        return null;
    }
  }

  BoxShadow? getShadow() {
    switch (shadowEnum) {
      case ShadowEnum.light:
        return BoxShadow(blurRadius: 1.0);
      case ShadowEnum.medium:
        return BoxShadow(blurRadius: 3.0);
      case ShadowEnum.dark:
        return BoxShadow(blurRadius: 5.0);
      case ShadowEnum.none:
        return null;
      case null:
        return null;
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomDesign &&
        other.primaryColor == primaryColor &&
        other.secondaryColor == secondaryColor &&
        other.tertiaryColor == tertiaryColor &&
        other.borderRadiusEnum == borderRadiusEnum &&
        other.borderEnum == borderEnum &&
        other.shadowEnum == shadowEnum;
  }

  @override
  int get hashCode =>
      primaryColor.hashCode ^
      secondaryColor.hashCode ^
      tertiaryColor.hashCode ^
      borderRadiusEnum.hashCode ^
      borderEnum.hashCode ^
      shadowEnum.hashCode;
}

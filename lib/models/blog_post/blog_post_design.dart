import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BlogPostDesign {
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? tertiaryColor;

  final BorderRadiusEnum? borderRadiusEnum;
  final BorderEnum? borderEnum;
  final ShadowEnum? shadowEnum;

  BlogPostDesign({
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
    this.borderRadiusEnum,
    this.borderEnum,
    this.shadowEnum,
  });

  factory BlogPostDesign.fromJson(Map<String, dynamic> json) {
    return BlogPostDesign(
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
              .firstWhere((e) => describeEnum(e) == json['borderRadiusEnum'])
          : null,
      borderEnum: json['borderEnum'] != null
          ? BorderEnum.values
              .firstWhere((e) => describeEnum(e) == json['borderEnum'])
          : null,
      shadowEnum: json['shadowEnum'] != null
          ? ShadowEnum.values
              .firstWhere((e) => describeEnum(e) == json['shadowEnum'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'primaryColor': primaryColor?.value,
      'secondaryColor': secondaryColor?.value,
      'tertiaryColor': tertiaryColor?.value,
      'borderRadiusEnum':
          borderRadiusEnum != null ? describeEnum(borderRadiusEnum!) : null,
      'borderEnum': borderEnum != null ? describeEnum(borderEnum!) : null,
      'shadowEnum': shadowEnum != null ? describeEnum(shadowEnum!) : null,
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

enum BorderRadiusEnum {
  none,
  small,
  medium,
  large,
}

enum BorderEnum {
  none,
  small,
  medium,
  large,
}

enum ShadowEnum {
  none,
  small,
  medium,
  large,
}

import 'package:flutter/material.dart';

class BlogPostDesign {
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? tertiaryColor;
  final BorderRadius? borderRadius;
  final Border? border;
  final Shadow? shadow;

  BlogPostDesign({
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
    this.borderRadius,
    this.border,
    this.shadow,
  });

  factory BlogPostDesign.fromJson(Map<String, dynamic> json) {
    return BlogPostDesign(
      primaryColor: json['primaryColor'] != null && json['primaryColor'] is int
          ? Color(json['primaryColor'])
          : null,
      secondaryColor:
          json['secondaryColor'] != null && json['secondaryColor'] is int
              ? Color(json['secondaryColor'])
              : null,
      tertiaryColor:
          json['tertiaryColor'] != null && json['tertiaryColor'] is int
              ? Color(json['tertiaryColor'])
              : null,
      borderRadius: _parseBorderRadius(json['borderRadius']),
      border: _parseBorder(json['border']),
      shadow: _parseShadow(json['shadow']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'primaryColor': primaryColor is Color ? primaryColor!.value : null,
      'secondaryColor': secondaryColor is Color ? secondaryColor!.value : null,
      'tertiaryColor': tertiaryColor is Color ? tertiaryColor!.value : null,
      'borderRadius': _serializeBorderRadius(borderRadius),
      'border': _serializeBorder(border),
      'shadow': _serializeShadow(shadow),
    };
  }

  static BorderRadius? _parseBorderRadius(String? value) {
    switch (value) {
      case 'none':
        return null;
      case 'small':
        return BorderRadius.circular(4);
      case 'medium':
        return BorderRadius.circular(8);
      case 'large':
        return BorderRadius.circular(16);
      default:
        return null;
    }
  }

  static String? _serializeBorderRadius(BorderRadius? value) {
    if (value == null) {
      return 'none';
    } else if (value == BorderRadius.circular(4)) {
      return 'small';
    } else if (value == BorderRadius.circular(8)) {
      return 'medium';
    } else if (value == BorderRadius.circular(16)) {
      return 'large';
    } else {
      return null;
    }
  }

  static Border? _parseBorder(String? value) {
    switch (value) {
      case 'none':
        return null;
      case 'small':
        return Border.all(width: 1, color: Colors.grey.shade300);
      case 'medium':
        return Border.all(width: 2, color: Colors.grey.shade300);
      case 'large':
        return Border.all(width: 4, color: Colors.grey.shade300);
      default:
        return null;
    }
  }

  static String? _serializeBorder(Border? value) {
    if (value == null) {
      return 'none';
    } else if (value.top.width == 1 &&
        value.top.color == Colors.grey.shade300) {
      return 'small';
    } else if (value.top.width == 2 &&
        value.top.color == Colors.grey.shade300) {
      return 'medium';
    } else if (value.top.width == 4 &&
        value.top.color == Colors.grey.shade300) {
      return 'large';
    } else {
      return null;
    }
  }

  static Shadow? _parseShadow(String? value) {
    switch (value) {
      case 'none':
        return null;
      case 'small':
        return BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 4,
          offset: const Offset(0, 2),
        );
      case 'medium':
        return BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 8,
          offset: const Offset(0, 4),
        );
      case 'large':
        return BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 16,
          offset: const Offset(0, 8),
        );
      default:
        return null;
    }
  }

  static String? _serializeShadow(Shadow? value) {
    if (value == null) {
      return 'none';
    } else if (value.blurRadius == 4 &&
        value.color == Colors.grey.shade300 &&
        value.offset == const Offset(0, 2)) {
      return 'small';
    } else if (value.blurRadius == 8 &&
        value.color == Colors.grey.shade300 &&
        value.offset == const Offset(0, 4)) {
      return 'medium';
    } else if (value.blurRadius == 16 &&
        value.color == Colors.grey.shade300 &&
        value.offset == const Offset(0, 8)) {
      return 'large';
    } else {
      return null;
    }
  }
}

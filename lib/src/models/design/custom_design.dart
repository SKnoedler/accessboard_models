import 'package:accessboard_models/src/models/design/design_enums.dart';

class DartCustomDesign {
  DartCustomDesign({
    this.backgroundColor,
    this.textColor,
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
    this.borderRadiusEnum,
    this.borderEnum,
    this.shadowEnum,
  });

  final int? backgroundColor;
  final int? textColor;

  final int? tertiaryColor;
  final int? primaryColor;
  final int? secondaryColor;

  final BorderRadiusEnum? borderRadiusEnum;
  final BorderEnum? borderEnum;
  final ShadowEnum? shadowEnum;

  factory DartCustomDesign.fromJson(Map<String, dynamic> json) {
    return DartCustomDesign(
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DartCustomDesign &&
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

/* class DartCustomDesign {
  DartCustomDesign({
    this.backgroundColor,
    this.textColor,
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
    this.borderRadiusEnum,
    this.borderEnum,
    this.shadowEnum,
  });

  final Color? backgroundColor;
  final Color? textColor;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? tertiaryColor;

  final BorderRadiusEnum? borderRadiusEnum;
  final BorderEnum? borderEnum;
  final ShadowEnum? shadowEnum;

  factory DartCustomDesign.fromJson(Map<String, dynamic> json) {
    return DartCustomDesign(
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

  BoxBorder? get border {
    switch (borderEnum) {
      case BorderEnum.thin:
        return Border.all(width: 1.0);
      case BorderEnum.medium:
        return Border.all(width: 2.0);
      case BorderEnum.thick:
        return Border.all(width: 3.0);
      case BorderEnum.none:
        return Border.all(
          width: 0.0,
          color: Colors.transparent,
        );
      case null:
        return null;
    }
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

  BoxShadow? get shadow {
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

    return other is DartCustomDesign &&
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
} */



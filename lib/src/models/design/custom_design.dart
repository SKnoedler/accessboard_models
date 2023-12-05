import 'package:accessboard_models/src/models/design/design_enums.dart';

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
}

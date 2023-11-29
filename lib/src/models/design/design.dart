import 'package:accessboard_models/src/models/design/design_enums.dart';

// collection: designs

class Design {
  final String designId;

  final int? backgroundColor;
  final int? primaryColor;
  final int? secondaryColor;
  final int? tertiaryColor;

  final BorderRadiusEnum? borderRadiusEnum;
  final BorderEnum? borderEnum;
  final ShadowEnum? shadowEnum;

  Design({
    required this.designId,
    this.backgroundColor,
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
    this.borderRadiusEnum,
    this.borderEnum,
    this.shadowEnum,
  });

  factory Design.fromJson(Map<String, dynamic> json) {
    return Design(
      designId: json['designId'] as String,
      backgroundColor: json['backgroundColor'] as int?,
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
      'designId': designId,
      'backgroundColor': backgroundColor,
      'primaryColor': primaryColor,
      'secondaryColor': secondaryColor,
      'tertiaryColor': tertiaryColor,
      'borderRadiusEnum': borderRadiusEnum?.name,
      'borderEnum': borderEnum?.name,
      'shadowEnum': shadowEnum?.name,
    };
  }
}

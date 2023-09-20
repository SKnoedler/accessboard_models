import 'package:accessboard_models/models/access_right/project_role_reference.dart';
import 'package:flutter/foundation.dart';

class AdminAccessRight extends AccessRightBase {
  final String organizationId;
  final String accessRightId;
  final String organizationName;

  AdminAccessRight({
    required this.organizationId,
    required this.accessRightId,
    required this.organizationName,
  }) : super._(state: AccessRightState.adminAccessRight);

  factory AdminAccessRight.fromJson(Map<String, dynamic> json) {
    return AdminAccessRight(
      organizationId: json['organizationId'],
      accessRightId: json['accessRightId'],
      organizationName: json['organizationName'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'organizationId': organizationId,
      'accessRightId': accessRightId,
      'organizationName': organizationName,
    });
    return json;
  }
}

class ProjectAccessRight extends AccessRightBase {
  final String accessRightId;
  final String organizationId;
  final List<ProjectRoleReference> projectReferences;

  ProjectAccessRight({
    required this.accessRightId,
    required this.organizationId,
    List<ProjectRoleReference>? projectReferences,
  })  : projectReferences = projectReferences ?? [],
        super._(state: AccessRightState.projectAccessRight);

  factory ProjectAccessRight.fromJson(Map<String, dynamic> json) {
    return ProjectAccessRight(
      accessRightId: json['accessRightId'],
      organizationId: json['organizationId'],
      projectReferences: (json['projectReferences'] as List<dynamic>)
          .map((e) => ProjectRoleReference.fromJson(e))
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'accessRightId': accessRightId,
      'organizationId': organizationId,
      'projectReferences': projectReferences.map((e) => e.toJson()).toList(),
    });
    return json;
  }
}

class NotRegistered extends AccessRightBase {
  NotRegistered() : super._(state: AccessRightState.notRegistered);

  factory NotRegistered.fromJson(Map<String, dynamic> json) {
    return NotRegistered();
  }
}

class NotAuthenticated extends AccessRightBase {
  NotAuthenticated() : super._(state: AccessRightState.notAuthenticated);

  factory NotAuthenticated.fromJson(Map<String, dynamic> json) {
    return NotAuthenticated();
  }
}

class AccessRightBase {
  final AccessRightState state;

  AccessRightBase._({
    required this.state,
  });
  factory AccessRightBase.fromJson(Map<String, dynamic> json) {
    final stateString = json['state'] as String;
    final state = AccessRightState.values.firstWhere(
      (e) => describeEnum(e) == stateString,
      orElse: () => AccessRightState.notRegistered,
    );
    return AccessRightBase._(
      state: state,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'state': describeEnum(state),
    };
  }
}

enum AccessRightState {
  adminAccessRight,
  projectAccessRight,
  notRegistered,
  notAuthenticated,
}

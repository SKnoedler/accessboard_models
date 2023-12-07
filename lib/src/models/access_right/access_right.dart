import 'package:accessboard_models/src/models/access_right/project_role_reference.dart';

/// Represents an admin access right.
///
/// An admin access right grants administrative privileges to a user within an organization.
/// It includes information such as the organization ID, access right ID, and organization name.
class AdminAccessRight extends AccessRightBase {
  final String organizationId;
  final String id;
  final String organizationName;

  AdminAccessRight({
    required this.organizationId,
    required this.id,
    required this.organizationName,
  }) : super._(state: AccessRightState.adminAccessRight);

  /// Creates an [AdminAccessRight] instance from a JSON map.
  factory AdminAccessRight.fromJson(Map<String, dynamic> json) {
    return AdminAccessRight(
      organizationId: json['organizationId'],
      id: json['id'],
      organizationName: json['organizationName'],
    );
  }

  @override

  /// Converts the [AdminAccessRight] instance to a JSON map.
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'organizationId': organizationId,
      'id': id,
      'organizationName': organizationName,
    });
    return json;
  }
}

/// Represents a project access right.
///
/// This class extends the [AccessRightBase] class and adds additional properties specific to project access rights.
/// It contains information such as the access right ID, organization ID, and a list of project role references.
class ProjectAccessRight extends AccessRightBase {
  final String id;
  final String organizationId;
  final List<ProjectRoleReference> projectReferences;

  ProjectAccessRight({
    required this.id,
    required this.organizationId,
    List<ProjectRoleReference>? projectReferences,
  })  : projectReferences = projectReferences ?? [],
        super._(state: AccessRightState.projectAccessRight);

  /// Creates a [ProjectAccessRight] instance from a JSON map.
  ///
  /// The JSON map should contain the following keys: 'id', 'organizationId', and 'projectReferences'.
  factory ProjectAccessRight.fromJson(Map<String, dynamic> json) {
    return ProjectAccessRight(
      id: json['id'],
      organizationId: json['organizationId'],
      projectReferences: (json['projectReferences'] as List<dynamic>)
          .map((e) => ProjectRoleReference.fromJson(e))
          .toList(),
    );
  }

  @override

  /// Converts the [ProjectAccessRight] instance to a JSON map.
  ///
  /// The returned JSON map will contain the following keys: 'id', 'organizationId', and 'projectReferences'.
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'id': id,
      'organizationId': organizationId,
      'projectReferences': projectReferences.map((e) => e.toJson()).toList(),
    });
    return json;
  }
}

/// Represents an access right that indicates the user is not registered.
class NotRegistered extends AccessRightBase {
  NotRegistered() : super._(state: AccessRightState.notRegistered);

  /// Creates a [NotRegistered] instance from a JSON map.
  factory NotRegistered.fromJson(Map<String, dynamic> json) {
    return NotRegistered();
  }
}

/// Represents an access right for a user who is not authenticated.
class NotAuthenticated extends AccessRightBase {
  NotAuthenticated() : super._(state: AccessRightState.notAuthenticated);

  /// Creates a [NotAuthenticated] instance from a JSON map.
  factory NotAuthenticated.fromJson(Map<String, dynamic> json) {
    return NotAuthenticated();
  }
}

/// Represents a base class for access rights.
///
/// An access right is a permission or privilege granted to a user or role
/// to perform certain actions or access certain resources.
///
/// This class provides a basic implementation for access rights,
/// including serialization and deserialization from JSON.
class AccessRightBase {
  final AccessRightState state;

  AccessRightBase._({
    required this.state,
  });

  /// Creates an instance of [AccessRightBase] from a JSON map.
  factory AccessRightBase.fromJson(Map<String, dynamic> json) {
    final stateString = json['state'] as String;
    final state = AccessRightState.values.firstWhere(
      (e) => e.name == stateString,
      orElse: () => AccessRightState.notRegistered,
    );
    return AccessRightBase._(
      state: state,
    );
  }

  /// Converts the [AccessRightBase] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'state': state.name,
    };
  }
}

/// Represents the state of an access right.
///
/// The [AccessRightState] enum defines the possible states of an access right,
/// including admin access, project access, not registered, and not authenticated.
enum AccessRightState {
  adminAccessRight,
  projectAccessRight,
  notRegistered,
  notAuthenticated,
}

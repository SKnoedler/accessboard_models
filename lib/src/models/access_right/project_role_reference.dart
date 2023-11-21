class ProjectRoleReference {
  const ProjectRoleReference({
    required this.projectId,
    required this.name,
    required this.role,
  });

  factory ProjectRoleReference.fromJson(Map<String, dynamic> json) {
    final roleString = json['role'] as String;
    final role = UserRole.values.firstWhere(
      (e) => e.name == roleString,
      orElse: () => UserRole.viewer,
    );
    return ProjectRoleReference(
      projectId: json['projectId'] as String,
      name: json['name'] as String,
      role: role,
    );
  }

  final String name;
  final String projectId;
  final UserRole role;

  Map<String, dynamic> toJson() {
    return {
      'projectId': projectId,
      'name': name,
      'role': role.name,
    };
  }
}

/// An enumeration of possible user roles.
enum UserRole { viewer, editor }

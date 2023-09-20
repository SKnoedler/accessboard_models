class ProjectReference {
  const ProjectReference({
    required this.projectId,
    required this.projectName,
  });

  factory ProjectReference.fromJson(Map<String, dynamic> json) {
    return ProjectReference(
      projectId: json['projectId'] as String,
      projectName: json['projectName'] as String,
    );
  }
  final String projectName;
  final String projectId;

  Map<String, dynamic> toJson() {
    return {
      'projectId': projectId,
      'projectName': projectName,
    };
  }
}

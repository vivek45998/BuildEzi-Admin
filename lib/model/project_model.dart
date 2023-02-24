class ProjectDetail {
  ProjectDetail({
     this.id,
    this.projectName,
 this.projectId,
 this.clientName,
  this.type,
  });

  String? id;
  String ?projectName;
  String ?projectId;
  String ?clientName;
  String ?type;

  factory ProjectDetail.fromJson(Map<String, dynamic> json) => ProjectDetail(
    id: json["id"],
    projectName: json["projectName"],
    projectId: json["projectId"],
    clientName: json["clientName"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "projectName": projectName,
    "projectId": projectId,
    "clientName": clientName,
    "type": type,
  };
}

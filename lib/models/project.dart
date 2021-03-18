class Project {
  String uuid;
  String name;
  String directory;

  Project({
    this.uuid,
    this.name,
    this.directory,
  });

  Project.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    directory = json['directory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['directory'] = this.directory;
    return data;
  }
}

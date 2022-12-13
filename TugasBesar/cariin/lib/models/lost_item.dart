class LostItem {
  String? uid;
  final String? path;
  final String? name;
  final String? desc;
  final String? datelost;
  final String? status;

  LostItem(
      {this.uid = '',
      required this.path,
      required this.name,
      required this.desc,
      required this.datelost,
      required this.status});

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'path': path,
        'name': name,
        'desc': desc,
        'datelost': datelost,
        'status': status
      };

  static LostItem fromJson(Map<String, dynamic> json) => LostItem(
      uid: json['uid'],
      path: json['path'],
      name: json['name'],
      desc: json['desc'],
      datelost: json['datelost'],
      status: json['status']);
}

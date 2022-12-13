class LostItem {
  String? uid;
  final String? path;
  final String? name;
  final String? desc;
  final String? datelost;

  LostItem(
      {this.uid = '',
      required this.path,
      required this.name,
      required this.desc,
      required this.datelost});

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'path': path,
        'name': name,
        'desc': desc,
        'datelost': datelost
      };

  static LostItem fromJson(Map<String, dynamic> json) => LostItem(
      uid: json['uid'],
      path: json['path'],
      name: json['name'],
      desc: json['desc'],
      datelost: json['datelost']);
}

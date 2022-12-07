class LostItem {
  String? uid;
  final String? name;
  final String? desc;
  final String? datelost;

  LostItem(
      {this.uid = '',
      required this.name,
      required this.desc,
      required this.datelost});

  Map<String, dynamic> toJson() =>
      {'uid': uid, 'name': name, 'desc': desc, 'datelost': datelost};

  static LostItem fromJson(Map<String, dynamic> json) => LostItem(
      uid: json['uid'],
      name: json['name'],
      desc: json['desc'],
      datelost: json['datelost']);
}

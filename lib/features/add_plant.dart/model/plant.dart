class Plant {
  final String name;
  final String status;
  final String img;

  Plant({required this.name, required this.status, required this.img});

  Map<String, dynamic> toJson() {
    return {'name': name, 'status': status, 'img': img};
  }

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(name: json['name'], status: json['status'], img: json['img']);
  }
}

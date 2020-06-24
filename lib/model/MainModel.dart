
///首页数据模型
class MainModel {
  String title;
  String image;
  List<Subject> list;

  MainModel({this.title, this.image, this.list});

  MainModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    if (json['list'] != null) {
      list = new List<Subject>();
      json['list'].forEach((v) {
        list.add(new Subject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subject {
  int id;
  String name;
  String image;

  Subject({this.id, this.name, this.image});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
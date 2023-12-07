class ImageModel {
  int? created;
  List<Image>? data;

  ImageModel({this.created, this.data});

  ImageModel.fromJson(Map<String, dynamic> json) {
    created = json['created'];
    if (json['data'] != null) {
      data = <Image>[];
      json['data'].forEach((v) {
        data!.add(new Image.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created'] = this.created;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Image {
  String? url;

  Image({this.url});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

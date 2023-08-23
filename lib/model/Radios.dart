/// id : 10
/// name : "Radio Alzain Mohammad Ahmad"
/// url : "https://Qurango.net/radio/alzain_mohammad_ahmad"

class RadioResponse {
  List<Radios> radios = [];

  RadioResponse.fromJson(dynamic json) {
    json['radios'].forEach((v) {
      radios.add(Radios.fromJson(v));
    });
  }
}


class Radios {
  int? id;
  String? name;
  String? url;

  Radios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }
}


/* 

/// id : 10
/// name : "Radio Alzain Mohammad Ahmad"
/// url : "https://Qurango.net/radio/alzain_mohammad_ahmad"

class Radios {
  RadiosModel? radiosModel;

  Radios.fromJson(Map<String, dynamic> json){
    radiosModel = RadiosModel.fromJson(json['radios']);
  }
}

class RadiosModel {
  int? id;
  String? name;
  String? url;

  RadiosModel({
    this.id,
    this.name,
    this.url,
  });

  RadiosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    return map;
  }
}
*/
class GreetingModel {
  String? status;
  int? totalRec;
  String? message;
  List<DataModel>? data;

  GreetingModel({this.status, this.totalRec, this.message, this.data});

  GreetingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalRec = json['total_rec'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((v) {
        data!.add(DataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['total_rec'] = totalRec;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataModel {
  String? id;
  String? welcometh;
  String? welcomeen;
  String? status;

  DataModel({this.id, this.welcometh, this.welcomeen, this.status});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    welcometh = json['welcometh'];
    welcomeen = json['welcomeen'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['welcometh'] = welcometh;
    data['welcomeen'] = welcomeen;
    data['status'] = status;
    return data;
  }
}

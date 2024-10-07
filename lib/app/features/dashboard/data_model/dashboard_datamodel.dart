class DashboardDataModel {
  List<DashboardSliderContent>? dashboardSliderContent;
  List<Province>? province;
  List<Slot>? slot;
  List<ProvinceSlotList>? provinceSlotList;
  List<BannerImages>? bannerImages;

  DashboardDataModel(
      {this.dashboardSliderContent,
        this.province,
        this.slot,
        this.provinceSlotList,
        this.bannerImages});

  DashboardDataModel.fromJson(Map<String, dynamic> json) {
    if (json['dashboardSliderContent'] != null) {
      dashboardSliderContent = <DashboardSliderContent>[];
      json['dashboardSliderContent'].forEach((v) {
        dashboardSliderContent!.add(DashboardSliderContent.fromJson(v));
      });
    }
    if (json['province'] != null) {
      province = <Province>[];
      json['province'].forEach((v) {
        province!.add(Province.fromJson(v));
      });
    }
    if (json['slot'] != null) {
      slot = <Slot>[];
      json['slot'].forEach((v) {
        slot!.add(Slot.fromJson(v));
      });
    }
    if (json['province&slotList'] != null) {
      provinceSlotList = <ProvinceSlotList>[];
      json['province&slotList'].forEach((v) {
        provinceSlotList!.add(ProvinceSlotList.fromJson(v));
      });
    }
    if (json['bannerImages'] != null) {
      bannerImages = <BannerImages>[];
      json['bannerImages'].forEach((v) {
        bannerImages!.add(BannerImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (dashboardSliderContent != null) {
      data['dashboardSliderContent'] =
          dashboardSliderContent!.map((v) => v.toJson()).toList();
    }
    if (province != null) {
      data['province'] = province!.map((v) => v.toJson()).toList();
    }
    if (slot != null) {
      data['slot'] = slot!.map((v) => v.toJson()).toList();
    }
    if (provinceSlotList != null) {
      data['province&slotList'] =
          provinceSlotList!.map((v) => v.toJson()).toList();
    }
    if (bannerImages != null) {
      data['bannerImages'] = bannerImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DashboardSliderContent {
  String? id;
  String? path;
  String? heading;
  String? data;

  DashboardSliderContent({this.id, this.path, this.heading, this.data});

  DashboardSliderContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    heading = json['heading'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['path'] = path;
    data['heading'] = heading;
    data['data'] = this.data;
    return data;
  }
}

class Province {
  String? image;
  String? title;

  Province({this.image, this.title});

  Province.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = image;
    data['title'] = title;
    return data;
  }
}

class Slot {
  String? image;
  String? text;

  Slot({this.image, this.text});

  Slot.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = image;
    data['text'] = text;
    return data;
  }
}

class ProvinceSlotList {
  String? name;
  String? slot;

  ProvinceSlotList({this.name, this.slot});

  ProvinceSlotList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['slot'] = slot;
    return data;
  }
}

class BannerImages {
  String? id;
  String? imagePath;

  BannerImages({this.id, this.imagePath});

  BannerImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['imagePath'] = imagePath;
    return data;
  }
}

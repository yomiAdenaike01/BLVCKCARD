import 'dart:convert';

class Resturant {
  String title;
  String description;
  String leadImage;
  String announcement;
  String category;
  String address;
  int averagePrice;
  int discount;
  bool saved;
  Map<String, dynamic> openingTimes;
  List<String> tags, images;

  Resturant({
    this.title,
    this.description,
    this.category,
    this.saved,
    this.tags,
    this.openingTimes,
    this.averagePrice,
    this.discount,
    this.leadImage,
    this.images,
    this.announcement,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'announcement': announcement,
      'description': description,
      'lead_image': leadImage,
      'category': category,
      'address': address,
      'average_price': averagePrice,
      'discount': discount,
      'saved': saved,
      'opening_times': openingTimes,
      'images': images,
    };
  }

  factory Resturant.fromMap(Map<String, dynamic> map) {
    return Resturant(
      title: map['title'],
      description: map['description'],
      announcement: map['announcement'],
      leadImage: map['leadImage'],
      category: map['category'],
      address: map['address'],
      averagePrice: map['average_price'],
      discount: map['discount'],
      saved: map['saved'],
      openingTimes: Map<String, dynamic>.from(map['opening_times']),
      images: List<String>.from(map['images']?.map((x) => x)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Resturant.fromJson(String source) =>
      Resturant.fromMap(json.decode(source));
}

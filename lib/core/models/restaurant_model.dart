
class RestaurantModel{
  int? id;
  String? name;
  String? imgURL;
  String? cuisines;
  double? ratingStar;
  int? review;
  int? priceForTwo;
  String? address;
  String? addressFull;
  String? openTime;
  String? currency;
  List<String>? highlights;

  RestaurantModel({
    this.id, this.name,
    this.imgURL, this.cuisines,
    this.ratingStar, this.review,
    this.priceForTwo, this.address,
    this.addressFull, this.openTime,
    this.highlights, this.currency
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {

    //* Initialize highlight list value
    var _highlight = <String>[];
    json["highlights"].forEach((val) {
      _highlight.add(val);
    });

    return RestaurantModel(
        id: int?.parse(json["id"].toString()),
        name: json["name"] ?? "",
        imgURL: json["featured_image"] ?? "",
        cuisines: json["cuisines"] ?? "",
        ratingStar: double?.parse(json["user_rating"]["aggregate_rating"].toString()),
        review: int?.parse(json["user_rating"]["votes"].toString()),
        priceForTwo: int?.parse(json["average_cost_for_two"].toString()),
        address: json["location"]["locality_verbose"] ?? "",
        addressFull: json["location"]["address"] ?? "",
        openTime: json["timings"] ?? "",
        highlights: _highlight,
        currency: json["currency"] ?? ""
    );
  }
}
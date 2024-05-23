
class PetsModel {
    final List<Datum> data;

    PetsModel({
        required this.data,
    });

    factory PetsModel.fromJson(Map<String, dynamic> json) => PetsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );


}

class Datum {
    final int id;
    final String userName;
    final String petName;
    final String petImage;
    final bool isFriendly;

    Datum({
        required this.id,
        required this.userName,
        required this.petName,
        required this.petImage,
        required this.isFriendly,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userName: json["userName"],
        petName: json["petName"],
        petImage: json["petImage"],
        isFriendly: json["isFriendly"],
    );

}

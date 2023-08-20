class PlanetsModel {
  final String? image;
  final String? name;
  final double? size;
  final double? distanceFromEarth;
  final int? temperature;

  PlanetsModel({
    required this.image,
    required this.name,
    required this.size,
    required this.distanceFromEarth,
    this.temperature,
  });

  toJson() {
    return {
      "image": image,
      "name": name,
      "size": size,
      "distanceFromEarth": distanceFromEarth,
      "temperature": temperature
    };
  }
}

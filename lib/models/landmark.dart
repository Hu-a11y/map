class Landmark {
  final String title;
  final String subtitle;
  final String description;
  final String image;
  final String audio;
  final double latitude;
  final double longitude;

  Landmark({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
    required this.audio,
    required this.latitude,
    required this.longitude,
  });

 
  factory Landmark.fromJson(Map<String, dynamic> json) {
    return Landmark(
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      image: json['image'],
      audio: json['audio'],
      latitude: json['latitude'] ?? 0,
      longitude: json['longitude'] ?? 0,
    );
  }
}

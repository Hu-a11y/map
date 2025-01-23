
class Landmark {
  final String title;
  final String subtitle;
  final String description;
  final String image;
  final String audio;

  Landmark({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
    required this.audio,
  });

  // Factory method to create an instance from a map
  factory Landmark.fromJson(Map<String, dynamic> json) {
    return Landmark(
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      image: json['image'],
      audio: json['audio'],
    );
  }
}

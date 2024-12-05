class MovieModel {
  final String name;
  final String imageUrl;
  final String? description;
  final int? currentSession;
  final int? currentEpisodes;

  MovieModel({
    required this.name,
    required this.imageUrl,
    this.description,
    this.currentSession,
    this.currentEpisodes,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'currentSession': currentSession,
      'currentEpisodes': currentEpisodes,
    };
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      currentSession: json['currentSession'],
      currentEpisodes: json['currentEpisodes'],
    );
  }
}
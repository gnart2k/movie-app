class MovieProps {
  final HeaderProps header;
  final BannerProps banner;
  final List<SectionProps> sections;
  final CallToActionProps callToAction;
  final FooterProps footer;

  MovieProps({
    required this.header,
    required this.banner,
    required this.sections,
    required this.callToAction,
    required this.footer,
  });

  factory MovieProps.fromJson(Map<String, dynamic> json) {
    return MovieProps(
      header: HeaderProps.fromJson(json["header"]),
      banner: BannerProps.fromJson(json["banner"]),
      sections: (json["sections"] as List)
          .map((item) => SectionProps.fromJson(item))
          .toList(),
      callToAction: CallToActionProps.fromJson(json["callToAction"]),
      footer: FooterProps.fromJson(json["footer"]),
    );
  }
}

class HeaderProps {
  final String logo;
  final List<String> navigationLinks;

  HeaderProps({
    required this.logo,
    required this.navigationLinks,
  });

  factory HeaderProps.fromJson(Map<String, dynamic> json) {
    return HeaderProps(
      logo: json["logo"],
      navigationLinks: List<String>.from(json["navigationLinks"]),
    );
  }
}

class BannerProps {
  final String title;
  final List<String> buttons;

  BannerProps({
    required this.title,
    required this.buttons,
  });

  factory BannerProps.fromJson(Map<String, dynamic> json) {
    return BannerProps(
      title: json["title"],
      buttons: List<String>.from(json["buttons"]),
    );
  }
}

class SectionProps {
  final String type;
  final String title;
  final List<String>? genres;
  final List<GenreMoviesProps>? genreMovies;
  final List<String>? movies;
  final List<String>? shows;

  SectionProps({
    required this.type,
    required this.title,
    this.genres,
    this.genreMovies,
    this.movies,
    this.shows,
  });

  factory SectionProps.fromJson(Map<String, dynamic> json) {
    return SectionProps(
      type: json["type"],
      title: json["title"],
      genres: json["genres"] is List<String>
          ? List<String>.from(json["genres"])
          : null,
      genreMovies: json["genres"] is List
          ? (json["genres"] as List)
              .map((item) => GenreMoviesProps.fromJson(item))
              .toList()
          : null,
      movies: json["movies"] is List<String>
          ? List<String>.from(json["movies"])
          : null,
      shows: json["shows"] is List<String>
          ? List<String>.from(json["shows"])
          : null,
    );
  }
}

class GenreMoviesProps {
  final String name;
  final List<String> movies;

  GenreMoviesProps({
    required this.name,
    required this.movies,
  });

  factory GenreMoviesProps.fromJson(Map<String, dynamic> json) {
    return GenreMoviesProps(
      name: json["name"],
      movies: List<String>.from(json["movies"]),
    );
  }
}

class CallToActionProps {
  final String text;
  final String button;

  CallToActionProps({
    required this.text,
    required this.button,
  });

  factory CallToActionProps.fromJson(Map<String, dynamic> json) {
    return CallToActionProps(
      text: json["text"],
      button: json["button"],
    );
  }
}

class FooterProps {
  final List<String> navigationLinks;
  final List<String> socialMedia;

  FooterProps({
    required this.navigationLinks,
    required this.socialMedia,
  });

  factory FooterProps.fromJson(Map<String, dynamic> json) {
    return FooterProps(
      navigationLinks: List<String>.from(json["navigationLinks"]),
      socialMedia: List<String>.from(json["socialMedia"]),
    );
  }
}

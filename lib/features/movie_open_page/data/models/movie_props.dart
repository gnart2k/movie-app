class MovieProps {
  final HeaderProps header;
  final MovieSectionProps movieSection;
  final CastSectionProps castSection;
  final ReviewsSectionProps reviewsSection;
  final CallToActionProps callToAction;
  final FooterProps footer;

  MovieProps({
    required this.header,
    required this.movieSection,
    required this.castSection,
    required this.reviewsSection,
    required this.callToAction,
    required this.footer,
  });

  factory MovieProps.fromJson(Map<String, dynamic> json) {
    return MovieProps(
      header: HeaderProps.fromJson(json['header']),
      movieSection: MovieSectionProps.fromJson(json['movieSection']),
      castSection: CastSectionProps.fromJson(json['castSection']),
      reviewsSection: ReviewsSectionProps.fromJson(json['reviewsSection']),
      callToAction: CallToActionProps.fromJson(json['callToAction']),
      footer: FooterProps.fromJson(json['footer']),
    );
  }
}

class HeaderProps {
  final String logo;
  final bool menuIcon;

  HeaderProps({
    required this.logo,
    required this.menuIcon,
  });

  factory HeaderProps.fromJson(Map<String, dynamic> json) {
    return HeaderProps(
      logo: json['logo'],
      menuIcon: json['menuIcon'],
    );
  }
}

class MovieSectionProps {
  final String title;
  final List<ButtonProps> buttons;
  final String description;
  final DetailsProps details;

  MovieSectionProps({
    required this.title,
    required this.buttons,
    required this.description,
    required this.details,
  });

  factory MovieSectionProps.fromJson(Map<String, dynamic> json) {
    return MovieSectionProps(
      title: json['title'],
      buttons: (json['buttons'] as List)
          .map((button) => ButtonProps.fromJson(button))
          .toList(),
      description: json['description'],
      details: DetailsProps.fromJson(json['details']),
    );
  }
}

class ButtonProps {
  final String text;
  final String action;

  ButtonProps({
    required this.text,
    required this.action,
  });

  factory ButtonProps.fromJson(Map<String, dynamic> json) {
    return ButtonProps(
      text: json['text'],
      action: json['action'],
    );
  }
}

class DetailsProps {
  final int releaseYear;
  final List<String> availableLanguages;
  final RatingsProps ratings;
  final List<String> genres;
  final String director;
  final String music;

  DetailsProps({
    required this.releaseYear,
    required this.availableLanguages,
    required this.ratings,
    required this.genres,
    required this.director,
    required this.music,
  });

  factory DetailsProps.fromJson(Map<String, dynamic> json) {
    return DetailsProps(
      releaseYear: json['releaseYear'],
      availableLanguages: List<String>.from(json['availableLanguages']),
      ratings: RatingsProps.fromJson(json['ratings']),
      genres: List<String>.from(json['genres']),
      director: json['director'],
      music: json['music'],
    );
  }
}

class RatingsProps {
  final double imdb;
  final double streamVibe;

  RatingsProps({
    required this.imdb,
    required this.streamVibe,
  });

  factory RatingsProps.fromJson(Map<String, dynamic> json) {
    return RatingsProps(
      imdb: json['IMDb'],
      streamVibe: json['StreamVibe'],
    );
  }
}

class CastSectionProps {
  final String title;
  final List<CastMemberProps> castMembers;

  CastSectionProps({
    required this.title,
    required this.castMembers,
  });

  factory CastSectionProps.fromJson(Map<String, dynamic> json) {
    return CastSectionProps(
      title: json['title'],
      castMembers: (json['castMembers'] as List)
          .map((castMember) => CastMemberProps.fromJson(castMember))
          .toList(),
    );
  }
}

class CastMemberProps {
  final String name;
  final String image;

  CastMemberProps({
    required this.name,
    required this.image,
  });

  factory CastMemberProps.fromJson(Map<String, dynamic> json) {
    return CastMemberProps(
      name: json['name'],
      image: json['image'],
    );
  }
}

class ReviewsSectionProps {
  final String title;
  final List<ReviewProps> reviews;

  ReviewsSectionProps({
    required this.title,
    required this.reviews,
  });

  factory ReviewsSectionProps.fromJson(Map<String, dynamic> json) {
    return ReviewsSectionProps(
      title: json['title'],
      reviews: (json['reviews'] as List)
          .map((review) => ReviewProps.fromJson(review))
          .toList(),
    );
  }
}

class ReviewProps {
  final String author;
  final double rating;
  final String comment;
  final String location;

  ReviewProps({
    required this.author,
    required this.rating,
    required this.comment,
    required this.location,
  });

  factory ReviewProps.fromJson(Map<String, dynamic> json) {
    return ReviewProps(
      author: json['author'],
      rating: json['rating'],
      comment: json['comment'],
      location: json['location'],
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
      text: json['text'],
      button: json['button'],
    );
  }
}

class FooterProps {
  final List<String> navigationLinks;
  final List<String> legalLinks;
  final String copyright;

  FooterProps({
    required this.navigationLinks,
    required this.legalLinks,
    required this.copyright,
  });

  factory FooterProps.fromJson(Map<String, dynamic> json) {
    return FooterProps(
      navigationLinks: List<String>.from(json['navigationLinks']),
      legalLinks: List<String>.from(json['legalLinks']),
      copyright: json['copyright'],
    );
  }
}

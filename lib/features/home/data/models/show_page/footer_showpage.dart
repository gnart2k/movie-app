class FooterShowPage {
  final List<String> navigationLinks;
  final List<String> socialMedia;

  FooterShowPage({
    required this.navigationLinks,
    required this.socialMedia,
  });

  factory FooterShowPage.fromJson(Map<String, dynamic> json) {
    return FooterShowPage(
      navigationLinks: List<String>.from(json['navigationLinks'] as List),
      socialMedia: List<String>.from(json['socialMedia'] as List),
    );
  }
}

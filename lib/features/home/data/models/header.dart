class HeaderProps {
  final String logo;
  final List<String> navigationLinks;

  HeaderProps({required this.logo, required this.navigationLinks});

  factory HeaderProps.fromJson(dynamic json) {
    List<String> navString = json["navigationLinks"]
        .map((e) => e.toString())
        .toList()
        .cast<String>();
    return HeaderProps(logo: json["logo"], navigationLinks: navString);
  }
}

import 'package:movie_app/features/home/presentation/view_models/header_view_model.dart';

class HeaderProps {
  final String logo;
  final List<NavigationLinkModel> navigationLinks;

  HeaderProps({required this.logo, required this.navigationLinks});

  factory HeaderProps.fromJson(dynamic json) {
    List<NavigationLinkModel> navItemList = json["navigationLinks"]
        .map<NavigationLinkModel>((e) => NavigationLinkModel(url: e.toString()))
        .toList();
    return HeaderProps(logo: json["logo"], navigationLinks: navItemList);
  }

  HeaderProps copyWith({
    String? logo,
    List<NavigationLinkModel>? navigationLinks,
  }) {
    return HeaderProps(
      logo: logo ?? this.logo,
      navigationLinks: navigationLinks ?? this.navigationLinks,
    );
  }

  HeaderProps toggleItem({required int requiredIndex}) {
    for (int i = 0; i < navigationLinks.length; i++) {
      navigationLinks[i].isSelected = (i == requiredIndex);
    }

    // navigationLinks.asMap().forEach((index, item) {
    //   if (index == requiredIndex) {
    //     navigationLinks[index].isSelected = true;
    //   }
    //   navigationLinks[index].isSelected = false;
    // });
    return HeaderProps(logo: logo, navigationLinks: navigationLinks);
  }
}

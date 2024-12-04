class HomeProps {
  final BannerProps banner;
  final List<ContentCategoryProps> contentCategories;
  final DeviceCompatibilitiyProps deviceCompatibilitiy;
  final SubscriptionPlanProps subscriptionPlans;
  final FaqSectionProps faqSection;
  final FooterProps footer;

  HomeProps({
    required this.banner,
    required this.contentCategories,
    required this.deviceCompatibilitiy,
    required this.subscriptionPlans,
    required this.faqSection,
    required this.footer,
  });

  factory HomeProps.fromJson(Map<String, dynamic> json) {
    return HomeProps(
      banner: BannerProps.fromJson(json["banner"]),
      contentCategories: (json["contentCategories"] as List)
          .map((item) => ContentCategoryProps.fromJson(item))
          .toList(),
      deviceCompatibilitiy:
          DeviceCompatibilitiyProps.fromJson(json["deviceCompatibility"]),
      subscriptionPlans:
          SubscriptionPlanProps.fromJson(json["subscriptionPlans"]),
      faqSection: FaqSectionProps.fromJson(json["faqSection"]),
      footer: FooterProps.fromJson(json["footer"]),
    );
  }
}

class BannerProps {
  final String title;
  final String button;

  BannerProps({required this.title, required this.button});

  factory BannerProps.fromJson(Map<String, dynamic> json) {
    return BannerProps(
      title: json["title"],
      button: json["button"],
    );
  }
}

class ContentCategoryProps {
  final String name;

  ContentCategoryProps({required this.name});

  factory ContentCategoryProps.fromJson(Map<String, dynamic> json) {
    return ContentCategoryProps(name: json["name"]);
  }
}

class DeviceCompatibilitiyProps {
  final String title;
  final List<String> devices;

  DeviceCompatibilitiyProps({required this.title, required this.devices});

  factory DeviceCompatibilitiyProps.fromJson(Map<String, dynamic> json) {
    return DeviceCompatibilitiyProps(
      title: json["title"],
      devices: List<String>.from(json["devices"]),
    );
  }
}

class SubscriptionPlanProps {
  final String title;
  final List<PlanProps> plans;

  SubscriptionPlanProps({required this.title, required this.plans});

  factory SubscriptionPlanProps.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlanProps(
      title: json["title"],
      plans: (json["plans"] as List)
          .map((item) => PlanProps.fromJson(item))
          .toList(),
    );
  }
}

class PlanProps {
  final String name;
  final String price;
  final String currency;
  final String period;

  PlanProps({
    required this.name,
    required this.price,
    required this.currency,
    required this.period,
  });

  factory PlanProps.fromJson(Map<String, dynamic> json) {
    return PlanProps(
      name: json["name"],
      price: json["price"],
      currency: json["currency"],
      period: json["period"],
    );
  }
}

class FaqSectionProps {
  final String title;
  final List<QuestionProps> questions;

  FaqSectionProps({required this.title, required this.questions});

  factory FaqSectionProps.fromJson(Map<String, dynamic> json) {
    return FaqSectionProps(
      title: json["title"],
      questions: (json["questions"] as List)
          .map((item) => QuestionProps.fromJson(item))
          .toList(),
    );
  }
}

class QuestionProps {
  final String question;
  final String answer;

  QuestionProps({required this.question, required this.answer});

  factory QuestionProps.fromJson(Map<String, dynamic> json) {
    return QuestionProps(
      question: json["question"],
      answer: json["answer"],
    );
  }
}

class FooterProps {
  final List<String> links;
  final List<String> socialMedial;

  FooterProps({required this.links, required this.socialMedial});

  factory FooterProps.fromJson(Map<String, dynamic> json) {
    return FooterProps(
      links: List<String>.from(json["links"]),
      socialMedial: List<String>.from(json["socialMedia"]),
    );
  }
}


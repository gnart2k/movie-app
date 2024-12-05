class ReviewSection {
  final String title;
  final List<Review> reviews;

  ReviewSection({required this.title, required this.reviews});

  factory ReviewSection.fromJson(Map<String, dynamic> json) {
    return ReviewSection(
      title: json['title'] as String,
      reviews: (json['reviews'] as List)
          .map((reviewJson) => Review.fromJson(reviewJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'reviews': reviews.map((review) => review.toJson()).toList(),
    };
  }
}

class Review {
  final String author;
  final String location;
  final double rating;
  final String comment;

  Review({
    required this.author,
    required this.location,
    required this.rating,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      author: json['author'] as String,
      location: json['location'] as String,
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'location': location,
      'rating': rating,
      'comment': comment,
    };
  }
}

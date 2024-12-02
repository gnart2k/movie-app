import 'package:flutter/material.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:movie_app/core/widgets/category/category_card.dart';

Widget categoryContent(List<MovieModel> movieList) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: movieList
          .map((movie) =>
              CategoryCard(title: movie.name, imageUrl: movie.imageUrl))
          .toList()
      // const CategoryCard(title: "Adventure", imageUrl: AppImages.categoryImage),
      // const CategoryCard(title: "Adventure", imageUrl: AppImages.categoryImage),
      // const CategoryCard(title: "Adventure", imageUrl: AppImages.categoryImage),
      // const CategoryCard(title: "Adventure", imageUrl: AppImages.categoryImage),
      // const CategoryCard(title: "Adventure", imageUrl: AppImages.categoryImage)
      );
}

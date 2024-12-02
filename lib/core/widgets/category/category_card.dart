import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.title, required this.imageUrl});
  final String title;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
      return  Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: AppColors.itemHovered,
            borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        child: SizedBox(
          width: 190,
          child: Column(
            children: [
              Image.asset(imageUrl,fit: BoxFit.fill,),
              const SizedBox(height: 10,),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title,style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white
                      ),)
                    ],
                  ),
                  const Icon(Icons.arrow_forward, color: Colors.white,)
                ],
              ))
            ],
          ),
        ),
      );
  }

}
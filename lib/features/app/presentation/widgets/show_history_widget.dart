import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:movie_app/features/movie_and_show/presentation/view_models/movie_watching_viewmodel.dart';

import '../../../../core/constants/app_icons.dart';

class ShowHistory extends ConsumerStatefulWidget {
  const ShowHistory({super.key});

  @override
  ConsumerState<ShowHistory> createState() => _ShowHistoryState();
}

class _ShowHistoryState extends ConsumerState<ShowHistory> {
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    final movieWatchingViewModel = ref.watch(movieWatchingProvider);
    final List<MovieModel> movies = ref.read(movieWatchingProvider);
    return InkWell(
      onTap: () {
        setState(() {
          _isShow = !_isShow;
        });
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: SvgPicture.asset(AppIcons.bellIcon, width: 26),
            ),
          ),
          Positioned(
            left: -200,
            top: 40,
            child: AnimatedContainer(
              width: 300,
              height: _isShow ? MediaQuery.of(context).size.height * .3 : 0,
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: movies.isEmpty
                  ? const Center(
                      child: Text(
                        "No movie is watching",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  : ListView.builder(
                      itemCount: movies.length, // Number of items in the list
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.itemHovered, // Border color
                                width: 1,            // Border width
                              ),
                            ),
                          ),
                          child: ListTile(
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(movies[index].imageUrl, width: 30, height: 30, fit: BoxFit.fill,),
                                ),
                                const SizedBox(width: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(movies[index].name),

                                    if (movies[index].currentSession != null)
                                      ...[
                                        const SizedBox(height: 5),
                                        Text("Session: ${movies[index].currentSession} Episodes: ${movies[index].currentEpisodes}"),
                                      ],
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          )
        ],
      ),
    );
  }
}

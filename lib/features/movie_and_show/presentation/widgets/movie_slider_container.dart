import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_icons.dart';
import 'package:movie_app/core/domain/model/movie_model.dart';
import 'package:movie_app/core/widgets/button/icon_button.dart';
import 'package:movie_app/features/movie_and_show/presentation/widgets/movie_slider_controller.dart';

class MovieSliderContainer extends StatefulWidget {
  final List<MovieModel> movieList;

  const MovieSliderContainer({
    super.key,
    required this.movieList,
  });

  @override
  State<StatefulWidget> createState() => _MovieSliderContainerState();
}

class _MovieSliderContainerState extends State<MovieSliderContainer>
    with TickerProviderStateMixin {
  late CarouselSliderController? _buttonCarouselController;
  late int pageNumber;
  int currentPage = 0;

  @override
  void initState() {
    _buttonCarouselController = CarouselSliderController();
    pageNumber = widget.movieList.length;
    super.initState();
  }

  @override
  void dispose() {
    _buttonCarouselController = null;
    super.dispose();
  }

  void _toggleGoNextSlide() {
    _buttonCarouselController?.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  void _toggleGoPreSlide() {
    _buttonCarouselController?.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1100,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  CarouselSlider.builder(
                    carouselController: _buttonCarouselController,
                    itemCount: pageNumber,
                    itemBuilder: (context, index, realIndex) {
                      return _categoryContent(context, widget.movieList[index]);
                    },
                    options: CarouselOptions(
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        scrollDirection: Axis.horizontal,
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentPage = index;
                          });
                        }),
                  )
                ],
              )),
          Positioned(
              bottom: 120,
              child: MovieSliderControllerContainer(
                pageNumber: pageNumber,
                currentPage: currentPage,
                toggleGoNext: _toggleGoNextSlide,
                toggleGoPrevious: _toggleGoPreSlide,
              ))
        ],
      ),
    );
  }

  Widget _categoryContent(BuildContext context, MovieModel movie) {
    return Container(
      margin: const EdgeInsets.only(right: 100, top: 120, left: 100),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(movie.imageUrl), fit: BoxFit.fill)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(movie.name,
                style: const TextStyle(color: Colors.white, fontSize: 38)),
            if (movie.description != null)
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.4,
                child: Text(
                    textAlign: TextAlign.center,
                    movie.description!,
                    style: const TextStyle(color: AppColors.lightGray)),
              ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                    label: "Play Now",
                    onTap: () {},
                    iconData: Icons.play_arrow),
                const SizedBox(width: 12),
                ...[
                  AppIcons.plusIcon,
                  AppIcons.likeIcon,
                  AppIcons.volumeIcon
                ].map((icon) => Row(
                    children: [_iconButton(icon), const SizedBox(width: 8)])),
              ],
            ),
            SizedBox(height: 200)
          ]),
    );
  }
}

Widget _iconButton(String iconUrl) {
  return GestureDetector(
      child: Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(8)),
    child: SvgPicture.asset(iconUrl),
  ));
}

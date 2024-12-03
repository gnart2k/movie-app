import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_icons.dart';
import 'package:movie_app/core/constants/app_images.dart';

class SeasonEpisodesContainer extends StatefulWidget {
  const SeasonEpisodesContainer({super.key});

  @override
  State<SeasonEpisodesContainer> createState() =>
      _SeasonEpisodesContainerState();
}

class _SeasonEpisodesContainerState extends State<SeasonEpisodesContainer> {
  final List<Map<String, dynamic>> movieDetail = [
    {
      "seasonNumber": 1,
      "episodes": [
        {
          "episodeNumber": 1,
          "title": "Chapter One: The Vanishing of Will Byers",
          "description":
              "On his way from a friend's house, young Will sees something terrifying. Nearby, a sinister secret lurks in the depths of a government lab.",
          "duration": "49 min",
          "imageUrl": AppImages.movieSeason
        },
        {
          "episodeNumber": 2,
          "title": "Chapter Two: The Weirdo on Maple Street",
          "description":
              "Lucas, Mike, and Dustin try to talk to the girl they found in the woods. Hopper questions an anxious Joyce about an unsettling phone call.",
          "duration": "56 min",
          "imageUrl": AppImages.movieSeason
        }
      ]
    },
    {
      "seasonNumber": 2,
      "episodes": [
        {
          "episodeNumber": 1,
          "title": "Chapter One: MADMAX",
          "description":
              "As the town preps for Halloween, a high-scoring rival shakes things up at the arcade, and a skeptical Hopper inspects a field of rotting pumpkins.",
          "duration": "45 min",
          "imageUrl": AppImages.movieSeason
        }
      ]
    },
    {
      "seasonNumber": 3,
      "episodes": [
        {
          "episodeNumber": 1,
          "title": "Chapter One: MADMAX",
          "description":
              "As the town preps for Halloween, a high-scoring rival shakes things up at the arcade, and a skeptical Hopper inspects a field of rotting pumpkins.",
          "duration": "45 min",
          "imageUrl": AppImages.movieSeason
        },
        {
          "episodeNumber": 2,
          "title": "Chapter One: MADMAX",
          "description":
              "As the town preps for Halloween, a high-scoring rival shakes things up at the arcade, and a skeptical Hopper inspects a field of rotting pumpkins.",
          "duration": "45 min",
          "imageUrl": AppImages.movieSeason
        },
        {
          "episodeNumber": 3,
          "title": "Chapter One: MADMAX",
          "description":
              "As the town preps for Halloween, a high-scoring rival shakes things up at the arcade, and a skeptical Hopper inspects a field of rotting pumpkins.",
          "duration": "45 min",
          "imageUrl": AppImages.movieSeason
        }
      ]
    }
  ];

  List<bool> _expandedState = [];

  @override
  void initState() {
    super.initState();
    _expandedState = List.generate(movieDetail.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: AppColors.itemHovered, // Background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Season and Episodes',
            style: GoogleFonts.manrope(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: movieDetail.length,
              itemBuilder: (context, index) {
                final season = movieDetail[index];
                return Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent, // remove divider defaul
                  ),
                  child: Card(
                    color: AppColors.darkGray,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ExpansionTile(
                        key: PageStorageKey<int>(index),
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Season ${season['seasonNumber']}  ",
                                style: GoogleFonts.manrope(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: "${season['episodes'].length} Episodes",
                                style: GoogleFonts.manrope(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.lightGray, // Different style
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.cardBorder, width: 1)),
                          child: Icon(
                            _expandedState[index]
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color: AppColors.lightGray,
                          ),
                        ),
                        onExpansionChanged: (isExpanded) {
                          setState(() {
                            _expandedState[index] = isExpanded;
                          });
                        },
                        children: [
                          for (var episode in season['episodes'])
                            Column(
                              children: [
                                // Divider above each episode
                                Divider(
                                  color: AppColors.lightGray.withOpacity(0.2),
                                  thickness: 1.0,
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Episode Number
                                      Text(
                                        episode['episodeNumber']
                                            .toString()
                                            .padLeft(2, '0'),
                                        style: GoogleFonts.manrope(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.lightGray,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      // Episode Image
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          episode['imageUrl'],
                                          width: 100,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      // Episode Details
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                //episode title
                                                Text(
                                                  episode['title'],
                                                  style: GoogleFonts.manrope(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const Spacer(),
                                                // Duration
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppIcons.alarmIcon,
                                                      height: 18,
                                                      width: 18,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      episode['duration'],
                                                      style:
                                                          GoogleFonts.manrope(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.lightGray,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              episode['description'],
                                              style: GoogleFonts.manrope(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.lightGray,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: SeasonEpisodesContainer(),
    ),
  ));
}

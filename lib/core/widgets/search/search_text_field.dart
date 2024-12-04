import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<StatefulWidget> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final List<String> movies = [
    "The Shawshank Redemption",
    "The Godfather",
    "The Dark Knight",
    "Pulp Fiction",
    "The Lord of the Rings: The Return of the King",
  ];

  bool opened = false;
  bool isEmpty = true;
  final TextEditingController _controller = TextEditingController();
  List<String> filteredMovies = [];

  bool checkSearchState() {
    if (opened) {
      if (_controller.value.text.isNotEmpty && isEmpty) {
        setState(() {
          isEmpty = false;
        });
      } else if (_controller.value.text.isEmpty && !isEmpty) {
        setState(() {
          isEmpty = true;
        });
      }
      return isEmpty;
    } else {
      return false;
    }
  }

  void _onSubmit() {
    filteredMovies.clear();
    if (opened) {
      setState(() {
        opened = false;
      });
    } else {
      setState(() {
        opened = true;
      });
    }
  }

  void _searchMovies(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredMovies = []; // No results when search field is empty
      });
    } else {
      final filtered = movies
          .where((movie) => movie.toLowerCase().contains(query.toLowerCase()))
          .toList();

      setState(() {
        filteredMovies = filtered;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: opened ? MediaQuery.of(context).size.width * .2 : 56,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                boxShadow: kElevationToShadow[2]),
            child: Container(
              padding: const EdgeInsets.all(5),
              color: Colors.transparent,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: opened
                          ? TextField(
                              controller: _controller,
                              onSubmitted: (value) {
                                setState(() {
                                  opened = !opened;
                                });
                              },
                              onChanged: (String value) {
                                _searchMovies(value);
                                checkSearchState();
                              },
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                              ),
                            )
                          : null,
                    ),
                  ),
                  InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    onTap: () {
                      setState(() {
                        _onSubmit();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: opened ? AppColors.primary : Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                      ),
                      padding: const EdgeInsets.all(14.0),
                      child: Icon(
                        checkSearchState() ? Icons.close : Icons.search,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Positioned(
            left: 0,
            right: 0,
            top: 50,
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: filteredMovies
                      .map(
                        (movie) => ListTile(
                          title: Text(movie),
                        ),
                      )
                      .toList(),
                )))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<StatefulWidget> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  bool opened = false;
  bool isEmpty = true;
  final TextEditingController _controller = TextEditingController();
  bool checkSearchState() {
    if(opened) {
      if(_controller.value.text.isNotEmpty && isEmpty) {
        setState(() {
         isEmpty = false;
        });
      }
      else if(_controller.value.text.isEmpty && !isEmpty) {
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
    if(opened && _controller.value.text.isNotEmpty) {
        setState(() {
          opened = false;
        });
    }
    else {
      setState(() {
        opened = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    print(checkSearchState());
    return AnimatedContainer(
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
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                  ),
                  padding: const EdgeInsets.all(14.0),
                  child:  Icon(
                    checkSearchState() ? Icons.close : Icons.search,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

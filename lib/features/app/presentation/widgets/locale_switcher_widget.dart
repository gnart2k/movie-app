
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/app/presentation/view_models/locale_viewmodel.dart';

import '../../../../core/constants/app_colors.dart';
class LocaleSwitcherWidget extends ConsumerWidget {
  const LocaleSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeViewModel = ref.watch(localeProvider);
    return SizedBox(
      height: 40,
      child: DropdownButton(
        value: ref.read(localeProvider),
        dropdownColor: Colors.white,
        style: const TextStyle(
          color: AppColors.lightGray,
          fontSize: 16,
        ),
        items: AppLocalizations.supportedLocales.map(
              (nextLocale) {
            return DropdownMenuItem(
              value: nextLocale,
              onTap: () {
                ref.read(localeProvider.notifier).changeLanguage(nextLocale.languageCode);
              },
              child: Center(
                child: Text(nextLocale.toString()),
              ),
            );
          },
        ).toList(),
        onChanged: (_) {},
      ),
    );
  }
}


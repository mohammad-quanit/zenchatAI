import 'package:flutter/material.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/constants/sizes.dart';
import 'package:zenchatai/utils/constants/text_strings.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
          decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        filled: true,
        fillColor: Colors.green.shade600,
        labelText: ZTexts.search,
        prefixIcon: const Icon(Icons.search, color: ZColors.white),
      )),
    ]);
  }
}

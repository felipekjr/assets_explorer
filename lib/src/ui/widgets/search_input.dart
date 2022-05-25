import 'package:flutter/material.dart';

import '../theme/theme.dart';

class SearchInput extends StatelessWidget {
  final Function(String v) onChanged;
  const SearchInput({ Key? key, required this.onChanged }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColor.primary,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: AppColor.greySecondary,
        hoverColor: AppColor.greySecondary,
        hintStyle: TextStyle(color: AppColor.primary),
        prefixIcon: Icon(Icons.search_rounded, color: AppColor.primary),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none
        ),
        contentPadding: const EdgeInsets.all(Spacing.x2)
      ),
      
    );
  }
}
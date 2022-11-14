import 'package:egymation/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 8.0),
      child: TextFormField(
        style: GoogleFonts.exo(
            color: Colors.white
        ),
        decoration: InputDecoration(
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          labelText: 'Search',
          fillColor: searchBackgroundColor,
          labelStyle: GoogleFonts.exo(
              color: Colors.white
          ),
          suffixIcon: const Icon(Icons.search, color: Colors.white,),

        ),
      ),
    );
  }
}

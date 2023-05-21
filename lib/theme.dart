import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var darkTheme = ThemeData(
    // fontFamily: GoogleFonts.montserrat().fontFamily,
    // brightness: Brightness.dark,
    // backgroundColor: DesignColor.blackBackground,
    // dialogBackgroundColor: DesignColor.blackBackground,
    // scaffoldBackgroundColor: DesignColor.blackBackground,
    // cardColor: DesignColor.blackCard,
    // drawerTheme: const DrawerThemeData(backgroundColor: DesignColor.blackCard),
    // dialogTheme: const DialogTheme(backgroundColor: DesignColor.blackCard),
    // appBarTheme: const AppBarTheme(backgroundColor: DesignColor.blackCard),
    // bottomSheetTheme:
    //     const BottomSheetThemeData(backgroundColor: DesignColor.blackCard),
    );
var theme = ThemeData(
  // backgroundColor: DesignColor.dszBackground,
  // scaffoldBackgroundColor: Colors.white,
  fontFamily: GoogleFonts.poppins().fontFamily,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0,
  ),
);

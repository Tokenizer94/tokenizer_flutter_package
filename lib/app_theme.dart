part of tokenizer;

enum FontWeights {
  ultraLight,
  light,
  regular,
  medium,
  bold,
}

class AppTheme {
  /// general Theme Attribute
  static const defaultRadius = 16.0;
  static const defaultPadding = 16.0;
  static const Size designSize = Size(360, 690);
  static const Size designSizeDesktop = Size(900, 1600);

  //Font names
  static const karaFontName = 'kara';
  static const iransansFontName = 'IRANSans';
  static const wyekanFontName = 'wyekan';

  static TextStyle fontCreator({
    double fontSize = 16.0,
    FontWeights fontWeights = FontWeights.regular,
    Color fontColor = Colors.white,
    String fontName = wyekanFontName,
    double? lineHeight,
    List<Shadow>? shadow,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      color: fontColor,
      fontFamily: fontName,
      height: lineHeight,
      shadows: shadow,
      fontWeight: fontWeights == FontWeights.ultraLight
          ? FontWeight.w200
          : fontWeights == FontWeights.light
              ? FontWeight.w300
              : fontWeights == FontWeights.regular
                  ? FontWeight.w400
                  : fontWeights == FontWeights.medium
                      ? FontWeight.w500
                      : fontWeights == FontWeights.bold
                          ? FontWeight.w700
                          : FontWeight.w400,
    );
  }
}

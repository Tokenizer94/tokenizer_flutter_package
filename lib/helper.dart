part of tokenizer;

enum FontWeights {
  ultraLight,
  light,
  regular,
  medium,
  bold,
}

EdgeInsets ama(num number) {
  return EdgeInsets.all(
    ScreenUtil().setWidth(number),
  );
}

EdgeInsets sma({num? top, num? right, num? bottom, num? left}) {
  return EdgeInsets.only(
    top: ScreenUtil().setHeight(top ?? 0),
    right: ScreenUtil().setWidth(right ?? 0),
    bottom: ScreenUtil().setHeight(bottom ?? 0),
    left: ScreenUtil().setWidth(left ?? 0),
  );
}

EdgeInsets syma({num? horizontal, num? vertical}) {
  return EdgeInsets.symmetric(
    horizontal: ScreenUtil().setWidth(horizontal ?? 0),
    vertical: ScreenUtil().setWidth(vertical ?? 0),
  );
}

TextStyle fontCreator({
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

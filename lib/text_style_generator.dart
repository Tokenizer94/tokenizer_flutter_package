part of tokenizer;

abstract class TextStyleGenerator {
  double fontSize = 16.0.sp;
  FontWeight fontWeight = FontWeight.w400;
  Color fontColor = Colors.white;
  String? fontFamily;
  double? lineHeight;
  List<Shadow>? shadows;

  TextStyle textStyleGenerator();
}

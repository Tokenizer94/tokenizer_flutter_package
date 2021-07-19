part of tokenizer;

class PlatformAppBar extends PlatformWidget {
  final Widget? leading;
  final Widget title;
  final List<Widget> actions;

  const PlatformAppBar({
    required this.title,
    this.leading,
    this.actions = const <Widget>[],
  });

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoNavigationBar(
      leading: leading,
      middle: title,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: actions,
      ),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      actions: actions,
    );
  }
}

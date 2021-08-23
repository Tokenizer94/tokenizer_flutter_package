part of tokenizer;

class MyBaseWidget extends StatelessWidget {
  final Widget mobileChild;
  final Widget? tabletChild;
  final Widget? desktopChild;
  final PlatformAppBar? platformAppBar;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Key? scaffoldKey;
  final Color? backgroundColor;

  const MyBaseWidget({
    Key? key,
    required this.mobileChild,
    this.tabletChild,
    this.desktopChild,
    this.platformAppBar,
    this.bottomNavigationBar,
    this.drawer,
    this.scaffoldKey,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      scaffoldKey: scaffoldKey,
      backgroundColor: backgroundColor,
      appBar: platformAppBar,
      drawer: drawer,
      body: SingleChildScrollView(
        child: MyResponsive(
          mobile: mobileChild,
          tablet: tabletChild ?? mobileChild,
          desktop: desktopChild ?? mobileChild,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class MyResponsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const MyResponsive({
    Key? key,
    @required this.mobile,
    @required this.tablet,
    @required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //? If our width is more than 1100 then we consider it a desktop
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop ?? Container();
        }
        //? If width it less then 1100 and more then 650 we consider it as tablet
        else if (constraints.maxWidth >= 650) {
          return tablet ?? Container();
        }
        //? Or less then that we called it mobile
        else {
          return mobile ?? Container();
        }
      },
    );
  }
}

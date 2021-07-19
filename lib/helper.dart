part of tokenizer;

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

CustomProgressDialog? progressDialog;

void showToast(
  BuildContext mContext,
  String message, {
  Color color = Colors.blue,
}) {
  showFlash(
    context: mContext,
    duration: 3.seconds,
    builder: (_, controller) {
      return Flash(
        controller: controller,
        backgroundColor: color,
        borderRadius: BorderRadius.circular(8.0.w),
        borderColor: Colors.white,
        position: FlashPosition.bottom,
        margin: sma(bottom: 30.h),
        style: FlashStyle.floating,
        enableDrag: false,
        onTap: () => controller.dismiss(),
        child: Padding(
          padding: ama(12.w),
          child: Text(
            message,
            style: AppTheme.fontCreator(fontSize: 14),
          ),
        ),
      );
    },
  );
}

Future<void> showLoading(BuildContext context, Function job) async {
  progressDialog = CustomProgressDialog(
    context,
    blur: 10,
    dismissable: false,
    loadingWidget: LoadingBouncingGrid.circle(
      backgroundColor: Colors.white,
      size: 60,
    ),
  );
  progressDialog?.show();
  await job();
  await Future.delayed(500.milliseconds).then((value) {
    dismissLoading();
  });
}

void dismissLoading() {
  if (progressDialog != null) progressDialog?.dismiss();
}

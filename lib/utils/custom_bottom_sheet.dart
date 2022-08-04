part of 'app_utils.dart';

class NoticeWidget {
  dynamic errorShow(BuildContext context, String errorMsg) {
    ModalBottomSheet.show(
      radiusCircle: 20.h,
      context: context,
      children: [
        Lottie.asset(
          'assets/animation/error.json',
          height: 0.2.sh,
          width: double.infinity,
          repeat: false,
        ),
        Center(
          child: Text(
            errorMsg,
            style: AppStyle.textSubTitleBOLD,
          ),
        ),
        SizedBox(height: 0.02.sh),
      ],
    );
  }

  dynamic emptyWidget(String? msg) {
    return Row(
      children: [
        Lottie.asset(
          'assets/animation/cat-no-activity.json',
          height: 0.26.sh,
          width: 0.4.sw,
          repeat: true,
        ),
        SizedBox(
          height: 0.26.sh,
          width: 0.4.sw,
          child: Center(
            child: Text(
              msg ?? 'Nothing to Show Here',
              style: AppStyle.textSubTitle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  dynamic loadingShow() {
    return Lottie.asset(
      'assets/animation/loading.json',
      height: 0.14.sh,
      width: double.infinity,
      repeat: true,
    );
  }

  dynamic loadingShow2() {
    return Lottie.asset(
      'assets/animation/loading 2 wave.json',
      height: 0.14.sh,
      width: double.infinity,
      repeat: true,
    );
  }
}

class ModalBottomSheet {
  static void show({
    required List<Widget> children,
    required BuildContext context,
    double radiusCircle = 0,
    bool isDismisslable = true,
  }) {
    showModalBottomSheet<Dialog>(
      context: context,
      isDismissible: isDismisslable,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 0.08.sh,
              width: double.infinity,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      size: 40.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 0.02.sh),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: children,
                      ),
                      SizedBox(height: 10.h)
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

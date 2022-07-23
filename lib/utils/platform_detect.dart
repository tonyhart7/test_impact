part of 'app_utils.dart';

class PlatformDetect {
  Os getPlatform() {
    if (kIsWeb) {
      return Os.web;
    } else if (Platform.isIOS) {
      return Os.ios;
    } else if (Platform.isAndroid) {
      return Os.android;
    } else if (Platform.isFuchsia) {
      return Os.fuchsia;
    } else if (Platform.isLinux) {
      return Os.linux;
    } else if (Platform.isMacOS) {
      return Os.macos;
    } else if (Platform.isWindows) {
      return Os.windows;
    }
    return Os.unknown;
  }

  bool isWeb() {
    return (getPlatform() == Os.web);
  }

  bool isMobile() {
    Os platform = getPlatform();
    return (platform == Os.android ||
        platform == Os.ios ||
        platform == Os.fuchsia);
  }

  bool isComputer() {
    Os platform = getPlatform();
    return (platform == Os.linux ||
        platform == Os.macos ||
        platform == Os.windows);
  }
}

enum Os { unknown, web, android, fuchsia, ios, linux, macos, windows }

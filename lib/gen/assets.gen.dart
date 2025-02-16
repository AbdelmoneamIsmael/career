/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Asset 1.svg
  String get asset1 => 'assets/icons/Asset 1.svg';

  /// File path: assets/icons/cart_icon.svg
  String get cartIcon => 'assets/icons/cart_icon.svg';

  /// File path: assets/icons/chevron-down.svg
  String get chevronDown => 'assets/icons/chevron-down.svg';

  /// File path: assets/icons/fillter_icon.svg
  String get fillterIcon => 'assets/icons/fillter_icon.svg';

  /// File path: assets/icons/google_logo.svg
  String get googleLogo => 'assets/icons/google_logo.svg';

  /// File path: assets/icons/info.svg
  String get info => 'assets/icons/info.svg';

  /// File path: assets/icons/logout.svg
  String get logout => 'assets/icons/logout.svg';

  /// File path: assets/icons/notification.svg
  String get notification => 'assets/icons/notification.svg';

  /// File path: assets/icons/pdf.svg
  String get pdf => 'assets/icons/pdf.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/search_icon.svg
  String get searchIcon => 'assets/icons/search_icon.svg';

  /// File path: assets/icons/tabels.svg
  String get tabels => 'assets/icons/tabels.svg';

  /// List of all assets
  List<String> get values => [
    asset1,
    cartIcon,
    chevronDown,
    fillterIcon,
    googleLogo,
    info,
    logout,
    notification,
    pdf,
    profile,
    searchIcon,
    tabels,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Elipse 5.png
  AssetGenImage get elipse5 =>
      const AssetGenImage('assets/images/Elipse 5.png');

  /// File path: assets/images/applogo.png
  AssetGenImage get applogo => const AssetGenImage('assets/images/applogo.png');

  /// File path: assets/images/apply_jop.jpg
  AssetGenImage get applyJop =>
      const AssetGenImage('assets/images/apply_jop.jpg');

  /// File path: assets/images/background_image.png
  AssetGenImage get backgroundImage =>
      const AssetGenImage('assets/images/background_image.png');

  /// File path: assets/images/home_screen.jpg
  AssetGenImage get homeScreen =>
      const AssetGenImage('assets/images/home_screen.jpg');

  /// File path: assets/images/profile.webp
  AssetGenImage get profile =>
      const AssetGenImage('assets/images/profile.webp');

  /// File path: assets/images/sign_in.jpg
  AssetGenImage get signIn => const AssetGenImage('assets/images/sign_in.jpg');

  /// File path: assets/images/splash_screen.png
  AssetGenImage get splashScreen =>
      const AssetGenImage('assets/images/splash_screen.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    elipse5,
    applogo,
    applyJop,
    backgroundImage,
    homeScreen,
    profile,
    signIn,
    splashScreen,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

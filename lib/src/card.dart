import 'package:flutter/material.dart';

import 'package:xen_popup_card/src/appbar.dart';
import 'package:xen_popup_card/src/gutter.dart';

class XenPopupCard extends StatelessWidget {
  const XenPopupCard({
    required this.body,
    Key? key,
    this.padding,
    this.appBar,
    this.gutter,
    this.cardBgColor,
    this.borderRadius,
  }) : super(key: key);

  /// The main part of the card
  ///
  /// [Widget] body: required
  ///
  /// example: ListView, Container
  ///
  final Widget body;

  /// The padding for body
  ///
  /// `default` : 20
  ///
  final double? padding;

  /// The top part of the card
  ///
  /// `default` : SizedBox()
  ///
  /// [XenCardAppBar] : To create a default card app bar
  ///
  /// Useful if you want to put title or navigation bar
  ///
  /// Alternatively extend the class [XenCardAppBar] to customize
  /// the app bar according to your requirement
  ///
  final XenCardAppBar? appBar;

  /// The bottom part of the card
  ///
  /// `default` : XenCardGutter()
  ///
  /// [XenCardGutter] : To customize default gutter
  ///
  final XenCardGutter? gutter;

  /// The border radius of the card
  ///
  /// `default` : 10
  ///
  /// Alternately you can set border by using [XenCardGutter]
  /// to set bottom border and [XenCardAppBar] to set top border
  ///
  final double? borderRadius;

  /// The background color of the card
  ///
  /// `default` : Colors.white
  ///
  final Color? cardBgColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      // margin
      margin: EdgeInsets.only(
        left: size.width * 0.15 / 2,
        right: size.width * 0.15 / 2,
        top: size.height * 0.1,
        bottom: size.height * 0.1,
      ),
      // material with border radius
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
        color: cardBgColor ?? Colors.white,
        child: Stack(
          children: [
            // body
            Padding(
              padding: EdgeInsets.only(
                top: appBar == null ? 20 : 80,
                bottom: padding ?? 20,
                left: padding ?? 20,
                right: padding ?? 20,
              ),
              child: body,
            ),
            // appbar
            Align(
              alignment: Alignment.topCenter,
              child: appBar ?? const SizedBox(),
            ),
            // gutter
            Align(
              alignment: Alignment.bottomCenter,
              child: gutter ?? const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// Xen Card Gutter
class XenCardGutter extends StatelessWidget {
  /// The main widget of the gutter
  ///
  /// [Widget] child: required
  ///
  /// example: Button
  ///
  final Widget child;

  /// [Default] :
  ///
  /// BoxShadow(
  /// color: Colors.black.withOpacity(0.1),
  /// spreadRadius: 1,
  /// blurRadius: 2,
  /// offset: const Offset(1, 2)),
  ///
  /// [Tip] : use BoxShadow(color: Colors.transparent) to remove shadow and line
  final BoxShadow? shadow;

  /// [Default] :  10
  ///
  /// Use to change border radius of bottom corners
  ///
  /// [Warning] : will require changing the appbar borderRadius
  /// to have same top and bottom border radius
  final double? borderRadius;

  const XenCardGutter(
      {Key? key, required this.child, this.shadow, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // size
    Size size = MediaQuery.of(context).size;
    // color and border radius with shadow
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius ?? 10),
          bottomRight: Radius.circular(borderRadius ?? 10),
        ),
        boxShadow: [
          shadow ??
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(1, -2),
              ),
        ],
      ),
      // gutter
      child: SizedBox(width: size.width, child: child),
    );
  }
}

import 'package:flutter/material.dart';

///
/// Xen Card App bar
///
class XenCardAppBar extends StatelessWidget {
  const XenCardAppBar({
    required this.child,
    Key? key,
    this.shadow,
    this.padding,
    this.color,
    this.borderRadius,
  }) : super(key: key);

  /// The main widget of the appbar
  ///
  /// [Widget] child: required
  ///
  /// example: Text, Container
  ///
  final Widget child;

  ///
  /// BoxShadow(
  /// color: Colors.black.withOpacity(0.1),
  /// spreadRadius: 1,
  /// blurRadius: 2,
  /// offset: const Offset(1, 2)),
  ///
  /// use BoxShadow(color: Colors.transparent) to remove shadow and line
  final BoxShadow? shadow;

  /// `default` : const EdgeInsets.all(10)
  ///
  /// padding for gutter widget
  final EdgeInsetsGeometry? padding;

  /// `default` : Colors.white
  ///
  /// use to change color of appbar
  final Color? color;

  /// `default` :  10
  ///
  /// Use to change border radius of top corners
  ///
  /// `Warning` : will require changing the gutter borderRadius
  /// to have same top and bottom border radius
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    // size
    final size = MediaQuery.sizeOf(context);

    return Container(
      // padding
      padding: padding ?? const EdgeInsets.all(20),
      // border radius
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius ?? 10),
          topRight: Radius.circular(borderRadius ?? 10),
        ),
        boxShadow: [
          shadow ??
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(1, 2),
              ),
        ],
      ),
      // appbar
      child: SizedBox(width: size.width, child: Container(child: child)),
    );
  }
}

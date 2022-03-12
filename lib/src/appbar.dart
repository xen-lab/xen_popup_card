import 'package:flutter/material.dart';

/// 
/// Xen Card App bar
///  
class XenCardAppBar extends StatelessWidget {
  /// The main widget of the appbar
  ///
  /// [Widget] child: required
  ///
  /// example: Text, Container
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

  /// [Default] : const EdgeInsets.all(10)
  ///
  /// padding for gutter widget
  final EdgeInsetsGeometry? padding;

  /// [Default] : Colors.white
  ///
  /// use to change color of appbar
  final Color? color;

  /// [Default] :  10
  ///
  /// Use to change border radius of top corners
  ///
  /// [Warning] : will require changing the gutter borderRadius
  /// to have same top and bottom border radius
  final double? borderRadius;

  const XenCardAppBar(
      {Key? key,
      required this.child,
      this.shadow,
      this.padding,
      this.color,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // size
    Size size = MediaQuery.of(context).size;
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

import 'package:flutter/material.dart';

/// Xen Card Gutter
class XenCardGutter extends StatelessWidget {
  const XenCardGutter({
    required this.child,
    Key? key,
    this.shadow,
    this.borderRadius,
  }) : super(key: key);

  /// The main widget of the gutter
  ///
  /// [Widget] child: required
  ///
  /// example: Button
  ///
  final Widget child;

  /// `default` :
  ///
  /// BoxShadow(
  /// color: Colors.black.withOpacity(0.1),
  /// spreadRadius: 1,
  /// blurRadius: 2,
  /// offset: const Offset(1, 2)),
  ///
  /// `tip` : use BoxShadow(color: Colors.transparent) to remove shadow and line
  final BoxShadow? shadow;

  /// `default` :  10
  ///
  /// Use to change border radius of bottom corners
  ///
  /// `warning` : will require changing the appbar borderRadius
  /// to have same top and bottom border radius
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    
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

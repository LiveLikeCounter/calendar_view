import 'package:flutter/material.dart';

import 'shared.dart';

class AppTextStyles {
  static TextStyle pageHeaderHugeTextStyle(
    BuildContext context, {
    Color? color,
    bool isBold = false,
    bool hasUnderline = false,
  }) =>
      TextStyle(
        fontSize: 64 * (ScreenRatio.fontRatio == 0 ? 1 : ScreenRatio.fontRatio),
        letterSpacing: 0.41 * ScreenRatio.widthRatio,
        fontWeight: isBold ? FontWeight.w800 : FontWeight.w300,
        decoration:
            hasUnderline ? TextDecoration.underline : TextDecoration.none,
        color: color ?? Theme.of(context).textTheme.bodyText1!.color,
      );

  static TextStyle pageHeaderBigTextStyle(
    BuildContext context, {
    Color? color,
    bool isBold = false,
    bool hasUnderline = false,
  }) =>
      TextStyle(
        fontSize: 34 * (ScreenRatio.fontRatio == 0 ? 1 : ScreenRatio.fontRatio),
        letterSpacing: 0.41 * ScreenRatio.widthRatio,
        fontWeight: isBold ? FontWeight.w800 : FontWeight.normal,
        decoration:
            hasUnderline ? TextDecoration.underline : TextDecoration.none,
        color: color ?? Theme.of(context).textTheme.bodyText1!.color,
      );

  static TextStyle pageHeaderTextStyle(
    BuildContext context, {
    Color? color,
    bool isBold = false,
    bool hasUnderline = false,
  }) =>
      TextStyle(
        fontSize: 28 * (ScreenRatio.fontRatio == 0 ? 1 : ScreenRatio.fontRatio),
        letterSpacing: 0.34 * ScreenRatio.widthRatio,
        fontWeight: isBold ? FontWeight.w800 : FontWeight.normal,
        decoration:
            hasUnderline ? TextDecoration.underline : TextDecoration.none,
        color: color ?? Theme.of(context).textTheme.bodyText1!.color,
      );

  static TextStyle pageHeaderSmallTextStyle(
    BuildContext context, {
    Color? color,
    bool isBold = false,
    bool hasUnderline = false,
  }) =>
      TextStyle(
        fontSize: 20 * (ScreenRatio.fontRatio == 0 ? 1 : ScreenRatio.fontRatio),
        letterSpacing: 0.019 * ScreenRatio.widthRatio,
        fontWeight: isBold ? FontWeight.w800 : FontWeight.normal,
        decoration:
            hasUnderline ? TextDecoration.underline : TextDecoration.none,
        color: color ?? Theme.of(context).textTheme.bodyText1!.color,
      );

  static TextStyle pageTextStyle(
    BuildContext context, {
    Color? color,
    bool isBold = false,
    bool hasUnderline = false,
  }) =>
      TextStyle(
        fontSize: 17 * (ScreenRatio.fontRatio == 0 ? 1 : ScreenRatio.fontRatio),
        //letterSpacing: -0.41 * ScreenRatio.widthRatio,
        fontWeight: isBold ? FontWeight.w800 : FontWeight.normal,
        decoration:
            hasUnderline ? TextDecoration.underline : TextDecoration.none,
        color: color ?? Theme.of(context).textTheme.bodyText1!.color,
      );

  static TextStyle pageSmallTextStyle(
    BuildContext context, {
    Color? color,
    bool isBold = false,
    bool hasUnderline = false,
  }) =>
      TextStyle(
        fontSize: 15 * (ScreenRatio.fontRatio == 0 ? 1 : ScreenRatio.fontRatio),
        // letterSpacing: -0.24 * ScreenRatio.widthRatio,
        fontWeight: isBold ? FontWeight.w800 : FontWeight.normal,
        decoration:
            hasUnderline ? TextDecoration.underline : TextDecoration.none,
        color: color ?? Theme.of(context).textTheme.bodyText1!.color,
      );

  static TextStyle pageSmallerTextStyle(
    BuildContext context, {
    Color? color,
    bool isBold = false,
    bool hasUnderline = false,
  }) =>
      TextStyle(
        fontSize: 13 * (ScreenRatio.fontRatio == 0 ? 1 : ScreenRatio.fontRatio),
        // letterSpacing: -0.08 * ScreenRatio.widthRatio,
        fontWeight: isBold ? FontWeight.w800 : FontWeight.normal,
        decoration:
            hasUnderline ? TextDecoration.underline : TextDecoration.none,
        color: color ?? Theme.of(context).textTheme.bodyText1!.color,
      );

  static TextStyle pageSmallestTextStyle(
    BuildContext context, {
    Color? color,
    bool isBold = false,
    bool hasUnderline = false,
  }) =>
      TextStyle(
        fontSize: 11 * (ScreenRatio.fontRatio == 0 ? 1 : ScreenRatio.fontRatio),
        letterSpacing: 0.07 * ScreenRatio.widthRatio,
        fontWeight: isBold ? FontWeight.w800 : FontWeight.normal,
        decoration:
            hasUnderline ? TextDecoration.underline : TextDecoration.none,
        color: color ?? Theme.of(context).textTheme.bodyText1!.color,
      );

  static TextStyle pageTinyTextStyle(
    BuildContext context, {
    Color? color,
    bool isBold = false,
    bool hasUnderline = false,
  }) =>
      TextStyle(
        fontSize: 10 * (ScreenRatio.fontRatio == 0 ? 1 : ScreenRatio.fontRatio),
        letterSpacing: 0.12 * ScreenRatio.widthRatio,
        fontWeight: isBold ? FontWeight.w800 : FontWeight.normal,
        decoration:
            hasUnderline ? TextDecoration.underline : TextDecoration.none,
        color: color ?? Theme.of(context).textTheme.bodyText1!.color,
      );
}

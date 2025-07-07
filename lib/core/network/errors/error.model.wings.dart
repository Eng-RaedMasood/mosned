import 'package:flutter/material.dart';
import 'package:mosnad/core/logger.dart';

import 'error.enum.dart';
import 'exceptions.wings.dart';

class ErrorModel {
  String message;
  String desc;
  Color borderColor;
  Color backgroundColor;
  // String icon = Icons.error_outline;
  WingsException? exception;
  bool hideRetry;

  ErrorModel({
    this.message = '',
    this.desc = '',
    this.borderColor = const Color(0xffFF434F),
    this.backgroundColor = const Color(0xffFEE8E9),
    // this.icon = '',
    this.exception,
    this.hideRetry = false,
  }) {
    if (message.isEmpty) {
      message = 'Error:${exception?.runtimeType.toString()}';
    }
    if (desc.isEmpty) {
      desc = message;
    }
    // if (icon.isEmpty) icon = AppImages.errorNetwork;
    exception ??= WingsException.fromEnumeration();
  }

  factory ErrorModel.empty() {
    return ErrorModel();
  }

  static ErrorModel fromCode(
    String code,
    int statusCode, {
    String? message,
    String? desc,
  }) {
    wingsLogger.logError(
        "ErrorModel.fromCode: code: $code, statusCode: $statusCode, message: $message, desc: $desc");
    if (ErrorEnum.errorCodes.contains(code)) {
      return ErrorModel(
        message: message ?? 'errors.$code',
        desc: desc ?? 'errors.${code}_desc',
        // icon: Icons.error_outline,
        exception: WingsException.fromStatusCode(statusCode),
      );
    }
    return ErrorModel(
      message: 'Net Work',
      desc: 'Net Work',
      // icon: AppImages.errorNetwork,
      exception: WingsException.fromStatusCode(statusCode),
    );
  }
}

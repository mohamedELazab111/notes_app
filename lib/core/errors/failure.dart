import 'dart:io';

import 'package:hive/hive.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class LocalFailure extends Failure {
  LocalFailure(super.errMessage);

  factory LocalFailure.fromHiveError(dynamic error) {
    if (error is HiveError) {
      return LocalFailure("Hive error: ${error.message}");
    } else if (error is FileSystemException) {
      return LocalFailure("File system error: ${error.message}");
    } else {
      return LocalFailure("Unexpected local storage error");
    }
  }
}

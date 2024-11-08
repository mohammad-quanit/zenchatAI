import 'package:logger/logger.dart';

class ZLoggerHelper {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    // Customize the log levels based on your needs
    level: Level.debug,
  );

  static void debug(Object? object) {
    _logger.d(object);
  }

  static void info(Object? object) {
    _logger.i(object);
  }

  static void warning(Object? object) {
    _logger.w(object);
  }

  static void error(String message, [dynamic error]) {
    _logger.e(message, error: error,  stackTrace: StackTrace.current);
  }
}

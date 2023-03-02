

import '../../error/app_exception.dart';
import '../../error/cache_exception_type.dart';

extension LocaleErrorExtension on Exception {
  CacheException localErrorToCacheException() {
    final error = this;

    return CacheException(
      type: CacheExceptionType.general,
      message: error.toString(),
    );
  }
}

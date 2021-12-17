import 'package:english_hero/core/exception/app_exception.dart';
import 'package:scoped_model/scoped_model.dart';

class ExceptionModel extends Model {
  AppException? _exception;

  bool hasException() {
    return _exception != null;
  }

  void setException(AppException ex) {
    _exception = ex;
    notifyListeners();
  }

  AppException getException() {
    final exception = _exception!;
    _exception = null; // just allow handle exception once
    notifyListeners();
    return exception;
  }
}

import 'package:api_arch_boilerplate/helper/dailog_helper.dart';
import 'package:api_arch_boilerplate/services/app_exceptions.dart';

class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      Dailoghelper.showErrorDailog(description: error.message ?? '');
    } else if (error is FetchDataException) {
      Dailoghelper.showErrorDailog(description: error.message ?? '');
    } else if (error is ApiNotResponsingException) {
      Dailoghelper.showErrorDailog(description: 'Api not responding..');
    }
  }

  void showLoading({String message = ''}) {
    Dailoghelper.showLoading(message: message);
  }

  void hideLoading() {
    Dailoghelper.hideLoading();
  }
}

import 'package:api_arch_boilerplate/controllers/base_controller.dart';
import 'package:api_arch_boilerplate/services/base_client.dart';

class TestController extends BaseController {
  void getData() async {
    showLoading(message: "loading..");
    var response = await BaseClient()
        .get('https://jsonplaceholder.typicode.com', '/todos/2')
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    print(response);
  }

  void postData() async {
    var resquestBody = {'message': 'Kunal'};
    showLoading(message: "loading..");
    var response = await BaseClient()
        .post('https://jsonplaceholder.typicode.com', '/posts', resquestBody)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    print(response);
  }
}

import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChangeSuccessViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  void navigateToHome() async {
    await _navigationService.clearStackAndShowView(const HomeView());
  }
}

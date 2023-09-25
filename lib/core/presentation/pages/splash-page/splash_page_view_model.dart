import 'package:stacked/stacked.dart';
import 'package:untitled05/extras/helpers/base_view_model_helper.dart';
import 'package:untitled05/extras/services/app-navigation-service/app_navigation_service.dart';
import 'package:untitled05/extras/services/app-navigation-service/app_route_generator.dart';
import 'package:untitled05/out-buildings/dependency_injector.dart';

class SplashPageViewModel extends BaseViewModel with BaseViewModelHelper{
  /////////////////////////
  SplashPageViewModel._();
  factory SplashPageViewModel.create() =>  SplashPageViewModel._();
  /////////////////////////
  @override void onClose() {
    serviceLocator<AppNavigationService>().goBack();
  }
  /////////////////////////
  @override void onDispose() {}
  /////////////////////////
  @override void onModelReady() {
    Future.delayed(
      const Duration(seconds: 5,),
      () => serviceLocator<AppNavigationService>().navigateTo(routeName: AppRouteNames.ON_BOARDING_PAGE,),
    );
  }
  /////////////////////////
  @override void dispose() {
    onDispose();
    super.dispose();
  }
}
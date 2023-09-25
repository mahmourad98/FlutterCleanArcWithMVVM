import 'package:flutter/widgets.dart';
import 'package:untitled05/extras/services/app-navigation-service/app_navigation_service.dart';
import 'package:untitled05/out-buildings/dependency_injector.dart';

class OnBoardingPageViewModel {
  final PageController _pageController;
  PageController get pageController => _pageController;
  final ValueNotifier<int> _currentPageIndexNotifier = ValueNotifier(0,);
  ValueNotifier<int> get currentPageIndexNotifier => _currentPageIndexNotifier;
  void setPageIndex(int value,) {
    _currentPageIndexNotifier.value = value;
  }
  int get currentPageIndex => _currentPageIndexNotifier.value;
  /////////////////////////
  OnBoardingPageViewModel._(this._pageController,);
  factory OnBoardingPageViewModel.create({required PageController pageController,}) =>  OnBoardingPageViewModel._(pageController,);
  /////////////////////////
  int previous() => (_currentPageIndexNotifier.value = --_currentPageIndexNotifier.value);
  int next() => (_currentPageIndexNotifier.value = ++_currentPageIndexNotifier.value);
  void changeCurrentPage(int pageIndex,) async{
    return await pageController.animateToPage(pageIndex, duration: const Duration(seconds: 500,), curve: Curves.ease,);
  }
  /////////////////////////
  void onClose() {
    serviceLocator<AppNavigationService>().goBack();
  }
  /////////////////////////
  void onDispose() {}
  /////////////////////////
  void onModelReady() {}
}
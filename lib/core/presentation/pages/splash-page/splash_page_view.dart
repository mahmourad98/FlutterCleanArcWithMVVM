import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:untitled05/config/app_assets_path.dart';
import 'package:untitled05/core/presentation/pages/splash-page/splash_page_view_model.dart';

class SplashPageView extends StatelessWidget {
  static const String routeName = "/splash-page";
  static const ValueKey<String> routeKey = ValueKey<String>("splash-page",);
  /////////////////////////
  const SplashPageView() : super(key: null,);
  /////////////////////////
  @override
  Widget build(BuildContext context,) {
    return ViewModelBuilder<SplashPageViewModel>.nonReactive(
      fireOnViewModelReadyOnce: true,
      initialiseSpecialViewModelsOnce: true,
      disposeViewModel: true,
      viewModelBuilder: () => SplashPageViewModel.create(),
      onViewModelReady: (SplashPageViewModel viewModel,) => viewModel.onModelReady(),
      builder: (_, SplashPageViewModel viewModel, __,) => const _SplashPageView(key: routeKey,),
    );
  }
}

class _SplashPageView extends ViewModelWidget<SplashPageViewModel> {
  const _SplashPageView({Key? key,}) : super(key: key,);
  /////////////////////////
  @override
  Widget build(BuildContext context, SplashPageViewModel viewModel,) {
    return WillPopScope(
      onWillPop: () async {
        viewModel.onClose();
        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context,).primaryColor,
        body: Center(
          child: Image.asset(AppAssetsPath.splash_logo, fit: BoxFit.contain,),
        ),
      ),
    );
  }
}


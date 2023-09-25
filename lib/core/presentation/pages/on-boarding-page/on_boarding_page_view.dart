import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled05/config/app_assets_path.dart';
import 'package:untitled05/extras/constants/app_string.dart';
import 'package:untitled05/core/domain/entities/slider-data/slider_data.dart';
import 'package:untitled05/core/presentation/pages/on-boarding-page/on_boarding_page_view_model.dart';
import 'package:untitled05/extras/constants/app_colors.dart';
import 'package:untitled05/extras/constants/app_sizes.dart';
import 'package:untitled05/extras/constants/app_text_styles.dart';

class OnBoardingPageView extends StatelessWidget {
  static const ValueKey<String> routeKey = ValueKey<String>("splash-page",);
  /////////////////////////
  const OnBoardingPageView() : super(key: null,);
  /////////////////////////
  @override
  Widget build(BuildContext context,) {
    final pageController = PageController();
    final viewModel = OnBoardingPageViewModel.create(pageController: pageController,);
    return _OnBoardingPageView(key: routeKey, viewModel: viewModel,);
  }
}

class _OnBoardingPageView extends StatefulWidget {
  final OnBoardingPageViewModel viewModel;
  const _OnBoardingPageView({super.key, required this.viewModel,});
  @override State<_OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<_OnBoardingPageView>{
  late final _sliderData = <SliderData>[
    SliderData(title: AppStrings.onBoardingTitle1, description: AppStrings.onBoardingSubTitle1, image: AppAssetsPath.onboarding_logo1,),
    SliderData(title: AppStrings.onBoardingTitle2, description: AppStrings.onBoardingSubTitle2, image: AppAssetsPath.onboarding_logo2,),
    SliderData(title: AppStrings.onBoardingTitle3, description: AppStrings.onBoardingSubTitle3, image: AppAssetsPath.onboarding_logo3,),
    SliderData(title: AppStrings.onBoardingTitle4, description: AppStrings.onBoardingSubTitle4, image: AppAssetsPath.onboarding_logo4,),
  ];
  /////////////////////////
  @override void initState() {
    widget.viewModel.onModelReady();
    super.initState();
  }
  @override void dispose() {
    widget.viewModel.onDispose();
    super.dispose();
  }
  /////////////////////////
  @override Widget build(BuildContext context,) {
    return WillPopScope(
      onWillPop: () async {
        widget.viewModel.onClose();
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.white1,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.white1,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PageView(
                reverse: false,
                allowImplicitScrolling: false,
                dragStartBehavior: DragStartBehavior.start,
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                controller: widget.viewModel.pageController,
                physics: const ClampingScrollPhysics(),
                onPageChanged: widget.viewModel.setPageIndex,
                children: List.generate(_sliderData.length, (int index,) => _buildPage(_sliderData[index],),),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(AppStrings.skip.toUpperCase(), style: const TextStyle(color: AppColors.primary, fontSize: FontSizeManager.s18,),),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: widget.viewModel.currentPageIndexNotifier,
              builder: (_, int currentIndex, __,) {
                return Container(
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context,).primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_sliderData.length, (int index,) => _buildDot(index, currentIndex,),),
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
  /////////////////////////
  Widget _buildDot(int index, int currentPageIndex,) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300,),
      margin: const EdgeInsets.symmetric(horizontal: 5.0,),
      height: 10.0,
      width: (currentPageIndex == index) ? AppSize.s20 : AppSize.s12,
      decoration: BoxDecoration(
        color: (currentPageIndex == index) ? AppColors.white1 : AppColors.black1,
        borderRadius: BorderRadius.circular(AppSize.s20,),
      ),
    );
  }
  /////////////////////////
  Widget _buildPage(SliderData data,) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(data.title, textAlign: TextAlign.center, style: const TextStyle(fontSize: FontSizeManager.s20, fontWeight: FontWeightManager.regular,),),
          const SizedBox(height: AppSize.s20,),
          Expanded(child: SvgPicture.asset(data.image, fit: BoxFit.contain,),),
          const SizedBox(height: AppSize.s20,),
          Text(data.description, textAlign: TextAlign.center, style: const TextStyle(fontSize: FontSizeManager.s20, fontWeight: FontWeightManager.regular,),),
        ],
      ),
    );
  }
}


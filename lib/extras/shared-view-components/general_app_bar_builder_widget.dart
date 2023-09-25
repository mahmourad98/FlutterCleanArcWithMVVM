import 'package:flutter/material.dart';

class GeneralAppBarBuilderWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final WidgetBuilder childBuilder;
  const GeneralAppBarBuilderWidget({Key? key, required this.height, required this.childBuilder,}) : super(key: key,);
  /////////////////////////
  @override Widget build(BuildContext context,) {
    return _GeneralAppBarBuilderWidget(
      key: const ValueKey<String>("general-app-bar",),
      preferredSize: preferredSize,
      childBuilder: childBuilder,
    );
  }
  /////////////////////////
  @override Size get preferredSize => Size.fromHeight(height,);
}

class _GeneralAppBarBuilderWidget extends StatelessWidget {
  final Size preferredSize;
  final WidgetBuilder childBuilder;
  /////////////////////////
  const _GeneralAppBarBuilderWidget({Key? key, required this.preferredSize, required this.childBuilder,}) : super(key: key,);
  /////////////////////////
  @override Widget build(BuildContext context,) {
    return DecoratedBox(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context,).viewPadding.top,),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: preferredSize.height,),
          child: Builder(builder: childBuilder,),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:english_hero/core/exception/app_exception.dart';
import 'package:english_hero/core/exception/exception_model.dart';
import 'package:english_hero/di/injection/injetion.dart';
import 'package:english_hero/ui/components/app_drawer.dart';
import 'package:english_hero/ui/components/app_top_bar.dart';
import 'package:english_hero/ui/components/message_dialog.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

abstract class BasePageScreen extends StatefulWidget {
  const BasePageScreen({Key? key}) : super(key: key);
}

abstract class BasePageScreenState<Page extends BasePageScreen>
    extends State<Page> {
  String _appBarTitle = '';
  bool _canGoBack = true;
  bool _isShowAppBar = true;
  bool _isShowDrawer = true;

  void appBarTitle(String title) {
    _appBarTitle = title;
  }

  void isBackButton(bool isBack) {
    _canGoBack = isBack;
  }

  void isShowAppBar(bool showAppBar) {
    _isShowAppBar = showAppBar;
  }

  void isShowDrawer(bool isShow) {
    _isShowDrawer = isShow;
  }
}

mixin BaseScreen<Page extends BasePageScreen> on BasePageScreenState<Page> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: getIt.get<ExceptionModel>(),
        child: ScopedModelDescendant<ExceptionModel>(
          builder: (ctx, child, model) => getAppWidget(model),
        ));
  }

  Widget getAppWidget(ExceptionModel exceptionViewModel) {
    if (exceptionViewModel.hasException()) {
      handleError(exceptionViewModel.getException());
    }

    if (_isShowAppBar && _isShowDrawer) {
      return appWithAppBarAndDrawer();
    } else if (_isShowAppBar && !_isShowDrawer) {
      return appWithoutDrawer();
    } else if (!_isShowAppBar && _isShowDrawer) {
      return appWithoutDrawer();
    } else {
      return appWithoutAppBarNorDrawer();
    }
  }

  void handleError(AppException exception) {
    showMessage(exception);
  }

  void showMessage(AppException exception) {
    Future.delayed(Duration.zero, () async {
      showDialog(
          context: context,
          builder: (ctx) => MessageDialog(tr('error_dialog_title'),
              exception.toExceptionString(), tr('okay_button_text'), null));
    });
  }

  Widget appWithAppBarAndDrawer() {
    return Scaffold(
        appBar: MyAppBar(context, _appBarTitle, _canGoBack),
        drawer: const AppDrawer(),
        body: Container(
          child: body(),
          color: Colors.white,
        ));
  }

  Widget appWithoutAppBarNorDrawer() {
    return Scaffold(
        body: Container(
      child: body(),
      color: Colors.white,
    ));
  }

  Widget appWithoutDrawer() {
    return Scaffold(
        appBar: _isShowAppBar
            ? MyAppBar(context, _appBarTitle, _canGoBack)
            : AppBar(),
        body: Container(
          child: body(),
          color: Colors.white,
        ));
  }

  Widget appWithoutAppBar() {
    return Scaffold(
        drawer: const AppDrawer(),
        body: Container(
          child: body(),
          color: Colors.white,
        ));
  }

  Widget body();
}

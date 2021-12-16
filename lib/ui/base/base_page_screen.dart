import 'package:english_hero/presentation/provider/user_provider.dart';
import 'package:english_hero/ui/components/app_drawer.dart';
import 'package:english_hero/ui/components/app_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  late UserProvider userProvider;
  @override
  Widget build(BuildContext context) {
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

  void showMessage() {
    Future.delayed(Duration.zero, () async {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('An Error Occured!'),
                content: Text('Hello :DD:D:D: '),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Okay'))
                ],
              ));
    });
  }

  Widget appWithAppBarAndDrawer() {
    return Scaffold(
        appBar: MyAppBar(context, _appBarTitle, _canGoBack),
        drawer: AppDrawer(),
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
        drawer: AppDrawer(),
        body: Container(
          child: body(),
          color: Colors.white,
        ));
  }

  Widget body();
}

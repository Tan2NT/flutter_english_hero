// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:english_hero/domain/model/auth_mode.dart';
import 'package:english_hero/ui/components/message_dialog.dart';
import 'package:english_hero/ui/main/english/topic/english_topics_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../../../presentation/provider/user_provider.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key? key,
  }) : super(key: key);

  @override
  _AuthCardState createState() {
    return _AuthCardState();
  }
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.login;
  // ignore: prefer_final_fields
  Map<String, String> _authData = {'email': '', 'password': ''};
  bool _isLoading = false;
  final _passwordController = TextEditingController();
  AnimationController? _controller;
  Animation<Offset>? _slideAnimation;
  Animation<double>? _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _slideAnimation = Tween<Offset>(
            begin: const Offset(0, -1.5), end: const Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn));
    _opacityAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => MessageDialog(
            'error_dialog_title'.tr(), message, 'okay_button_text'.tr(), null));
  }

  Future<void> _submit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final isSuccess = await Provider.of<UserProvider>(context, listen: false)
          .authenticate(_authData['email'] as String,
              _authData['password'] as String, _authMode);
      if (isSuccess) {
        Navigator.of(context)
            .pushReplacementNamed(EnglishTopicsScreen.routeName);
      }
      // ignore: empty_catches
    } catch (error) {}

    if (userProvider.errorMessage.isNotEmpty) {
      _showErrorDialog(userProvider.errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.login) {
      setState(() {
        _authMode = AuthMode.signUp;
      });
      _controller!.forward();
    } else {
      setState(() {
        _authMode = AuthMode.login;
      });
      _controller!.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 8.0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        height: _authMode == AuthMode.signUp ? 320 : 260,
        constraints: BoxConstraints(
          minHeight: _authMode == AuthMode.signUp ? 320 : 260,
        ),
        width: deviceSize.width * 0.75,
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    key: const Key('tff_email'),
                    decoration: InputDecoration(labelText: 'email_label'.tr()),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'error_invalid_email_validate'.tr();
                      }
                    },
                    onSaved: (value) {
                      _authData['email'] = value!;
                    },
                  ),
                  TextFormField(
                    key: const Key('tff_password'),
                    decoration: InputDecoration(labelText: 'password'.tr()),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return 'error_password_too_short'.tr();
                      }
                    },
                    onSaved: (value) {
                      _authData['password'] = value!;
                    },
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    constraints: BoxConstraints(
                        minHeight: _authMode == AuthMode.signUp ? 60 : 0,
                        maxHeight: _authMode == AuthMode.signUp ? 120 : 0),
                    curve: Curves.easeIn,
                    child: FadeTransition(
                      opacity: _opacityAnimation!,
                      child: SlideTransition(
                        position: _slideAnimation!,
                        child: TextFormField(
                            enabled: _authMode == AuthMode.signUp,
                            decoration: InputDecoration(
                                labelText: 'confirm_password_label'.tr()),
                            obscureText: true,
                            validator: _authMode == AuthMode.signUp
                                ? (value) {
                                    if (value! != _passwordController.text) {
                                      return 'error_password_not_match'.tr();
                                    }
                                  }
                                : null),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20,
                  ),
                  if (_isLoading)
                    const CircularProgressIndicator()
                  else
                    // ignore: deprecated_member_use
                    RaisedButton(
                      key: const Key('btn_submit'),
                      onPressed: _submit,
                      child: Text(_authMode == AuthMode.login
                          ? 'login'.tr()
                          : 'sign_up'.tr()),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30.0),
                      color: Theme.of(context).primaryColor,
                      textColor:
                          Theme.of(context).primaryTextTheme.button!.color,
                    ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: _switchAuthMode,
                    key: const Key('btn_login_switch'),
                    child: Text(
                        '${_authMode == AuthMode.login ? 'sign_up'.tr() : 'login'.tr()} instead'
                            .tr()),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 4),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            )),
      ),
    );
  }
}

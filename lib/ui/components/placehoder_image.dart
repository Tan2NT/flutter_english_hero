import 'package:english_hero/core/exception/utils/connectivity_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlacehoderImage extends StatefulWidget {
  final String _localAsset;
  final String _remoteAssert;

  const PlacehoderImage(this._localAsset, this._remoteAssert, {Key? key})
      : super(key: key);

  @override
  _PlacehoderImageState createState() => _PlacehoderImageState();
}

class _PlacehoderImageState extends State<PlacehoderImage> {
  bool _hasInternetConnection = false;
  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  void checkInternetConnection() async {
    final isConnected = await ConnectivityUtil.hasInternetConnection();
    if (_hasInternetConnection != isConnected) {
      setState(() {
        _hasInternetConnection = isConnected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _hasInternetConnection
        ? FadeInImage(
            placeholder: AssetImage(widget._localAsset),
            image: NetworkImage(widget._remoteAssert))
        : Image.asset(widget._localAsset);
  }
}

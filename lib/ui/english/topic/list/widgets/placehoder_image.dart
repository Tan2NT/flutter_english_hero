import 'package:english_hero/core/exception/utils/connectivity_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlacehoderImage extends StatefulWidget {
  final String _localAsset;
  final String _remoteAssert;

  PlacehoderImage(this._localAsset, this._remoteAssert);

  @override
  _PlacehoderImageState createState() => _PlacehoderImageState();
}

class _PlacehoderImageState extends State<PlacehoderImage> {
  bool _hasInternetConnection = false;
  @override
  void initState() {
    super.initState();
  }

  void checkInternetConnection() async {
    final isConnected = await ConnectivityUtil.hasInternetConnection();
    setState(() {
      _hasInternetConnection = isConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _hasInternetConnection
        ? FadeInImage(
            placeholder: AssetImage(widget._localAsset),
            image: NetworkImage(widget._remoteAssert))
        : Image.asset('widget._localAsset');
  }
}

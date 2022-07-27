import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

class TopBar extends StatelessWidget {
  //const TopBar({Key? key}) : super(key: key);

  String _barTitles;
  Widget? primaryActions;
  Widget? secondaryActions;
  double? fontsize;

  late double _deviceheight;
  late double _devicewidth;

  TopBar(this._barTitles,
      {this.primaryActions, this.secondaryActions, this.fontsize = 35 });

  @override
  Widget build(BuildContext context) {
    _deviceheight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;
    return _buildUI();
  }

  Widget _buildUI() {
    return Container(
      height: _deviceheight * 0.10,//10 
      width: _devicewidth,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (secondaryActions != null) secondaryActions!,
          _titleBar(),
          if (primaryActions != null) primaryActions!,
        ],
      ),
    );
  }

  Widget _titleBar() {
    return Text(
      _barTitles,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: Colors.white, fontSize: fontsize, fontWeight: FontWeight.w500),
    );
  }
}

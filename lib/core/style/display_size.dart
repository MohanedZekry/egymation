import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class DisplaySize extends Equatable {
  final BuildContext mContext;

  const DisplaySize({required this.mContext});

  Size displaySize() {
    return MediaQuery.of(mContext).size;
  }

  double displayHeight() {
    return displaySize().height;
  }

  double displayWidth() {
    return displaySize().width;
  }

  @override
  List<Object> get props => [mContext];
}
import 'package:flutter/cupertino.dart';

extension Space on num {
  SizedBox get h {
    return SizedBox(height: this.toDouble());
  }
}

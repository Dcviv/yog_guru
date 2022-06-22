import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  Color?
      color; //? for optional parameter we may or may not pass it while caling
  final String text;
  double size;
  TextOverflow overFlow;
  BigText(
      {Key? key,
      this.color = const Color(0xFF000000),
      required this.text,
      this.size = 0,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size == 0 ? 24 : size,
          fontWeight: FontWeight.w400),
    );
  }
}

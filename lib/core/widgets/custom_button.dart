import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_dimensions.dart';
import '../constants/app_styles.dart';

class CustomButton extends StatefulWidget {
  String text;
  bool? isLoading;
  Function()? onTab;
  Color? buttonColor;
  final Color? textColor;
  final IconData? icon;
  final double? verticalPadding;

  CustomButton(
      {Key? key,
      required this.onTab,
      this.icon,
      this.textColor,
      this.buttonColor,
      required this.text,
      this.verticalPadding,
      this.isLoading})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        child: _button(context));
  }

  Widget _button(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimensions.paddingContent),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(AppDimensions.buttonRadius))),
            backgroundColor:
                widget.buttonColor ?? Theme.of(context).primaryColor,
          ),
          onPressed: widget.onTab ?? null,
          child: widget.isLoading ?? false ? _loading(context) : _text()),
    );
  }

  Widget _text() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.verticalPadding ?? 10.0),
      child: Center(
        child: widget.icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.text,
                    style: AppStyles.button.copyWith(
                        color: widget.textColor ?? (widget.onTab == null
                                ? Theme.of(context).dividerColor
                                : Theme.of(context).indicatorColor)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    widget.icon,
                    color: Theme.of(context).indicatorColor,
                  )
                ],
              )
            : Text(
                widget.text,
                style: AppStyles.button.copyWith(
                    color: widget.textColor ?? (widget.onTab == null
                        ? Theme.of(context).dividerColor
                        : Theme.of(context).indicatorColor)),
              ),
      ),
    );
  }

  Widget _loading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: AppStyles.button
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: Theme.of(context).indicatorColor,
            ),
          )
        ],
      ),
    );
  }
}

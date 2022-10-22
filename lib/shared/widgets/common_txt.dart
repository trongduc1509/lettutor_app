import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../base/define/style/default_style.dart';

class CommonField extends StatelessWidget {
  const CommonField(
      {Key? key,
      this.controller,
      this.initialValue,
      this.focusNode,
      this.decoration = const InputDecoration(),
      this.keyboardType,
      this.textCapitalization = TextCapitalization.none,
      this.textInputAction,
      this.style,
      this.strutStyle,
      this.textDirection,
      this.textAlign = TextAlign.start,
      this.textAlignVertical,
      this.autofocus = false,
      this.readOnly = false,
      this.toolbarOptions,
      this.showCursor,
      this.obscuringCharacter = '•',
      this.obscureText = false,
      this.autocorrect = true,
      this.smartDashesType,
      this.smartQuotesType,
      this.enableSuggestions = true,
      this.maxLengthEnforcement,
      this.maxLines = 1,
      this.minLines,
      this.expands = false,
      this.maxLength,
      this.onChanged,
      this.onTap,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.onSaved,
      this.validator,
      this.inputFormatters,
      this.enabled,
      this.cursorWidth = 2.0,
      this.cursorHeight,
      this.cursorRadius,
      this.cursorColor,
      this.keyboardAppearance,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.enableInteractiveSelection = true,
      this.selectionControls,
      this.buildCounter,
      this.scrollPhysics,
      this.autofillHints,
      this.autovalidateMode,
      this.scrollController,
      this.restorationId,
      this.enableIMEPersonalizedLearning = true,
      this.enaleBorder = true,
      this.backgroundColor = Colors.white,
      this.padding = const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      )})
      : super(key: key);

  final TextEditingController? controller;
  final InputDecoration? decoration;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final bool enaleBorder;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: enaleBorder
              ? Border.all(
                  style: BorderStyle.solid,
                  width: 1,
                  color: DefaultStyle().greyDisable,
                )
              : null,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: padding,
        child: TextFormField(
          controller: controller,
          decoration: decoration,
          initialValue: initialValue,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          style: style ?? Theme.of(context).textTheme.bodyLarge,
          strutStyle: strutStyle,
          textDirection: textDirection,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          autofocus: autofocus,
          readOnly: readOnly,
          toolbarOptions: toolbarOptions,
          showCursor: showCursor,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          autocorrect: autocorrect,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          enableSuggestions: enableSuggestions,
          maxLengthEnforcement: maxLengthEnforcement,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          keyboardAppearance: keyboardAppearance,
          scrollPadding: scrollPadding,
          enableInteractiveSelection: enableInteractiveSelection,
          selectionControls: selectionControls,
          buildCounter: buildCounter,
          scrollPhysics: scrollPhysics,
          autofillHints: autofillHints,
          autovalidateMode: autovalidateMode,
          scrollController: scrollController,
          restorationId: restorationId,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
        ),
      );
}

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {Key? key,
      this.placeHolder,
      this.suffixIcon,
      this.controller,
      this.txtSelected,
      this.keyboardType,
      this.suffixAction,
      this.maxLines = 1,
      this.onChanged,
      this.focusNode})
      : super(key: key);

  final String? placeHolder;
  final Icon? suffixIcon;
  final TextEditingController? controller;
  final Function()? txtSelected;
  final Function()? suffixAction;
  final TextInputType? keyboardType;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return CommonField(
      focusNode: focusNode,
      maxLines: maxLines,
      showCursor: txtSelected == null,
      readOnly: txtSelected != null,
      onTap: txtSelected,
      controller: controller,
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.done,
      padding: const EdgeInsets.all(7),
      onChanged: onChanged,
      decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          hintText: placeHolder,
          labelStyle: DefaultStyle()
              .t16Regular
              .apply(color: DefaultStyle().greyDisable),
          suffixIconConstraints: suffixIcon != null
              ? const BoxConstraints(minWidth: 0, minHeight: 0)
              : null,
          suffixIcon: suffixIcon != null
              ? GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: suffixIcon,
                  onTap: () {
                    if (suffixAction != null) {
                      suffixAction!();
                    }
                  },
                )
              : null),
      style: DefaultStyle().t16Regular,
    );
  }
}

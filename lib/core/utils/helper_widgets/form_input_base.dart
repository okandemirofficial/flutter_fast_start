// ignore_for_file: flutter_style_todos

import 'package:flutter/material.dart';
import 'package:flutter_fast_start/core/utils/regex_validators.dart';

// I just copied that from my other projects
// class BackendFieldValidatorWithFocusNode {
//   BackendFieldValidatorWithFocusNode(
//       {required this.validateFunction,
//       required this.fieldCallback,
//       required this.setStateTrigger,
//       required this.possibleErrorMessage}) {
//     focusNode = FocusNode();
//     focusNode.addListener(validateWithFocusChange);
//   }

//   //If true, then, should pass;
//   Future<bool> Function(String field) validateFunction;
//   String Function() fieldCallback;
//   void Function(void Function()) setStateTrigger;
//   late String possibleErrorMessage;
//   late FocusNode focusNode;
//   String? errorField;
//   bool isLastControlPassed = false;

//   void validateWithOnEditingComplete() async {
//     _validateWithValidator();
//   }

//   void _validateWithValidator() async {
//     String field = fieldCallback();
//     if (field.isNotEmpty) {
//       if (await validateFunction(field)) {
//         errorField = null;
//         setStateTrigger(() {});
//         isLastControlPassed = true;
//       } else {
//         errorField = possibleErrorMessage;
//         setStateTrigger(() {});
//         isLastControlPassed = false;
//       }
//     }
//   }

//   void validateWithFocusChange() async {
//     if (focusNode.hasFocus == false) {
//       _validateWithValidator();
//     }
//   }
// }

//TODO: Make this document multi-language

///It's a ready-to-use password field with variety of features
class PasswordFieldBase extends StatefulWidget {
  ///It's a ready-to-use password field with variety of features
  const PasswordFieldBase({
    super.key,
    required this.onChanged,
    this.isConfirmation = false,
    this.compareCallback,
    this.focusNode,
    this.nextFocusNode,
    this.isLastTextBox = false,
    this.validate = false,
  });

  ///onChanged
  final void Function(String)? onChanged;

  ///Is it main password field or re-password field
  ///If it's confirmation
  final bool isConfirmation;

  ///Will apply validate with [RegexValidators.isValidPassword]
  final bool validate;

  ///Please provide a function to give password field if it's confirmation field
  final String Function()? compareCallback;

  ///If provides focus node, it will focus automaticly
  final FocusNode? focusNode;

  ///True ==> Keyboard will close after done
  final bool isLastTextBox;

  ///It's required when the cursor not moving automatically
  final FocusNode? nextFocusNode;

  @override
  State<PasswordFieldBase> createState() => _PasswordFieldBaseState();
}

class _PasswordFieldBaseState extends State<PasswordFieldBase> {
  bool _isVisible = false;

  Widget _renderSuffixIcon() {
    return InkWell(
      onTap: () => setState(() {
        _isVisible = !_isVisible;
      }),
      child: _isVisible
          ? const Icon(Icons.visibility_off_outlined)
          : const Icon(Icons.visibility_outlined),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.password],
      textInputAction:
          widget.isLastTextBox ? TextInputAction.done : TextInputAction.next,
      obscureText: !_isVisible,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      onEditingComplete: () {
        if (widget.isLastTextBox) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
        if (widget.nextFocusNode != null) {
          widget.nextFocusNode!.requestFocus();
        }
      },
      decoration: InputDecoration(
        errorMaxLines: 2,
        suffixIcon: _renderSuffixIcon(),
        label: Text(
          widget.isConfirmation ? 'Şifre Tekrarınız' : 'Şifreniz',
        ),
        hintText: widget.isConfirmation
            ? 'Şifre Tekrarınızı Giriniz'
            : 'Şifrenizi Giriniz',
      ),
      validator: (input) {
        if (widget.validate) {
          if (!widget.isConfirmation &&
              input != null &&
              !input.isValidPassword()) {
            // ignore: lines_longer_than_80_chars
            return 'Şifreniz en az 8 karakterli olmalı, 1 büyük harf, 1 küçük harf bulunmalıdır.';
          }
          if (widget.compareCallback != null &&
              widget.compareCallback!() != input) {
            return 'Şifreler birbiriyle uyuşmuyor.';
          }
        }
        return null;
      },
    );
  }
}

///Textformfield for commom purposes like asking username
class TextFormFieldBase extends TextFormField {
  ///Textformfield for commom purposes like asking username
  TextFormFieldBase({
    required super.onChanged,
    void Function()? onEditingComplete,
    required String labelText,
    required String hintText,
    super.focusNode,
    super.minLines,
    super.maxLines = null,
    bool isLastTextBox = false,
    //Future<String?> Function(String?)? extraValidate,
    String? errorText,
    super.key,
  }) : super(
          keyboardType: TextInputType.name,
          autofillHints: const [AutofillHints.name],
          textInputAction:
              isLastTextBox ? TextInputAction.done : TextInputAction.next,
          validator: (input) {
            if (input == null || input.isEmpty) {
              return 'Burası boş bırakılamaz';
            }
            return null;
          },
          onEditingComplete: () {
            if (onEditingComplete != null) {
              onEditingComplete();
            }
            if (isLastTextBox) {
              FocusManager.instance.primaryFocus?.unfocus();
            } else {
              FocusManager.instance.primaryFocus?.nextFocus();
            }
          },
          decoration: InputDecoration(
            label: Text(labelText),
            hintText: hintText,
            errorText: errorText,
          ),
        );
}

///Mail form field to ask email
class MailFieldBase extends TextFormField {
  ///Mail form field to ask email
  MailFieldBase({
    super.key,
    required super.onChanged,
  }) : super(
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          textInputAction: TextInputAction.next,
          validator: (input) {
            if (input != null) {
              if (input.isValidEmail()) {
                return null;
              }
              return 'Geçerli bir mail adresi giriniz';
            } else {
              return null;
            }
          },
          decoration: const InputDecoration(
            label: Text('E-mail Adresi'),
            hintText: 'E-mail Adresinizi Giriniz',
          ),
        );
}

///Custom checkbox field
///TODO: Increase default size, add easy size option
class CheckBoxBase extends StatelessWidget {
  ///Custom checkbox field
  const CheckBoxBase({
    required this.value,
    required this.title,
    required this.onChanged,
    required this.color,
    super.key,
  });

  ///Current and initial value
  final bool value;

  ///Checkbox title
  final String title;

  ///OnChanged
  final void Function(bool?)? onChanged;

  ///
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 2,
              softWrap: true,
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(color: color),
            ),
          ),
          Checkbox(
            value: value,
            onChanged: onChanged,
            side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(width: 2, color: color),
            ),
          ),
        ],
      ),
    );
  }
}

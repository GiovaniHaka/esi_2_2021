import 'package:flutter/material.dart';

class AuthTextFormField extends StatefulWidget {
  final Function(String?)? onSaved;
  final String Function(String?)? validator;
  final Function(String?)? onChanged;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;

  /// If [true] will obscure text, with eye icon to show the text
  final bool haveEyeIcon;

  const AuthTextFormField({
    Key? key,
    this.onSaved,
    this.validator,
    this.hintText,
    this.labelText,
    this.haveEyeIcon = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.initialValue,
    this.helperText,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  _AuthTextFormFieldState createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  bool isPassVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: this.widget.initialValue,
      maxLines: 1,
      textInputAction: TextInputAction.done,
      onSaved: this.widget.onSaved,
      onChanged: this.widget.onChanged,
      decoration: InputDecoration(
        helperText: this.widget.helperText,
        // labelText: "Comentário",
        hintText: this.widget.hintText,
        hintStyle: Theme.of(context).textTheme.caption,
        labelText: this.widget.labelText,
        labelStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
        filled: false,
        // fillColor: Theme.of(context).colorScheme.greyLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        errorMaxLines: 3,
        alignLabelWithHint: false,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.all(15),
        suffixIcon: this.widget.haveEyeIcon
            ? GestureDetector(
                child: Icon(
                  isPassVisible
                      ? Icons.remove_red_eye_rounded
                      : Icons.remove_red_eye_outlined,
                  color: Colors.grey,
                ),
                onTap: () {
                  setState(() {
                    isPassVisible = !isPassVisible;
                    print(isPassVisible);
                  });
                },
              )
            : null,
      ),
      obscureText: this.widget.haveEyeIcon ? !isPassVisible : false,
      validator: this.widget.validator,
      keyboardType: this.widget.keyboardType,
      textAlignVertical: TextAlignVertical.center,
      textCapitalization: this.widget.textCapitalization!,
    );
  }
}

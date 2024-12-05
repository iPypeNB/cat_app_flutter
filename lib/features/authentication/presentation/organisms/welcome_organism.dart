import 'package:cat_app_flutter/core/utils/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

class WelcomeOrganism extends StatelessWidget {
  const WelcomeOrganism({
    super.key,
    this.onPasswordChanged,
    this.onEmailChanged,
    this.passwordValidateMode,
    this.passwordValidator,
    this.onPressLoginButton,
    required this.formKey,
  });

  final Function(String)? onPasswordChanged;
  final Function(String)? onEmailChanged;
  final String? Function(String?)? passwordValidator;
  final AutovalidateMode? passwordValidateMode;
  final VoidCallback? onPressLoginButton;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.arrow_forward),
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: _WelcomeBody(
                onPasswordChanged: onPasswordChanged,
                onEmailChanged: onEmailChanged,
                passwordValidateMode: passwordValidateMode,
                passwordValidator: passwordValidator,
                onPressLoginButton: onPressLoginButton,
                formKey: formKey,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _WelcomeBody extends StatelessWidget {
  const _WelcomeBody({
    this.onPasswordChanged,
    this.onEmailChanged,
    this.passwordValidateMode,
    this.passwordValidator,
    this.onPressLoginButton,
    required this.formKey,
  });

  final Function(String)? onPasswordChanged;
  final String? Function(String?)? passwordValidator;
  final AutovalidateMode? passwordValidateMode;
  final Function(String)? onEmailChanged;
  final VoidCallback? onPressLoginButton;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Stack(
            children: [
              Image.asset('assets/img/icons8-full-moon-96.png'),
              Positioned(
                bottom: 20.0,
                left: 10.0,
                child: Image.asset('assets/img/icons8-reading-50.png'),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40.0,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _CustomTextFormField(
                            key: const Key('email_input'),
                            text: 'Email address',
                            onChanged: onEmailChanged,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IntrinsicHeight(
                            child: _CustomTextFormField(
                              key: const Key('password_input'),
                              text: 'Password',
                              trailingButton: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove_red_eye),
                              ),
                              textInfo: 'Forgot Password?',
                              onChanged: onPasswordChanged,
                              validator: passwordValidator,
                              autoValidateMode: passwordValidateMode,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: onPressLoginButton != null ? () => validateFormThenAction(
                        context: context,
                        formKey: formKey,
                        action: onPressLoginButton
                      ): null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)))),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Or',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          backgroundColor: Colors.transparent.withOpacity(0.1),
                        ),
                        icon: const Icon(Icons.gamepad),
                      ),
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          backgroundColor: Colors.transparent.withOpacity(0.1),
                        ),
                        icon: const Icon(Icons.apple),
                      ),
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          backgroundColor: Colors.transparent.withOpacity(0.1),
                        ),
                        icon: const Icon(Icons.facebook),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Don\'t have account? ',
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomTextFormField extends StatelessWidget {
  const _CustomTextFormField({
    super.key,
    required this.text,
    this.trailingButton,
    this.textInfo,
    this.onChanged,
    this.validator,
    this.autoValidateMode = AutovalidateMode.onUnfocus,
  });

  final String text;
  final Widget? trailingButton;
  final String? textInfo;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextFormField(
          onChanged: onChanged,
          validator: validator,
          autovalidateMode: autoValidateMode,
          decoration: InputDecoration(
            suffixIcon: trailingButton,
            filled: true,
            fillColor: Colors.transparent.withOpacity(0.1),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),
        if (textInfo != null)
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textInfo ?? '',
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

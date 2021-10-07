import 'package:admin/constants.dart';
import 'package:admin/models/contactUs.dart';
import 'package:admin/providers/contactUsProvider.dart';
import 'package:admin/widgets/common/text_field_widget.dart';
import 'package:admin/widgets/top_edges-container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ConctactUsScreen extends StatefulWidget {
  const ConctactUsScreen({Key? key}) : super(key: key);

  @override
  _ConctactUsScreenState createState() => _ConctactUsScreenState();
}

final _formKey = GlobalKey<FormState>();
final _firstNameCon = TextEditingController();
final _lastNameCon = TextEditingController();
final _emailCon = TextEditingController();
final _phoneCon = TextEditingController();
final _messageCon = TextEditingController();
final _lastNameFocus = FocusNode();
final _emailFocus = FocusNode();
final _phoneFocus = FocusNode();
final _messageFocus = FocusNode();
final _iconSize = 20.0;
final _heightPadding = 20.0;

class _ConctactUsScreenState extends State<ConctactUsScreen> {
  void submit() {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
    final message = ContactUs(
      _firstNameCon.text,
      _lastNameCon.text,
      _emailCon.text,
      _phoneCon.text,
      _messageCon.text,
    );

    final contactUsProvider =
        Provider.of<ContactUsProvider>(context, listen: false);
    contactUsProvider.addMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            screenWidth <= 480 ? _PageInfoHeaderMobile() : _PageInfoHeaderWeb(),
            screenWidth <= 480
                ? FormContainer(submit)
                : FormContainerWeb(submit),
          ],
        ),
      ),
    );
  }
}

class FormContainerWeb extends StatelessWidget {
  const FormContainerWeb(this.onSubmit);
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: TopEdgesContainer(
        isBottomEdges: true,
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 12,
                    direction: Axis.vertical,
                    children: [
                      OurLoationWidget(),
                      CustomerServiceW(),
                      TechnicalSupportW(),
                      EmailW(),
                    ],
                  ),
                  
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormFirstRowColumn(),
                        const SizedBox(height: 20),
                        FormSecondRowColumn(),
                        const SizedBox(height: 20),
                        FormMessageField(onSubmit),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 416),
            ],
          ),
        ),
      ),
    );
  }
}

class FormContainer extends StatelessWidget {
  const FormContainer(this.onSubmit);
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return TopEdgesContainer(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ContactInfo(),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FormFirstRowColumn(),
                  SizedBox(height: _heightPadding),
                  FormSecondRowColumn(),
                  SizedBox(height: _heightPadding),
                  FormMessageField(onSubmit),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormMessageField extends StatelessWidget {
  FormMessageField(this.submit, {Key? key}) : super(key: key);
  final Function submit;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: _getMessageFieldSize(context),
          child: CustomTextField(
            focusNode: _messageFocus,
            textInputAction: TextInputAction.done,
            hintText: 'Message',
            keyboardType: TextInputType.text,
            controller: _messageCon,
            leftPadding: 57.5,
            topPadding: 32.0,
            maxLines: 8,
            validator: (value) {
              if (value == null || value == '') return 'Message is required';
              if (value.toString().length < 10) return 'Message is too short';
              return null;
            },
            state: false,
            submit: (_) {
              submit();
            },
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 14,
              ),
              child: SvgPicture.asset(
                'assets/icons/message.svg',
                width: _iconSize,
                height: _iconSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FormSecondRowColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ResponsiveRowColumn(
      layout: screenWidth <= 980
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          child: EmailField(),
        ),
        ResponsiveRowColumnItem(
            child: SizedBox(height: _heightPadding, width: _heightPadding)),
        ResponsiveRowColumnItem(
          child: PhoneField(),
        ),
      ],
    );
  }
}

class PhoneField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: _getFieldSize(context),
      child: CustomTextField(
        focusNode: _phoneFocus,
        prefixIcon: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 10, left: 14, right: 24),
          child: SvgPicture.asset(
            'assets/icons/safety-lock.svg',
          ),
        ),
        textInputAction: TextInputAction.next,
        hintText: 'Phone Number',
        keyboardType: TextInputType.phone,
        controller: _phoneCon,
        validator: (value) {
          if (value == null || value == '') return 'Phone number is required';
          return null;
        },
        state: false,
        submit: (_) {
          FocusScope.of(context).requestFocus(_messageFocus);
        },
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _getFieldSize(context),
      child: CustomTextField(
        focusNode: _emailFocus,
        prefixIcon: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 10, left: 14, right: 24),
          child: SvgPicture.asset(
            'assets/icons/email.svg',
          ),
        ),
        textInputAction: TextInputAction.next,
        hintText: 'Email Address',
        keyboardType: TextInputType.emailAddress,
        controller: _emailCon,
        validator: (value) {
          if (value == null || value == '')
            return 'Email is required';
          else if (!value.toString().contains('@') ||
              !value.toString().contains('.com'))
            return 'Please type a valide email';
          return null;
        },
        submit: (_) {
          FocusScope.of(context).requestFocus(_phoneFocus);
        },
      ),
    );
  }
}

class FormFirstRowColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ResponsiveRowColumn(
      layout: screenWidth <= 980
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          child: FirstNameField(),
        ),
        ResponsiveRowColumnItem(
            child: SizedBox(height: _heightPadding, width: _heightPadding)),
        ResponsiveRowColumnItem(
          child: LastNameField(),
        ),
      ],
    );
  }
}

class FirstNameField extends StatelessWidget {
  const FirstNameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _getFieldSize(context),
      child: CustomTextField(
        prefixIcon: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 10, left: 14, right: 24),
          child: SvgPicture.asset(
            'assets/icons/user.svg',
          ),
        ),
        hintText: 'First Name',
        keyboardType: TextInputType.text,
        controller: _firstNameCon,
        validator: (value) {
          if (value == null || value == '') return 'First name is required';
          return null;
        },
        state: false,
        textInputAction: TextInputAction.next,
        submit: (_) {
          FocusScope.of(context).requestFocus(_lastNameFocus);
        },
      ),
    );
  }
}

double? _getFieldSize(context) {
  final width = MediaQuery.of(context).size.width;
  if (width <= 480) return null;
  return width * 0.3;
}

double? _getMessageFieldSize(context) {
  final width = MediaQuery.of(context).size.width;
  if (width <= 480) return null;
  return width * 0.612;
}

class LastNameField extends StatelessWidget {
  const LastNameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _getFieldSize(context),
      child: CustomTextField(
        prefixIcon: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 10, left: 14, right: 24),
          child: SvgPicture.asset(
            'assets/icons/user.svg',
          ),
        ),
        hintText: 'Last Name',
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        controller: _lastNameCon,
        focusNode: _lastNameFocus,
        validator: (value) {
          if (value == null || value == '') return 'Last name is required';
          return null;
        },
        state: false,
        submit: (_) {
          FocusScope.of(context).requestFocus(_emailFocus);
        },
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OurLoationWidget(),
            TechnicalSupportW(),
          ],
        ),
        const SizedBox(height: 26),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EmailW(),
            CustomerServiceW(),
          ],
        ),
      ],
    );
  }
}

class CustomerServiceW extends StatelessWidget {
  const CustomerServiceW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      Icons.phone,
      'Customer Service',
      '+9923 383 238',
    );
  }
}

class EmailW extends StatelessWidget {
  const EmailW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      Icons.email,
      'Email Address',
      'Info@website.com',
    );
  }
}

class TechnicalSupportW extends StatelessWidget {
  const TechnicalSupportW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      Icons.settings,
      'Technical Support',
      '+992 365 650',
    );
  }
}

class OurLoationWidget extends StatelessWidget {
  const OurLoationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      Icons.place_rounded,
      'Our Location',
      'Level 37,Gros, Australia',
    );
  }
}

class _PageInfoHeaderWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContactUsText(),
                SizedBox(
                  height: 10,
                ),
                HintText(secondLine: false),
              ],
            ),
            Spacer(),
            AppsIcons(),
          ],
        ),
      ),
    );
  }
}

class _PageInfoHeaderMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactUsText(),
          const SizedBox(height: 14),
          HintText(),
          const SizedBox(height: 14),
          const Divider(color: Colors.grey),
          const SizedBox(height: 14),
          AppsIcons(),
        ],
      ),
    );
  }
}

class AppsIcons extends StatelessWidget {
  final _iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Stay Updated',
          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
        ),
        SizedBox(
          width: 20,
        ),
        Wrap(
          spacing: 10,
          children: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/twitter.svg',
                width: _iconSize,
                height: _iconSize,
              ),
            ), //twitter
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/instagram.svg',
                width: _iconSize,
                height: _iconSize,
              ),
            ), //insta
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/facebook.svg',
                width: _iconSize,
                height: _iconSize,
              ),
            ), //facebook
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/youtube.svg',
                width: _iconSize,
                height: _iconSize,
              ),
            ), //youtube
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/snapchat.svg',
                width: _iconSize,
                height: _iconSize,
              ),
            ), //snapchat
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/telegram.svg',
                width: _iconSize,
                height: _iconSize,
              ),
            ), //telegram
          ],
        )
      ],
    );
  }
}

class HintText extends StatelessWidget {
  const HintText({
    this.secondLine = true,
    Key? key,
  }) : super(key: key);
  final bool secondLine;
  @override
  Widget build(BuildContext context) {
    return Text(
      'Check your ongoing policies and${secondLine ? '\n' : ' '}manage them',
      style: TextStyle(
        color: Colors.grey,
      ),
    );
  }
}

class ContactUsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Contact Us',
      textAlign: TextAlign.start,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        color: Colors.black,
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  final IconData icon;
  final String firstText;
  final String secondText;
  InfoWidget(this.icon, this.firstText, this.secondText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Wrap(
      direction: width <= 480 ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment:
          width <= 480 ? WrapCrossAlignment.start : WrapCrossAlignment.center,
      spacing: width <= 480 ? 8.0 : 14,
      runSpacing: width <= 480 ? 0.0 : 14,
      children: [
        Icon(
          this.icon,
          color: Colors.white38,
        ),
        Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 4,
          children: [
            Text(
              this.firstText,
              style: TextStyle(fontSize: 12),
            ),
            Text(
              this.secondText,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

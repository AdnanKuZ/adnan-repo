import 'package:admin/constants.dart';
import 'package:admin/models/contactUs.dart';
import 'package:admin/providers/contactUsProvider.dart';
import 'package:admin/widgets/common/text_field_widget.dart';
import 'package:admin/widgets/side_menu.dart';
import 'package:admin/widgets/top_edges-container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:admin/widgets/dashboard/dashboard_header.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16,horizontal: 48),
          child: Column(
            children: [
              Column(
                children: [
                  DashboardHeader(),
                  _PageInfoHeader(iconSize: _iconSize),
                  TopEdgesContainer(
                    color: primaryColor,
                    child: SingleChildScrollView(
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
                                  FormFirstRow(),
                                  SizedBox(height: _heightPadding),
                                  FormSecondRow(),
                                  SizedBox(height: _heightPadding),
                                  FormMessageField(submit),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormMessageField extends StatelessWidget {
  FormMessageField(this.submit, {Key? key}) : super(key: key);
  Function submit;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomTextField(
          focusNode: _messageFocus,
          textInputAction: TextInputAction.done,
          hintText: 'Message',
          keyboardType: TextInputType.text,
          controller: _messageCon,
          leftPadding: 48.0,
          topPadding: 26.0,
          maxLines: 7,
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
        Positioned.fill(
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 14,
              ),
              child: Icon(
                Icons.message,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FormSecondRow extends StatelessWidget {
  const FormSecondRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          focusNode: _emailFocus,
          prefixIcon: Icon(
            Icons.email,
            color: Colors.black,
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
          state: false,
          submit: (_) {
            FocusScope.of(context).requestFocus(_phoneFocus);
          },
        ),
        SizedBox(height: _heightPadding),
        CustomTextField(
          focusNode: _phoneFocus,
          prefixIcon: Icon(
            Icons.phone_android_rounded,
            color: Colors.black,
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
      ],
    );
  }
}

class FormFirstRow extends StatelessWidget {
  const FormFirstRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black,
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
        SizedBox(height: _heightPadding),
        CustomTextField(
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black,
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
      ],
    );
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoWidget(
              Icons.place_rounded,
              'Our Location',
              'Level 37,Gros, Australia',
            ),
            InfoWidget(
              Icons.settings,
              'Technical Support',
              '+992 365 650',
            ),
          ],
        ),
        const SizedBox(height: 26),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoWidget(
              Icons.email,
              'Email Address',
              'Info@website.com',
            ),
            InfoWidget(
              Icons.phone,
              'Customer Service',
              '+9923 383 238',
            ),
          ],
        ),
      ],
    );
  }
}

class _PageInfoHeader extends StatelessWidget {
  const _PageInfoHeader({
    Key? key,
    required double iconSize,
  })  : _iconSize = iconSize,
        super(key: key);

  final double _iconSize;

  @override
  Widget build(BuildContext context) {
    final _iconColor = Colors.grey;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Us',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
          ),
          const SizedBox(height: 14),
          Text(
            'Check your ongoing policies and \nmanage them',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 14),
          const Divider(color: Colors.grey),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Stay Updated',
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
              ),
              Wrap(
                spacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.title_sharp,
                      size: _iconSize,
                      color: _iconColor,
                    ),
                  ), //twitter
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.ice_skating,
                        size: _iconSize,
                        color: _iconColor,
                      )), //insta
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.facebook_outlined,
                        size: _iconSize,
                        color: _iconColor,
                      )), //facebook
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.youtube_searched_for,
                        size: _iconSize,
                        color: _iconColor,
                      )), //youtube
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.settings_applications,
                        size: _iconSize,
                        color: _iconColor,
                      )), //snapchat
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.text_fields,
                        size: _iconSize,
                        color: _iconColor,
                      )), //telegram
                ],
              )
            ],
          ),
        ],
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
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.start,
      spacing: 8,
      children: [
        Icon(
          this.icon,
          color: Colors.white38,
        ),
        Text(
          this.firstText,
          style: TextStyle(fontSize: 12),
        ),
        Text(
          this.secondText,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

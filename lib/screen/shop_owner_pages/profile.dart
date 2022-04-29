import 'package:flutter/material.dart';


class ProfileOwner extends StatefulWidget {
  const ProfileOwner({Key? key}) : super(key: key);

  @override
  State<ProfileOwner> createState() => _ProfileOwnerState();
}

class _ProfileOwnerState extends State<ProfileOwner> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('profile'),);
  }
}

import 'package:flutter/material.dart';

const _avatarSize = 24.0;

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    this.photo,
    this.avatarSize = _avatarSize,
  }) : super(key: key);

  final double avatarSize;
  final String? photo;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: avatarSize,
      backgroundImage: photo == null ? NetworkImage(photo.toString()) : null,
      child: photo == null ? Icon(Icons.person_outline, size: avatarSize) : null,
    );
  }
}

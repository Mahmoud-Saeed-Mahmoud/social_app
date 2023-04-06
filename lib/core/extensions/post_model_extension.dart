import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/implementation/post_implementation.dart';

extension PostDataExtension on PostModel {
  Widget getPostWidgetModel() {
    final dateTime = DateTime.now().difference(DateTime.tryParse(postTime!)!);

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: profileImage!.isEmpty
                    ? const AssetImage('assets/images/unkown_person.png')
                        as ImageProvider
                    : CachedNetworkImageProvider(profileImage!),
              ),
              title: Text(
                author!,
              ),
              subtitle: Text(
                ' ${dateTime.inDays > 30 ? 'along time ago' : dateTime.inDays > 0 ? '${dateTime.inDays} days ago' : dateTime.inHours > 0 ? '${dateTime.inHours} hours ago' : dateTime.inMinutes > 0 ? '${dateTime.inMinutes}  minutes ago' : 'now'}',
              ),
            ),
            Text(
              postContent!,
              style: const TextStyle(
                fontSize: 26,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

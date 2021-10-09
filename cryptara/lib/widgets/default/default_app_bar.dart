import 'package:flutter/material.dart';

import 'package:cryptara/main.dart';
import 'package:cryptara/helpers/auth.dart';
import 'package:cryptara/screens/auth_screen.dart';

class DefaultAppBar extends AppBar {
  DefaultAppBar(ctx)
      : super(
          title: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          actions: <Widget>[
            DropdownButton(
              underline: SizedBox(),
              icon: Padding(
                padding: EdgeInsets.only(top: 8, right: 8),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(getImageURL()!),
                ),
              ),
              items: [
                DropdownMenuItem(
                  value: "logout",
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.exit_to_app,
                          color: Theme.of(ctx).iconTheme.color,
                        ),
                        SizedBox(width: 8),
                        Text("Log out")
                      ],
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: "settings",
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: Theme.of(ctx).iconTheme.color,
                        ),
                        SizedBox(width: 8),
                        Text("Settings")
                      ],
                    ),
                  ),
                ),
              ],
              onChanged: (itemIdentifier) {
                if (itemIdentifier == "logout") {
                  signOut(ctx);
                  Navigator.of(ctx).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return AuthScreen();
                      },
                    ),
                  );
                }
              },
            ),
          ],
        );
}

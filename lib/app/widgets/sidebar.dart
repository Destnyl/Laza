import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sidebar extends StatelessWidget {
  final VoidCallback? onTapLogout;

  const Sidebar({
    this.onTapLogout,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(0, 72, 0, 0),
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("images/profile.jpeg"),
                  ),
                  title: Text(
                    'Jennie Kim',
                    style: Get.textTheme.titleLarge,
                  ),
                  subtitle: const Row(
                    children: [
                      Text('Verified account'),
                      SizedBox(width: 5),
                      Icon(
                        Icons.verified_outlined,
                        color: Colors.green,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Image.asset(
                    "images/wb_sunny_outlined.png",
                    color: Get.theme.colorScheme.primary,
                  ),
                  title: Text(
                    'Dark Mode',
                    style: Get.textTheme.labelMedium,
                  ),
                  trailing: Switch(value: false, onChanged: (value) {}),
                ),
                ListTile(
                  leading: Image.asset(
                    "images/info_outline.png",
                    color: Get.theme.colorScheme.primary,
                  ),
                  title: Text(
                    'Account Information',
                    style: Get.textTheme.labelMedium,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    "images/lock_outline.png",
                    color: Get.theme.colorScheme.primary,
                  ),
                  title: Text(
                    'Password',
                    style: Get.textTheme.labelMedium,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    "images/shopping_bag_outlined.png",
                    color: Get.theme.colorScheme.primary,
                  ),
                  title: Text(
                    'Order',
                    style: Get.textTheme.labelMedium,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    "images/account_balance_wallet_outlined.png",
                    color: Get.theme.colorScheme.primary,
                  ),
                  title: Text(
                    'My Card',
                    style: Get.textTheme.labelMedium,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    "images/favorite_outline.png",
                    color: Get.theme.colorScheme.primary,
                  ),
                  title: Text(
                    'Wish List',
                    style: Get.textTheme.labelMedium,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    "images/settings_outlined.png",
                    color: Get.theme.colorScheme.primary,
                  ),
                  title: Text(
                    'Settings',
                    style: Get.textTheme.labelMedium,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          ListTile(
            leading: Image.asset(
              "images/logout_outlined.png",
              color: Get.theme.colorScheme.error,
            ),
            title: Text(
              'Logout',
              style: Get.textTheme.labelMedium?.copyWith(
                color: Get.theme.colorScheme.error,
              ),
            ),
            onTap: onTapLogout,
          ),
        ],
      ),
    );
  }
}

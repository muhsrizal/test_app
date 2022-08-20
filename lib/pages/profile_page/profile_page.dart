import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../constant/asset_path.dart';
import '../../route_path.dart';
import '../../services/local_storage.dart';
import '../../services/user_services.dart';
import '../../theme/palette.dart';
import '../../widgets/input/big_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const SizedBox(height: 32),
          const CircleAvatar(radius: 64),
          const SizedBox(height: 16),
          Text(
            UserServices.userModel.fullName,
            style: textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            UserServices.userModel.email,
            style: textTheme.bodyText2,
          ),
          const SizedBox(height: 32),
          const Divider(thickness: 1),
          const SizedBox(height: 16),
          _ItemButton(
            title: "Ubah data diri",
            assetPath: AssetPath.user,
            onTap: () => WRouter.pushNamed(RoutePath.ubahDataDiriPath),
          ),
          const SizedBox(height: 24),
          _ItemButton(
            title: "Ubah Password",
            assetPath: AssetPath.edit,
            onTap: () => WRouter.pushNamed(RoutePath.ubahPasswordPath),
          ),
          const SizedBox(height: 24),
          _ItemButton(
            title: "Kontak Kami",
            assetPath: AssetPath.telephone,
            onTap: () => WRouter.pushNamed(RoutePath.kontakKamiPath),
          ),
          const SizedBox(height: 16),
          const Divider(thickness: 1),
          const SizedBox(height: 16),
          BigButton(
            label: "Keluar",
            width: double.infinity,
            primary: palette.surface,
            onPrimary: palette.onSecondary,
            textStyle: textTheme.headline6,
            onPressed: () {
              LocalStorage.userStorage.remove("user");
              WRouter.pushNamedAndRemoveAll(RoutePath.loginPath);
            },
          )
        ],
      ),
    );
  }
}

class _ItemButton extends StatelessWidget {
  const _ItemButton({
    Key? key,
    this.onTap,
    required this.title,
    required this.assetPath,
  }) : super(key: key);

  final void Function()? onTap;
  final String title;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            assetPath,
            width: 32,
          ),
          const SizedBox(width: 14),
          Text(
            title,
            style: textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}

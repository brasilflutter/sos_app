// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/theme/app_assets.dart';
import '../../app/theme/extensions/sos_app_theme.dart';
import '../../utilities/extensions/build_context.dart';
import '../../utilities/extensions/responsive.dart';

class CommonBottomNavigationWidget extends StatelessWidget {
  final Function(String route) onItemTapped;
  const CommonBottomNavigationWidget({
    required this.onItemTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.getExtension<SosAppThemeExtension>();
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: BottomNavigationItem.values
                .map(
                  (item) => InkWell(
                    onTap: () => onItemTapped(item.routeName),
                    child: Ink(
                      width: 64.width,
                      height: 65.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            item.iconSvg,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            item.title,
                            style: theme.bottomNavigationTextStyle.copyWith(),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

enum BottomNavigationItem {
  home(title: 'Home', routeName: '/home', iconSvg: AppAssets.home),
  pet(
    title: 'Pet',
    routeName: '/pet',
    iconSvg: AppAssets.pet,
  ),
  localizar(title: 'Localizar', routeName: '/localizar', iconSvg: AppAssets.localizar),
  apoio(title: 'Apoio', routeName: '/apoio', iconSvg: AppAssets.apoio),
  perfil(title: 'Perfil', routeName: '/perfil', iconSvg: AppAssets.perfil),
  ;

  const BottomNavigationItem({
    required this.title,
    required this.routeName,
    required this.iconSvg,
  });
  final String title;
  final String routeName;
  final String iconSvg;
}

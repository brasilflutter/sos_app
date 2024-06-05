import 'package:flutter/material.dart';

import '../../../../../../app/theme/app_assets.dart';
import '../../../../../../app/theme/extensions/sos_app_theme.dart';
import '../../../../../../app/theme/font_manager.dart';
import '../../../../../../utilities/extensions/responsive.dart';
import '../../../controllers/locate_controller.dart';

class PetListWidget extends StatelessWidget {
  const PetListWidget({required this.theme, required this.controller, super.key});
  final SosAppThemeExtension theme;
  final LocateController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.locatePetList,
      builder: (contect, state, __) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pet localizado',
                    style: getSemiBoldStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    controller.locatePetList.value.length.toString(),
                    style: getSemiBoldStyle(
                      fontSize: 18,
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: controller.locatePetList.value.isNotEmpty,
              replacement: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100.height),
                  Image.asset(
                    scale: 1,
                    AppAssets.emptyPetList,
                  ),
                  SizedBox(height: 60.height),
                  Text(
                    'Nenhum pet encontrado :(',
                    style: getSemiBoldStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              child: SizedBox(
                height: 650.height,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.locatePetList.value.length,
                  padding: const EdgeInsets.only(top: 30),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20, bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nome do animal',
                                      style: getSemiBoldStyle(fontSize: 20, color: Colors.black),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Espécie',
                                              style: getRegularStyle(
                                                fontSize: 18,
                                                color: const Color(0xFF838383),
                                              ),
                                            ),
                                            Text(
                                              'Cor',
                                              style: getRegularStyle(
                                                fontSize: 18,
                                                color: const Color(0xFF838383),
                                              ),
                                            ),
                                            Text(
                                              'Sexo',
                                              style: getRegularStyle(
                                                fontSize: 18,
                                                color: const Color(0xFF838383),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 25, left: 30),
                                          child: Chip(
                                            elevation: 0,
                                            backgroundColor: theme.primaryColor,
                                            label: Text(
                                              'Desaparecido',
                                              style: getRegularStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(25),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  fit: BoxFit.cover,
                                  height: 90.height,
                                  width: 120.width,
                                  AppAssets.petExample,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';

import '../../domain/entities/pet_attribute_entity.dart';
import '../../domain/entities/pet_entity.dart';

class PetCadastroStore extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final petName = TextEditingController();

  final petImage = ValueNotifier<String?>(null);

  final selectedPetColors = ValueNotifier<List<PetAttributeEntity>>([]);
  final petBreed = ValueNotifier<PetAttributeEntity?>(null);
  final petSpecimen = ValueNotifier<PetAttributeEntity?>(null);
  final petGender = ValueNotifier<PetAttributeEntity?>(null);

  final shelter = TextEditingController();
  final foundLocation = TextEditingController();

  final collar = TextEditingController();
  final microchip = TextEditingController();
  final description = TextEditingController();

  final contactName = TextEditingController();
  final contactWhatsapp = TextEditingController();

  void addPetColor(PetAttributeEntity petColor) {
    selectedPetColors.value = [...selectedPetColors.value, petColor];
  }

  void removePetColor(PetAttributeEntity petColor) {
    selectedPetColors.value = selectedPetColors.value
        .where((color) => color.id != petColor.id)
        .toList();
  }

  void setPetAttributes(PetEntity pet) {
    petName.text = pet.name;
    petImage.value = pet.imageUrl;
    selectedPetColors.value = pet.petColors;
    petBreed.value = pet.petBreed;
    petSpecimen.value = pet.petSpecimen;
    petGender.value = pet.petGender;
    shelter.text = pet.shelter;
    foundLocation.text = pet.foundLocation;
    collar.text = pet.collar;
    microchip.text = pet.microchip;
    description.text = pet.description;
    contactName.text = pet.contactName;
    contactWhatsapp.text = pet.contactWhatsapp;
  }
}

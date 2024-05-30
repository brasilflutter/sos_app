import 'pet_attribute_entity.dart';

class PetEntity {
  const PetEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.petColors,
    required this.petBreed,
    required this.petSpecimen,
    required this.petGender,
    required this.shelter,
    required this.foundLocation,
    required this.collar,
    required this.microchip,
    required this.description,
    required this.contactName,
    required this.contactWhatsapp,
  });

  final int id;
  final String name;

  final String imageUrl;

  final List<PetAttributeEntity> petColors;
  final PetAttributeEntity? petBreed;
  final PetAttributeEntity? petSpecimen;
  final PetAttributeEntity? petGender;

  final String shelter;
  final String foundLocation;

  final String collar;
  final String microchip;
  final String description;

  final String contactName;
  final String contactWhatsapp;
}

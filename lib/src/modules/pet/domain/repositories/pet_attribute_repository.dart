import '../entities/pet_attribute_entity.dart';

abstract class PetAttributeRepository {
  Future<List<PetAttributeEntity>> getColors(String name);

  Future<List<PetAttributeEntity>> getBreeds(String name);

  Future<List<PetAttributeEntity>> getSpecimens(String name);

  Future<List<PetAttributeEntity>> getGenders(String name);
}

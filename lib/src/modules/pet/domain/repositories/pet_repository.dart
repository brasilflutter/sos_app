import '../entities/pet_entity.dart';

abstract class PetRepository {
  Future<PetEntity> getPet(int id);

  Future<List<PetEntity>> getAllPets({String? name, int page = 1});

  Future<PetEntity> updatePet(int id, PetEntity pet);

  Future<PetEntity> createPet(PetEntity pet);

  Future<void> deletePet(int id);
}

import '../../domain/entities/pet_attribute_entity.dart';
import '../../domain/entities/pet_entity.dart';
import '../../domain/repositories/pet_attribute_repository.dart';
import '../../domain/repositories/pet_repository.dart';
import '../store/pet_cadastro_store.dart';

class PetCadastroController {
  const PetCadastroController({
    required this.petAttributeRepository,
    required this.petRepository,
    required this.store,
  });

  final PetAttributeRepository petAttributeRepository;
  final PetRepository petRepository;
  final PetCadastroStore store;

  Future<List<PetAttributeEntity>> getColors(String name) async {
    return petAttributeRepository.getColors(name);
  }

  Future<List<PetAttributeEntity>> getBreeds(String name) async {
    return petAttributeRepository.getBreeds(name);
  }

  Future<List<PetAttributeEntity>> getSpecimens(String name) async {
    return petAttributeRepository.getSpecimens(name);
  }

  Future<List<PetAttributeEntity>> getGenders(String name) async {
    return petAttributeRepository.getGenders(name);
  }

  Future<PetEntity> getPet(int id) async {
    return petRepository.getPet(id);
  }

  Future<PetEntity> save(int id, PetEntity pet) async {
    return petRepository.updatePet(id, pet);
  }

  Future<PetEntity> create(PetEntity pet) async {
    return petRepository.createPet(pet);
  }

  void setPetAttributes(PetEntity pet){
    store.setPetAttributes(pet);
  }
}

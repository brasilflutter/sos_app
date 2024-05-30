import '../../domain/entities/pet_attribute_entity.dart';
import '../../domain/repositories/pet_attribute_repository.dart';

class PetAttributeRepositoryMock implements PetAttributeRepository {
  @override
  Future<List<PetAttributeEntity>> getBreeds(String name) async {
    return [
      const PetAttributeEntity(id: 1, name: 'Vira-lata', description: ''),
      const PetAttributeEntity(id: 2, name: 'Poodle', description: ''),
      const PetAttributeEntity(id: 3, name: 'Pitbull', description: ''),
      const PetAttributeEntity(id: 4, name: 'Pastor Alemão', description: ''),
      const PetAttributeEntity(
        id: 5,
        name: 'Golden Retriever',
        description: '',
      ),
    ];
  }

  @override
  Future<List<PetAttributeEntity>> getColors(String name) async {
    return [
      const PetAttributeEntity(id: 1, name: 'Preto', description: ''),
      const PetAttributeEntity(id: 2, name: 'Branco', description: ''),
      const PetAttributeEntity(id: 3, name: 'Caramelo', description: ''),
      const PetAttributeEntity(id: 4, name: 'Marrom', description: ''),
      const PetAttributeEntity(id: 5, name: 'Cinza', description: ''),
    ];
  }

  @override
  Future<List<PetAttributeEntity>> getGenders(String name) async {
    return [
      const PetAttributeEntity(id: 1, name: 'Macho', description: ''),
      const PetAttributeEntity(id: 2, name: 'Fêmea', description: ''),
    ];
  }

  @override
  Future<List<PetAttributeEntity>> getSpecimens(String name) async {
    return [
      const PetAttributeEntity(id: 1, name: 'Cachorro', description: ''),
      const PetAttributeEntity(id: 2, name: 'Gato', description: ''),
      const PetAttributeEntity(id: 3, name: 'Outro', description: ''),
    ];
  }
}

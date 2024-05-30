import '../../domain/entities/pet_attribute_entity.dart';
import '../../domain/entities/pet_entity.dart';
import '../../domain/repositories/pet_repository.dart';

final List<PetEntity> _mockPets = [
  const PetEntity(
    id: 1,
    name: 'Buddy',
    imageUrl: 'https://picsum.photos/800/800',
    petColors: [_colorBlack, _colorWhite],
    petBreed: _breedLabrador,
    petSpecimen: _specimenDog,
    petGender: _genderMale,
    shelter: 'Sunnyvale Pet Shelter',
    foundLocation: 'Park Street, Sunnyvale',
    collar: 'Red with bones',
    microchip: '1234567890',
    description: 'Very playful and loves to fetch.',
    contactName: 'Jane Doe',
    contactWhatsapp: '+123456789',
  ),
  const PetEntity(
    id: 2,
    name: 'Lucy',
    imageUrl: 'https://picsum.photos/800/800',
    petColors: [_colorWhite],
    petBreed: null,
    petSpecimen: _specimenDog,
    petGender: _genderFemale,
    shelter: 'City Animal Rescue',
    foundLocation: 'Main Avenue, City Center',
    collar: 'Pink with glitter',
    microchip: '0987654321',
    description: 'Calm and affectionate, loves cuddles.',
    contactName: 'John Smith',
    contactWhatsapp: '+987654321',
  ),
  const PetEntity(
    id: 3,
    name: 'Max',
    imageUrl: 'https://example.com/images/max.jpg',
    petColors: [_colorBlack],
    petBreed: _breedLabrador,
    petSpecimen: _specimenDog,
    petGender: _genderMale,
    shelter: 'Northside Animal Shelter',
    foundLocation: '5th Street, Northside',
    collar: 'Blue nylon',
    microchip: '2345678901',
    description: 'Loyal and protective, great with kids.',
    contactName: 'Alice Johnson',
    contactWhatsapp: '+234567890',
  ),
  const PetEntity(
    id: 4,
    name: 'Molly',
    imageUrl: 'https://picsum.photos/800/800',
    petColors: [_colorWhite, _colorBlack],
    petBreed: null,
    petSpecimen: _specimenDog,
    petGender: _genderFemale,
    shelter: 'Riverside Animal Care',
    foundLocation: 'Riverside Drive',
    collar: 'Green with polka dots',
    microchip: '3456789012',
    description: 'Very energetic and loves water.',
    contactName: 'Bob White',
    contactWhatsapp: '+345678901',
  ),
  const PetEntity(
    id: 5,
    name: 'Charlie',
    imageUrl: 'https://picsum.photos/800/800',
    petColors: [_colorBlack],
    petBreed: _breedLabrador,
    petSpecimen: _specimenDog,
    petGender: _genderMale,
    shelter: 'East End Shelter',
    foundLocation: 'East Park Blvd',
    collar: 'Orange reflective',
    microchip: '4567890123',
    description: 'Curious and alert, good for active families.',
    contactName: 'Clara Green',
    contactWhatsapp: '+456789012',
  ),
  const PetEntity(
    id: 6,
    name: 'Shadow',
    imageUrl: 'https://picsum.photos/800/800',
    petColors: [_colorBlack],
    petBreed: null,
    petSpecimen: _specimenDog,
    petGender: null,
    shelter: 'Downtown Pet Haven',
    foundLocation: 'Downtown Market',
    collar: '',
    microchip: '',
    description: 'Shy but loving once he trusts you.',
    contactName: 'Emily Rose',
    contactWhatsapp: '+5678901234',
  ),
  const PetEntity(
    id: 7,
    name: 'Bella',
    imageUrl: 'https://picsum.photos/800/800',
    petColors: [],
    petBreed: _breedLabrador,
    petSpecimen: _specimenDog,
    petGender: _genderFemale,
    shelter: 'Suburban Animal Clinic',
    foundLocation: '',
    collar: 'Pink leather',
    microchip: '5678901234',
    description: '',
    contactName: '',
    contactWhatsapp: '',
  ),
  const PetEntity(
    id: 8,
    name: 'Duke',
    imageUrl: 'https://picsum.photos/800/800',
    petColors: [_colorWhite],
    petBreed: null,
    petSpecimen: _specimenDog,
    petGender: _genderMale,
    shelter: 'City Side Animal Shelter',
    foundLocation: 'Near City Hall',
    collar: 'Black studded',
    microchip: '6789012345',
    description: 'Dominant and needs an experienced owner.',
    contactName: 'Martin King',
    contactWhatsapp: '+6789012345',
  ),
];

class PetRepositoryMock extends PetRepository {
  @override
  Future<PetEntity> createPet(PetEntity pet) async {
    _mockPets.add(pet);

    return pet;
  }

  @override
  Future<void> deletePet(int id) async {
    _mockPets.removeWhere((pet) => pet.id == id);
  }

  @override
  Future<List<PetEntity>> getAllPets({String? name, int page = 1}) async {
    return _mockPets.where((pet) {
      if (name != null) {
        return pet.name.toLowerCase().contains(name.toLowerCase());
      }

      return true;
    }).toList();
  }

  @override
  Future<PetEntity> getPet(int id) async {
    return _mockPets.firstWhere((pet) => pet.id == id);
  }

  @override
  Future<PetEntity> updatePet(int id, PetEntity pet) async {
    final index = _mockPets.indexWhere((pet) => pet.id == id);
    _mockPets[index] = pet;

    return pet;
  }
}

const PetAttributeEntity _colorBlack =
    PetAttributeEntity(id: 1, name: 'Black', description: 'Solid black color');
const PetAttributeEntity _colorWhite =
    PetAttributeEntity(id: 2, name: 'White', description: 'Pure white color');
const PetAttributeEntity _breedLabrador = PetAttributeEntity(
  id: 1,
  name: 'Labrador',
  description: 'Friendly and energetic',
);
const PetAttributeEntity _specimenDog =
    PetAttributeEntity(id: 1, name: 'Dog', description: 'Domestic canine');
const PetAttributeEntity _genderMale =
    PetAttributeEntity(id: 1, name: 'Male', description: 'Male gender');
const PetAttributeEntity _genderFemale = PetAttributeEntity(
  id: 2,
  name: 'Female',
  description: '',
);

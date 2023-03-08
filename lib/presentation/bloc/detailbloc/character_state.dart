part of 'character_cubit.dart';

abstract class CharacterState extends Equatable {}

class CharacterInitial extends CharacterState {
  @override
  List<Object?> get props => [];
}

class CharacterLoading extends CharacterState {
  @override
  List<Object?> get props => [];
}

class CharacterSuccess extends CharacterState {
  final List<Character> characters;

  CharacterSuccess(this.characters);
  @override
  List<Object?> get props => [characters];
}

class CharacterSelected extends CharacterState {
  final Character character;

  CharacterSelected(this.character);

  @override
  List<Object?> get props => [character];
}

class CharacterError extends CharacterState {
  final String message;

  CharacterError(this.message);
  @override
  List<Object?> get props => [message];
}

import 'code.dart';
import 'types.dart';

abstract class TypeDeclaration implements TypeReference, DeclarationType {
  TypeDeclaration? get superclass;

  Iterable<TypeDeclaration> get superinterfaces;

  Iterable<TypeDeclaration> get typeArguments;

  Iterable<TypeParameterDeclaration> get typeParameters;

  bool isSubtype(TypeDeclaration other);
}

abstract class TargetTypeDeclaration extends TypeDeclaration {
  Iterable<MethodDeclaration> get constructors;

  Iterable<FieldDeclaration> get fields;

  Iterable<MethodDeclaration> get methods;
}

abstract class TargetClassDeclaration implements TargetTypeDeclaration {
  Iterable<TargetMethodDeclaration> get constructors;

  Iterable<TargetFieldDeclaration> get fields;

  Iterable<TargetMethodDeclaration> get methods;

  TargetTypeDeclaration? get superclass;

  void addToClass(Code declaration);

  void addToLibrary(Code declaration);
}

abstract class MethodDeclaration implements MethodType {
  TypeDeclaration get returnType;

  Iterable<ParameterDeclaration> get positionalParameters;

  Map<String, ParameterDeclaration> get namedParameters;

  Iterable<TypeParameterDeclaration> get typeParameters;
}

abstract class TargetMethodDeclaration implements MethodDeclaration {
  void addToClass(Code declaration);
}

abstract class FieldDeclaration implements FieldType {
  String get name;

  TypeDeclaration get type;
}

abstract class TargetFieldDeclaration implements FieldDeclaration {
  void addToClass(Code declaration);
}

abstract class ParameterDeclaration implements ParameterType {
  TypeDeclaration get type;
}

abstract class TypeParameterDeclaration implements TypeParameterType {
  TypeDeclaration? get bounds;
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:expense_tracker_app/features/auth/domain/entities/user.dart';
import 'package:expense_tracker_app/features/common/domain/entities/api_error.dart';
import 'package:expense_tracker_app/features/auth/domain/usecases/auth_register_use_case.dart';

import '../mocks/mock_repository.mocks.dart';


void main() {
  late AuthResgisterUseCase useCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = AuthResgisterUseCase(mockAuthRepository);
  });

  final testUser = User(
    email: 'test@example.com',
    fullName: 'Test User',
    password: 'password123',
  );

  test('should return true when registration is successful', () async {
    // Arrange
    when(mockAuthRepository.register(testUser))
        .thenAnswer((_) async => const Right(true));

    // Act
    final result = await useCase.call(testUser);

    // Assert
    expect(result, const Right(true));
    verify(mockAuthRepository.register(testUser)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return ApiError when registration fails', () async {
    // Arrange
    final error = ApiError(message: 'Registration failed');
    when(mockAuthRepository.register(testUser))
        .thenAnswer((_) async => Left(error));

    // Act
    final result = await useCase.call(testUser);

    // Assert
    expect(result, Left(error));
    verify(mockAuthRepository.register(testUser)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}

import 'package:dartz/dartz.dart';
import 'package:expense_tracker_app/features/auth/domain/entities/user.dart';
import 'package:expense_tracker_app/features/auth/domain/usecases/auth_login_use_case.dart';
import 'package:expense_tracker_app/features/common/domain/entities/api_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../mocks/mock_repository.mocks.dart'; // ✅ Make sure this file is generated!

void main() {
  late AuthLoginUseCase useCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = AuthLoginUseCase(mockAuthRepository);
  });

  final testUser = User(
    email: 'test@example.com',
    fullName: 'Test User',
    password: 'password123',
  );

  test('should return true when login is successful', () async {
    // Arrange
    when(mockAuthRepository.login(testUser))
        .thenAnswer((_) async => const Right(true));

    // Act
    final result = await useCase.call(testUser);

    // Assert
    expect(result, const Right(true));
    verify(mockAuthRepository.login(testUser)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return ApiError when login fails', () async {
    // Arrange
    final error = ApiError(message: 'Invalid credentials');
    when(mockAuthRepository.login(testUser))
        .thenAnswer((_) async => Left(error));

    // Act
    final result = await useCase.call(testUser);

    // Assert
    expect(result, Left(error));
    verify(mockAuthRepository.login(testUser)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}

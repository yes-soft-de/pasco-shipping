import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_auth/repository/auth/auth_repository.dart';
import 'package:pasco_shipping/module_auth/request/login_request/login_request.dart';
import 'package:pasco_shipping/module_auth/request/register_request/register_request.dart';
import 'package:pasco_shipping/module_auth/response/login_response/login_response.dart';
@injectable
class AuthManager {
  final AuthRepository _authRepository;
  AuthManager(this._authRepository);

  Future<bool> register(RegisterRequest registerRequest) => _authRepository.createUser(registerRequest);

  Future<LoginResponse?> login(LoginRequest loginRequest) => _authRepository.getToken(loginRequest);
}
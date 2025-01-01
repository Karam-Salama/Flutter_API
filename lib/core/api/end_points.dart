class EndPoints {
  static const baseUrl = 'https://food-api-omega.vercel.app/api/v1';
  static const signIn = '$baseUrl/user/signin';
  static const signUp = '$baseUrl/user/signup';
  static const checkEmail = '$baseUrl/user/check-email';
  static const updateUser = '$baseUrl/user/update';
  static const deleteUser = '$baseUrl/user/delete';
  static const getUser = '$baseUrl/user/get-user';
  static const logout = '$baseUrl/user/logout';
}

class ApiKey {
  static const status = 'status';
  static const errorMessage = 'ErrorMessage';
  static const email = 'email';
  static const password = 'password';
  static const successMessage = 'message';
  static const token = 'token';
  static const id = 'id';

  static const name = 'name';
  static const phone = 'phone';
  static const confirmPassword = 'confirmPassword';
  static const location = 'location';
  static const image = 'profilePic';
}

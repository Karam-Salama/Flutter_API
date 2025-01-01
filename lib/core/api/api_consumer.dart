abstract class ApiConsumer {
  // * ApiConsumer is an abstract class that contains all the methods that will be used to consume the api
  // ! ===================================== Abstract Get Methods =====================================
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  // ! ===================================== Abstract Post Methods =====================================
  Future<dynamic> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  // ! ===================================== Abstract Patch Methods =====================================
  Future<dynamic> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  // ! ===================================== Abstract Delete Methods =====================================
  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
}

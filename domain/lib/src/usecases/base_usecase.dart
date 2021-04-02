abstract class BaseUseCase<TResponse, TParam> {
  Future<TResponse> perform({TParam param});
}

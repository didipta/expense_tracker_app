abstract class UseCase<OutPut,Params>{
  Future<OutPut> call(Params params);

}
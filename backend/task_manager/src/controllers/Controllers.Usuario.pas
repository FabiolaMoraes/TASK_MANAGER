unit Controllers.Usuario;

interface

procedure Registry;

implementation

uses Horse, Services.Usuario, System.JSON, DataSet.Serialize, Data.DB, System.Classes;

procedure ListarUsuarios(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LJSONObject: TJSONObject;
begin
  var LService := TServiceUsuario.Create;
  try
    LJSONObject := TJSONObject.Create;
    LJSONObject.AddPair('data', LService.ListAll(Req.Query.Dictionary).ToJSONArray());
    LJSONObject.AddPair('records', TJSONNumber.Create(LService.GetRecordCount));
    Res.Send(LJSONObject);
  finally
    LService.Free;
  end;
end;

procedure ObterUsuario(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  var LService := TServiceUsuario.Create;
  try
    if LService.GetById(Req.Params['id']).IsEmpty then
      raise EHorseException.New.Error('Usuário não cadastrado').Status(THTTPStatus.NotFound);
    Res.Send(LService.qryCadastro.ToJSONObject);
  finally
    LService.Free;
  end;
end;

procedure CadastrarUsuario(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  var LService := TServiceUsuario.Create;
  try
    if LService.Append(Req.Body<TJSONObject>) then
      Res.Send(LService.qryCadastro.ToJSONObject()).Status(THTTPStatus.Created);
  finally
    LService.Free;
  end;
end;

procedure AlterarUsuario(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  var LService := TServiceUsuario.Create;
  try
    if LService.GetById(Req.Params['id']).IsEmpty then
      raise EHorseException.New.Error('Usuário não cadastrado').Status(THTTPStatus.NotFound);
    if LService.Update(Req.Body<TJSONObject>) then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;

procedure DeletarUsuario(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  var LService := TServiceUsuario.Create;
  try
    if LService.GetById(Req.Params['id']).IsEmpty then
      raise EHorseException.New.Error('Usuário não cadastrado').Status(THTTPStatus.NotFound);
    if LService.Delete then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/usuarios', ListarUsuarios);
  THorse.Get('/usuarios/:id', ObterUsuario);
  THorse.Post('/usuarios', CadastrarUsuario);
  THorse.Put('/usuarios/:id', AlterarUsuario);
  THorse.Delete('/usuarios/:id', DeletarUsuario);
end;

end.

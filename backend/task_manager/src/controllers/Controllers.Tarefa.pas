unit Controllers.Tarefa;

interface

procedure Registry;

implementation

uses Horse, Services.Tarefa, System.JSON, DataSet.Serialize, Data.DB;

procedure ListarTarefas(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LJSONObject: TJSONObject;
begin
  var LService := TServiceTarefa.Create;
  try
    LJSONObject := TJSONObject.Create;
    LJSONObject.AddPair('data', LService.ListAll(Req.Query.Dictionary).ToJSONArray());
    LJSONObject.AddPair('records', TJSONNumber.Create(LService.GetRecordCount));
    Res.Send(LJSONObject);
  finally
    LService.Free;
  end;
end;

procedure ObterTarefa(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  var LService := TServiceTarefa.Create;
  try
    if LService.GetById(Req.Params['id']).IsEmpty then
      raise EHorseException.New.Error('Tarefa não cadastrada').Status(THTTPStatus.NotFound);
    Res.Send(LService.qryCadastro.ToJSONObject());
  finally
    LService.Free;
  end;
end;

procedure ObterEstatisticas(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  var LService := TServiceTarefa.Create;
  try
    Res.Send(LService.GetEstatisticas);
  finally
    LService.Free;
  end;
end;

procedure CadastrarTarefa(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  var LService := TServiceTarefa.Create;
  try
    if LService.Append(Req.Body<TJSONObject>) then
      Res.Send(LService.qryCadastro.ToJSONObject()).Status(THTTPStatus.Created);
  finally
    LService.Free;
  end;
end;

procedure AlterarTarefa(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  var LService := TServiceTarefa.Create;
  try
    if LService.GetById(Req.Params['id']).IsEmpty then
      raise EHorseException.New.Error('Tarefa não cadastrada').Status(THTTPStatus.NotFound);
    if LService.Update(Req.Body<TJSONObject>) then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;

procedure DeletarTarefa(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  var LService := TServiceTarefa.Create;
  try
    if LService.GetById(Req.Params['id']).IsEmpty then
        raise EHorseException.New.Error('Tarefa não cadastrada').Status(THTTPStatus.NotFound);
    if LService.Delete then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/tarefas', ListarTarefas);
  THorse.Get('/tarefas/:id', ObterTarefa);
  THorse.Get('/tarefas/estatisticas', ObterEstatisticas);
  THorse.Post('/tarefas', CadastrarTarefa);
  THorse.Put('/tarefas/:id', AlterarTarefa);
  THorse.Delete('/tarefas/:id', DeletarTarefa);
end;

end.

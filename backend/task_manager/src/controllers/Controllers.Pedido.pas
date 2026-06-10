unit Controllers.Pedido;

interface

procedure Registry;

implementation

uses Horse, System.JSON, Services.Pedido, DataSet.Serialize, Data.DB;

procedure ListarPedidos(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LRetorno: TJSONObject;
  LService: TServicePedido;
begin
   LService := TServicePedido.Create;
   try
     LRetorno := TJSONObject.Create;
     LRetorno.AddPair('data', LService.ListAll(Req.Query.Dictionary).ToJSONArray());
     LRetorno.AddPair('records', TJSONNumber.Create(LService.GetRecordCount));
     Res.Send(LRetorno);
   finally
     LService.Free;
   end;
end;

procedure ObterPedido(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIdPedido: string;
  LService: TServicePedido;
begin
  LService := TServicePedido.Create;
  try
    LIdPedido := Req.Params['id'];
    if LService.GetById(LIdPedido).IsEmpty then
      raise EHorseException.New.Error('Pedido não Cadastrado').Status(THTTPStatus.NotFound);
      Res.Send(LService.qryCadastro.ToJSONObject());
  finally
    LService.Free;
  end;
end;

procedure CadastrarPedido(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LPedido: TJSONObject;
  LService: TServicePedido;
begin
  LService := TServicePedido.Create;
  try
    LPedido := Req.Body<TJSONObject>;
    if LService.Append(LPedido) then
      Res.Send(LService.qryCadastro.ToJSONObject()).Status(THTTPStatus.Created);
  finally
    LService.Free;
  end;
end;

procedure AlterarPedido(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIdPedido: string;
  LService: TServicePedido;
  LPedido: TJSONObject;
begin
  LService := TServicePedido.Create;
  try
  LIdPedido := Req.Params.Items['id'];
  if LService.GetById(LIdPedido).IsEmpty then     // se o cliente não existir é retornado uma mensagem
        raise EHorseException.New.Error('Pedido não Cadastrado').Status(THTTPStatus.NotFound);
  LPedido := Req.Body<TJSONObject>;
  if LService.Update(LPedido) then
    Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;

procedure DeletarPedido(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIdPedido: string;
  LService: TServicePedido;
begin
  LService := TServicePedido.Create;
  try
    LIdPedido := Req.Params.Items['id'];
    if LService.GetById(LIdPedido).IsEmpty then     // se o cliente não existir é retornado uma mensagem
        raise EHorseException.New.Error('Cliente não cadastrado').Status(THTTPStatus.NotFound);
    if LService.Delete then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;
procedure Registry;

begin
  THorse.Get('/pedidos', ListarPedidos);
  THorse.Get('/pedidos/:id', ObterPedido);
  THorse.Post('/pedidos', CadastrarPedido);
  THorse.Put('/pedidos/:id', AlterarPedido);
  THorse.Delete('/pedidos/:id', DeletarPedido);
end;

end.

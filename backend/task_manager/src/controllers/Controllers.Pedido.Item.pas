unit Controllers.Pedido.Item;

interface

procedure Registry;

implementation

uses Horse, Services.Pedido.Item, System.JSON, DataSet.Serialize, Data.DB;

procedure ListarItens(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LRetorno: TJSONObject;
  LService: TServicePedidoItem;
  LIdPedido: string;
begin
  LService := TServicePedidoItem.Create;
  try
    LIdPedido := Req.Params.Items['id_pedido'];
    LRetorno := TJSONObject.Create;
    LRetorno.AddPair('data', LService.ListAllByPedido(Req.Query.Dictionary, LIdPedido).ToJSONArray());
    LRetorno.AddPair('records', TJSONNumber.Create(LService.GetRecordCount));
    Res.Send(LRetorno);
  finally
    LService.Free;
  end;
end;

procedure ObterItem(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServicePedidoItem;
  LIdPedido, LIdItem: string;
begin
  LService := TServicePedidoItem.Create;
  try
    LIdPedido := Req.Params.Items['id_pedido'];
    LIdItem := Req.Params.Items['id_item'];
    if LService.GetById(LIdPedido).IsEmpty then
        raise EHorseException.New.Error('Item não cadastrado').Status(THTTPStatus.NotFound);
    Res.Send(LService.qryCadastro.ToJSONObject());
  finally
    LService.Free;
  end;
end;

procedure CadastrarItem(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LItem: TJSONObject;
  LService: TServicePedidoItem;
  LIdPedido: string;
begin
  LService := TServicePedidoItem.Create;
  try
    LItem := Req.Body<TJSONObject>;
    LIdPedido := Req.Params.Items['id_pedido'];
    LItem.RemovePair('idPedido').Free;
    LItem.AddPair('idPedido', TJSONNumber.Create(LIdPedido));
    if LService.Append(LItem) then
      Res.Send(LService.qryCadastro.ToJSONObject()).Status(THTTPStatus.Created);
  finally
    LService.Free;
  end;
end;

procedure AlterarItem(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIdPedido, LIditem: string;
  LService: TServicePedidoItem;
  LItem: TJSONObject;
begin
  LService := TServicePedidoItem.Create;
  try
    LIditem := Req.Params.Items['id_item'];
    LIdPedido := Req.Params.Items['id_pedido'];
    if LService.GetById(LIdPedido).IsEmpty then
      raise EHorseException.New.Error('Item não cadastrado').Status(THTTPStatus.NotFound);
    LItem := Req.Body<TJSONObject>;
    LItem.RemovePair('idPedido').Free;
    if LService.Update(LItem) then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;

procedure DeletarItem(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIdPedido, LIdItem: string;
  LService: TServicePedidoItem;
begin
  LService := TServicePedidoItem.Create;
  try
    LIdItem := Req.Params.Items['id_item'];
    LIdPedido := Req.Params.Items['id_pedido'];
    if LService.GetByPedido(LIdPedido, LIdItem).IsEmpty then
      raise EHorseException.New.Error('Item não cadastrado').Status(THTTPStatus.NotFound);
    if LService.Delete then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/pedidos/:id_pedido/itens', ListarItens);
  THorse.Get('/pedidos/:id_pedido/itens/:id_item', ObterItem);
  THorse.Post('/pedidos/:id_pedido/itens', CadastrarItem);
  THorse.Put('/pedidos/:id_pedido/itens/:id_item', AlterarItem);
  THorse.Delete('/pedidos/:id_pedido/itens/:id_item', DeletarItem);
end;

end.

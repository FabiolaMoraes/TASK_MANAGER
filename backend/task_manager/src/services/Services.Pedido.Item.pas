unit Services.Pedido.Item;

interface

uses
  System.SysUtils, System.Classes, Providers.Cadastro, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.JSON,
  System.Generics.Collections;

type
  TServicePedidoItem = class(TProvidersCadastro)
    qryPesquisaID: TIntegerField;
    qryPesquisaID_PRODUTO: TIntegerField;
    qryPesquisaVALOR: TIntegerField;
    qryPesquisaQUANTIDADE: TIntegerField;
    qryPesquisaNOME_PRODUTO: TStringField;
    qryCadastroID: TIntegerField;
    qryCadastroID_PEDIDO: TIntegerField;
    qryCadastroID_PRODUTO: TIntegerField;
    qryCadastroVALOR: TIntegerField;
    qryCadastroQUANTIDADE: TIntegerField;
    qryCadastroNOME_PRODUTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function Append(const AJson: TJSONObject): Boolean; override;
    function ListAllByPedido(const AParams: TDictionary<string, string>; const AIdPedido: string) : TFDQuery;
    function GetByPedido(const AIdPedido, AIdItem: string): TFDQuery;
  end;

var
  ServicePedidoItem: TServicePedidoItem;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TServicePedidoItem }

function TServicePedidoItem.Append(const AJson: TJSONObject): Boolean;
begin
     Result := inherited Append(AJson);
    qryCadastroid_pedido.Visible := False;
end;

function TServicePedidoItem.GetByPedido(const AIdPedido,
  AIdItem: string): TFDQuery;
begin
  qryCadastroid_pedido.Visible := False;
  qryCadastro.SQL.Add('where i.id = :id');
  qryCadastro.SQL.Add('and i.id_pedido = :id_pedido');
  qryCadastro.ParamByName('id').AsLargeInt := AIdItem.ToInt64;
  qryCadastro.ParamByName('id_pedido').AsLargeInt := AIdItem.ToInt64;
  qryCadastro.Open();
  Result := qryCadastro;
end;

function TServicePedidoItem.ListAllByPedido(const AParams: TDictionary<string, string>; const AIdPedido: string): TFDQuery;
begin
  qryPesquisa.ParamByName('id_pedido').AsLargeInt := AIdPedido.ToInt64;
  qryRecordCount.ParamByName('id_pedido').AsLargeInt := AIdPedido.ToInt64;
  Result := inherited ListAll(AParams);
end;

end.

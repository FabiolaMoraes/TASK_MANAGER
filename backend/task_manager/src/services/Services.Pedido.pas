unit Services.Pedido;

interface

uses
  System.SysUtils, System.Classes, Providers.Cadastro, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Generics.Collections;

type
  TServicePedido = class(TProvidersCadastro)
    qryPesquisaID: TIntegerField;
    qryPesquisaID_CLIENTE: TIntegerField;
    qryPesquisaDATA: TSQLTimeStampField;
    qryPesquisaNOME_CLIENTE: TStringField;
    qryPesquisaID_USUARIO: TIntegerField;
    qryCadastroID: TIntegerField;
    qryCadastroID_CLIENTE: TIntegerField;
    qryCadastroDATA: TSQLTimeStampField;
    qryCadastroNOME_CLIENTE: TStringField;
    qryCadastroID_USUARIO: TIntegerField;
    qryPesquisatotal: TFMTBCDField;
    procedure qryCadastroAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
        function GetById(const AId: string): TFDQuery; override;
        function ListAll(const AParams: TDictionary<string, string>): TFDQuery; override;
  end;

var
  ServicePedido: TServicePedido;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TServicePedido }

function TServicePedido.GetById(const AId: string): TFDQuery;
begin
  qryCadastro.SQL.Add('where p.id = :id');
  qryCadastro.ParamByName('id').AsLargeInt := AId.ToInt64;
  qryCadastro.Open();
  Result := qryCadastro;
end;

function TServicePedido.ListAll(const AParams: TDictionary<string, string>): TFDQuery;
begin
  if AParams.ContainsKey('id') then
  begin
    qryPesquisa.SQL.Add('and p.id = :id');
    qryPesquisa.ParamByName('id').AsLargeInt := AParams.Items['id'].ToInt64;
    qryRecordCount.SQL.Add('and p.id = :id');
    qryRecordCount.ParamByName('id').AsLargeInt := AParams.Items['id'].ToInt64;
  end;
  if AParams.ContainsKey('idCliente') then
  begin
    qryPesquisa.SQL.Add('and id_cliente = :id');
    qryPesquisa.ParamByName('id').AsLargeInt := AParams.Items['idCliente'].ToInt64;
    qryRecordCount.SQL.Add('and id_cliente = :id');
    qryRecordCount.ParamByName('id').AsLargeInt := AParams.Items['idCliente'].ToInt64;
  end;
  if AParams.ContainsKey('idUsuario') then
  begin
    qryPesquisa.SQL.Add('and id_usuario = :id');
    qryPesquisa.ParamByName('id').AsLargeInt := AParams.Items['idUsuario'].ToInt64;
    qryRecordCount.SQL.Add('and id_usuario = :id');
    qryRecordCount.ParamByName('id').AsLargeInt := AParams.Items['idUsuario'].ToInt64;
  end;
 if AParams.ContainsKey('nomeCliente') then
  begin
    qryPesquisa.SQL.Add('and lower(c.nome) like :nome');
    qryPesquisa.ParamByName('nome').AsString := '%' + AParams.Items['nomeCliente'].ToLower + '%';
    qryRecordCount.SQL.Add('and lower(c.nome) like :nome');
    qryRecordCount.ParamByName('nome').AsString := '%' + AParams.Items['nomeCliente'].ToLower + '%';
  end;
  qryPesquisa.SQL.Add('order by p.id');
  Result := inherited ListAll(AParams);
end;

procedure TServicePedido.qryCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryCadastrodata.AsDateTime := Now;
end;

end.

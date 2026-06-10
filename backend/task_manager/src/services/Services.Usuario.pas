unit Services.Usuario;

interface

uses System.SysUtils, System.Classes, Providers.Cadastro, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.JSON,
  System.Generics.Collections, FireDAC.VCLUI.Wait, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TServiceUsuario = class(TProvidersCadastro)
    qryPesquisaid: TIntegerField;
    qryPesquisanome: TStringField;
    qryPesquisalogin: TStringField;
    qryPesquisastatus: TIntegerField;
    qryPesquisatelefone: TStringField;
    qryCadastroid: TFDAutoIncField;
    qryCadastronome: TStringField;
    qryCadastrologin: TStringField;
    qryCadastrosenha: TStringField;
    qryCadastrostatus: TIntegerField;
    qryCadastrotelefone: TStringField;
    procedure qryCadastroBeforePost(DataSet: TDataSet);
  public
    function GetById(const AId: string): TFDQuery; override;
    function Append(const AJSONObject: TJSONObject): Boolean; override;
    function Update(const AJSONObject: TJSONObject): Boolean; override;
    function ListAll(const AParams: TDictionary<string, string>): TFDQuery; override;
  end;

implementation

{$R *.dfm}

uses BCrypt;

function TServiceUsuario.Append(const AJSONObject: TJSONObject): Boolean;
begin
  Result := inherited Append(AJSONObject);
  qryCadastrosenha.Visible := False;
end;

function TServiceUsuario.GetById(const AId: string): TFDQuery;
begin
  Result := inherited GetByID(AId);
  qryCadastrosenha.Visible := False;
end;

function TServiceUsuario.ListAll(const AParams: TDictionary<string, string>): TFDQuery;
begin
  if AParams.ContainsKey('id') then
  begin
    qryPesquisa.SQL.Add('and id = :id');
    qryPesquisa.ParamByName('id').AsLargeInt := AParams.Items['id'].ToInt64;
    qryRecordCount.SQL.Add('and id = :id');
    qryRecordCount.ParamByName('id').AsLargeInt := qryPesquisa.ParamByName('id').AsLargeInt;
  end;
  if AParams.ContainsKey('nome') then
  begin
    qryPesquisa.SQL.Add('and lower(nome) like :nome');
    qryPesquisa.ParamByName('nome').AsString := '%' + AParams.Items['nome'].ToLower + '%';
    qryRecordCount.SQL.Add('and lower(nome) like :nome');
    qryRecordCount.ParamByName('nome').AsString := qryPesquisa.ParamByName('nome').AsString;
  end;
  if AParams.ContainsKey('login') then
  begin
    qryPesquisa.SQL.Add('and login = :login');
    qryPesquisa.ParamByName('login').AsString := AParams.Items['login'];
    qryRecordCount.SQL.Add('and login = :login');
    qryRecordCount.ParamByName('login').AsString := qryPesquisa.ParamByName('login').AsString;
  end;
  qryPesquisa.SQL.Add('order by id');
  Result := inherited ListAll(AParams);
end;

procedure TServiceUsuario.qryCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (qryCadastrosenha.OldValue <> qryCadastrosenha.NewValue) and (not qryCadastrosenha.AsString.Trim.IsEmpty) then
    qryCadastrosenha.AsString := TBCrypt.GenerateHash(qryCadastrosenha.AsString);
end;

function TServiceUsuario.Update(const AJSONObject: TJSONObject): Boolean;
begin
  qryCadastrosenha.Visible := True;
  Result := inherited Update(AJSONObject);
end;

end.

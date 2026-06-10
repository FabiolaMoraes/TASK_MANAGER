unit Providers.Cadastro;

interface

uses System.SysUtils, System.Classes, Providers.Connection, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, System.JSON, System.Generics.Collections,
  FireDAC.VCLUI.Wait, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat;

type
  TProvidersCadastro = class(TProvidersConnection)
    qryPesquisa: TFDQuery;
    qryRecordCount: TFDQuery;
    qryCadastro: TFDQuery;
    qryRecordCountCOUNT: TLargeintField;
  public
    constructor Create; reintroduce;
    function Append(const AJSONObject: TJSONObject): Boolean; virtual;
    function Update(const AJSONObject: TJSONObject): Boolean; virtual;
    function Delete: Boolean; virtual;
    function ListAll(const AParams: TDictionary<string, string>): TFDQuery; virtual;
    function GetById(const AId: string): TFDQuery; virtual;
    function GetRecordCount: Int64; virtual;
  end;

implementation

uses DataSet.Serialize;

{$R *.dfm}

function TProvidersCadastro.Append(const AJSONObject: TJSONObject): Boolean;
begin
  qryCadastro.SQL.Add('where 1 <> 1');
  qryCadastro.Open();
  qryCadastro.LoadFromJSON(AJSONObject, False);
  Result := qryCadastro.ApplyUpdates(0) = 0;
end;

constructor TProvidersCadastro.Create;
begin
  inherited Create(nil);
end;

function TProvidersCadastro.Delete: Boolean;
begin
  qryCadastro.Delete;
  Result := qryCadastro.ApplyUpdates(0) = 0;
end;

function TProvidersCadastro.GetById(const AId: string): TFDQuery;
begin
  qryCadastro.SQL.Add('where id = :id');
  qryCadastro.ParamByName('id').AsLargeInt := AId.ToInt64;
  qryCadastro.Open();
  Result := qryCadastro;
end;

function TProvidersCadastro.GetRecordCount: Int64;
begin
  qryRecordCount.Open();
  Result := qryRecordCountCOUNT.AsLargeInt;
end;

function TProvidersCadastro.ListAll(const AParams: TDictionary<string, string>): TFDQuery;
begin
  if AParams.ContainsKey('limit') then
  begin
    qryPesquisa.FetchOptions.RecsMax := StrToIntDef(AParams.Items['limit'], 50);
    qryPesquisa.FetchOptions.RowsetSize := StrToIntDef(AParams.Items['limit'], 50);
  end;
  if AParams.ContainsKey('offset') then
  qryPesquisa.FetchOptions.RecsSkip := StrToIntDef(AParams.Items['offset'], 0);

  qryPesquisa.Open();
  Result := qryPesquisa;
end;

function TProvidersCadastro.Update(const AJSONObject: TJSONObject): Boolean;
begin
  qryCadastro.MergeFromJSONObject(AJSONObject, False);
  Result := qryCadastro.ApplyUpdates(0) = 0;
end;

end.

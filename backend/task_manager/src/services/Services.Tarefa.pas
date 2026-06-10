unit Services.Tarefa;

interface

uses System.SysUtils, System.Classes, Providers.Cadastro, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Generics.Collections,
  FireDAC.VCLUI.Wait, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, System.JSON,
  DataSet.Serialize;

type
  TServiceTarefa = class(TProvidersCadastro)
    qryEstatisticas: TFDQuery;
    qryEstatisticastotal_tarefas: TLargeintField;
    qryEstatisticasmedia_prioridade: TFloatField;
    qryEstatisticasconcluidas_7_dias: TLargeintField;
    qryPesquisaid: TFDAutoIncField;
    qryPesquisatitulo: TStringField;
    qryPesquisadescricao: TStringField;
    qryPesquisaprioridade: TStringField;
    qryPesquisastatus: TStringField;
    qryPesquisadata_criacao: TDateTimeField;
    qryPesquisadata_conclusao: TDateTimeField;
    qryCadastroid: TFDAutoIncField;
    qryCadastrotitulo: TStringField;
    qryCadastrodescricao: TStringField;
    qryCadastroprioridade: TStringField;
    qryCadastrostatus: TStringField;
    qryCadastrodata_criacao: TDateTimeField;
    qryCadastrodata_conclusao: TDateTimeField;
    procedure qryCadastroBeforePost(DataSet: TDataSet);
  public
    function ListAll(const AParams: TDictionary<string, string>): TFDQuery; override;
    function GetEstatisticas: TJSONObject;
  end;

implementation

uses Providers.Enum.Tarefa.Status;

{$R *.dfm}

function TServiceTarefa.GetEstatisticas: TJSONObject;
begin
  qryEstatisticas.Open;
  Result := qryEstatisticas.ToJSONObject;
end;

function TServiceTarefa.ListAll(const AParams: TDictionary<string, string>): TFDQuery;
begin
  if AParams.ContainsKey('id') then
  begin
    qryPesquisa.SQL.Add('and id = :id');
    qryPesquisa.ParamByName('id').AsLargeInt := AParams.Items['id'].ToInt64;
    qryRecordCount.SQL.Add('and id = :id');
    qryRecordCount.ParamByName('id').AsLargeInt := AParams.Items['id'].ToInt64;
  end;
  if AParams.ContainsKey('status') then
   begin
    qryPesquisa.SQL.Add('and status = :status');
    qryPesquisa.ParamByName('status').AsSmallInt := AParams.Items['status'].ToInteger;
    qryRecordCount.SQL.Add('and status = :status');
    qryRecordCount.ParamByName('status').AsSmallInt := AParams.Items['status'].ToInteger;
  end;
  if AParams.ContainsKey('titulo') then
  begin
    qryPesquisa.SQL.Add('and lower(titulo) like :titulo');
    qryPesquisa.ParamByName('titulo').AsString := '%' + AParams.Items['titulo'].ToLower + '%';
    qryRecordCount.SQL.Add('and lower(titulo) = :titulo');
    qryRecordCount.ParamByName('titulo').AsString := '%' + AParams.Items['titulo'].ToLower + '%';
  end;
  qryPesquisa.SQL.Add('order by id');
  Result := inherited ListAll(AParams);
end;

procedure TServiceTarefa.qryCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryCadastrostatus.AsString.Equals(TTarefaStatus.Concluida.ToString) then
  begin
    if qryCadastrodata_conclusao.IsNull then
      qryCadastrodata_conclusao.AsDateTime := Now;
  end
  else
    qryCadastrodata_conclusao.Clear;
end;

end.

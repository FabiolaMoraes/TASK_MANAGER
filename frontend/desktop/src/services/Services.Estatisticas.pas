unit Services.Estatisticas;

interface

uses System.SysUtils, System.Classes, Services.Base, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Providers.Request, System.JSON, DataSet.Serialize;

type
  TServiceEstatisticas = class(TServiceBase)
    mtEstatisticas: TFDMemTable;
    mtEstatisticastotal_tarefas: TLargeintField;
    mtEstatisticasmedia_prioridade: TFloatField;
    mtEstatisticasconcluidas_7_dias: TLargeintField;
    procedure DataModuleCreate(Sender: TObject);
  public
    procedure Consultar;
  end;

implementation

{$R *.dfm}

procedure TServiceEstatisticas.Consultar;
var
  LResponse: IResponse;
begin
  mtEstatisticas.DisableControls;
  try
    LResponse := Request.Get;
    if LResponse.StatusCode <> 200 then
      raise Exception.Create(LResponse.Content);
    if mtEstatisticas.Active then
      mtEstatisticas.EmptyDataSet;
    mtEstatisticas.LoadFromJSON(LResponse.JSONValue.GetValue<TJSONObject>);
  finally
    mtEstatisticas.EnableControls;
  end;
end;

procedure TServiceEstatisticas.DataModuleCreate(Sender: TObject);
begin
  inherited;
  Request.BaseURL('http://localhost:9000')
    .Resource('tarefas/estatisticas');
end;

end.

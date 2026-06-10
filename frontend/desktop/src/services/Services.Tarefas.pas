unit Services.Tarefas;

interface

uses System.SysUtils, System.Classes, Services.Base.Cadastro, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Providers.Request, DataSet.Serialize, System.JSON;

type
  TServiceTarefas = class(TServiceBaseCadastro)
    mtEstatisticas: TFDMemTable;
    mtEstatisticastotal_tarefas: TLargeintField;
    mtEstatisticasmedia_prioridade: TWideStringField;
    mtEstatisticasconcluidas_7_dias: TWideStringField;
    mtPesquisaid: TFDAutoIncField;
    mtPesquisatitulo: TStringField;
    mtPesquisadescricao: TStringField;
    mtPesquisaprioridade: TStringField;
    mtPesquisastatus: TStringField;
    mtPesquisadata_criacao: TDateTimeField;
    mtPesquisadata_conclusao: TDateTimeField;
    mtCadastroid: TFDAutoIncField;
    mtCadastrotitulo: TStringField;
    mtCadastrodescricao: TStringField;
    mtCadastroprioridade: TStringField;
    mtCadastrostatus: TStringField;
    mtCadastrodata_criacao: TDateTimeField;
    mtCadastrodata_conclusao: TDateTimeField;
    procedure DataModuleCreate(Sender: TObject);
    procedure mtCadastroAfterInsert(DataSet: TDataSet);
  end;

implementation

uses Providers.Enum.Tarefa.Prioridade, Providers.Enum.Tarefa.Status;

{$R *.dfm}

procedure TServiceTarefas.DataModuleCreate(Sender: TObject);
begin
  inherited;
  Request.BaseURL('http://localhost:9000')
    .Resource('tarefas');
end;

procedure TServiceTarefas.mtCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  mtCadastroprioridade.AsString := TTarefaPrioridade.Media.ToString;
  mtCadastrostatus.AsString := TTarefaStatus.Pendente.ToString;
end;

end.

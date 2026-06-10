unit Views.Tarefas;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Views.Base.Cadastro, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.ExtCtrls, Services.Tarefas,
  Vcl.Mask, Vcl.DBCtrls;

type
  TFrmTarefas = class(TFrmBaseCadastro)
    lblCodigo: TLabel;
    edtCodigo: TDBEdit;
    lblNome: TLabel;
    edtTitulo: TDBEdit;
    lblPesquisaCodigo: TLabel;
    edtPesquisaCodigo: TEdit;
    lblPesquisaTitulo: TLabel;
    edtPesquisaTitulo: TEdit;
    Label1: TLabel;
    lblStatus: TLabel;
    cbxStatus: TDBComboBox;
    lblPrioridade: TLabel;
    cbxPrioridade: TDBComboBox;
    edtDescricao: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure dsCadastroStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    procedure DoBeforeList; override;
  end;

implementation

{$R *.dfm}

procedure TFrmTarefas.DoBeforeList;
begin
  inherited;
  FService.Request
    .ClearParams
    .AddParam('id', edtPesquisaCodigo.Text)
    .AddParam('titulo', edtPesquisaTitulo.Text);
end;

procedure TFrmTarefas.dsCadastroStateChange(Sender: TObject);
begin
  inherited;
  if (dsCadastro.DataSet.State in dsEditModes) then
    edtTitulo.SetFocus;
end;

procedure TFrmTarefas.FormCreate(Sender: TObject);
begin
  inherited;
  FService := TServiceTarefas.Create(Self);
end;

procedure TFrmTarefas.FormShow(Sender: TObject);
begin
  inherited;
  edtPesquisaCodigo.SetFocus;
end;

end.

unit Views.Estatisticas;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Views.Base, Vcl.StdCtrls, Services.Estatisticas, Data.DB,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  TFrmEstatisticas = class(TFrmBase)
    pnlHeader: TPanel;
    lblTitle: TLabel;
    pnlCadastro: TPanel;
    pnllTotalTarefas: TPanel;
    pnlMediaPrioridade: TPanel;
    pnlConcluida7Dias: TPanel;
    lblConcluida7Dias: TLabel;
    lblMediaPrioridade: TLabel;
    lblTotalTarefas: TLabel;
    lblCaptionTotalTarefas: TLabel;
    imgLogo: TImage;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FService: TServiceEstatisticas;
  end;

implementation

{$R *.dfm}

procedure TFrmEstatisticas.FormCreate(Sender: TObject);
begin
  inherited;
  FService := TServiceEstatisticas.Create(nil);
end;

procedure TFrmEstatisticas.FormShow(Sender: TObject);
begin
  inherited;
  FService.Consultar;
  if not FService.mtEstatisticas.IsEmpty then
  begin
    lblTotalTarefas.Caption := FService.mtEstatisticastotal_tarefas.AsString;
    if FService.mtEstatisticasmedia_prioridade.IsNull then
      lblMediaPrioridade.Caption := '0,00'
    else
      lblMediaPrioridade.Caption := FormatFloat('0.00', FService.mtEstatisticasmedia_prioridade.AsFloat);
    if FService.mtEstatisticasconcluidas_7_dias.IsNull then
      lblConcluida7Dias.Caption := '0'
    else
      lblConcluida7Dias.Caption := FService.mtEstatisticasconcluidas_7_dias.AsString;
  end
  else
  begin
    lblTotalTarefas.Caption := '0';
    lblMediaPrioridade.Caption := '0,00';
    lblConcluida7Dias.Caption := '0';
  end;
end;

end.

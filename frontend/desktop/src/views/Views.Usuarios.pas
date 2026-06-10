unit Views.Usuarios;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Views.Base.Cadastro, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.WinXPanels, Vcl.ExtCtrls, Services.Usuarios,
  Vcl.DBCtrls, Vcl.Mask;

type
  TFrmUsuarios = class(TFrmBaseCadastro)
    lblPesquisaCodigo: TLabel;
    lblPesquisaNome: TLabel;
    edtPesquisaCodigo: TEdit;
    edtPesquisaNome: TEdit;
    lblCodigo: TLabel;
    lblNome: TLabel;
    edtNome: TDBEdit;
    ckbStatus: TDBCheckBox;
    lblLogin: TLabel;
    edtLogin: TDBEdit;
    lblSenha: TLabel;
    edtSenha: TDBEdit;
    lblTelefone: TLabel;
    edtTelefone: TDBEdit;
    edtCodigo: TDBEdit;
    procedure dsCadastroStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    procedure DoBeforeList; override;
  end;

implementation

{$R *.dfm}

procedure TFrmUsuarios.DoBeforeList;
begin
  inherited;
  FService.Request
    .ClearParams
    .AddParam('id', edtPesquisaCodigo.Text)
    .AddParam('nome', edtPesquisaNome.Text);
end;

procedure TFrmUsuarios.dsCadastroStateChange(Sender: TObject);
begin
  inherited;
  if (dsCadastro.DataSet.State in dsEditModes) then
    edtNome.SetFocus;
end;

procedure TFrmUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  FService := TServiceUsuarios.Create(Self);
end;

procedure TFrmUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  edtPesquisaCodigo.SetFocus;
end;

end.

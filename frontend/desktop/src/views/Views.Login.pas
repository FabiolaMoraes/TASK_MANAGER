unit Views.Login;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Services.Login, Views.Base;

type
  TFrmLogin = class(TFrmBase)
    pnlBackground: TPanel;
    imgLogo: TImage;
    lblUsuario: TLabel;
    edtUsuario: TEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    btnEntrar: TButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  private
    FService: TServiceLogin;
  end;

implementation

uses Providers.Session;

{$R *.dfm}

procedure TFrmLogin.btnEntrarClick(Sender: TObject);
begin
  FService.Login(edtUsuario.Text, edtSenha.Text);
  Close;
  ModalResult := mrOk;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  FService := TServiceLogin.Create(Self);
// TODO: Remover credenciais fixas.
// Preenchimento automático utilizado apenas para facilitar os testes
// durante o desenvolvimento. Usuário e senha não devem permanecer
// definidos em produção.
  edtUsuario.Text := 'BDMG';
  edtSenha.Text := '123456';
end;

procedure TFrmLogin.FormDestroy(Sender: TObject);
begin
  FService.Free;
end;

end.

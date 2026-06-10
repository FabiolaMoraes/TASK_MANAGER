unit Views.Principal;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  Vcl.CategoryButtons, Views.Tarefas, Views.Usuarios, Views.Home, Views.Estatisticas;

type
  TFrmPrincipal = class(TForm)
    pnlToolBar: TPanel;
    imgMenu: TImage;
    lblTitle: TLabel;
    pnlContent: TPanel;
    SplitView: TSplitView;
    ImageList: TImageList;
    ActionList: TActionList;
    actHome: TAction;
    actTarefas: TAction;
    actUsuarios: TAction;
    CategoryButtons: TCategoryButtons;
    actEstatisticas: TAction;
    procedure FormCreate(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure actHomeExecute(Sender: TObject);
    procedure actTarefasExecute(Sender: TObject);
    procedure actUsuariosExecute(Sender: TObject);
    procedure actEstatisticasExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FActiveForm: TForm;
    procedure Login;
    procedure ShowForm(const AFormClass: TComponentClass; var AForm);
  end;

implementation

uses Views.Login;

{$R *.dfm}

procedure TFrmPrincipal.actTarefasExecute(Sender: TObject);
var
  LForm: TFrmTarefas;
begin
  ShowForm(TFrmTarefas, LForm);
end;

procedure TFrmPrincipal.actEstatisticasExecute(Sender: TObject);
var
  LForm: TFrmEstatisticas;
begin
  ShowForm(TFrmEstatisticas, LForm);
end;

procedure TFrmPrincipal.actHomeExecute(Sender: TObject);
var
  LForm: TFrmHome;
begin
  ShowForm(TFrmHome, LForm);
end;

procedure TFrmPrincipal.actUsuariosExecute(Sender: TObject);
var
  LForm: TFrmUsuarios;
begin
  ShowForm(TFrmUsuarios, LForm);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Login;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  actHome.Execute;
end;

procedure TFrmPrincipal.imgMenuClick(Sender: TObject);
begin
  if SplitView.Opened then
  begin
    SplitView.Close;
    CategoryButtons.ButtonOptions := CategoryButtons.ButtonOptions - [boShowCaptions];
  end
  else
  begin
    SplitView.Open;
    CategoryButtons.ButtonOptions := CategoryButtons.ButtonOptions + [boShowCaptions];
  end;
end;

procedure TFrmPrincipal.Login;
var
  LForm: TFrmLogin;
begin
  LForm := TFrmLogin.Create(Self);
  try
    if LForm.ShowModal <> mrOk then
      Application.Terminate;
  finally
    LForm.Free;
  end;
end;

procedure TFrmPrincipal.ShowForm(const AFormClass: TComponentClass; var AForm);
begin
  if Assigned(FActiveForm) then
    FActiveForm.Close;
  Application.CreateForm(AFormClass, AForm);
  TForm(AForm).Parent := pnlContent;
  TForm(AForm).Align := TAlign.alClient;
  TForm(AForm).WindowState := TWindowState.wsMaximized;
  TForm(AForm).Show;
  FActiveForm := TForm(AForm);
end;

end.

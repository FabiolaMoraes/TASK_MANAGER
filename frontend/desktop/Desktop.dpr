program Desktop;

uses
  Vcl.Forms,
  Views.Principal in 'src\views\Views.Principal.pas' {FrmPrincipal},
  Views.Login in 'src\views\Views.Login.pas' {FrmLogin},
  Services.Login in 'src\services\Services.Login.pas' {ServiceLogin: TDataModule},
  Providers.Session in 'src\providers\Providers.Session.pas',
  Views.Base in 'src\views\Views.Base.pas' {FrmBase},
  Views.Base.Cadastro in 'src\views\Views.Base.Cadastro.pas' {FrmBaseCadastro},
  Services.Base in 'src\services\Services.Base.pas' {ServiceBase: TDataModule},
  Services.Base.Cadastro in 'src\services\Services.Base.Cadastro.pas' {ServiceBaseCadastro: TDataModule},
  Views.Tarefas in 'src\views\Views.Tarefas.pas' {FrmTarefas},
  Services.Tarefas in 'src\services\Services.Tarefas.pas' {ServiceTarefas: TDataModule},
  Services.Usuarios in 'src\services\Services.Usuarios.pas' {ServiceUsuarios: TDataModule},
  Views.Usuarios in 'src\views\Views.Usuarios.pas' {FrmUsuarios},
  Providers.Request.Intf in 'src\providers\request\Providers.Request.Intf.pas',
  Providers.Request in 'src\providers\request\Providers.Request.pas',
  Views.Home in 'src\views\Views.Home.pas' {FrmHome},
  Views.Estatisticas in 'src\views\Views.Estatisticas.pas' {FrmEstatisticas},
  Services.Estatisticas in 'src\services\Services.Estatisticas.pas' {ServiceEstatisticas: TDataModule},
  Providers.Enum.Tarefa.Status in 'src\providers\enum\Providers.Enum.Tarefa.Status.pas',
  Providers.Enum.Tarefa.Prioridade in 'src\providers\enum\Providers.Enum.Tarefa.Prioridade.pas',
  Models.Token in 'src\models\Models.Token.pas',
  Providers.Enum.Usuario.Status in 'src\providers\enum\Providers.Enum.Usuario.Status.pas';

{$R *.res}

var
  FrmPrincipal: TFrmPrincipal;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.

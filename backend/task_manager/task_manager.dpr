program task_manager;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  Horse.OctetStream,
  Horse.JWT,
  Providers.Connection in 'src\providers\Providers.Connection.pas' {ProvidersConnection: TDataModule},
  Providers.Cadastro in 'src\providers\Providers.Cadastro.pas' {ProvidersCadastro: TDataModule},
  Services.Tarefa in 'src\services\Services.Tarefa.pas' {ServiceTarefa: TDataModule},
  Controllers.Tarefa in 'src\controllers\Controllers.Tarefa.pas',
  Services.Usuario in 'src\services\Services.Usuario.pas' {ServiceUsuario: TDataModule},
  Controllers.Usuario in 'src\controllers\Controllers.Usuario.pas',
  Providers.Enum.Tarefa.Status in 'src\providers\enum\Providers.Enum.Tarefa.Status.pas';

begin
  THorse
    .Use(Jhonson())
    .Use(HandleException)
    .Use(OctetStream)
    .Use(HorseJWT('BDMG'));

  Controllers.Tarefa.Registry;
  Controllers.Usuario.Registry;

  THorse.Listen(9000);
end.

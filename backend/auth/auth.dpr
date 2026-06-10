program auth;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  System.SysUtils,
  Providers.Connection in 'src\providers\Providers.Connection.pas' {ProvidersConnection: TDataModule},
  Services.Auth in 'src\services\Services.Auth.pas' {ServiceAuth: TDataModule},
  Controllers.Auth in 'src\controllers\Controllers.Auth.pas';

begin
  THorse
    .Use(Jhonson())
    .Use(HandleException);

  Controllers.Auth.Registry;

  THorse.Listen(8000);
end.

unit Services.Auth;

interface

uses System.SysUtils, System.Classes, Providers.Connection, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TServiceAuth = class(TProvidersConnection)
    qryLogin: TFDQuery;
    qryLoginID: TIntegerField;
    qryLoginSENHA: TStringField;
    function PermitirAcesso(const AUsuario, ASenha: string): Boolean;
  end;

implementation

{$R *.dfm}

uses BCrypt;

function TServiceAuth.PermitirAcesso(const AUsuario, ASenha: string): Boolean;
begin
  qryLogin.ParamByName('login').AsString := AUsuario;
  qryLogin.Open();
  if qryLogin.IsEmpty then
    Exit(False);
  Result := TBCrypt.CompareHash(ASenha, qryLoginSenha.AsString);
end;

end.

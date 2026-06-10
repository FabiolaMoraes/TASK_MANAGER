unit Controllers.Auth;

interface

procedure Registry;

implementation

uses Horse, System.JSON, Services.Auth, JOSE.Core.JWT, JOSE.Core.Builder, System.SysUtils, System.DateUtils, Horse.JWT;

const
  CHAVE = 'BDMG';

function GetToken(const AIdUsuario: string; const AExpiration: TDateTime): string;
var
  LJWT: TJWT;
begin
  LJWT := TJWT.Create;
  try
    LJWT.Claims.IssuedAt := Now;
    LJWT.Claims.Expiration := AExpiration;
    LJWT.Claims.Subject := AIdUsuario;
    Result := TJOSE.SHA256CompactToken(CHAVE, LJWT);
  finally
    LJWT.Free;
  end;
end;

procedure EfetuarLogin(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LConteudo, LToken: TJSONObject;
  LUsuario, LSenha: string;
begin
  LConteudo := Req.Body<TJSONObject>;
  if not LConteudo.TryGetValue<string>('username', LUsuario) then
    raise EHorseException.New.Error('Usuário não informado').Status(THTTPStatus.BadRequest);
  if not LConteudo.TryGetValue<string>('password', LSenha) then
    raise EHorseException.New.Error('Senha não informada').Status(THTTPStatus.BadRequest);
  var LService := TServiceAuth.Create(nil);
  try
    if not LService.PermitirAcesso(LUsuario, LSenha) then
      raise EHorseException.New.Error('Usuário não autorizado').Status(THTTPStatus.Unauthorized);
    LToken := TJSONObject.Create;
    LToken.AddPair('access', GetToken(LService.qryLoginid.AsString, IncHour(Now)));
    LToken.AddPair('refresh', GetToken(LService.qryLoginid.AsString, IncMonth(Now)));
    Res.Send(LToken);
  finally
    LService.Free;
  end;
end;

procedure RenovarToken(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LRefreshToken: string;
  LJWT: TJWT;
  LToken: string;
begin
  LRefreshToken := Req.Headers['Authorization'].Replace('Bearer ', EmptyStr);
  LJWT := TJOSE.Verify(CHAVE, LRefreshToken);
  try
    LToken := GetToken(LJWT.Claims.Subject, IncHour(Now));
    Res.Send(TJSONObject.Create.AddPair('access', LToken));
  finally
    LJWT.Free;
  end;
end;

procedure Registry;

begin
  THorse.Post('/login', EfetuarLogin);
  THorse.Get('/refresh', RenovarToken);
end;

end.

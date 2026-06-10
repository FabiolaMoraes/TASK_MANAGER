unit Providers.Enum.Usuario.Status;

interface

type
  TUsuarioStatus = (Inativo, Ativo);

  TUsuarioStatusHelper = record helper for TUsuarioStatus
    function GetValue: Integer;
    function ToString: string;
  end;

implementation

function TUsuarioStatusHelper.GetValue: Integer;
begin
  Result := Integer(Self);
end;

function TUsuarioStatusHelper.ToString: string;
begin
  case Self of
    TUsuarioStatus.Inativo:
      Result := 'Inativo';
    TUsuarioStatus.Ativo:
      Result := 'Ativo';
  end;
end;

end.

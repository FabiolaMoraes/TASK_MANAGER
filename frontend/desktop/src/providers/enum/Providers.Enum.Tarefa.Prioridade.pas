unit Providers.Enum.Tarefa.Prioridade;

interface

type
  TTarefaPrioridade = (Baixa, Media, Alta);

  TTarefaPrioridadedeHelper = record helper for TTarefaPrioridade
    function ToString: string;
  end;

implementation

function TTarefaPrioridadedeHelper.ToString: string;
begin
  case Self of
    TTarefaPrioridade.Baixa:
      Result := 'BAIXA';
    TTarefaPrioridade.Media:
      Result := 'MEDIA';
    TTarefaPrioridade.Alta:
      Result := 'ALTA';
  end;
end;

end.

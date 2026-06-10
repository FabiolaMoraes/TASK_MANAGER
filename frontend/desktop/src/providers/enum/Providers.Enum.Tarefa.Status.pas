unit Providers.Enum.Tarefa.Status;

interface

type
  TTarefaStatus = (Pendente, EmProgresso, Concluida, Cancelada);

  TTarefaStatusHelper = record helper for TTarefaStatus
    function ToString: string;
  end;

implementation

function TTarefaStatusHelper.ToString: string;
begin
  case Self of
    TTarefaStatus.Pendente:
      Result := 'PENDENTE';
    TTarefaStatus.EmProgresso:
      Result := 'EM PROGRESSO';
    TTarefaStatus.Concluida:
      Result := 'CONCLUIDA';
    TTarefaStatus.Cancelada:
      Result := 'CANCELADA';
  end;
end;

end.

inherited ServiceEstatisticas: TServiceEstatisticas
  Height = 219
  Width = 263
  object mtEstatisticas: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 47
    Top = 68
    object mtEstatisticastotal_tarefas: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'total_tarefas'
      Origin = 'total_tarefas'
      ProviderFlags = []
    end
    object mtEstatisticasmedia_prioridade: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'media_prioridade'
      Origin = 'media_prioridade'
      ProviderFlags = []
    end
    object mtEstatisticasconcluidas_7_dias: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'concluidas_7_dias'
      Origin = 'concluidas_7_dias'
      ProviderFlags = []
    end
  end
end

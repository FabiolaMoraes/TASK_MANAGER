inherited ServiceTarefas: TServiceTarefas
  Height = 240
  Width = 270
  inherited mtPesquisa: TFDMemTable
    UpdateOptions.KeyFields = 'id'
    Left = 47
    Top = 68
    object mtPesquisaid: TFDAutoIncField
      AutoGenerateValue = arNone
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object mtPesquisatitulo: TStringField
      FieldName = 'titulo'
      Origin = 'titulo'
      Required = True
      Size = 200
    end
    object mtPesquisadescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 255
    end
    object mtPesquisaprioridade: TStringField
      FieldName = 'prioridade'
      Origin = 'prioridade'
      Required = True
    end
    object mtPesquisastatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object mtPesquisadata_criacao: TDateTimeField
      FieldName = 'data_criacao'
      Origin = 'data_criacao'
    end
    object mtPesquisadata_conclusao: TDateTimeField
      FieldName = 'data_conclusao'
      Origin = 'data_conclusao'
    end
  end
  inherited mtCadastro: TFDMemTable
    AfterInsert = mtCadastroAfterInsert
    UpdateOptions.KeyFields = 'id'
    Left = 133
    Top = 69
    object mtCadastroid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object mtCadastrotitulo: TStringField
      FieldName = 'titulo'
      Origin = 'titulo'
      Required = True
      Size = 200
    end
    object mtCadastrodescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 255
    end
    object mtCadastroprioridade: TStringField
      FieldName = 'prioridade'
      Origin = 'prioridade'
      Required = True
    end
    object mtCadastrostatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object mtCadastrodata_criacao: TDateTimeField
      FieldName = 'data_criacao'
      Origin = 'data_criacao'
    end
    object mtCadastrodata_conclusao: TDateTimeField
      FieldName = 'data_conclusao'
      Origin = 'data_conclusao'
    end
  end
  object mtEstatisticas: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 47
    Top = 140
    object mtEstatisticastotal_tarefas: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'total_tarefas'
      Origin = 'total_tarefas'
      ProviderFlags = []
    end
    object mtEstatisticasmedia_prioridade: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'media_prioridade'
      Origin = 'media_prioridade'
      ProviderFlags = []
      Size = 32767
    end
    object mtEstatisticasconcluidas_7_dias: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'concluidas_7_dias'
      Origin = 'concluidas_7_dias'
      ProviderFlags = []
      Size = 32767
    end
  end
end

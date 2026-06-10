inherited ServiceTarefa: TServiceTarefa
  Height = 276
  Width = 445
  inherited FDConnection: TFDConnection
    Left = 51
    Top = 115
  end
  inherited qryPesquisa: TFDQuery
    UpdateOptions.KeyFields = 'id'
    SQL.Strings = (
      
        'select t.id, t.titulo, t.descricao, t.prioridade, t.status, t.da' +
        'ta_criacao, t.data_conclusao'
      'from tarefa t '
      'where 1 = 1')
    Left = 301
    Top = 115
    object qryPesquisaid: TFDAutoIncField
      AutoGenerateValue = arNone
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qryPesquisatitulo: TStringField
      FieldName = 'titulo'
      Origin = 'titulo'
      Required = True
      Size = 200
    end
    object qryPesquisadescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 255
    end
    object qryPesquisaprioridade: TStringField
      FieldName = 'prioridade'
      Origin = 'prioridade'
      Required = True
    end
    object qryPesquisastatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object qryPesquisadata_criacao: TDateTimeField
      FieldName = 'data_criacao'
      Origin = 'data_criacao'
    end
    object qryPesquisadata_conclusao: TDateTimeField
      FieldName = 'data_conclusao'
      Origin = 'data_conclusao'
    end
  end
  inherited qryRecordCount: TFDQuery
    SQL.Strings = (
      'select cast(count(distinct t.id) as bigint) as "count"'
      'from tarefa t'
      'where 1 = 1'
      ''
      '')
    Left = 218
    Top = 115
  end
  inherited qryCadastro: TFDQuery
    BeforePost = qryCadastroBeforePost
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    UpdateOptions.KeyFields = 'id'
    SQL.Strings = (
      
        'select t.id, t.titulo, t.descricao, t.prioridade, t.status, t.da' +
        'ta_criacao, t.data_conclusao'
      'from tarefa t '
      '')
    Left = 134
    Top = 115
    object qryCadastroid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qryCadastrotitulo: TStringField
      FieldName = 'titulo'
      Origin = 'titulo'
      Required = True
      Size = 200
    end
    object qryCadastrodescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 255
    end
    object qryCadastroprioridade: TStringField
      FieldName = 'prioridade'
      Origin = 'prioridade'
      Required = True
    end
    object qryCadastrostatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object qryCadastrodata_criacao: TDateTimeField
      FieldName = 'data_criacao'
      Origin = 'data_criacao'
    end
    object qryCadastrodata_conclusao: TDateTimeField
      FieldName = 'data_conclusao'
      Origin = 'data_conclusao'
    end
  end
  object qryEstatisticas: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    SQL.Strings = (
      'select count(*) as total_tarefas,'
      ''
      '       coalesce(avg('
      '       case'
      '         when status = '#39'PENDENTE'#39' then case prioridade'
      '                                         when '#39'BAIXA'#39' then 1'
      '                                         when '#39'MEDIA'#39' then 2'
      '                                         when '#39'ALTA'#39' then 3'
      '                                       end'
      '       end), 0) as media_prioridade,'
      ''
      '       sum('
      '       case'
      
        '         when status = '#39'CONCLUIDA'#39' and data_conclusao >= datetim' +
        'e('#39'now'#39', '#39'-7 days'#39') then 1'
      '         else 0'
      '       end) as concluidas_7_dias'
      'from tarefa')
    Left = 301
    Top = 179
    object qryEstatisticastotal_tarefas: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'total_tarefas'
      Origin = 'total_tarefas'
      ProviderFlags = []
    end
    object qryEstatisticasmedia_prioridade: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'media_prioridade'
      Origin = 'media_prioridade'
      ProviderFlags = []
    end
    object qryEstatisticasconcluidas_7_dias: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'concluidas_7_dias'
      Origin = 'concluidas_7_dias'
      ProviderFlags = []
    end
  end
end

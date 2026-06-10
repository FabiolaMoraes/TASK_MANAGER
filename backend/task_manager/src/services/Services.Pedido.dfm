inherited ServicePedido: TServicePedido
  Height = 234
  Width = 421
  inherited FDConnection: TFDConnection
    Left = 51
    Top = 115
  end
  inherited qryPesquisa: TFDQuery
    SQL.Strings = (
      
        'select p.id, p.id_cliente, p.data, c.nome as nome_cliente, p.id_' +
        'usuario'
      '    from pedido p'
      '   inner join cliente c on c.id = p.id_cliente'
      'where 1 = 1')
    Left = 301
    Top = 115
    object qryPesquisaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      Required = True
    end
    object qryPesquisaDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object qryPesquisaNOME_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryPesquisatotal: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object qryPesquisaID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
  end
  inherited qryRecordCount: TFDQuery
    SQL.Strings = (
      'select count(p.id)'
      '    from pedido p'
      '   inner join cliente c on c.id = p.id_cliente'
      'where 1 = 1')
    Left = 218
    Top = 115
  end
  inherited qryCadastro: TFDQuery
    AfterInsert = qryCadastroAfterInsert
    SQL.Strings = (
      
        'select p.id, p.id_cliente, p.data, c.nome as nome_cliente, p.id_' +
        'usuario'
      '    from pedido p'
      '   inner join cliente c on c.id = p.id_cliente')
    Left = 134
    Top = 115
    object qryCadastroID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryCadastroID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      Required = True
    end
    object qryCadastroDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryCadastroNOME_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 60
    end
    object qryCadastroID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
  end
end

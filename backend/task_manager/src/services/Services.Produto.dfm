inherited ServiceProduto: TServiceProduto
  inherited qryPesquisa: TFDQuery
    SQL.Strings = (
      'Select p.id, p.nome, p.valor, p.status, p.estoque'
      '    from produto p'
      '  where 1 = 1')
    object qryPesquisaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 60
    end
    object qryPesquisaVALOR: TIntegerField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
    end
    object qryPesquisaSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object qryPesquisaESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE'
      Required = True
    end
  end
  inherited qryRecordCount: TFDQuery
    SQL.Strings = (
      'Select count(p.id)'
      '    from produto p'
      '  where 1 = 1')
  end
  inherited qryCadastro: TFDQuery
    SQL.Strings = (
      'Select p.id, p.nome, p.valor, p.status, p.estoque'
      '    from produto p'
      '')
    object qryCadastroID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryCadastroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 60
    end
    object qryCadastroVALOR: TIntegerField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
    end
    object qryCadastroSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object qryCadastroESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE'
      Required = True
    end
  end
end

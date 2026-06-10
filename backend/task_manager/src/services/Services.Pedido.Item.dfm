inherited ServicePedidoItem: TServicePedidoItem
  Height = 306
  Width = 510
  PixelsPerInch = 120
  inherited FDConnection: TFDConnection
    Left = 48
    Top = 112
  end
  inherited qryPesquisa: TFDQuery
    SQL.Strings = (
      
        'select i.id, i.id_produto, i.valor, i.quantidade, p.nome as nome' +
        '_produto'
      '  from pedido_item i'
      ' inner join produto p on p.id = i.id_produto'
      '  where i.id_pedido = :id_pedido')
    Left = 349
    Top = 115
    ParamData = <
      item
        Name = 'ID_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPesquisaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisaID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object qryPesquisaVALOR: TIntegerField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
    end
    object qryPesquisaQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
    end
    object qryPesquisaNOME_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRODUTO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  inherited qryRecordCount: TFDQuery
    SQL.Strings = (
      'select count(i.id)'
      'from pedido_item i'
      'inner join produto p on p.id = i.id_produto'
      'where i.id_pedido = :id_pedido')
    Left = 250
    Top = 115
    ParamData = <
      item
        Name = 'ID_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited qryCadastro: TFDQuery
    SQL.Strings = (
      
        'select i.id, i.id_pedido, i.id_produto, i.valor, i.quantidade, p' +
        '.nome as nome_produto'
      '  from pedido_item i'
      ' inner join produto p on p.id = i.id_produto'
      '')
    Left = 150
    Top = 115
    object qryCadastroID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryCadastroID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Origin = 'ID_PEDIDO'
    end
    object qryCadastroID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object qryCadastroVALOR: TIntegerField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
    end
    object qryCadastroQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
    end
    object qryCadastroNOME_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRODUTO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
end

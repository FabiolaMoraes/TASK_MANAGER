inherited ProvidersCadastro: TProvidersCadastro
  Height = 345
  Width = 556
  inherited FDConnection: TFDConnection
    Left = 64
    Top = 144
  end
  object qryPesquisa: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    Left = 376
    Top = 144
  end
  object qryRecordCount: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    Left = 272
    Top = 144
    object qryRecordCountCOUNT: TLargeintField
      FieldName = 'COUNT'
    end
  end
  object qryCadastro: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    Left = 168
    Top = 144
  end
end

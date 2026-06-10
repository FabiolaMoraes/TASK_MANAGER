inherited ServiceUsuarios: TServiceUsuarios
  inherited mtPesquisa: TFDMemTable
    UpdateOptions.KeyFields = 'id'
    Left = 66
    Top = 87
    object mtPesquisaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtPesquisanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 150
    end
    object mtPesquisalogin: TStringField
      FieldName = 'login'
      Origin = 'login'
      Required = True
      Size = 100
    end
    object mtPesquisastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object mtPesquisatelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
    end
  end
  inherited mtCadastro: TFDMemTable
    AfterInsert = mtCadastroAfterInsert
    UpdateOptions.KeyFields = 'id'
    Left = 169
    Top = 88
    object mtCadastroid: TFDAutoIncField
      AutoGenerateValue = arNone
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ClientAutoIncrement = False
    end
    object mtCadastronome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 150
    end
    object mtCadastrologin: TStringField
      FieldName = 'login'
      Origin = 'login'
      Required = True
      Size = 100
    end
    object mtCadastrosenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 255
    end
    object mtCadastrostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object mtCadastrotelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
    end
  end
end

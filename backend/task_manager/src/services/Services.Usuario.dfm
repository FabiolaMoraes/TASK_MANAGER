inherited ServiceUsuario: TServiceUsuario
  Height = 221
  Width = 356
  inherited FDConnection: TFDConnection
    Left = 41
    Top = 92
  end
  inherited qryPesquisa: TFDQuery
    UpdateOptions.KeyFields = 'id'
    SQL.Strings = (
      'select u.id, u.nome, u.login, u.status, u.telefone'
      ' from usuario u '
      'where 1 = 1')
    Left = 241
    Top = 92
    object qryPesquisaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPesquisanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 150
    end
    object qryPesquisalogin: TStringField
      FieldName = 'login'
      Origin = 'login'
      Required = True
      Size = 100
    end
    object qryPesquisastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object qryPesquisatelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
    end
  end
  inherited qryRecordCount: TFDQuery
    SQL.Strings = (
      'select cast(count(distinct u.id) as bigint) as "count"'
      ' from usuario u '
      'where 1 = 1')
    Left = 174
    Top = 92
  end
  inherited qryCadastro: TFDQuery
    BeforePost = qryCadastroBeforePost
    UpdateOptions.KeyFields = 'id'
    SQL.Strings = (
      'select u.id, u.nome, u.login, u.senha, u.status, u.telefone'
      ' from usuario u ')
    Left = 107
    Top = 92
    object qryCadastroid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ClientAutoIncrement = False
    end
    object qryCadastronome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 150
    end
    object qryCadastrologin: TStringField
      FieldName = 'login'
      Origin = 'login'
      Required = True
      Size = 100
    end
    object qryCadastrosenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 255
    end
    object qryCadastrostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object qryCadastrotelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
    end
  end
end

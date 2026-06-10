inherited ServiceAuth: TServiceAuth
  Height = 221
  Width = 364
  inherited FDConnection: TFDConnection
    Left = 144
    Top = 96
  end
  object qryLogin: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select u.id, u.senha'
      'from usuario u'
      'where u.login = :login'
      'and u.status = 1')
    Left = 240
    Top = 96
    ParamData = <
      item
        Name = 'LOGIN'
        DataType = ftString
        ParamType = ptInput
        Size = 30
        Value = Null
      end>
    object qryLoginID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryLoginSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 256
    end
  end
end

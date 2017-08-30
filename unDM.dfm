object DM: TDM
  OldCreateOrder = False
  Left = 320
  Top = 172
  Height = 140
  Width = 286
  object dtbFirebird: TIBDatabase
    Connected = True
    DatabaseName = 'ControleProdutos.fdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = trnFirebird
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 20
    Top = 5
  end
  object trnFirebird: TIBTransaction
    Active = True
    DefaultDatabase = dtbFirebird
    AutoStopAction = saNone
    Left = 20
    Top = 50
  end
  object qryPrincipal: TIBQuery
    Database = dtbFirebird
    Transaction = trnFirebird
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select'
      '  *'
      'From'
      '  Produto P'
      'Order by'
      '  P.CodigoEstoque')
    Left = 85
    Top = 5
    object qryPrincipalID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRODUTO.ID'
      Required = True
    end
    object qryPrincipalCODIGOESTOQUE: TIBStringField
      FieldName = 'CODIGOESTOQUE'
      Origin = 'PRODUTO.CODIGOESTOQUE'
      Required = True
      Size = 16
    end
    object qryPrincipalCODIGOVENDA: TIBStringField
      FieldName = 'CODIGOVENDA'
      Origin = 'PRODUTO.CODIGOVENDA'
      Size = 16
    end
    object qryPrincipalDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTO.DESCRICAO'
      Size = 80
    end
    object qryPrincipalQUANTIDADEEMESTOQUE: TIntegerField
      FieldName = 'QUANTIDADEEMESTOQUE'
      Origin = 'PRODUTO.QUANTIDADEEMESTOQUE'
    end
    object qryPrincipalVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'PRODUTO.VALOR'
      DisplayFormat = '#,##0.00'
      currency = True
    end
  end
  object dtsPrincipal: TDataSource
    AutoEdit = False
    DataSet = qryPrincipal
    Left = 145
    Top = 5
  end
  object qryChave: TIBQuery
    Database = dtbFirebird
    Transaction = trnFirebird
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select gen_id(PRODUTO_ID, 1) chave FROM rdb$database')
    Left = 85
    Top = 50
  end
  object qryProduto: TIBQuery
    Database = dtbFirebird
    Transaction = trnFirebird
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select'
      '  *'
      'From'
      '  Produto P'
      'Where'
      '  P.ID = :id')
    Left = 210
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
  end
  object qryOperacao: TIBQuery
    Database = dtbFirebird
    Transaction = trnFirebird
    BufferChunks = 1000
    CachedUpdates = False
    Left = 210
    Top = 50
  end
end

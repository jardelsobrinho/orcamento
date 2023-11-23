object dmClientes: TdmClientes
  OnCreate = DataModuleCreate
  Height = 458
  Width = 748
  object qryClientesPesquisa: TFDQuery
    Connection = dmConexao.fdConexao
    Transaction = dmConexao.fdTransacao
    SQL.Strings = (
      'SELECT *'
      'FROM CLIENTE C')
    Left = 64
    Top = 24
    object qryClientesPesquisaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesPesquisaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qryClientesPesquisaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
    end
  end
  object qryClienteCadastro: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = dmConexao.fdConexao
    Transaction = dmConexao.fdTransacao
    UpdateTransaction = dmConexao.fdTransacao
    UpdateObject = updClienteCadastro
    SQL.Strings = (
      'SELECT *'
      'FROM CLIENTE C'
      'WHERE C.ID = :ID')
    Left = 224
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryClienteCadastroID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClienteCadastroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qryClienteCadastroTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      EditMask = '!\(99\)99999-9999;1;_'
    end
  end
  object updClienteCadastro: TFDUpdateSQL
    Connection = dmConexao.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO CLIENTE'
      '(ID, NOME, TELEFONE)'
      'VALUES (:NEW_ID, :NEW_NOME, :NEW_TELEFONE)')
    ModifySQL.Strings = (
      'UPDATE CLIENTE'
      'SET ID = :NEW_ID, NOME = :NEW_NOME, TELEFONE = :NEW_TELEFONE'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CLIENTE'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, NOME, TELEFONE'
      'FROM CLIENTE'
      'WHERE ID = :OLD_ID')
    Left = 224
    Top = 96
  end
  object qryRetornaClienteId: TFDQuery
    Connection = dmConexao.fdConexao
    Transaction = dmConexao.fdTransacao
    SQL.Strings = (
      'SELECT GEN_ID(GEN_CLIENTE, 1) CLIENTE_ID FROM RDB$DATABASE')
    Left = 368
    Top = 24
    object qryRetornaClienteIdCLIENTE_ID: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CLIENTE_ID'
      Origin = 'CLIENTE_ID'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryListaClientes: TFDQuery
    Connection = dmConexao.fdConexao
    Transaction = dmConexao.fdTransacao
    SQL.Strings = (
      'SELECT C.ID, C.NOME'
      'FROM CLIENTE C'
      'ORDER BY C.NOME')
    Left = 512
    Top = 24
    object qryListaClientesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryListaClientesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
  end
end

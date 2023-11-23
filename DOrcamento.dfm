object dmOrcamento: TdmOrcamento
  Height = 597
  Width = 931
  object qryOrcamentoPesquisa: TFDQuery
    Connection = dmConexao.fdConexao
    Transaction = dmConexao.fdTransacao
    SQL.Strings = (
      'SELECT O.*, C.NOME CLIENTE_NOME'
      'FROM ORCAMENTO O'
      'INNER JOIN CLIENTE C ON C.ID = O.CLIENTE_ID')
    Left = 88
    Top = 32
    object qryOrcamentoPesquisaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOrcamentoPesquisaDATA_CADASTRO: TDateField
      DisplayLabel = 'DATA CADASTRO'
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
      Required = True
    end
    object qryOrcamentoPesquisaDATA_ENTREGA: TDateField
      DisplayLabel = 'DATA ENTREGA'
      FieldName = 'DATA_ENTREGA'
      Origin = 'DATA_ENTREGA'
      Required = True
    end
    object qryOrcamentoPesquisaCARRO: TStringField
      FieldName = 'CARRO'
      Origin = 'CARRO'
      Required = True
      Size = 50
    end
    object qryOrcamentoPesquisaCONCLUIDO: TStringField
      DisplayLabel = 'CONCLU'#205'DO'
      FieldName = 'CONCLUIDO'
      Origin = 'CONCLUIDO'
      Required = True
      Size = 1
    end
    object qryOrcamentoPesquisaVALOR_TOTAL: TFloatField
      DisplayLabel = 'VALOR TOTAL'
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryOrcamentoPesquisaCLIENTE_NOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'CLIENTE'
      FieldName = 'CLIENTE_NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object qryOrcamentoCadastro: TFDQuery
    AfterOpen = qryOrcamentoCadastroAfterOpen
    OnNewRecord = qryOrcamentoCadastroNewRecord
    CachedUpdates = True
    Connection = dmConexao.fdConexao
    Transaction = dmConexao.fdTransacao
    UpdateTransaction = dmConexao.fdTransacao
    UpdateObject = updOrcamentoCadastro
    SQL.Strings = (
      'SELECT O.*'
      'FROM ORCAMENTO O'
      'WHERE O.ID = :ID')
    Left = 277
    Top = 32
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryOrcamentoCadastroID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOrcamentoCadastroCLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
      Origin = 'CLIENTE_ID'
      Required = True
    end
    object qryOrcamentoCadastroDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
      Required = True
    end
    object qryOrcamentoCadastroDATA_ENTREGA: TDateField
      FieldName = 'DATA_ENTREGA'
      Origin = 'DATA_ENTREGA'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object qryOrcamentoCadastroCARRO: TStringField
      FieldName = 'CARRO'
      Origin = 'CARRO'
      Required = True
      Size = 50
    end
    object qryOrcamentoCadastroCONCLUIDO: TStringField
      FieldName = 'CONCLUIDO'
      Origin = 'CONCLUIDO'
      Required = True
      Size = 1
    end
    object qryOrcamentoCadastroVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object updOrcamentoCadastro: TFDUpdateSQL
    Connection = dmConexao.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO ORCAMENTO'
      '(ID, CLIENTE_ID, DATA_CADASTRO, DATA_ENTREGA, '
      '  CARRO, CONCLUIDO, VALOR_TOTAL)'
      
        'VALUES (:NEW_ID, :NEW_CLIENTE_ID, :NEW_DATA_CADASTRO, :NEW_DATA_' +
        'ENTREGA, '
      '  :NEW_CARRO, :NEW_CONCLUIDO, :NEW_VALOR_TOTAL)')
    ModifySQL.Strings = (
      'UPDATE ORCAMENTO'
      
        'SET ID = :NEW_ID, CLIENTE_ID = :NEW_CLIENTE_ID, DATA_CADASTRO = ' +
        ':NEW_DATA_CADASTRO, '
      
        '  DATA_ENTREGA = :NEW_DATA_ENTREGA, CARRO = :NEW_CARRO, CONCLUID' +
        'O = :NEW_CONCLUIDO, '
      '  VALOR_TOTAL = :NEW_VALOR_TOTAL'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM ORCAMENTO'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, CLIENTE_ID, DATA_CADASTRO, DATA_ENTREGA, CARRO, CONCL' +
        'UIDO, '
      '  VALOR_TOTAL'
      'FROM ORCAMENTO'
      'WHERE ID = :OLD_ID')
    Left = 480
    Top = 40
  end
  object qryRetornaOrcamentoId: TFDQuery
    Connection = dmConexao.fdConexao
    Transaction = dmConexao.fdTransacao
    SQL.Strings = (
      'SELECT GEN_ID(GEN_ORCAMENTO, 1) ORCAMENTO_ID FROM RDB$DATABASE')
    Left = 648
    Top = 40
    object qryRetornaOrcamentoIdORCAMENTO_ID: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'ORCAMENTO_ID'
      Origin = 'ORCAMENTO_ID'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryOrcamentoItemCadastro: TFDQuery
    OnNewRecord = qryOrcamentoItemCadastroNewRecord
    CachedUpdates = True
    Connection = dmConexao.fdConexao
    Transaction = dmConexao.fdTransacao
    UpdateTransaction = dmConexao.fdTransacao
    UpdateObject = updOrcamentoItemCadastro
    SQL.Strings = (
      'SELECT *'
      'FROM ORCAMENTO_ITEM OI'
      'WHERE OI.ORCAMENTO_ID = :ORCAMENTO_ID')
    Left = 272
    Top = 112
    ParamData = <
      item
        Name = 'ORCAMENTO_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryOrcamentoItemCadastroID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOrcamentoItemCadastroORCAMENTO_ID: TIntegerField
      FieldName = 'ORCAMENTO_ID'
      Origin = 'ORCAMENTO_ID'
      Required = True
    end
    object qryOrcamentoItemCadastroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object qryOrcamentoItemCadastroVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object updOrcamentoItemCadastro: TFDUpdateSQL
    Connection = dmConexao.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO ORCAMENTO_ITEM'
      '(ID, ORCAMENTO_ID, DESCRICAO, VALOR)'
      'VALUES (:NEW_ID, :NEW_ORCAMENTO_ID, :NEW_DESCRICAO, :NEW_VALOR)')
    ModifySQL.Strings = (
      'UPDATE ORCAMENTO_ITEM'
      
        'SET ID = :NEW_ID, ORCAMENTO_ID = :NEW_ORCAMENTO_ID, DESCRICAO = ' +
        ':NEW_DESCRICAO, '
      '  VALOR = :NEW_VALOR'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM ORCAMENTO_ITEM'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, ORCAMENTO_ID, DESCRICAO, VALOR'
      'FROM ORCAMENTO_ITEM'
      'WHERE ID = :OLD_ID')
    Left = 480
    Top = 112
  end
  object qryRetornaOrcamentoItemId: TFDQuery
    Connection = dmConexao.fdConexao
    Transaction = dmConexao.fdTransacao
    SQL.Strings = (
      
        'SELECT GEN_ID(GEN_ORCAMENTO_ITEM, 1) ORCAMENTO_ITEM_ID FROM RDB$' +
        'DATABASE')
    Left = 656
    Top = 112
    object qryRetornaOrcamentoItemIdORCAMENTO_ITEM_ID: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'ORCAMENTO_ITEM_ID'
      Origin = 'ORCAMENTO_ITEM_ID'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end

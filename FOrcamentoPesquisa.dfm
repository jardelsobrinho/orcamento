inherited frmOrcamentoPesquisa: TfrmOrcamentoPesquisa
  Caption = 'PESQUISA DE OR'#199'AMENTOS'
  ClientHeight = 556
  ClientWidth = 1080
  OnClose = FormClose
  ExplicitWidth = 1092
  ExplicitHeight = 594
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 1080
    Caption = 'PESQUISA DE OR'#199'AMENTOS'
    ExplicitWidth = 1076
  end
  inherited Panel2: TPanel
    Top = 515
    Width = 1080
    ExplicitTop = 514
    ExplicitWidth = 1076
  end
  inherited Panel3: TPanel
    Width = 1080
    ExplicitWidth = 1076
    object Label1: TLabel [0]
      Left = 12
      Top = 0
      Width = 160
      Height = 15
      Caption = 'Pesquisa por Nome do Cliente'
    end
    object edNomeCliente: TEdit
      Left = 12
      Top = 17
      Width = 324
      Height = 23
      TabOrder = 2
    end
  end
  inherited gridPesquisa: TDBGrid
    Width = 1080
    Height = 426
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE_NOME'
        Width = 414
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CADASTRO'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_ENTREGA'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCLUIDO'
        Width = 92
        Visible = True
      end>
  end
  inherited dsPesquisa: TDataSource
    DataSet = dmOrcamento.qryOrcamentoPesquisa
  end
end

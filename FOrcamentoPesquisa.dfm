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
      Width = 90
      Height = 15
      Caption = 'Nome do Cliente'
    end
    object Label2: TLabel [1]
      Left = 251
      Top = 0
      Width = 74
      Height = 15
      Caption = 'Data Cadastro'
    end
    object Label3: TLabel [2]
      Left = 346
      Top = 0
      Width = 67
      Height = 15
      Caption = 'Data Entrega'
    end
    inherited btnPesquisa: TBitBtn
      Left = 478
      Top = 17
      ExplicitLeft = 478
      ExplicitTop = 17
    end
    inherited BitBtn2: TBitBtn
      Left = 582
      Top = 17
      ExplicitLeft = 582
      ExplicitTop = 17
    end
    object edNomeCliente: TEdit
      Left = 12
      Top = 19
      Width = 233
      Height = 23
      TabOrder = 2
    end
    object meDataCadastro: TMaskEdit
      Left = 251
      Top = 19
      Width = 87
      Height = 23
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
    end
    object meDataEntrega: TMaskEdit
      Left = 346
      Top = 19
      Width = 87
      Height = 23
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  /  /    '
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

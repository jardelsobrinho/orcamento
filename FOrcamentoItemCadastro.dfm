inherited frmOrcamentoItemCadastro: TfrmOrcamentoItemCadastro
  Caption = 'CADASTRO DE SERVI'#199'O'
  ClientHeight = 162
  ClientWidth = 429
  OnShow = FormShow
  ExplicitWidth = 441
  ExplicitHeight = 200
  TextHeight = 15
  object Label1: TLabel [0]
    Left = 16
    Top = 16
    Width = 63
    Height = 15
    Caption = 'DESCRI'#199#195'O'
    FocusControl = dbeDescricao
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 64
    Width = 36
    Height = 15
    Caption = 'VALOR'
    FocusControl = DBEdit2
  end
  inherited Panel1: TPanel
    Top = 121
    Width = 429
    ExplicitTop = 120
    ExplicitWidth = 425
    DesignSize = (
      429
      41)
    inherited BitBtn1: TBitBtn
      Left = 250
      ExplicitLeft = 246
    end
    inherited BitBtn2: TBitBtn
      Left = 331
      ExplicitLeft = 327
    end
  end
  object dbeDescricao: TDBEdit
    Left = 16
    Top = 32
    Width = 393
    Height = 23
    CharCase = ecUpperCase
    DataField = 'DESCRICAO'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 80
    Width = 154
    Height = 23
    DataField = 'VALOR'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DataSource1: TDataSource
    DataSet = dmOrcamento.qryOrcamentoItemCadastro
    Left = 184
    Top = 104
  end
end

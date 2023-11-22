inherited frmClienteCadastro: TfrmClienteCadastro
  Caption = 'CADASTRO DE CLIENTE'
  ClientHeight = 183
  ClientWidth = 446
  Position = poMainFormCenter
  OnShow = FormShow
  ExplicitWidth = 458
  ExplicitHeight = 221
  TextHeight = 15
  object Label1: TLabel [0]
    Left = 16
    Top = 24
    Width = 35
    Height = 15
    Caption = 'NOME'
    FocusControl = dbeNome
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 72
    Width = 54
    Height = 15
    Caption = 'TELEFONE'
    FocusControl = DBEdit2
  end
  inherited Panel1: TPanel
    Top = 142
    Width = 446
    ExplicitTop = 141
    ExplicitWidth = 442
    DesignSize = (
      446
      41)
    inherited BitBtn1: TBitBtn
      Left = 275
      ExplicitLeft = 271
    end
    inherited BitBtn2: TBitBtn
      Left = 356
      ExplicitLeft = 352
    end
  end
  object dbeNome: TDBEdit
    Left = 16
    Top = 43
    Width = 385
    Height = 23
    CharCase = ecUpperCase
    DataField = 'NOME'
    DataSource = dsCadastro
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 88
    Width = 193
    Height = 23
    DataField = 'TELEFONE'
    DataSource = dsCadastro
    MaxLength = 14
    TabOrder = 2
  end
  object dsCadastro: TDataSource
    DataSet = dmClientes.qryClienteCadastro
    Left = 224
    Top = 40
  end
end

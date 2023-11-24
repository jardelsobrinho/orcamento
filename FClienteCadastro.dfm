inherited frmClienteCadastro: TfrmClienteCadastro
  Caption = 'CADASTRO DE CLIENTE'
  ClientHeight = 162
  ClientWidth = 430
  OnShow = FormShow
  ExplicitWidth = 442
  ExplicitHeight = 200
  TextHeight = 15
  object Label1: TLabel [0]
    Left = 16
    Top = 16
    Width = 35
    Height = 15
    Caption = 'NOME'
    FocusControl = dbeNome
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 64
    Width = 54
    Height = 15
    Caption = 'TELEFONE'
    FocusControl = DBEdit2
  end
  inherited Panel1: TPanel
    Top = 121
    Width = 430
    ExplicitTop = 141
    ExplicitWidth = 442
    DesignSize = (
      430
      41)
    inherited BitBtn1: TBitBtn
      Left = 255
      ExplicitLeft = 255
    end
    inherited BitBtn2: TBitBtn
      Left = 336
      ExplicitLeft = 336
    end
  end
  object dbeNome: TDBEdit
    Left = 16
    Top = 35
    Width = 385
    Height = 23
    CharCase = ecUpperCase
    DataField = 'NOME'
    DataSource = dsCadastro
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 80
    Width = 129
    Height = 23
    DataField = 'TELEFONE'
    DataSource = dsCadastro
    MaxLength = 14
    TabOrder = 2
  end
  object dsCadastro: TDataSource
    DataSet = dmClientes.qryClienteCadastro
    Left = 224
    Top = 32
  end
end

inherited frmOrcamentoCadastro: TfrmOrcamentoCadastro
  Caption = 'CADASTRO DE OR'#199'AMENTO'
  ClientHeight = 455
  ClientWidth = 789
  ExplicitWidth = 801
  ExplicitHeight = 493
  TextHeight = 15
  object Label1: TLabel [0]
    Left = 24
    Top = 16
    Width = 11
    Height = 15
    Caption = 'ID'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 24
    Top = 64
    Width = 60
    Height = 15
    Caption = 'CLIENTE_ID'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 104
    Top = 13
    Width = 93
    Height = 15
    Caption = 'DATA_CADASTRO'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 272
    Top = 16
    Width = 83
    Height = 15
    Caption = 'DATA_ENTREGA'
    FocusControl = DBEdit4
  end
  object Label5: TLabel [4]
    Left = 440
    Top = 13
    Width = 39
    Height = 15
    Caption = 'CARRO'
    FocusControl = DBEdit5
  end
  object Label6: TLabel [5]
    Left = 608
    Top = 16
    Width = 68
    Height = 15
    Caption = 'CONCLUIDO'
    FocusControl = DBEdit6
  end
  object Label7: TLabel [6]
    Left = 614
    Top = 360
    Width = 73
    Height = 15
    Caption = 'VALOR_TOTAL'
    FocusControl = DBEdit7
  end
  inherited Panel1: TPanel
    Top = 414
    Width = 789
    inherited BitBtn1: TBitBtn
      Left = 614
      ExplicitLeft = 372
    end
    inherited BitBtn2: TBitBtn
      Left = 695
      ExplicitLeft = 453
    end
  end
  object DBEdit1: TDBEdit
    Left = 24
    Top = 32
    Width = 68
    Height = 23
    Color = clBtnFace
    DataField = 'ID'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 24
    Top = 80
    Width = 154
    Height = 23
    DataField = 'CLIENTE_ID'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 104
    Top = 32
    Width = 154
    Height = 23
    Color = clBtnFace
    DataField = 'DATA_CADASTRO'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 272
    Top = 32
    Width = 154
    Height = 23
    DataField = 'DATA_ENTREGA'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 440
    Top = 32
    Width = 154
    Height = 23
    DataField = 'CARRO'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 608
    Top = 32
    Width = 19
    Height = 23
    DataField = 'CONCLUIDO'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit7: TDBEdit
    Left = 614
    Top = 376
    Width = 154
    Height = 23
    DataField = 'VALOR_TOTAL'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DataSource1: TDataSource
    DataSet = dmOrcamento.qryOrcamentoCadastro
    Left = 352
    Top = 232
  end
end

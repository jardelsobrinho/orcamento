inherited frmOrcamentoCadastro: TfrmOrcamentoCadastro
  Caption = 'CADASTRO DE OR'#199'AMENTO'
  ClientHeight = 451
  ClientWidth = 591
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 603
  ExplicitHeight = 489
  TextHeight = 15
  inherited Panel1: TPanel
    Top = 410
    Width = 591
    ExplicitTop = 409
    ExplicitWidth = 591
    DesignSize = (
      591
      41)
    inherited BitBtn1: TBitBtn
      Left = 422
      Top = 12
      ExplicitLeft = 426
      ExplicitTop = 12
    end
    inherited BitBtn2: TBitBtn
      Left = 503
      Top = 12
      ExplicitLeft = 507
      ExplicitTop = 12
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 113
    Width = 591
    Height = 297
    Align = alClient
    Caption = 'SERVI'#199'OS'
    TabOrder = 1
    ExplicitHeight = 245
    object DBGrid1: TDBGrid
      Left = 2
      Top = 17
      Width = 587
      Height = 243
      Align = alClient
      DataSource = dsOrcamentoItem
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 381
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Width = 148
          Visible = True
        end>
    end
    object Panel4: TPanel
      Left = 2
      Top = 260
      Width = 587
      Height = 35
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 210
      ExplicitWidth = 591
      object Label7: TLabel
        Left = 389
        Top = 11
        Width = 77
        Height = 15
        Caption = 'VALOR TOTAL'
        FocusControl = DBEdit7
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BitBtn4: TBitBtn
        Left = 14
        Top = 5
        Width = 102
        Height = 25
        Caption = 'Novo Servi'#231'o'
        TabOrder = 0
        OnClick = BitBtn4Click
      end
      object btnAlteraServico: TBitBtn
        Left = 122
        Top = 5
        Width = 102
        Height = 25
        Caption = 'Alterar Servi'#231'o'
        TabOrder = 1
        OnClick = btnAlteraServicoClick
      end
      object BitBtn6: TBitBtn
        Left = 230
        Top = 6
        Width = 102
        Height = 25
        Caption = 'Excluir Servi'#231'o'
        TabOrder = 2
        OnClick = BitBtn6Click
      end
      object DBEdit7: TDBEdit
        Left = 472
        Top = 7
        Width = 108
        Height = 23
        Color = 8454143
        DataField = 'VALOR_TOTAL'
        DataSource = dsOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 591
    Height = 113
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 14
      Width = 11
      Height = 15
      Caption = 'ID'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 44
      Height = 15
      Caption = 'CLIENTE'
    end
    object Label3: TLabel
      Left = 90
      Top = 14
      Width = 91
      Height = 15
      Caption = 'DATA CADASTRO'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 201
      Top = 14
      Width = 81
      Height = 15
      Caption = 'DATA ENTREGA'
      FocusControl = deDataEntrega
    end
    object Label5: TLabel
      Left = 320
      Top = 14
      Width = 39
      Height = 15
      Caption = 'CARRO'
      FocusControl = DBEdit5
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 32
      Width = 66
      Height = 23
      Color = clBtnFace
      DataField = 'ID'
      DataSource = dsOrcamento
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 90
      Top = 32
      Width = 103
      Height = 23
      Color = clBtnFace
      DataField = 'DATA_CADASTRO'
      DataSource = dsOrcamento
      ReadOnly = True
      TabOrder = 1
    end
    object deDataEntrega: TDBEdit
      Left = 201
      Top = 32
      Width = 111
      Height = 23
      DataField = 'DATA_ENTREGA'
      DataSource = dsOrcamento
      MaxLength = 10
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 320
      Top = 32
      Width = 152
      Height = 23
      CharCase = ecUpperCase
      DataField = 'CARRO'
      DataSource = dsOrcamento
      TabOrder = 3
    end
    object DBCheckBox1: TDBCheckBox
      Left = 480
      Top = 35
      Width = 95
      Height = 17
      Caption = 'CONCLU'#205'DO'
      DataField = 'CONCLUIDO'
      DataSource = dsOrcamento
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 16
      Top = 83
      Width = 456
      Height = 23
      DataField = 'CLIENTE_ID'
      DataSource = dsOrcamento
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsListaClientes
      TabOrder = 5
    end
    object BitBtn3: TBitBtn
      Left = 480
      Top = 82
      Width = 100
      Height = 25
      Caption = 'Novo Cliente'
      TabOrder = 6
      OnClick = BitBtn3Click
    end
  end
  object dsOrcamento: TDataSource
    DataSet = dmOrcamento.qryOrcamentoCadastro
    Left = 352
    Top = 232
  end
  object dsListaClientes: TDataSource
    DataSet = dmClientes.qryListaClientes
    Left = 352
    Top = 296
  end
  object dsOrcamentoItem: TDataSource
    DataSet = dmOrcamento.qryOrcamentoItemCadastro
    Left = 456
    Top = 232
  end
end

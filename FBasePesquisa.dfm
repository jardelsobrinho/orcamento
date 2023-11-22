object frmBasePesquisa: TfrmBasePesquisa
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'BASE PESQUISA'
  ClientHeight = 418
  ClientWidth = 637
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  OnActivate = FormActivate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'NOME DO FORMULARIO AQUI'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 633
  end
  object Panel2: TPanel
    Left = 0
    Top = 377
    Width = 637
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 376
    ExplicitWidth = 633
    object BitBtn3: TBitBtn
      Left = 8
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = BitBtn3Click
    end
    object btnAlterar: TBitBtn
      Left = 89
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object BitBtn5: TBitBtn
      Left = 170
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BitBtn5Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 637
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 633
    object btnPesquisa: TBitBtn
      Left = 350
      Top = 16
      Width = 98
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 0
      OnClick = btnPesquisaClick
    end
    object BitBtn2: TBitBtn
      Left = 454
      Top = 16
      Width = 98
      Height = 25
      Caption = 'Limpar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object gridPesquisa: TDBGrid
    Left = 0
    Top = 89
    Width = 637
    Height = 288
    Align = alClient
    DataSource = dsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = gridPesquisaDblClick
  end
  object dsPesquisa: TDataSource
    Left = 312
    Top = 216
  end
end

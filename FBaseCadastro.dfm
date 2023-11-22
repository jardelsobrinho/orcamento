object frmBaseCadastro: TfrmBaseCadastro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmBaseCadastro'
  ClientHeight = 351
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 310
    Width = 551
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 309
    ExplicitWidth = 547
    DesignSize = (
      551
      41)
    object BitBtn1: TBitBtn
      Left = 384
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 465
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
end

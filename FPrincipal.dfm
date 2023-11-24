object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'OR'#199'AMENTO'
  ClientHeight = 621
  ClientWidth = 1146
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  WindowState = wsMaximized
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1146
    Height = 49
    Align = alTop
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 130
      Top = 1
      Width = 129
      Height = 47
      Align = alLeft
      Caption = 'CLIENTES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
      ExplicitLeft = 136
    end
    object SpeedButton2: TSpeedButton
      Left = 1
      Top = 1
      Width = 129
      Height = 47
      Align = alLeft
      Caption = 'OR'#199'AMENTOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton2Click
      ExplicitLeft = 0
      ExplicitTop = 16
      ExplicitHeight = 22
    end
  end
  object MainMenu1: TMainMenu
    Left = 360
    Top = 232
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object menuCliente: TMenuItem
        Caption = 'Clientes'
        OnClick = menuClienteClick
      end
      object menuOrcamento: TMenuItem
        Caption = 'Or'#231'amentos'
        OnClick = menuOrcamentoClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
  end
end

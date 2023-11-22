inherited frmClientePesquisa: TfrmClientePesquisa
  Caption = 'PESQUISA DE CLIENTES'
  ClientHeight = 457
  ClientWidth = 708
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 720
  ExplicitHeight = 495
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 708
    Caption = 'PESQUISA DE CLIENTES'
    ExplicitWidth = 704
  end
  inherited Panel2: TPanel
    Top = 416
    Width = 708
    ExplicitTop = 415
    ExplicitWidth = 704
  end
  inherited Panel3: TPanel
    Width = 708
    ExplicitLeft = 0
    object Label1: TLabel [0]
      Left = 12
      Top = 0
      Width = 106
      Height = 15
      Caption = 'Pesquisa por Nome:'
    end
    inherited btnPesquisa: TBitBtn
      Left = 342
      ExplicitLeft = 342
    end
    inherited BitBtn2: TBitBtn
      Left = 446
      ExplicitLeft = 446
    end
    object edPesquisa: TEdit
      Left = 12
      Top = 17
      Width = 324
      Height = 23
      TabOrder = 2
    end
  end
  inherited gridPesquisa: TDBGrid
    Width = 708
    Height = 327
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 385
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Visible = True
      end>
  end
  inherited dsPesquisa: TDataSource
    DataSet = dmClientes.qryClientesPesquisa
  end
end

object dmConexao: TdmConexao
  OnCreate = DataModuleCreate
  Height = 600
  Width = 800
  PixelsPerInch = 120
  object fdConexao: TFDConnection
    Params.Strings = (
      'Database=ORCAMENTO'
      'User_Name=SYSDBA'
      'Password=pmpsyfwr'
      'CharacterSet=WIN1252'
      'Protocol=TCPIP'
      'Server=localhost/3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Transaction = fdTransacao
    Left = 140
    Top = 30
  end
  object fdTransacao: TFDTransaction
    Connection = fdConexao
    Left = 140
    Top = 110
  end
end

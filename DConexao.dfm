object dmConexao: TdmConexao
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
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
    Left = 112
    Top = 24
  end
  object fdTransacao: TFDTransaction
    Connection = fdConexao
    Left = 112
    Top = 88
  end
end

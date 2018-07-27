object ServerDataModule: TServerDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 475
  Top = 159
  Height = 189
  Width = 292
  object ROMessage: TROBinMessage
    Left = 40
    Top = 8
  end
  object ROServer: TROIndyHTTPServer
    Active = False
    Dispatchers = <
      item
        Name = 'ROMessage'
        Message = ROMessage
        Enabled = True
      end>
    Left = 90
    Top = 8
  end
end

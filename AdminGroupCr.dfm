object FormAG: TFormAG
  Left = 0
  Top = 0
  Caption = 'Sistema Organizacional'
  ClientHeight = 246
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 472
    Height = 194
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 48
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 0
      Top = 94
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Edit1: TEdit
      Left = 0
      Top = 67
      Width = 219
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 0
      Top = 113
      Width = 219
      Height = 21
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 208
    Width = 472
    Height = 30
    TabOrder = 1
    object Confirmar: TButton
      Left = 311
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = ConfirmarClick
    end
    object Cancelar: TButton
      Left = 392
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = CancelarClick
    end
  end
end

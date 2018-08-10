object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Listener'
  ClientHeight = 345
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CZKEM1: TCZKEM
    Left = 352
    Top = 16
    Width = 33
    Height = 33
    TabOrder = 0
    ControlData = {000900006903000069030000}
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 225
    Height = 289
    Caption = 'Daftar IP Mesin'
    TabOrder = 1
    object MM_IP_masuk: TMemo
      Left = 8
      Top = 16
      Width = 209
      Height = 265
      TabOrder = 0
    end
  end
  object Status: TGroupBox
    Left = 256
    Top = 8
    Width = 313
    Height = 289
    Caption = 'Status'
    TabOrder = 2
    object lb_stat: TListBox
      Left = 8
      Top = 16
      Width = 300
      Height = 265
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 24
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 112
    Top = 304
    Width = 75
    Height = 25
    Caption = '&Disconnect'
    Enabled = False
    TabOrder = 4
    OnClick = Button2Click
  end
end

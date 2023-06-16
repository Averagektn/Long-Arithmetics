object Help: THelp
  Left = 0
  Top = 0
  Caption = 'Help'
  ClientHeight = 450
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mHelp: TMemo
    Left = 0
    Top = 0
    Width = 784
    Height = 450
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    HideSelection = False
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
end

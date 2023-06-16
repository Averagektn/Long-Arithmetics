object Hist: THist
  Left = 0
  Top = 0
  Caption = 'History'
  ClientHeight = 544
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lvHist: TListView
    Left = 0
    Top = 0
    Width = 1000
    Height = 544
    Align = alClient
    Columns = <
      item
        Caption = #8470
        Width = 40
      end
      item
        Alignment = taCenter
        Caption = '1 operand'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = 'Operation'
        Width = 90
      end
      item
        Alignment = taCenter
        Caption = '2 operand'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = '='
        Width = 30
      end
      item
        Caption = 'Result'
        Width = 100
      end
      item
        Caption = 'Notation'
        Width = 80
      end
      item
        Caption = 'Precession'
        Width = 90
      end
      item
        Caption = '1 length'
        Width = 70
      end
      item
        Caption = '2 length '
        Width = 80
      end
      item
        AutoSize = True
        Caption = 'Result length'
      end>
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    HideSelection = False
    ReadOnly = True
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
    ExplicitHeight = 522
  end
end

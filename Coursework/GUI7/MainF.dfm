object Main: TMain
  Left = 199
  Top = 169
  BorderStyle = bsSingle
  Caption = 'Main'
  ClientHeight = 500
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    984
    500)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 984
    Height = 23
    Align = alTop
    Alignment = taCenter
    Caption = 'THE BEST CALCULATOR IN THE WORLD!!!'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = 0
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 398
  end
  object Label2: TLabel
    Left = 276
    Top = 45
    Width = 69
    Height = 24
    Alignment = taCenter
    Caption = 'Notation'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 608
    Top = 45
    Width = 188
    Height = 24
    Alignment = taCenter
    Caption = 'Precession for division'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edtInput1: TEdit
    Left = 216
    Top = 140
    Width = 600
    Height = 24
    Alignment = taRightJustify
    Anchors = [akLeft]
    AutoSelect = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '0'
    OnChange = edtInput1Change
  end
  object edtInput2: TEdit
    Left = 216
    Top = 240
    Width = 600
    Height = 24
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '0'
    OnChange = edtInput2Change
  end
  object edtOutput: TEdit
    Left = 216
    Top = 340
    Width = 600
    Height = 24
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '0'
  end
  object btnEquals: TButton
    Left = 480
    Top = 293
    Width = 105
    Height = 25
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnEqualsClick
  end
  object rbtnAdd: TRadioButton
    Left = 216
    Top = 176
    Width = 100
    Height = 41
    Caption = '+'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TabStop = True
  end
  object rbtnSub: TRadioButton
    Left = 391
    Top = 176
    Width = 100
    Height = 41
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object rbtnMul: TRadioButton
    Left = 566
    Top = 176
    Width = 100
    Height = 41
    Caption = 'x'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object rbtnDiv: TRadioButton
    Left = 716
    Top = 176
    Width = 100
    Height = 41
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object btnHist: TButton
    Left = 464
    Top = 66
    Width = 75
    Height = 25
    Caption = 'History'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnHistClick
  end
  object btnExit: TButton
    Left = 510
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Exit'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = btnExitClick
  end
  object edtBase: TEdit
    Left = 256
    Top = 92
    Width = 121
    Height = 24
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 10
    Text = '10'
    OnChange = edtBaseChange
  end
  object btnClearInput1: TButton
    Left = 112
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Clear'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = btnClearInput1Click
  end
  object btnClearInput2: TButton
    Left = 112
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Clear'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = btnClearInput2Click
  end
  object edtPrec: TEdit
    Left = 640
    Top = 92
    Width = 121
    Height = 24
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 13
    Text = '1'
    OnChange = edtPrecChange
  end
  object btnInfo: TButton
    Left = 510
    Top = 393
    Width = 75
    Height = 25
    Caption = 'About'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
  end
end

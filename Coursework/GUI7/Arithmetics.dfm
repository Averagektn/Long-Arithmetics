object Main: TMain
  Left = 343
  Top = 231
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Arithmetics with long numbers'
  ClientHeight = 522
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object edtInput1: TEdit
    Left = 200
    Top = 140
    Width = 600
    Height = 32
    Align = alCustom
    Alignment = taRightJustify
    AutoSelect = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = ReturnColor
  end
  object edtInput2: TEdit
    Left = 200
    Top = 239
    Width = 600
    Height = 32
    Align = alCustom
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = ReturnColor
  end
  object edtOutput: TEdit
    Left = 200
    Top = 340
    Width = 600
    Height = 32
    Align = alCustom
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object btnEquals: TButton
    Left = 460
    Top = 290
    Width = 100
    Height = 25
    Align = alCustom
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = btnEqualsClick
  end
  object rbtnAdd: TRadioButton
    Left = 230
    Top = 190
    Width = 170
    Height = 25
    Align = alCustom
    Caption = '+'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    TabStop = True
  end
  object rbtnSub: TRadioButton
    Left = 400
    Top = 190
    Width = 170
    Height = 25
    Align = alCustom
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
  end
  object rbtnMul: TRadioButton
    Left = 570
    Top = 190
    Width = 170
    Height = 25
    Align = alCustom
    Caption = 'x'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
  end
  object rbtnDiv: TRadioButton
    Left = 740
    Top = 190
    Width = 170
    Height = 25
    Align = alCustom
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
  end
  object btnHist: TButton
    Left = 460
    Top = 57
    Width = 100
    Height = 34
    Align = alCustom
    Caption = 'History'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnHistClick
  end
  object btnExit: TButton
    Left = 460
    Top = 450
    Width = 100
    Height = 25
    Align = alCustom
    Caption = 'Exit'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = btnExitClick
  end
  object btnClearInput1: TButton
    Left = 95
    Top = 140
    Width = 75
    Height = 32
    Hint = 'Clear the first operand'
    Align = alCustom
    Caption = 'Clear'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnClearInput1Click
  end
  object btnClearInput2: TButton
    Left = 95
    Top = 237
    Width = 75
    Height = 37
    Hint = 'Clear the second operand'
    Align = alCustom
    Caption = 'Clear'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = btnClearInput2Click
  end
  object btnInfo: TButton
    Left = 460
    Top = 400
    Width = 100
    Height = 25
    Align = alCustom
    Caption = 'About'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = btnInfoClick
  end
  object btnCopyInput1: TButton
    Left = 830
    Top = 140
    Width = 75
    Height = 32
    Hint = 'Copy the first operand'
    Align = alCustom
    Caption = 'Copy'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = btnCopyInput1Click
  end
  object btnCopyInput2: TButton
    Left = 830
    Top = 238
    Width = 75
    Height = 34
    Hint = 'Copy the second operand'
    Align = alCustom
    Caption = 'Copy'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = btnCopyInput2Click
  end
  object btnCopyOutput: TButton
    Left = 830
    Top = 338
    Width = 75
    Height = 37
    Hint = 'Copy the result'
    Align = alCustom
    Caption = 'Copy'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = btnCopyOutputClick
  end
  object btnClearOutput: TButton
    Left = 95
    Top = 340
    Width = 75
    Height = 32
    Hint = 'Clear the result'
    Align = alCustom
    Caption = 'Clear'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btnClearOutputClick
  end
  object lbledtBase: TLabeledEdit
    Left = 200
    Top = 58
    Width = 121
    Height = 32
    Alignment = taCenter
    EditLabel.Width = 69
    EditLabel.Height = 24
    EditLabel.Caption = 'Notation'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -19
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 3
    Text = '10'
  end
  object lbledtPrec: TLabeledEdit
    Left = 679
    Top = 58
    Width = 121
    Height = 32
    Alignment = taCenter
    EditLabel.Width = 94
    EditLabel.Height = 24
    EditLabel.Caption = 'Precession'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -19
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 5
    Text = '0'
  end
  object txtdialInput: TOpenTextFileDialog
    Filter = 'Text files (.txt)|*.txt|Other|*'
    Left = 8
    Top = 144
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object Fi1: TMenuItem
      Caption = 'File'
      object menuLoad1Operand: TMenuItem
        Caption = 'Load 1 operand...'
        OnClick = menuLoad1OperandClick
      end
      object menuLoad2Operand: TMenuItem
        Caption = 'Load 2 operand...'
        OnClick = menuLoad2OperandClick
      end
      object menuSavehistoryasexceltable: TMenuItem
        Caption = 'Save history as excel table'
        OnClick = menuSavehistoryasexceltableClick
      end
    end
    object menuClearHistory: TMenuItem
      Caption = 'Clear history'
      OnClick = menuClearHistoryClick
    end
  end
end

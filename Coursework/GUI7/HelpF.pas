(* Help form. Uses Memo to represent the text of Help.txt *)
Unit HelpF;

Interface

// Libraries
Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

// Type declaration
Type
  THelp = Class(TForm)

    mHelp: TMemo;

    Procedure FormCreate(Sender: TObject);

  Private
    { Private declarations }
  Public
    { Public declarations }
  end;

// Global variables declaration
Var
  Help: THelp;
// Help - help form with text

Implementation

{$R *.dfm}

(* Showing text from file on the memo object *)
Procedure THelp.FormCreate(Sender: TObject);
begin
  try
    mHelp.Lines.LoadFromFile('Help.txt');
  except
    ShowMessage('Help file not found');
  end;
end;

end.

(* Calculation history. Uses ListView to show table of history*)
Unit HistF;

Interface

// Libraries
Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Grids, Vcl.ExtCtrls, Vcl.Menus;

// Types declaration
Type
  THist = Class(TForm)

    lvHist: TListView;

  Private
    { Private declarations }
  Public
    { Public declarations }
  end;

// Global variables declaration
Var
  Hist: THist;
// Hist - form for showing history

Implementation

{$R *.dfm}

end.

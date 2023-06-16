(* This program is developed for calculations with numbers of any length*)

{ Functions that program implements:
    1.  Addition.
    2.  Subtraction.
    3.  Multiplication.
    4.  Division with any precession.
    5.  Setting precession (from 0 to any number) and notation (from 2 to 36).
    6.  Entering data from the keyboard or reading from a text file.
    7.  Output of the result or the screen or by writing the entire expression
        to a text file.
    8.  Viewing the history of calculations.
    9.  Deleting history of calculations.
    10. Loading operands from file
    11. Saving calculations history as excel table }

// Main form for calculations
Unit Arithmetics;

Interface

// Libraries
Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ClipBrd, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ExtDlgs,
  Vcl.Buttons, ComObj, ActiveX;

// Type declaration
Type
  TS = String[255];
// TS - string for saving history

  TRec = Record
    S1,S2,SRes: TS;
    Operation,Eq: Char;
    Position,Precession,L1,L2,LRes,Ntn: Integer;
  end;
// Record that saves history

  Pt = ^Elem;
  Elem = Record
    Data: TRec;
    Next: Pt;
  end;
  // Queue

  TFile = File of TRec;
  // File for saving data

  TArray = Array of Integer;
  // Dynamic array

  TMain = Class(TForm)

    edtInput1: TEdit;
    edtInput2: TEdit;
    edtOutput: TEdit;

    lbledtBase: TLabeledEdit;
    lbledtPrec: TLabeledEdit;

    rbtnAdd: TRadioButton;
    rbtnSub: TRadioButton;
    rbtnMul: TRadioButton;
    rbtnDiv: TRadioButton;

    btnEquals: TButton;
    btnClearInput1: TButton;
    btnClearInput2: TButton;
    btnClearOutput: TButton;
    btnCopyInput1: TButton;
    btnCopyInput2: TButton;
    btnCopyOutput: TButton;
    btnInfo: TButton;
    btnHist: TButton;
    btnExit: TButton;
    txtdialInput: TOpenTextFileDialog;

    MainMenu1: TMainMenu;
    Fi1: TMenuItem;

    menuLoad1Operand: TMenuItem;
    menuLoad2Operand: TMenuItem;
    menuSavehistoryasexceltable: TMenuItem;
    menuClearHistory: TMenuItem;

    Procedure ReturnColor(Sender: TObject);

    Procedure btnEqualsClick(Sender: TObject);
    Procedure btnHistClick(Sender: TObject);
    Procedure btnExitClick(Sender: TObject);
    Procedure btnInfoClick(Sender: TObject);
    Procedure btnCopyInput1Click(Sender: TObject);
    Procedure btnCopyInput2Click(Sender: TObject);
    Procedure btnCopyOutputClick(Sender: TObject);
    Procedure btnClearInput1Click(Sender: TObject);
    Procedure btnClearInput2Click(Sender: TObject);
    Procedure btnClearOutputClick(Sender: TObject);

    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; var Action: TCloseAction);

    Procedure bbtnInput1Click(Sender: TObject);

    Procedure menuLoad1OperandClick(Sender: TObject);
    Procedure menuLoad2OperandClick(Sender: TObject);
    Procedure menuSavehistoryasexceltableClick(Sender: TObject);
    Procedure menuClearHistoryClick(Sender: TObject);

  Private
    { Private declarations }
  Public
    { Public declarations }
  end;

// Global variable declaration
Var
  Main: TMain;
  ListHist: Elem;
  First,Last: Pt;
  ExcelVisible: Boolean;
// Main - main class
// ListHist - record of current operation data
// First - pointer on the beginning of the queue
// Last - pointer of the end of the queue
// ExcelVisible - checking if an excel table already exists

Implementation

{$R *.dfm}

// Modules declaration
Uses
  HistF,HelpF;

(* Start of Input subprogram. Subprogram creates dynamic array that consists
   of the number in inverce form. Converts letters into numbers*)
// Str - beginning string
// Arr - array for input
// Notation - base of the counting system
// Flag - checking string for correct input

Procedure Input(Var Str: String; Var Arr: TArray; Const Notation: Integer;
                Var Flag: Boolean);

// Local variables declaration
Var
  Error,I: Integer;
// Error - check of input
// I - cycle iterator

begin

  // Initialisation of starting parameters
  Flag := true;
  setlength(Arr,length(Str));

  // If notation is less or equal then 10 then letters can not be added
  if Notation <= 10 then
  begin

    // Putting numbers from string to the array in the inverted form
    for I := 1 to length(Str) do
    begin
      val(Str[I],Arr[length(Str) - I],Error);

      // Checking if input is correct
      if Error <> 0 then
        Flag := false;

      // Checking if input is correct
      if Arr[length(Str) - I] >= Notation then
        Flag := false;
    end;
  end

  // If notation is more then 10 then letters can be added
  else

  begin

    // Putting numbers or letters as numbers from string to the array
    // in the inverted form
    for I := 1 to length(Str) do
    begin
      val(Str[I],Arr[length(Str) - I],Error);

      if Error <> 0 then

        // Converting letters into numbers for the integer array
        if (ord(Str[I]) - ord('A')) < (Notation - 10) then
        begin
          Arr[length(Str) - I] := 10 + ord(Str[I]) - ord('A');
        end

        else

        begin
          Flag := false;
        end;

    end;
  end;
end;
// End of the Input subprogram

(* Start of FindResLen subprogram. Subprogram counts lengths of the strings and
   finds the biggest length between them*)
// Str1,Str2 - Starting strings

Function FindResLen(Const Str1,Str2: String): Integer;
begin

  // Compareing strings
  // If first string length is bigger then the second one, length of the
  // first string is the searching result
  if length(Str1) > length(Str2) then
  begin
    Result := length(Str1)
  end

  //If the second string length is bigger or equat, length of the second string
  // is the searching result
  else

  begin
    Result := length(Str2);
  end;
end;
// End of FindResLen subprogram

(* Start of Convertion subprogram. Digits from array are being converted to
   string digits or letters depending on notation*)
// A - starting array
// Result - returnins string parameter

Function Convertion(Const A: TArray): String;

// Local variables declaration
Var
  I: Integer;
// I - cycle iterator

begin

  // Initializing result
  Result := '';

  (* Converting digits into chars. Convertion depends on
     the notation. If notation is bigger or equal than 10 then digits must be
     converted into letters*)
  for I := high(A) downto low(A) do
    if A[I] >= 10 then
    begin
      Result := Result + chr(A[I] - 10 + ord('A'));
    end

    else

    begin
      Result := Result + chr(A[I] + ord('0'));
    end;

end;
// End of the Convertion subprogram

(* Start of the DeleteZero subprogram. Subprogram delets zeros from the end
   of the array*)
// A - starting array

Procedure DeleteZero (Var A: TArray);

// Local variables declaration
Var
  I: Integer;
// I - cycle iterator

begin

  // Initializing starting parameters
  I := high(A);

  (* Cycle decrements I parameter to count the length of the array without
     zeros in the end*)
  while (A[I] = 0) and (I > 0) do
    Dec(I);

  // Setting new length
  setlength(A,I + 1);
end;
// End of the DeleteZero subprogram

(* Start of the ToExp subprogram. Subprogram converts numbers with length more
   then 255 to exponencial form to write it to file in full form*)
// S - starting string
// P - Precession

Procedure ToExp(Var S: String; Const P: Integer);

// Local variables declration
Var
  Tmp: String[245];
  I: Integer;
// Tmp - Saved part of the string
// I - detets zeros from the beginning of the number

begin

  // If string won't fit String[255] it will be converted into exponential form
  if length(S) > 255 then
  begin

    // Copying 245 symbols of the original string
    Tmp := S;

    // Deleteing minus from the beginning
    if Tmp[1] = '-' then
      delete(Tmp,1,1);

    // Deleteing the first number
    delete(Tmp,1,1);

    // If length of the oroginal string - precession = 2 and the second symbol
    // is dot
    if (length(S) - P = 2) and (S[2] = '.') then
    begin

      // Starting from the third symbol
      I := 3;

      // Counting zeros after the 3 symbol
      while S[I] = '0' do
        Inc(I);

      // Copying Symbols from the I position
      Tmp := copy(S,I,244);

      // Deleteing the first symbol
      delete(Tmp,1,1);

      // Convertion into exponential form
      S := S[I] + '.' + Tmp + ' E-' + IntToStr(I - 2);
    end

    else

    begin

      // If the first symbol of the original string is minus, it will be added
      if S[1] = '-' then
        S := S[1] + S[2] + '.' + Tmp + ' E' + IntToStr(length(S) - P - 2)
      else
        S := S[2] + '.' + Tmp + ' E' + IntToStr(length(S) - P - 2);
    end;
  end;
end;
// End of the ToExp subprogram

(* Start of the Summarise subprogram. The programm adds one number to another*)
// A - first number
// B - second number
// C - result
// Notation - base of the scale

Procedure Summarise(Const A,B: TArray; Var C: TArray; Const Notation: Integer);

// Local variables declaration
Var
  I,J,Temp: Integer;
// I,J - cycle iterators
// Temp - transfer to the higher digit

begin

  // Initialisation
  I := 0;
  Temp := 0;

  // Setting length of the result
  if length(A) > length(B) then
  begin
    setlength(C,length(A) + 1);
  end

  else

  begin
    setlength(C,length(B) + 1);
  end;

  // Adding first number to the second until one of them is over
  while (I <= high(A)) and (I <= high(B)) do
  begin
    C[I] := (Temp + A[I] + B[I]) mod Notation;
    Temp := (Temp + A[I] + B[I]) div Notation;
    Inc(I);
  end;

  // Adding 1 or 0 to higher digit
  C[I] := C[I] + Temp;

  // If the first number is bigger then the second, its higer digits are being
  // put to the result without adding
  for J := I to high(A) do
    C[J] := C[J] + A[J];

  // If the second number is bigger then the first, its higer digits are being
  // put to the result without adding
  for J := I to high(B) do
    C[J] := C[J] + B[J];

  // Deleting zeros from the beginning of the number
  DeleteZero(C);
end;
// End of the Summarise subprogram

(* Start of the Subtraction subprogram. Subprogram subtracts one number from
   another*)
// A - first number
// B - second number
// C - result
// Notation - base of the scale
// Sign - adding minus or not

Procedure Subtraction(Var A,B,C: TArray; Const Notation: Integer;
                      Var Sign: Boolean);

// Local variables declaration
Var
  I,J,Temp: Integer;
  Supp: TArray;
  StrA,StrB: String;
// I,J - cycle iterators
// Temp - borrowing from the higher digit
// Supp - swapping numbers if A < B
// StrA - string with first number
// StrB - string with the second number

begin

  // Initialization
  I := 0;
  Temp := 0;
  Sign := true;
  StrA := Convertion(A);
  StrB := Convertion(B);

  // Setting result length
  setlength(C,FindResLen(StrA,StrB));

  // Setting zeros to the result
  for J:=low(C) to high(C) do
    C[J] := 0;

  // Making the biggest of two numbers the first operand, finding the sign of
  // the result
  if (length(StrA) < length(StrB)) or ((length(StrA) = length(StrB))
     and (StrA < StrB)) then
  begin
    Supp := A;
    A := B;
    B := Supp;
    Sign := false;
  end;

  // Subtracting while the second number is not over
  while I <= high(B) do
  begin
    C[I] := A[I] - B[I] - Temp;
    Temp := 0;

    if C[I] < 0 then
    begin
      C[I] := C[I] + Notation;
      Temp := 1;
    end;

    Inc(I);
  end;

  // If A is longer, its unused digits will be taken into the result without
  // subracting
  for J := I to high(A) do
  begin
    C[J] := A[J] - Temp;
    Temp := 0;

    if C[J] < 0 then
    begin
      C[J] := C[J] + Notation;
      Temp := 1;
    end;
  end;

  // Deleting zeros from the beginning of the result
  DeleteZero(C);
end;
// End of the Subtraction subprogram

(*Start of the Multiply subprogram. Subprogram multiplies two numbers*)
// A - the first number
// B - the second number
// C - result
// Notation - base of the scale

Procedure Multiply(Const A,B: TArray; Var C: TArray; Const Notation: Integer);

// Local variables declaration
Var
  I,J,Temp: Integer;
// I,J - cycle iterators
// Temp - multilication of digits result

begin

  // Setting the result length
  setlength(C,length(A) + length(B));

  // Making all the elements zeros
  for J:=low(C) to high(C) do
    C[J] := 0;

  // Multiplying two numbers
  for I := low(A) to high(A) do
    for J := low(B) to high(B) do
    begin
      Temp := A[I] * B[J];

      // Currend digit
      C[I + J] := Temp mod Notation + C[I + J];

      // Moving to the higher digit
      C[I + J + 1] := Temp div Notation + C[I + J + 1];
    end;

  // Rediction to Notation
  for J := low(C) to high(C) do
    if C[J] >= Notation then
    begin
      C[J + 1] := C[J + 1] + C[J] div Notation;
      C[J] := C[J] mod Notation
    end;

  // Deleting zeros from the beginning of the result
  DeleteZero(C);
end;
// End of Multiplication subprogram

(* Start of the DivFrac subprogram. Subprogram calculates fractional part of
   the number until the precession is reached*)
  // A - first number
  // B - second number
  // C - result
  // Notation - base of the scale
  // Acc - accuracy entered by user

Procedure DivFrac(Var A,B,C: TArray; Const Notation,Acc: Integer);

// Local variables declaration
Var
  I,K: Integer;
  AC,Ten,Save: TArray;
  Flag: Boolean;
// I - current digit of the result
// K - cycle iterator
// AC - copy of the A array
// Ten - multiplication by 10
// Save - copy of the B array
// Flag - sign while subtracting

begin

  // Initialization
  Setlength(Ten,2);
  Ten[low(Ten)] := 0;
  Ten[high(Ten)] := 1;

  // Counting until accuracy is reached
  for K := 1 to Acc do
  begin

    // Copying B array
    Save := B;

    // Setting new length
    setlength(AC,length(B) + 1);

    // Multiplying by 10 - moving to the higher digit the whole number
    Multiply(A,Ten,AC,Notation);
    I := 0;

    // Setting new length of the A array
    setlength(A,length(AC));

    // Subtracting until AC is less then Save. Counting the current digit
    repeat
      Subtraction(AC,Save,A,Notation,Flag);
      setlength(AC,length(A));
      AC := A;
      Inc(I);
    until (I = Notation) or (not Flag);

    // Return second number copy back
    Save := B;

    // Subtracting
    Subtraction(AC,Save,A,Notation,Flag);

    // Adding to the result new digit
    C[Acc - K] := I - 1;
  end;
end;
// End of the DivFlac subprogram

(* Start of the Division subprogram.*)
// A - first number
// B - second number
// C - result
// D - fractional part of the number
// Notation - base of the scale
// P - precession

Procedure Division(Var A,B,C,D: TArray; Const Notation,P: Integer);

// Local variables declaration
Var
  I,J,Shift: Integer;
  Mul,AC,Sub,Digit: TArray;
  S1,S2: String;
  Flag: Boolean;
// I - current digit
// J - cycle iterator
// Shift - difference between lengthses of numbers
// Mul - multiplacation result
// AC - copy of the A array
// Sub - subtraction of AC and Mul
// Digit - current digit of the result number
// S1 - string variant of A array
// S2 - string variant of B array
// Flag - sign of the result of subtraction

begin

  // Setting new lengthes of the result arrays
  setlength(D,P);
  setlength(AC,length(A));

  // Creadting string variants of the operands
  S1 := Convertion(A);
  S2 := Convertion(B);

  // Setting subtraction result length
  setlength(Sub,FindResLen(S1,S2));

  // Checking is C array in not zero. If the first number is less then the
  // second, result will be only of fractional part
  if ((length(S1) = length(S2)) and (S1 >= S2)) or (length(S1) > length(S2)) then
  begin

    // Counting differences in lengths of operands
    Shift := length(A) - length(B);

    // Setting the result length
    setlength(C,Shift + 1);

    // Making the result array 0
    for I := low(C) to high(C) do
      C[I] := 0;

    // Setting length for the division result
    setlength(Digit,Shift + 1);

    // Making calculations
    while Shift >= 0 do
    begin
      I := 0;

      repeat

        // Saving A array
        AC := A;

        // Setting Digit array 0
        for J := low(Digit) to high(Digit) do
          Digit[J] := 0;

        // I - result of the division
        Digit[Shift] := I;
        Multiply(B,Digit,Mul,Notation);
        Subtraction(AC,Mul,Sub,Notation,Flag);

        Inc(I);
      until (not Flag) or (I > Notation);

      // Filling it the result
      C[Shift] := I - 2;
      Digit[Shift] := I - 2;

      // If it is not possible to divide, 0 will be written into the result
      // array
      if (length(Mul) = 1) and (Mul[low(Mul)] = 0) then
      begin
        C[Shift] := 0;
        Digit[Shift] := 0;
      end;

      // Making new numerator
      Multiply(B,Digit,Mul,Notation);
      Subtraction(A,Mul,AC,Notation,Flag);

      // Setting new numerator
      A := AC;
      Dec(Shift);
    end;

    // Counting fractional part
    DivFrac(A,B,D,Notation,P);
  end

  else

  begin

    // Counting fractional part. C array is 0
    setlength(C,1);
    C[low(C)] := 0;
    DivFrac(A,B,D,Notation,P);
  end;

  // Deleting zeros from the beginning
  DeleteZero(C);
end;
// End of the Division subprogram

(* Start of the Push subprogram. Adding new element to the Queue*)
// X - first element of the queue
// Y - last element of the queue
// R - data

Procedure Push (Var X,Y: Pt; Const R: TRec);

// Local variables declaration
Var
  PTmp: Pt;
// PTmp - new element of the queue

begin

  // Initialization
  new(PTmp);
  PTmp^.data := R;
  PTmp^.next := nil;

  // If queue is empty, it will be created
  if X = nil then
  begin
    X := PTmp;
  end

  else

  begin
    Y^.next := PTmp;
  end;

  // Adding element
  Y := PTmp;
end;

// End of the Push subprogram

(* Start of the PopFile subprogram. Subprogram writes data to file from queue*)

Procedure PopFile (X: Pt);

// Local variables declaration
Var
  F: TFile;
// Current file

begin

  // Assigning file, setting file mode
  AssignFile(F,'Computations');
  Rewrite(F);

  // Writing queue elements to file
  while X <> nil do
  begin
    write(F,X^.data);
    X := X^.next;
  end;

  // Saving changes
  CloseFile(F);
end;
// End of PopFile subprogram

(* Start of the ReadFile subprogram. Subprogram pushes elements from file to
   queue*)
// Name - Name of the file

Procedure ReadFile (Const Name: String);

// Local variables declaration
Var
  F: File of TRec;
  Tmp: TRec;
// F - current file
// Tmp - current record

begin

  // Assigning file, setting file mode
  AssignFile(F,Name);
  Reset(F);

  // Pushing elements to the queue
  while not EoF(F) do
  begin
    Read(F,Tmp);
    Push(First,Last,Tmp);
  end;

  // Saving changes
  CloseFile(F);
end;
// End of ReadFile subprogram

(* Start of CheckInput subprogram. Subprogram checks input of base*)
// Param - checking parameter

Procedure CheckInput(Var Param: Integer);
Const
  MinNtn = 2;
  MaxNtn = 36;
begin

  // Checking data
  if (Param < MinNtn) or (Param > MaxNtn) then
    Param := 10;
end;
// End of Checkinput subprogram

(* When form is created, file Computations is read *)
Procedure TMain.FormCreate(Sender: TObject);
begin
  ReadFile('Computations');
end;

(* Loading first operand from file *)

Procedure TMain.menuLoad1OperandClick(Sender: TObject);

// Local variables declaration
Var
  Num,Name: String;
  F: TextFile;
// Num - number in file
// Name - name of the file
// F - file itself

begin

  // Loading data from file to edit field
  if txtdialInput.Execute then
  begin
    Name := txtdialInput.FileName;
    AssignFile(F,Name);
    Reset(F);
    read(F,Num);
    edtInput1.Text := Num;
    CloseFile(F);
  end;
end;

(* Loading second operand from file*)

Procedure TMain.menuLoad2OperandClick(Sender: TObject);

// Local variables declaration
Var
  Num,Name: String;
  F: TextFile;
// Num - number in file
// Name - name of the file
// F - file itself

begin

  // Loading data from file to edit field
  if txtdialInput.Execute then
  begin
    Name := txtdialInput.FileName;
    AssignFile(F,Name);
    Reset(F);
    read(F,Num);
    edtInput2.Text := Num;
    CloseFile(F);
  end;
end;

(* Saving history in excel *)

Procedure TMain.menuSavehistoryasexceltableClick(Sender: TObject);

// Local variables declaration
Var
  ExcelApp,ExcelSheet: OleVariant;
  X: Pt;
  Raw,Col: Integer;
// ExcelApp - excel appliation
// ExcelSheet - field to fill
// X - copy of queue pointer
// Raw - current raw
// Col - current column

begin

  // If excel is already visible, an error will be shown
  if not ExcelVisible then
  begin
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Visible := True;
    ExcelVisible := true;
  end;

  // Creating field to fill
  ExcelApp.Workbooks.Add(1);
  ExcelApp.Workbooks[1].WorkSheets[1].Name:='History';
  ExcelSheet:=ExcelApp.Workbooks[1].WorkSheets['History'];

  // Initialization
  X := First;
  Raw := 1;
  Col := 1;

  // Creating table header
  ExcelSheet.Cells[Raw,Col] := '¹';
  Inc(Col);
  ExcelSheet.Cells[Raw,Col] := '1 operand';
  Inc(Col);
  ExcelSheet.Cells[Raw,Col] := 'Operation';
  Inc(Col);
  ExcelSheet.Cells[Raw,Col] := '2 operand';
  Inc(Col);
  ExcelSheet.Cells[Raw,Col] := '=';
  Inc(Col);
  ExcelSheet.Cells[Raw,Col] := 'Result';
  Inc(Col);
  ExcelSheet.Cells[Raw,Col] := 'Notation';
  Inc(Col);
  ExcelSheet.Cells[Raw,Col] := 'Precession';
  Inc(Col);
  ExcelSheet.Cells[Raw,Col] := '1 length';
  Inc(Col);
  ExcelSheet.Cells[Raw,Col] := '2 length';
  Inc(Col);
  ExcelSheet.Cells[Raw,Col] := 'Result length';

  Inc(Raw);
  Col := 1;

  // Filling in table elements
  while X <> nil do
  begin
    with X^.Data do
    begin
      ExcelSheet.Cells[Raw,Col] := Position;
      Inc(Col);
      ExcelSheet.Cells[Raw,Col] := S1;
      Inc(Col);
      ExcelSheet.Cells[Raw,Col] := Operation;
      Inc(Col);
      ExcelSheet.Cells[Raw,Col] := S2;
      Inc(Col);
      ExcelSheet.Cells[Raw,Col] := Eq;
      Inc(Col);
      ExcelSheet.Cells[Raw,Col] := SRes;
      Inc(Col);
      ExcelSheet.Cells[Raw,Col] := Ntn;
      Inc(Col);
      ExcelSheet.Cells[Raw,Col] := Precession;
      Inc(Col);
      ExcelSheet.Cells[Raw,Col] := L1;
      Inc(Col);
      ExcelSheet.Cells[Raw,Col] := L2;
      Inc(Col);
      ExcelSheet.Cells[Raw,Col] := LRes;
      Col := 1;
      Inc(Raw);
      X := X^.Next;
    end;
  end;

end;

(* Button History work logic *)
Procedure TMain.btnHistClick(Sender: TObject);

// Local variables declaration
Var
  Item: TListItem;
  X: Pt;
// Item - element of ListView
// X - copy of the queue start pointer

begin

  // Makiing ListView empty
  Hist.lvHist.Clear;

  // Copying pointer on the queue beginning
  X := First;

  // Ading elements from queue to ListView
  while X <> nil do
  begin
    Item := Hist.lvHist.Items.Add;

    with X^.Data do
    begin
      Item.Caption := IntToStr(Position);
      Item.SubItems.Add(S1);
      Item.SubItems.Add(Operation);
      Item.SubItems.Add(S2);
      Item.SubItems.Add(Eq);
      Item.SubItems.Add(SRes);
      Item.SubItems.Add(IntToStr(Ntn));
      Item.SubItems.Add(IntToStr(Precession));
      Item.SubItems.Add(IntToStr(L1));
      Item.SubItems.Add(IntToStr(L2));
      Item.SubItems.Add(IntToStr(LRes));
    end;

    // Move to the next element of the queue
    X := X^.Next;
  end;

  // Showing Hist form
  Hist.ShowModal;
end;

(* Button About logic*)

Procedure TMain.btnInfoClick(Sender: TObject);
begin

  // Showing Help form
  Help.ShowModal;
end;

(* Clearing history *)

Procedure TMain.menuClearHistoryClick(Sender: TObject);

// Local variables declaration
Var
  F: TFile;
// F - file to clear

begin

  // Deleting queue
  First := nil;
  Last := nil;

  // Deleting ListView data
  Hist.lvHist.Clear;

  // Deleting information that was saved in file
  AssignFile(F,'Computations');
  Rewrite(F);
  CloseFile(F);
end;

(* = button logic. Makes calculations, checks data*)

Procedure TMain.btnEqualsClick(Sender: TObject);

// Local variables declaration
Var
  Op1,Op2,Res: String;
  ZF,Flag,Op1Sign,Op2Sign: Boolean;
  ArrA,ArrB,ArrC,ArrD: TArray;
  Base,Prec: Integer;
  Rec: TRec;
// Op1 - first number in string form
// Op2 - second number in string form
// ZF - zero flag
// Flag - sign for subtaction
// Op1Sign - check in first number is correct
// Op2Sign - check if second number is correct
// ArrA - first number in array
// ArrB - second number in array
// Arrc - result in array
// ArrD - fractional part of the number in array
// Base - corrent notation
// Prec - precession for division
// Rec - current record of data for calculations history

begin

  // Return colors
  edtInput1.Color := clWindow;
  edtInput2.Color := clWindow;

  // Set starting data if the field is empty
  if lbledtBase.Text = '' then
    lbledtBase.Text := '10';

  if lbledtPrec.Text = '' then
    lbledtPrec.Text := '0';

  if edtInput1.Text = '' then
    edtInput1.Text := '0';

  if edtInput2.Text = '' then
    edtInput2.Text := '0';

  // Clering the result field
  edtOutput.Text := '';

  // Initialization
  Op1Sign := true;
  Op2Sign := true;
  ZF := true;
  Flag := true;

  // Checkin input
  Prec := StrToInt(lbledtPrec.Text);
  Base := StrToInt(lbledtBase.Text);
  CheckInput(Base);
  lbledtBase.Text := IntToStr(Base);

  // Filling in strings that store numbers
  Op1 := edtInput1.Text;
  Op2 := edtInput2.Text;

  // Converiong string into array. Checking input
  Input(Op1,ArrA,Base,Op1Sign);
  Input(Op2,ArrB,Base,Op2Sign);

  // Deleting zeros from the beginning of the arrays
  DeleteZero(ArrA);
  DeleteZero(ArrB);

  // In numbers are correct, making calculations. If not, showing error message
  // and highlight incorrect field
  if Op1Sign and Op2Sign then
  begin

    // Choosing operation depending on the round buttons
    if rbtnAdd.Checked then
    begin

      // Setting res = 0
      Res := '';

      // Precession is 0 for all operations except division
      Rec.Precession := 0;

      // Filling in an operation sign
      Rec.Operation := '+';

      // Adding
      Summarise(ArrA,ArrB,ArrC,Base);

      // Filling in the result
      Res := Res + Convertion(ArrC);

      // Showing the result
      edtOutput.Text := Res;
    end;

    if rbtnSub.Checked then
    begin

      // Setting res = 0
      Res := '';

      // Precession is 0 for all operations except division
      Rec.Precession := 0;

      // Filling in an operation sign
      Rec.Operation := '-';

      // Making calculations
      Subtraction(ArrA,ArrB,ArrC,Base,Flag);

      // Adding sign in the beginning if A < B
      if not Flag then
        Res := '-';

      // Filling in the result
      Res := Res + Convertion(ArrC);

      // Showing the result
      edtOutput.Text := Res;
    end;

    if rbtnMul.Checked then
    begin

      // Setting res = 0
      Res := '';

      // Precession is 0 for all operations except division
      Rec.Precession := 0;

      // Filling in an operation sign
      Rec.Operation := '*';

      // Making calculations
      Multiply(ArrA,ArrB,ArrC,Base);

      // Filling in the result
      Res := Res + Convertion(ArrC);

      // Showing the result
      edtOutput.Text := Res;
    end;

    if rbtnDiv.Checked then
    begin

      // Setting res = 0
      Res := '';

      // Saving precession that was entered by the user
      Rec.Precession := Prec;

      // Filling in an operation sign
      Rec.Operation := '/';

      // If the second number is 0, showing and error of division by 0
      if ArrB[high(ArrB)] = 0 then
      begin
        edtInput2.Color := clRed;
        ShowMessage('Division by zero');

        // Zero flag
        ZF := false;
      end

      else

      begin

        // Making calculations
        Division(ArrA,ArrB,ArrC,ArrD,Base,Prec);

        // Filling in the result
        Res := Res + Convertion(ArrC);

        // If precession > 0 then there is a fractional part of the number
        if Prec > 0 then
        begin

          // Adding dot
          Res := Res + '.';

          // Adding fractional part
          Res := Res + Convertion(ArrD);
        end;

        // Showing the result
        edtOutput.Text := Res;
      end;
    end;

    // Filling in the current operation history record
    with Rec do
    begin
      L1 := length(Op1);
      L2 := length(Op2);
      LRes := length(Res);

      // If precession <> 0, dot in not a part of number length
      if Prec <> 0 then
        Dec(LRes);

      // Minus in not a part of number length
      if not Flag then
        Dec(LRes);
    end;

    // Converiong operands into exponencial form is they ale too long
    ToExp(Op1,Prec);
    ToExp(Op2,Prec);
    ToExp(Res,Prec);

    // Filling in the current operation history record
    with Rec do
    begin
      S1 := Op1;
      S2 := Op2;
      SRes := Res;
      Eq := '=';
      Ntn := Base;
    end;

    // Counting current number of operation
    if First = nil then
    begin
      Rec.Position := 1;
    end

    else

    begin
      Rec.Position := Last^.Data.Position + 1;
    end;

    // If there was no zero divsion, add data to history
    if ZF then
      Push(First,Last,Rec);
  end

  else

  begin

    // Showing error messages
    if not Op1Sign then
    begin

      // Painting an incorrect operand
      edtInput1.Color := clRed;
      ShowMessage('Incorrect data in the first operand');
    end;

    if not Op2Sign then
    begin

      // Painting an ibcorrect operand
      edtInput2.Color := clRed;
      ShowMessage('Incorrect data in the second operand');
    end;
  end;
end;

procedure TMain.bbtnInput1Click(Sender: TObject);
begin
end;

(* Clear buttons logic *)

Procedure TMain.btnClearInput1Click(Sender: TObject);
begin
  edtInput1.Text := '';
end;

Procedure TMain.btnClearInput2Click(Sender: TObject);
begin
  edtInput2.Text := '';
end;

Procedure TMain.btnClearOutputClick(Sender: TObject);
begin
  edtOutput.Text := '';
end;

(* Copy buttons logic *)
Procedure TMain.btnCopyInput1Click(Sender: TObject);
begin
  Clipboard.AsText := edtInput1.Text;
end;

Procedure TMain.btnCopyInput2Click(Sender: TObject);
begin
  Clipboard.AsText := edtInput2.Text;
end;

Procedure TMain.btnCopyOutputClick(Sender: TObject);
begin
  Clipboard.AsText := edtOutput.Text;
end;

(* Set color from red to window color *)
Procedure TMain.ReturnColor(Sender: TObject);
Var
  Edit: TEdit;
begin
  if not(Sender is TEdit) then
    Exit;

  Edit := TEdit(Sender);
  Edit.Color := clWindow;
end;

(* Saving history from queue to file *)
Procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PopFile(First);
end;

(* Exit button work logic *)
Procedure TMain.btnExitClick(Sender: TObject);
begin
  Main.Close;
end;

end.

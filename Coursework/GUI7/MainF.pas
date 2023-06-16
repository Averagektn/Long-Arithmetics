unit MainF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TMain = class(TForm)
    edtInput1: TEdit;
    Label1: TLabel;
    edtInput2: TEdit;
    edtOutput: TEdit;
    btnEquals: TButton;
    rbtnAdd: TRadioButton;
    rbtnSub: TRadioButton;
    rbtnMul: TRadioButton;
    rbtnDiv: TRadioButton;
    btnHist: TButton;
    btnExit: TButton;
    edtBase: TEdit;
    btnClearInput1: TButton;
    btnClearInput2: TButton;
    edtPrec: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnInfo: TButton;
    procedure btnEqualsClick(Sender: TObject);
    procedure edtInput1Change(Sender: TObject);
    procedure edtInput2Change(Sender: TObject);
    procedure edtBaseChange(Sender: TObject);
    procedure btnHistClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnClearInput1Click(Sender: TObject);
    procedure btnClearInput2Click(Sender: TObject);
    procedure edtPrecChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TArray = Array of Integer;

var
  Main: TMain;
  Op1,Op2,Res: String;
  Base,Prec: Integer;
  Flag: Boolean;
  ArrA,ArrB,ArrC,ArrD: TArray;

implementation

{$R *.dfm}
{$I Process.pas}
{$I Sum.pas}
{$I Sub.pas}
{$I Mul.pas}
{$I DivNum.pas}

procedure TMain.btnExitClick(Sender: TObject);
begin
  Main.Close;
end;

procedure TMain.btnHistClick(Sender: TObject);
begin
  ShowMessage('SUCK MY COCK');
end;

procedure TMain.btnClearInput1Click(Sender: TObject);
begin
  edtInput1.Text := '';
end;

procedure TMain.btnClearInput2Click(Sender: TObject);
begin
  edtInput2.Text := '';
end;

procedure TMain.edtBaseChange(Sender: TObject);
begin
  if edtBase.Text = '' then
    edtBase.Text := '10';
  Base := StrToInt(edtBase.Text);
end;

procedure TMain.edtInput1Change(Sender: TObject);
begin
  if edtInput1.Text = '' then
    edtInput1.Text := '0';
end;

procedure TMain.edtInput2Change(Sender: TObject);
begin
  if edtInput2.Text = '' then
    edtInput2.Text := '0';
end;

procedure TMain.edtPrecChange(Sender: TObject);
begin
  if edtPrec.Text = '' then
    edtPrec.Text := '1';
  Prec := StrToInt(edtPrec.Text);
end;

procedure TMain.btnEqualsClick(Sender: TObject);
begin

  CheckInput(Base);
  edtBase.Text := '10';
  Op1 := edtInput1.Text;
  Op2 := edtInput2.Text;
  edtOutput.Text := '';
  Input(Op1,ArrA,Base);
  Input(Op2,ArrB,Base);

  if rbtnAdd.Checked then
  begin
    Summarise(ArrA,ArrB,ArrC,Base);
    Res := Res + Convertion(ArrC);
    edtOutput.Text := Res;
    Res := '';
  end;

  if rbtnSub.Checked then
  begin
    Subtraction(ArrA,ArrB,ArrC,Base,Flag);
    if not Flag then
      Res := '-';
    Res := Res + Convertion(ArrC);
    edtOutput.Text := Res;
    Res := '';
  end;

  if rbtnMul.Checked then
  begin
    Multiply(ArrA,ArrB,ArrC,Base);
    Res := Res + Convertion(ArrC);
    edtOutput.Text := Res;
    Res := '';
  end;

  if rbtnDiv.Checked then
  begin
    Division(ArrA,ArrB,ArrC,ArrD,Base,Prec);
    Res := Res + Convertion(ArrC);
    if Prec > 0 then
    begin
      Res := Res + '.';
      Res := Res + Convertion(ArrD);
    end;
    edtOutput.Text := Res;
    Res := '';
  end;

end;

end.

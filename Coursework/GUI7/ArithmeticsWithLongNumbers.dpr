program ArithmeticsWithLongNumbers;

uses
  Forms,
  Arithmetics in 'Arithmetics.pas' {Main},
  HelpF in '..\GUI7\HelpF.pas' {Help},
  HistF in '..\GUI7\HistF.pas' {Hist};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(THelp, Help);
  Application.CreateForm(THist, Hist);
  Application.Run;
end.

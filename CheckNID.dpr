program CheckNID;

uses
  Vcl.Forms,
  NIDCheck in 'NIDCheck.pas' {Form7},
  checktinpinservice in 'checktinpinservice.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.

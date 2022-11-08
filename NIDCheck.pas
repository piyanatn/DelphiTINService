unit NIDCheck;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Soap.InvokeRegistry,
  System.Net.URLClient, Vcl.StdCtrls, Vcl.ExtCtrls, Soap.Rio,
  Soap.SOAPHTTPClient;

type
  TForm7 = class(TForm)
    HTTPRIO1: THTTPRIO;
    NID: TLabeledEdit;
    Memo1: TMemo;
    BtnCheck: TButton;
    procedure BtnCheckClick(Sender: TObject);
  
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation
uses  checktinpinservice,System.JSON;
{$R *.dfm}



procedure TForm7.BtnCheckClick(Sender: TObject);
var
  RDNID : checktinpinserviceSoap;
  JsonValue: TJSonValue ;
  JSONString : String;
  myarr: TJSONArray;
  IsExist: string;
  ErrMessage : String;
begin

  try
    JSONString := (HTTPRIO1 as checktinpinserviceSoap).ServiceTIN('anonymous','anonymous',NID.Text);
    Memo1.Clear;
    Memo1.Lines.Add(JSONString);
    JsonValue := TJSonObject.ParseJSONValue(JSONString);

      if JsonValue.TryGetValue('IsExist', myarr) and (myarr.Count > 0) then
      begin
            IsExist := myarr.Items[0].ToString;
            if IsExist = 'Yes' then
              showmessage('พบบัตรประชาชน');
      end;

      if JsonValue.TryGetValue('MessageErr', myarr) and (myarr.Count > 0) then
      begin
            ErrMessage := myarr.Items[0].ToString;
            ErrMessage := StringReplace(ErrMessage,'<br> Data not found <br> => \"','',[rfReplaceAll, rfIgnoreCase]);
            ErrMessage := StringReplace(ErrMessage,'\"','',[rfReplaceAll, rfIgnoreCase]);
            showmessage(ErrMessage);
      end;

  Except
    on E : Exception do
      begin
        MessageDlg(E.Message,mtError,[MbOK],0);

      end;

  end;

end;

end.



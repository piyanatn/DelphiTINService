// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://rdws.rd.go.th/jsonRD/checktinpinservice.asmx?WSDL
//  >Import : https://rdws.rd.go.th/jsonRD/checktinpinservice.asmx?WSDL>0
// Encoding : utf-8
// Version  : 1.0
// (02/11/2022 10:34:52 AM - - $Rev: 96726 $)
// ************************************************************************ //

unit checktinpinservice;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]


  ArrayOfString = array of string;              { "https://rdws.rd.go.th/JserviceRD3/checktinpinservice"[GblCplx] }

  // ************************************************************************ //
  // Namespace : https://rdws.rd.go.th/JserviceRD3/checktinpinservice
  // soapAction: https://rdws.rd.go.th/JserviceRD3/checktinpinservice/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : checktinpinserviceSoap
  // service   : checktinpinservice
  // port      : checktinpinserviceSoap
  // URL       : https://rdws.rd.go.th/jsonRD/checktinpinservice.asmx
  // ************************************************************************ //
  checktinpinserviceSoap = interface(IInvokable)
  ['{0157489C-C17A-49F6-686A-3B0451B3B36D}']
    function  ServiceTIN(const username: string; const password: string; const TIN: string): string; stdcall;
    function  ServiceTINArr(const username: string; const password: string; const TINs: ArrayOfString): string; stdcall;
  end;

function GetchecktinpinserviceSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): checktinpinserviceSoap;


implementation
  uses System.SysUtils;

function GetchecktinpinserviceSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): checktinpinserviceSoap;
const
  defWSDL = 'https://rdws.rd.go.th/jsonRD/checktinpinservice.asmx?WSDL';
  defURL  = 'https://rdws.rd.go.th/jsonRD/checktinpinservice.asmx';
  defSvc  = 'checktinpinservice';
  defPrt  = 'checktinpinserviceSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as checktinpinserviceSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { checktinpinserviceSoap }
  InvRegistry.RegisterInterface(TypeInfo(checktinpinserviceSoap), 'https://rdws.rd.go.th/JserviceRD3/checktinpinservice', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(checktinpinserviceSoap), 'https://rdws.rd.go.th/JserviceRD3/checktinpinservice/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(checktinpinserviceSoap), ioDocument);
  { checktinpinserviceSoap.ServiceTIN }
  InvRegistry.RegisterMethodInfo(TypeInfo(checktinpinserviceSoap), 'ServiceTIN', '',
                                 '[ReturnName="ServiceTINResult"]', IS_OPTN);
  { checktinpinserviceSoap.ServiceTINArr }
  InvRegistry.RegisterMethodInfo(TypeInfo(checktinpinserviceSoap), 'ServiceTINArr', '',
                                 '[ReturnName="ServiceTINArrResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(checktinpinserviceSoap), 'ServiceTINArr', 'TINs', '',
                                '[ArrayItemName="string"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfString), 'https://rdws.rd.go.th/JserviceRD3/checktinpinservice', 'ArrayOfString');

end.
object Form7: TForm7
  Left = 0
  Top = 0
  Caption = #3605#3619#3623#3592#3626#3629#3610#3648#3621#3586#3612#3641#3657#3648#3626#3637#3618#3616#3634#3625#3637
  ClientHeight = 184
  ClientWidth = 295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object NID: TLabeledEdit
    Left = 8
    Top = 32
    Width = 121
    Height = 21
    EditLabel.Width = 70
    EditLabel.Height = 13
    EditLabel.Caption = #3648#3621#3586#3607#3637#3656#3612#3641#3657#3648#3626#3637#3618#3616#3634#3625#3637
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 8
    Top = 59
    Width = 273
    Height = 118
    TabOrder = 1
  end
  object BtnCheck: TButton
    Left = 144
    Top = 28
    Width = 75
    Height = 25
    Caption = 'Check'
    TabOrder = 2
    OnClick = BtnCheckClick
  end
  object HTTPRIO1: THTTPRIO
    WSDLLocation = 'https://rdws.rd.go.th/jsonRD/checktinpinservice.asmx?wsdl'
    Service = 'checktinpinservice'
    Port = 'checktinpinserviceSoap'
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 216
    Top = 104
  end
end

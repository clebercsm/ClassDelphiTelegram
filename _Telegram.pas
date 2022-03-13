unit _Telegram;

interface

uses
  REST.Types, REST.Client;

type
  T_Telegram = class
  private
    RESTClient   : TRESTClient;
    RESTRequest  : TRESTRequest;
    RESTResponse : TRESTResponse;
  public
    function SendMessage(vTo, vMessage: String): String;
    constructor Create (vToken: String);
    destructor Destroy;
  end;

implementation

{ T_Telegram }

constructor T_Telegram.Create(vToken: String);
begin

  RESTClient := TRESTClient.Create('https://api.telegram.org/bot' + vToken);
  RESTRequest := TRESTRequest.Create(nil);
  RESTResponse := TRESTResponse.Create(nil);

  RESTRequest.Client   := RESTClient;
  RESTRequest.Response := RESTResponse;
  RESTRequest.AssignedValues := [
    TCustomRESTRequest.TAssignedValue.rvConnectTimeout,
    TCustomRESTRequest.TAssignedValue.rvReadTimeout
  ];

end;

destructor T_Telegram.Destroy;
begin

  RESTClient.Free;
  RESTRequest.Free;
  RESTResponse.Free;

  inherited;
end;

function T_Telegram.SendMessage(vTo, vMessage: String): String;
begin

  try

    RESTClient.BaseURL := RESTClient.BaseURL + '/SendMessage?';
    RESTRequest.Method := TRESTRequestMethod.rmPOST;
    RESTRequest.AddParameter('chat_id', vTo, TRESTRequestParameterKind.pkGETorPOST);
    RESTRequest.AddParameter('text', vMessage, TRESTRequestParameterKind.pkGETorPOST);
    RESTRequest.Execute;

  finally

    Result := RESTResponse.JSONText;

  end;

end;

end.

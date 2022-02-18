unit uViaCEP;

interface

uses Xml.xmldom, Xml.XMLDoc, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
IdMultipartFormData, System.JSON;

type TCep = class(TObject)

  private
    FCep : String;
    FEndereco : String;
    FBairro : String;
    FCidade : String;
    FUf : string;
    FIBGE : String;
    FComplemento : string;
    procedure BuscaCep;
  public
    constructor Create(const sCep : String); overload;
    property Cep : string read FCep;
    property Endereco : string read FEndereco;
    property Bairro : string read FBairro;
    property Cidade : string read FCidade;
    property Uf : string read FUf;
    property IBGE : string read FIBGE;
    property Complemento : string read FComplemento;

  end;

implementation

{ TCep }

procedure TCep.BuscaCep;
var
 sURL, sResponse : String;
 httpCliente : TIdHTTP;
 jsonValue : TJsonValue;
 jsonOb : TJSONObject;
begin

  sURL := 'http://viacep.com.br/ws/' + FCep + '/json/';

  httpCliente := TIdHTTP.Create(nil);

  sResponse := httpCliente.Get(sURL);

  if Pos('erro', sResponse) > 0 then
    Exit;

  jsonValue := TJSonObject.ParseJSONValue(sResponse);

  FEndereco    := JsonValue.GetValue<string>('logradouro');
  FBairro      := JsonValue.GetValue<string>('bairro');
  FCidade      := JsonValue.GetValue<string>('localidade');
  FComplemento := JsonValue.GetValue<string>('complemento');
  FUf          := JsonValue.GetValue<string>('uf');
  FIBGE        := JsonValue.GetValue<string>('ibge');

end;

constructor TCep.Create(const sCep: String);
begin

  FCep := sCep;

  BuscaCep;
end;

end.

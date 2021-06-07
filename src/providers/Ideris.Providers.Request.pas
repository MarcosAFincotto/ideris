unit Ideris.Providers.Request;

interface

uses RESTRequest4D;

type
  IIderisRequest<T: class, constructor> = interface
    ['{608FFCB3-DE41-4BD6-97DB-0989DA56816B}']
    function ResourceSuffix(const AResourceSuffix: Integer): IIderisRequest<T>;
    function Resource(const AResource: string): IIderisRequest<T>;
    function AddQueryParam(const AName, AValue: string): IIderisRequest<T>;
    function ClearQueryParams: IIderisRequest<T>;
    function Post(const AObject: T): T;
    function Get: T;
  end;

  TIderisRequest<T: class, constructor> = class(TInterfacedObject, IIderisRequest<T>)
  private
    FRequest: IRequest;
    function GerarToken: string;
    function ResourceSuffix(const AResourceSuffix: Integer): IIderisRequest<T>;
    function Resource(const AResource: string): IIderisRequest<T>;
    function AddQueryParam(const AName, AValue: string): IIderisRequest<T>;
    function ClearQueryParams: IIderisRequest<T>;
    function Post(const AObject: T): T;
    function Get: T;
  public
    constructor Create;
    class function New: IIderisRequest<T>;
  end;

implementation

uses Ideris.Providers.Consts, System.SysUtils, REST.Json, System.JSON, Ideris.Providers.Token, System.Generics.Collections;

{ TIderisRequest<T> }

function TIderisRequest<T>.AddQueryParam(const AName, AValue: string): IIderisRequest<T>;
begin
  FRequest.AddParam(AName, AValue);
  Result := Self;
end;

function TIderisRequest<T>.ClearQueryParams: IIderisRequest<T>;
begin
  FRequest.ClearParams;
  Result := Self;
end;

constructor TIderisRequest<T>.Create;
begin
  FRequest := TRequest.New
    .ContentType(APPLICATION_JSON)
    .Token(TIderisToken.GetInstance.Token)
    .BaseURL(BASE_URL);
end;

function TIderisRequest<T>.Get: T;
var
  LResponse: IResponse;
begin
  LResponse := FRequest.Get;
  if LResponse.StatusCode = 401 then
  begin
    TIderisToken.GetInstance.Token := Self.GerarToken;
    FRequest.Token(TIderisToken.GetInstance.Token);
    Result := Self.Get;
    Exit;
  end;
  if LResponse.StatusCode <> 200 then
    raise Exception.Create(LResponse.Content);
  if FRequest.ResourceSuffix.Trim.IsEmpty then
    Result := TJson.JsonToObject<T>(LResponse.Content)
  else
    Result := TJson.JsonToObject<T>(LResponse.JSONValue.GetValue<TJSONArray>('result').Items[0] as TJSONObject);
end;

function TIderisRequest<T>.GerarToken: string;
var
  LResponse: IResponse;
begin
  LResponse := TRequest.New.BaseURL(BASE_URL)
    .Resource(PATH_LOGIN)
    .ContentType(APPLICATION_JSON)
    .AddBody(TJSONObject.Create(TJSONPair.Create('login_token', API_KEY)))
    .Post;
  Result := LResponse.JSONValue.Value;
end;

class function TIderisRequest<T>.New: IIderisRequest<T>;
begin
  Result := TIderisRequest<T>.Create;
end;

function TIderisRequest<T>.Post(const AObject: T): T;
var
  LResponse: IResponse;
begin
  if Assigned(AObject) then
    FRequest.ClearBody.AddBody(AObject);
  LResponse := FRequest.Post;
  if LResponse.StatusCode = 401 then
  begin
    TIderisToken.GetInstance.Token := Self.GerarToken;
    FRequest.Token(TIderisToken.GetInstance.Token);
    Result := Self.Post(nil);
    Exit;
  end;
  if LResponse.StatusCode <> 200 then
    raise Exception.Create(LResponse.Content);
  Result := TJson.JsonToObject<T>(LResponse.JSONValue.GetValue<TJSONArray>('result').Items[0] as TJSONObject);
end;

function TIderisRequest<T>.Resource(const AResource: string): IIderisRequest<T>;
begin
  FRequest.Resource(AResource);
  Result := Self;
end;

function TIderisRequest<T>.ResourceSuffix(const AResourceSuffix: Integer): IIderisRequest<T>;
begin
  FRequest.ResourceSuffix(AResourceSuffix.ToString);
  Result := Self;
end;

end.

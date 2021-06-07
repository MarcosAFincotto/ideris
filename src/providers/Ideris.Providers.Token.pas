unit Ideris.Providers.Token;

interface

type
  /// <summary>
  ///   Singleton para armazenar um token válido.
  /// </summary>
  TIderisToken = class
  private
    FToken: string;
    constructor Create;
  public
    class function GetInstance: TIderisToken;
    class function NewInstance: TObject; override;
    property Token: string read FToken write FToken;
  end;

implementation

{ TIderisToken }

var
  Instance: TIderisToken = nil;

constructor TIderisToken.Create;
begin

end;

class function TIderisToken.GetInstance: TIderisToken;
begin
  Result := TIderisToken.Create;
end;

class function TIderisToken.NewInstance: TObject;
begin
  if not Assigned(Instance) then
    Instance := TIderisToken(inherited NewInstance);
  Result := Instance;
end;

initialization

finalization
  Instance.Free;

end.

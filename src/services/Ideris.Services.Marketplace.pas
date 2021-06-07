unit Ideris.Services.Marketplace;

interface

uses Ideris.DTO.Result, Ideris.Models.Marketplace;

type
  IIderisMarketplace = interface
    ['{B3ACADC6-85C5-4583-8238-1DBBC1C6FC5F}']
    /// <remarks>
    ///   O valor máximo do limit é 50 (cinquenta).
    /// </remarks>
    function Limit(const ALimit: Integer): IIderisMarketplace;
    function Offset(const AOffset: Integer): IIderisMarketplace;
    function Get: TIderisResultDTO<TIderisMarketplace>;
  end;

  TIderisMarketplaceService = class(TInterfacedObject, IIderisMarketplace)
  private
    FLimit: Integer;
    FOffset: Integer;
    function Limit(const ALimit: Integer): IIderisMarketplace;
    function Offset(const AOffset: Integer): IIderisMarketplace;
    function Get: TIderisResultDTO<TIderisMarketplace>; overload;
  public
    constructor Create;
    class function New: IIderisMarketplace;
  end;

implementation

uses System.SysUtils, Ideris.Providers.Consts, Ideris.Providers.Request;

{ TIderisMarketplaceService }

constructor TIderisMarketplaceService.Create;
begin
  FLimit := LIMITE_DEFAULT;
  FOffset := OFFSET_DEFAULT;
end;

function TIderisMarketplaceService.Get: TIderisResultDTO<TIderisMarketplace>;
begin
  Result := TIderisRequest<TIderisResultDTO<TIderisMarketplace>>.New
    .Resource(PATH_MARKETPLACE)
    .AddQueryParam(PARAMETRO_LIMIT, FLimit.ToString)
    .AddQueryParam(PARAMETRO_OFFSET, FOffset.ToString)
    .Get;
end;

function TIderisMarketplaceService.Limit(const ALimit: Integer): IIderisMarketplace;
begin
  if (ALimit > LIMITE_MAXIMO) or (ALimit < LIMITE_MINIMO) then
    raise Exception.Create(LIMIT_INVALIDO);
  FLimit := ALimit;
  Result := Self;
end;

class function TIderisMarketplaceService.New: IIderisMarketplace;
begin
  Result := TIderisMarketplaceService.Create;
end;

function TIderisMarketplaceService.Offset(const AOffset: Integer): IIderisMarketplace;
begin
  if AOffset < OFFSET_MINIMO then
    raise Exception.Create(OFFSET_INVALIDO);
  FOffset := AOffset;
  Result := Self;
end;

end.

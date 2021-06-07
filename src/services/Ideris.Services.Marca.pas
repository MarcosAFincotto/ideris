unit Ideris.Services.Marca;

interface

uses Ideris.DTO.Result, Ideris.Models.Produto.Marca;

type
  IIderisMarca = interface
    ['{62E75EAE-AA87-465E-AD4F-1CCDB27D3859}']
    /// <remarks>
    ///   O valor máximo do limit é 50 (cinquenta).
    /// </remarks>
    function Limit(const ALimit: Integer): IIderisMarca;
    function Offset(const AOffset: Integer): IIderisMarca;
    function Marca(const AMarca: string): IIderisMarca;
    function Get: TIderisResultDTO<TIderisProdutoMarca>; overload;
    function Get(const AIdMarca: Integer): TIderisProdutoMarca; overload;
    function Post(const AMarca: TIderisProdutoMarca): TIderisProdutoMarca;
  end;

  TIderisMarcaService = class(TInterfacedObject, IIderisMarca)
  private
    FLimit: Integer;
    FOffset: Integer;
    FMarca: string;
    function Limit(const ALimit: Integer): IIderisMarca;
    function Offset(const AOffset: Integer): IIderisMarca;
    function Marca(const AMarca: string): IIderisMarca;
    function Get: TIderisResultDTO<TIderisProdutoMarca>; overload;
    function Get(const AIdMarca: Integer): TIderisProdutoMarca; overload;
    function Post(const AMarca: TIderisProdutoMarca): TIderisProdutoMarca;
  public
    constructor Create;
    class function New: IIderisMarca;
  end;

implementation

uses System.SysUtils, Ideris.Providers.Consts, Ideris.Providers.Request;

{ TIderisMarcaService }

function TIderisMarcaService.Get: TIderisResultDTO<TIderisProdutoMarca>;
var
  LRequest: IIderisRequest<TIderisResultDTO<TIderisProdutoMarca>>;
begin
  LRequest := TIderisRequest<TIderisResultDTO<TIderisProdutoMarca>>.New
    .Resource(PATH_MARCA)
    .AddQueryParam(PARAMETRO_LIMIT, FLimit.ToString)
    .AddQueryParam(PARAMETRO_OFFSET, FOffset.ToString);
  if not FMarca.Trim.IsEmpty then
    LRequest.AddQueryParam('descricao', FMarca);
  Result := LRequest.Get;
end;

constructor TIderisMarcaService.Create;
begin
  FLimit := LIMITE_DEFAULT;
  FOffset := OFFSET_DEFAULT;
end;

function TIderisMarcaService.Get(const AIdMarca: Integer): TIderisProdutoMarca;
begin
  Result := TIderisRequest<TIderisProdutoMarca>.New.Resource(PATH_MARCA).ResourceSuffix(AIdMarca).Get;
end;

function TIderisMarcaService.Limit(const ALimit: Integer): IIderisMarca;
begin
  if (ALimit > LIMITE_MAXIMO) or (ALimit < LIMITE_MINIMO) then
    raise Exception.Create(LIMIT_INVALIDO);
  FLimit := ALimit;
  Result := Self;
end;

function TIderisMarcaService.Marca(const AMarca: string): IIderisMarca;
begin
  FMarca := AMarca;
  Result := Self;
end;

class function TIderisMarcaService.New: IIderisMarca;
begin
  Result := TIderisMarcaService.Create;
end;

function TIderisMarcaService.Offset(const AOffset: Integer): IIderisMarca;
begin
  if AOffset < OFFSET_MINIMO then
    raise Exception.Create(OFFSET_INVALIDO);
  FOffset := AOffset;
  Result := Self;
end;

function TIderisMarcaService.Post(const AMarca: TIderisProdutoMarca): TIderisProdutoMarca;
begin
  Result := TIderisRequest<TIderisProdutoMarca>.New.Resource(PATH_MARCA).Post(AMarca);
end;

end.

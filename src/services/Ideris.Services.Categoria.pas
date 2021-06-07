unit Ideris.Services.Categoria;

interface

uses Ideris.DTO.Result, Ideris.Models.Produto.Categoria;

type
  IIderisCategoria = interface
    ['{FB8CD29A-7D51-4008-88BB-C599E1B184F4}']
    /// <remarks>
    ///   O valor máximo do limit é 50 (cinquenta).
    /// </remarks>
    function Limit(const ALimit: Integer): IIderisCategoria;
    function Offset(const AOffset: Integer): IIderisCategoria;
    function Categoria(const ACategoria: string): IIderisCategoria;
    function Get: TIderisResultDTO<TIderisProdutoCategoria>; overload;
    function Get(const AIdCategoria: Integer): TIderisProdutoCategoria; overload;
    function Post(const ACategoria: TIderisProdutoCategoria): TIderisProdutoCategoria;
  end;

  TIderisCategoriaService = class(TInterfacedObject, IIderisCategoria)
  private
    FLimit: Integer;
    FOffset: Integer;
    FCategoria: string;
    function Limit(const ALimit: Integer): IIderisCategoria;
    function Offset(const AOffset: Integer): IIderisCategoria;
    function Categoria(const ACategoria: string): IIderisCategoria;
    function Get: TIderisResultDTO<TIderisProdutoCategoria>; overload;
    function Get(const AIdCategoria: Integer): TIderisProdutoCategoria; overload;
    function Post(const ACategoria: TIderisProdutoCategoria): TIderisProdutoCategoria;
  public
    constructor Create;
    class function New: IIderisCategoria;
  end;

implementation

uses System.SysUtils, Ideris.Providers.Consts, Ideris.Providers.Request;

{ TIderisCategoriaService }

function TIderisCategoriaService.Categoria(const ACategoria: string): IIderisCategoria;
begin
  FCategoria := ACategoria;
  Result := Self;
end;

constructor TIderisCategoriaService.Create;
begin
  FLimit := LIMITE_DEFAULT;
  FOffset := OFFSET_DEFAULT;
end;

function TIderisCategoriaService.Get(const AIdCategoria: Integer): TIderisProdutoCategoria;
begin
  Result := TIderisRequest<TIderisProdutoCategoria>.New.Resource(PATH_CATEGORIA).ResourceSuffix(AIdCategoria).Get;
end;

function TIderisCategoriaService.Get: TIderisResultDTO<TIderisProdutoCategoria>;
var
  LRequest: IIderisRequest<TIderisResultDTO<TIderisProdutoCategoria>>;
begin
  LRequest := TIderisRequest<TIderisResultDTO<TIderisProdutoCategoria>>.New
    .Resource(PATH_CATEGORIA)
    .AddQueryParam(PARAMETRO_LIMIT, FLimit.ToString)
    .AddQueryParam(PARAMETRO_OFFSET, FOffset.ToString);
  if not FCategoria.Trim.IsEmpty then
    LRequest.AddQueryParam('descricao', FCategoria);
  Result := LRequest.Get;
end;

function TIderisCategoriaService.Limit(const ALimit: Integer): IIderisCategoria;
begin
  if (ALimit > LIMITE_MAXIMO) or (ALimit < LIMITE_MINIMO) then
    raise Exception.Create(LIMIT_INVALIDO);
  FLimit := ALimit;
  Result := Self;
end;

class function TIderisCategoriaService.New: IIderisCategoria;
begin
  Result := TIderisCategoriaService.Create;
end;

function TIderisCategoriaService.Offset(const AOffset: Integer): IIderisCategoria;
begin
  if AOffset < OFFSET_MINIMO then
    raise Exception.Create(OFFSET_INVALIDO);
  FOffset := AOffset;
  Result := Self;
end;

function TIderisCategoriaService.Post(const ACategoria: TIderisProdutoCategoria): TIderisProdutoCategoria;
begin
  Result := TIderisRequest<TIderisProdutoCategoria>.New.Resource(PATH_CATEGORIA).Post(ACategoria);
end;

end.

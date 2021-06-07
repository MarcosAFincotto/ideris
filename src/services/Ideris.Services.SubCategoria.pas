unit Ideris.Services.SubCategoria;

interface

uses Ideris.DTO.Result, Ideris.Models.Produto.SubCategoria;

type
  IIderisSubCategoria = interface
    ['{4324E356-CBD2-4BB7-84A3-C757A51906E3}']
    /// <remarks>
    ///   O valor máximo do limit é 50 (cinquenta).
    /// </remarks>
    function Limit(const ALimit: Integer): IIderisSubCategoria;
    function Offset(const AOffset: Integer): IIderisSubCategoria;
    function SubCategoria(const ASubCategoria: string): IIderisSubCategoria;
    function Get: TIderisResultDTO<TIderisProdutoSubCategoria>; overload;
    function Get(const AIdSubCategoria: Integer): TIderisProdutoSubCategoria; overload;
    function Post(const ASubCategoria: TIderisProdutoSubCategoria): TIderisProdutoSubCategoria;
  end;

  TIderisSubCategoriaService = class(TInterfacedObject, IIderisSubCategoria)
  private
    FLimit: Integer;
    FOffset: Integer;
    FSubCategoria: string;
    function Limit(const ALimit: Integer): IIderisSubCategoria;
    function Offset(const AOffset: Integer): IIderisSubCategoria;
    function SubCategoria(const ASubCategoria: string): IIderisSubCategoria;
    function Get: TIderisResultDTO<TIderisProdutoSubCategoria>; overload;
    function Get(const AIdSubCategoria: Integer): TIderisProdutoSubCategoria; overload;
    function Post(const ASubCategoria: TIderisProdutoSubCategoria): TIderisProdutoSubCategoria;
  public
    constructor Create;
    class function New: IIderisSubCategoria;
  end;

implementation

uses System.SysUtils, Ideris.Providers.Consts, Ideris.Providers.Request;

{ TIderisSubCategoriaService }

constructor TIderisSubCategoriaService.Create;
begin
  FLimit := LIMITE_DEFAULT;
  FOffset := OFFSET_DEFAULT;
end;

function TIderisSubCategoriaService.Get(const AIdSubCategoria: Integer): TIderisProdutoSubCategoria;
begin
  Result := TIderisRequest<TIderisProdutoSubCategoria>.New.Resource(PATH_SUBCATEGORIA).ResourceSuffix(AIdSubCategoria).Get;
end;

function TIderisSubCategoriaService.Get: TIderisResultDTO<TIderisProdutoSubCategoria>;
var
  LRequest: IIderisRequest<TIderisResultDTO<TIderisProdutoSubCategoria>>;
begin
  LRequest := TIderisRequest<TIderisResultDTO<TIderisProdutoSubCategoria>>.New
    .Resource(PATH_SUBCATEGORIA)
    .AddQueryParam(PARAMETRO_LIMIT, FLimit.ToString)
    .AddQueryParam(PARAMETRO_OFFSET, FOffset.ToString);
  if not FSubCategoria.Trim.IsEmpty then
    LRequest.AddQueryParam('descricao', FSubCategoria);
  Result := LRequest.Get;
end;

function TIderisSubCategoriaService.Limit(const ALimit: Integer): IIderisSubCategoria;
begin
  if (ALimit > LIMITE_MAXIMO) or (ALimit < LIMITE_MINIMO) then
    raise Exception.Create(LIMIT_INVALIDO);
  FLimit := ALimit;
  Result := Self;
end;

class function TIderisSubCategoriaService.New: IIderisSubCategoria;
begin
  Result := TIderisSubCategoriaService.Create;
end;

function TIderisSubCategoriaService.Offset(const AOffset: Integer): IIderisSubCategoria;
begin
  if AOffset < OFFSET_MINIMO then
    raise Exception.Create(OFFSET_INVALIDO);
  FOffset := AOffset;
  Result := Self;
end;

function TIderisSubCategoriaService.Post(const ASubCategoria: TIderisProdutoSubCategoria): TIderisProdutoSubCategoria;
begin
  Result := TIderisRequest<TIderisProdutoSubCategoria>.New.Resource(PATH_SUBCATEGORIA).Post(ASubCategoria);
end;

function TIderisSubCategoriaService.SubCategoria(const ASubCategoria: string): IIderisSubCategoria;
begin
  FSubCategoria := ASubCategoria;
  Result := Self;
end;

end.

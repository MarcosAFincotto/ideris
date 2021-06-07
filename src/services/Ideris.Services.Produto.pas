unit Ideris.Services.Produto;

interface

uses Ideris.Models.Produto, Ideris.DTO.Result;

type
  IIderisProduto = interface
    ['{35D03BA1-9510-4192-AC71-5BCB44DC9A7E}']
    /// <remarks>
    ///   O valor máximo do limit é 50 (cinquenta).
    /// </remarks>
    function Limit(const ALimit: Integer): IIderisProduto;
    function Offset(const AOffset: Integer): IIderisProduto;
    function Sku(const ASku: string): IIderisProduto;
    function Get: TIderisResultDTO<TIderisProduto>; overload;
    function Get(const AIdProduto: Integer): TIderisProduto; overload;
    function Post(const AProduto: TIderisProduto): TIderisProduto;
  end;

  TIderisProdutoService = class(TInterfacedObject, IIderisProduto)
  private
    FLimit: Integer;
    FOffset: Integer;
    FSku: string;
    function Limit(const ALimit: Integer): IIderisProduto;
    function Offset(const AOffset: Integer): IIderisProduto;
    function Sku(const ASku: string): IIderisProduto;
    function Get: TIderisResultDTO<TIderisProduto>; overload;
    function Get(const AIdProduto: Integer): TIderisProduto; overload;
    function Post(const AProduto: TIderisProduto): TIderisProduto;
  public
    constructor Create;
    class function New: IIderisProduto;
  end;

implementation

uses System.SysUtils, Ideris.Providers.Consts, Ideris.Providers.Request;

{ TIderisProdutoService }

function TIderisProdutoService.Get: TIderisResultDTO<TIderisProduto>;
var
  LRequest: IIderisRequest<TIderisResultDTO<TIderisProduto>>;
begin
  LRequest := TIderisRequest<TIderisResultDTO<TIderisProduto>>.New
    .Resource(PATH_PRODUTO)
    .AddQueryParam(PARAMETRO_LIMIT, FLimit.ToString)
    .AddQueryParam(PARAMETRO_OFFSET, FOffset.ToString);
  if not FSku.Trim.IsEmpty then
    LRequest.AddQueryParam('sku', FSku);
  Result := LRequest.Get;
end;

constructor TIderisProdutoService.Create;
begin
  FLimit := LIMITE_DEFAULT;
  FOffset := OFFSET_DEFAULT;
end;

function TIderisProdutoService.Get(const AIdProduto: Integer): TIderisProduto;
begin
  Result := TIderisRequest<TIderisProduto>.New.Resource(PATH_PRODUTO).ResourceSuffix(AIdProduto).Get;
end;

function TIderisProdutoService.Limit(const ALimit: Integer): IIderisProduto;
begin
  if (ALimit > LIMITE_MAXIMO) or (ALimit < LIMITE_MINIMO) then
    raise Exception.Create(LIMIT_INVALIDO);
  FLimit := ALimit;
  Result := Self;
end;

class function TIderisProdutoService.New: IIderisProduto;
begin
  Result := TIderisProdutoService.Create;
end;

function TIderisProdutoService.Offset(const AOffset: Integer): IIderisProduto;
begin
  if AOffset < OFFSET_MINIMO then
    raise Exception.Create(OFFSET_INVALIDO);
  FOffset := AOffset;
  Result := Self;
end;

function TIderisProdutoService.Post(const AProduto: TIderisProduto): TIderisProduto;
begin
  Result := TIderisRequest<TIderisProduto>.New.Resource(PATH_PRODUTO).Post(AProduto);
end;

function TIderisProdutoService.Sku(const ASku: string): IIderisProduto;
begin
  FSku := ASku;
  Result := Self;
end;

end.

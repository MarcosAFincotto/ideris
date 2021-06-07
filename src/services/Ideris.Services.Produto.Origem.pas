unit Ideris.Services.Produto.Origem;

interface

uses Ideris.DTO.Result, Ideris.Models.Produto.Origem;

type
  IIderisOrigem = interface
    ['{AECCED35-B974-4D4E-831F-BD8471EFD313}']
    /// <remarks>
    ///   O valor máximo do limit é 50 (cinquenta).
    /// </remarks>
    function Limit(const ALimit: Integer): IIderisOrigem;
    function Offset(const AOffset: Integer): IIderisOrigem;
    function Get: TIderisResultDTO<TIderisProdutoOrigem>;
  end;

  TIderisProdutoOrigemService = class(TInterfacedObject, IIderisOrigem)
  private
    FLimit: Integer;
    FOffset: Integer;
    function Limit(const ALimit: Integer): IIderisOrigem;
    function Offset(const AOffset: Integer): IIderisOrigem;
    function Get: TIderisResultDTO<TIderisProdutoOrigem>; overload;
  public
    constructor Create;
    class function New: IIderisOrigem;
  end;

implementation

uses System.SysUtils, Ideris.Providers.Consts, Ideris.Providers.Request;

{ TIderisProdutoOrigemService }

constructor TIderisProdutoOrigemService.Create;
begin
  FLimit := LIMITE_DEFAULT;
  FOffset := OFFSET_DEFAULT;
end;

function TIderisProdutoOrigemService.Get: TIderisResultDTO<TIderisProdutoOrigem>;
begin
  Result := TIderisRequest<TIderisResultDTO<TIderisProdutoOrigem>>.New
    .Resource(PATH_PRODUTO_ORIGEM)
    .AddQueryParam(PARAMETRO_LIMIT, FLimit.ToString)
    .AddQueryParam(PARAMETRO_OFFSET, FOffset.ToString)
    .Get;
end;

function TIderisProdutoOrigemService.Limit(const ALimit: Integer): IIderisOrigem;
begin
  if (ALimit > LIMITE_MAXIMO) or (ALimit < LIMITE_MINIMO) then
    raise Exception.Create(LIMIT_INVALIDO);
  FLimit := ALimit;
  Result := Self;
end;

class function TIderisProdutoOrigemService.New: IIderisOrigem;
begin
  Result := TIderisProdutoOrigemService.Create;
end;

function TIderisProdutoOrigemService.Offset(const AOffset: Integer): IIderisOrigem;
begin
  if AOffset < OFFSET_MINIMO then
    raise Exception.Create(OFFSET_INVALIDO);
  FOffset := AOffset;
  Result := Self;
end;

end.

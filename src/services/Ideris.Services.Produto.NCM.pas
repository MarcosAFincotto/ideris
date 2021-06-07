unit Ideris.Services.Produto.NCM;

interface

uses Ideris.DTO.Result, Ideris.Models.Produto.NCM;

type
  IIderisNCM = interface
    ['{FC5CBE7A-982A-4EC7-8AA0-5FE696D6D7A9}']
    /// <remarks>
    ///   O valor máximo do limit é 50 (cinquenta).
    /// </remarks>
    function Limit(const ALimit: Integer): IIderisNCM;
    function Offset(const AOffset: Integer): IIderisNCM;
    function Codigo(const ACodigoNCM: string): IIderisNCM;
    function Get: TIderisResultDTO<TIderisProdutoNCM>;
    function Post(const AProdutoNCM: TIderisProdutoNCM): TIderisProdutoNCM;
  end;

  TIderisProdutoNCMService = class(TInterfacedObject, IIderisNCM)
  private
    FLimit: Integer;
    FOffset: Integer;
    FCodigo: string;
    function Limit(const ALimit: Integer): IIderisNCM;
    function Offset(const AOffset: Integer): IIderisNCM;
    function Codigo(const ACodigoNCM: string): IIderisNCM;
    function Get: TIderisResultDTO<TIderisProdutoNCM>;
    function Post(const AProdutoNCM: TIderisProdutoNCM): TIderisProdutoNCM;
  public
    constructor Create;
    class function New: IIderisNCM;
  end;

implementation

uses System.SysUtils, Ideris.Providers.Consts, Ideris.Providers.Request;

{ TIderisProdutoNCMService }

function TIderisProdutoNCMService.Codigo(const ACodigoNCM: string): IIderisNCM;
begin
  FCodigo := ACodigoNCM;
  Result := Self;
end;

constructor TIderisProdutoNCMService.Create;
begin
  FLimit := LIMITE_DEFAULT;
  FOffset := OFFSET_DEFAULT;
end;

function TIderisProdutoNCMService.Get: TIderisResultDTO<TIderisProdutoNCM>;
var
  LRequest: IIderisRequest<TIderisResultDTO<TIderisProdutoNCM>>;
begin
  LRequest := TIderisRequest<TIderisResultDTO<TIderisProdutoNCM>>.New
    .Resource(PATH_NCM)
    .AddQueryParam(PARAMETRO_LIMIT, FLimit.ToString)
    .AddQueryParam(PARAMETRO_OFFSET, FOffset.ToString);
  if not FCodigo.Trim.IsEmpty then
    LRequest.AddQueryParam('codigo', FCodigo);
  Result := LRequest.Get;
end;

function TIderisProdutoNCMService.Limit(const ALimit: Integer): IIderisNCM;
begin
  if (ALimit > LIMITE_MAXIMO) or (ALimit < LIMITE_MINIMO) then
    raise Exception.Create(LIMIT_INVALIDO);
  FLimit := ALimit;
  Result := Self;
end;

class function TIderisProdutoNCMService.New: IIderisNCM;
begin
  Result := TIderisProdutoNCMService.Create;
end;

function TIderisProdutoNCMService.Offset(const AOffset: Integer): IIderisNCM;
begin
  if AOffset < OFFSET_MINIMO then
    raise Exception.Create(OFFSET_INVALIDO);
  FOffset := AOffset;
  Result := Self;
end;

function TIderisProdutoNCMService.Post(const AProdutoNCM: TIderisProdutoNCM): TIderisProdutoNCM;
begin
  Result := TIderisRequest<TIderisProdutoNCM>.New.Resource(PATH_NCM).Post(AProdutoNCM);
end;

end.

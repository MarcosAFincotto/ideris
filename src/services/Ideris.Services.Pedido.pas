unit Ideris.Services.Pedido;

interface

uses Ideris.DTO.Result, Ideris.Models.Pedido, Ideris.Models.Pedido.Lista;

type
  IIderisPedido = interface
    ['{8D1E8550-1C6F-4D14-ACFE-51C5A0786D65}']
    /// <remarks>
    ///   O valor máximo do limit é 50 (cinquenta).
    /// </remarks>
    function Limit(const ALimit: Integer): IIderisPedido;
    function Offset(const AOffset: Integer): IIderisPedido;
    function DataInicial(const ADataInicial: string): IIderisPedido;
    function DataFinal(const ADataFinal: string): IIderisPedido;
    function Status(const AStatus: string): IIderisPedido;
    function Marketplace(const AMarketplace: string): IIderisPedido;
    function CodigoCarrinhoCompra(const ACodigoCarrinhoCompra: string): IIderisPedido;
    function IdAutenticacaoIderis(const AIdAutenticacaoIderis: string): IIderisPedido;
    function Get: TIderisResultDTO<TIderisPedidoLista>; overload;
    function Get(const AIdPedido: Integer): TIderisPedido; overload;
  end;

  TIderisPedidoService = class(TInterfacedObject, IIderisPedido)
  private
    FLimit: Integer;
    FOffset: Integer;
    FDataInicial: string;
    FDataFinal: string;
    FStatus: string;
    FMarketplace: string;
    FCodigoCarrinhoCompra: string;
    FIdAutenticacaoIderis: string;
    function Limit(const ALimit: Integer): IIderisPedido;
    function Offset(const AOffset: Integer): IIderisPedido;
    function DataInicial(const ADataInicial: string): IIderisPedido;
    function DataFinal(const ADataFinal: string): IIderisPedido;
    function Status(const AStatus: string): IIderisPedido;
    function Marketplace(const AMarketplace: string): IIderisPedido;
    function CodigoCarrinhoCompra(const ACodigoCarrinhoCompra: string): IIderisPedido;
    function IdAutenticacaoIderis(const AIdAutenticacaoIderis: string): IIderisPedido;
    function Get: TIderisResultDTO<TIderisPedidoLista>; overload;
    function Get(const AIdPedido: Integer): TIderisPedido; overload;
  public
    constructor Create;
    class function New: IIderisPedido;
  end;

implementation

uses System.SysUtils, Ideris.Providers.Consts, Ideris.Providers.Request;

{ TIderisPedidoService }

function TIderisPedidoService.CodigoCarrinhoCompra(const ACodigoCarrinhoCompra: string): IIderisPedido;
begin
  FCodigoCarrinhoCompra := ACodigoCarrinhoCompra;
  Result := Self;
end;

constructor TIderisPedidoService.Create;
begin
  FLimit := LIMITE_DEFAULT;
  FOffset := OFFSET_DEFAULT;
end;

function TIderisPedidoService.DataFinal(const ADataFinal: string): IIderisPedido;
begin
  FDataFinal := ADataFinal;
  Result := Self;
end;

function TIderisPedidoService.DataInicial(const ADataInicial: string): IIderisPedido;
begin
  FDataInicial := ADataInicial;
  Result := Self;
end;

function TIderisPedidoService.Get: TIderisResultDTO<TIderisPedidoLista>;
var
  LRequest: IIderisRequest<TIderisResultDTO<TIderisPedidoLista>>;
begin
  LRequest := TIderisRequest<TIderisResultDTO<TIderisPedidoLista>>.New
    .Resource(PATH_LISTA_PEDIDO)
    .AddQueryParam(PARAMETRO_LIMIT, FLimit.ToString)
    .AddQueryParam(PARAMETRO_OFFSET, FOffset.ToString);
  if not FDataInicial.Trim.IsEmpty then
    LRequest.AddQueryParam('dataInicial', FDataInicial);
  if not FDataFinal.Trim.IsEmpty then
    LRequest.AddQueryParam('dataFinal', FDataFinal);
  if not FStatus.Trim.IsEmpty then
    LRequest.AddQueryParam('status', FStatus);
  if not FMarketplace.Trim.IsEmpty then
    LRequest.AddQueryParam('marketplace', FMarketplace);
  if not FCodigoCarrinhoCompra.Trim.IsEmpty then
    LRequest.AddQueryParam('codigoCarrinhoCompras', FCodigoCarrinhoCompra);
  if not FIdAutenticacaoIderis.Trim.IsEmpty then
    LRequest.AddQueryParam('idAutenticacaoIderis', FIdAutenticacaoIderis);
  Result := LRequest.Get;
end;

function TIderisPedidoService.Get(const AIdPedido: Integer): TIderisPedido;
begin
  Result := TIderisRequest<TIderisPedido>.New.Resource(PATH_PEDIDO).ResourceSuffix(AIdPedido).Get;
end;

function TIderisPedidoService.IdAutenticacaoIderis(const AIdAutenticacaoIderis: string): IIderisPedido;
begin
  FIdAutenticacaoIderis := AIdAutenticacaoIderis;
  Result := Self;
end;

function TIderisPedidoService.Limit(const ALimit: Integer): IIderisPedido;
begin
  if (ALimit > LIMITE_MAXIMO) or (ALimit < LIMITE_MINIMO) then
    raise Exception.Create(LIMIT_INVALIDO);
  FLimit := ALimit;
  Result := Self;
end;

function TIderisPedidoService.Marketplace(const AMarketplace: string): IIderisPedido;
begin
  FMarketplace := AMarketplace;
  Result := Self;
end;

class function TIderisPedidoService.New: IIderisPedido;
begin
  Result := TIderisPedidoService.Create;
end;

function TIderisPedidoService.Offset(const AOffset: Integer): IIderisPedido;
begin
  if AOffset < OFFSET_MINIMO then
    raise Exception.Create(OFFSET_INVALIDO);
  FOffset := AOffset;
  Result := Self;
end;

function TIderisPedidoService.Status(const AStatus: string): IIderisPedido;
begin
  FStatus := AStatus;
  Result := Self;
end;

end.

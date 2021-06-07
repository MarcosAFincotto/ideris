unit Ideris.Services.Protocolo;

interface

uses Ideris.DTO.Result, Ideris.Models.Protocolo;

type
  IIderisProtocolo = interface
    ['{43A86F1D-8C3B-4C10-94B5-FBA76519D891}']
    /// <remarks>
    ///   O valor máximo do limit é 50 (cinquenta).
    /// </remarks>
    function Limit(const ALimit: Integer): IIderisProtocolo;
    function Offset(const AOffset: Integer): IIderisProtocolo;
    function Codigo(const ACodigo: string): IIderisProtocolo;
    function Sku(const ASku: string): IIderisProtocolo;
    function Get: TIderisResultDTO<TIderisProtocolo>;
  end;

  TIderisProtocoloService = class(TInterfacedObject, IIderisProtocolo)
  private
    FLimit: Integer;
    FOffset: Integer;
    FCodigo: string;
    FSku: string;
    function Limit(const ALimit: Integer): IIderisProtocolo;
    function Offset(const AOffset: Integer): IIderisProtocolo;
    function Codigo(const ACodigo: string): IIderisProtocolo;
    function Sku(const ASku: string): IIderisProtocolo;
    function Get: TIderisResultDTO<TIderisProtocolo>;
  public
    constructor Create;
    class function New: IIderisProtocolo;
  end;

implementation

uses System.SysUtils, Ideris.Providers.Consts, Ideris.Providers.Request;

{ TIderisProtocoloService }

function TIderisProtocoloService.Codigo(const ACodigo: string): IIderisProtocolo;
begin
  FCodigo := ACodigo;
  Result := Self;
end;

constructor TIderisProtocoloService.Create;
begin
  FLimit := LIMITE_DEFAULT;
  FOffset := OFFSET_DEFAULT;
end;

function TIderisProtocoloService.Get: TIderisResultDTO<TIderisProtocolo>;
var
  LRequest: IIderisRequest<TIderisResultDTO<TIderisProtocolo>>;
begin
  LRequest := TIderisRequest<TIderisResultDTO<TIderisProtocolo>>.New
    .Resource(PATH_PROTOCOLO)
    .AddQueryParam(PARAMETRO_LIMIT, FLimit.ToString)
    .AddQueryParam(PARAMETRO_OFFSET, FOffset.ToString);
  if not FCodigo.Trim.IsEmpty then
    LRequest.AddQueryParam('codigo', FCodigo);
  if not FSku.Trim.IsEmpty then
    LRequest.AddQueryParam('sku', FSku);
  Result := LRequest.Get;
end;

function TIderisProtocoloService.Limit(const ALimit: Integer): IIderisProtocolo;
begin
  if (ALimit > LIMITE_MAXIMO) or (ALimit < LIMITE_MINIMO) then
    raise Exception.Create(LIMIT_INVALIDO);
  FLimit := ALimit;
  Result := Self;
end;

class function TIderisProtocoloService.New: IIderisProtocolo;
begin
  Result := TIderisProtocoloService.Create;
end;

function TIderisProtocoloService.Offset(const AOffset: Integer): IIderisProtocolo;
begin
  if AOffset < OFFSET_MINIMO then
    raise Exception.Create(OFFSET_INVALIDO);
  FOffset := AOffset;
  Result := Self;
end;

function TIderisProtocoloService.Sku(const ASku: string): IIderisProtocolo;
begin
  FSku := ASku;
  Result := Self;
end;

end.

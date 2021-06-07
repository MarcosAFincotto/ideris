unit Ideris.Services.NotaFiscal;

interface

uses Ideris.Models.NotaFiscal, Ideris.DTO.Result, Ideris.Models.NotaFiscal.Processo;

type
  IIderisNotaFiscalProcesso = interface
    ['{2448AE00-4482-4E85-A3A7-68245BF023C1}']
    function Post(const AProcesso: TIderisNotaFiscalProcesso): TIderisNotaFiscalProcesso;
  end;

  IIderisNotaFiscal = interface
    ['{62E75EAE-AA87-465E-AD4F-1CCDB27D3859}']
    /// <remarks>
    ///   O valor máximo do limit é 50 (cinquenta).
    /// </remarks>
    function Limit(const ALimit: Integer): IIderisNotaFiscal;
    function Offset(const AOffset: Integer): IIderisNotaFiscal;
    function IdPedido(const AIdPedido: string): IIderisNotaFiscal;
    function Numero(const ANumeroNotaFiscal: string): IIderisNotaFiscal;
    function Serie(const ASerieNotaFiscal: string): IIderisNotaFiscal;
    function Chave(const AChaveNotaFiscal: string): IIderisNotaFiscal;
    function Get: TIderisResultDTO<TIderisNotaFiscal>;
    function Processo: IIderisNotaFiscalProcesso;
  end;

  TIderisNotaFiscalProcessoService = class(TInterfacedObject, IIderisNotaFiscalProcesso)
  private
    function Post(const AProcesso: TIderisNotaFiscalProcesso): TIderisNotaFiscalProcesso;
  end;

  TIderisNotaFiscalService = class(TInterfacedObject, IIderisNotaFiscal)
  private
    FLimit: Integer;
    FOffset: Integer;
    FIdPedido: string;
    FNumero: string;
    FSerie: string;
    FChave: string;
    function Limit(const ALimit: Integer): IIderisNotaFiscal;
    function Offset(const AOffset: Integer): IIderisNotaFiscal;
    function IdPedido(const AIdPedido: string): IIderisNotaFiscal;
    function Numero(const ANumeroNotaFiscal: string): IIderisNotaFiscal;
    function Serie(const ASerieNotaFiscal: string): IIderisNotaFiscal;
    function Chave(const AChaveNotaFiscal: string): IIderisNotaFiscal;
    function Get: TIderisResultDTO<TIderisNotaFiscal>;
    function Processo: IIderisNotaFiscalProcesso;
  public
    constructor Create;
    class function New: IIderisNotaFiscal;
  end;

implementation

uses System.SysUtils, Ideris.Providers.Consts, Ideris.Providers.Request;

{ TIderisNotaFiscalService }

function TIderisNotaFiscalService.Chave(const AChaveNotaFiscal: string): IIderisNotaFiscal;
begin
  FChave := AChaveNotaFiscal;
  Result := Self;
end;

constructor TIderisNotaFiscalService.Create;
begin
  FLimit := LIMITE_DEFAULT;
  FOffset := OFFSET_DEFAULT;
end;

function TIderisNotaFiscalService.Get: TIderisResultDTO<TIderisNotaFiscal>;
var
  LRequest: IIderisRequest<TIderisResultDTO<TIderisNotaFiscal>>;
begin
  if FIdPedido.Trim.IsEmpty and FChave.Trim.IsEmpty and (FNumero.Trim.IsEmpty or FSerie.Trim.IsEmpty) then
    raise Exception.Create('Informe o ID do pedido, ou a chave da nota ou o número e série da nota fiscal!');
  LRequest := TIderisRequest<TIderisResultDTO<TIderisNotaFiscal>>.New
    .Resource(PATH_NOTA_FISCAL)
    .AddQueryParam(PARAMETRO_LIMIT, FLimit.ToString)
    .AddQueryParam(PARAMETRO_OFFSET, FOffset.ToString);
  if not FIdPedido.Trim.IsEmpty then
    LRequest.AddQueryParam('idPedido', FIdPedido);
  if not FNumero.Trim.IsEmpty then
    LRequest.AddQueryParam('numeroNota', FNumero);
  if not FSerie.Trim.IsEmpty then
    LRequest.AddQueryParam('serieNota', FSerie);
  if not FChave.Trim.IsEmpty then
    LRequest.AddQueryParam('chaveNota', FChave);
  Result := LRequest.Get;
end;

function TIderisNotaFiscalService.IdPedido(const AIdPedido: string): IIderisNotaFiscal;
begin
  FIdPedido := AIdPedido;
  Result := Self;
end;

function TIderisNotaFiscalService.Limit(const ALimit: Integer): IIderisNotaFiscal;
begin
  if (ALimit > LIMITE_MAXIMO) or (ALimit < LIMITE_MINIMO) then
    raise Exception.Create(LIMIT_INVALIDO);
  FLimit := ALimit;
  Result := Self;
end;

class function TIderisNotaFiscalService.New: IIderisNotaFiscal;
begin
  Result := TIderisNotaFiscalService.Create;
end;

function TIderisNotaFiscalService.Numero(const ANumeroNotaFiscal: string): IIderisNotaFiscal;
begin
  FNumero := ANumeroNotaFiscal;
  Result := Self;
end;

function TIderisNotaFiscalService.Offset(const AOffset: Integer): IIderisNotaFiscal;
begin
  if AOffset < OFFSET_MINIMO then
    raise Exception.Create(OFFSET_INVALIDO);
  FOffset := AOffset;
  Result := Self;
end;

function TIderisNotaFiscalService.Processo: IIderisNotaFiscalProcesso;
begin
  Result := TIderisNotaFiscalProcessoService.Create;
end;

function TIderisNotaFiscalService.Serie(const ASerieNotaFiscal: string): IIderisNotaFiscal;
begin
  FSerie := ASerieNotaFiscal;
  Result := Self;
end;

{ TIderisNotaFiscalProcessoService }

function TIderisNotaFiscalProcessoService.Post(const AProcesso: TIderisNotaFiscalProcesso): TIderisNotaFiscalProcesso;
begin
  Result := TIderisRequest<TIderisNotaFiscalProcesso>.New.Resource(PATH_NOTA_FISCAL).Post(AProcesso);
end;

end.

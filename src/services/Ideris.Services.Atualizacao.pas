unit Ideris.Services.Atualizacao;

interface

uses Ideris.DTO.Result, Ideris.Models.Atualizacao;

type
  IIderisAtualizacao = interface
    ['{4E97CACE-469A-48A4-8741-183EDF119A3E}']
    /// <remarks>
    ///   O valor máximo do limit é 50 (cinquenta).
    /// </remarks>
    function Limit(const ALimit: Integer): IIderisAtualizacao;
    function Offset(const AOffset: Integer): IIderisAtualizacao;
    function Get: TIderisResultDTO<TIderisAtualizacao>;
  end;

  TIderisAtualizacaoService = class(TInterfacedObject, IIderisAtualizacao)
  private
    FLimit: Integer;
    FOffset: Integer;
    function Limit(const ALimit: Integer): IIderisAtualizacao;
    function Offset(const AOffset: Integer): IIderisAtualizacao;
    function Get: TIderisResultDTO<TIderisAtualizacao>; overload;
  public
    constructor Create;
    class function New: IIderisAtualizacao;
  end;

implementation

uses System.SysUtils, Ideris.Providers.Consts, Ideris.Providers.Request;

{ TIderisAtualizacaoService }

constructor TIderisAtualizacaoService.Create;
begin
  FLimit := LIMITE_DEFAULT;
  FOffset := OFFSET_DEFAULT;
end;

function TIderisAtualizacaoService.Get: TIderisResultDTO<TIderisAtualizacao>;
begin
  Result := TIderisRequest<TIderisResultDTO<TIderisAtualizacao>>.New
    .Resource(PATH_ATUALIZACAO)
    .AddQueryParam(PARAMETRO_LIMIT, FLimit.ToString)
    .AddQueryParam(PARAMETRO_OFFSET, FOffset.ToString)
    .Get;
end;

function TIderisAtualizacaoService.Limit(const ALimit: Integer): IIderisAtualizacao;
begin
  if (ALimit > LIMITE_MAXIMO) or (ALimit < LIMITE_MINIMO) then
    raise Exception.Create(LIMIT_INVALIDO);
  FLimit := ALimit;
  Result := Self;
end;

class function TIderisAtualizacaoService.New: IIderisAtualizacao;
begin
  Result := TIderisAtualizacaoService.Create;
end;

function TIderisAtualizacaoService.Offset(const AOffset: Integer): IIderisAtualizacao;
begin
  if AOffset < OFFSET_MINIMO then
    raise Exception.Create(OFFSET_INVALIDO);
  FOffset := AOffset;
  Result := Self;
end;

end.

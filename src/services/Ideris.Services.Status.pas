unit Ideris.Services.Status;

interface

uses Ideris.DTO.Result, Ideris.Models.Status;

type
  IIderisStatus = interface
    ['{726C76E0-4292-438A-99A3-A51F4804685A}']
    /// <remarks>
    ///   O valor máximo do limit é 50 (cinquenta).
    /// </remarks>
    function Limit(const ALimit: Integer): IIderisStatus;
    function Offset(const AOffset: Integer): IIderisStatus;
    function Get: TIderisResultDTO<TIderisStatus>;
  end;

  TIderisStatusService = class(TInterfacedObject, IIderisStatus)
  private
    FLimit: Integer;
    FOffset: Integer;
    function Limit(const ALimit: Integer): IIderisStatus;
    function Offset(const AOffset: Integer): IIderisStatus;
    function Get: TIderisResultDTO<TIderisStatus>;
  public
    constructor Create;
    class function New: IIderisStatus;
  end;

implementation

uses System.SysUtils, Ideris.Providers.Consts, Ideris.Providers.Request;

{ TIderisStatusService }

constructor TIderisStatusService.Create;
begin
  FLimit := LIMITE_DEFAULT;
  FOffset := OFFSET_DEFAULT;
end;

function TIderisStatusService.Get: TIderisResultDTO<TIderisStatus>;
begin
  Result := TIderisRequest<TIderisResultDTO<TIderisStatus>>.New
    .Resource(PATH_STATUS)
    .AddQueryParam(PARAMETRO_LIMIT, FLimit.ToString)
    .AddQueryParam(PARAMETRO_OFFSET, FOffset.ToString)
    .Get;
end;

function TIderisStatusService.Limit(const ALimit: Integer): IIderisStatus;
begin
  if (ALimit > LIMITE_MAXIMO) or (ALimit < LIMITE_MINIMO) then
    raise Exception.Create(LIMIT_INVALIDO);
  FLimit := ALimit;
  Result := Self;
end;

class function TIderisStatusService.New: IIderisStatus;
begin
  Result := TIderisStatusService.Create;
end;

function TIderisStatusService.Offset(const AOffset: Integer): IIderisStatus;
begin
  if AOffset < OFFSET_MINIMO then
    raise Exception.Create(OFFSET_INVALIDO);
  FOffset := AOffset;
  Result := Self;
end;

end.

unit Ideris.Services.Departamento;

interface

uses Ideris.DTO.Result, Ideris.Models.Produto.Departamento;

type
  IIderisDepartamento = interface
    ['{028E0083-0D1C-4525-BEFC-43CDC56E473C}']
    /// <remarks>
    ///   O valor máximo do limit é 50 (cinquenta).
    /// </remarks>
    function Limit(const ALimit: Integer): IIderisDepartamento;
    function Offset(const AOffset: Integer): IIderisDepartamento;
    function Departamento(const ADepartamento: string): IIderisDepartamento;
    function Get: TIderisResultDTO<TIderisProdutoDepartamento>; overload;
    function Get(const AIdDepartamento: Integer): TIderisProdutoDepartamento; overload;
    function Post(const ADepartamento: TIderisProdutoDepartamento): TIderisProdutoDepartamento;
  end;

  TIderisDepartamentoService = class(TInterfacedObject, IIderisDepartamento)
  private
    FLimit: Integer;
    FOffset: Integer;
    FDepartamento: string;
    function Limit(const ALimit: Integer): IIderisDepartamento;
    function Offset(const AOffset: Integer): IIderisDepartamento;
    function Departamento(const ADepartamento: string): IIderisDepartamento;
    function Get: TIderisResultDTO<TIderisProdutoDepartamento>; overload;
    function Get(const AIdDepartamento: Integer): TIderisProdutoDepartamento; overload;
    function Post(const ADepartamento: TIderisProdutoDepartamento): TIderisProdutoDepartamento;
  public
    constructor Create;
    class function New: IIderisDepartamento;
  end;

implementation

uses System.SysUtils, Ideris.Providers.Consts, Ideris.Providers.Request;

{ TIderisDepartamentoService }

constructor TIderisDepartamentoService.Create;
begin
  FLimit := LIMITE_DEFAULT;
  FOffset := OFFSET_DEFAULT;
end;

function TIderisDepartamentoService.Departamento(const ADepartamento: string): IIderisDepartamento;
begin
  FDepartamento := ADepartamento;
  Result := Self;
end;

function TIderisDepartamentoService.Get: TIderisResultDTO<TIderisProdutoDepartamento>;
var
  LRequest: IIderisRequest<TIderisResultDTO<TIderisProdutoDepartamento>>;
begin
  LRequest := TIderisRequest<TIderisResultDTO<TIderisProdutoDepartamento>>.New
    .Resource(PATH_DEPARTAMENTO)
    .AddQueryParam(PARAMETRO_LIMIT, FLimit.ToString)
    .AddQueryParam(PARAMETRO_OFFSET, FOffset.ToString);
  if not FDepartamento.Trim.IsEmpty then
    LRequest.AddQueryParam('descricao', FDepartamento);
  Result := LRequest.Get;
end;

function TIderisDepartamentoService.Get(const AIdDepartamento: Integer): TIderisProdutoDepartamento;
begin
  Result := TIderisRequest<TIderisProdutoDepartamento>.New.Resource(PATH_DEPARTAMENTO).ResourceSuffix(AIdDepartamento).Get;
end;

function TIderisDepartamentoService.Limit(const ALimit: Integer): IIderisDepartamento;
begin
  if (ALimit > LIMITE_MAXIMO) or (ALimit < LIMITE_MINIMO) then
    raise Exception.Create(LIMIT_INVALIDO);
  FLimit := ALimit;
  Result := Self;
end;

class function TIderisDepartamentoService.New: IIderisDepartamento;
begin
  Result := TIderisDepartamentoService.Create;
end;

function TIderisDepartamentoService.Offset(const AOffset: Integer): IIderisDepartamento;
begin
  if AOffset < OFFSET_MINIMO then
    raise Exception.Create(OFFSET_INVALIDO);
  FOffset := AOffset;
  Result := Self;
end;

function TIderisDepartamentoService.Post(const ADepartamento: TIderisProdutoDepartamento): TIderisProdutoDepartamento;
begin
  Result := TIderisRequest<TIderisProdutoDepartamento>.New.Resource(PATH_DEPARTAMENTO).Post(ADepartamento);
end;

end.

unit Ideris.Services.Conta;

interface

uses Ideris.DTO.Result, Ideris.Models.Conta;

type
  IIderisConta = interface
    ['{528BBB31-04E2-4C84-94C8-C4B4BF723A8B}']
    /// <summary>
    ///   ID's dos pedidos separados por virgula.
    /// </summary>
    /// <remarks>
    ///   O número máximo de ID's que pode ser informado é 50 (cinquenta).
    /// </remarks>
    function IDs(const AContas: string): IIderisConta;
    function Get: TIderisResultDTO<TIderisConta>;
  end;

  TIderisContaService = class(TInterfacedObject, IIderisConta)
  private
    FContas: string;
    function IDs(const AContas: string): IIderisConta;
    function Get: TIderisResultDTO<TIderisConta>;
  public
    class function New: IIderisConta;
  end;

implementation

uses Ideris.Providers.Request, Ideris.Providers.Consts, System.SysUtils;

{ TIderisContaService }

function TIderisContaService.IDs(const AContas: string): IIderisConta;
const
  NUMERO_MAXIMO_CONTAS = 50;
begin
  if Length(AContas.Split([','])) > NUMERO_MAXIMO_CONTAS then
    raise Exception.Create('O número máximo de contas que pode ser informado é 50 (cinquenta).');
  FContas := AContas;
  Result := Self;
end;

function TIderisContaService.Get: TIderisResultDTO<TIderisConta>;
var
  LRequest: IIderisRequest<TIderisResultDTO<TIderisConta>>;
begin
  LRequest := TIderisRequest<TIderisResultDTO<TIderisConta>>.New
    .Resource(PATH_CONTA);
  if not FContas.Trim.IsEmpty then
    LRequest.AddQueryParam('ids', FContas);
  Result := LRequest.Get;
end;

class function TIderisContaService.New: IIderisConta;
begin
  Result := TIderisContaService.Create;
end;

end.

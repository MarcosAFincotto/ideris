unit Ideris.Models.Pedido.Lista;

interface

type
  TIderisPedidoLista = class
  private
    FNomeContaMarketplace: string;
    FCodigo: string;
    FImagemPedidoItem: string;
    FId: Integer;
    FMarketplace: string;
    FStatus: string;
    FIdContaMarketplace: string;
    FIntermediadorNome: string;
    FCodigoCarrinhoCompras: string;
    FIdAutenticacaoIderis: Integer;
    FData: TDateTime;
    FIntermediadorCnpj: string;
  public
    property Id: Integer read FId write FId;
    property Codigo: string read FCodigo write FCodigo;
    property Marketplace: string read FMarketplace write FMarketplace;
    property IdAutenticacaoIderis: Integer read FIdAutenticacaoIderis write FIdAutenticacaoIderis;
    property IdContaMarketplace: string read FIdContaMarketplace write FIdContaMarketplace;
    property NomeContaMarketplace: string read FNomeContaMarketplace write FNomeContaMarketplace;
    property Status: string read FStatus write FStatus;
    property Data: TDateTime read FData write FData;
    property CodigoCarrinhoCompras: string read FCodigoCarrinhoCompras write FCodigoCarrinhoCompras;
    property ImagemPedidoItem: string read FImagemPedidoItem write FImagemPedidoItem;
    property IntermediadorNome: string read FIntermediadorNome write FIntermediadorNome;
    property IntermediadorCnpj: string read FIntermediadorCnpj write FIntermediadorCnpj;
  end;

implementation

end.

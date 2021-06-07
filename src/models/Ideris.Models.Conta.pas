unit Ideris.Models.Conta;

interface

type
  TIderisConta = class
  private
    FNomeContaMarketplace: string;
    FMarketplace: string;
    FIdContaMarketplace: string;
    FIdPedido: Integer;
    FStatusContaMarketplace: string;
    FIdAutenticacaoIderis: Integer;
    FMensagemRetorno: string;
    FMarketplaceId: Integer;
  public
    /// <summary>
    ///   ID do pedido para busca da conta do marketplace.
    /// </summary>
    property IdPedido: Integer read FIdPedido write FIdPedido;
    /// <summary>
    ///   ID do marketplace onde o pedido foi realizado.
    /// </summary>
    property MarketplaceId: Integer read FMarketplaceId write FMarketplaceId;
    /// <summary>
    ///   Descrição do marketplace onde o pedido foi realizado.
    /// </summary>
    property Marketplace: string read FMarketplace write FMarketplace;
    /// <summary>
    ///   Código de autenticação da conta no Ideris.
    /// </summary>
    property IdAutenticacaoIderis: Integer read FIdAutenticacaoIderis write FIdAutenticacaoIderis;
    /// <summary>
    ///   ID da conta do marketplace onde o pedido foi realizado.
    /// </summary>
    property IdContaMarketplace: string read FIdContaMarketplace write FIdContaMarketplace;
    /// <summary>
    ///   Nome da conta do marketplace onde o pedido foi realizado.
    /// </summary>
    property NomeContaMarketplace: string read FNomeContaMarketplace write FNomeContaMarketplace;
    /// <summary>
    ///   Status atual da conta do marketplace onde o pedido foi realizado.
    /// </summary>
    property StatusContaMarketplace: string read FStatusContaMarketplace write FStatusContaMarketplace;
    /// <summary>
    ///   Mensagem de retorno caso tiver algum problema ao buscar a conta do marketplace. Ex: Não implementado.
    /// </summary>
    property MensagemRetorno: string read FMensagemRetorno write FMensagemRetorno;
  end;

implementation

end.

unit Ideris.Models.Pedido;

interface

uses Ideris.Models.Pedido.Item, Ideris.Models.Pedido.Pagamento, REST.Json.Types;

type
  /// <remarks>
  ///   As informações de endereço pode ser vazio ou nulo. 
  ///   Quando vazio ou nulo significa que o cliente escolheu "Retirada em mãos" ao comprar o produto.
  ///   Nesses casos, o campo "TipoEntrega" será "A combinar".
  /// </remarks>
  TIderisPedido = class
  private
    FPagamento: TArray<TIderisPedidoPagamento>;
    FItem: TArray<TIderisPedidoItem>;
    FEnderecoEntregaCidade: string;
    FEnderecoEntregaPais: string;
    FEnderecoEntregaEstado: string;
    FEnderecoEntregaRua: string;
    FEnderecoEntregaCompleto: string;
    [JSONNameAttribute('enderecoEntrega_NomeResponsavelRecebimento')]
    FEnderecoEntregaNomeResponsavelRecebimento: string;
    FEnderecoEntregaBairro: string;
    [JSONNameAttribute('enderecoEntrega_TelefoneResponsavelRecebimento')]
    FEnderecoEntregaTelefoneResponsavelRecebimento: string;
    FEnderecoEntregaComentario: string;
    FCompradorTelefone: string;
    FEnderecoEntregaCep: string;
    FEnderecoEntregaNumero: string;
    FCompradorCodigoAreaTelefone: string;
    FIntermediadorNome: string;
    FIntermediadorCnpj: string;
    FNomeContaMarketplace: string;
    FValorSobrou: Double;
    FCompradorDocumento: string;
    FTipoEntrega: string;
    FMetodoRastreio: string;
    FTarifaEnvio: Double;
    FValorDesconto: Double;
    FTotalDebitado: Double;
    FCodigo: string;
    FMoeda: string;
    FFreteComprador: Double;
    FId: Integer;
    FMarketplace: string;
    FNumeroRastreio: string;
    FCompradorPrimeiroNome: string;
    FStatus: string;
    FValorTotal: Double;
    FCodigoEntrega: string;
    FIdContaMarketplace: string;
    FCompradorSobrenome: string;
    FTarifaVenda: Double;
    FValorPago: Double;
    FCompradorEmail: string;
    FCodigoCarrinhoCompras: string;
    FIdAutenticacaoIderis: Integer;
    FCompradorApelido: string;
    FData: TDateTime;
    FCompradorTipoDocumento: string;
    FTotalLiquido: Double;
    FCustoProduto: Double;
    FValorTotalComFrete: Double;
  public
    /// <summary>
    ///   ID do pedido junto ao Ideris.
    /// </summary>
    property Id: Integer read FId write FId;
    /// <summary>
    ///   Data de aprovação do pedido.
    /// </summary>
    property Data: TDateTime read FData write FData;
    /// <summary>
    ///   Código do pedido junto ao Ideris;
    /// </summary>
    property Codigo: string read FCodigo write FCodigo;
    /// <summary>
    ///   Valor total do pedido com frete.
    /// </summary>
    property ValorTotalComFrete: Double read FValorTotalComFrete write FValorTotalComFrete;
    /// <summary>
    ///   Valor pago pelo pedido.
    /// </summary>
    property ValorPago: Double read FValorPago write FValorPago;
    /// <summary>
    ///   Valor total do pedido.
    /// </summary>
    property ValorTotal: Double read FValorTotal write FValorTotal;
    /// <summary>
    ///   Valor da tarifa de envio do pedido.
    /// </summary>
    property TarifaEnvio: Double read FTarifaEnvio write FTarifaEnvio;
    /// <summary>
    ///   Valor da tarifa de venda do pedido.
    /// </summary>
    property TarifaVenda: Double read FTarifaVenda write FTarifaVenda;
    /// <summary>
    ///   Valor do total debitado do pedido.
    /// </summary>
    property TotalDebitado: Double read FTotalDebitado write FTotalDebitado;
    /// <summary>
    ///   Valor do custo do produto.
    /// </summary>
    property CustoProduto: Double read FCustoProduto write FCustoProduto;
    /// <summary>
    ///   Valor da sobra resultante do ValorTotal - TotalDebitado.
    /// </summary>
    property ValorSobrou: Double read FValorSobrou write FValorSobrou;
    /// <summary>
    ///   Valor liquido do pedido.
    /// </summary>
    property TotalLiquido: Double read FTotalLiquido write FTotalLiquido;
    /// <summary>
    ///   Valor do desconto aplicado no pedido.
    /// </summary>
    property ValorDesconto: Double read FValorDesconto write FValorDesconto;
    /// <summary>
    ///   Valor do frete pago pelo comprador.
    /// </summary>
    property FreteComprador: Double read FFreteComprador write FFreteComprador;
    /// <summary>
    ///   Moeda utilizada no pedido.
    /// </summary>
    property Moeda: string read FMoeda write FMoeda;
    /// <summary>
    ///   Tipo da entrega desse produto. Ex: Mercado Envios, Mercado Pago, Fulfillment.
    /// </summary>
    property TipoEntrega: string read FTipoEntrega write FTipoEntrega;
    /// <summary>
    ///   Marketplace no qual o pedido foi realizado.
    /// </summary>
    property Marketplace: string read FMarketplace write FMarketplace;
    /// <summary>
    ///   Código de autenticação da conta no Ideris.
    /// </summary>
    property IdAutenticacaoIderis: Integer read FIdAutenticacaoIderis write FIdAutenticacaoIderis;
    /// <summary>
    ///   ID da conta no marketplace.
    /// </summary>
    property IdContaMarketplace: string read FIdContaMarketplace write FIdContaMarketplace;
    /// <summary>
    ///   Bine da conta no marketplace.
    /// </summary>
    property NomeContaMarketplace: string read FNomeContaMarketplace write FNomeContaMarketplace;
    /// <summary>
    ///   Status atual do pedido.
    /// </summary>
    property Status: string read FStatus write FStatus;
    /// <summary>
    ///   Código da entrega do pedido.
    /// </summary>
    /// <remarks>
    ///   Pedidos com o mesmo código de entrega pertencem a um carrinho de compra.
    /// </remarks>
    property CodigoEntrega: string read FCodigoEntrega write FCodigoEntrega;
    /// <summary>
    ///   Número do carrinho de compras do pedido (Mercado Livre).
    /// </summary>
    property CodigoCarrinhoCompras: string read FCodigoCarrinhoCompras write FCodigoCarrinhoCompras;
    /// <summary>
    ///   Método de rastreio do pedido.
    /// </summary>
    property MetodoRastreio: string read FMetodoRastreio write FMetodoRastreio;
    /// <summary>
    ///   Número de rastreio do pedido.
    /// </summary>
    property NumeroRastreio: string read FNumeroRastreio write FNumeroRastreio;
    /// <summary>
    ///   Primeiro nome do comprador.
    /// </summary>
    property CompradorPrimeiroNome: string read FCompradorPrimeiroNome write FCompradorPrimeiroNome;
    /// <summary>
    ///   Sobrenome do comprador.
    /// </summary>
    property CompradorSobrenome: string read FCompradorSobrenome write FCompradorSobrenome;
    /// <summary>
    ///   Apelido do comprador.
    /// </summary>
    property CompradorApelido: string read FCompradorApelido write FCompradorApelido;
    /// <summary>
    ///   Email do comprador.
    /// </summary>
    property CompradorEmail: string read FCompradorEmail write FCompradorEmail;
    /// <summary>
    ///   Tipo do documento do comprador.
    /// </summary>
    property CompradorTipoDocumento: string read FCompradorTipoDocumento write FCompradorTipoDocumento;
    /// <summary>
    ///   Número do documento do comprador.
    /// </summary>
    property CompradorDocumento: string read FCompradorDocumento write FCompradorDocumento;
    /// <summary>
    ///   Código de área (DDD) do comprador.
    /// </summary>
    property CompradorCodigoAreaTelefone: string read FCompradorCodigoAreaTelefone write FCompradorCodigoAreaTelefone;
    /// <summary>
    ///   Número de telefone do comprador.
    /// </summary>
    property CompradorTelefone: string read FCompradorTelefone write FCompradorTelefone;
    /// <summary>
    ///   Endereço completo de onde será feito a entrega.
    /// </summary>
    property EnderecoEntregaCompleto: string read FEnderecoEntregaCompleto write FEnderecoEntregaCompleto;
    /// <summary>
    ///   Rua de onde será feito a entrega.
    /// </summary>
    property EnderecoEntregaRua: string read FEnderecoEntregaRua write FEnderecoEntregaRua;
    /// <summary>
    ///   Número de onde será feito a entrega.
    /// </summary>
    property EnderecoEntregaNumero: string read FEnderecoEntregaNumero write FEnderecoEntregaNumero;
    /// <summary>
    ///   CEP de onde será feito a entrega.
    /// </summary>
    property EnderecoEntregaCep: string read FEnderecoEntregaCep write FEnderecoEntregaCep;
    /// <summary>
    ///   Bairro de onde será feito a entrega.
    /// </summary>
    property EnderecoEntregaBairro: string read FEnderecoEntregaBairro write FEnderecoEntregaBairro;
    /// <summary>
    ///   Cidade onde será feito a entrega.
    /// </summary>
    property EnderecoEntregaCidade: string read FEnderecoEntregaCidade write FEnderecoEntregaCidade;
    /// <summary>
    ///   Estado onde será feito a entrega.
    /// </summary>
    property EnderecoEntregaEstado: string read FEnderecoEntregaEstado write FEnderecoEntregaEstado;
    /// <summary>
    ///   País onde será feito a entrega.
    /// </summary>
    property EnderecoEntregaPais: string read FEnderecoEntregaPais write FEnderecoEntregaPais;
    /// <summary>
    ///   Comentário do endereço onde será feito a entrega.
    /// </summary>
    property EnderecoEntregaComentario: string read FEnderecoEntregaComentario write FEnderecoEntregaComentario;
    /// <summary>
    ///   Nome do responsável para receber a entrega.
    /// </summary>
    property EnderecoEntregaNomeResponsavelRecebimento: string read FEnderecoEntregaNomeResponsavelRecebimento write FEnderecoEntregaNomeResponsavelRecebimento;
    /// <summary>
    ///   Número de telefone do responsável para receber a entrega.
    /// </summary>
    property EnderecoEntregaTelefoneResponsavelRecebimento: string read FEnderecoEntregaTelefoneResponsavelRecebimento write FEnderecoEntregaTelefoneResponsavelRecebimento;
    /// <summary>
    ///   Nome de intermediador.
    /// </summary>
    property IntermediadorNome: string read FIntermediadorNome write FIntermediadorNome;
    /// <summary>
    ///   CNPJ de intermediador.
    /// </summary>
    property IntermediadorCnpj: string read FIntermediadorCnpj write FIntermediadorCnpj;
    /// <summary>
    ///   Agrupa os itens do pedido.
    /// </summary>
    property Item: TArray<TIderisPedidoItem> read FItem write FItem;
    /// <summary>
    ///   Agrupa os pagamentos do pedido.
    /// </summary>
    property Pagamento: TArray<TIderisPedidoPagamento> read FPagamento write FPagamento;
    destructor Destroy; override;
  end;

implementation

{ TIderisPedido }

destructor TIderisPedido.Destroy;
var
  LIderisPedidoItem: TIderisPedidoItem;
  LIderisPedidoPagamento: TIderisPedidoPagamento;
begin
  for LIderisPedidoItem in Item do
    LIderisPedidoItem.Free;
  for LIderisPedidoPagamento in Pagamento do
    LIderisPedidoPagamento.Free;
  inherited;
end;

end.

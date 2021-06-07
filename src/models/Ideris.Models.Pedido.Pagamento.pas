unit Ideris.Models.Pedido.Pagamento;

interface

type
  TIderisPedidoPagamento = class
  private
    FTaxaMercadoPago: Double;
    FStatusPagamento: string;
    FFormaPagamento: string;
    FDataAprovacaoPagamento: TDateTime;
    FTaxaMercadoLivre: Double;
    FNumeroParcelasPagamento: Integer;
    FCodigoPagamento: string;
  public
    /// <summary>
    ///   Código do pagamento do pedido.
    /// </summary>
    property CodigoPagamento: string read FCodigoPagamento write FCodigoPagamento;
    /// <summary>
    ///   Data de aprovação do pagamento do pedido.
    /// </summary>
    property DataAprovacaoPagamento: TDateTime read FDataAprovacaoPagamento write FDataAprovacaoPagamento;
    /// <summary>
    ///   Status atual do pagamento do pedido.
    /// </summary>
    property StatusPagamento: string read FStatusPagamento write FStatusPagamento;
    /// <summary>
    ///   Forma de pagamento do pedido.
    /// </summary>
    property FormaPagamento: string read FFormaPagamento write FFormaPagamento;
    /// <summary>
    ///   Quantidade de parcelas do pagamento do pedido.
    /// </summary>
    property NumeroParcelasPagamento: Integer read FNumeroParcelasPagamento write FNumeroParcelasPagamento;
    /// <remarks>
    ///   Campo substituído pelo "TarifaVenda" no nó principal.
    /// </remarks>
    property TaxaMercadoPago: Double read FTaxaMercadoPago write FTaxaMercadoPago;
    /// <remarks>
    ///   Campo substituído pelo "TarifaVenda" no nó principal.
    /// </remarks>
    property TaxaMercadoLivre: Double read FTaxaMercadoLivre write FTaxaMercadoLivre;
  end;

implementation

end.

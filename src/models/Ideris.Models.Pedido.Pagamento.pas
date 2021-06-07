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
    ///   C�digo do pagamento do pedido.
    /// </summary>
    property CodigoPagamento: string read FCodigoPagamento write FCodigoPagamento;
    /// <summary>
    ///   Data de aprova��o do pagamento do pedido.
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
    ///   Campo substitu�do pelo "TarifaVenda" no n� principal.
    /// </remarks>
    property TaxaMercadoPago: Double read FTaxaMercadoPago write FTaxaMercadoPago;
    /// <remarks>
    ///   Campo substitu�do pelo "TarifaVenda" no n� principal.
    /// </remarks>
    property TaxaMercadoLivre: Double read FTaxaMercadoLivre write FTaxaMercadoLivre;
  end;

implementation

end.

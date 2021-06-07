unit Ideris.Models.Pedido.Item;

interface

type
  TIderisPedidoItem = class
  private
    FPrecoUnitarioItem: Double;
    FCaminhoImagemItem: string;
    FQuantidadeItem: Integer;
    FSkuProdutoItem: string;
    FCodigoProduto: string;
    FTituloProdutoItem: string;
    FCodigoProdutoItem: string;
  public
    /// <summary>
    ///   Título do item do pedido.
    /// </summary>
    property TituloProdutoItem: string read FTituloProdutoItem write FTituloProdutoItem;
    /// <summary>
    ///   SKU do item do pedido.
    /// </summary>
    property SkuProdutoItem: string read FSkuProdutoItem write FSkuProdutoItem;
    /// <summary>
    ///   Código do item do pedido no Ideris.
    /// </summary>
    property CodigoProduto: string read FCodigoProduto write FCodigoProduto;
    /// <summary>
    ///   Código do item do pedido no marketplace.
    /// </summary>
    property CodigoProdutoItem: string read FCodigoProdutoItem write FCodigoProdutoItem;
    /// <summary>
    ///   Quantidade total desse item do pedido.
    /// </summary>
    property QuantidadeItem: Integer read FQuantidadeItem write FQuantidadeItem;
    /// <summary>
    ///   Valor unitário o item do pedido.
    /// </summary>
    property PrecoUnitarioItem: Double read FPrecoUnitarioItem write FPrecoUnitarioItem;
    /// <summary>
    ///   Caminho da imagem do item do pedido.
    /// </summary>
    property CaminhoImagemItem: string read FCaminhoImagemItem write FCaminhoImagemItem;
  end;

implementation

end.

unit Ideris.Models.Produto.Composto;

interface

type
  TIderisProdutoComposto = class
  private
    FIdProdutoVinculado: Integer;
    FQuantidadeProdutoVinculado: Integer;
    FSkuProdutoVinculado: string;
  public
    /// <summary>
    ///   ID do produto vinculado ao produto composto.
    /// </summary>
    property IdProdutoVinculado: Integer read FIdProdutoVinculado write FIdProdutoVinculado;
    /// <summary>
    ///   Código SKU do produto vinculado ao produto composto.
    /// </summary>
    property SkuProdutoVinculado: string read FSkuProdutoVinculado write FSkuProdutoVinculado;
    /// <summary>
    ///   Quantidade do produto vinculado ao produto composto.
    /// </summary>
    property QuantidadeProdutoVinculado: Integer read FQuantidadeProdutoVinculado write FQuantidadeProdutoVinculado;
  end;

implementation

end.

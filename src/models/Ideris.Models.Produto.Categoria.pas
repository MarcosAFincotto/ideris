unit Ideris.Models.Produto.Categoria;

interface

type
  TIderisProdutoCategoria = class
  private
    FDescricao: string;
    FId: Integer;
  public
    /// <summary>
    ///   ID da categoria junto ao Ideris.
    /// </summary>
    property Id: Integer read FId write FId;
    /// <summary>
    ///   Descri��o da categoria junto ao Ideris.
    /// </summary>
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

end.

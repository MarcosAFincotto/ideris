unit Ideris.Models.Produto.Marca;

interface

type
  TIderisProdutoMarca = class
  private
    FDescricao: string;
    FId: Integer;
  public
    /// <summary>
    ///   ID da marca junto ao Ideris.
    /// </summary>
    property Id: Integer read FId write FId;
    /// <summary>
    ///   Descrição da marca junto ao Ideris.
    /// </summary>
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

end.

unit Ideris.Models.Produto.SubCategoria;

interface

type
  TIderisProdutoSubCategoria = class
  private
    FDescricao: string;
    FId: Integer;
  public
    /// <summary>
    ///   ID da sub categoria junto ao Ideris.
    /// </summary>
    property Id: Integer read FId write FId;
    /// <summary>
    ///   Descrição da sub categoria junto ao Ideris.
    /// </summary>
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

end.

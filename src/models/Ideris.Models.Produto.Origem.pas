unit Ideris.Models.Produto.Origem;

interface

type
  TIderisProdutoOrigem = class
  private
    FDescricao: string;
    FCodigo: string;
    FId: Integer;
  public
    /// <summary>
    ///   ID da origem do produto junto ao Ideris.
    /// </summary>
    property Id: Integer read FId write FId;
    /// <summary>
    ///   Descrição da origem do produto junto ao Ideris.
    /// </summary>
    property Descricao: string read FDescricao write FDescricao;
    /// <summary>
    ///   Código da origem do produto junto ao Ideris.
    /// </summary>
    property Codigo: string read FCodigo write FCodigo;
  end;

implementation

end.

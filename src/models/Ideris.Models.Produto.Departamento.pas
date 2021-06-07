unit Ideris.Models.Produto.Departamento;

interface

type
  TIderisProdutoDepartamento = class
  private
    FDescricao: string;
    FId: Integer;
  public
    /// <summary>
    ///   ID do departamento junto ao Ideris.
    /// </summary>
    property Id: Integer read FId write FId;
    /// <summary>
    ///   Descrição do departamento junto ao Ideris.
    /// </summary>
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

end.

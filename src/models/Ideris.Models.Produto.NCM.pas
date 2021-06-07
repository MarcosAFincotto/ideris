unit Ideris.Models.Produto.NCM;

interface

type
  TIderisProdutoNCM = class
  private
    FDescricao: string;
    FCodigo: string;
    FId: Integer;
  public
    /// <summary>
    ///   ID do NCM junto ao Ideris.
    /// </summary>
    property Id: Integer read FId write FId;
    /// <summary>
    ///   Descrição do NCM junto ao Ideris.
    /// </summary>
    property Descricao: string read FDescricao write FDescricao;
    /// <summary>
    ///   Código do NCM junto ao Ideris.
    /// </summary>
    property Codigo: string read FCodigo write FCodigo;
  end;

implementation

end.

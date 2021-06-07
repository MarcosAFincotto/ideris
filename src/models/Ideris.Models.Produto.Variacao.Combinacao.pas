unit Ideris.Models.Produto.Variacao.Combinacao;

interface

type
  TIderisProdutoVariacaoCombinacao = class
  private
    FTipoVariacaoId: Integer;
    FDescricao: string;
    FTipoVariacaoValorId: Integer;
    FTipoVariacao: string;
    FTipoVariacaoValor: string;
  public
    /// <summary>
    ///   ID do tipo de variação.
    /// </summary>
    property TipoVariacaoId: Integer read FTipoVariacaoId write FTipoVariacaoId;
    /// <summary>
    ///   Descrição do tipo de variação.
    /// </summary>
    property TipoVariacao: string read FTipoVariacao write FTipoVariacao;
    /// <summary>
    ///   Descrição um pouco mais detalhada da variação.
    /// </summary>
    property Descricao: string read FDescricao write FDescricao;
    /// <summary>
    ///   ID do valor do tipo de variação.
    /// </summary>
    property TipoVariacaoValorId: Integer read FTipoVariacaoValorId write FTipoVariacaoValorId;
    /// <summary>
    ///   Descrição do valor do tipo de variação.
    /// </summary>
    property TipoVariacaoValor: string read FTipoVariacaoValor write FTipoVariacaoValor;
  end;

implementation

end.

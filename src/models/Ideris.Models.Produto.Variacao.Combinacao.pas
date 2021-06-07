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
    ///   ID do tipo de varia��o.
    /// </summary>
    property TipoVariacaoId: Integer read FTipoVariacaoId write FTipoVariacaoId;
    /// <summary>
    ///   Descri��o do tipo de varia��o.
    /// </summary>
    property TipoVariacao: string read FTipoVariacao write FTipoVariacao;
    /// <summary>
    ///   Descri��o um pouco mais detalhada da varia��o.
    /// </summary>
    property Descricao: string read FDescricao write FDescricao;
    /// <summary>
    ///   ID do valor do tipo de varia��o.
    /// </summary>
    property TipoVariacaoValorId: Integer read FTipoVariacaoValorId write FTipoVariacaoValorId;
    /// <summary>
    ///   Descri��o do valor do tipo de varia��o.
    /// </summary>
    property TipoVariacaoValor: string read FTipoVariacaoValor write FTipoVariacaoValor;
  end;

implementation

end.

unit Ideris.Models.Atualizacao;

interface

type
  TIderisAtualizacao = class
  private
    FDescricao: string;
    FDescricaoLonga: string;
    FCriticidade: string;
    FData: string;
  public
    /// <summary>
    ///   Descri��o da atualiza��o.
    /// </summary>
    property Descricao: string read FDescricao write FDescricao;
    /// <summary>
    ///   Descri��o mais detalhada da atualiza��o.
    /// </summary>
    property DescricaoLonga: string read FDescricaoLonga write FDescricaoLonga;
    /// <summary>
    ///   N�vel de impacto da atualiza��o.
    /// </summary>
    property Criticidade: string read FCriticidade write FCriticidade;
    /// <summary>
    ///   Data que a atualiza��o foi publicada.
    /// </summary>
    property Data: string read FData write FData;
  end;

implementation

end.

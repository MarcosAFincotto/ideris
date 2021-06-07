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
    ///   Descrição da atualização.
    /// </summary>
    property Descricao: string read FDescricao write FDescricao;
    /// <summary>
    ///   Descrição mais detalhada da atualização.
    /// </summary>
    property DescricaoLonga: string read FDescricaoLonga write FDescricaoLonga;
    /// <summary>
    ///   Nível de impacto da atualização.
    /// </summary>
    property Criticidade: string read FCriticidade write FCriticidade;
    /// <summary>
    ///   Data que a atualização foi publicada.
    /// </summary>
    property Data: string read FData write FData;
  end;

implementation

end.

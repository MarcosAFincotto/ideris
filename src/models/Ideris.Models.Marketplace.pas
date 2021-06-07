unit Ideris.Models.Marketplace;

interface

type
  TIderisMarketplace = class
  private
    FDescricao: string;
    FId: Integer;
  public
    /// <summary>
    ///   ID do marketplace.
    /// </summary>
    property Id: Integer read FId write FId;
    /// <summary>
    ///   Nome do marketplace.
    /// </summary>
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

end.

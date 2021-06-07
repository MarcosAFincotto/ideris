unit Ideris.Models.Status;

interface

type
  TIderisStatus = class
  private
    FDescricao: string;
    FId: Integer;
    FModulo: string;
  public
    /// <summary>
    ///   ID do status.
    /// </summary>
    property Id: Integer read FId write FId;
    /// <summary>
    ///   Descrição do status.
    /// </summary>
    property Descricao: string read FDescricao write FDescricao;
    /// <summary>
    ///   Descrição de onde esse status é utilizado. Ex: Pedido, Nota Fiscal, Anúncio
    /// </summary>
    property Modulo: string read FModulo write FModulo;
  end;

implementation

end.

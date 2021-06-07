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
    ///   Descri��o do status.
    /// </summary>
    property Descricao: string read FDescricao write FDescricao;
    /// <summary>
    ///   Descri��o de onde esse status � utilizado. Ex: Pedido, Nota Fiscal, An�ncio
    /// </summary>
    property Modulo: string read FModulo write FModulo;
  end;

implementation

end.

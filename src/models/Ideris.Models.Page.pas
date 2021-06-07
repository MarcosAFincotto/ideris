unit Ideris.Models.Page;

interface

type
  TIderisPage = class
  private
    FCount: Integer;
    FLimit: Integer;
    FTotal: Integer;
    FOffset: Integer;
  public
    /// <summary>
    ///   Limite de registros retornados.
    /// </summary>
    /// <remarks>
    ///   O limite máximo é 50.
    /// </remarks>
    property Limit: Integer read FLimit write FLimit;
    /// <summary>
    ///   Registro de início para busca no banco de dados.
    /// </summary>
    property Offset: Integer read FOffset write FOffset;
    /// <summary>
    ///   Número de registros retornados.
    /// </summary>
    property Count: Integer read FCount write FCount;
    /// <summary>
    ///   Número total de registros.
    /// </summary>
    property Total: Integer read FTotal write FTotal;
  end;

implementation

end.

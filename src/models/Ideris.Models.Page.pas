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
    ///   O limite m�ximo � 50.
    /// </remarks>
    property Limit: Integer read FLimit write FLimit;
    /// <summary>
    ///   Registro de in�cio para busca no banco de dados.
    /// </summary>
    property Offset: Integer read FOffset write FOffset;
    /// <summary>
    ///   N�mero de registros retornados.
    /// </summary>
    property Count: Integer read FCount write FCount;
    /// <summary>
    ///   N�mero total de registros.
    /// </summary>
    property Total: Integer read FTotal write FTotal;
  end;

implementation

end.

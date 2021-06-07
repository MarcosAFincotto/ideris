unit Ideris.Models.NotaFiscal.Historico;

interface

type
  TIderisNotaFiscalHistorico = class
  private
    FStatusNota: string;
    FDataRegistro: TDateTime;
    FXmlNota: string;
    FChaveNota: string;
    FUrlDanfe: string;
    FDataEmissao: TDateTime;
    FSerieNota: string;
    FNumeroNota: string;
  public
    /// <summary>
    ///   N�mero da nota fiscal do hist�rico.
    /// </summary>
    property NumeroNota: string read FNumeroNota write FNumeroNota;
    /// <summary>
    ///   S�rie da nota fiscal do hist�rico.
    /// </summary>
    property SerieNota: string read FSerieNota write FSerieNota;
    /// <summary>
    ///   Chave de acesso da nota fiscal do hist�rico.
    /// </summary>
    property ChaveNota: string read FChaveNota write FChaveNota;
    /// <summary>
    ///   URL da Danfe fiscal do hist�rico.
    /// </summary>
    property UrlDanfe: string read FUrlDanfe write FUrlDanfe;
    /// <summary>
    ///   Data de emiss�o da nota fiscal do hist�rico.
    /// </summary>
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    /// <summary>
    ///   Status da nota fiscal do hist�rico.
    /// </summary>
    property StatusNota: string read FStatusNota write FStatusNota;
    /// <summary>
    ///   XML da nota fiscal do hist�rico.
    /// </summary>
    property XmlNota: string read FXmlNota write FXmlNota;
    /// <summary>
    ///   Data da altera��o da nota fiscal.
    /// </summary>
    property DataRegistro: TDateTime read FDataRegistro write FDataRegistro;
  end;

implementation

end.

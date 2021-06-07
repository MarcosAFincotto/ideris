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
    ///   Número da nota fiscal do histórico.
    /// </summary>
    property NumeroNota: string read FNumeroNota write FNumeroNota;
    /// <summary>
    ///   Série da nota fiscal do histórico.
    /// </summary>
    property SerieNota: string read FSerieNota write FSerieNota;
    /// <summary>
    ///   Chave de acesso da nota fiscal do histórico.
    /// </summary>
    property ChaveNota: string read FChaveNota write FChaveNota;
    /// <summary>
    ///   URL da Danfe fiscal do histórico.
    /// </summary>
    property UrlDanfe: string read FUrlDanfe write FUrlDanfe;
    /// <summary>
    ///   Data de emissão da nota fiscal do histórico.
    /// </summary>
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    /// <summary>
    ///   Status da nota fiscal do histórico.
    /// </summary>
    property StatusNota: string read FStatusNota write FStatusNota;
    /// <summary>
    ///   XML da nota fiscal do histórico.
    /// </summary>
    property XmlNota: string read FXmlNota write FXmlNota;
    /// <summary>
    ///   Data da alteração da nota fiscal.
    /// </summary>
    property DataRegistro: TDateTime read FDataRegistro write FDataRegistro;
  end;

implementation

end.

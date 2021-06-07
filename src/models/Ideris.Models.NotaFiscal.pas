unit Ideris.Models.NotaFiscal;

interface

uses Ideris.Models.NotaFiscal.Historico;

type
  TIderisNotaFiscal = class
  private
    FStatusNota: string;
    FDataEmissaoNota: TDateTime;
    FHistorico: TArray<TIderisNotaFiscalHistorico>;
    FXmlNota: string;
    FTipoNota: string;
    FChaveNota: string;
    FUrlDanfe: string;
    FIdPedido: Integer;
    FSerieNota: Integer;
    FNumeroNota: Integer;
    FProcesso: Integer;
  public
    /// <summary>
    ///   ID do pedido vinculado a Nota Fiscal.
    /// </summary>
    property IdPedido: Integer read FIdPedido write FIdPedido;
    /// <summary>
    ///   ID do processo a ser realizado na nota fiscal.
    /// </summary>
    property Processo: Integer read FProcesso write FProcesso;
    /// <summary>
    ///   Chave de acesso da nota fiscal. Campo de 44 caracteres numéricos.
    /// </summary>
    property ChaveNota: string read FChaveNota write FChaveNota;
    /// <summary>
    ///   Número da nota fiscal.
    /// </summary>
    property NumeroNota: Integer read FNumeroNota write FNumeroNota;
    /// <summary>
    ///   Série da nota fiscal.
    /// </summary>
    property SerieNota: Integer read FSerieNota write FSerieNota;
    /// <summary>
    ///   Data de emissão da nota fiscal.
    /// </summary>
    property DataEmissaoNota: TDateTime read FDataEmissaoNota write FDataEmissaoNota;
    /// <summary>
    ///   URL da Danfe da nota fiscal.
    /// </summary>
    property UrlDanfe: string read FUrlDanfe write FUrlDanfe;
    /// <summary>
    ///   Tipo da nota fiscal.
    /// </summary>
    property TipoNota: string read FTipoNota write FTipoNota;
    /// <summary>
    ///   Status da nota fiscal.
    /// </summary>
    property StatusNota: string read FStatusNota write FStatusNota;
    /// <summary>
    ///   XML da nota fiscal.
    /// </summary>
    property XmlNota: string read FXmlNota write FXmlNota;
    property Historico: TArray<TIderisNotaFiscalHistorico> read FHistorico write FHistorico;
  end;

implementation

end.

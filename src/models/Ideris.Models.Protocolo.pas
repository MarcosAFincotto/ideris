unit Ideris.Models.Protocolo;

interface

type
  TIderisProtocolo = class
  private
    FCodigo: string;
    FId: Integer;
    FTipoFeed: string;
    FStatus: string;
    FMensagem: string;
    FDataCriacao: TDateTime;
  public
    /// <summary>
    ///   ID do protocolo.
    /// </summary>
    property Id: Integer read FId write FId;
    /// <summary>
    ///   Data de criação do protocolo.
    /// </summary>
    property DataCriacao: TDateTime read FDataCriacao write FDataCriacao;
    /// <summary>
    ///   Código GUID do protocolo.
    /// </summary>
    property Codigo: string read FCodigo write FCodigo;
    /// <summary>
    ///   Tipo do protocolo (Ex: Cadastro de produto).
    /// </summary>
    property TipoFeed: string read FTipoFeed write FTipoFeed;
    /// <summary>
    ///   Status do protocolo (Ex: Pendente ou Finalizado).
    /// </summary>
    property Status: string read FStatus write FStatus;
    /// <summary>
    ///   Mensagem do protocolo.
    /// </summary>
    /// <remarks>
    ///   Se status for 'Finalizado' e a mensagem estiver vazia significa que o processo foi concluído com sucesso.
    ///   Se o status for 'Finalizado' e a mensagem estiver preenchida signigica que houve algum problema durante o processo.
    /// </remarks>
    property Mensagem: string read FMensagem write FMensagem;
  end;

implementation

end.

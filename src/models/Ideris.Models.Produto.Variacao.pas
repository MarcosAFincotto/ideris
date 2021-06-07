unit Ideris.Models.Produto.Variacao;

interface

uses Ideris.Models.Produto.Variacao.Combinacao;

type
  TIderisProdutoVariacao = class
  private
    FVariacaoId: Integer;
    FCaminhoImagemVariacao: string;
    FSkuVariacao: string;
    FQuantidadeVariacao: Integer;
    FQuantidadeVariacaoReserva: Integer;
    FCombinacao: TArray<TIderisProdutoVariacaoCombinacao>;
  public
    /// <summary>
    ///   ID da varia��o.
    /// </summary>
    property VariacaoId: Integer read FVariacaoId write FVariacaoId;
    /// <summary>
    ///   Quantidade em estoque da varia��o.
    /// </summary>
    property QuantidadeVariacao: Integer read FQuantidadeVariacao write FQuantidadeVariacao;
    /// <summary>
    ///   Quantidade em reserva de estoque da varia��o. S�o unidades que est�o aguardando confirma��o do pagamento.
    /// </summary>
    property QuantidadeVariacaoReserva: Integer read FQuantidadeVariacaoReserva write FQuantidadeVariacaoReserva;
    /// <summary>
    ///   C�digo SKU da varia��o.
    /// </summary>
    property SkuVariacao: string read FSkuVariacao write FSkuVariacao;
    /// <summary>
    ///   Caminho da imagem da varia��o.
    /// </summary>
    property CaminhoImagemVariacao: string read FCaminhoImagemVariacao write FCaminhoImagemVariacao;
    /// <summary>
    ///   Agrupa as combina��es da varia��o. Ex: Cor, Tamanho
    /// </summary>
    /// <remarks>
    ///   Quando n�o h� combina��es esse n� ficar� vazio.
    /// </remarks>
    property Combinacao: TArray<TIderisProdutoVariacaoCombinacao> read FCombinacao write FCombinacao;
    destructor Destroy; override;
  end;

implementation

{ TIderisProdutoVariacao }

destructor TIderisProdutoVariacao.Destroy;
var
  LIderisProdutoVariacaoCombinacao: TIderisProdutoVariacaoCombinacao;
begin
  for LIderisProdutoVariacaoCombinacao in Combinacao do
    LIderisProdutoVariacaoCombinacao.Free;
  inherited;
end;

end.

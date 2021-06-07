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
    ///   ID da variação.
    /// </summary>
    property VariacaoId: Integer read FVariacaoId write FVariacaoId;
    /// <summary>
    ///   Quantidade em estoque da variação.
    /// </summary>
    property QuantidadeVariacao: Integer read FQuantidadeVariacao write FQuantidadeVariacao;
    /// <summary>
    ///   Quantidade em reserva de estoque da variação. São unidades que estão aguardando confirmação do pagamento.
    /// </summary>
    property QuantidadeVariacaoReserva: Integer read FQuantidadeVariacaoReserva write FQuantidadeVariacaoReserva;
    /// <summary>
    ///   Código SKU da variação.
    /// </summary>
    property SkuVariacao: string read FSkuVariacao write FSkuVariacao;
    /// <summary>
    ///   Caminho da imagem da variação.
    /// </summary>
    property CaminhoImagemVariacao: string read FCaminhoImagemVariacao write FCaminhoImagemVariacao;
    /// <summary>
    ///   Agrupa as combinações da variação. Ex: Cor, Tamanho
    /// </summary>
    /// <remarks>
    ///   Quando não há combinações esse nó ficará vazio.
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

unit Ideris.Models.Produto;

interface

uses Ideris.Models.Produto.Composto, Ideris.Models.Produto.Variacao, Ideris.Models.Produto.Imagem;

type
  TIderisProduto = class
  private
    FNcmId: Integer;
    FMarcaIdIderis: Integer;
    FSubCategoriaIdIderis: Integer;
    FCategoriaIdIderis: Integer;
    FDepartamentoIdIderis: Integer;
    FEstoquePrincipalId: Integer;
    FImagem: TArray<TIderisProdutoImagem>;
    FCategoriaML: string;
    FPeso: Double;
    FGarantia: string;
    FDepartamentoId: Integer;
    FTitulo: string;
    FValorCusto: Double;
    FLarguraEmbalagem: Double;
    FProdutoComposto: TArray<TIderisProdutoComposto>;
    FValorVenda: Double;
    FMarcaId: Integer;
    FQuantidadeEstoquePrincipal: Integer;
    FTipoProdutoId: Integer;
    FCest: string;
    FAltura: Double;
    FProdutoOrigemId: Integer;
    FDescricaoLonga: string;
    FUltimaAlteracaoPreco: TDateTime;
    FSubCategoria: string;
    FModelo: string;
    FId: Integer;
    FComprimentoEmbalagem: Double;
    FCategoria: string;
    FQuantidadeEstoquePrincipalReserva: Integer;
    FNcm: string;
    FLargura: Double;
    FCaminhoImagem: string;
    FDepartamento: string;
    FSku: string;
    FPesoEmbalagem: Double;
    FMarca: string;
    FEan: string;
    FTipoProduto: string;
    FComprimento: Double;
    FSubCategoriaId: Integer;
    FProdutoOrigem: string;
    FVariacao: TArray<TIderisProdutoVariacao>;
    FAlturaEmbalagem: Double;
    FCategoriaId: Integer;
  public
    /// <summary>
    ///   ID do produto.
    /// </summary>
    property Id: Integer read FId write FId;
    /// <summary>
    ///   C�digo SKU do produto.
    /// </summary>
    property Sku: string read FSku write FSku;
    /// <summary>
    ///   T�tulo do produto.
    /// </summary>
    property Titulo: string read FTitulo write FTitulo;
    /// <summary>
    ///   Descri��o longa do produto.
    /// </summary>
    property DescricaoLonga: string read FDescricaoLonga write FDescricaoLonga;
    /// <summary>
    ///   ID da marca do produto.
    /// </summary>
    property MarcaId: Integer read FMarcaId write FMarcaId;
    /// <summary>
    ///   Descri��o da marca.
    /// </summary>
    property Marca: string read FMarca write FMarca;
    /// <summary>
    ///   ID do departamento.
    /// </summary>
    property DepartamentoId: Integer read FDepartamentoId write FDepartamentoId;
    /// <summary>
    ///   Descri��o do departamento.
    /// </summary>
    property Departamento: string read FDepartamento write FDepartamento;
    /// <summary>
    ///   ID da categoria.
    /// </summary>
    property CategoriaId: Integer read FCategoriaId write FCategoriaId;
    /// <summary>
    ///   Descri��o da categoria.
    /// </summary>
    property Categoria: string read FCategoria write FCategoria;
    /// <summary>
    ///   ID da sub categoria.
    /// </summary>
    property SubCategoriaId: Integer read FSubCategoriaId write FSubCategoriaId;
    /// <summary>
    ///   Descri��o da sub categoria.
    /// </summary>
    property SubCategoria: string read FSubCategoria write FSubCategoria;
    /// <summary>
    ///   Descri��o do modelo.
    /// </summary>
    property Modelo: string read FModelo write FModelo;
    /// <summary>
    ///   Descri��o da garantia.
    /// </summary>
    property Garantia: string read FGarantia write FGarantia;
    /// <summary>
    ///   Peso do produto (em gramas).
    /// </summary>
    property Peso: Double read FPeso write FPeso;
    /// <summary>
    ///   Comprimento do produto (em cent�metros).
    /// </summary>
    property Comprimento: Double read FComprimento write FComprimento;
    /// <summary>
    ///   Largura do produto (em cent�metros).
    /// </summary>
    property Largura: Double read FLargura write FLargura;
    /// <summary>
    ///   Altura do produto (em cent�metros).
    /// </summary>
    property Altura: Double read FAltura write FAltura;
    /// <summary>
    ///   Peso do produto embalado (em quilos).
    /// </summary>
    property PesoEmbalagem: Double read FPesoEmbalagem write FPesoEmbalagem;
    /// <summary>
    ///   Comprimento do produto embalado (em metros).
    /// </summary>
    property ComprimentoEmbalagem: Double read FComprimentoEmbalagem write FComprimentoEmbalagem;
    /// <summary>
    ///   Largura do produto embalado (em metros).
    /// </summary>
    property LarguraEmbalagem: Double read FLarguraEmbalagem write FLarguraEmbalagem;
    /// <summary>
    ///   Altura do produto embalado (em metros).
    /// </summary>
    property AlturaEmbalagem: Double read FAlturaEmbalagem write FAlturaEmbalagem;
    /// <summary>
    ///   ID do NCM.
    /// </summary>
    property NcmId: Integer read FNcmId write FNcmId;
    /// <summary>
    ///   C�digo NCM.
    /// </summary>
    property Ncm: string read FNcm write FNcm;
    /// <summary>
    ///   ID do produto origem.
    /// </summary>
    property ProdutoOrigemId: Integer read FProdutoOrigemId write FProdutoOrigemId;
    /// <summary>
    ///   Descri��o do produto origem.
    /// </summary>
    property ProdutoOrigem: string read FProdutoOrigem write FProdutoOrigem;
    /// <summary>
    ///   Descri��o do CEST.
    /// </summary>
    property Cest: string read FCest write FCest;
    /// <summary>
    ///   Descri��o do c�digo EAN.
    /// </summary>
    property Ean: string read FEan write FEan;
    /// <summary>
    ///   ID do tipo do produto.
    /// </summary>
    property TipoProdutoId: Integer read FTipoProdutoId write FTipoProdutoId;
    /// <summary>
    ///   Descri��o do tipo do produto.
    /// </summary>
    property TipoProduto: string read FTipoProduto write FTipoProduto;
    /// <summary>
    ///   Caminho da imagem do produto.
    /// </summary>
    property CaminhoImagem: string read FCaminhoImagem write FCaminhoImagem;
    /// <summary>
    ///   ID do estoque do produto.
    /// </summary>
    property EstoquePrincipalId: Integer read FEstoquePrincipalId write FEstoquePrincipalId;
    /// <summary>
    ///   Quantidade total em estoque do produto.
    /// </summary>
    /// <remarks>
    ///   Em caso de varia��es, esse valor � o somat�rio do estoque das varia��es.
    /// </remarks>
    property QuantidadeEstoquePrincipal: Integer read FQuantidadeEstoquePrincipal write FQuantidadeEstoquePrincipal;
    /// <summary>
    ///   Quantidade em reserva da varia��o. S�o unidades que est�o aguardando confirma��o do pagamento.
    /// </summary>
    /// <remarks>
    ///   Para produtos com varia��o deve-se buscar a quantidade reserva da varia��o.
    /// </remarks>
    property QuantidadeEstoquePrincipalReserva: Integer read FQuantidadeEstoquePrincipalReserva write FQuantidadeEstoquePrincipalReserva;
    /// <summary>
    ///   Valor de custo do produto.
    /// </summary>
    property ValorCusto: Double read FValorCusto write FValorCusto;
    /// <summary>
    ///   Valor de venda do produto.
    /// </summary>
    property ValorVenda: Double read FValorVenda write FValorVenda;
    /// <summary>
    ///   Data da �ltima altera��o do valor do produto.
    /// </summary>
    property UltimaAlteracaoPreco: TDateTime read FUltimaAlteracaoPreco write FUltimaAlteracaoPreco;
    /// <summary>
    ///   Agrupa as varia��es do produto.
    /// </summary>
    /// <remarks>
    ///   Quando n�o h� varia��o esse n� ficar� vazio.
    /// </remarks>
    property Variacao: TArray<TIderisProdutoVariacao> read FVariacao write FVariacao;
    /// <summary>
    ///   Agrupa os produtos vinculados do produto composto.
    /// </summary>
    /// <remarks>
    ///   Quando for produto simples ou produto com varia��o esse campo ficar� vazio.
    /// </remarks>
    property ProdutoComposto: TArray<TIderisProdutoComposto> read FProdutoComposto write FProdutoComposto;
    property Imagem: TArray<TIderisProdutoImagem> read FImagem write FImagem;
    property MarcaIdIderis: Integer read FMarcaIdIderis write FMarcaIdIderis;
    property SubCategoriaIdIderis: Integer read FSubCategoriaIdIderis write FSubCategoriaIdIderis;
    property CategoriaIdIderis: Integer read FCategoriaIdIderis write FCategoriaIdIderis;
    property DepartamentoIdIderis: Integer read FDepartamentoIdIderis write FDepartamentoIdIderis;
    property CategoriaML: string read FCategoriaML write FCategoriaML;
    procedure AddImagemUrl(const AUrlImagem: string);
    procedure AddImagemBase64(const AImagemBase64: string);
    destructor Destroy; override;
  end;

implementation

{ TIderisProduto }

uses System.SysUtils;

procedure TIderisProduto.AddImagemBase64(const AImagemBase64: string);
var
  LImagem: TIderisProdutoImagem;
begin
  LImagem := TIderisProdutoImagem.Create;
  LImagem.ImagemBase64 := AImagemBase64;
  FImagem := FImagem + [LImagem];
end;

procedure TIderisProduto.AddImagemUrl(const AUrlImagem: string);
var
  LImagem: TIderisProdutoImagem;
begin
  LImagem := TIderisProdutoImagem.Create;
  LImagem.UrlImagem := AUrlImagem;
  FImagem := FImagem + [LImagem];
end;

destructor TIderisProduto.Destroy;
var
  LIderisProdutoImagem: TIderisProdutoImagem;
  LIderisProdutoVariacao: TIderisProdutoVariacao;
  LIderisProdutoComposto: TIderisProdutoComposto;
begin
  for LIderisProdutoImagem in Imagem do
    LIderisProdutoImagem.Free;
  for LIderisProdutoVariacao in Variacao do
    LIderisProdutoVariacao.Free;
  for LIderisProdutoComposto in ProdutoComposto do
    LIderisProdutoComposto.Free;
  inherited;
end;

end.

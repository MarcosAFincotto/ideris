unit Ideris.Services;

interface

uses Ideris.Services.Marca, Ideris.Services.Atualizacao, Ideris.Services.Categoria, Ideris.Services.Conta, Ideris.Models.Status,
  Ideris.Services.Departamento, Ideris.Services.Marketplace, Ideris.Services.NotaFiscal, Ideris.Services.Pedido,
  Ideris.Models.Produto.Composto, Ideris.Models.Produto.Departamento, Ideris.Models.Produto.NCM, Ideris.Models.Produto.Origem,
  Ideris.Models.Produto, Ideris.Models.Produto.SubCategoria, Ideris.Models.Produto.Variacao.Combinacao, Ideris.Models.Page,
  Ideris.Services.Produto.NCM, Ideris.Services.Produto.Origem, Ideris.Services.Produto, Ideris.Services.Protocolo,
  Ideris.Models.Pedido.Item, Ideris.Models.Pedido.Pagamento, Ideris.Models.NotaFiscal, Ideris.Models.Produto.Categoria,
  Ideris.Services.Status, Ideris.Services.SubCategoria, Ideris.Models.Produto.Marca, Ideris.Models.Atualizacao,
  Ideris.Models.Marketplace, Ideris.Models.NotaFiscal.Historico, Ideris.Models.Pedido, Ideris.Models.Produto.Variacao,
  Ideris.Models.Conta, Ideris.Models.Protocolo, Ideris.Models.Pedido.Lista, Ideris.Models.NotaFiscal.Processo;

type
  TIderisProduto = Ideris.Models.Produto.TIderisProduto;
  TIderisProdutoMarca = Ideris.Models.Produto.Marca.TIderisProdutoMarca;
  TIderisProdutoCategoria = Ideris.Models.Produto.Categoria.TIderisProdutoCategoria;
  TIderisProdutoVariacao = Ideris.Models.Produto.Variacao.TIderisProdutoVariacao;
  TIderisProdutoSubCategoria = Ideris.Models.Produto.SubCategoria.TIderisProdutoSubCategoria;
  TIderisProdutoOrigem = Ideris.Models.Produto.Origem.TIderisProdutoOrigem;
  TIderisProdutoNCM = Ideris.Models.Produto.NCM.TIderisProdutoNCM;
  TIderisProdutoDepartamento = Ideris.Models.Produto.Departamento.TIderisProdutoDepartamento;
  TIderisProdutoComposto = Ideris.Models.Produto.Composto.TIderisProdutoComposto;
  TIderisProtocolo = Ideris.Models.Protocolo.TIderisProtocolo;
  TIderisConta = Ideris.Models.Conta.TIderisConta;
  TIderisMarketplace = Ideris.Models.Marketplace.TIderisMarketplace;
  TIderisAtualizacao = Ideris.Models.Atualizacao.TIderisAtualizacao;
  TIderisNotaFiscal = Ideris.Models.NotaFiscal.TIderisNotaFiscal;
  TIderisNotaFiscalProcesso = Ideris.Models.NotaFiscal.Processo.TIderisNotaFiscalProcesso;
  TIderisPedido = Ideris.Models.Pedido.TIderisPedido;
  TIderisPedidoLista = Ideris.Models.Pedido.Lista.TIderisPedidoLista;
  TIderisPage = Ideris.Models.Page.TIderisPage;
  TIderisStatus = Ideris.Models.Status.TIderisStatus;

  IIderis = interface
    ['{C9011975-9C03-4891-A580-B7189557489C}']
    function Marcas: IIderisMarca;
    function Departamentos: IIderisDepartamento;
    function Categorias: IIderisCategoria;
    function SubCategorias: IIderisSubCategoria;
    function Atualizacoes: IIderisAtualizacao;
    function Status: IIderisStatus;
    function Marketplaces: IIderisMarketplace;
    function Protocolos: IIderisProtocolo;
    function Origens: IIderisOrigem;
    function NCM: IIderisNCM;
    function Contas: IIderisConta;
    function Produtos: IIderisProduto;
    function Pedidos: IIderisPedido;
    function NotasFiscais: IIderisNotaFiscal;
  end;

  TIderis = class(TInterfacedObject, IIderis)
  private
    function Marcas: IIderisMarca;
    function Departamentos: IIderisDepartamento;
    function Categorias: IIderisCategoria;
    function SubCategorias: IIderisSubCategoria;
    function Atualizacoes: IIderisAtualizacao;
    function Status: IIderisStatus;
    function Marketplaces: IIderisMarketplace;
    function Protocolos: IIderisProtocolo;
    function Origens: IIderisOrigem;
    function NCM: IIderisNCM;
    function Contas: IIderisConta;
    function Produtos: IIderisProduto;
    function Pedidos: IIderisPedido;
    function NotasFiscais: IIderisNotaFiscal;
  public
    class function New: IIderis;
  end;

implementation

uses System.SysUtils;

{ TIderis }

function TIderis.Atualizacoes: IIderisAtualizacao;
begin
  Result := TIderisAtualizacaoService.New;
end;

function TIderis.Categorias: IIderisCategoria;
begin
  Result := TIderisCategoriaService.New;
end;

function TIderis.Contas: IIderisConta;
begin
  Result := TIderisContaService.New;
end;

function TIderis.NCM: IIderisNCM;
begin
  Result := TIderisProdutoNCMService.New;
end;

class function TIderis.New: IIderis;
begin
  Result := TIderis.Create;
end;

function TIderis.Departamentos: IIderisDepartamento;
begin
  Result := TIderisDepartamentoService.New;
end;

function TIderis.NotasFiscais: IIderisNotaFiscal;
begin
  Result := TIderisNotaFiscalService.New;
end;

function TIderis.Origens: IIderisOrigem;
begin
  Result := TIderisProdutoOrigemService.New;
end;

function TIderis.Pedidos: IIderisPedido;
begin
  Result := TIderisPedidoService.New;
end;

function TIderis.Produtos: IIderisProduto;
begin
  Result := TIderisProdutoService.New;
end;

function TIderis.Protocolos: IIderisProtocolo;
begin
  Result := TIderisProtocoloService.New;
end;

function TIderis.Status: IIderisStatus;
begin
  Result := TIderisStatusService.New;
end;

function TIderis.SubCategorias: IIderisSubCategoria;
begin
  Result := TIderisSubCategoriaService.New;
end;

function TIderis.Marcas: IIderisMarca;
begin
  Result := TIderisMarcaService.New;
end;

function TIderis.Marketplaces: IIderisMarketplace;
begin
  Result := TIderisMarketplaceService.New;
end;

end.

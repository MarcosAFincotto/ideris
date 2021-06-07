# Ideris
Integração com a plataforma Ideris. O integrador de marketplace mais completo para gerenciar sua operação.

```pascal
uses Ideris.Services, Ideris.DTO.Result;
```

### Autenticação
* A geração do token de autenticação é feita de forma automática pelo componente todas as vezes que o mesmo expira.

### Atualização
* Busca atualizações da API
```pascal
var
  LAtualizacoes: TIderisResultDTO<TIderisAtualizacao>;
begin
  // Os parâmetros Limit e Offset são opcionais.
  LAtualizacoes := TIderis.New.Atualizacoes.Limit(50).Offset(0).Get;  
end;
```

### Status
* Busca lista de status
```pascal
var
  LStatus: TIderisResultDTO<TIderisStatus>;
begin
  // Os parâmetros Limit e Offset são opcionais.
  LStatus := TIderis.New.Status.Limit(50).Offset(0).Get;
end;
```

### Marketplace
* Busca lista de marketplaces integrados ao Ideris
```pascal
var
  LMarketplaces: TIderisResultDTO<TIderisMarketplace>;
begin
  // Os parâmetros Limit e Offset são opcionais.
  LMarketplaces := TIderis.New.Marketplaces.Limit(50).Offset(0).Get;
end;
```

### Protocolo
* Busca protocolos pendentes ou busca protocolo por código
```pascal
var
  LProtocolos: TIderisResultDTO<TIderisProtocolo>;
begin
  // Os parâmetros Limit, Offset, Codigo e Sku são opcionais.
  LProtocolos := TIderis.New.Protocolos.Limit(50).Offset(0).Codigo('').Sku('').Get;
end;
```

### Produto
* Busca da lista de produtos ativos e suas variações ou busca de produto por SKU e suas variações
```pascal
var
  LProdutos: TIderisResultDTO<TIderisProduto>;
begin
  // Os parâmetros Limit, Offset e Sku são opcionais.
  LProdutos := TIderis.New.Produtos.Limit(50).Offset(0).Sku('').Get;
end;
```
* Busca de produto por ID e suas variações
```pascal
var
  LProduto: TIderisProduto;
begin
  LProduto := TIderis.New.Produtos.Get(ID_PRODUTO);
end;
```
* Cadastra produto
```pascal
var
  LProduto: TIderisProduto;
begin
  // Cria um objeto de produto que será destruído ao ser enviado para o Ideris de forma automática
  LProduto := TIderisProduto.Create;
  LProduto.Sku := '987654321';
  LProduto.Titulo := 'Titulo do produto';
  LProduto.DescricaoLonga := 'Descrição longa do produto';
  LProduto.MarcaIdIderis := 1;
  LProduto.SubCategoriaIdIderis := 1;
  LProduto.CategoriaIdIderis := 1;
  LProduto.DepartamentoIdIderis := 8;
  LProduto.CategoriaML := 'MLB5672';
  LProduto.NcmId := 16;
  LProduto.ProdutoOrigemId := 1;
  LProduto.Modelo := 'teste';
  LProduto.Garantia := 'Não tem';
  LProduto.Peso := 10;
  LProduto.Comprimento := 9;
  LProduto.Largura := 8;
  LProduto.Altura := 7;
  LProduto.PesoEmbalagem := 6;
  LProduto.ComprimentoEmbalagem := 5;
  LProduto.LarguraEmbalagem := 4;
  LProduto.AlturaEmbalagem := 3;
  LProduto.Ean := '6655447788';
  LProduto.ValorCusto := 2;
  LProduto.ValorVenda := 397;
  LProduto.QuantidadeEstoquePrincipal := 90;
  LProduto.Cest := '1704900';
  LProduto.AddImagemUrl('https://exemplo.com.br/imagem.png');

  // Cadastra o produto no Ideris e devolve um novo objeto com o ID.
  LProduto := TIderis.New.Produtos.Post(LProduto);
  try
    ShowMessage('Código do produto: ' + LProduto.Id.ToString);
  finally
    LProduto.Free;
  end;
end;
```
  
### Categoria
* Busca lista de categoria ou busca categoria pela descrição
```pascal
var
  LCategorias: TIderisResultDTO<TIderisProdutoCategoria>;
begin
  // Os parâmetros Limit, Offset e Categoria são opcionais.
  LCategorias := TIderis.New.Categorias.Limit(50).Offset(0).Categoria('').Get;
end;
```
* Busca categoria por ID
```pascal
var
  LCategoria: TIderisProdutoCategoria;
begin
  LCategoria := TIderis.New.Categorias.Get(ID_CATEGORIA);
end;
```
* Cadastra categoria
```pascal
var
  LCategoria: TIderisProdutoCategoria;
begin
  // Cria um objeto categoria que será destruído ao ser enviado para o Ideris de forma automática
  LCategoria := TIderisProdutoCategoria.Create;
  LCategoria.Descricao := 'Exemplo';

  // Cadastra a categoria no Ideris e devolve um novo objeto com o ID.
  LCategoria := TIderis.New.Categorias.Post(LCategoria);
  try
    ShowMessage('Código da categoria: ' + LCategoria.Id.ToString);
  finally
    LCategoria.Free;
  end;
end;
```

### Sub Categoria
* Busca lista de sub categoria ou busca sub categoria pela descrição
```pascal
var
  LSubCategorias: TIderisResultDTO<TIderisProdutoSubCategoria>;
begin
  // Os parâmetros Limit, Offset e SubCategoria são opcionais.
  LSubCategorias := TIderis.New.SubCategorias.Limit(50).Offset(0).SubCategoria('').Get;
end;
```
* Busca sub categoria por ID
```pascal
var
  LSubCategoria: TIderisProdutoSubCategoria;
begin
  LSubCategoria := TIderis.New.SubCategorias.Get(ID_SUB_CATEGORIA);
end;
```
* Cadastra sub categoria
```pascal
var
  LSubCategoria: TIderisProdutoSubCategoria;
begin
  // Cria um objeto de sub categoria que será destruído ao ser enviado para o Ideris de forma automática
  LSubCategoria := TIderisProdutoSubCategoria.Create;
  LSubCategoria.Descricao := 'Exemplo';

  // Cadastra a sub categoria no Ideris e devolve um novo objeto com o ID.
  LSubCategoria := TIderis.New.SubCategorias.Post(LSubCategoria);
  try
    ShowMessage('Código da sub categoria: ' + LSubCategoria.Id.ToString);
  finally
    LSubCategoria.Free;
  end;
end;
```

### Marca
* Busca lista de marca ou busca marca pela descrição
```pascal
var
  LMarcas: TIderisResultDTO<TIderisProdutoMarca>;
begin
  // Os parâmetros Limit, Offset e Marca são opcionais.
  LMarcas := TIderis.New.Marcas.Limit(50).Offset(0).Marca('').Get;
end;
```
* Busca marca por ID
```pascal
var
  LMarca: TIderisProdutoMarca;
begin
  LMarca := TIderis.New.Marcas.Get(ID_MARCA);
end;
```
* Cadastra marca
```pascal
var
  LMarca: TIderisProdutoMarca;
begin
  // Cria um objeto marca que será destruído ao ser enviado para o Ideris de forma automática
  LMarca := TIderisProdutoMarca.Create;
  LMarca.Descricao := 'Exemplo';

  // Cadastra a marca no Ideris e devolve um novo objeto com o ID.
  LMarca := TIderis.New.Marcas.Post(LMarca);
  try
    ShowMessage('Código da marca: ' + LMarca.Id.ToString);
  finally
    LMarca.Free;
  end;
end;
```

### Departamento
* Busca lista de departamento ou busca departamento pela descrição
```pascal
var
  LDepartamentos: TIderisResultDTO<TIderisProdutoDepartamento>;
begin
  // Os parâmetros Limit, Offset e Departamento são opcionais.
  LDepartamentos := TIderis.New.Departamentos.Limit(50).Offset(0).Departamento('').Get;
end;
```
* Busca departamento por ID
```pascal
var
  LDepartamento: TIderisProdutoDepartamento;
begin
  LDepartamento := TIderis.New.Departamentos.Get(ID_DEPARTAMENTO);
end;
```
* Cadastra departamento
```pascal
var
  LDepartamento: TIderisProdutoDepartamento;
begin
  // Cria um objeto departamento que será destruído ao ser enviado para o Ideris de forma automática
  LDepartamento := TIderisProdutoDepartamento.Create;
  LDepartamento.Descricao := 'Exemplo';

  // Cadastra o departamento no Ideris e devolve um novo objeto com o ID.
  LDepartamento := TIderis.New.Departamentos.Post(LDepartamento);
  try
    ShowMessage('Código do departamento: ' + LDepartamento.Id.ToString);
  finally
    LDepartamento.Free;
  end;
end;
```

### Origem
* Busca lista de origem do produto
```pascal
var
  LOrigens: TIderisResultDTO<TIderisProdutoOrigem>;
begin
  // Os parâmetros Limit e Offset são opcionais.
  LOrigens := TIderis.New.Origens.Limit(50).Offset(0).Get;
end;
``` 

### Ncm
* Busca lista de ncm
```pascal
var
  LNcms: TIderisResultDTO<TIderisProdutoNCM>;
begin
  // Os parâmetros Limit, Offset e Codigo são opcionais.
  LNcms := TIderis.New.NCM.Limit(50).Offset(0).Codigo('').Get;
end;
```
* Cadastra NCM
```pascal
var
  LNcm: TIderisProdutoNCM;
begin
  // Cria um objeto ncm que será destruído ao ser enviado para o Ideris de forma automática
  LNcm := TIderisProdutoNCM.Create;
  LNcm.Descricao := 'Exemplo';
  LNcm.Codigo := '159753';

  // Cadastra o ncm no Ideris e devolve um novo objeto com o ID.
  LNcm := TIderis.New.NCM.Post(LNcm);
  try
    ShowMessage('Código do NCM: ' + LNcm.Id.ToString);
  finally
    LNcm.Free;
  end;
end;
```
### Pedido
* Busca da lista simplificada de pedidos
```pascal
var
  LPedidos: TIderisResultDTO<TIderisPedidoLista>;
begin
  // Os parâmetros Limit, Offset, DataInicial, DataFinal, Status, Marketplace, CodigoCarrinhoCompra e IdAutenticacaoIderis são opcionais.
  LPedidos := TIderis.New.Pedidos.Limit(50).Offset(0).DataInicial('').DataFinal('').Status('').Marketplace('').CodigoCarrinhoCompra('').IdAutenticacaoIderis('').Get;
end;
```
* Busca de pedido por ID
```pascal
var
  LPedido: TIderisPedido;
begin
  LPedido := TIderis.New.Pedidos.Get(ID_PEDIDO);
end;
```

### Nota fiscal
* Busca nota fiscal
```pascal
var
  LNotaFiscal: TIderisResultDTO<TIderisNotaFiscal>;
begin
  // Os parâmetros Limit, Offset, IdPedido, Numero, Serie e Chave são opcionais.
  LNotaFiscal := TIderis.New.NotasFiscais.Limit(50).Offset(0).IdPedido('').Numero('').Serie('').Chave('').Get;
end;
```
* Processos na nota fiscal
```pascal
var
  LProcesso: TIderisNotaFiscalProcesso;
begin
  // Cria um objeto de processo que será destruído ao ser enviado para o Ideris de forma automática
  LProcesso := TIderisNotaFiscalProcesso.Create;
  LProcesso.IdPedido := 1;
  LProcesso.Processo := 2; // Consultar a documentação da API para maiores informações
  LProcesso.ChaveNota := '11111111111111111111111111111111111111111111';
  LProcesso.NumeroNota := 665544;
  LProcesso.SerieNota := 1;
  LProcesso.DataEmissaoNota := Now;
  LProcesso.UrlDanfe := 'http://localhost:9000/danfe';
  LProcesso.XmlNota := 'http://localhost:9000/xml';

  // Cadastra o processo no Ideris e devolve um novo objeto com o ID.
  LProcesso := TIderis.New.NotasFiscais.Processo.Post(LProcesso);
  try
    ShowMessage('Código do processo: ' + LProcesso.Processo.ToString);
  finally
    LProcesso.Free;
  end;
end;
```

### Conta
* Busca informações da conta pelo ID do pedido
```pascal
var
  LContas: TIderisResultDTO<TIderisConta>;
begin
  LContas := TIderis.New.Contas.IDs(ID_CONTAS).Get;
end;
```

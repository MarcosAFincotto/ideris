unit Ideris.Models.Produto.Imagem;

interface

type
  TIderisProdutoImagem = class
  private
    FImagemBase64: string;
    FUrlImagem: string;
  public
    property UrlImagem: string read FUrlImagem write FUrlImagem;
    property ImagemBase64: string read FImagemBase64 write FImagemBase64;
  end;

implementation

end.

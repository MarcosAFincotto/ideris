unit Ideris.DTO.Result;

interface

uses Ideris.Models.Page, Ideris.Models.Status;

type
  TIderisResultDTO<T: class> = class
  private
    FPaging: TIderisPage;
    FResult: TArray<T>;
  public
    property Paging: TIderisPage read FPaging write FPaging;
    property Result: TArray<T> read FResult write FResult;
    destructor Destroy; override;
  end;

implementation

{ TIderisResultDTO<T> }

destructor TIderisResultDTO<T>.Destroy;
var
  LIderisResult: T;
begin
  Paging.Free;
  for LIderisResult in Result do
    LIderisResult.Free;
  inherited;
end;

end.

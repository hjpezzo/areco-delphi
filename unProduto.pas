unit unProduto;

interface

type TProduto = class
  private
    FID: Integer;
    FCodigoEstoque: String;
    FCodigoVenda: String;
    FDescricao: String;
    FQuantidadeEmEstoque: Integer;
    FValor: Double;

    property QuantidadeEmEstoque: Integer read FQuantidadeEmEstoque write FQuantidadeEmEstoque;
  public
    constructor Create(iID: Integer);
    destructor Destroy; override;

    procedure carregar;
    function incluir: Boolean;
    function alterar: Boolean;
    function excluir: Boolean;

    function saldoEstoque: Integer;
    function acrescentaEstoque(iQuantidade: Integer): Boolean;
    function descontaEstoque(iQuantidade: Integer): Boolean;

    property ID: Integer read FID write FID;
    property CodigoEstoque: String read FCodigoEstoque write FCodigoEstoque;
    property CodigoVenda: String read FCodigoVenda write FCodigoVenda;
    property Descricao: String read FDescricao write FDescricao;
    property Valor: Double read FValor write FValor;
  end;

implementation

uses unDM;

{ TProduto }

constructor TProduto.Create(iID: Integer);
begin
  if (iID = 0) then
  begin
    Self.ID := DM.getChave;
  end
  else
  begin
    Self.ID := iID;
  end;
end;

destructor TProduto.Destroy;
begin
  inherited;
end;

function TProduto.acrescentaEstoque(iQuantidade: Integer): Boolean;
begin
  Self.QuantidadeEmEstoque := Self.QuantidadeEmEstoque + iQuantidade;
  result := alterar;
end;

function TProduto.descontaEstoque(iQuantidade: Integer): Boolean;
begin
  if (iQuantidade > Self.QuantidadeEmEstoque) then
    result := false
  else
  begin
    Self.QuantidadeEmEstoque := Self.QuantidadeEmEstoque - iQuantidade;
    result := alterar;
  end;
end;

function TProduto.saldoEstoque: Integer;
begin
  result := Self.QuantidadeEmEstoque;
end;

procedure TProduto.carregar;
begin
  DM.qryProduto.Close;
  DM.qryProduto.ParamByName('id').asInteger := Self.ID;
  DM.qryProduto.Open;

  Self.FCodigoEstoque := DM.qryProduto.FieldByName('CodigoEstoque').AsString;
  Self.FCodigoVenda := DM.qryProduto.FieldByName('CodigoVenda').AsString;
  Self.FDescricao := DM.qryProduto.FieldByName('Descricao').AsString;
  Self.FQuantidadeEmEstoque := DM.qryProduto.FieldByName('QuantidadeEmEstoque').AsInteger;
  Self.FValor := DM.qryProduto.FieldByName('Valor').AsFloat;

  DM.qryProduto.Close;
end;

function TProduto.excluir: Boolean;
begin
  DM.qryOperacao.Close;
  DM.qryOperacao.SQL.Clear;
  DM.qryOperacao.SQL.Add('Delete From Produto');
  DM.qryOperacao.SQL.Add('where Id = :id');
  DM.qryOperacao.ParamByName('id').AsInteger := Self.ID;
  try
    DM.qryOperacao.ExecSQL;
    DM.trnFirebird.CommitRetaining;
    result := true;
  except
    DM.trnFirebird.RollbackRetaining;
    result := false;
  end;
end;

function TProduto.incluir: Boolean;
begin
  DM.qryOperacao.Close;
  DM.qryOperacao.SQL.Clear;
  DM.qryOperacao.SQL.Add('Insert into Produto');
  DM.qryOperacao.SQL.Add('(Id, CodigoEstoque, CodigoVenda, Descricao, QuantidadeEmEstoque, Valor)');
  DM.qryOperacao.SQL.Add('values');
  DM.qryOperacao.SQL.Add('(:Id, :CodigoEstoque, :CodigoVenda, :Descricao, :QuantidadeEmEstoque, :Valor)');

  DM.qryOperacao.ParamByName('id').AsInteger := Self.ID;
  DM.qryOperacao.ParamByName('CodigoEstoque').AsString := Self.CodigoEstoque;
  DM.qryOperacao.ParamByName('CodigoVenda').AsString := Self.CodigoVenda;
  DM.qryOperacao.ParamByName('Descricao').AsString := Self.Descricao;
  DM.qryOperacao.ParamByName('QuantidadeEmEstoque').AsInteger := Self.QuantidadeEmEstoque;
  DM.qryOperacao.ParamByName('Valor').AsFloat := Self.Valor;

  try
    DM.qryOperacao.ExecSQL;
    DM.trnFirebird.CommitRetaining;
    result := True;
  except
    DM.trnFirebird.RollbackRetaining;
    result := False;
  end;
end;

function TProduto.alterar: Boolean;
begin
  DM.qryOperacao.Close;
  DM.qryOperacao.SQL.Clear;
  DM.qryOperacao.SQL.Add('Update Produto set');
  DM.qryOperacao.SQL.Add('CodigoEstoque = :CodigoEstoque,');
  DM.qryOperacao.SQL.Add('CodigoVenda = :CodigoVenda,');
  DM.qryOperacao.SQL.Add('Descricao = :Descricao,');
  DM.qryOperacao.SQL.Add('QuantidadeEmEstoque = :QuantidadeEmEstoque,');
  DM.qryOperacao.SQL.Add('Valor = :Valor');
  DM.qryOperacao.SQL.Add('Where');
  DM.qryOperacao.SQL.Add('Id = :Id');

  DM.qryOperacao.ParamByName('id').AsInteger := Self.ID;
  DM.qryOperacao.ParamByName('CodigoEstoque').AsString := Self.CodigoEstoque;
  DM.qryOperacao.ParamByName('CodigoVenda').AsString := Self.CodigoVenda;
  DM.qryOperacao.ParamByName('Descricao').AsString := Self.Descricao;
  DM.qryOperacao.ParamByName('QuantidadeEmEstoque').AsInteger := Self.QuantidadeEmEstoque;
  DM.qryOperacao.ParamByName('Valor').AsFloat := Self.Valor;

  try
    DM.qryOperacao.ExecSQL;
    DM.trnFirebird.CommitRetaining;
    result := True;
  except
    DM.trnFirebird.RollbackRetaining;
    result := False;
  end;
end;

end.

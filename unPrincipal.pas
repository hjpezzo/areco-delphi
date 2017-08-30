unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons;

type
  TfmPrincipal = class(TForm)
    dbgProdutos: TDBGrid;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnListagem: TSpeedButton;
    btnSair: TSpeedButton;
    btnEntradaEstoque: TSpeedButton;
    btnSaidaEstoque: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure criarManutencao(operacao: String; idProduto: Integer);
    procedure criarMovimentacao(operacao: String; idProduto: Integer);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnListagemClick(Sender: TObject);
    procedure btnEntradaEstoqueClick(Sender: TObject);
    procedure btnSaidaEstoqueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrincipal: TfmPrincipal;

implementation

uses unDM, unManutencaoProduto, unProduto, unListagemProduto,
  unMovimentacaoEstoque;

{$R *.dfm}

procedure TfmPrincipal.btnSairClick(Sender: TObject);
begin
  Halt;
end;

procedure TfmPrincipal.criarManutencao(operacao: String; idProduto: Integer);
begin
  fmManutencaoProduto := TfmManutencaoProduto.Create(Self);
  fmManutencaoProduto.Produto := TProduto.Create(idProduto);
  fmManutencaoProduto.carregarProduto;
  fmManutencaoProduto.setOperacao(operacao);
  fmManutencaoProduto.ShowModal;
  fmManutencaoProduto.Destroy;
  DM.qryPrincipal.Close;
  DM.qryPrincipal.Open;
end;

procedure TfmPrincipal.btnIncluirClick(Sender: TObject);
begin
  criarManutencao('Incluir', 0);
end;

procedure TfmPrincipal.btnAlterarClick(Sender: TObject);
begin
  if (DM.qryPrincipal.FieldByName('id').AsInteger <> 0) then
    criarManutencao('Alterar', DM.qryPrincipal.FieldByName('id').AsInteger);
end;

procedure TfmPrincipal.btnExcluirClick(Sender: TObject);
begin
  if (DM.qryPrincipal.FieldByName('id').AsInteger <> 0) then
    criarManutencao('Excluir', DM.qryPrincipal.FieldByName('id').AsInteger);
end;

procedure TfmPrincipal.btnListagemClick(Sender: TObject);
begin
  if (DM.qryPrincipal.FieldByName('id').AsInteger <> 0) then
  begin
    fmListagemProduto := TfmListagemProduto.Create(Self);
    fmListagemProduto.repListagem.Print;
    fmListagemProduto.Destroy;
  end;
end;

procedure TfmPrincipal.criarMovimentacao(operacao: String; idProduto: Integer);
begin
  fmMovimentacaoEstoque := TfmMovimentacaoEstoque.Create(Self);
  fmMovimentacaoEstoque.Produto := TProduto.Create(idProduto);
  fmMovimentacaoEstoque.carregarProduto;
  fmMovimentacaoEstoque.setOperacao(operacao);
  fmMovimentacaoEstoque.ShowModal;
  fmMovimentacaoEstoque.Destroy;
  DM.qryPrincipal.Close;
  DM.qryPrincipal.Open;
end;

procedure TfmPrincipal.btnEntradaEstoqueClick(Sender: TObject);
begin
  if (DM.qryPrincipal.FieldByName('id').AsInteger <> 0) then
    criarMovimentacao('Entrada', DM.qryPrincipal.FieldByName('id').AsInteger);
end;

procedure TfmPrincipal.btnSaidaEstoqueClick(Sender: TObject);
begin
  if (DM.qryPrincipal.FieldByName('id').AsInteger <> 0) then
    criarMovimentacao('Saída', DM.qryPrincipal.FieldByName('id').AsInteger);
end;

end.

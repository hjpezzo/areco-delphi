program ControleProdutos;

uses
  Forms,
  unPrincipal in 'unPrincipal.pas' {fmPrincipal},
  unDM in 'unDM.pas' {DM: TDataModule},
  unProduto in 'unProduto.pas',
  unManutencaoProduto in 'unManutencaoProduto.pas' {fmManutencaoProduto},
  unListagemProduto in 'unListagemProduto.pas' {fmListagemProduto},
  unMovimentacaoEstoque in 'unMovimentacaoEstoque.pas' {fmMovimentacaoEstoque};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Controle de Produtos';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.Run;
end.

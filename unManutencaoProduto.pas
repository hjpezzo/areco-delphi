unit unManutencaoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unProduto, Buttons, StdCtrls, ExtCtrls;

type
  TfmManutencaoProduto = class(TForm)
    btnCancelar: TSpeedButton;
    btnConfirmar: TSpeedButton;
    pnlDados: TPanel;
    Label1: TLabel;
    edtID: TEdit;
    Label2: TLabel;
    edtCodigoEstoque: TEdit;
    Label3: TLabel;
    edtCodigoVenda: TEdit;
    Label4: TLabel;
    edtDescricao: TEdit;
    Label5: TLabel;
    edtQuantidadeEmEstoque: TEdit;
    Label6: TLabel;
    edtValor: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    operacao: String;
  public
    { Public declarations }
    Produto: TProduto;
    procedure carregarProduto;
    procedure setOperacao(sDescricao: String);
  end;

var
  fmManutencaoProduto: TfmManutencaoProduto;

implementation

{$R *.dfm}

{ TfmManutencaoProduto }

procedure TfmManutencaoProduto.carregarProduto;
begin
  Produto.carregar;
  edtID.Text := IntToStr(Produto.ID);
  edtCodigoEstoque.Text := Produto.CodigoEstoque;
  edtCodigoVenda.Text := Produto.CodigoVenda;
  edtDescricao.Text := Produto.Descricao;
  edtQuantidadeEmEstoque.Text := IntToStr(Produto.saldoEstoque);
  edtValor.Text := FloatToStr(Produto.Valor);
end;

procedure TfmManutencaoProduto.setOperacao(sDescricao: String);
begin
  operacao := sDescricao;
  fmManutencaoProduto.Caption := fmManutencaoProduto.Caption + ' => ' + sDescricao; 
end;

procedure TfmManutencaoProduto.btnCancelarClick(Sender: TObject);
begin
  Produto.Destroy;
  Close;
end;

procedure TfmManutencaoProduto.btnConfirmarClick(Sender: TObject);
begin
  try
    StrToFloat(edtValor.Text);
  except
    MessageDlg('Valor incorreto!' + #13 + #10 + 'Favor verificar!', mtError, [mbOK], 0);
    edtValor.SetFocus;
    Abort;
  end;

  Produto.ID := StrToInt(edtID.Text);
  Produto.CodigoEstoque := edtCodigoEstoque.Text;
  Produto.CodigoVenda := edtCodigoVenda.Text;
  Produto.Descricao := edtDescricao.Text;
  Produto.Valor := StrToFloat(edtValor.Text);

  if (operacao = 'Incluir') then
  begin
    if (MessageDlg('Confirma inclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      if Produto.incluir then
        MessageDlg('Inclusão realizada com sucesso!', mtError, [mbOK], 0)
      else
        MessageDlg('Falha ao processar inclusão!' + #13 + #10 + 'Favor verificar!', mtError, [mbOK], 0)
  end
  else
  if (operacao = 'Alterar') then
  begin
    if (MessageDlg('Confirma alteração?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      if Produto.alterar then
        MessageDlg('Alteração realizada com sucesso!', mtError, [mbOK], 0)
      else
        MessageDlg('Falha ao processar alteração!' + #13 + #10 + 'Favor verificar!', mtError, [mbOK], 0)
  end
  else
  begin
    if (MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      if Produto.excluir then
        MessageDlg('Exclusão realizada com sucesso!', mtError, [mbOK], 0)
      else
        MessageDlg('Falha ao processar exclusão!' + #13 + #10 + 'Favor verificar!', mtError, [mbOK], 0)
  end;

  Close;
end;

end.

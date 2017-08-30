unit unMovimentacaoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unProduto, StdCtrls, ExtCtrls, Buttons;

type
  TfmMovimentacaoEstoque = class(TForm)
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnlDados: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtID: TEdit;
    edtCodigoEstoque: TEdit;
    edtCodigoVenda: TEdit;
    edtDescricao: TEdit;
    edtQuantidadeEmEstoque: TEdit;
    edtQuantidadeMovimentar: TEdit;
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
  fmMovimentacaoEstoque: TfmMovimentacaoEstoque;

implementation

{$R *.dfm}

{ TfmMovimentacaoEstoque }

procedure TfmMovimentacaoEstoque.btnCancelarClick(Sender: TObject);
begin
  Produto.Destroy;
  Close;
end;

procedure TfmMovimentacaoEstoque.btnConfirmarClick(Sender: TObject);
begin
  try
    StrToInt(edtQuantidadeMovimentar.Text);
  except
    MessageDlg('Valor incorreto!' + #13 + #10 + 'Favor verificar!', mtError, [mbOK], 0);
    edtQuantidadeMovimentar.SetFocus;
    Abort;
  end;

  if (operacao = 'Entrada') then
  begin
    if (MessageDlg('Confirma entrada em estoque?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      if Produto.acrescentaEstoque(StrToInt(edtQuantidadeMovimentar.Text)) then
        MessageDlg('Entrada em estoque realizada com sucesso!', mtError, [mbOK], 0)
      else
        MessageDlg('Falha ao processar entrada em estoque!' + #13 + #10 + 'Favor verificar!', mtError, [mbOK], 0)
  end
  else
  begin
    if (MessageDlg('Confirma saída em estoque?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      if Produto.descontaEstoque(StrToInt(edtQuantidadeMovimentar.Text)) then
        MessageDlg('Saída em estoque realizada com sucesso!', mtError, [mbOK], 0)
      else
        MessageDlg('Falha ao processar saída em estoque!' + #13 + #10 +
                   'Quantidade não pode ser superior ao saldo!' + #13 + #10 +
                   'Favor verificar!', mtError, [mbOK], 0)
  end;

  Close;
end;

procedure TfmMovimentacaoEstoque.carregarProduto;
begin
  Produto.carregar;
  edtID.Text := IntToStr(Produto.ID);
  edtCodigoEstoque.Text := Produto.CodigoEstoque;
  edtCodigoVenda.Text := Produto.CodigoVenda;
  edtDescricao.Text := Produto.Descricao;
  edtQuantidadeEmEstoque.Text := IntToStr(Produto.saldoEstoque);
end;

procedure TfmMovimentacaoEstoque.setOperacao(sDescricao: String);
begin
  operacao := sDescricao;
  fmMovimentacaoEstoque.Caption := fmMovimentacaoEstoque.Caption + ' => ' + sDescricao;
end;

end.

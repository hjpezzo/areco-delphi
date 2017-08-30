unit unDM;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery;

type
  TDM = class(TDataModule)
    dtbFirebird: TIBDatabase;
    trnFirebird: TIBTransaction;
    qryPrincipal: TIBQuery;
    dtsPrincipal: TDataSource;
    qryChave: TIBQuery;
    qryProduto: TIBQuery;
    qryOperacao: TIBQuery;
    qryPrincipalID: TIntegerField;
    qryPrincipalCODIGOESTOQUE: TIBStringField;
    qryPrincipalCODIGOVENDA: TIBStringField;
    qryPrincipalDESCRICAO: TIBStringField;
    qryPrincipalQUANTIDADEEMESTOQUE: TIntegerField;
    qryPrincipalVALOR: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
    function getChave: Integer;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

{ TDM }

function TDM.getChave: Integer;
begin
  qryChave.Close;
  qryChave.Open;
  result := qryChave.FieldByName('chave').AsInteger;
  qryChave.Close;
end;

end.

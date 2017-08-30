unit unListagemProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppVar, ppPrnabl, ppClass, ppCtrls, ppDB, ppDBPipe, ppBands,
  ppCache, ppDesignLayer, ppParameter, ppComm, ppRelatv, ppProd, ppReport;

type
  TfmListagemProduto = class(TForm)
    repListagem: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    srcDados: TppDBPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmListagemProduto: TfmListagemProduto;

implementation

uses unDM;

{$R *.dfm}

end.

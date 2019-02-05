unit LOG251;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe, ppBands, ppPrnabl, ppCtrls, ppVar;

type
  TFToolMaesProv = class(TForm)
    pnlTools: TPanel;
    z1sbGiro: TSpeedButton;
    ppDesigner1: TppDesigner;
    ppRep: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    procedure z1sbGiroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   FToolMaesProv: TFToolMaesProv;

implementation

uses LOGDM1;

{$R *.DFM}

procedure TFToolMaesProv.z1sbGiroClick(Sender: TObject);
var
   sSQL:string;
begin
   sSQL:=' SELECT PROV,PROVDES,PROVRUC,TIPPROVID,TIPPROVDES FROM LOG201 ORDER BY TIPPROVID,PROV';
   DMLOG.cdsReporte.Close;
   DMLOG.cdsReporte.DataRequest(sSQL);
   DMLOG.cdsReporte.Open;
   if DMLOG.cdsReporte.RecordCount>0 then
   begin
		ppRep.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\TipoProveedor.rtm';
		ppRep.Template.LoadFromFile;
    //ppDesigner1.Show;
      ppRep.Print;
   end
   else
   begin
      Raise Exception.Create('No existe registros que mostrar');
   end;
end;

end.

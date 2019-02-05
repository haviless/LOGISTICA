unit LOG610;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ppEndUsr, ppProd, ppClass,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppPrnabl, ppCtrls, ppBands,
  ppCache, ppParameter, ppVar;

type
  TFToolDetOC = class(TForm)
    pnl: TPanel;
    bbtnImprime: TBitBtn;
    ppdbUltCompras: TppDBPipeline;
    pprUltCompras: TppReport;
    ppDesigner1: TppDesigner;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel1: TppLabel;
    ppVariable1: TppVariable;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine1: TppLine;
    ppDBText9: TppDBText;
    ppLabel7: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText10: TppDBText;
    ppFooterBand1: TppFooterBand;
    Timer1: TTimer;
    procedure bbtnImprimeClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolDetOC: TFToolDetOC;
  xAccesoBotones : Boolean;

implementation

{$R *.dfm}
uses LOGDM1, oaAD5000;

procedure TFToolDetOC.bbtnImprimeClick(Sender: TObject);
var
   xSQL : String;
   xNumItems : Integer;
begin
   if Mtx5000.FMant.cds2.RecordCount=0 then
   begin
      ShowMessage('No hay registros a mostrar');
      exit;
   end;

   xSQL := 'SELECT A.CIAID,B.CIADES,ODCID,ODCFREG,A.PROV,C.PROVDES,A.ARTID,D.ARTDES, '
          +'       DODCCNT,DODCPUN,DODCIMP, '' '' MARCA '
          +'from LOG305 A, TGE101 B, TGE201 C, TGE205 D '
          +'where B.CIAID(+)=A.CIAID '
          +'  and C.PROV(+)=A.PROV '
          +'  and D.CIAID(+)=A.CIAID and D.ARTID(+)=A.ARTID '
          +'  and A.ARTID='+quotedstr(Mtx5000.FMant.cds2.fieldbyname('ARTID').AsString);
   DMLOG.cdsQry6.Close;
   DMLOG.cdsQry6.Filter:='';
   DMLOG.cdsQry6.Filtered:=False;
   DMLOG.cdsQry6.IndexFieldNames:='';
   DMLOG.cdsQry6.DataRequest(xSQL);
   DMLOG.cdsQry6.Open;
   DMLOG.cdsQry6.IndexFieldNames:='ODCFREG';
   if DMLOG.cdsQry6.RecordCount>3 then
   begin
      xNumItems := 0;
      DMLOG.cdsQry6.Last;
      while not DMLOG.cdsQry6.BOF do
      begin
         xNumItems := xNumItems +1;
         DMLOG.cdsQry6.Edit;
         DMLOG.cdsQry6.FieldByName('MARCA').AsString:='*';
         DMLOG.cdsQry6.Prior;
         if xNumItems=3 then
            break;
      end;
      DMLOG.cdsQry6.Filter:='MARCA=''*'' ';
      DMLOG.cdsQry6.Filtered := True;
      DMLOG.cdsQry6.First;
   end;
   ppdbUltCompras.DataSource:=DMLOG.dsQry6;
//   ppDesigner1.Report:=pprUltCompras;
//   ppDesigner1.Show;
   pprUltCompras.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\UltimasCompras.rtm';
   pprUltCompras.Print;
   DMLOG.cdsQry6.Close;
   DMLOG.cdsQry6.Filter:='';
   DMLOG.cdsQry6.Filtered:=False;
   DMLOG.cdsQry6.IndexFieldNames:='';
end;

procedure TFToolDetOC.Timer1Timer(Sender: TObject);
begin
   //FVariables.w_NombreForma := 'FToolDetOC';
   if (DMLOG.wAdmin='G') or (DMLOG.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMLOG.AccesosUsuariosR( DMLOG.wModulo,DMLOG.wUsuario,'2',FToolDetOC);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

end.

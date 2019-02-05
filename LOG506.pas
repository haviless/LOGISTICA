unit LOG506;

// vhndema 20051220
// se cambio la consulta y se hicieron reportes a solicitud de
// MPalaco y FPazos

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls,  wwdblook,
  wwdbdatetimepicker, ppEndUsr, ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppBands, ppCache;

type
  TFToolProvxArt = class(TForm)
    pnlTool: TPanel;
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Z1sbPeriodo: TBitBtn;
    Timer1: TTimer;
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dtpDesde: TwwDBDateTimePicker;
    dtpHasta: TwwDBDateTimePicker;
    bbtnRep2: TBitBtn;
    ppdb1: TppBDEPipeline;
    ppr1: TppReport;
    ppd1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    cbDisenoRep: TCheckBox;
    sbDisenoRep: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Z1sbPeriodoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnRep2Click(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolProvxArt: TFToolProvxArt;
  xAccesoBotones : Boolean;

implementation

uses LOGDM1, oaAD5000;

{$R *.DFM}

procedure TFToolProvxArt.FormCreate(Sender: TObject);
begin
   if DMLOG.cdsCia.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsCia,'TGE101','CIAID','CIAID');

   dblcCIA.LookUpField:='CIAID';
   dblcCIA.LookUpTable:=DMLOG.cdsCIA;

	 DecodeDate(DateS, Y, M, D);
   dtpDesde.Date:=StrToDate('01/'+IntToStr(M)+'/'+IntToStr(Y));
	 dtpHasta.Date:=Date;
end;

procedure TFToolProvxArt.Z1sbPeriodoClick(Sender: TObject);
var
	xSQL, FRegDes, FRegHas : String;
begin
  FRegDes:=formatdatetime(DMLOG.wFormatFecha,FToolProvxArt.dtpDesde.DateTime);
  FRegHas:=formatdatetime(DMLOG.wFormatFecha,FToolProvxArt.dtpHasta.DateTime);
  xSQL := '( B.PROFFREG>='+FRegDes+' AND B.PROFFREG<='+FRegHas+')';

  // VHNDEMA
  xSQL:='select A.CIAID, B.CIADES, CLAUXID, PROV, PROVDES, '
       +  'SUM(NVL(CASE WHEN TMONID='''+DMLOG.wTMonExt+''' THEN ROUND(ODCIXTCC *ODCTCAMB,2) ELSE ODCIXTCC  END,0)) COSTOMN, '
       +  'SUM(NVL(CASE WHEN TMONID='''+DMLOG.wTMonExt+''' THEN ROUND(ODCTTIMPU*ODCTCAMB,2) ELSE ODCTTIMPU END,0)) IGVMN, '
       +  'SUM(NVL(CASE WHEN TMONID='''+DMLOG.wTMonExt+''' THEN ROUND(ODCTOTALG*ODCTCAMB,2) ELSE ODCTOTALG END,0)) TOTALMN, '
       +  'SUM(NVL(CASE WHEN TMONID='''+DMLOG.wTMonExt+''' THEN ODCIXTCC  ELSE ROUND(ODCIXTCC /ODCTCAMB,2) END,0)) COSTOME, '
       +  'SUM(NVL(CASE WHEN TMONID='''+DMLOG.wTMonExt+''' THEN ODCTTIMPU ELSE ROUND(ODCTTIMPU/ODCTCAMB,2) END,0)) IGVME, '
       +  'SUM(NVL(CASE WHEN TMONID='''+DMLOG.wTMonExt+''' THEN ODCTOTALG ELSE ROUND(ODCTOTALG/ODCTCAMB,2) END,0)) TOTALME, '
       +  '''DESDE '+FRegDes+' HASTA '+FRegHas+''' RANGO ' //, ODCANOMM  '
       +'From LOG304 A, TGE101 B '
       +'Where A.CIAID='+QuotedStr(dblcCia.text)
       + ' AND ODCFEMI>='''+FRegDes+''' AND ODCFEMI<='''+FRegHas+''' '
       + ' and ODCEST=''ACEPTADO'' '
       + ' and A.CIAID=B.CIAID '
       +'GROUP BY A.CIAID, B.CIADES, CLAUXID, PROV, PROVDES ' //, ODCANOMM '
       +'ORDER BY A.CIAID, B.CIADES, CLAUXID, PROV, PROVDES'; //, ODCANOMM';

  xSQL := 'select * from ('+xSQL+') SOLVISTA ';

  Mtx5000.TableName      := 'VWLOGPROVARTI';
	Mtx5000.UsuarioSQL.Clear;
	Mtx5000.UsuarioSQL.Add(xSQL) ;
	Mtx5000.NewQuery;
  // END VHNDEMA

  //MtxO.SetFilter(xSQL );
end;






procedure TFToolProvxArt.Timer1Timer(Sender: TObject);
begin
   //FVariables.w_NombreForma := 'FToolProvxArt';
   if (DMLOG.wAdmin='G') or (DMLOG.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMLOG.AccesosUsuariosR( DMLOG.wModulo,DMLOG.wUsuario,'2',FToolProvxArt);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

procedure TFToolProvxArt.dblcCiaExit(Sender: TObject);
begin
   edtCIA.text:=DMLOG.DisplayDescrip('prvSQL','TGE101','CIADES','CIAID='+quotedStr(dblcCIA.text),'CIADES');
end;

procedure TFToolProvxArt.bbtnRep2Click(Sender: TObject);
var
	xWhere, xOrder, xSQL, FRegDes, FRegHas : String;
  x, x10 : Integer;
begin
  FRegDes:=formatdatetime(DMLOG.wFormatFecha,FToolProvxArt.dtpDesde.DateTime);
  FRegHas:=formatdatetime(DMLOG.wFormatFecha,FToolProvxArt.dtpHasta.DateTime);
  xSQL := '( B.PROFFREG>='+FRegDes+' AND B.PROFFREG<='+FRegHas+')';

  // VHNDEMA
  xSQL:='select A.CIAID, B.CIADES, CLAUXID, PROV, PROVDES, '
       +  'SUM(NVL(CASE WHEN TMONID='''+DMLOG.wTMonExt+''' THEN ROUND(ODCIXTCC *ODCTCAMB,2) ELSE ODCIXTCC  END,0)) COSTOMN, '
       +  'SUM(NVL(CASE WHEN TMONID='''+DMLOG.wTMonExt+''' THEN ROUND(ODCTTIMPU*ODCTCAMB,2) ELSE ODCTTIMPU END,0)) IGVMN, '
       +  'SUM(NVL(CASE WHEN TMONID='''+DMLOG.wTMonExt+''' THEN ROUND(ODCTOTALG*ODCTCAMB,2) ELSE ODCTOTALG END,0)) TOTALMN, '
       +  'SUM(NVL(CASE WHEN TMONID='''+DMLOG.wTMonExt+''' THEN ODCIXTCC  ELSE ROUND(ODCIXTCC /ODCTCAMB,2) END,0)) COSTOME, '
       +  'SUM(NVL(CASE WHEN TMONID='''+DMLOG.wTMonExt+''' THEN ODCTTIMPU ELSE ROUND(ODCTTIMPU/ODCTCAMB,2) END,0)) IGVME, '
       +  'SUM(NVL(CASE WHEN TMONID='''+DMLOG.wTMonExt+''' THEN ODCTOTALG ELSE ROUND(ODCTOTALG/ODCTCAMB,2) END,0)) TOTALME, '
       +  '''DESDE '+FRegDes+' HASTA '+FRegHas+''' RANGO ' //, ODCANOMM  '
       +'From LOG304 A, TGE101 B '
       +'Where A.CIAID='+QuotedStr(dblcCia.text)
       + ' AND ODCFEMI>='''+FRegDes+''' AND ODCFEMI<='''+FRegHas+''' '
       + ' and ODCEST=''ACEPTADO'' '
       + ' and A.CIAID=B.CIAID '
       +'GROUP BY A.CIAID, B.CIADES, CLAUXID, PROV, PROVDES ' //, ODCANOMM '
       +'ORDER BY A.CIAID, B.CIADES, CLAUXID, PROV, PROVDES'; //, ODCANOMM';

  xSQL := 'select * from ('+xSQL+') SOLVISTA ';

  xWhere   := '';
  for x:=0 to Mtx5000.FMant.lbFiltroReal.Items.Count - 1 do
  begin
      if length(xWhere)>0 then
         if Copy(Mtx5000.FMant.lbFiltroReal.Items.Strings[x],1,4)=' or ' then
            xWhere := xWhere + Mtx5000.FMant.lbFiltroReal.Items.Strings[x]
         else
            xWhere := xWhere + ' and ' + Mtx5000.FMant.lbFiltroReal.Items.Strings[x]
      else
      begin
         xWhere := Mtx5000.FMant.lbFiltroReal.Items.Strings[x];
      end;
  end;

  xOrder := '';
  for x:=0 to Mtx5000.FMant.lbOrdenReal.Items.Count - 1 do
  begin
      if length( xOrder )>0 then
         xOrder := xOrder + ', ' + Mtx5000.FMant.lbOrdenReal.Items.Strings[x]
      else
      begin
         xOrder := Mtx5000.FMant.lbOrdenReal.Items.Strings[x];
      end;
  end;

  if Length( xWhere ) > 0 then xSQL  := xSQL + ' WHERE ' + xWhere;
  if Length( xOrder ) > 0 then xSQL  := xSQL + ' ORDER BY ' + xOrder;

  DMLOG.cdsReporte.Close;
  DMLOG.cdsReporte.DataRequest( xSQL );
  DMLOG.cdsReporte.Open;

  if DMLOG.cdsReporte.RecordCount=0 then
  begin
      Raise Exception.Create('No existen Registros a mostrar');
  end;

   ppdb1.DataSource:=DMLOG.dsReporte;
   ppR1.DataPipeline:=ppdb1;
   ppR1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\ComprasxProveedor.rtm' ;
   ppR1.template.LoadFromFile;

   if cbDisenoRep.Checked then
      ppd1.showmodal
   else
   begin
      ppR1.Print;

      ppR1.Stop;
      ppdb1.DataSource:=nil;

      x10:=Self.ComponentCount-1;
      while x10>=0 do
      begin
         if Self.Components[ x10 ].ClassName='TppGroup' then
         begin
            Self.Components[ x10 ].Free ;
         end;
         x10:=x10-1;
      end;
   end;
end;


procedure TFToolProvxArt.sbDisenoRepClick(Sender: TObject);
begin
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
end;

end.

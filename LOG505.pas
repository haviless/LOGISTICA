unit LOG505;

// vhndema 20051220
// se cambio la consulta y se hicieron reportes a solicitud de
// MPalaco y FPazos

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls,  Wwdbdlg,
  wwdbdatetimepicker, wwdblook, ppEndUsr, ppBands, ppCache, ppClass,
  ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE;

type
  TFToolArtxProv = class(TForm)
    pnlTool: TPanel;
    Timer1: TTimer;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    dtpDesde: TwwDBDateTimePicker;
    dtpHasta: TwwDBDateTimePicker;
    bbtnFiltrar2: TBitBtn;
    bbtnRep2: TBitBtn;
    gbOpcional: TGroupBox;
    lblProv: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dblcdProv: TwwDBLookupComboDlg;
    dbeProv: TEdit;
    dblcdMarca: TwwDBLookupComboDlg;
    edtMarca: TEdit;
    dblcdArtTipo: TwwDBLookupComboDlg;
    edtTipArt: TEdit;
    ppdb1: TppBDEPipeline;
    ppr1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppd1: TppDesigner;
    cbDisenoRep: TCheckBox;
    sbDisenoRep: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure bbtnFiltrar2Click(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcdProvEnter(Sender: TObject);
    procedure dblcdProvExit(Sender: TObject);
    procedure dblcdMarcaExit(Sender: TObject);
    procedure dblcdArtTipoExit(Sender: TObject);
    procedure bbtnRep2Click(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolArtxProv: TFToolArtxProv;
  xAccesoBotones : Boolean;

implementation

uses LOGDM1, oaAD5000;

{$R *.DFM}

procedure TFToolArtxProv.FormCreate(Sender: TObject);
var
   xSQL : String;
begin

  // vhndema 20051220
  
   if DMLOG.cdsCia.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsCia,'TGE101','CIAID','CIAID');
      
	 DecodeDate(DateS, Y, M, D);
   dtpDesde.Date:=StrToDate('01/'+IntToStr(M)+'/'+IntToStr(Y));
	 dtpHasta.Date:=Date;
  {
  xSQL:='SELECT CLAUXID, A.PROV, PROVDES '
       +'FROM TGE201 A, (SELECT PROV FROM TGE205 GROUP BY PROV ) B '
       +'WHERE CLAUXID=''P'' AND A.PROV=B.PROV '
       +'ORDER BY PROVDES';
  DMLOG.cdsQry10.Close;
  DMLOG.cdsQry10.DataRequest( xSQL );
  DMLOG.cdsQry10.Open;
  DMLOG.cdsQry10.IndexFieldNames:='PROVDES';
  }
   // MARCA DE ARTICULO
  xSQL:='SELECT * FROM ALM_MAR_ART ORDER BY MARDES';
  DMLOG.cdsQry11.Close;
  DMLOG.cdsQry11.DataRequest( xSQL );
  DMLOG.cdsQry11.Open;
  DMLOG.cdsQry11.IndexFieldNames:='MARDES';

   // TIPO DE ARTICULO
  xSQL:='SELECT * FROM ALM_TIP_ART ORDER BY TIPARTDES';
  DMLOG.cdsQry12.Close;
  DMLOG.cdsQry12.DataRequest( xSQL );
  DMLOG.cdsQry12.Open;
  DMLOG.cdsQry12.IndexFieldNames:='TIPARTDES';

  // end vhndema

  dblcCia.LookupTable     := DMLOG.cdsCia;
//dblcTInv.LookupTable    := DMLOG.cdsTInven;
//dblcAlmacen.LookupTable := DMLOG.cdsAlmacen;
  dblcdProv.LookupTable   := DMLOG.cdsQry10;
  dblcdMarca.LookupTable  := DMLOG.cdsQry11;
  dblcdArtTipo.LookupTable:= DMLOG.cdsQry12;
end;

procedure TFToolArtxProv.Timer1Timer(Sender: TObject);
begin
   //FVariables.w_NombreForma := 'FToolArtxProv';
   if (DMLOG.wAdmin='G') or (DMLOG.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMLOG.AccesosUsuariosR( DMLOG.wModulo,DMLOG.wUsuario,'2',FToolArtxProv);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

procedure TFToolArtxProv.bbtnFiltrar2Click(Sender: TObject);
var
   xSQL : String;
begin
  // VHNDEMA 20051220
  xSQL:='select A.CIAID, B.CIADES, A.CLAUXID, A.PROV, C.ARTID, DODCOBS, '
       +  'L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, P.PROVDES, CARART, '
       +  'SUM(NVL(DODCCNT,0)) CANTIDAD, '
       +  'SUM(NVL(CASE WHEN A.TMONID='''+DMLOG.wTMonExt+''' THEN ROUND(DODCIMP *ODCTCAMB,2) ELSE DODCIMP  END,0)) COSTOMN, '
       +  'SUM(NVL(CASE WHEN A.TMONID='''+DMLOG.wTMonExt+''' THEN ROUND((IMPTOT-DODCIMP)*ODCTCAMB,2) ELSE (IMPTOT-DODCIMP) END,0)) IGVMN, '
       +  'SUM(NVL(CASE WHEN A.TMONID='''+DMLOG.wTMonExt+''' THEN ROUND(IMPTOT*ODCTCAMB,2) ELSE IMPTOT END,0)) TOTALMN, '
       +  'SUM(NVL(CASE WHEN A.TMONID='''+DMLOG.wTMonExt+''' THEN DODCIMP  ELSE ROUND(DODCIMP /ODCTCAMB,2) END,0)) COSTOME, '
       +  'SUM(NVL(CASE WHEN A.TMONID='''+DMLOG.wTMonExt+''' THEN (IMPTOT-DODCIMP) ELSE ROUND((IMPTOT-DODCIMP)/ODCTCAMB,2) END,0)) IGVME, '
       +  'SUM(NVL(CASE WHEN A.TMONID='''+DMLOG.wTMonExt+''' THEN IMPTOT ELSE ROUND(IMPTOT/ODCTCAMB,2) END,0)) TOTALME, '
       +  '''DESDE '+dtpDesde.Text+' HASTA '+dtpHasta.Text+''' RANGO '
       +'From LOG304 A, TGE101 B, LOG305 C, TGE205 L, ALM_MAR_ART M, ALM_TIP_ART T, TGE201 P '
       +'Where A.CIAID='+QuotedStr(dblcCia.Text)
       + ' AND A.ODCFEMI>='''+dtpDesde.Text+''' AND A.ODCFEMI<='''+dtpHasta.Text+''' '
       + ' and A.ODCEST=''ACEPTADO'' '
       + ' and A.CIAID=B.CIAID '
       + ' and A.CIAID=C.CIAID AND A.ODCID=C.ODCID '
       +  'AND (L.CIAID(+)=C.CIAID and L.ARTID(+)=C.ARTID) '

       +  'AND (L.MARCA=M.MARCA(+)) ';

  if dblcdMarca.Text='' then
     xSQL:=xSQL+'and L.MARCA(+) LIKE '''+dblcdMarca.Text+'%'' '
  else
     xSQL:=xSQL+'and L.MARCA LIKE '''+dblcdMarca.Text+'%'' ';

  xSQL:=xSQL +  'AND (L.TIPART=T.TIPART(+)) ';

   if dblcdArtTipo.Text='' then
     xSQL:=xSQL+'and L.TIPART(+) LIKE '''+dblcdArtTipo.Text+'%'' '
  else
     xSQL:=xSQL+'and L.TIPART LIKE '''+dblcdArtTipo.Text+'%'' ';

  xSQL:=xSQL +  'AND (A.CLAUXID=P.CLAUXID(+) AND A.PROV=P.PROV(+)) ';

  if dblcdProv.Text='' then
     xSQL:=xSQL+'and A.PROV(+) LIKE '''+dblcdProv.Text+'%'' '
  else
     xSQL:=xSQL+'and A.PROV LIKE '''+dblcdProv.Text+'%'' ';

  xSQL:=xSQL
       +'GROUP BY A.CIAID, B.CIADES, A.CLAUXID, A.PROV, C.ARTID, DODCOBS, '
       +  'L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, P.PROVDES, L.CARART '
       +'ORDER BY A.CIAID, B.CIADES, A.CLAUXID, A.PROV, P.PROVDES, C.ARTID, DODCOBS';

  xSQL := 'select * from ('+xSQL+') SOLVISTA ';

  Mtx5000.TableName      := 'VWLOGARTCOMP';
	Mtx5000.UsuarioSQL.Clear;
	Mtx5000.UsuarioSQL.Add(xSQL) ;
	Mtx5000.NewQuery;
end;

procedure TFToolArtxProv.dblcCiaExit(Sender: TObject);
begin
  // vhndema 20051220

  edtCIA.text := DMLOG.DisplayDescrip('prvSQL','TGE101','CIADES','CIAID='+quotedStr(dblcCIA.text),'CIADES');

  xSQL:='SELECT CLAUXID, PROV, PROVDES FROM LOG304 '
       +'WHERE CIAID='''+dblcCia.Text+''' '
       +'GROUP BY CLAUXID, PROV, PROVDES '
       +'ORDER BY PROVDES';
  DMLOG.cdsQry10.Close;
  DMLOG.cdsQry10.DataRequest( xSQL );
  DMLOG.cdsQry10.Open;
  DMLOG.cdsQry10.IndexFieldNames:='PROVDES';
end;

procedure TFToolArtxProv.dblcdProvEnter(Sender: TObject);
begin
  // vhndema 20051220
  if (not DMLOG.cdsQry10.Active) or (dblcCia.Text='') then
  begin
     dblcCia.SetFocus;
  end;
end;

procedure TFToolArtxProv.dblcdProvExit(Sender: TObject);
begin
  dbeProv.text:=DMLOG.DisplayDescrip('prvSQL','TGE201','CLAUXID,PROVDES', 'PROV='+quotedstr(dblcdProv.text),'PROVDES');
end;

procedure TFToolArtxProv.dblcdMarcaExit(Sender: TObject);
begin
  edtMarca.text :=DMLOG.DisplayDescrip('prvSQL','ALM_MAR_ART','MARDES', 'MARCA='+quotedstr(dblcdMarca.text),'MARDES');
end;

procedure TFToolArtxProv.dblcdArtTipoExit(Sender: TObject);
begin
  edtTipArt.text:=DMLOG.DisplayDescrip('prvSQL','ALM_TIP_ART','TIPARTDES', 'TIPART='+quotedstr(dblcdArtTipo.text),'TIPARTDES');
end;

procedure TFToolArtxProv.bbtnRep2Click(Sender: TObject);
var
   xSQL : String;
   x10 : Integer;
begin
   // vhndema 20051220
   if dblcCia.text='' then
   begin
      dblcCia.enabled:=True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   end;

   if dtpDesde.date=0 then
   begin
      dtpDesde.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   end;

   if dtpHasta.date=0 then
   begin
      dtpHasta.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   end;

   if dtpHasta.date<dtpDesde.date then
   begin
      dtpHasta.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   end;

  xSQL:=	Mtx5000.FMant.SQL;

  DMLOG.cdsReporte.Close;
  DMLOG.cdsReporte.DataRequest( xSQL );
  DMLOG.cdsReporte.Open;

  if DMLOG.cdsReporte.RecordCount=0 then
  begin
      Raise Exception.Create('No existen Registros a mostrar');
  end;

   ppdb1.DataSource:=DMLOG.dsReporte;
   ppR1.DataPipeline:=ppdb1;
   ppR1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\ComprasxArticulo.rtm' ;
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
   // end vhndema
end;

procedure TFToolArtxProv.sbDisenoRepClick(Sender: TObject);
begin
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
end;

end.

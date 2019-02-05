Unit LOG260;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG260
//Formulario               : FLisPre
//Fecha de Creación        :
//Autor                    : Equipo de Desarrollo
//Objetivo                 : Formulario de ingreso a una lista de precio segun compañia y lista de precios requerida
// Actualizaciones
// HPC_201404_LOG          : 05/09/2014 Valida que la Fecha del Sistema tenga Tipo de Cambio actualizado
//                         : Reordenamiento de Sangría, se cambión los calculos para la edición de la Lista de Precios.
// HPC_201405_LOG          : Se cambia la consulta LOG316 por el LOG337, se adiciono un control para solo consulta
//                           14/10/2014 Se lleva Lista de Precios de Adquisiciones Ventas a Adquisiciones SSGG
//                           14/10/2014 Reordenamiento de Sangría
// HPC_201503_LOG 17/08/2015 Se modifica en los Sqls que filtran la data del precio de la ultima compra ahora se toma del TGE205
// HPC_201504_LOG 31/08/2015 Ajustes para mostrar correctamente datos última compra en Grid
// HPC_201602_LOG 24/10/2016 Cambio de Control de Versión a 20161024083000
// HPC_201701_LOG 20/06/2017 Se modifica SQL base para Adición/Edición del Artículo
// HPC_201802_LOG 08/02/2018 Unifica invocación de Costo de Artículo con formulario de Lista de Precios
// HPC_201803_LOG 05/04/2018 Se implementa mejoramiento en la Lista de Precios
//
  
Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, wwdblook, ExtCtrls, Buttons, Mant, db, oaVariables, msgdlgs,
   wwdbdatetimepicker;

Type
   TFLisPre = Class(TForm)
      pnl1: TPanel;
      Label14: TLabel;
      Label1: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      dblcLPrecio: TwwDBLookupCombo;
      edtLPrecio: TEdit;
      Z2bbtnAcepta: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      dbdtpFecha: TwwDBDateTimePicker;
      Procedure Z2bbtnAceptaClick(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcLPrecioExit(Sender: TObject);
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormShow(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcLPrecioEnter(Sender: TObject);
   Private
  { Private declarations }
      Procedure PegaPnlToolLPrecio(Sender: TObject);
      Procedure CargaDataSource;
   Public
  { Public declarations }
      Procedure LPrecioInsert(Sender: TObject);
      Procedure LPrecioEdita(Sender: TObject; MantFields: TFields);
      Procedure LPrecioDelete(Sender: TObject; MantFields: TFields);
   End;

Var
   FLisPre: TFLisPre;
   wCia, wLPe, exCia, sSQL: String;

Implementation

//Uses LOGDM1, oaAD1000, LOG600, LOG262, LOG264;
Uses LOGDM1, oaAD1000, LOG600, LOG262;
// LOG262  Forma de Lista de Precios

{$R *.DFM}

Procedure TFLisPre.Z2bbtnAceptaClick(Sender: TObject);
Var
// Inicio HPC_201803_LOG
// Se implementa mejoramiento en la Lista de Precios
   xSQL, xSQL1, xSQL2, xFiltro, xAnoMes: String; 
// Fin HPC_201803_LOG
   wlAno, wlMes, wlDia: word;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      Information('Adquisiciones', 'Compañía no Válida');
      Exit;
   End;

   If Length(Trim(edtLPrecio.Text)) = 0 Then
   Begin
      Information('Adquisiciones', 'Lista de Precios no Válida');
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   Try
      wCia := dblcCia.Text;
      wLPe := dblcLPrecio.Text;

      FToolLPrecio := TFToolLPrecio.Create(Self);
      FToolLPrecio.Height := 80;
      FToolLPrecio.Visible := False;

      DMLOG.cdsTINID.Close;
      DMLOG.cdsTINID.DataRequest('SELECT * FROM TGE152 WHERE CIAID=' + quotedStr(dblcCia.Text) + ' AND TINVENTAS=''S''');
      DMLOG.cdsTINID.Open;

      DMLOG.FiltraTabla(DMLOG.cdsTVta, 'FAC105', 'TVTAID', 'TVTAID');
      DMLOG.FiltraTabla(DMLOG.cdsTMoneda, 'TGE103', 'TMONID', 'TMONID');

   // Valida que la Fecha del Sistema tenga Tipo de Cambio actualizado
      xSQL := 'Select * from TGE107 where FECHA=' + quotedstr(datetostr(dbdtpFecha.DateTime));
      DMLOG.cdsQry.Close;
      DMLOG.cdsQry.DataRequest(xSQL);
      DMLOG.cdsQry.Open;
      If DMLOG.cdsQry.RecordCount = 0 Then
      Begin
         ShowMessage('No existe Tipo de Cambio para el día de Hoy , PARA MOSTRAR LA LISTA DE PRECIOS DEBE HABER TIPO DE CAMBIO DEL DIA ...');
         Exit;
      End;

      xSQL := 'CIAID=' + QuotedStr(Trim(wCia))
         + ' AND SCOMERID=' + QuotedStr(DMLOG.DisplayDescrip('PRVSQL', 'FAC105', 'TVTAID', 'TVTAFLAG=''L''', 'TVTAID'));
      DMLOG.Filtracds(DMLOG.cdsDscto, 'SELECT * FROM TGE180 WHERE ' + xSQL + ' ORDER BY CCOMERID');
      DMLOG.cdsDscto.IndexFieldNames := 'LPRECIO';
      DMLOG.cdsDscto.SetKey;
      DMLOG.cdsDscto.FieldByName('LPRECIO').AsString := 'S';
      If DMLOG.cdsDscto.GotoKey Then
      Begin
      //
      End;
      DMLOG.cdsDscto.IndexFieldNames := 'CCOMERID';

      DecodeDate(strtodate(datetostr(dbdtpFecha.DateTime)), wlAno, wlMes, wlDia);
      xAnoMes := inttostr(wlAno) + DMLOG.StrZero(inttostr(wlMes), 2);
// Inicio HPC_201803_LOG
// Se implementa mejoramiento en la Lista de Precios
      xSQL1:= 'Select * '
         + '     from (Select A.*, '
         + '                  (case when Y.TMONID=''N'' then Y.ARTPCG else Y.ARTPCG*Y.TCAMVBC end) ARTPCG, '
         + '                  Y.KDXCNTG, Y.NISAFREG '
         + '             from (Select CIAID,TLISTAID,TINID,GRARID,FAMID,SFAMID,ARTID,'
         + '                          ARTDES,ARTCONT,UNMIDG,UNMIDU,LPRETMONID,TMONABR,LPREPREGMO,'
         + '                          LPREPREUMO,LPREPDCTOG,sum(STKALM) STKALM,0.00 STKEXHIB,'
         + '                          0.00 STKOTROS,0.00 STKTOTAL,'
         + '                          CASE  WHEN LPRETMONID = ''N'' THEN 0 ELSE ROUND(LPREPREGIGV * TCAMBIO, 2)  END PRECIOMN,'
         + '                          CASE  WHEN LPRETMONID = ''D'' THEN 0 ELSE ROUND(LPREPREGIGV / TCAMBIO, 2)  END PRECIOME,'
         + '                          0.00 COSTOMN,0.00 COSTOME,MAX(NVL(STKSMAX, 0)) STKSMAX,MAX(NVL(STKSMIN, 0)) STKSMIN,'
         + '                          MAX(PRECIO_CAL) PRECIO_CAL, MAX(PRECIO_PRO) PRECIO_PRO,'
         + '                          CASE  WHEN MAX(NVL(STKSMIN, 0)) > 0 AND sum(STKALM) <= MAX(NVL(STKSMIN, 0)) THEN ''S'' ELSE ''N'' END FCOLOR,'
         + '                          MARCA, MARDES,MAX(FULTPRECOMP)FULTPRECOMP,MAX(PREPROMFIN)PREPROMFIN,MAX(ULTPRECOMP)ULTPRECOMP,'
         + '                          MAX(TASIGV)TASIGV,MAX(TASSERV)TASSERV,' //TASAS DE INTERES
         + '                          ROUND(LPREPREGMO*(MAX(TASIGV)/100),2) TOTIGV,' //TOTAL IGV
         + '                          ROUND(LPREPREGMO*(MAX(TASSERV)/100),2) TOTSERV,' // TOTAL SERVICIOS
         + '                          ROUND(LPREPREGMO + (LPREPREGMO * (MAX(TASIGV) / 100)) + (LPREPREGMO * (MAX(TASSERV) / 100)),2) LPREPREGIGV,'
//         + '                          ARTPCG, ARTCPROG, PREBASE ' //PRECIO LISTA
         + '                          ARTCPROG, PREBASE ' //PRECIO LISTA
         + '                     from (Select A.TLISTAID, A.CIAID,A.LOCID, A.TINID,A.ALMID,A.GRARID,A.FAMID,A.SFAMID,A.ARTID, A.ARTDES,'
         + '                                  NVL(M.ARTCONT, 0) ARTCONT, A.UNMIDG, A.UNMIDU, A.LPRETMONID, D.TMONABR, '
         + '                                  A.LPREPDCTOG,NVL(A.LPREPREGMO, 0) LPREPREGMO, '
         + '                                  NVL(A.LPREPREUMO, 0) LPREPREUMO, TCAMVBV TCAMBIO, '
         + '                                  round(NVL(A.LPREPREGMO, 0) * ((C.TASACAN / 100) + 1),2) LPREPREGIGV,'
         + '                                  ROUND(NVL(A.PREVEN, 0), 2) + ROUND(NVL(A.PREVEN, 0) * ((C.TASACAN / 100)), 2) PRECIO_CAL,'
         + '                                  ROUND(NVL(A.PREVENPRO, 0), 2) + ROUND(NVL(A.PREVENPRO, 0) * ((C.TASACAN / 100)), 2) PRECIO_PRO,'
         + '                                  NVL(STKFIN,0) STKALM, M.STKSMAX,M.STKSMIN,M.MARCA,X.MARDES,FULTPRECOMP,PREPROMFIN,ULTPRECOMP, '
         + '                                  C.TASACAN TASIGV, '
         + '                                  NVL((SELECT G.TASA  From TGE101 E,TGE205 F,TGE128 G '
         + '                                        WHERE E.CIAID=A.CIAID AND E.FLGSERV=''S'' '
         + '                                          AND E.CIAID=F.CIAID AND F.ARTID=A.ARTID AND F.FLGSERV=''S'' '
         + '                                          AND G.TREGID=''07''),0) TASSERV, '
         + '                                  M.ARTPCG, M.ARTCPROG, A.PREBASE '
         + '                             FROM FAC201 A,LOG337 B,TGE108 C,TGE103 D,TGE107 T,TGE205 M,ALM_MAR_ART X '
         + '                            WHERE A.CIAID       = ' + QuotedStr(dblcCia.text)
         + '                              AND A.TLISTAID    = ' + QuotedStr(dblcLPrecio.text)
         + '                              AND (A.ACTIVO     = ''S'' OR A.ACTIVO IS NULL OR A.ACTIVO = '' '') '
         + '                              AND B.CIAID(+)    = A.CIAID '
         + '                              and B.LOGANOMM(+) = ' + quotedstr(xAnoMes)
         + '                              AND B.ARTID(+)    = A.ARTID '
         + '                              AND A.LPRETMONID  = D.TMONID '
         + '                              AND T.FECHA(+)    = ' + quotedstr(datetostr(dbdtpFecha.Date))
/////
         + '                              AND M.CIAID = A.CIAID '
         + '                              AND M.TINID = A.TINID '
         + '                              AND M.ARTID = A.ARTID '
         + '                              and M.ARTEST=''H'' '
         + '                              AND X.MARCA(+) = M.MARCA '
{
         + '                              AND A.CIAID       = M.CIAID(+) '
         + '                              AND A.TINID       = M.TINID(+) '
         + '                              AND A.ARTID       = M.ARTID(+) '
         + '                              AND M.MARCA       = X.MARCA(+) '
}
/////
         + '                              AND C.TASAFLG     = ''I'' '
         + '                           ) XX '
         + '                    group by CIAID,TLISTAID,TINID,GRARID,FAMID,SFAMID,ARTID,ARTDES,ARTCONT,'
         + '                             UNMIDG,UNMIDU,LPRETMONID,TMONABR,LPREPREGMO,LPREPREUMO,LPREPREGIGV,'
         + '                             LPREPDCTOG,TCAMBIO,MARCA,MARDES,ARTPCG, ARTCPROG, PREBASE '
         + '               ) A, ';
//////////////////////////////////////
(*
         + '                (Select K.CIAID,K.TINID,K.ARTID,K.NISATIP,K.TRIID,K.GRARID,K.NISAID,K.NISAFREG,K.KDXCNTG, '
         + '                        K.ARTPCG, K.TMONID, TGE107.TCAMVBC '
         + '                   from LOG315 K, (Select CIAID,TINID,ARTID,NISATIP,GRARID,max(nisaid) NISAID, '
         + '                                             max(NISAFREG) NISAFREG '
         + '                                       from LOG315 A '
         + '                                      where A.NISATIP=''INGRESO'' '
         + '                                        and A.TRIID in (Select TRIID '
         + '                                                          from TGE208 '
         + '                                                         where TRISGT=''I'' and nvl(ACTCOSPRO,''X'')=''S'') '
         + '                                                         group by CIAID,TINID,NISATIP,ARTID,GRARID) H, '
         + '                        TGE107 '
         + '                  where K.CIAID = H.CIAID and K.TINID = H.TINID and K.ARTID = H.ARTID and K.NISATIP = H.NISATIP '
         + '                    and K.GRARID = H.GRARID and K.NISAID = H.NISAID '
         + '                    and K.NISAFREG = H.NISAFREG '
         + '                    and K.TRIID in (Select TRIID '
         + '                                      from TGE208 '
         + '                                     where TRISGT=''I'' and nvl(ACTCOSPRO,''X'')=''S'') '
         + '                    and TGE107.FECHA(+)=K.NISAFREG and TGE107.TMONID=''D'' '
         + '                 ) Y '
*)
//////////////////////////////////////
      xSQL2:=
           '                (Select K.CIAID,K.TINID,K.ARTID,K.NISATIP,K.TRIID,K.GRARID,K.NISAID,K.NISAFREG,K.KDXCNTG, '
         + '                        K.ARTPCG, K.TMONID, TGE107.TCAMVBC '
         + '                   from LOG315 K, '
         + '                       (Select CIAID,TINID,ARTID,NISATIP,GRARID, NISAID, NISAFREG '
         + '                          from (Select CIAID,TINID,ARTID,NISATIP,GRARID, NISAID, NISAFREG, '
         + '                                       (row_number() over(partition by ARTID order by ARTID,NISAFREG desc)) NUMLINEA '
         + '                                  from LOG315 '
         + '                                 where CIAID='+QuotedStr(dblcCia.text)
         + '                                   and NISATIP=''INGRESO'' '
         + '                                   and TRIID in (Select TRIID '
         + '                                                   from TGE208 '
         + '                                                  where TRISGT=''I'' and nvl(ACTCOSPRO,''X'')=''S'') '
         + '                                 and NISSIT=''ACEPTADO'' '
         + '                               order by ARTID,NISAFREG desc) '
         + '                         where NUMLINEA=1) H, '
         + '                        TGE107 '
         + '                  where K.CIAID = H.CIAID and K.TINID = H.TINID and K.ARTID = H.ARTID and K.NISATIP = H.NISATIP '
         + '                    and K.GRARID = H.GRARID and K.NISAID = H.NISAID '
         + '                    and K.NISAFREG = H.NISAFREG '
         + '                    and K.TRIID in (Select TRIID '
         + '                                      from TGE208 '
         + '                                     where TRISGT=''I'' and nvl(ACTCOSPRO,''X'')=''S'') '
         + '                    and TGE107.FECHA(+)=K.NISAFREG and TGE107.TMONID=''D'' '
         + '                 ) Y '
//         + '            where Y.CIAID(+) = A.CIAID and Y.TINID(+) = A.TINID and Y.GRARID(+) = A.GRARID and Y.ARTID(+)= A.ARTID '
         + '            where Y.CIAID(+) = A.CIAID and Y.ARTID(+)= A.ARTID '
//////////////////////////////////////
         + '            order by A.ARTID '
         + '          ) SOLVISTA ';
      xSQL := xSQL1 + xSQL2;	   
// Fin HPC_201803_LOG
      DMLOG.wTipoAdicion := 'xFiltro';
      GLPrecio := TMant.Create(Self);
      GLPrecio.dcOMc := DMLOG.Dcom1;
      GLPrecio.Admin := DMLOG.wAdmin;
      GLPrecio.User := DMLOG.wUsuario;
      GLPrecio.Module := DMLOG.wModulo;
      GLPrecio.Titulo := 'Lista de Precios : ' + trim(edtLPrecio.Text);
      GLPrecio.TableName := 'VWLOGLISTPRE';
      GLPrecio.OnCreateMant := PegaPnlToolLPrecio;
      GLPrecio.ClientDataset := DMLOG.cdsLPrecio;
      GLPrecio.OnInsert := LPrecioInsert;
      FToolLPrecio.pnlCons.Visible := False;
      FToolLPrecio.bbtnReproStock.Visible := Not (FToolLPrecio.pnlCons.Visible);
      xWhere := 'USERID=' + quotedStr(DMLOG.wUsuario);
      If DMLOG.DisplayDescrip('prvTGE', 'LOG_LIS_PRE', 'PREVILEGIO', xWhere, 'PREVILEGIO') <> 'S' Then
      Begin
         FToolLPrecio.pnlCons.Visible := True;
         GLPrecio.OnInsert := Nil;
      End;
      GLPrecio.OnEdit := LPrecioEdita;
      GLPrecio.OnDelete := LPrecioDelete;
      GLPrecio.OnShow := Nil;
      GLPrecio.UsuarioSQL.Add(xSQL);
      GLPrecio.Filter := '';
      GLPrecio.SectionName := 'LOGLPrecios';
      GLPrecio.FileNameIni := '\oaLog.ini';
      GLPrecio.NoVisible.Clear;
      GLPrecio.Colors.Add('STKALM;clRed;clWhite;;;' + 'FCOLOR%=%S%;');
      GLPrecio.Colors.Add('ARTID;clRed;clWhite;;;' + 'FCOLOR%=%S%;');
      GLPrecio.Colors.Add('ARTDES;clRed;clWhite;;;' + 'FCOLOR%=%S%;');
      GLPrecio.Colors.Add('UNMIDG;clRed;clWhite;;;' + 'FCOLOR%=%S%;');
      Screen.Cursor := crDefault;
      GLPrecio.Execute;
   Finally
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFLisPre.PegaPnlToolLPrecio(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolLPrecio.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFLisPre.LPrecioEdita(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
   wAno, wMes, wDia: word;
   cAno, cIGV: String;
Begin
// Inicio HPC_201802_LOG
{
   xSQL := 'Select ' + quotedstr(datetostr(dbdtpFecha.Date)) + ' FECHA from DUAL';
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   decodedate(DMLOG.cdsQry.FieldByName('FECHA').AsDateTime, wAno, wMes, wDia);
   cAno := inttostr(wAno);

   xSQL := 'Select TASACAN from TGE108 WHERE TASAFLG=''I'' ';
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   cIGV := FloatToStr(DMLOG.cdsQry.FieldByName('TASACAN').AsFloat / 100);


   xSQL := 'Select LOG314.NISSIT, LOG314.NISAFREG, LOG315.CIAID, LOG315.TINID, LOG315.TDAID, LOG315.NISAID, LOG315.NISATIP, '
      + '          LOG315.KDXCNTG,  LOG315.ARTTOTALG, '
      + '          round(LOG315.ARTPCG * LOG315.KDXCNTG, 4) COSARTFAC, LOG315.IMPNOTCRE, '

      + '          TGE205.ARTCPROG COSTOPROMMN, '
      + '          round((round(LOG315.ARTPCG * LOG315.KDXCNTG, 4)) / LOG315.KDXCNTG, 2) ULTCOSTO_ALMMN, '
      + '          ROUND(LOG315.IMPNOTCRE / LOG315.KDXCNTG, 2) NOTACREDMN, '
      + '          round((LOG315.IMPNOTCRE / case when LOG315.COSARTFAC = 0 then 1 else LOG315.COSARTFAC end) * 100, 2) PORCNCREDMN, '
      + '          TGE205.ARTCPROG PRECIOFINALMN, '

      + '          round(TGE205.ARTCPROG / TGE107.TCAMVBC, 2) COSTOPROMME, '
      + '          round(((round(LOG315.ARTPCG * LOG315.KDXCNTG, 4)) / LOG315.KDXCNTG) / TGE107.TCAMVBV, 2) ULTCOSTO_ALMME, '
      + '          round((LOG315.IMPNOTCRE / LOG315.KDXCNTG) / TGE107.TCAMVBV, 2) NOTACREDME, '
      + '          round((LOG315.IMPNOTCRE / case when LOG315.COSARTFAC = 0 then 1 else LOG315.COSARTFAC end) * 100, 2) PORCNCREDME, '
      + '          round(TGE205.ARTCPROG / TGE107.TCAMVBC, 2) PRECIOFINALMN, '

      + '          TGE107.TCAMVBC TIPOCAMBIO, 0.00 UTILIDAD, 0.0000 PORUTI, 0.00 DESCUENTO, '
      + '          0.00 PORDES, 0.00 IGVPV, 0.000 PVIGV, 0.00 IGVPR, 0.00 PPIGV, '
      + '          0.000 PPSERV, 0.00 UTID, 0.00 DESD, 0.00 PVD, 0.00 PPD, 0.00 IGVPVD, '
      + '          0.00 IGVPRD, 0.00 PVIGVD, 0.00 PPIGVD, 0.000 PPSERVD, '
      + '          LOG337.STKFIN STKSACTG, TGE205.OBSEQUIO, '
      + '          round(TGE205.ARTCPROG * (1 + 0.18), 2) COSTOIGVS, '
      + '          round(round(TGE205.ARTCPROG / TGE107.TCAMVBC, 2) * (1 + 0.18), 2) COSTOIGVD '
      + '     from LOG315, TGE208, LOG314, TGE205, TGE107, LOG337 '
      + '    where LOG315.CIAID=' + quotedstr(dblcCia.Text)
      + '      and LOG315.NISATIP=''INGRESO'' '
      + '      and LOG315.ARTID = ' + quotedstr(GLPrecio.FMant.cds2.fieldbyname('ARTID').AsString)
      + '      and TGE208.TRIID(+) = LOG315.TRIID and TGE208.TRISGT(+) = ''I'' and TGE208.ACTCOSPRO = ''S'' '
      + '      and LOG315.NISAFREG=(Select max(LOG315.NISAFREG) '
      + '                             from LOG315, TGE208 '
      + '                            where LOG315.CIAID=' + quotedstr(dblcCia.Text)
      + '                              and LOG315.NISATIP=''INGRESO'' '
      + '                              and LOG315.ARTID = ' + quotedstr(GLPrecio.FMant.cds2.fieldbyname('ARTID').AsString)
      + '                              and TGE208.TRIID(+) = LOG315.TRIID and TGE208.TRISGT(+) = ''I'' and TGE208.ACTCOSPRO = ''S'' '
      + '                              and LOG315.NISSIT=''ACEPTADO'') '
      + '      and LOG314.CIAID=LOG315.CIAID and LOG314.TINID=LOG315.TINID and LOG314.TDAID=LOG315.TDAID and LOG314.ALMID=LOG315.ALMID '
      + '      and LOG315.NISATIP = LOG314.NISATIP '
      + '          and LOG314.NISAID=LOG315.NISAID and LOG314.NISSIT = ''ACEPTADO'' '
      + '      and TGE205.CIAID(+)=LOG315.CIAID and TGE205.TINID(+)=LOG315.TINID and TGE205.ARTID(+)=LOG315.ARTID '
      + '      and TGE107.FECHA(+)=LOG314.NISAFREG and TGE107.TMONID=''D'' '
      + '      and LOG337.CIAID(+)=LOG315.CIAID and LOG337.LOGANOMM(+) = ' + quotedstr(cAno + DMLOG.StrZero(inttostr(wMes), 2))
      + '      and LOG337.ARTID(+)=LOG315.ARTID ';
   DMLOG.cdsQry7.Close;
   DMLOG.cdsQry7.DataRequest(xSQL);
   DMLOG.cdsQry7.Open;
}
   FLPrecio.CostoDeArticulo(dblcCia.Text, GLPrecio.FMant.cds2.fieldbyname('ARTID').AsString);
// Fin HPC_201802_LOG

   If DMLOG.cdsQry7.RecordCount <= 0 Then
   Begin
      ShowMessage('El artículo no tiene registrado INGRESO por Compra');
      exit;
   End;

   xSQL := ' Select CIAID, LOCID, TINID, ALMID, TLISTAID, ARTID, ARTCONT, GRARID, FAMID, SFAMID, UNMIDG,'
      + '        UNMIDU, UNMABR, LPRETMONID, LPRETCAM, LPREFINI, LPREVIG, LPREBASGMO, LPREBASGMN,'
      + '        LPREBASGME, LPREBASUMO, LPREBASUMN, LPREBASUME, LPREPINCG, LPREPINCU, LPREVOLMG,'
      + '        LPREVOLMU, LPREPDCTOG, LPREPDCTOU, LPREPREGMO, LPREPREGMN, LPREPREGME, LPREPREUMO,'
      + '        LPREPREUMN, LPREPREUME, LPREDCTO2G, LPREDCTO3G, LPREDCTO4G, LPREDCTO2U, LPREDCTO3U,'
      + '        LPREDCTO4U, CANTMING, CANTMINU, LPREIGV, LPREISC, LPREFLAGD, LPREFREG, LPREHREG, LPREUSER,'
      + '        ARTDES, PREVEN, PREVENPRO, ACTIVO, PREBASE '
      + '   From FAC201 '
      + '  where CIAID=' + quotedstr(dblcCia.text)
      + '    and TLISTAID=' + quotedStr(dblcLPrecio.text)
      + '    and ARTID=' + quotedstr(GLPrecio.FMant.cds2.fieldbyname('ARTID').AsString);
   DMLOG.cdsLPrecio.Close;
   DMLOG.cdsLPrecio.IndexFieldNames := '';
   DMLOG.cdsLPrecio.Filter := '';
   DMLOG.cdsLPrecio.Filtered := False;
   DMLOG.cdsLPrecio.DataRequest(xSQL);
   DMLOG.cdsLPrecio.Open;
   DMLOG.wModo := 'M';
   FLPrecio := TFLPrecio.Create(Self);
   FLPrecio.ShowModal;
   FLPrecio.Free;
End;

Procedure TFLisPre.LPrecioInsert(Sender: TObject);
Begin
   xSQL := 'Select * from FAC201 '
      + '    where 1<>1 ';
   DMLOG.cdsLPrecio.Close;
   DMLOG.cdsLPrecio.IndexFieldNames := '';
   DMLOG.cdsLPrecio.Filter := '';
   DMLOG.cdsLPrecio.Filtered := False;
   DMLOG.cdsLPrecio.DataRequest(xSQL);
   DMLOG.cdsLPrecio.Open;

   DMLOG.wModo := 'A';
   FLPrecio := TFLPrecio.Create(Self);
   FLPrecio.ShowModal;
   FLPrecio.Free;
End;

Procedure TFLisPre.LPrecioDelete(Sender: TObject; MantFields: TFields);
Begin
   sSQL := 'CIAID=''' + dblcCia.text + ''' ' +
      'AND ARTID=''' + DMLOG.cdsLPrecio.FieldByName('ARTID').AsString + '''';

 //--------------------------------------- Facturación ----------------------------------------------
   DMLOG.DisplayDescrip('prvTGE', 'FAC306', 'ARTID', sSQL, 'ARTID');

   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      Information('Adquisiciones', ' Este Articulo Tiene Movimiento en la Facturación');
      Exit;
   End;

 //--------------------------------------- Proforma de Venta  ---------------------------------------
   DMLOG.DisplayDescrip('prvTGE', 'FAC312', 'ARTID', sSQL, 'ARTID');

   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      Information('Adquisiciones', ' Este Articulo Tiene Movimiento en la Proforma de Venta');
      Exit;
   End;

   If Question('Confirmar', 'Esta Seguro de Eliminar El Articulo ' + #13 + #13 +
      DMLOG.cdsLPrecio.FieldByName('ARTID').AsString + '  -  ' +
      DMLOG.cdsLPrecio.FieldByName('ARTDES').AsString + #13 +
      #13 + ' Desea Continuar ') Then
   Begin
      Screen.Cursor := crHourGlass;
      xBorrar := '1';
      DMLOG.cdsLPrecio.Delete;
      DMLOG.ControlTran(9, DMLOG.cdsLPrecio, 'LPRECIO');
      xBorrar := '0';
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFLisPre.dblcCiaExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If Z2bbtnCanc2.Focused Then Exit;
   If exCia = dblcCia.Text Then Exit;
   edtCia.Text := DMLOG.DisplayDescrip('PRVSQL', 'TGE101', 'CIADES', 'CIAID=''' + dblcCia.Text + '''', 'CIADES');
   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Compañía no Existe');
      dblcCia.Text := '';
      dblcCia.SetFocus;
   End;

   xSQL := 'Select * '
      + '     from FAC101 '
      + '    where CIAID=' + quotedStr(dblcCia.Text)
      + '      and TLISTAFLAG=''S''';
   DMLOG.cdsTLista.Close;
   DMLOG.cdsTLista.DataRequest(xSQL);
   DMLOG.cdsTLista.Open;

   edtLPrecio.text := '';
   exCia := dblcCia.Text;
End;

Procedure TFLisPre.dblcLPrecioExit(Sender: TObject);
Var
   xWhere: String;
Begin
//   If (Z2bbtnCanc2.Focused) Or (dblcCia.Focused) Or (bbtnCombo.Focused) Then Exit;
   If (Z2bbtnCanc2.Focused) Or (dblcCia.Focused) Then Exit;

   If DMLOG.cdsTLista.RecordCount = 0 Then Exit;
   If length(dblcLPrecio.text) = 0 Then
      Raise exception.create('Seleccione una Lista de Precios');

   xWhere := 'TLISTAID=' + quotedstr(dblcLPrecio.Text) + ' AND CIAID=' + QuotedStr(dblcCia.Text);
   edtLPrecio.Text := DMLOG.Buscaqry('dspUltTGE', 'FAC101', 'TLISTADES', xWhere, 'TLISTADES');
End;

Procedure TFLisPre.Z2bbtnCanc2Click(Sender: TObject);
Begin
   Close;
End;

Procedure TFLisPre.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFLisPre.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   FVariables.w_AD_Registro := False;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;
   Action := CAFree;
End;

Procedure TFLisPre.CargaDataSource;
Begin
   dblcCia.LookupTable := DMLOG.cdsCIA;
   dblcLPrecio.LookupTable := DMLOG.cdsTLista;
End;

Procedure TFLisPre.FormShow(Sender: TObject);
Var
   xSQL: String;
Begin
   edtCia.Text := '';
   edtLPrecio.Text := '';
   exCia := '';
   xSQL := 'Select trunc(sysdate) FECHA from DUAL';
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;

   dbdtpFecha.DateTime := DMLOG.cdsQry.FieldByName('FECHA').AsDateTime;
   DMLOG.cdsQry.Close;
End;

Procedure TFLisPre.FormCreate(Sender: TObject);
Begin
   CargaDataSource;

   DMLOG.FiltraTabla(DMLOG.cdsCia, 'TGE101', 'CIAID', 'CIAID');

//   bbtnCombo.Visible := False;
   DMLOG.cdsCIA.First;
   While Not DMLOG.cdsCIA.Eof Do
   Begin
      If DMLOG.cdsCIA.FieldByName('CIAID').AsString = '04' Then
      Begin
//         bbtnCombo.Visible := true;
         Break;
      End;
      DMLOG.cdsCIA.Next;
   End;
End;

Procedure TFLisPre.dblcLPrecioEnter(Sender: TObject);
Begin
   If Not DMLOG.cdsTLista.Active Then
   Begin
      ShowMessage('Debe Elegir Compañía');
      dblcCia.SetFocus;
      Exit;
   End
End;

End.


Unit oaAD5000;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaAD5000
// FORMULARIO               : TFADConsultas
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Formulario inicial que contiene las funcionalidades
//                            que permiten acceder a las opciones de consultas

// ACTUALIZACIONES:
// HPC_201208_LOG 22/05/2012   Se implementó el control de versiones
// HPC_201404_LOG 21/10/2014   Control de Versiones 20141022080000
// HPC_201506_LOG 20/11/2014   Entrega al área de Calidad
// HPC_201601_LOG 22/09/2016   Añade Control de Acceso por Grupo de Usuario
//                             Control de Versión 20160923083000
// HPC_201602_LOG 24/10/2016   Cambio de Control de Versión a 20161024083000
// LOG_201805     19/11/2018   Cambio de Control de Versión a LOG-201805, cambio solo en el DFM

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, DB, ExtCtrls, StdCtrls, MsgDlgs;

Type
   TFADConsultas = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }
      wCualODCReq: String;

   // Orden de Compra Pendientes por Artículo
      Procedure PegaPanelDetMovOCRQ(Sender: TObject);
      Procedure OnEditDetMovOc(Sender: TObject; MantFields: TFields);
      Procedure OnEditDetMovRq(Sender: TObject; MantFields: TFields);
      Procedure OnEditDetMovLe(Sender: TObject; MantFields: TFields);
      Procedure OnShowRequis(Sender: TObject);

   // Artículos por Proveedor
      Procedure PegaPanelArtxProv(Sender: TObject);
      Procedure PegaPanelArtxProvOC(Sender: TObject);
      Procedure OnEditArtxPro(Sender: TObject; MantFields: TFields);
      Procedure OnEditArtxPro_1(Sender: TObject; MantFields: TFields);
      Procedure OnEditArtxProNvl2(Sender: TObject; MantFields: TFields);
      Procedure OnShowArtxProvOC(Sender: TObject);

   // Proveedor por Artículo
      Procedure PegaPanelProvxArt(Sender: TObject);
      Procedure PegaPanelProvxArtDet(Sender: TObject);
      Procedure PegaPanelProvxArtDetOC(Sender: TObject);
      Procedure OnEditProxArt(Sender: TObject; MantFields: TFields);
      Procedure OnEditProxArtNvl2(Sender: TObject; MantFields: TFields);
      Procedure OnShowProvArtDet(Sender: TObject);
      Procedure OnShowProvArtDetOC(Sender: TObject);

   // Consumo por Años
   //   Procedure PegaPanelToolAno(Sender: TObject);
   //   Procedure OnEditaConsumo(Sender: TObject; MantFields: TFields);
   //   Procedure OnEditaTotal(Sender: TObject; MantFields: TFields);

   // Tool de Requerimientos Pendientes
      Procedure ToolReqPendCreate(Sender: TObject);
      //Tool proveedor por rubro
      Procedure ToolProvRubroCreate(Sender: TObject);

   // Tool de Detalle de Ordenes de Compra
      Procedure PegaPanelToolDetOC(Sender: TObject);

   End;

Procedure ADOCompraPendxArt; stdcall;
Procedure ADRequisicionesPendxArt; stdcall;
Procedure ADFactxPagar; stdcall;
Procedure ADArtxProveedor; stdcall;
Procedure ADArtxProveedor_1; stdcall;
Procedure ADProveedorxArt; stdcall;
//Procedure ADConsumoxAnos; stdcall;
Procedure ADProveedoresxRubro; stdcall;
Procedure ADRequerimientosPend; stdcall;
Procedure ADDetalleOCompra; stdcall;
Procedure ADVerificaVersion; stdcall;
Exports
   ADOCompraPendxArt,
   ADRequisicionesPendxArt,
   ADFactxPagar,
   ADArtxProveedor,
   ADArtxProveedor_1,
   ADProveedorxArt,
//   ADConsumoxAnos,
   ADProveedoresxRubro,
   ADRequerimientosPend,
   ADDetalleOCompra,
   ADVerificaVersion;

Var
   FADConsultas: TFADConsultas;
   Mtx5000, Mtx5001, Mtx5002: TMant;
   D, M, Y: word;
   wArticuloProvBazar: String;
Implementation

{$R *.dfm}

//Uses LOGDM1, LOG504, LOG201, LOG505, LOG506, LOG710, LOG512, LOG605,
//   LOG610, LOG720, LOG722, LOG724, LOG505_1;
Uses LOGDM1, LOG504, LOG505, LOG506, LOG512, LOG605,
   LOG610, LOG720, LOG722, LOG724, LOG505_1;
// LOG504 (FToolDetMov)
// LOG201 (FRegReqs)
// LOG505 (FToolArtxProv)
// LOG505_1 (FToolArtxProv_1)
// LOG506 (FToolProvxArt)
// LOG710 (ex ALM415) (FToolConAnno)
// LOG512 (FProvRubro)
// LOG605 (FToolReqPend)
// LOG610 (FToolDetOC)

////////////////////////////////////////////////////////////////////////
// ORDEN DE COMPRA PENDIENTES POR ARTICULO
////////////////////////////////////////////////////////////////////////

Procedure ADOCompraPendxArt;
Var
   sSQL: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010501') Then Exit;

   Screen.Cursor := crHourGlass;
   sSQL := 'Select A.CIAID, A.ARTID AS ARTID, B.ARTDES, '
      + '       SUM(A.DODCCNT) AS CANPED, '
      + '       SUM(DODCCATE) AS CANATE, '
      + '       SUM(A.DODCCNT)-SUM(DODCCATE) AS CANFAL, COUNT(*) NODC '
      + '  from LOG305 A, TGE205 B, LOG304 C '
      + ' where (A.ODCEST= ''ACEPTADO'' OR A.ODCEST= ''PARCIAL'') '
      + '   and A.TIPOADQ=''C'' '
      + '   and A.CIAID = B.CIAID(+) AND A.ARTID = B.ARTID(+) '
      + '   and A.CIAID = C.CIAID AND A.ODCID = C.ODCID '
      + ' group by A.CIAID, A.ARTID, ARTDES';
   FADConsultas := TFADConsultas.Create(Application);
   FADConsultas.wCualODCReq := 'ODC';
   Mtx5000 := TMant.Create(Application);
   FToolDetMov := TFToolDetMov.Create(Application);
   FToolDetMov.Visible := False;
   Try
      Mtx5000.Admin := DMLOG.wAdmin;
      Mtx5000.User := DMLOG.wUsuario;
      Mtx5000.ClientDataSet := DMLOG.cdsDetMov;
      Mtx5000.DComC := DMLOG.DCom1;
      Mtx5000.FileNameIni := '\oaLog.ini';
      Mtx5000.Filter := '';
      Mtx5000.Module := DMLOG.wModulo;
      Mtx5000.SectionName := 'DetMovOCo';
      Mtx5000.TableName := 'VWLOGDETMOVOCO';
      Mtx5000.Titulo := ' O. Compra  Pendientes por Articulo';
      Mtx5000.OnCreateMant := FADConsultas.PegaPanelDetMovOCRQ;
      Mtx5000.OnEdit := FADConsultas.OnEditDetMovOc;
      Mtx5000.OnInsert := Nil;
      Mtx5000.OnDelete := Nil;
      Mtx5000.OnShow := Nil;
      Mtx5000.UsuarioSQL.Add(sSQL);
      Mtx5000.NoVisible.Clear;
      Mtx5000.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx5000.Execute;
   Finally
   End
End;

Procedure TFADConsultas.PegaPanelDetMovOCRQ(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolDetMov.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFADConsultas.OnEditDetMovOc(Sender: TObject;
   MantFields: TFields);
Var
   sSQL: String;
Begin
   If Not DMLOG.DCOM1.Connected Then Exit;

   If (Mtx5000.FMant.cds2.recno <= 0) And
      (Mtx5000.FMant.cds2.eof) Then
   Begin
      ErrorMsg('Error', ' No Existen Registros ');
      exit;
   End;

   If wCualODCReq = 'ODC' Then
   Begin
      Screen.Cursor := crHourGlass;
      sSQL := 'Select C.*, A.ARTID '
         + '  from LOG305 A, TGE205 B, LOG304 C '
         + ' where A.CIAID=' + quotedstr(MantFields.FieldByName('CIAID').AsString)
         + '   and A.ARTID=' + quotedstr(MantFields.FieldByName('ARTID').AsString)
         + '   and (A.CIAID = B.CIAID and A.ARTID = B.ARTID) '
         + '   and (A.CIAID = C.CIAID and A.ODCID=C.ODCID) '
         + '   and (C.ODCEST= ''ACEPTADO'' or C.ODCEST= ''PARCIAL'') ';
      Mtx5001 := TMant.Create(Application);
      Try
         Mtx5001.Admin := DMLOG.wAdmin;
         Mtx5001.User := DMLOG.wUsuario;
         Mtx5001.ClientDataSet := DMLOG.cdsOrdComp;
         Mtx5001.DComC := DMLOG.DCom1;
         Mtx5001.FileNameIni := '\oaLog.ini';
         Mtx5001.Filter := '';
         Mtx5001.Module := DMLOG.wModulo;
         Mtx5001.SectionName := 'OCompraCon';
         Mtx5001.TableName := 'VWLOGOCOMPRACON';
         Mtx5001.Titulo := 'Ordenes de Compra';
         Mtx5001.OnCreateMant := Nil; //PegaPanelToolOC;
         Mtx5001.OnEdit := FADConsultas.OnEditDetMovRq;
         Mtx5001.OnInsert := Nil;
         Mtx5001.OnDelete := Nil;
         Mtx5001.OnShow := Nil; //OnShowOrdC;
         Mtx5001.UsuarioSQL.Add(sSQL);
         Mtx5001.NoVisible.Clear;
         Mtx5001.OnCierra := DMLOG.DisminuyeForma;
         Screen.Cursor := crDefault;
         Mtx5001.Execute;
      Finally
      End;
   End
   Else
      If wCualODCReq = 'REQ' Then
      Begin
         sSQL := 'Select C.* '
            + '  from LOG309 A, TGE205 B, LOG308 C '
            + ' where A.CIAID = B.CIAID '
            + '   and A.ARTID = B.ARTID'
            + '   and (C.RQSEST= ''ACEPTADO'' '
            + '     or C.RQSEST= ''PARCIAL'') '
            + '   and A.ARTID=''' + MantFields.FieldByName('ARTID').AsString + ''''
            + '   and A.RQSID=C.RQSID';
         Mtx5002 := TMant.Create(Application);
         Try
            Mtx5002.Admin := DMLOG.wAdmin;
            Mtx5002.User := DMLOG.wUsuario;
            Mtx5002.Module := DMLOG.wModulo;
            Mtx5002.TableName := 'VWLOGRQSCON';
            Mtx5002.Titulo := 'Requisiciones';
            Mtx5002.ClientDataSet := DMLOG.cdsReqs;
            Mtx5002.OnCreateMant := Nil;
            Mtx5002.DComC := DMLOG.DCOM1;
            Mtx5002.OnEdit := FADConsultas.OnEditDetMovLe;
            Mtx5002.OnInsert := Nil; //OnInsertRequis;
            Mtx5002.OnDelete := Nil; //OnDeleteRequis;
            Mtx5002.OnShow := FADConsultas.OnShowRequis;
            Mtx5002.SectionName := 'RqsCon';
            Mtx5002.FileNameIni := '\oaLog.ini';
            Mtx5002.UsuarioSQL.Add(sSQL);
            Mtx5002.Filter := '';
            Mtx5002.NoVisible.Clear;
            Mtx5002.OnCierra := DMLOG.DisminuyeForma;
            Screen.Cursor := crDefault;
            Mtx5002.Execute;
         Finally
         End;
      End;
End;

Procedure TFADConsultas.OnEditDetMovRq(Sender: TObject;
   MantFields: TFields);
Var
   sSQL: String;
Begin
   If Not DMLOG.DCOM1.Connected Then Exit;

   If (Mtx5001.FMant.cds2.RecNo <= 0) And
      (Mtx5001.FMant.cds2.eof) Then
   Begin
      ErrorMsg('Error', ' No Existen Registros ');
      exit;
   End;
   Screen.Cursor := crHourGlass;
   Mtx5002 := TMant.Create(Application);
   sSQL := 'Select A.* '
      + '  from LOG308 A, LOG324 B '
      + ' where (A.CIAID = B.CIAID and A.RQSID = B.RQSID) '
      + '   and B.CIAID =''' + MantFields.FieldByName('CIAID').AsString + ''''
      + '   and B.ODCID =''' + MantFields.FieldByName('ODCID').AsString + ''''
      + '   and B.ARTID =''' + MantFields.FieldByName('ARTID').AsString + '''';
   DMLOG.FiltraTabla(DMLOG.cdsLoc, 'TGE126', 'LOCID', 'LOCID');
   DMLOG.FiltraTabla(DMLOG.cdsObra, 'TGE213', 'OBRAID', 'OBRAID');
   Try
      Mtx5002.Admin := DMLOG.wAdmin;
      Mtx5002.User := DMLOG.wUsuario;
      Mtx5002.ClientDataSet := DMLOG.cdsReqs;
      Mtx5002.DComC := DMLOG.DCom1;
      Mtx5002.FileNameIni := '\oaLog.ini';
      Mtx5002.Filter := '';
      Mtx5002.Module := DMLOG.wModulo;
      Mtx5002.SectionName := 'RqsCompra';
      Mtx5002.TableName := 'VWLOGRQSCOMPRA';
      Mtx5002.Titulo := 'Requisiciones de Compra';
      Mtx5002.OnCreateMant := Nil;
      Mtx5002.OnEdit := FADConsultas.OnEditDetMovLe;
      Mtx5002.OnInsert := Nil;
      Mtx5002.OnDelete := Nil;
      Mtx5002.OnShow := Nil;
      Mtx5002.UsuarioSQL.Add(sSQL);
      Mtx5002.NoVisible.Clear;
      Mtx5002.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx5002.Execute;
   Finally
   End;
End;

Procedure TFADConsultas.OnEditDetMovLe(Sender: TObject;
   MantFields: TFields);
Var
   sCIA, sLOC, sRQS, sSQL: String;
Begin
{
   If Not DMLOG.DCOM1.Connected Then Exit;

   If (Mtx5002.FMant.cds2.RecNo <= 0) And
      (Mtx5002.FMant.cds2.eof) Then
   Begin
      ErrorMsg('Error', 'No Existen Registros ');
      exit;
   End;
   DMLOG.FiltraTabla(DMLOG.cdsLoc, 'TGE126', 'LOCID', 'LOCID');
   DMLOG.FiltraTabla(DMLOG.cdsObra, 'TGE213', 'OBRAID', 'OBRAID');

   sSQL := 'Select A.* '
      + '  from LOG308 A, LOG324 B '
      + ' where (A.CIAID = B.CIAID and A.RQSID = B.RQSID) '
      + '   and A.CIAID =''' + MantFields.FieldByName('CIAID').AsString + ''''
      + '   and A.RQSID =''' + MantFields.FieldByName('RQSID').AsString + '''';
   DMLOG.cdsReqs.Close;
   DMLOG.cdsReqs.MasterSource := Nil;
   DMLOG.cdsReqs.MasterFields := '';
   DMLOG.cdsReqs.IndexFieldNames := '';
   DMLOG.cdsReqs.DataRequest(sSQL);
   DMLOG.cdsReqs.Open;

   DMLOG.wModo := 'M';

   FRegReqs := TFRegReqs.create(Application);

   FRegReqs.dblcCIA.Enabled := False;
   FRegReqs.dbeNumRqs.Enabled := False;
   FRegReqs.dblcLOC.Enabled := False;

   sCIA := MantFields.FieldByName('CIAID').AsString;
   sLOC := MantFields.FieldByName('LOCID').AsString;
   sRQS := MantFields.FieldByName('RQSID').AsString;
   sSQL := 'Select * '
      + '  from LOG309 '
      + ' where CIAID=' + quotedstr(sCIA)
      + '   and RQSID=' + quotedstr(sRQS)
      + '   and LOCID=' + quotedstr(sLOC)
      + ' order by CIAID, RQSID, DRQSID';
   DMLOG.cdsDReqs.Close;
   DMLOG.cdsDReqs.MasterSource := Nil;
   DMLOG.cdsDReqs.MasterFields := '';
   DMLOG.cdsDReqs.IndexFieldNames := '';
   DMLOG.cdsDReqs.DataRequest(sSQL);
   DMLOG.cdsDReqs.Open;
   FRegReqs.pnlBotones.Enabled := False;
   FRegReqs.Z2bbtnGraba.Enabled := False;
   FRegReqs.Z2bbtnOK.Enabled := False;
   FRegReqs.ActiveMDIChild;

   FRegReqs.pnlBotones.Enabled := True;
   FRegReqs.Z2bbtnGraba.Enabled := True;
   FRegReqs.Z2bbtnOK.Enabled := True;
   DMLOG.cdsLoc.Close;
   DMLOG.cdsObra.Close;
}
End;

Procedure TFADConsultas.OnShowRequis(Sender: TObject);
Begin
//
End;

////////////////////////////////////////////////////////////////////////
// REQUISICIONES PENDIENTES POR ARTÍCULO
////////////////////////////////////////////////////////////////////////

Procedure ADRequisicionesPendxArt;
Var
   sSQL: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

   Screen.Cursor := crHourGlass;
   sSQL := 'Select A.CIAID, A.ARTID AS ARTID, B.ARTDES, '
      + '       SUM(A.DRQSCNSG) AS CANPED, '
      + '       SUM(A.DRQSCNAG) AS CANATE, '
      + '       SUM(A.DRQSCNSG)-SUM(A.DRQSCNAG) AS CANFAL, COUNT(*) NODC '
      + '  from LOG308 C, LOG309 A, TGE205 B '
      + ' where (A.RQSEST= ''ACEPTADO'' OR A.RQSEST= ''PARCIAL'') '
      + '   and A.CIAID = C.CIAID '
      + '   and A.TIPOADQ=''C'' '
      + '   and A.RQSID = C.RQSID '
      + '   and A.CIAID = B.CIAID(+) AND A.ARTID = B.ARTID(+) '
      + ' group by A.CIAID, A.ARTID, ARTDES';

   FADConsultas := TFADConsultas.Create(Application);
   FADConsultas.wCualODCReq := 'REQ';
   FToolDetMov := TFToolDetMov.Create(Application);
   FToolDetMov.Visible := False;
   Mtx5000 := TMant.Create(Application);
   Try
      Mtx5000.Admin := DMLOG.wAdmin;
      Mtx5000.User := DMLOG.wUsuario;
      Mtx5000.ClientDataSet := DMLOG.cdsDetMov;
      Mtx5000.DComC := DMLOG.DCom1;
      Mtx5000.FileNameIni := '\oaLog.ini';
      Mtx5000.Filter := '';
      Mtx5000.Module := DMLOG.wModulo;
      Mtx5000.SectionName := 'DetMovRqs';
      Mtx5000.TableName := 'VWLOGDETMOVRQS';
      Mtx5000.Titulo := ' Requisiciones Pendientes por Articulo';
      Mtx5000.OnCreateMant := FADConsultas.PegaPanelDetMovOCRQ;
      Mtx5000.OnEdit := FADConsultas.OnEditDetMovOc;
      Mtx5000.OnInsert := Nil;
      Mtx5000.OnDelete := Nil;
      Mtx5000.OnShow := Nil;
      Mtx5000.UsuarioSQL.Add(sSQL);
      Mtx5000.NoVisible.Clear;
      Mtx5000.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx5000.Execute;
   Finally
   End
End;

////////////////////////////////////////////////////////////////////////
// FACTURAS X PAGAR
////////////////////////////////////////////////////////////////////////

Procedure ADFactxPagar;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010503') Then Exit;

   Try
      Mtx5000 := TMant.Create(Application);
      Mtx5000.User := DMLOG.wUsuario;
      Mtx5000.Admin := DMLOG.wAdmin;
      Mtx5000.Module := DMLOG.wModulo;
      Mtx5000.DComC := DMLOG.DCom1;
      Mtx5000.ClientDataSet := DMLOG.cdsMovCxP;
      Mtx5000.TableName := 'CXP301';
      Mtx5000.Filter := '(CPOCOMP<>' + quotedstr('') + ' or CPOCOMP is not null )';
      Mtx5000.Titulo := 'Facturas por Pagar';
      Mtx5000.SectionName := 'CompProvxPag';
      Mtx5000.FileNameIni := '\oaLog.INI';
      Mtx5000.OnCreateMant := Nil;
      Mtx5000.OnEdit := Nil;
      Mtx5000.OnInsert := Nil;
      Mtx5000.OnDelete := Nil;
      Mtx5000.OnShow := Nil;
      Mtx5000.NoVisible.Clear;
      Mtx5000.OnCierra := DMLOG.DisminuyeForma;
      Mtx5000.Execute;
   Finally
   End;
End;

////////////////////////////////////////////////////////////////////////
// ARTICULOS X PROVEEDOR
////////////////////////////////////////////////////////////////////////

Procedure ADArtxProveedor;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010504') Then Exit;

   Screen.Cursor := crHourGlass;
   wArticuloProvBazar := 'S';
   xSQL := 'Select A.CIAID, B.CIADES, A.CLAUXID, A.PROV, C.ARTID, DODCOBS, '
      + '       SUM(NVL(DODCCNT,0)) CANTIDAD, '
      + '       L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, P.PROVDES, CARART, '
      + '       SUM(NVL(CASE WHEN A.TMONID=''' + DMLOG.wTMonExt + ''' THEN ROUND(DODCIMP *ODCTCAMB,2) ELSE DODCIMP  END,0)) COSTOMN, '
      + '       SUM(NVL(CASE WHEN A.TMONID=''' + DMLOG.wTMonExt + ''' THEN ROUND((IMPTOT-DODCIMP)*ODCTCAMB,2) ELSE (IMPTOT-DODCIMP) END,0)) IGVMN, '
      + '       SUM(NVL(CASE WHEN A.TMONID=''' + DMLOG.wTMonExt + ''' THEN ROUND(IMPTOT*ODCTCAMB,2) ELSE IMPTOT END,0)) TOTALMN, '
      + '       SUM(NVL(CASE WHEN A.TMONID=''' + DMLOG.wTMonExt + ''' THEN DODCIMP  ELSE ROUND(DODCIMP /ODCTCAMB,2) END,0)) COSTOME, '
      + '       SUM(NVL(CASE WHEN A.TMONID=''' + DMLOG.wTMonExt + ''' THEN (IMPTOT-DODCIMP) ELSE ROUND((IMPTOT-DODCIMP)/ODCTCAMB,2) END,0)) IGVME, '
      + '       SUM(NVL(CASE WHEN A.TMONID=''' + DMLOG.wTMonExt + ''' THEN IMPTOT ELSE ROUND(IMPTOT/ODCTCAMB,2) END,0)) TOTALME, '
      + '       ''DESDE ' + DateToStr(Date) + ' HASTA ' + DateToStr(Date) + ''' RANGO '
      + '  from LOG304 A, TGE101 B, LOG305 C, TGE205 L, ALM_MAR_ART M, ALM_TIP_ART T, TGE201 P '
      + ' where A.CIAID=' + QuotedStr('xx')
      + '   and A.ODCFEMI>=''' + DateToStr(Date) + ''' AND A.ODCFEMI<=''' + DateToStr(Date) + ''' '
      + '   and A.ODCEST=''ACEPTADO'' '
      + '   and A.PROV=''ZXYAS'' '
      + '   and A.CIAID=B.CIAID '
      + '   and A.CIAID=C.CIAID AND A.ODCID=C.ODCID '
      + '   and (L.CIAID(+)=C.CIAID and L.ARTID(+)=C.ARTID) '
      + '   and (L.TIPART=T.TIPART(+)) '
      + '   and (A.CLAUXID=P.CLAUXID(+) AND A.PROV=P.PROV(+)) '
      + ' group by A.CIAID, B.CIADES, A.CLAUXID, A.PROV, P.PROVDES, C.ARTID, DODCOBS, '
      + '          L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, P.PROVDES, CARART '
      + ' order by A.CIAID, B.CIADES, A.CLAUXID, A.PROV, P.PROVDES, C.ARTID, DODCOBS';

   xSQL := 'select * from (' + xSQL + ') SOLVISTA ';

   FToolArtxProv := TFToolArtxProv.Create(Application);
   FToolArtxProv.Visible := False;
   Mtx5000 := TMant.Create(Application);
   Try
      Mtx5000.Admin := DMLOG.wAdmin;
      Mtx5000.User := DMLOG.wUsuario;
      Mtx5000.DComC := DMLOG.DCOM1;
      Mtx5000.Module := DMLOG.wModulo;
      Mtx5000.UsuarioSQL.Add(xSQL);

      Mtx5000.TableName := 'VWLOGARTCOMP';
      Mtx5000.Titulo := 'Artículos por Proveedor';
      Mtx5000.Filter := '';
      Mtx5000.ClientDataSet := DMLOG.cdsArti;
      Mtx5000.OnCreateMant := FADConsultas.PegaPanelArtxProv;
      Mtx5000.OnEdit := FADConsultas.OnEditArtxPro;
      Mtx5000.OnInsert := Nil; //OnInsertArticulo;
      Mtx5000.OnDelete := Nil; //OnDeleteArticulo;
      Mtx5000.OnShow := Nil; //OnShowArticulo;
      Mtx5000.SectionName := 'LOGArti';
      Mtx5000.FileNameIni := '\oaLog.ini';
      Mtx5000.NoVisible.Clear;
      Mtx5000.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx5000.Execute;
   Finally
   End;
End;

Procedure ADArtxProveedor_1;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010505') Then Exit;

   Screen.Cursor := crHourGlass;
   wArticuloProvBazar := 'N';

   FToolArtxProv_1 := TFToolArtxProv_1.Create(Application);
   FToolArtxProv_1.Visible := False;
   Mtx5000 := TMant.Create(Application);
   Try
      Mtx5000.Admin := DMLOG.wAdmin;
      Mtx5000.User := DMLOG.wUsuario;
      Mtx5000.DComC := DMLOG.DCOM1;
      Mtx5000.Module := DMLOG.wModulo;
      Mtx5000.TableName := 'TGE205';
      Mtx5000.Titulo := 'Artículos por Proveedor';
      Mtx5000.Filter := '';
      Mtx5000.ClientDataSet := DMLOG.cdsArti;
      Mtx5000.OnCreateMant := FADConsultas.PegaPanelArtxProv;
      Mtx5000.OnEdit := FADConsultas.OnEditArtxPro_1;
      Mtx5000.OnInsert := Nil; //OnInsertArticulo;
      Mtx5000.OnDelete := Nil; //OnDeleteArticulo;
      Mtx5000.OnShow := Nil; //OnShowArticulo;
      Mtx5000.SectionName := 'LOGArti';
      Mtx5000.FileNameIni := '\oaLog.ini';
      Mtx5000.NoVisible.Clear;
      Mtx5000.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx5000.Execute;
   Finally
   End;
End;

Procedure TFADConsultas.PegaPanelArtxProv(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   If wArticuloProvBazar = 'N' Then
      pg := FToolArtxProv_1.pnlTool
   Else
      pg := FToolArtxProv.pnlTool;

   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFADConsultas.PegaPanelArtxProvOC(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolArtxProvOC.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFADConsultas.OnEditArtxPro(Sender: TObject;
   MantFields: TFields);
Var
   sSQL: String;
   FRegDes, FRegHas: String;
Begin
   If Not DMLOG.DCOM1.Connected Then Exit;
   If (Mtx5000.FMant.cds2.recno <= 0) And
      (Mtx5000.FMant.cds2.eof) Then
   Begin
      ErrorMsg('Error', ' No Existen Registros ');
      exit;
   End;

   FRegDes := quotedStr(formatdatetime(DMLOG.wFormatFecha, FToolArtxProv.dtpDesde.DateTime));
   FRegHas := quotedStr(formatdatetime(DMLOG.wFormatFecha, FToolArtxProv.dtpHasta.DateTime));

   sSQL := 'Select DES.PROVDES, CIAID, PROFID, DPROFPROV, DPROFCNTG, DPROFPUNG, '
      + '       DPROFIMP, DPROFFREG, ODCID '
      + '  FROM LOG313, TGE201 DES '
      + ' WHERE DES.PROV=LOG313.DPROFPROV '
      + '   AND DPROFFREG IN '
      + '          (SELECT X.MDATE '
      + '             FROM (SELECT DPROFPROV, MAX(DPROFFREG) MDATE '
      + '                     FROM LOG313 '
      + '                    WHERE ARTID=''' + MantFields.FieldByName('ARTID').AsString + ''' '
      + '                    GROUP BY DPROFPROV ) X ) '
      + '   AND (DPROFFREG>=' + FRegDes + ' and DPROFFREG<=' + FRegHas + ') '
      + '   AND ARTID=''' + MantFields.FieldByName('ARTID').AsString + '''';

   xSQL := 'select A.CIAID, B.CIADES, A.CLAUXID, A.PROV, C.ARTID, DODCOBS, A.ODCID, ODCFEMI, '
      + '       L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, P.PROVDES, CARART, '
      + '       NVL(DODCCNT,0) CANTIDAD, '
      + '       NVL(CASE WHEN A.TMONID=''' + DMLOG.wTMonExt + ''' THEN ROUND(DODCIMP *ODCTCAMB,2) ELSE DODCIMP  END,0) COSTOMN, '
      + '       NVL(CASE WHEN A.TMONID=''' + DMLOG.wTMonExt + ''' THEN ROUND((IMPTOT-DODCIMP)*ODCTCAMB,2) ELSE (IMPTOT-DODCIMP) END,0) IGVMN, '
      + '       NVL(CASE WHEN A.TMONID=''' + DMLOG.wTMonExt + ''' THEN ROUND(IMPTOT*ODCTCAMB,2) ELSE IMPTOT END,0) TOTALMN, '
      + '       NVL(CASE WHEN A.TMONID=''' + DMLOG.wTMonExt + ''' THEN DODCIMP  ELSE ROUND(DODCIMP /ODCTCAMB,2) END,0) COSTOME, '
      + '       NVL(CASE WHEN A.TMONID=''' + DMLOG.wTMonExt + ''' THEN (IMPTOT-DODCIMP) ELSE ROUND((IMPTOT-DODCIMP)/ODCTCAMB,2) END,0) IGVME, '
      + '       NVL(CASE WHEN A.TMONID=''' + DMLOG.wTMonExt + ''' THEN IMPTOT ELSE ROUND(IMPTOT/ODCTCAMB,2) END,0) TOTALME, '
      + '       ''DESDE ' + FToolArtxProv.dtpDesde.Text + ' HASTA ' + FToolArtxProv.dtpHasta.Text + ''' RANGO '
      + '  From LOG304 A, TGE101 B, LOG305 C, TGE205 L, ALM_MAR_ART M, ALM_TIP_ART T, TGE201 P '
      + ' Where A.CIAID=' + QuotedStr(FToolArtxProv.dblcCia.Text)
      + '   and A.ODCFEMI>=''' + FToolArtxProv.dtpDesde.Text + ''' AND A.ODCFEMI<=''' + FToolArtxProv.dtpHasta.Text + ''' '
      + '   and A.ODCEST=''ACEPTADO'' '
      + '   and A.CIAID=B.CIAID '
      + '   and A.CIAID=C.CIAID AND A.ODCID=C.ODCID '
      + '   and C.ARTID=''' + Mtx5000.FMant.cds2.FieldByName('ARTID').AsString + ''' '
      + '   and (L.CIAID(+)=C.CIAID and L.ARTID(+)=C.ARTID) '
      + '   and (L.MARCA=M.MARCA(+)) ';

   If FToolArtxProv.dblcdMarca.Text <> '' Then
      xSQL := xSQL + 'and L.MARCA(+) LIKE ''' + FToolArtxProv.dblcdMarca.Text + '%'' ';

   xSQL := xSQL + 'AND (L.TIPART=T.TIPART(+)) ';

   If FToolArtxProv.dblcdArtTipo.Text <> '' Then
      xSQL := xSQL + 'and L.TIPART(+) LIKE ''' + FToolArtxProv.dblcdArtTipo.Text + '%'' ';

   xSQL := xSQL + 'AND (A.CLAUXID=P.CLAUXID(+) AND A.PROV=P.PROV(+)) ';

   If FToolArtxProv.dblcdProv.Text <> '' Then
      xSQL := xSQL + 'and A.PROV(+) LIKE ''' + FToolArtxProv.dblcdProv.Text + '%'' ';

   xSQL := xSQL + ' ORDER BY A.CIAID, B.CIADES, A.CLAUXID, A.PROV, P.PROVDES, C.ARTID, DODCOBS';

   xSQL := 'select * from (' + xSQL + ') SOLVISTA ';

   DMLOG.cdsSQL.Filter := '';
   DMLOG.cdsSQL.Filtered := False;
   DMLOG.cdsSQL.IndexFieldNames := '';
   DMLOG.cdsSQL.Close;
   DMLOG.cdsSQL.DataRequest(xSQL);
   DMLOG.cdsSQL.Open;
   If (DMLOG.cdsSQL.RecNo <= 0) And
      (DMLOG.cdsSQL.eof) Then
   Begin
      Screen.Cursor := crDefault;
      ErrorMsg('Adquisiciones', ' No Existe Datos del Artículo Seleccionado ');
      Exit;
   End;

   DMLOG.cdsOrdComp.Filter := '';
   DMLOG.cdsOrdComp.Filtered := False;
   DMLOG.cdsOrdComp.IndexFieldNames := '';

   FToolArtxProvOC := TFToolArtxProvOC.Create(Application);
   FToolArtxProvOC.Visible := False;

   Mtx5001 := TMant.Create(Application);
   Try
      Mtx5001.Admin := DMLOG.wAdmin;
      Mtx5001.User := DMLOG.wUsuario;
      Mtx5001.ClientDataSet := DMLOG.cdsOrdComp;
      Mtx5001.DComC := DMLOG.DCom1;
      Mtx5001.FileNameIni := '\oaLog.ini';
      Mtx5001.Filter := '';
      Mtx5001.Module := DMLOG.wModulo;
      Mtx5001.SectionName := 'OCArtxProv';
      Mtx5001.TableName := 'VWLOGARTCOMPDET';
      Mtx5001.Titulo := Trim(MantFields.FieldByName('PROVDES').AsString);
      Mtx5001.OnCreateMant := PegaPanelArtxProvOC;
      Mtx5001.OnEdit := Nil;
      Mtx5001.OnInsert := Nil;
      Mtx5001.OnDelete := Nil;
      Mtx5001.OnShow := OnShowArtxProvOC;
      Mtx5001.Registros := 30;
      Mtx5001.UsuarioSQL.Clear;
      Mtx5001.UsuarioSQL.Add(xSQL);
      Mtx5001.OnCierra := DMLOG.DisminuyeForma;
      Mtx5001.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx5001.Execute;
   Finally
   End;
End;

Procedure TFADConsultas.OnEditArtxPro_1(Sender: TObject;
   MantFields: TFields);
Var
   sSQL: String;
   FRegDes, FRegHas: String;
Begin
   If Not DMLOG.DCOM1.Connected Then Exit;

   If (Mtx5000.FMant.cds2.recno <= 0) And
      (Mtx5000.FMant.cds2.eof) Then
   Begin
      ErrorMsg('Error', ' No Existen Registros ');
      exit;
   End;

   FRegDes := quotedStr(formatdatetime(DMLOG.wFormatFecha, FToolArtxProv_1.dtpDesde.DateTime));
   FRegHas := quotedStr(formatdatetime(DMLOG.wFormatFecha, FToolArtxProv_1.dtpHasta.DateTime));

   sSQL := 'Select DES.PROVDES, CIAID, PROFID, DPROFPROV, DPROFCNTG, DPROFPUNG, DPROFIMP, '
      + '       DPROFFREG, ODCID '
      + '  from LOG313, TGE201 DES '
      + ' where DES.PROV=LOG313.DPROFPROV '
      + '   and DPROFFREG IN '
      + '         (SELECT X.MDATE '
      + '            FROM (SELECT DPROFPROV, MAX(DPROFFREG) MDATE '
      + '                    FROM LOG313 '
      + '                   WHERE ARTID=''' + MantFields.FieldByName('ARTID').AsString + ''' '
      + '                   GROUP BY DPROFPROV ) X ) '
      + '   and (DPROFFREG>=' + FRegDes + ' and DPROFFREG<=' + FRegHas + ') '
      + '   and ARTID=''' + MantFields.FieldByName('ARTID').AsString + '''';
   DMLOG.cdsSQL.Filter := '';
   DMLOG.cdsSQL.Filtered := False;
   DMLOG.cdsSQL.IndexFieldNames := '';
   DMLOG.cdsSQL.Close;
   DMLOG.cdsSQL.DataRequest(sSQL);
   DMLOG.cdsSQL.Open;
   If (DMLOG.cdsSQL.RecNo <= 0) And
      (DMLOG.cdsSQL.eof) Then
   Begin
      Screen.Cursor := crDefault;
      ErrorMsg('Adquisiciones', ' No Existe Datos del Artículo Seleccionado ');
      Exit;
   End;

   DMLOG.cdsOrdComp.Filter := '';
   DMLOG.cdsOrdComp.Filtered := False;
   DMLOG.cdsOrdComp.IndexFieldNames := '';
   Mtx5001 := TMant.Create(Application);
   Try
      Mtx5001.Admin := DMLOG.wAdmin;
      Mtx5001.User := DMLOG.wUsuario;
      Mtx5001.ClientDataSet := DMLOG.cdsOrdComp;
      Mtx5001.DComC := DMLOG.DCom1;
      Mtx5001.FileNameIni := '\oaLog.ini';
      Mtx5001.Filter := '';
      Mtx5001.Module := DMLOG.wModulo;
      Mtx5001.SectionName := 'OCArtxProv';
      Mtx5001.TableName := 'VWLOGOCARTXPROV';
      Mtx5001.Titulo := Trim(MantFields.FieldByName('ARTDES').AsString) + '  -  ' + MantFields.FieldByName('UNMIDG').AsString;
      Mtx5001.OnCreateMant := Nil; //PegaPanelToolOC;
      Mtx5001.OnEdit := FADConsultas.OnEditArtxProNvl2;
      Mtx5001.OnInsert := Nil;
      Mtx5001.OnDelete := Nil;
      Mtx5001.OnShow := Nil; //OnShowOrdC;
      Mtx5001.Registros := 30;
      Mtx5001.UsuarioSQL.Clear;
      Mtx5001.UsuarioSQL.Add(sSQL);
      Mtx5001.OnCierra := DMLOG.DisminuyeForma;
      Mtx5001.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx5001.Execute;
   Finally
   End;
End;

Procedure TFADConsultas.OnShowArtxProvOC(Sender: TObject);
Begin
   FToolArtxProvOC.dblcCia.Text := FToolArtxProv.dblcCia.Text;
   FToolArtxProvOC.edtCia.Text := FToolArtxProv.edtCia.Text;
   FToolArtxProvOC.dtpDesde.Date := FToolArtxProv.dtpDesde.Date;
   FToolArtxProvOC.dtpHasta.Date := FToolArtxProv.dtpHasta.Date;
   FToolArtxProvOC.meArt.Text := Mtx5000.FMant.cds2.FieldByName('ARTID').AsString + ' - '
      + Mtx5000.FMant.cds2.FieldByName('DODCOBS').AsString;
End;

Procedure TFADConsultas.OnEditArtxProNvl2(Sender: TObject;
   MantFields: TFields);
Var
   sSQL: String;
   FRegDes, FRegHas: String;
Begin
   If Not DMLOG.DCOM1.Connected Then Exit;

   If (Mtx5000.FMant.cds2.recno <= 0) And
      (Mtx5000.FMant.cds2.eof) Then
   Begin
      ErrorMsg('Error', ' No Existen Registros ');
      exit;
   End;

   If wArticuloProvBazar = 'N' Then
   Begin
      FRegDes := quotedStr(formatdatetime(DMLOG.wFormatFecha, FToolArtxProv_1.dtpDesde.DateTime));
      FRegHas := quotedStr(formatdatetime(DMLOG.wFormatFecha, FToolArtxProv_1.dtpHasta.DateTime));
   End
   Else
   Begin
      FRegDes := quotedStr(formatdatetime(DMLOG.wFormatFecha, FToolArtxProv.dtpDesde.DateTime));
      FRegHas := quotedStr(formatdatetime(DMLOG.wFormatFecha, FToolArtxProv.dtpHasta.DateTime));
   End;
   sSQL := 'Select CIAID, PROFID, ODCID, UNMIDG, DPROFCNTG, DPROFPUNG, DPROFIMP, DPROFIMPU, '
      + '       DPROFOBS, DPROFFREG, PROFUSER '
      + '  from LOG313 A '
      + ' where A.ARTID=''' + Mtx5000.FMant.cds2.FieldByName('ARTID').AsString + ''' '
      + '   and A.DPROFPROV=''' + MantFields.FieldByName('DPROFPROV').AsString + ''' '
      + '   and (DPROFFREG>=' + FRegDes + ' AND DPROFFREG<=' + FRegHas + ')';
   Mtx5002 := TMant.Create(Application);
   Try
      Mtx5002.Admin := DMLOG.wAdmin;
      Mtx5002.User := DMLOG.wUsuario;
      Mtx5002.ClientDataSet := DMLOG.cdsLOG;
      Mtx5002.DComC := DMLOG.DCom1;
      Mtx5002.FileNameIni := '\oaLog.ini';
      Mtx5002.Filter := '';
      Mtx5002.Module := DMLOG.wModulo;
      Mtx5002.SectionName := 'OCArtxProvGnr';
      Mtx5002.TableName := 'VWLOGOCARTXPROVGNR';
      Mtx5002.Titulo := MantFields.FieldByName('PROVDES').AsString
         + '  -  ' + Mtx5000.FMant.cds2.FieldByName('ARTDES').AsString;
      Mtx5002.OnCreateMant := Nil;
      Mtx5002.OnEdit := Nil;
      Mtx5002.OnInsert := Nil;
      Mtx5002.OnDelete := Nil;
      Mtx5002.OnShow := Nil;
      Mtx5002.Registros := 30;
      Mtx5002.UsuarioSQL.Clear;
      Mtx5002.UsuarioSQL.Add(sSQL);
      Mtx5002.NoVisible.Clear;
      Mtx5002.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx5002.Execute;
   Finally
   End;
End;

////////////////////////////////////////////////////////////////////////
// PROVEEDOR x ARTICULOS
////////////////////////////////////////////////////////////////////////

Procedure ADProveedorxArt;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010506') Then Exit;

   Screen.Cursor := crHourGlass;
   FToolProvxArt := TFToolProvxArt.Create(Application);
   FToolProvxArt.Visible := False;
   DMLOG.cdsProv.IndexFieldNames := '';
   Mtx5000 := TMant.Create(Application);

   xSQL := 'Select A.CIAID, B.CIADES, CLAUXID, PROV, PROVDES, SUM(NVL(ODCIXTCC,0)) COSTOMN, '
      + '       SUM(NVL(ODCIXTD,0)) DCTOMN, '
      + '       SUM(NVL(ODCTTIMPU,0)) IGVMN, '
      + '       SUM(NVL(ODCTOTALG,0)) TOTALMN, '
      + '       SUM(NVL(ODCIXTCC,0)) COSTOME, '
      + '       SUM(NVL(ODCIXTD,0)) DCTOME, '
      + '       SUM(NVL(ODCTTIMPU,0)) IGVME, '
      + '       SUM(NVL(ODCTOTALG,0)) TOTALME, '
      + '       ''DESDE 01/01/2005 HASTA 30/01/2005'' RANGO '
      + '  from LOG304 A, TGE101 B '
      + ' where A.CIAID=''ZZ'' and odcfemi>=''01/01/2005'' and odcfemi<=''31/12/2005'' '
      + '   and ODCEST=''ACEPTADO'' '
      + ' group by A.CIAID, B.CIADES, CLAUXID, PROV, PROVDES '
      + ' order by A.CIAID, B.CIADES, CLAUXID, PROV, PROVDES';
   Try
      Mtx5000.Admin := DMLOG.wAdmin;
      Mtx5000.User := DMLOG.wUsuario;
      Mtx5000.DComC := DMLOG.DCOM1;
      Mtx5000.Titulo := 'Proveedor por Articulos';
      Mtx5000.Module := DMLOG.wModulo;
      Mtx5000.Filter := '';
      Mtx5000.ClientDataset := DMLOG.cdsProv;
      Mtx5000.OnInsert := Nil;
      Mtx5000.OnDelete := Nil;
      Mtx5000.OnCreateMant := FADConsultas.PegaPanelProvxArt;
      Mtx5000.OnEdit := FADConsultas.OnEditProxArt;
      Mtx5000.SectionName := 'LOGProvxArt';
      Mtx5000.FileNameIni := '\oaLog.ini';

      Mtx5000.TableName := 'VWLOGPROVARTI';
      Mtx5000.UsuarioSQL.Add(xSQL);

      Mtx5000.NoVisible.Clear;
      Mtx5000.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx5000.Execute;
   Finally
   End;
End;

Procedure TFADConsultas.PegaPanelProvxArt(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolProvxArt.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFADConsultas.PegaPanelProvxArtDet(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolProvxArtDet.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFADConsultas.PegaPanelProvxArtDetOC(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolProvxArtDetOC.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFADConsultas.OnEditProxArt(Sender: TObject;
   MantFields: TFields);
Var
   xProv, sSQL: String;
   FRegDes, FRegHas: String;
Begin
   If Not DMLOG.DCOM1.Connected Then Exit;

   If (Mtx5000.FMant.cds2.recno <= 0) And
      (Mtx5000.FMant.cds2.eof) Then
   Begin
      ErrorMsg('Error', ' No Existen Registros ');
      exit;
   End;
   FRegDes := formatdatetime(DMLOG.wFormatFecha, FToolProvxArt.dtpDesde.DateTime);
   FRegHas := formatdatetime(DMLOG.wFormatFecha, FToolProvxArt.dtpHasta.DateTime);
   xProv := DMLOG.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');

   xSQL := 'Select A.CIAID, B.CIADES, A.CLAUXID, A.PROV, PROVDES, C.ARTID, DODCOBS, '
      + '       sum(nvl(DODCCNT,0)) CANTIDAD, '
      + '       sum(nvl(case when TMONID=''' + DMLOG.wTMonExt + ''' then round(DODCIMP *ODCTCAMB,2) ELSE DODCIMP  END,0)) COSTOMN, '
      + '       sum(nvl(case when TMONID=''' + DMLOG.wTMonExt + ''' then round((IMPTOT-DODCIMP)*ODCTCAMB,2) ELSE (IMPTOT-DODCIMP) END,0)) IGVMN, '
      + '       sum(nvl(case when TMONID=''' + DMLOG.wTMonExt + ''' then round(IMPTOT*ODCTCAMB,2) ELSE IMPTOT END,0)) TOTALMN, '
      + '       sum(nvl(case when TMONID=''' + DMLOG.wTMonExt + ''' then DODCIMP  ELSE ROUND(DODCIMP /ODCTCAMB,2) END,0)) COSTOME, '
      + '       sum(nvl(case when TMONID=''' + DMLOG.wTMonExt + ''' then (IMPTOT-DODCIMP) ELSE ROUND((IMPTOT-DODCIMP)/ODCTCAMB,2) END,0)) IGVME, '
      + '       sum(nvl(case when TMONID=''' + DMLOG.wTMonExt + ''' then IMPTOT ELSE ROUND(IMPTOT/ODCTCAMB,2) END,0)) TOTALME, '
      + '       ''DESDE ' + FRegDes + ' HASTA ' + FRegHas + ''' RANGO '
      + '  from LOG304 A, TGE101 B, LOG305 C '
      + ' where A.CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '   and A.ODCFEMI>=''' + FRegDes + ''' AND A.ODCFEMI<=''' + FRegHas + ''' '
      + '   and A.ODCEST=''ACEPTADO'' '
      + '   and A.PROV=''' + MantFields.FieldByName('PROV').AsString + ''' '
      + '   and A.CIAID=B.CIAID '
      + '   and A.CIAID=C.CIAID AND A.ODCID=C.ODCID '
      + ' group by A.CIAID, B.CIADES, A.CLAUXID, A.PROV, PROVDES, C.ARTID, DODCOBS '
      + ' order by A.CIAID, B.CIADES, A.CLAUXID, A.PROV, PROVDES, C.ARTID, DODCOBS ';

   xSQL := 'select * from (' + xSQL + ') SOLVISTA ';

   DMLOG.cdsSQL.Close;
   DMLOG.cdsSQL.DataRequest(xSQL);
   DMLOG.cdsSQL.Open;

   If (DMLOG.cdsSQL.RecNo <= 0) And (DMLOG.cdsSQL.eof) Then
   Begin
      Screen.Cursor := crDefault;
      ErrorMsg('Adquisiciones', ' No Existe Data para el Proveedor Seleccionado ');
      Exit;
   End;

   FToolProvxArtDet := TFToolProvxArtDet.Create(Application);
   FToolProvxArtDet.Visible := False;

   Mtx5001 := TMant.Create(Application);
   Try
      Mtx5001.Admin := DMLOG.wAdmin;
      Mtx5001.User := DMLOG.wUsuario;
      Mtx5001.ClientDataSet := DMLOG.cdsOrdComp;
      Mtx5001.DComC := DMLOG.DCom1;
      Mtx5001.FileNameIni := '\oaLog.ini';
      Mtx5001.Filter := '';
      Mtx5001.Module := DMLOG.wModulo;
      Mtx5001.SectionName := 'OCArtxProv';
      Mtx5001.TableName := 'VWLOGPROVARTIDET';
      Mtx5001.Titulo := MantFields.FieldByName('PROV').AsString + ' - '
         + MantFields.FieldByName('PROVDES').AsString;
      Mtx5001.OnCreateMant := FADConsultas.PegaPanelProvxArtDet;
      Mtx5001.OnEdit := FADConsultas.OnEditProxArtNvl2;
      Mtx5001.OnInsert := Nil;
      Mtx5001.OnDelete := Nil;
      Mtx5001.OnShow := OnShowProvArtDet;

      Mtx5001.Registros := 30;
      Mtx5001.UsuarioSQL.Clear;
      Mtx5001.UsuarioSQL.Add(xSQL);
      Mtx5001.OnCierra := DMLOG.DisminuyeForma;
      Mtx5001.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx5001.Execute;
   Finally
   End;
End;

Procedure TFADConsultas.OnShowProvArtDet(Sender: TObject);
Begin
   FToolProvxArtDet.dblcCia.Text := FToolProvxArt.dblcCia.Text;
   FToolProvxArtDet.edtCia.Text := FToolProvxArt.edtCia.Text;
   FToolProvxArtDet.dtpDesde.Date := FToolProvxArt.dtpDesde.Date;
   FToolProvxArtDet.dtpHasta.Date := FToolProvxArt.dtpHasta.Date;
End;

Procedure TFADConsultas.OnShowProvArtDetOC(Sender: TObject);
Begin
   FToolProvxArtDetOC.dblcCia.Text := FToolProvxArt.dblcCia.Text;
   FToolProvxArtDetOC.edtCia.Text := FToolProvxArt.edtCia.Text;
   FToolProvxArtDetOC.dtpDesde.Date := FToolProvxArt.dtpDesde.Date;
   FToolProvxArtDetOC.dtpHasta.Date := FToolProvxArt.dtpHasta.Date;
   FToolProvxArtDetOC.meArt.Text := Mtx5001.FMant.cds2.FieldByName('ARTID').AsString + ' - '
      + Mtx5001.FMant.cds2.FieldByName('DODCOBS').AsString;
End;

Procedure TFADConsultas.OnEditProxArtNvl2(Sender: TObject;
   MantFields: TFields);
Var
   sSQL: String;
   FRegDes, FRegHas: String;
Begin
   If Not DMLOG.DCOM1.Connected Then Exit;

   If (Mtx5001.FMant.cds2.recno <= 0) And
      (Mtx5001.FMant.cds2.eof) Then
   Begin
      ErrorMsg('Error', ' No Existen Registros ');
      exit;
   End;
   FRegDes := formatdatetime(DMLOG.wFormatFecha, FToolProvxArt.dtpDesde.DateTime);
   FRegHas := formatdatetime(DMLOG.wFormatFecha, FToolProvxArt.dtpHasta.DateTime);

   sSQL := 'Select CIAID, PROFID, ODCID, UNMIDG, DPROFCNTG, DPROFPUNG, DPROFIMP, '
      + '       DPROFIMPU, DPROFOBS, DPROFFREG, PROFUSER '
      + '  from LOG313 A '
      + ' where A.ARTID=''' + MantFields.FieldByName('ARTID').AsString + ''' '
      + '   and A.DPROFPROV=''' + Mtx5000.FMant.cds2.FieldByName('PROV').AsString + ''' '
      + '   and (DPROFFREG>=' + FRegDes + ' AND DPROFFREG<=' + FRegHas + ')';

   xSQL := 'Select A.CIAID, B.CIADES, A.CLAUXID, A.PROV, PROVDES, A.ODCID, A.ODCFEMI, '
      + '       C.ARTID, DODCOBS, '
      + '       NVL(DODCCNT,0) CANTIDAD, '
      + '       NVL(CASE WHEN TMONID=''' + DMLOG.wTMonExt + ''' THEN ROUND(DODCIMP *ODCTCAMB,2) ELSE DODCIMP  END,0) COSTOMN, '
      + '       NVL(CASE WHEN TMONID=''' + DMLOG.wTMonExt + ''' THEN ROUND((IMPTOT-DODCIMP)*ODCTCAMB,2) ELSE (IMPTOT-DODCIMP) END,0) IGVMN, '
      + '       NVL(CASE WHEN TMONID=''' + DMLOG.wTMonExt + ''' THEN ROUND(IMPTOT*ODCTCAMB,2) ELSE IMPTOT END,0) TOTALMN, '
      + '       NVL(CASE WHEN TMONID=''' + DMLOG.wTMonExt + ''' THEN DODCIMP  ELSE ROUND(DODCIMP /ODCTCAMB,2) END,0) COSTOME, '
      + '       NVL(CASE WHEN TMONID=''' + DMLOG.wTMonExt + ''' THEN (IMPTOT-DODCIMP) ELSE ROUND((IMPTOT-DODCIMP)/ODCTCAMB,2) END,0) IGVME, '
      + '       NVL(CASE WHEN TMONID=''' + DMLOG.wTMonExt + ''' THEN IMPTOT ELSE ROUND(IMPTOT/ODCTCAMB,2) END,0) TOTALME, '
      + '       ''DESDE ' + FRegDes + ' HASTA ' + FRegHas + ''' RANGO '
      + '  From LOG304 A, TGE101 B, LOG305 C '
      + ' Where A.CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '   and A.ODCFEMI>=''' + FRegDes + ''' AND A.ODCFEMI<=''' + FRegHas + ''' '
      + '   and A.ODCEST=''ACEPTADO'' '
      + '   and A.PROV=''' + MantFields.FieldByName('PROV').AsString + ''' '
      + '   and A.CIAID=B.CIAID '
      + '   and A.CIAID=C.CIAID AND A.ODCID=C.ODCID '
      + '   and C.ARTID=''' + MantFields.FieldByName('ARTID').AsString + ''' '
      + '   and C.DODCOBS=''' + MantFields.FieldByName('DODCOBS').AsString + ''' '
      + ' order by A.CIAID, B.CIADES, A.CLAUXID, A.PROV, PROVDES, A.ODCID, C.ARTID, DODCOBS';

   xSQL := 'select * from (' + xSQL + ') SOLVISTA ';

   FToolProvxArtDetOC := TFToolProvxArtDetOC.Create(Application); // forma con botones  <=========
   FToolProvxArtDetOC.Visible := False;

   Mtx5002 := TMant.Create(Application);
   Try
      Mtx5002.Admin := DMLOG.wAdmin;
      Mtx5002.User := DMLOG.wUsuario;
      Mtx5002.ClientDataSet := DMLOG.cdsLOG;
      Mtx5002.DComC := DMLOG.DCom1;
      Mtx5002.FileNameIni := '\oaLog.ini';
      Mtx5002.Filter := '';
      Mtx5002.Module := DMLOG.wModulo;
      Mtx5002.SectionName := 'OCProxArtGnr';
      Mtx5002.TableName := 'VWLOGPROVARTODC';
      Mtx5002.Titulo := Trim(MantFields.FieldByName('PROV').AsString)
         + ' - ' + Mtx5000.FMant.cds2.FieldByName('PROVDES').AsString;
      Mtx5002.OnCreateMant := FADConsultas.PegaPanelProvxArtDetOC;
      Mtx5002.OnEdit := Nil;
      Mtx5002.OnInsert := Nil;
      Mtx5002.OnDelete := Nil;
      Mtx5002.OnShow := OnShowProvArtDetOC;
      Mtx5002.Registros := 30;
      Mtx5002.UsuarioSQL.Clear;
      Mtx5002.UsuarioSQL.Add(xSQL);
      Mtx5002.OnCierra := DMLOG.DisminuyeForma;
      Mtx5002.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx5002.Execute;
   Finally
   End;
End;

////////////////////////////////////////////////////////////////////////
// CONSUMO POR AÑOS
////////////////////////////////////////////////////////////////////////
(*
Procedure ADConsumoxAnos;
Var
   sSQL: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

   Screen.Cursor := crHourGlass;
   DMLOG.cdsGArti.DataRequest('SELECT * FROM TGE131');
   DMLOG.cdsTINID.DataRequest('SELECT * FROM TGE152');
   DMLOG.cdsCIA.DataRequest('SELECT * FROM TGE101');
   DMLOG.cdsGArti.open;
   DMLOG.FiltraTabla(DMLOG.cdsLoc, 'TGE126', 'LOCID', 'LOCID');
   DMLOG.cdsTINID.Open;
   DMLOG.cdsCIA.Open;

   sSQL := 'Select * from TGE151 where ACTIVO=''S''';
   DMLOG.cdsALM.Close;
   DMLOG.cdsALM.DataRequest(sSQL);
   DMLOG.cdsALM.Open;

   FToolConAnno := TFToolConAnno.Create(Application);
   DecodeDate(Date, Y, M, D);
   sSQL := 'Select STKANO, A.CIAID, A.LOCID, A.TINID, ALMID, A.GRARID, A.FAMID, A.SFAMID, '
      + '       A.ARTID, A.UNMIDG, L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, '
      + '       L.PROV, P.PROVDES, L.CARART, '
      + '       SUM(NVL(STKSANTG,0)) ANT_SS, SUM(NVL(STKMANTG,0)) ANT_SM, '
      + '       SUM(NVL(STKTSG01,0)) ENE_SS, SUM(NVL(STKISG01,0)) ENE_IS, SUM(NVL(STKSSG01,0)) ENE_ES, SUM(NVL(STKTMG01,0)) ENE_SM, SUM(NVL(STKIMG01,0)) ENE_IM, SUM(NVL(STKSMG01,0)) ENE_EM, '
      + '       SUM(NVL(STKTSG02,0)) FEB_SS, SUM(NVL(STKISG02,0)) FEB_IS, SUM(NVL(STKSSG02,0)) FEB_ES, SUM(NVL(STKTMG02,0)) FEB_SM, SUM(NVL(STKIMG02,0)) FEB_IM, SUM(NVL(STKSMG02,0)) FEB_EM, '
      + '       SUM(NVL(STKTSG03,0)) MAR_SS, SUM(NVL(STKISG03,0)) MAR_IS, SUM(NVL(STKSSG03,0)) MAR_ES, SUM(NVL(STKTMG03,0)) MAR_SM, SUM(NVL(STKIMG03,0)) MAR_IM, SUM(NVL(STKSMG03,0)) MAR_EM, '
      + '       SUM(NVL(STKTSG04,0)) ABR_SS, SUM(NVL(STKISG04,0)) ABR_IS, SUM(NVL(STKSSG04,0)) ABR_ES, SUM(NVL(STKTMG04,0)) ABR_SM, SUM(NVL(STKIMG04,0)) ABR_IM, SUM(NVL(STKSMG04,0)) ABR_EM, '
      + '       SUM(NVL(STKTSG05,0)) MAY_SS, SUM(NVL(STKISG05,0)) MAY_IS, SUM(NVL(STKSSG05,0)) MAY_ES, SUM(NVL(STKTMG05,0)) MAY_SM, SUM(NVL(STKIMG05,0)) MAY_IM, SUM(NVL(STKSMG05,0)) MAY_EM, '
      + '       SUM(NVL(STKTSG06,0)) JUN_SS, SUM(NVL(STKISG06,0)) JUN_IS, SUM(NVL(STKSSG06,0)) JUN_ES, SUM(NVL(STKTMG06,0)) JUN_SM, SUM(NVL(STKIMG06,0)) JUN_IM, SUM(NVL(STKSMG06,0)) JUN_EM, '
      + '       SUM(NVL(STKTSG07,0)) JUL_SS, SUM(NVL(STKISG07,0)) JUL_IS, SUM(NVL(STKSSG07,0)) JUL_ES, SUM(NVL(STKTMG07,0)) JUL_SM, SUM(NVL(STKIMG07,0)) JUL_IM, SUM(NVL(STKSMG07,0)) JUL_EM, '
      + '       SUM(NVL(STKTSG08,0)) AGO_SS, SUM(NVL(STKISG08,0)) AGO_IS, SUM(NVL(STKSSG08,0)) AGO_ES, SUM(NVL(STKTMG08,0)) AGO_SM, SUM(NVL(STKIMG08,0)) AGO_IM, SUM(NVL(STKSMG08,0)) AGO_EM, '
      + '       SUM(NVL(STKTSG09,0)) SET_SS, SUM(NVL(STKISG09,0)) SET_IS, SUM(NVL(STKSSG09,0)) SET_ES, SUM(NVL(STKTMG09,0)) SET_SM, SUM(NVL(STKIMG09,0)) SET_IM, SUM(NVL(STKSMG09,0)) SET_EM, '
      + '       SUM(NVL(STKTSG10,0)) OCT_SS, SUM(NVL(STKISG10,0)) OCT_IS, SUM(NVL(STKSSG10,0)) OCT_ES, SUM(NVL(STKTMG10,0)) OCT_SM, SUM(NVL(STKIMG10,0)) OCT_IM, SUM(NVL(STKSMG10,0)) OCT_EM, '
      + '       SUM(NVL(STKTSG11,0)) NOV_SS, SUM(NVL(STKISG11,0)) NOV_IS, SUM(NVL(STKSSG11,0)) NOV_ES, SUM(NVL(STKTMG11,0)) NOV_SM, SUM(NVL(STKIMG11,0)) NOV_IM, SUM(NVL(STKSMG11,0)) NOV_EM, '
      + '       SUM(NVL(STKTSG12,0)) DIC_SS, SUM(NVL(STKISG12,0)) DIC_IS, SUM(NVL(STKSSG12,0)) DIC_ES, SUM(NVL(STKTMG12,0)) DIC_SM, SUM(NVL(STKIMG12,0)) DIC_IM, SUM(NVL(STKSMG12,0)) DIC_EM, '
      + '       SUM(NVL(STKSACTG,0)) ACT_SS, SUM(NVL(STKMACTG,0)) ACT_SM '
      + '  from LOG316 A, TGE205 L, ALM_MAR_ART M, ALM_TIP_ART T, TGE201 P '
      + ' where A.CIAID=''xzx'' AND A.STKANO=''xxxc'' AND A.GRARID=''xc'' '
      + '   and A.CIAID=L.CIAID(+) AND A.ARTID=L.ARTID(+) '
      + '   and L.MARCA=M.MARCA(+) '
      + '   and L.TIPART=T.TIPART(+) '
      + '   and P.CLAUXID(+)=''P'' AND L.PROV=P.PROV(+) '
      + ' group by STKANO, A.CIAID, A.LOCID, A.TINID, ALMID, A.GRARID, A.FAMID, A.SFAMID, '
      + '          A.ARTID, A.UNMIDG, L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, '
      + '          L.PROV, P.PROVDES, L.CARART '
      + ' order by ARTID ';
   Mtx5000 := TMant.Create(Application);
   Try
      Mtx5000.Admin := DMLOG.wAdmin;
      Mtx5000.User := DMLOG.wUsuario;
      Mtx5000.DComC := DMLOG.DCOM1;
      Mtx5000.Module := DMLOG.wModulo;
      Mtx5000.TituloFont.Size := 16;
      Mtx5000.Titulo := 'Consumo de Articulos';
      Mtx5000.Filter := '';
      Mtx5000.ClientDataSet := DMLOG.cdsKdx;
      Mtx5000.OnCreateMant := FADConsultas.PegaPanelToolAno;
      Mtx5000.OnEdit := FADConsultas.OnEditaConsumo;
      Mtx5000.OnInsert := Nil;
      Mtx5000.OnDelete := Nil;
      Mtx5000.OnShow := Nil;
      Mtx5000.SectionName := 'ConsumoMes';
      Mtx5000.TableName := 'VWLOGMOVANUAL';
      Mtx5000.FileNameIni := '\oaLog.INI';
      Mtx5000.Registros := 40;
      Mtx5000.UsuarioSQL.Clear;
      Mtx5000.UsuarioSQL.Add(sSQL);
      Mtx5000.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx5000.Execute;
   Finally
   End;
End;
*)

(*
Procedure TFADConsultas.PegaPanelToolAno(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolConAnno.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;
*)

(*
Procedure TFADConsultas.OnEditaConsumo(Sender: TObject;
   MantFields: TFields);
Var
   sSQL: String;
Begin
   If Not DMLOG.DCOM1.Connected Then Exit;

   If Mtx5000.FMant.cds2.RecordCount = 0 Then
      Raise Exception.Create('No existen Registros a mostrar');

   Screen.Cursor := crHourGlass;
   DecodeDate(Date, Y, M, D);

   If FToolConAnno.rgPeriodo.ItemIndex = 0 Then //Anual
      sSQL := ' Select 0 ENE, 0 FEB, 0 MAR, 0 ABR, 0 MAY, 0 JUN, 0 JUL, 0 AGO, 0 SEPT, '
         + '        0 OCT, 0 NOV, 0 DIC, '
         + '        ARTID, ARTDES, X.ALMID ALMACEN, A.ALMDES DESCRIPCION, '
         + '        SUM(A1) ANOACT, SUM(A2) ANO_1, SUM(A3) ANO_2, SUM(A4) ANO_3 '
         + '   from (SELECT CIAID, LOCID, TINID, ARTID, ARTDES, ALMID, '
         + '                CASE WHEN KDXANO=' + quotedSTR(IntToStr(Y))
         + '                     THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A1, '
         + '                CASE WHEN KDXANO=' + quotedSTR(IntToStr(Y - 1))
         + '                     THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A2, '
         + '                CASE WHEN KDXANO=' + quotedSTR(IntToStr(Y - 2))
         + '                     THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A3, '
         + '                CASE WHEN KDXANO=' + quotedSTR(IntToStr(Y - 3))
         + '                     THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A4 '
         + '           FROM LOG315 '
         + '          WHERE KDXANO<=' + quotedStr(IntToStr(Y))
         + '            AND KDXANO>=' + quotedStr(IntToStr(Y - 3))
         + FToolConAnno.sWhere
         + '            AND ARTID=' + quotedStr(MantFields.FieldByName('ARTICULO').AsString)
         + '          GROUP BY CIAID, LOCID, TINID, ARTID, ARTDES, ALMID, KDXANO) X, '
         + '        TGE151 A '
         + '  where A.LOCID(+)=X.LOCID AND A.TINID(+)=X.TINID AND A.ALMID(+)=X.ALMID '
         + '    and A.CIAID(+)=X.CIAID '
         + '  group by ARTID,ARTDES,X.ALMID,A.ALMDES '
   Else //Mensual
      sSQL := ' Select 0 ANOACT, 0 ANO_1, 0 ANO_2, 0 ANO_3, '
         + '        ARTID, ARTDES, X.ALMID ALMACEN, A.ALMDES DESCRIPCION, '
         + '        sum(ENE) ENE, sum(FEB) FEB, sum(MAR) MAR, sum(ABR) ABR, '
         + '        sum(MAY) MAY, sum(JUN) JUN, sum(JUL) JUL, sum(AGO) AGO, '
         + '        sum(SEPT) SEPT , sum(OCT) OCT, sum(NOV) NOV , sum(DIC) DIC '
         + '   from (Select CIAID, LOCID, TINID, ARTID, ARTDES, ALMID, '
         + '           CASE WHEN KDXMM=''01'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END ENE, '
         + '           CASE WHEN KDXMM=''02'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END FEB, '
         + '           CASE WHEN KDXMM=''03'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END MAR, '
         + '           CASE WHEN KDXMM=''04'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END ABR, '
         + '           CASE WHEN KDXMM=''05'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END MAY, '
         + '           CASE WHEN KDXMM=''06'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END JUN, '
         + '           CASE WHEN KDXMM=''07'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END JUL, '
         + '           CASE WHEN KDXMM=''08'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END AGO, '
         + '           CASE WHEN KDXMM=''09'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END SEPT,'
         + '           CASE WHEN KDXMM=''10'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END OCT, '
         + '           CASE WHEN KDXMM=''11'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END NOV, '
         + '           CASE WHEN KDXMM=''12'' THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END DIC '
         + '           from LOG315 '
         + '          where KDXANO=' + quotedStr(IntToStr(FToolConAnno.seAno.Value))
         + '            and ARTID=' + quotedStr(MantFields.FieldByName('ARTICULO').AsString)
         + FToolConAnno.sWhere
         + '          group by CIAID, LOCID, TINID, ARTID, ARTDES, ALMID, KDXMM) X,TGE151 A '
         + '  where (A.CIAID(+)=X.CIAID AND A.LOCID(+)=X.LOCID AND A.TINID(+)=X.TINID '
         + '    AND A.ALMID(+)=X.ALMID) '
         + '  group by ARTID,ARTDES,X.ALMID,A.ALMDES ';
   Mtx5001 := TMant.Create(Application);
   Try
      mtx5001.NoVisible.Clear;
      If FToolConAnno.rgPeriodo.ItemIndex = 0 Then
      Begin
         mtx5001.NoVisible.Add('ENE');
         mtx5001.NoVisible.Add('FEB');
         mtx5001.NoVisible.Add('MAR');
         mtx5001.NoVisible.Add('ABR');
         mtx5001.NoVisible.Add('MAY');
         mtx5001.NoVisible.Add('JUN');
         mtx5001.NoVisible.Add('JUL');
         mtx5001.NoVisible.Add('AGO');
         mtx5001.NoVisible.Add('SEPT');
         mtx5001.NoVisible.Add('OCT');
         mtx5001.NoVisible.Add('NOV');
         mtx5001.NoVisible.Add('DIC');
         mtx5001.NoVisible.Add('ARTID');
         mtx5001.NoVisible.Add('ARTDES');
      End
      Else
      Begin
         mtx5001.NoVisible.Add('ANOACT');
         mtx5001.NoVisible.Add('ANO_1');
         mtx5001.NoVisible.Add('ANO_2');
         mtx5001.NoVisible.Add('ANO_3');
         mtx5001.NoVisible.Add('ARTID');
         mtx5001.NoVisible.Add('ARTDES');
      End;

      mtx5001.Admin := DMLOG.wAdmin;
      mtx5001.User := DMLOG.wUsuario;
      mtx5001.DComC := DMLOG.DCOM1;
      mtx5001.Module := DMLOG.wModulo;
      mtx5001.TituloFont.Size := 16;
      mtx5001.Titulo := MantFields.FieldByName('DESCRIPCION').AsString;
      mtx5001.Filter := '';
      mtx5001.ClientDataSet := DMLOG.cdsSQL;
      mtx5001.OnEdit := FADConsultas.OnEditaTotal;
      mtx5001.OnInsert := Nil;
      mtx5001.OnDelete := Nil;
      mtx5001.OnShow := Nil;
      mtx5001.OnCreateMant := Nil;
      mtx5001.SectionName := 'ConsumoAlm';
      mtx5001.TableName := 'VWALMDETCONALM';
      mtx5001.FileNameIni := '\SOLALM.INI';
      Mtx5001.Registros := 30;
      Mtx5001.UsuarioSQL.Clear;
      mtx5001.UsuarioSQL.Add(sSQL);
      Mtx5001.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      mtx5001.Execute;
   Finally
   End;
End;
*)

(*
Procedure TFADConsultas.OnEditaTotal(Sender: TObject; MantFields: TFields);
Var
   sSQL: String;
Begin
   If Not DMLOG.DCOM1.Connected Then Exit;

   If Mtx5001.FMant.cds2.RecordCount = 0 Then
      Raise Exception.Create('No existen Registros a mostrar');

   Screen.Cursor := crHourGlass;
   sSQL := ' Select LOG315.CIAID, C.CIADES, ARTID, ARTDES, LOG315.ALMID, A.ALMDES, KDXMM, '
      + '        M.MESDESL MES, '
      + '        CASE WHEN KDXANO=' + quotedSTR(IntToStr(Y))
      + '             THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A' + IntToStr(Y) + ', '
      + '        CASE WHEN KDXANO=' + quotedSTR(IntToStr(Y - 1))
      + '             THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A' + IntToStr(Y - 1) + ', '
      + '        CASE WHEN KDXANO=' + quotedSTR(IntToStr(Y - 2))
      + '             THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A' + IntToStr(Y - 2) + ', '
      + '        CASE WHEN KDXANO=' + quotedSTR(IntToStr(Y - 3))
      + '             THEN SUM(KDXCNTG*ARTCONT+KDXCNTU) ELSE 0 END A' + IntToStr(Y - 3)
      + '   from LOG315,TGE181 M,TGE101 C,TGE151 A '
      + '  where LOG315.KDXMM=M.MESIDR(+) AND LOG315.CIAID=C.CIAID(+) '
      + '    and LOG315.CIAID=A.CIAID(+) AND LOG315.LOCID=A.LOCID(+) '
      + '    and LOG315.TINID=A.TINID(+) AND LOG315.ALMID=A.ALMID(+) '
      + FToolConAnno.sWhere
      + '    and KDXANO<=' + quotedStr(IntToStr(Y))
      + '    and KDXANO>=' + quotedStr(IntToStr(Y - 3))
      + '    and ARTID=' + quotedStr(Mtx5000.FMant.cds2.FieldByName('ARTICULO').AsString)
      + '    and LOG315.ALMID=' + quotedStr(MantFields.FieldByName('ALMACEN').AsString)
      + '  group by LOG315.CIAID, C.CIADES, ARTID, ARTDES, LOG315.ALMID, A.ALMDES, '
      + '           KDXMM, KDXANO, M.MESDESL ';
   Mtx5002 := TMant.Create(Application);
   Try
      mtx5002.Admin := DMLOG.wAdmin;
      mtx5002.User := DMLOG.wUsuario;
      mtx5002.DComC := DMLOG.DCOM1;
      mtx5002.Module := DMLOG.wModulo;
      mtx5002.TituloFont.Size := 16;
      mtx5002.Titulo := Mtx5000.FMant.cds2.FieldByName('DESCRIPCION').AsString
         + ' en Almacén ' + MantFields.FieldByName('ALMACEN').AsString;
      mtx5002.Filter := '';
      mtx5002.ClientDataSet := DMLOG.cdsOrdComp;
      mtx5002.OnEdit := Nil;
      mtx5002.OnInsert := Nil;
      mtx5002.OnDelete := Nil;
      mtx5002.OnShow := Nil;
      mtx5002.OnCreateMant := Nil;
      mtx5002.SectionName := 'ConsumoTot';
      mtx5002.TableName := 'VWALMDETCONTOT';
      mtx5002.FileNameIni := '\oaLog.INI';
      mtx5002.NoVisible.Clear;
      mtx5002.NoVisible.Add('ARTID');
      mtx5002.NoVisible.Add('ARTDES');
      mtx5002.NoVisible.Add('ALMID');
      mtx5002.NoVisible.Add('ALMDES');
      mtx5002.NoVisible.Add('CIAID');
      mtx5002.NoVisible.Add('CIADES');
      mtx5002.NoVisible.Add('KDXMM');
      Mtx5002.Registros := 30;
      Mtx5002.UsuarioSQL.Clear;
      mtx5002.UsuarioSQL.Add(sSQL);
      Mtx5002.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      mtx5002.Execute;
   Finally
   End;
End;
*)

////////////////////////////////////////////////////////////////////////
// PROVEEDORES POR RUBRO
////////////////////////////////////////////////////////////////////////

Procedure ADProveedoresxRubro;
Var
   xsSql: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010508') Then Exit;

   xsSql := ' Select TGE201.CLAUXID CLAUXID, ' //codigo auxiliar
      + '        TGE201.PROV PROV, ' // --codigo proveedor
      + '        TGE201.PROVDES PROVDES, ' // --proveedor
      + '        TGE201.TIPPERID TIPPERID, ' //--tipo de persona
      + '        TGE201.PROVRUC PROVRUC,  ' //-- ruc
      + '        TGE201.ACTIVO ACTIVO,  ' //--Telefono
      + '        TGE201.PROVDIR PROVDIR, ' // --direccion
      + '        TGE201.PROVRETIGV PROVRETIGV,  ' // --se le debe retener el IGV
      + '        TGE201.DPTOID DPTOID, ' // --departamento
      + '        TGE147.UBIGEODPTO UBIGEODPTO , ' // --departamento
      + '        TGE201.CIUDID CIUDID, ' // --provincia
      + '        TGE147.UBIGEOPROV UBIGEOPROV ,  ' //--provincia
      + '        TGE201.PROVCZIP PROVCZIP, ' // --distrito
      + '        TGE147.UBIGEODIST UBIGEODIST , ' // --distrito
      + '        LOG201.TIPPROVID TIPPROVID,  ' //--codigo del rubro
      + '        TGE134.TIPPROVDES TIPPROVDES' // --descripcion del rubro
      + '   from TGE201,LOG201 ,TGE147,TGE134  '
      + '  where TGE201.CLAUXID = LOG201.CLAUXID(+)  '
      + '    and TGE201.PROV = LOG201.PROV(+) '
      + '    and TGE201.DPTOID||TGE201.CIUDID||TGE201.PROVCZIP = TGE147.UBIGEOID(+)'
      + '    and LOG201.TIPPROVID = TGE134.TIPPROVID(+)';
   FADConsultas := TFADConsultas.Create(Application);
   FToolProvRubro := TFToolProvRubro.Create(Application);
   FToolProvRubro.Visible := false;

   Mtx5000 := TMant.Create(Application);
   Try
      mtx5000.Admin := DMLOG.wAdmin;
      mtx5000.User := DMLOG.wUsuario;
      mtx5000.DComC := DMLOG.DCOM1;
      mtx5000.Module := DMLOG.wModulo;
      mtx5000.Titulo := 'Proveedor por Rubro';
      mtx5000.Filter := '';
      mtx5000.OnEdit := Nil;
      mtx5000.OnInsert := Nil;
      mtx5000.OnDelete := Nil;
      mtx5000.OnShow := Nil;
      mtx5000.OnCreateMant := FADConsultas.ToolProvRubroCreate;
      mtx5000.TableName := 'VWLOGPROVRUBRO';
      mtx5000.FileNameIni := '\oaLog.INI';
      Mtx5000.Registros := 30;
      Mtx5000.UsuarioSQL.Clear;
      Mtx5000.UsuarioSQL.Add(xsSql);
      Mtx5000.NoVisible.Clear;
      Mtx5000.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      mtx5000.Execute;
   Finally
   End;

End;

Procedure TFADConsultas.ToolProvRubroCreate(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolProvRubro.pnl;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

////////////////////////////////////////////////////////////////////////
// REQUERIMIENTOS PENDIENTES
////////////////////////////////////////////////////////////////////////

Procedure ADRequerimientosPend;
Var
   sSQL: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010509') Then Exit;

   sSQL := ' Select A.CCOSID, ''   '' CCOSDES,A.ARTID,C.ARTDES, '
      + '        A.DURQCNAG,A.DURQCNAU,A.DURQCNATG,A.DURQCNATU,C.UNMIDG, '
      + '        A.DURQCNSLG,A.DURQCNSLU, A.URQID, B.URQFREG '
      + '   from LOG307 A , LOG306 B, TGE205 C '
      + '  where (B.CIAID=A.CIAID AND B.LOCID=A.LOCID AND B.CCOSID=A.CCOSID AND B.URQID=A.URQID) '
      + '    and (C.CIAID=A.CIAID AND  C.TINID=A.TINID AND C.GRARID=A.GRARID) '
      + '    and A.GRARID=''XZ'' ';
   FToolReqPend := TFToolReqPend.Create(Application);
   FToolReqPend.Visible := false;

   DMLOG.cdsCIA.Close;
   DMLOG.FiltraTabla(DMLOG.cdsCia, 'TGE101', 'CIAID', 'CIAID');
   Mtx5000 := TMant.Create(Application);
   Try
      mtx5000.Admin := DMLOG.wAdmin;
      mtx5000.User := DMLOG.wUsuario;
      mtx5000.DComC := DMLOG.DCOM1;
      mtx5000.Module := DMLOG.wModulo;
      mtx5000.Titulo := 'Requerimientos Pendientes';
      mtx5000.Filter := '';
      mtx5000.ClientDataSet := DMLOG.cdsKdx;
      mtx5000.OnEdit := Nil;
      mtx5000.OnInsert := Nil;
      mtx5000.OnDelete := Nil;
      mtx5000.OnShow := Nil;
      mtx5000.OnCreateMant := FADConsultas.ToolReqPendCreate;
      mtx5000.SectionName := 'RequerimPendiente';
      mtx5000.TableName := 'VWLOGREQPEND';
      mtx5000.FileNameIni := '\oaLog.INI';
      Mtx5000.Registros := 30;
      Mtx5000.UsuarioSQL.Clear;
      Mtx5000.UsuarioSQL.Add(sSQL);
      Mtx5000.NoVisible.Clear;
      Mtx5000.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      mtx5000.Execute;
   Finally
   End;
End;

Procedure TFADConsultas.ToolReqPendCreate(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolReqPend.pnl;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

////////////////////////////////////////////////////////////////////////
// DETALLE DE ORDENES DE COMPRA
////////////////////////////////////////////////////////////////////////

Procedure ADDetalleOCompra;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010510') Then Exit;

   FToolDetOC := TFToolDetOC.Create(Application);
   FToolDetOC.Visible := false;

   Try
      Mtx5000 := TMant.Create(Application);
      Mtx5000.Admin := DMLOG.wAdmin;
      Mtx5000.User := DMLOG.wUsuario;
      Mtx5000.Module := DMLOG.wModulo;
      Mtx5000.TableName := 'LOG305';
      Mtx5000.Titulo := 'Detalle de Ordenes de Compra';
      Mtx5000.ClientDataSet := DMLOG.cdsDOrdComp;
      Mtx5000.OnCreateMant := FADConsultas.PegaPanelToolDetOC;
      Mtx5000.DComC := DMLOG.DCom1;
      Mtx5000.OnEdit := Nil;
      Mtx5000.OnInsert := Nil;
      Mtx5000.OnDelete := Nil;
      Mtx5000.OnShow := Nil;
      Mtx5000.OnCierra := DMLOG.DisminuyeForma;
      Mtx5000.SectionName := 'ConsultaDetalleOC';
      Mtx5000.FileNameIni := '\oaLog.INI';
      Mtx5000.NoVisible.Clear;
      Mtx5000.Filter := 'ODCEST<>''INICIAL'' and ODCEST<>''DEPURADO'' ';
      Mtx5000.Execute;
   Finally
   End;
End;

Procedure TFADConsultas.PegaPanelToolDetOC(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolDetOC.pnl;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure ADVerificaVersion;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;
   FADConsultas := TFADConsultas.Create(Application);
   If DMLOG.fg_VerificaVersion(FADConsultas.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

End.


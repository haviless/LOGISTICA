Unit oaAD3100;

//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : oaAD3100
//Formulario               : FOrdendeCompra
//Fecha de Creación        :
//Autor                    : Equipo de Sistemas
//Objetivo                 : Se implementa la funcionalidad que permite invocar la ventana
//                         de registro de ordenes de pago
//
// ACTUALIZACIONES
// HPP_201105_LOG 22/06/2011   Se implementa la funcionalidad que permite invocar la ventana
//                             de registro de ordenes de pago
// HPC_201203_LOG 24/04/2012:  Se invocará siempre con la variable   wTipoOC := 'xRequerimiento'
// HPC_201208_LOG 22/05/2012:  Se implementó el control de versiones
// HPC_201304_LOG 19/09/2013:  Se actualizó para que se muestre ESTADOS de las Órdenes de Compra en el Filtro
// HPC_201304_LOG 23/09/2013:  Se implementa el Masetro de Recibos por Servicio
// HPC_201305_LOG 19/11/2011:  Orden de Trabajo
// HPC_201402_LOG 29/05/2014:  Se modifica al momento de refrescar el grid, al refrescar el objeto MANT, se pierde el orden de
//                             los punteros y al realiazr un Gotobookmark ya no lo ubicaba y emitia un mensaje de error
// HPC_201403_LOG 13/06/2014:  Se modifica al momento de refrescar el grid, al refrescar el objeto MANT, se pierde el orden de
//                             reordenamiento de la Sangría
// HPC_201404_LOG 21/10/2014   Control de Versiones 20141022080000
// HPC_201405_LOG 30/09/2014   Se adiciona la apertura de la tabla de condición comercial
//                14/10/2014:  Se renombran las Unidades Pascal de Mantenimiento del Maestro de Servicios Institucionales
//                             de LOG267 a LOG280 y LOG268 a LOG281
// HPC_201505_LOG 14/09/2015:  Ajustes a movimientos por Servicios.
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
   TFOrdendeCompra = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
      xProv, xProfAut, wTipoOC: String;

    { Public declarations }

   // Ordenes de Compra
      Procedure PegaPanelToolOC(Sender: TObject);
      Procedure PanelCreaMant(Sender: TObject);
      Procedure OnEditOrdC(Sender: TObject; MantFields: TFields);
      Procedure OnDeleteOrdC(Sender: TObject; MantFields: TFields);
      Procedure OnShowOrdC(Sender: TObject);

   // Seguiminto/Visado de Ordenes de Compra
//      Procedure OnSeguiOrdC(Sender: TObject; MantFields: TFields);
      Procedure MantOrdenPagoEdit(Sender: TObject; MantFields: TFields);
      Procedure MantOrdenPagoInsert(Sender: TObject);

      Procedure InsertaRecibos(Sender: TObject);
      Procedure ModificaRecibos(Sender: TObject; MantFields: TFields);

      Procedure PegaPanelToolOT(Sender: TObject);
      Procedure InsertaOrdenTrabajo(Sender: TObject);
      Procedure ModificaOrdenTrabajo(Sender: TObject; MantFields: TFields);
   End;

Procedure ADOrdenesdeCompra; stdcall;
//Procedure ADSeguimOCompra; stdcall;
Procedure ADOrdenPago; stdcall;
Procedure ADVerificaVersion; stdcall;
Procedure ADMovimientoServicio; stdcall;
Procedure ADRegistraOrdenesTrabajo; stdcall;

Exports
   ADOrdenesdeCompra,
//   ADSeguimOCompra,
   ADOrdenPago,
   ADVerificaVersion,
   ADMovimientoServicio,
   ADRegistraOrdenesTrabajo;

Var
   FOrdendeCompra: TFOrdendeCompra;
   Mtx3100: TMant;
   pg, pl: TPanel;
   MantOrdenPago: TMant;
   D, M, Y: word;

Implementation

//Uses LOG219, LOGDM1, LOG221, LOG228, LOG210, LOG501, LOG725, LOG130, LOG281, LOG271, LOG273;
//Uses LOG219, LOGDM1, LOG228, LOG501, LOG725, LOG130, LOG281, LOG271, LOG273;
Uses LOG219, LOGDM1, LOG228, LOG725, LOG130, LOG281, LOG271, LOG273;

// LOG219 (FToolOC)           Tool de Ordenes de Compra
// LOG221 (FArtOCxReqs)       Genera Orden de Compra desde Requisicion
// LOG228 (FRegOrdCD)         Orden de Compra Directa
// LOG210 (FRegOrdC)          Orden de Compra
// LOG501 (FSeguiOrdC)        Seguimiento/Visado de Ordenes de Compra
// LOG725 (FToolOrdenPago)    Tool de la Orden de pago
// LOG130 (FOrdenPago)        Mantenimiento de la Orden de Pago
// LOG268 (FReciboServicios)  Ingreso de Recibos de Servicios
// LOG271 (FOrdenTrabajo)     Orden de Trabajo

{$R *.dfm}
////////////////////////////////////////////////////////////////////////
// ORDENES DE COMPRA
////////////////////////////////////////////////////////////////////////

Procedure ADOrdenesdeCompra;
Var
   FIni: String;
   cFilterCiaUser: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010311') Then Exit;

   Screen.Cursor := crHourGlass;
   DMLOG.cdsReporte.Close;

   DMLOG.cdsUMed.Close;
   DMLOG.cdsUMed.DataRequest('SELECT * FROM TGE130');
   DMLOG.cdsUMed.open;

   DecodeDate(DateS, Y, M, D);

   FToolOC := TFToolOC.Create(Application);
   FIni := '01/' + IntToStr(M) + '/' + IntToStr(Y);
   FToolOC.dtpDesde.Date := StrToDate(FIni);
   FToolOC.dtpHasta.Date := Date;
   FToolOC.Visible := false;

   FOrdendeCompra := TFOrdendeCompra.Create(Application);

   DMLOG.wTipoAdicion := 'xFiltro';
   Mtx3100 := TMant.Create(Application);
   DMLOG.FiltraTabla(DMLOG.cdsTipSol, 'TGE173', 'TIPOADQ', 'TIPOADQ');

   DMLOG.cdsFPago.Filtered := False;
   DMLOG.cdsFPago.Close;
   DMLOG.cdsFPago.IndexFieldNames := 'CCOMERID';
   DMLOG.cdsFPago.DataRequest('Select * from CXC101');
   DMLOG.cdsFPago.Open;

   xProv := DMLOG.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');
   DMLOG.cdsProv.Close;
   DMLOG.cdsProv.DataRequest('SELECT CLAUXID,PROV, PROVRUC, PROVDES, PROVNOMCOM FROM TGE201 WHERE CLAUXID=' + QuotedStr(xProv) + ' ORDER BY PROV');
   DMLOG.cdsProv.FetchOnDemand := False;
   DMLOG.cdsProv.PacketRecords := 20;
   DMLOG.cdsProv.FetchOnDemand := True;
   DMLOG.cdsProv.Open;

   DMLOG.cdsArti.Close;
   DMLOG.cdsArti.DataRequest('SELECT ARTID, ARTDES, ARTPCG, UNMIDG, CIAID FROM TGE205');
   DMLOG.cdsArti.FetchOnDemand := False;
   DMLOG.cdsArti.PacketRecords := 20;
   DMLOG.cdsArti.FetchOnDemand := True;
   DMLOG.cdsArti.IndexFieldNames := 'ARTID';
   DMLOG.cdsArti.Open;

   If DMLOG.cdsCia.Active = False Then
      DMLOG.FiltraTabla(DMLOG.cdsCia, 'TGE101', 'CIAID', 'CIAID');

   cFilterCiaUser := DMLOG.FiltraCiaPorUsuario(DMLOG.cdsCia);
   If cFilterCiaUser <> '' Then
      cFilterCiaUser := 'LOG304.' + DMLOG.FiltraCiaPorUsuario(DMLOG.cdsCia);

   Try
      Mtx3100.Admin := DMLOG.wAdmin;
      Mtx3100.User := DMLOG.wUsuario;
      Mtx3100.Module := DMLOG.wModulo;
      Mtx3100.TableName := 'LOG304';
      Mtx3100.Tabla2 := 'LOG305';
      Mtx3100.Tabla2Llave := 'CIAID;ODCID';
      Mtx3100.Titulo := 'Ordenes de Compra';
      Mtx3100.OnCreateMant := FOrdendeCompra.PegaPanelToolOC; // LOG219 (FToolOC) Tool de Ordenes de Compra
      Mtx3100.ClientDataSet := DMLOG.cdsOrdComp;
      Mtx3100.DComC := DMLOG.DCOM1;
      Mtx3100.OnEdit := FOrdendeCompra.OnEditOrdC;
      Mtx3100.OnDelete := FOrdendeCompra.OnDeleteOrdC;
      Mtx3100.OnInsert := Nil;
      Mtx3100.OnShow := FOrdendeCompra.OnShowOrdC;
      Mtx3100.SectionName := 'LOGOCompra';
      Mtx3100.FileNameIni := '\oaLog.ini';
      Mtx3100.Filter := cFilterCiaUser;
      Mtx3100.OnCierra := DMLOG.DisminuyeForma;
      Mtx3100.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx3100.Execute;
   Finally
   End;
End;

Procedure TFOrdendeCompra.PegaPanelToolOC(Sender: TObject);
Var
   p1: TPanel;
   pg: TPanel;
Begin
// LOG219 (FToolOC)        Tool de Ordenes de Compra
   pg := FToolOC.pnlComandos;
   p1 := TMant(Sender).FMant.pnlBtns;
   p1.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   p1.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFOrdendeCompra.PanelCreaMant(Sender: TObject);
Begin
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 1;
   pg.Align := alClient;
   pg.Parent := Tmant(Sender).Fmant.pnlBtns;
   pl.AutoSize := true;
   Tmant(Sender).Fmant.pnlBtns.Visible := true;
End;

Procedure TFOrdendeCompra.OnEditOrdC(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
Begin
   DMLOG.cdsFPago.close;
   DMLOG.cdsFPago.datarequest('SELECT * FROM CXC101 WHERE CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString) + ' ORDER BY CCOMERID');
   DMLOG.cdsFPago.open;

   xSQL := 'select * '
      + '     from LOG304 '
      + '    where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '      and ODCID=' + QuotedStr(MantFields.FieldByName('ODCID').AsString);
   DMLOG.cdsOrdComp.Close;
   DMLOG.cdsOrdComp.IndexFieldNames := '';
   DMLOG.cdsOrdComp.Filter := '';
   DMLOG.cdsOrdComp.Filtered := False;
   DMLOG.cdsOrdComp.DataRequest(xSQL);
   DMLOG.cdsOrdComp.Open;

   If (DMLOG.cdsOrdComp.RecNo <= 0) And
      (DMLOG.cdsOrdComp.eof) Then
   Begin
      ErrorMsg('Error', 'No existen registros a Editar');
      exit;
   End;
   Screen.Cursor := crhourGlass;

   xSQL := 'select * '
      + '     from LOG305 '
      + '    where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '      and ODCID=' + QuotedStr(MantFields.FieldByName('ODCID').AsString);
   DMLOG.cdsDOrdComp.Close;
   DMLOG.cdsDOrdComp.IndexFieldNames := '';
   DMLOG.cdsDOrdComp.Filter := '';
   DMLOG.cdsDOrdComp.Filtered := False;
   DMLOG.cdsDOrdComp.DataRequest(xSQL);
   DMLOG.cdsDOrdComp.Open;
   DMLOG.cdsDOrdComp.IndexFieldNames := 'DODCID';

   DMLOG.wModo := 'M';

//   FArtOCxReqs := TFArtOCxReqs.create(Application);

   If DMLOG.cdsOrdComp.FieldByName('OCTIP').AsString = 'D' Then
      FOrdendeCompra.wTipoOC := 'xOCDirecta'
   Else
      If DMLOG.cdsOrdComp.FieldByName('OCTIP').AsString = 'C' Then
         FOrdendeCompra.wTipoOC := 'xCotizacion'
      Else
         If DMLOG.cdsOrdComp.FieldByName('OCTIP').AsString = 'P' Then
            FOrdendeCompra.wTipoOC := 'xProforma'
         Else
            If DMLOG.cdsOrdComp.FieldByName('OCTIP').AsString = 'R' Then
               FOrdendeCompra.wTipoOC := 'xRequerimiento'
            Else
               If length(trim(DMLOG.cdsOrdComp.FieldByName('PROFID').AsString)) = 0 Then
                  FOrdendeCompra.wTipoOC := 'xRequerimiento'
               Else
                  FOrdendeCompra.wTipoOC := 'xProforma';

// LOG228 (FRegOrdCD) Orden de Compra
   FRegOrdCD := TFRegOrdCD.create(Application);
   FRegOrdCD.dblcCIA.Enabled := False;
   FRegOrdCD.Z2dbgDReqsIButton.Enabled := False;
   FRegOrdCD.ActiveMDIChild;
End;

Procedure TFOrdendeCompra.OnDeleteOrdC(Sender: TObject;
   MantFields: TFields);
Var
   xSQL, sSQL: String;
Begin
   xSQL := 'select * '
      + '     from LOG304 '
      + '    where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '      and ODCID=' + QuotedStr(MantFields.FieldByName('ODCID').AsString);
   DMLOG.cdsOrdComp.Close;
   DMLOG.cdsOrdComp.IndexFieldNames := '';
   DMLOG.cdsOrdComp.Filter := '';
   DMLOG.cdsOrdComp.Filtered := False;
   DMLOG.cdsOrdComp.DataRequest(xSQL);
   DMLOG.cdsOrdComp.Open;
   If (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) <> 'INICIAL') Or
      (Length(Trim(DMLOG.cdsOrdComp.fieldbyname('ODCVISADOR').AsString)) > 0) Then
   Begin
      ErrorMsg('Adquisiciones', 'Esta orden de Compra ya ha Sido Visada, No es Posible Eliminarla');
      Exit;
   End;
   If Question('Confirmar', '¿Está seguro de ELIMINAR la Orden de Compra '
      + DMLOG.cdsOrdComp.FieldByName('ODCID').AsString + '?'
      + chr(13)
      + 'Provedor :'
      + DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString + #13
      + ' ¿desea continuar? ') Then
   Begin
      Screen.Cursor := crHourGlass;

      DMLOG.DCOM1.AppServer.IniciaTransaccion;

      sSQL := 'Delete from LOG305 '
         + '    where CIAID = ' + quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
         + '      and ODCID = ' + quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('No se pudo Eliminar el Detalle de la Orden de Compra');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;

      sSQL := 'Select CIAID, ODCID '
         + '     from LOG324 '
         + '    where CIAID = ' + quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
         + '      and ODCID = ' + quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);
      DMLOG.cdsQry.Close;
      DMLOG.cdsQry.DataRequest(sSQL);
      DMLOG.cdsQry.Open;
      If DMLOG.cdsQry.RecordCount > 0 Then
      Begin
         sSQL := 'Delete from LOG324 '
            + '    where CIAID = ' + quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
            + '      and ODCID = ' + quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);
         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
         Except
            Screen.Cursor := crDefault;
            ShowMessage('No se pudo Eliminar el Archivo de Relación O.Compra - Requisición');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      End;

      sSQL := 'Select CIAID, KEYRECIBO '
         + '     from LOG_MOV_SERVICIOS '
         + '    where CIAID = ' + quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
         + '      and KEYRECIBO = ' + quotedstr(DMLOG.cdsOrdComp.FieldByName('KEYRECIBO').AsString);
      DMLOG.cdsQry.Close;
      DMLOG.cdsQry.DataRequest(sSQL);
      DMLOG.cdsQry.Open;
      If DMLOG.cdsQry.RecordCount > 0 Then
      Begin
         sSQL := 'Update LOG_MOV_SERVICIOS '
            + '      set ESTADO=''I'',UBICACION=''I'' '
            + '    where CIAID = ' + quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
            + '      and KEYRECIBO = ' + quotedstr(DMLOG.cdsOrdComp.FieldByName('KEYRECIBO').AsString);
         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
         Except
            Screen.Cursor := crDefault;
            ShowMessage('No se pudo retirar los datos de la O.Compra en ' + chr(13)
               + 'el archivo de Servicios Públicos');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      End;

      sSQL := 'Delete from LOG304 '
         + '    where CIAID = ' + quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
         + '      and ODCID = ' + quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('No se pudo Eliminar la Cabecera de la Orden de Compra');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;

      DMLOG.DCOM1.AppServer.GrabaTransaccion;

      DMLOG.ActualizaFiltro(Mtx3100, DMLOG.cdsOrdComp, 'E');
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFOrdendeCompra.OnShowOrdC(Sender: TObject);
Begin
//
End;

// Fin de Ordenes de Compra

////////////////////////////////////////////////////////////////////////
// SEGUIMIENTO DE ORDENES DE COMPRA
////////////////////////////////////////////////////////////////////////
(*
Procedure ADSeguimOCompra;
Var
   cFilterCiaUser: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

   If DMLOG.cdsCia.Active = False Then
      DMLOG.FiltraTabla(DMLOG.cdsCia, 'TGE101', 'CIAID', 'CIAID');

   cFilterCiaUser := DMLOG.FiltraCiaPorUsuario(DMLOG.cdsCia);

   DMLOG.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx3100 := TMant.Create(Application);
   Try
      Mtx3100.Admin := DMLOG.wAdmin;
      Mtx3100.User := DMLOG.wUsuario;
      Mtx3100.Module := DMLOG.wModulo;
      Mtx3100.OnCreateMant := Nil;
      Mtx3100.TableName := 'LOG304';
      Mtx3100.Titulo := 'Visado de Ordenes de Compra'; //- Seguimiento y Visados';
      Mtx3100.ClientDataSet := DMLOG.cdsOrdComp;
      Mtx3100.DComC := DMLOG.DCOM1;
      Mtx3100.OnEdit := FOrdendeCompra.OnSeguiOrdC;
      Mtx3100.OnInsert := Nil;
      Mtx3100.OnDelete := Nil;
      Mtx3100.OnShow := Nil;
      Mtx3100.SectionName := 'LOGSegVisOCom';
      Mtx3100.FileNameIni := '\oaLog.ini';
      Mtx3100.Filter := cFilterCiaUser;
      Mtx3100.OnCierra := DMLOG.DisminuyeForma;
      Mtx3100.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx3100.Execute;
   Finally
   End;
End;
*)

(*
Procedure TFOrdendeCompra.OnSeguiOrdC(Sender: TObject;
   MantFields: TFields);
Var
   sCIA, sODC, xSQL: String;
Begin
   xSQL := 'select * '
      + '     from LOG304 '
      + '    where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '      and ODCID=' + QuotedStr(MantFields.FieldByName('ODCID').AsString);
   DMLOG.cdsOrdComp.Close;
   DMLOG.cdsOrdComp.IndexFieldNames := '';
   DMLOG.cdsOrdComp.Filter := '';
   DMLOG.cdsOrdComp.Filtered := False;
   DMLOG.cdsOrdComp.DataRequest(xSQL);
   DMLOG.cdsOrdComp.Open;

   If (DMLOG.cdsOrdComp.RecNo <= 0) And
      (DMLOG.cdsOrdComp.eof) Then
   Begin
      ErrorMsg('Error', ' No existen Registros a Editar ');
      exit;
   End;
   Screen.Cursor := crHourGlass;

   xSQL := 'select * '
      + '     from LOG305 '
      + '    where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '      and ODCID=' + QuotedStr(MantFields.FieldByName('ODCID').AsString);
   DMLOG.cdsDOrdComp.Close;
   DMLOG.cdsDOrdComp.IndexFieldNames := '';
   DMLOG.cdsDOrdComp.Filter := '';
   DMLOG.cdsDOrdComp.Filtered := False;
   DMLOG.cdsDOrdComp.DataRequest(xSQL);
   DMLOG.cdsDOrdComp.Open;
   DMLOG.cdsDOrdComp.IndexFieldNames := 'DODCID';

   DMLOG.wModo := 'M';
   FSeguiOrdC := TFSeguiOrdC.create(Application);
   FSeguiOrdC.dblcCIA.Enabled := False;
   FSeguiOrdC.dedNProforma.Enabled := False;
   DMLOG.cdsOrdComp.Locate('CIAID;ODCID', VarArrayOf([sCIA, sODC]), []);
   DMLOG.cdsOrdComp.Edit;
   FSeguiOrdC.ActiveMDIChild;
End;
*)

Procedure ADOrdenPago;
Var
   xSQL: String;
   cFilterCiaUser: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010315') Then Exit;

   Screen.Cursor := crHourGlass;

   xSQL := ' Select A.OC_COMPANIA,A.ODCID , '
      + '           A.PROV , A.PROV_DES PROV_DES , '
      + '           A.CIAID , A.NUMORDPAG ,  '
      + '           A.CPCIAID ,A.DOCID , '
      + '           A.DOCID_DES, '
      + '           A.CPSERIE,A.CPNODOC,A.CPFEMIS,A.CPFRECEP, '
      + '           A.TMONID, A.BASIMP, A.IGV,A.TOTAL, A.CPTCAMPR, '
      + '           A.ORDPAGTOT,A.ORDPAGEST, A.OCSALDOORDPAG , A.CPESTTRA '
      + '      from (Select LOG130.CIAID, LOG130.NUMORDPAG, '
      + '                   LOG130.ODCCIAID OC_COMPANIA,LOG130.ODCID , '
      + '                   LOG130.PROV , LOG304.PROVDES PROV_DES , '
      + '                   LOG130.CPCIAID ,LOG130.DOCID , '
      + '                  (Select TGE110.DOCDES '
      + '                     from TGE110 '
      + '                    where TGE110.DOCID = LOG130.DOCID '
      + '                      and TGE110.DOCMOD IN (' + QuotedStr('CXP') + ',' + QuotedStr('LOG') + ')) DOCID_DES , '
      + '                   LOG130.CPSERIE,LOG130.CPNODOC,LOG130.CPFEMIS,LOG130.CPFRECEP, '
      + '                   LOG130.TMONID, LOG130.BASIMP, LOG130.IGV,LOG130.TOTAL, LOG130.CPTCAMPR, '
      + '                   LOG304.ORDPAGTOT, LOG304.ORDPAGEST,(LOG304.ODCTOTALG - NVL(LOG304.ORDPAGTOT,0)) OCSALDOORDPAG, '
      + '                   LOG130.CPESTTRA CPESTTRA '
      + '              from LOG130, LOG304 '
      + '             where LOG130.ODCCIAID = LOG304.CIAID '
      + '               and LOG130.ODCID = LOG304.ODCID ) A  '
      + '     where 1 = 1 ';
   DMLOG.cdsQry10.CLose;
   DMLOG.cdsQry10.DataRequest(xSQL);
   DMLOG.cdsQry10.Open;

   FToolOrdenPago := TFToolOrdenPago.Create(Application); // LOG725.pas
   DMLOG.wTipoAdicion := 'xFiltro';

   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;
   If DMLOG.cdsCia.Active = False Then
      DMLOG.FiltraTabla(DMLOG.cdsCia, 'TGE101', 'CIAID', 'CIAID');
   cFilterCiaUser := DMLOG.FiltraCiaPorUsuario(DMLOG.cdsCia);

   DMLOG.wTipoAdicion := 'xFiltro';
   Mtx3100 := TMant.Create(Application);
   Try
      Mtx3100.Admin := DMLOG.wAdmin;
      Mtx3100.User := DMLOG.wUsuario;
      Mtx3100.Module := DMLOG.wModulo;
      Mtx3100.OnCreateMant := Nil;
      Mtx3100.TableName := 'VWLOGORDENPAGO';
      Mtx3100.Titulo := 'Ordenes de Pago';
      Mtx3100.UsuarioSQL.Add(xSQL);
      pg := FToolOrdenPago.pnlAct;
      Mtx3100.ClientDataSet := DMLOG.cdsQry10;
      Mtx3100.DComC := DMLOG.DCOM1;
      Mtx3100.OnEdit := Nil; //FOrdendeCompra.MantOrdenPagoEdit;
      Mtx3100.OnInsert := Nil;
      Mtx3100.OnCreateMant := FOrdendeCompra.PanelCreaMant;
      Mtx3100.OnDelete := Nil;
      Mtx3100.OnShow := Nil;
      Mtx3100.SectionName := 'LOGOPago';
      Mtx3100.FileNameIni := '\oaLog.ini';
      Mtx3100.Filter := cFilterCiaUser;
      Mtx3100.OnCierra := DMLOG.DisminuyeForma;
      Mtx3100.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx3100.Execute;
   Finally
      DMLOG.cdsQry10.CLose;
   End;
End;

Procedure TFOrdendeCompra.MantOrdenPagoEdit(Sender: TObject; MantFields: TFields);
Begin
   If Not DMLOG.DCOM1.Connected Then Exit;
   DMLOG.cdsQry10.Data := Mtx3100.FMant.cds2.Data;
   DMLOG.cdsQry10.GotoCurrent(Mtx3100.FMant.cds2);
   If DMLOG.cdsQry10.RecordCount > 0 Then
   Begin
      Try
         DMLOG.wModo := 'M';
         FOrdenPago := TFOrdenPago.Create(Application); // LOG130
      Finally
      End;
   End;
End;

Procedure TFOrdendeCompra.MantOrdenPagoInsert(Sender: TObject);
Begin
   If Not DMLOG.DCOM1.Connected Then Exit;
   Try
      DMLOG.wModo := 'A';
      FOrdenPago := TFOrdenPago.Create(Application); // LOG130
   Finally
   End;
End;

Procedure ADVerificaVersion;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;
   FOrdendeCompra := TFOrdendeCompra.Create(Application);
   If DMLOG.fg_VerificaVersion(FOrdendeCompra.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

/////////////////////////////////////////////////////////
// Movimiento de SERVICIOS
/////////////////////////////////////////////////////////
Procedure ADMovimientoServicio;
Var
   xsql: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010316') Then Exit;

   Screen.Cursor := crHourGlass;

   xSQL := 'Select A.SERIE,A.NUMREC,A.FECEMIREC,A.IMPORTE,A.ESTADO,A.FECPERIODO, '
      + '          A.CIAID, KEYRECIBO, ESTADO, FECPAGO, IMPORTE, A.OBSERVACION, '
      + '          TO_DATE(FECVENREC,''DD/MM/YYYY'') FECVENREC, TO_DATE(FECRECREC,''DD/MM/YYYY'') FECRECREC, '
      + '          TO_DATE(FECREGREC,''DD/MM/YYYY'') FECREGREC, b.CODSER, NUMSER, DIRECCION, FLGESTADO, CODPROV, PROVDES, '
      + '          LOCID, SERREC, TIPINT, NUMINT, TO_DATE(FECULTREC,''DD/MM/YYYY'') FECULTREC,'
      + '          TO_DATE(FECULTPAG,''DD/MM/YYYY'') FECULTPAG, TO_DATE(FECSIGREC,''DD/MM/YYYY'') FECSIGREC, PERULT, PERSIG, '
      + '          CODTITSER, USUREG, TO_DATE(FECREG,''DD/MM/YYYY'') FECREG, USUMOD, FECMOD, DESCRIPCION, C.DESTIPSER, '
      + '          A.NUMCLISUM,A.CODUNICO '
      + '     from LOG_MOV_SERVICIOS A,LOG_MAE_SERVICIOS B, LOG_TIP_SERVICIOS C, TGE201 D '
      + '    where A.CIAID = B.CIAID(+) '
      + '      and A.CODUNICO = B.CODUNICO(+) '
      + '      and B.CODSER = C.CODSER(+)'
      + '      and B.CODPROV = D.PROV(+) ';
   Mtx3100 := TMant.Create(Application);
   Try
      Mtx3100.Admin := DMLOG.wAdmin;
      Mtx3100.User := DMLOG.wUsuario;
      Mtx3100.DComC := DMLOG.DCOM1;
      Mtx3100.Titulo := 'Recibos de Servicios';
      Mtx3100.Module := DMLOG.wModulo;
      Mtx3100.Tablename := 'RECSERV';
      Mtx3100.Filter := '';
      Mtx3100.UsuarioSQL.Text := xSQL;
      Mtx3100.ClientDataset := DMLOG.cdsQry12;
      Mtx3100.OnInsert := FOrdendeCompra.InsertaRecibos;
      Mtx3100.OnDelete := Nil;
      Mtx3100.OnEdit := FOrdendeCompra.ModificaRecibos;
      Mtx3100.OnCreateMant := Nil;
      Mtx3100.SectionName := 'LOGServicios';
      Mtx3100.FileNameIni := '\oaLog.ini';
      Mtx3100.OnCierra := DMLOG.DisminuyeForma;
      Mtx3100.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx3100.Execute;
   Finally
      DMLOG.cdsQry12.close;
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFOrdendeCompra.InsertaRecibos(Sender: TObject);
Begin
   DMLOG.wModo := 'A'; //Adiciona
   FReciboServicios := TFReciboServicios.Create(Self); // LOG281.PAS (ex LOG268.PAS)
   FReciboServicios.FormStyle := fsStayOnTop;
   FReciboServicios.ShowModal;
End;

Procedure TFOrdendeCompra.ModificaRecibos(Sender: TObject;
   MantFields: TFields);
Begin
   DMLOG.wModo := 'M'; //Adiciona
   FReciboServicios := TFReciboServicios.Create(Self); // LOG281.PAS (ex LOG268.PAS)
   FReciboServicios.FormStyle := fsStayOnTop;
   FReciboServicios.ShowModal;
End;

//Registro de Orden de Trabajo

Procedure ADRegistraOrdenesTrabajo;
Var
   xSQL: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Añade Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010317') Then Exit;

   Screen.Cursor := crHourGlass;
   FToolOTrabajo := TFToolOTrabajo.Create(Application);

   xSql := 'Select A.CIAID,trunc(A.FECCREACION) FECCREACION,A.NUMORDTRA,A.TREQ_OT_ID,F.TREQ_OT_DES,A.NUMREF,trunc(A.FECREF) FECREF,'
      + '          trunc(A.FECREC) FECREC, A.CODLOC, D.LOCDES, A.CCOSID, C.CCOSDES, A.TIPOTRABAJOID, E.TIPOTRABAJODES,'
      + '          A.ESTGENERAL, A.FECINIGEN, A.FECFINGEN, A.USUARIO, A.OBSTRAB '
      + '     from LOG_ORDEN_TRABAJO_CAB A,'
      + '          TGE203 C, ACF120 D, LOG_TIPO_TRABAJO E, LOG_TREQ_ORD_TRAB F '
      + '    where A.TIPOTRABAJOID=E.TIPOTRABAJOID(+) '
      + '      and A.TREQ_OT_ID=F.TREQ_OT_ID(+) '
      + '      and A.CCOSID=C.CCOSID(+) '
      + '      and A.CODLOC=D.LOCID(+) ';
   Mtx3100 := TMant.Create(Application);
   Try
      Mtx3100.Admin := DMLOG.wAdmin;
      Mtx3100.User := DMLOG.wUsuario;
      Mtx3100.DComC := DMLOG.DCOM1;
      Mtx3100.Titulo := 'Ordenes de Trabajo';
      Mtx3100.OnCreateMant := FOrdendeCompra.PegaPanelToolOT; // LOG273 (FToolOT) Tool de Ordenes de Trabajo
      Mtx3100.Module := DMLOG.wModulo;
      Mtx3100.Tablename := 'ORDTRABCAB';
      Mtx3100.Filter := '';
      Mtx3100.UsuarioSQL.Text := xSQL;
      Mtx3100.ClientDataset := DMLOG.cdsQry11;
      Mtx3100.OnInsert := FOrdendeCompra.InsertaOrdenTrabajo;
      Mtx3100.OnDelete := Nil;
      Mtx3100.OnEdit := FOrdendeCompra.ModificaOrdenTrabajo;
      Mtx3100.SectionName := 'LOGOrdTrabCab';
      Mtx3100.FileNameIni := '\oaLog.ini';
      Mtx3100.OnCierra := DMLOG.DisminuyeForma;
      Mtx3100.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx3100.Execute;
   Finally
      Screen.Cursor := crDefault;
   End;

End;

Procedure TFOrdendeCompra.InsertaOrdenTrabajo(Sender: TObject);
Begin
   DMLOG.wModo := 'A'; //Adiciona
   FOrdenTrabajo := TFOrdenTrabajo.Create(Self); // LOG271.PAS
   FOrdenTrabajo.FormStyle := fsStayOnTop;
   FOrdenTrabajo.ShowModal;
End;

Procedure TFOrdendeCompra.ModificaOrdenTrabajo(Sender: TObject;
   MantFields: TFields);
Var
   xLineaFiltro: TBookmark;
Begin
   xLineaFiltro := Mtx3100.FMant.cds2.GetBookmark;
   DMLOG.wModo := 'M'; //Adiciona
   FOrdenTrabajo := TFOrdenTrabajo.Create(Self); // LOG271.PAS
   FOrdenTrabajo.FormStyle := fsStayOnTop;
   Try
      FOrdenTrabajo.ShowModal;
   Finally
      Mtx3100.RefreshFilter;
   End;
End;

Procedure TFOrdendeCompra.PegaPanelToolOT(Sender: TObject);
Var
   p1: TPanel;
   pg: TPanel;
Begin
// LOG273 (FToolOTrabajo)        Tool de Ordenes de Trabajo
   pg := FToolOTrabajo.pnlComandos;
   p1 := TMant(Sender).FMant.pnlBtns;
   p1.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   p1.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

End.


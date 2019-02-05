Unit oaAD3000;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : oaAD3000
//Formulario               : FADMovimientos
//Fecha de Creación        :
//Autor                    : Equipo de Sistemas
//Objetivo                 : En esta ventana se implementa las funciones que invocan
//                           al requermiento de usuario
//

//ACTUALIZACIONES
// HPC_201203_LOG 24/04/2012: -  Liberando de la memoria la ventana de requerimientos de usuario
//                               cuando se cierra la ventana
// HPC_201208_LOG 22/05/2012:  Se implementó el control de versiones
// HPC_201210_LOG 03/07/2012:  Se implementó el registro de Solicitudes de Cotización, proformas y
//                             generación del Cuadro Comparativo
// HPC_201211_LOG 19/07/2012:  Se modificó los procedimientos que invocan a la ventana
//                             de listado de Solicitudes de Cotización y de
//                             cuadro de cotizaciones para
// HPC_201404_LOG 21/10/2014   Control de Versiones 20141022080000
// HPC_201506_LOG 20/11/2014   Entrega al área de Calidad
// HPC_201601_LOG 22/09/2016   Añade Control de Acceso por Grupo de Usuario
//                             Control de Versión 20160923083000
// HPC_201602_LOG 24/10/2016   Cambio de Control de Versión a 20161024083000
// HPC_201702_LOG 16/10/2017   Retiro de Opciones NO USADAS en el módulo
//                             - ADTransfRequerimiento
//
// LOG_201805     19/11/2018   Cambio de Control de Versión a LOG-201805, cambio solo en el DFM

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, DB, ExtCtrls, StdCtrls, MsgDlgs;

Type
   TFADMovimientos = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
      xProfAut, wTipoOC: String;

    { Public declarations }
  // Requerimientos
  // LOG510 - FPedUsu - Requerimientos de Usuario
  // LOG511 - FToolPedUsu    Tool Requerimientos de Usuarios
      Procedure OnInsertPedUsu(Sender: TObject);
      Procedure OnEditPedUsu(Sender: TObject; MantFields: TFields);
      Procedure OnDeletePedUsu(Sender: TObject; MantFields: TFields);
      Procedure OnShowPedUsu(Sender: TObject);
      Procedure PegaPanelToolPedUsu(Sender: TObject);
      Procedure PegaPanelTool(Sender: TObject);

  // Solicitud de Cotizaciones
  // LOG203 - FRegSolCot     Solicitud de Cotizaciones
      Procedure OnInsertSolCot(Sender: TObject);
      Procedure OnEditSolCot(Sender: TObject; MantFields: TFields);
      Procedure OnDeleteSolCot(Sender: TObject; MantFields: TFields);
      Procedure OnShowSolCot(Sender: TObject);

    //Cuadro Comparativo
      Procedure OnEditCuadroComparativo(Sender: TObject; MantFields: TFields);
      Procedure OnInsertCuadroComparativo(Sender: TObject);

  // Proformas Directas
  // LOG230 - FRegSolProfAut Proformas Directas
      {
      Procedure OnInsertSolCotProfAut(Sender: TObject);
      Procedure OnEditSolCotProfAut(Sender: TObject; MantFields: TFields);
      Procedure OnDeleteSolCotProfAut(Sender: TObject; MantFields: TFields);
      Procedure OnShowSolCotProfAut(Sender: TObject);
      }

  // Registro de Proformas
  // LOG207 - FRegProf       Registro de Proformas
  //    Procedure OnInsertProf(Sender: TObject);
  //    Procedure OnEditProf(Sender: TObject; MantFields: TFields);
  //    Procedure OnDeleteProf(Sender: TObject; MantFields: TFields);
  //    Procedure OnShowProf(Sender: TObject);

  // Evaluación de Proformas
  // LOG507 - FEvalProforma  Evaluación de la Proforma
      Procedure ArtActSer(xTipo: String);
      Procedure OnEditEvalProf(Sender: TObject; MantFields: TFields);

  // Requisición Automática por Punto de Reposición
//      Procedure OnInsertReqAut(Sender: TObject);

   End;

// Inicio HPC_201702_LOG
// Retiro de Opciones NO USADAS en el módulo
Procedure ADRequerimientos; stdcall;
Procedure ADRequerimientos00; stdcall;
//Procedure ADTransfRequerimiento; stdcall;
Procedure ADSolicitudCotizaciones; stdcall;
//Procedure ADSolicitudCotizaciones00; stdcall;
//Procedure ADEnvioSolicitudCot; stdcall;
//Procedure ADGeneraProformasAut; stdcall; // Proformas Directas
//Procedure ADGeneraProformasAut00; stdcall;
//Procedure ADRegistroProformas; stdcall;
//Procedure ADRegistroProformas00; stdcall;
//Procedure ADEvalProfAlmacen; stdcall;
Procedure ADEvalProfServicio; stdcall;
Procedure ADEvalProfActFijo; stdcall;
Procedure ADReqAutxPtoReposicion; stdcall;
//Procedure ADReqAutxPtoReposicion00; stdcall;
Procedure ADVerificaVersion; stdcall;
Procedure ADCuadroComparativo; stdcall;

Exports
   ADRequerimientos,
   ADRequerimientos00,
//   ADTransfRequerimiento,
   ADSolicitudCotizaciones,
//   ADSolicitudCotizaciones00,
//   ADEnvioSolicitudCot,
//   ADGeneraProformasAut,
//   ADGeneraProformasAut00,
//   ADRegistroProformas,
//   ADRegistroProformas00,
//   ADEvalProfAlmacen,
   ADEvalProfServicio,
   ADEvalProfActFijo,
   ADReqAutxPtoReposicion,
//   ADReqAutxPtoReposicion00,
   ADCuadroComparativo,
   ADVerificaVersion;
// Fin HPC_201702_LOG

Var
   FADMovimientos: TFADMovimientos;
   Mtx3000: TMant;
   xProv: String;
   xoPg: Tpanel;

Implementation

{$R *.dfm}
// Inicio HPC_201702_LOG 16/10/2017   Retiro de Proformas Automáticas LOG217
{
Uses LOGDM1, LOG203, LOG204, LOG217, LOG205, LOG230, LOG207, LOG507,
     LOG302, LOG341, LOG201, LOG301, LOG340, LOG510, LOG511, LOG009;
}
Uses LOGDM1, LOG507, LOG302, LOG341, LOG301, LOG340, LOG510, LOG511;
// Fin HPC_201702_LOG

// LOG510 - FPedUsu        Requerimientos de Usuario
// LOG511 - FToolPedUsu    Tool Requerimientos de Usuarios
// LOG009 - FTransfReq     Transferencia de Requerimiento
// LOG201(oaADpkRequisiciones) - FRegReqs       Requisiciones
// LOG203 - FRegSolCot     Solicitud de Cotizaciones
// LOG205 - FSCxP          Envío de Solicitud de Cotizaciones
// LOG230 - FRegSolProfAut Proformas Directas
// LOG207 - FRegProf       Registro de Proformas
// LOG507 - FEvalProforma  Evaluación de la Proforma
// LOG219(oaADpkOCompra) - FToolOC        Tool de Ordenes de Compra
// LOG221(oaADpkOCompra) - FArtOCxReqs    Genera Orden de Compra desde Requisicion
// LOG228(oaADpkOCompra) - FRegOrdCD      Orden de Compra Directa
// LOG210(oaADpkOCompra) - FRegOrdC       Orden de Compra
// LOG500(oaADpkSegREquisicion) - FSeguiReqs     Seguimiento/Visado de Requisiciones
// LOG301 FToolSolCotizacion Tool de Solicitud de cotización
// LOG340 FToolCComparativo Tool de Cuadro Comparativo

// LOG500 Seguimiento de Requisiciones

////////////////////////////////////////////////////////////////////////
//  REQUERIMIENTOS
////////////////////////////////////////////////////////////////////////

Procedure ADRequerimientos;
Var
   UsuCCos, xSQL: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010301') Then Exit;

   Application.Initialize;

   Screen.Cursor := crHourGlass;

   DMLOG.FiltraTabla(DMLOG.cdsLoc, 'TGE126', 'LOCID', 'LOCID');
   DMLOG.FiltraTabla(DMLOG.cdsTINID, 'TGE152', 'TINID', 'TINID');
   DMLOG.FiltraTabla(DMLOG.cdsUMed, 'TGE130', 'UNMID', 'UNMID');
   DMLOG.FiltraTabla(DMLOG.cdsComprador, 'TGE135', 'COMPCID', 'COMPCID');
   DMLOG.FiltraTabla(DMLOG.cdsPrio, 'TGE155', 'PRIOID', 'PRIOID');
   FToolPedUsu := TFToolPedUsu.Create(Application);
   FToolPedUsu.Visible := false;

   DMLOG.FiltraCDS(DMLOG.cdsTDNISA, 'SELECT * FROM TGE157 WHERE TDATIP=''SALIDA''');
   DMLOG.FiltraCDS(DMLOG.cdsObra, 'SELECT * FROM TGE213 ORDER BY OBRAID');
   DMLOG.FiltraCDS(DMLOG.cdsTRAN, 'SELECT * FROM TGE208 WHERE TRISGT=''S''');
   DMLOG.FiltraCDS(DMLOG.cdsArti, 'SELECT * FROM TGE205');

   DMLOG.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx3000 := TMant.Create(Application);
   Try
      Mtx3000.Admin := DMLOG.wAdmin;
      Mtx3000.User := DMLOG.wUsuario;
      Mtx3000.Module := DMLOG.wModulo;
      Mtx3000.TableName := 'LOG306';
      Mtx3000.Titulo := 'Requerimiento de Usuario por Compras y Servicios';
      Mtx3000.ClientDataSet := DMLOG.cdsPedUsu;
      Mtx3000.OnCreateMant := FADMovimientos.PegaPanelToolPedUsu;
      Mtx3000.DComC := DMLOG.DCOM1;
      Mtx3000.OnEdit := FADMovimientos.OnEditPedUsu;
      Mtx3000.OnInsert := FADMovimientos.OnInsertPedUsu;
      Mtx3000.OnDelete := FADMovimientos.OnDeletePedUsu;
      Mtx3000.OnShow := FADMovimientos.OnShowPedUsu;
      Mtx3000.OnCierra := DMLOG.DisminuyeForma;
      Mtx3000.SectionName := 'LOGPedUsu';
      Mtx3000.FileNameIni := '\oaLog.ini';
      Mtx3000.NoVisible.Clear;

      If DMLOG.DisplayDescrip('prvTGE', 'TGE171', 'FPU', 'USERID=' + quotedstr(DMLOG.wUsuario), 'FPU') = 'S' Then // SOUSA
      Begin
         UsuCCos := DMLOG.DisplayDescrip('prvTGE', 'LOG107', 'CCOSID', 'USR=' + quotedstr(DMLOG.wUsuario), 'CCOSID'); // SECRETARIAS
         Mtx3000.Filter := '(LOG306.URQEST=' + QuotedStr('ACEPTADO') + ' OR LOG306.CCOSID=' + QuotedStr(UsuCCos) + ')';
      End
      Else
      Begin
         If DMLOG.DisplayDescrip('prvTGE', 'TGE171', 'FAP', 'USERID=' + quotedstr(DMLOG.wUsuario), 'FAP') = 'S' Then // PAZOS
         Begin
            UsuCCos := DMLOG.DisplayDescrip('prvTGE', 'LOG107', 'CCOSID', 'USR=' + quotedstr(DMLOG.wUsuario), 'CCOSID'); // SECRETARIAS
            Mtx3000.Filter := '(LENGTH(LOG306.URQENVUSR)>0 OR LOG306.CCOSID=''' + UsuCCos + ''')'
         End
         Else
         Begin
            UsuCCos := DMLOG.DisplayDescrip('prvTGE', 'LOG107', 'CCOSID', 'USR=' + quotedstr(DMLOG.wUsuario), 'CCOSID'); // SECRETARIAS
            Mtx3000.Filter := 'LOG306.CCOSID=''' + UsuCCos + '''';
         End;
      End;

      xSQL := 'Select CCOSID, CCOSDES from TGE203 where CCOSLOCS=''' + DMLOG.wUsuario + '''';
      DMLOG.cdsCC.Close;
      DMLOG.cdsCC.dataRequest(xSQL);
      DMLOG.cdsCC.Open;
      Screen.Cursor := crDefault;
      If DMLOG.cdsCC.RecordCount > 0 Then
      Begin
         Mtx3000.Filter := '';
         Mtx3000.Execute;

         FToolPedUsu.dblcdCC.Enabled := False;
         If DMLOG.cdsCC.recordcount >= 1 Then
         Begin
            FToolPedUsu.dblcdCC.Enabled := True;
         End;
         FToolPedUsu.dblcdCC.LookupTable := DMLOG.cdsCC;
         FToolPedUsu.dblcdCC.Text := UsuCCos;
         FToolPedUsu.dblcdCCExit(Nil);
      End
      Else
      Begin
         xSQL := ' Select A.CODIGO CCOSID, B.CCOSDES '
            + '      from TGE004 A, TGE203 B '
            + '     where A.MODULOID=' + quotedstr(DMLOG.wModulo)
            + '       and A.NTABLA=''TGE203'' '
            + '       and A.USERID=' + quotedstr(DMLOG.wUsuario)
            + '       and B.CCOSID=A.CODIGO ';
         DMLOG.cdsCC.Close;
         DMLOG.cdsCC.DataRequest(xSQL);
         DMLOG.cdsCC.Open;
         If DMLOG.cdsCC.RecordCount > 1 Then
         Begin
            DMLOG.cdsCC.First;
            xSQL := 'CCOSID=' + quotedstr(DMLOG.cdsCC.FieldByName('CCOSID').ASString);
            DMLOG.cdsCC.Next;
            While Not DMLOG.cdsCC.Eof Do
            Begin
               xSQL := xSQL + ' or CCOSID=' + quotedstr(DMLOG.cdsCC.FieldByName('CCOSID').ASString);
               DMLOG.cdsCC.Next;
            End;
            Mtx3000.Filter := xSQL;
            Mtx3000.Execute;
            FToolPedUsu.dblcdCC.Enabled := True;
            FToolPedUsu.dblcdCC.LookupTable := DMLOG.cdsCC;
            DMLOG.cdsCC.First;
            FToolPedUsu.dblcdCC.Text := DMLOG.cdsCC.FieldByName('CCOSID').ASString;
            FToolPedUsu.edtCCostoSoli.Text := DMLOG.cdsCC.FieldByName('CCOSDES').ASString;
         End
         Else
         Begin
            xSQL := 'Select CCOSID, CCOSDES FROM TGE203 where CCOSID=''' + UsuCCos + '''';
            DMLOG.cdsCC.Close;
            DMLOG.cdsCC.dataRequest(xSQL);
            DMLOG.cdsCC.Open;
            Mtx3000.Execute;
            FToolPedUsu.dblcdCC.Enabled := False;
            FToolPedUsu.dblcdCC.LookupTable := DMLOG.cdsCC;
            FToolPedUsu.dblcdCC.Text := UsuCCos;
            FToolPedUsu.edtCCostoSoli.Text := DMLOG.cdsCC.FieldByName('CCOSDES').ASString;
         End;
      End;
   Finally
   End;
End;

Procedure TFADMovimientos.OnInsertPedUsu(Sender: TObject);
Var
   sSQL: String;
Begin
// se ubica en registro a borrar
   xSQL := 'Select * from LOG306 '
      + ' where 1<>1';
   DMLOG.cdsPedUsu.Close;
   DMLOG.cdsPedUsu.IndexFieldNames := '';
   DMLOG.cdsPedUsu.Filter := '';
   DMLOG.cdsPedUsu.Filtered := False;
   DMLOG.cdsPedUsu.DataRequest(xSQL);
   DMLOG.cdsPedUsu.Open;

   DMLOG.wModo := 'A';
   sSQL := 'SELECT * FROM LOG107 WHERE USR=' + quotedstr(DMLOG.wUsuario);
   DMLOG.FiltraCDS(DMLOG.cdsSQL, sSQL);
   If (DMLOG.cdsSQL.RecNo <= 0) And (DMLOG.cdsSQL.eof) Then
   Begin
      ErrorMsg('Adquisiciones', ' Usted no está Autorizado para realizar un Pedido ');
      Exit;
   End;
   DMLOG.cdsPedUsu.Insert;
   DMLOG.cdsPedUsu.FieldByName('URQEST').AsString := 'INICIAL';

// LOG510 - FPedUsu - Requerimientos de Usuario
   FPedUsu := TFPedUsu.Create(Application);
   Try
     // FPedUsu.ActiveMDIChild;
      FPedUsu.ShowModal;
   Finally
      FPedUsu.Free;
   End;
End;

Procedure TFADMovimientos.OnEditPedUsu(Sender: TObject; MantFields: TFields);
Var
   sCIA, sLOC, sCCO, sURQ, sSQL: String;
Begin
  // LOG510 - FPedUsu - Requerimientos de Usuario
  // LOG511 - FToolPedUsu    Tool Requerimientos de Usuarios

// se ubica en registro a actualizar
   xSQL := 'Select * from LOG306 '
      + '   where CIAID=' + quotedstr(Mtx3000.FMant.cds2.fieldbyname('CIAID').AsString)
      + '     and LOCID=' + quotedStr(Mtx3000.FMant.cds2.fieldbyname('LOCID').AsString)
      + '     and CCOSID=' + quotedstr(Mtx3000.FMant.cds2.fieldbyname('CCOSID').AsString)
      + '     and URQID=' + quotedstr(Mtx3000.FMant.cds2.fieldbyname('URQID').AsString);
   DMLOG.cdsPedUsu.Close;
   DMLOG.cdsPedUsu.IndexFieldNames := '';
   DMLOG.cdsPedUsu.Filter := '';
   DMLOG.cdsPedUsu.Filtered := False;
   DMLOG.cdsPedUsu.DataRequest(xSQL);
   DMLOG.cdsPedUsu.Open;

   DMLOG.wModo := 'M';
   sCIA := MantFields.FieldByName('CIAID').AsString;
   sLOC := MantFields.FieldByName('LOCID').AsString;
   sCCO := MantFields.FieldByName('CCOSID').AsString;
   sURQ := MantFields.FieldByName('URQID').AsString;
   sSQL := 'SELECT * '
      + '     FROM LOG307 '
      + '    WHERE CIAID=''' + sCIA + ''''
      + '      AND LOCID=''' + sLOC + ''''
      + '      AND CCOSID=''' + sCCO + ''''
      + '      AND URQID=''' + sURQ + ''''
      + '    ORDER BY CIAID, URQID, DURQID';
   DMLOG.cdsDPedUsu.Close;
   DMLOG.cdsDPedUsu.MasterSource := Nil;
   DMLOG.cdsDPedUsu.MasterFields := '';
   DMLOG.cdsDPedUsu.IndexFieldNames := '';
   DMLOG.cdsDPedUsu.DataRequest(sSQL);
   DMLOG.cdsDPedUsu.Open;
   DMLOG.cdsPedUsu.Edit;

// LOG510 - FPedUsu - Requerimientos de Usuario
   FPedUsu := TFPedUsu.Create(Application);
   Try
      FPedUsu.ShowModal;
   Finally
      FPedUsu.Free;
   End;
End;

Procedure TFADMovimientos.OnDeletePedUsu(Sender: TObject;
   MantFields: TFields);
Var
   sSQL: String;
   sNUM, sCIA, sLOC, sCCO: String;
Begin
// se ubica en registro a borrar
   xSQL := 'Select * from LOG306 '
      + '    where CIAID=' + quotedstr(Mtx3000.FMant.cds2.fieldbyname('CIAID').AsString)
      + '      and LOCID=' + quotedStr(Mtx3000.FMant.cds2.fieldbyname('LOCID').AsString)
      + '      and CCOSID=' + quotedstr(Mtx3000.FMant.cds2.fieldbyname('CCOSID').AsString)
      + '      and URQID=' + quotedstr(Mtx3000.FMant.cds2.fieldbyname('URQID').AsString);
   DMLOG.cdsPedUsu.Close;
   DMLOG.cdsPedUsu.IndexFieldNames := '';
   DMLOG.cdsPedUsu.Filter := '';
   DMLOG.cdsPedUsu.Filtered := False;
   DMLOG.cdsPedUsu.DataRequest(xSQL);
   DMLOG.cdsPedUsu.Open;

   If (trim(DMLOG.cdsPedUsu.FieldbyName('URQEST').AsString) <> 'INICIAL') Then
   Begin
      ErrorMsg('Requerimientos', 'Este Pedido ya fue Aceptado, No es Posible Eliminarlo');
      Exit;
   End;
   If Question('Confirmar', 'Esta Seguro de Eliminar El Pedido ' + #13 + #13 +
      DMLOG.cdsPedUsu.FieldByName('URQID').AsString + '  -  ' + #13 +
      #13 + ' Desea Continuar ') Then
   Begin
      sNUM := DMLOG.cdsPedUsu.FieldByName('URQID').AsString;
      sCIA := DMLOG.cdsPedUsu.FieldByName('CIAID').AsString;
      sLOC := DMLOG.cdsPedUsu.FieldByName('LOCID').AsString;
      sCCO := DMLOG.cdsPedUsu.FieldByName('CCOSID').AsString;

      Screen.Cursor := crHourGlass;
      sSQL := 'DELETE FROM LOG307 WHERE CIAID=''' + sCIA + ''' AND CCOSID=''' + sCCO + ''' ' +
         'AND LOCID=''' + sLOC + ''' AND URQID=''' + sNUM + '''';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
      xBorrar := '1';
      DMLOG.cdsPedUsu.Delete;
      DMLOG.ControlTran(9, DMLOG.cdsPedUsu, 'PEDUSU');
      DMLOG.ActualizaFiltro(Mtx3000, DMLOG.cdsPedUsu, 'E');
      xBorrar := '0';
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFADMovimientos.OnShowPedUsu(Sender: TObject);
Begin
//
End;

Procedure TFADMovimientos.PegaPanelToolPedUsu(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolPedUsu.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure ADRequerimientos00;
Var
   sSQL: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// se ubica en registro a borrar
   xSQL := 'Select * from LOG306 '
      + 'where 1<>1';
   DMLOG.cdsPedUsu.Close;
   DMLOG.cdsPedUsu.IndexFieldNames := '';
   DMLOG.cdsPedUsu.Filter := '';
   DMLOG.cdsPedUsu.Filtered := False;
   DMLOG.cdsPedUsu.DataRequest(xSQL);
   DMLOG.cdsPedUsu.Open;

   DMLOG.wModo := 'A';
   sSQL := 'SELECT * FROM LOG107 WHERE USR=' + quotedstr(DMLOG.wUsuario);
   DMLOG.FiltraCDS(DMLOG.cdsSQL, sSQL);
   If (DMLOG.cdsSQL.RecNo <= 0) And (DMLOG.cdsSQL.eof) Then
   Begin
      ErrorMsg('Adquisiciones', ' Usted no está Autorizado para realizar un Pedido ');
      Exit;
   End;
   DMLOG.cdsPedUsu.Insert;
   DMLOG.cdsPedUsu.FieldByName('URQEST').AsString := 'INICIAL';

   FPedUsu := TFPedUsu.Create(Application);
   Try
      FPedUsu.ShowModal;
   Finally
      FPedUsu.Free;
   End;

End;

////////////////////////////////////////////////////////////////////////
// SOLICITUD DE COTIZACIONES
////////////////////////////////////////////////////////////////////////

Procedure ADSolicitudCotizaciones;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Inicio HPC_201601_LOG
// Añade Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010304') Then Exit;
// Fin HPC_201601_LOG

   FADMovimientos := TFADMovimientos.Create(Application);
   FADMovimientos.xProfAut := 'SOLICITUD';
   Screen.Cursor := crHourGlass;

   DMLOG.FiltraTabla(DMLOG.cdsTipSol, 'TGE173', 'TIPOADQ', 'TIPOADQ');
   DMLOG.FiltraTabla(DMLOG.cdsLEntrega, 'TGE136', 'LGECID', 'LGECID');
   DMLOG.FiltraTabla(DMLOG.cdsComprador, 'TGE135', 'COMPCID', 'COMPCID');
   DMLOG.FiltraTabla(DMLOG.cdsUMed, 'TGE130', 'UNMID', 'UNMID');
   DMLOG.FiltraTabla(DMLOG.cdsPrio, 'TGE155', 'PRIOID', 'PRIOID');

   FToolSolCotizacion := TFToolSolCotizacion.Create(Application);
   FToolSolCotizacion.Visible := false;
   xoPg := FToolSolCotizacion.pnlAct;
   DMLOG.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx3000 := TMant.Create(Application);
   Try
      Mtx3000.Admin := DMLOG.wAdmin;
      Mtx3000.Module := DMLOG.wModulo;
      Mtx3000.User := DMLOG.wUsuario;
      Mtx3000.OnCreateMant := Nil;
      Mtx3000.TableName := 'LOG302';
      Mtx3000.Titulo := 'Solicitud de Cotización';
      Mtx3000.ClientDataSet := DMLOG.cdsSolCot;
      Mtx3000.DComC := DMLOG.DCOM1;
      Mtx3000.OnCreateMant := FADMovimientos.PegaPanelTool;
      Mtx3000.OnEdit := FADMovimientos.OnEditSolCot;
      Mtx3000.OnInsert := FADMovimientos.OnInsertSolCot;
      Mtx3000.OnDelete := FADMovimientos.OnDeleteSolCot;
      Mtx3000.OnShow := FADMovimientos.OnShowSolCot;
      Mtx3000.SectionName := 'LOGSolicitud';
      Mtx3000.FileNameIni := '\oaLog.ini';
      Mtx3000.Filter := '';
      Mtx3000.NoVisible.Clear;
      Mtx3000.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx3000.Execute;
   Finally
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFADMovimientos.PegaPanelTool(Sender: TObject);
Var
   p1: TPanel;
   pg: TPanel;
Begin
// LOG219 (FToolOC)        Tool de Ordenes de Compra
   pg := xoPg;
   p1 := TMant(Sender).FMant.pnlBtns;
   p1.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   p1.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFADMovimientos.OnInsertSolCot(Sender: TObject);
Begin
   xSQL := 'Select * '
      + '     from LOG302 '
      + '    where 1<>1';
   DMLOG.cdsSolCot.Close;
   DMLOG.cdsSolCot.IndexFieldNames := '';
   DMLOG.cdsSolCot.Filter := '';
   DMLOG.cdsSolCot.Filtered := False;
   DMLOG.cdsSolCot.DataRequest(xSQL);
   DMLOG.cdsSolCot.Open;

   If DMLOG.cdsSolCot.State In [dsInsert, dsEdit] Then
      DMLOG.cdsSolCot.Cancel;
   DMLOG.cdsSolCot.Insert;
   DMLOG.cdsSolCot.FieldByName('SCCEST').AsString := 'INICIAL';

   xSQL := 'Select * '
      + '     from LOG303 '
      + '    where 1<>1';
   DMLOG.cdsDSolCot.Close;
   DMLOG.cdsDSolCot.DataRequest(xSQL);
   DMLOG.cdsDSolCot.Open;

   DMLOG.wModo := 'A';
   FRegSolCotizacion := TFRegSolCotizacion.Create(Application);
   FRegSolCotizacion.dblcCompania.Enabled := True;
   FRegSolCotizacion.edtNumCotizacion.Enabled := True;
   Try
      FRegSolCotizacion.ShowModal;
   Finally
      FRegSolCotizacion.Free;
   End;
End;

Procedure TFADMovimientos.OnEditSolCot(Sender: TObject;
   MantFields: TFields);
Var
   xSQL: String;
Begin
   xSQL := 'Select * '
      + '     from LOG302 '
      + '    where CIAID=' + quotedstr(MantFields.FieldByName('CIAID').AsString)
      + '      and SCCID=' + quotedstr(MantFields.FieldByName('SCCID').AsString);
   DMLOG.cdsSolCot.Close;
   DMLOG.cdsSolCot.IndexFieldNames := '';
   DMLOG.cdsSolCot.Filter := '';
   DMLOG.cdsSolCot.Filtered := False;
   DMLOG.cdsSolCot.DataRequest(xSQL);
   DMLOG.cdsSolCot.Open;

   If (DMLOG.cdsSolCot.RecNo <= 0) And
      (DMLOG.cdsSolCot.eof) Then
   Begin
      ErrorMsg('Error', 'No existen registros a Editar');
      exit;
   End;

   Screen.Cursor := crHourGlass;
   DMLOG.cdsSolCot.Edit;

   Screen.Cursor := crDefault;

   xSQL := 'Select * '
      + '     from LOG303 '
      + '    where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '      and SCCID=' + QuotedStr(MantFields.FieldByName('SCCID').AsString);

   DMLOG.cdsDSolCot.Close;
   DMLOG.cdsDSolCot.DataRequest(xSQL);
   DMLOG.cdsDSolCot.Open;

   If DMLOG.cdsSolCot.FieldByName('SCCEST').AsString <> 'INICIAL' Then
   Begin
      DMLOG.wModo := 'C';
   End
   Else
   Begin
      DMLOG.wModo := 'M';
   End;

   FRegSolCotizacion := TFRegSolCotizacion.Create(Application);
   FRegSolCotizacion.xsCompania := MantFields.FieldByName('CIAID').AsString;
   FRegSolCotizacion.xsNumCotizacion := MantFields.FieldByName('SCCID').AsString;
   FRegSolCotizacion.dblcCompania.Enabled := False;
   FRegSolCotizacion.edtNumCotizacion.Enabled := False;
   Try
      FRegSolCotizacion.ShowModal;
   Finally
      FRegSolCotizacion.Free;
   End;
End;

Procedure TFADMovimientos.OnDeleteSolCot(Sender: TObject;
   MantFields: TFields);
Var
   xSQL: String;
Begin
   xSQL := 'Select * from LOG302 '
      + '    where CIAID=' + quotedstr(MantFields.FieldByName('CIAID').AsString)
      + '      and SCCID=' + quotedstr(MantFields.FieldByName('SCCID').AsString);
   DMLOG.cdsSolCot.Close;
   DMLOG.cdsSolCot.IndexFieldNames := '';
   DMLOG.cdsSolCot.Filter := '';
   DMLOG.cdsSolCot.Filtered := False;
   DMLOG.cdsSolCot.DataRequest(xSQL);
   DMLOG.cdsSolCot.Open;

   If (trim(DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString) <> 'INICIAL') Then
   Begin
      ErrorMsg('Adquisiciones', 'Esta Solicitud ya fue Aceptada, No es Posible Eliminarla');
      Exit;
   End;
   If Question('Confirmar', 'Se Eliminará La Solicitud ' + #13 + #13 +
      DMLOG.cdsSolCot.FieldByName('SCCID').AsString + '  -  ' + #13 +
      #13 + ' ¿Desea Continuar? ') Then
   Begin
      Screen.Cursor := crHourGlass;
      xSQL := 'delete from LOG303 '
         + '    where CIAID = ''' + DMLOG.cdsSolCot.FieldByName('CIAID').AsString + ''' '
         + '      and SCCID = ''' + DMLOG.cdsSolCot.FieldByName('SCCID').AsString + '''';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
      End;
      xSQL := 'delete from LOG310 '
         + '    where CIAID = ''' + DMLOG.cdsSolCot.FieldByName('CIAID').AsString + ''' '
         + '      and SCCID = ''' + DMLOG.cdsSolCot.FieldByName('SCCID').AsString + '''';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
      End;
      xBorrar := '1';
      DMLOG.cdsSolCot.Delete;
      DMLOG.ControlTran(9, DMLOG.cdsSolCot, 'SOLCOT');
      xBorrar := '0';
      DMLOG.ActualizaFiltro(Mtx3000, DMLOG.cdsSolCot, 'E');
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFADMovimientos.OnShowSolCot(Sender: TObject);
Begin
//
End;

(*
Procedure ADSolicitudCotizaciones00;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

   xSQL := 'Select * from LOG302 '
      + '    where 1<>1';
   DMLOG.cdsSolCot.Close;
   DMLOG.cdsSolCot.IndexFieldNames := '';
   DMLOG.cdsSolCot.Filter := '';
   DMLOG.cdsSolCot.Filtered := False;
   DMLOG.cdsSolCot.DataRequest(xSQL);
   DMLOG.cdsSolCot.Open;

   If DMLOG.cdsSolCot.State In [dsInsert, dsEdit] Then
      DMLOG.cdsSolCot.Cancel;
   DMLOG.cdsSolCot.Insert;
   DMLOG.cdsSolCot.FieldByName('SCCEST').AsString := 'INICIAL';

   xSQL := 'Select * '
      + '     from LOG303 '
      + '    where 1<>1';
   DMLOG.cdsDSolCot.Close;
   DMLOG.cdsDSolCot.DataRequest(xSQL);
   DMLOG.cdsDSolCot.Open;

   DMLOG.wModo := 'A';
   FRegSolCot := TFRegSolCot.Create(Application);
   FRegSolCot.dblcCIA.Enabled := True;
   FRegSolCot.dbeNumSol.Enabled := True;
   Try
      FRegSolCot.ActiveMDIChild;
   Finally

   End;
End;
// Fin Solicitid de Cotizaciones
*)

////////////////////////////////////////////////////////////////////////
// CUADRO COMPARATIVO
////////////////////////////////////////////////////////////////////////
Procedure ADCuadroComparativo;
Var
   xsSql: String;
Begin
   If DMLOG = Nil Then Exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010305') Then Exit;

   FADMovimientos := TFADMovimientos.Create(Application);

   Screen.Cursor := crHourGlass;
   FToolCComparativo := TFToolCComparativo.Create(Application);
   FToolCComparativo.Visible := false;
   xoPg := FToolCComparativo.pnlAct;
   DMLOG.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx3000 := TMant.Create(Application);
   Try
      Mtx3000.Admin := DMLOG.wAdmin;
      Mtx3000.Module := DMLOG.wModulo;
      Mtx3000.User := DMLOG.wUsuario;
      Mtx3000.OnCreateMant := Nil;
      Mtx3000.TableName := 'LOG341';
      Mtx3000.Titulo := 'Cuadro Comparativo';
      Mtx3000.ClientDataSet := DMLOG.cdsCuadroComparativo;
      Mtx3000.DComC := DMLOG.DCOM1;
      Mtx3000.OnCreateMant := FADMovimientos.PegaPanelTool;
      Mtx3000.OnEdit := FADMovimientos.OnEditCuadroComparativo;
      Mtx3000.OnInsert := FADMovimientos.OnInsertCuadroComparativo;
      Mtx3000.OnDelete := Nil;
      Mtx3000.OnShow := Nil;
      Mtx3000.SectionName := 'LOGCuadroComparativo';
      Mtx3000.FileNameIni := '\oaLog.ini';
      Mtx3000.Filter := '';
      Mtx3000.NoVisible.Clear;
      Mtx3000.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx3000.Execute;
   Finally
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFADMovimientos.OnEditCuadroComparativo(Sender: TObject;
   MantFields: TFields);
Var
   xsSQL: String;
Begin
   xSQL := 'Select * '
      + '     from LOG341 '
      + '    where CIAID = ' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '      and NUMCC = ' + QuotedStr(MantFields.FieldByName('NUMCC').AsString)
      + '      and SCCID=' + QuotedStr(MantFields.FieldByName('SCCID').AsString);
   DMLOG.cdsCuadroComparativo.Close;
   DMLOG.cdsCuadroComparativo.IndexFieldNames := '';
   DMLOG.cdsCuadroComparativo.Filter := '';
   DMLOG.cdsCuadroComparativo.Filtered := False;
   DMLOG.cdsCuadroComparativo.DataRequest(xSQL);
   DMLOG.cdsCuadroComparativo.Open;

   If (DMLOG.cdsCuadroComparativo.RecNo <= 0) And
      (DMLOG.cdsCuadroComparativo.eof) Then
   Begin
      ErrorMsg('Error', 'No existen registros a Editar');
      exit;
   End;

   Screen.Cursor := crDefault;

   If DMLOG.cdsCuadroComparativo.FieldByName('ESTCC').AsString <> 'INICIAL' Then
   Begin
      DMLOG.wModo := 'C';
   End
   Else
   Begin
      DMLOG.wModo := 'M';
   End;

   FCuadroComparativo := TFCuadroComparativo.Create(Application);
   FCuadroComparativo.xsCompania := MantFields.FieldByName('CIAID').AsString;
   FCuadroComparativo.xsNumSolCotizacion := MantFields.FieldByName('SCCID').AsString;
   FCuadroComparativo.xsNumCComparativo := MantFields.FieldByName('NUMCC').AsString;
   Try
      FCuadroComparativo.ShowModal;
   Finally
      FCuadroComparativo.Free;
   End;
End;

Procedure TFADMovimientos.OnInsertCuadroComparativo(Sender: TObject);
Begin
   DMLOG.wModo := 'A';
   FCuadroComparativo := TFCuadroComparativo.Create(Application);
   Try
      FCuadroComparativo.ShowModal;
   Finally
      FCuadroComparativo.Free;
   End;
End;

////////////////////////////////////////////////////////////////////////
// ENVIO DE SOLICITUD DE COTIZACIONES
////////////////////////////////////////////////////////////////////////
(*
Procedure ADEnvioSolicitudCot;
Var
   ssql: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

   Application.Initialize;
   sSQL := 'SELECT * FROM LOG311';
   DMLOG.cdsSCxProv.Close;
   DMLOG.cdsSCxProv.dataRequest(sSQL);
   DMLOG.cdsSCxProv.Open;
   FSCxP := TFSCxP.create(Application);
   Try
      FSCxP.ActiveMDIChild;
   Finally
   End;
End;
// Fin Envío de Solicitid de Cotizaciones
*)

////////////////////////////////////////////////////////////////////////
// GENERACION DE PROFORMAS AUTOMATICAS
////////////////////////////////////////////////////////////////////////
{
Procedure ADGeneraProformasAut;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

   FADMovimientos := TFADMovimientos.Create(Application);
   FADMovimientos.xProfAut := 'PROFORMA';
   Screen.Cursor := crHourGlass;
   DMLOG.FiltraTabla(DMLOG.cdsLoc, 'TGE126', 'LOCID', 'LOCID');
   DMLOG.FiltraTabla(DMLOG.cdsLEntrega, 'TGE136', 'LGECID', 'LGECID');

   xProv := DMLOG.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');
   DMLOG.cdsProv.Close;
   DMLOG.cdsProv.DataRequest('SELECT CLAUXID, PROV, PROVRUC, PROVDES, PROVNOMCOM FROM TGE201 WHERE CLAUXID=' + QuotedStr(xProv) + ' ORDER BY PROV');
   DMLOG.cdsProv.FetchOnDemand := False;
   DMLOG.cdsProv.PacketRecords := 20;
   DMLOG.cdsProv.FetchOnDemand := True;
   DMLOG.cdsProv.Open;

   DMLOG.FiltraTabla(DMLOG.cdsTSolCot, 'TGE137', 'TSCID', 'TSCID');
   DMLOG.FiltraTabla(DMLOG.cdsTipSol, 'TGE173', 'TIPOADQ', 'TIPOADQ');
   DMLOG.FiltraTabla(DMLOG.cdsLEntrega, 'TGE136', 'LGECID', 'LGECID');

   DMLOG.FiltraTabla(DMLOG.cdsComprador, 'TGE135', 'COMPCID', 'COMPCID');
   DMLOG.FiltraTabla(DMLOG.cdsUMed, 'TGE130', 'UNMID', 'UNMID');
   DMLOG.FiltraTabla(DMLOG.cdsPrio, 'TGE155', 'PRIOID', 'PRIOID');
   DMLOG.FiltraTabla(DMLOG.cdsTMoneda, 'TGE103', 'TMONID', 'TMONID');

   FRqsArt := TFRqsArt.create(Application);
   FRqsSer := TFRqsSer.create(Application);

   DMLOG.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx3000 := TMant.Create(Application);
   Try
      Mtx3000.Admin := DMLOG.wAdmin;
      Mtx3000.Module := DMLOG.wModulo;
      Mtx3000.User := DMLOG.wUsuario;
      Mtx3000.OnCreateMant := Nil;
      Mtx3000.TableName := 'LOG302';
      Mtx3000.Titulo := 'Proformas Directas';
      Mtx3000.ClientDataSet := DMLOG.cdsSolCot;
      Mtx3000.DComC := DMLOG.DCOM1;
      Mtx3000.OnEdit := FADMovimientos.OnEditSolCotProfAut;
      Mtx3000.OnInsert := FADMovimientos.OnInsertSolCotProfAut;
      Mtx3000.OnDelete := FADMovimientos.OnDeleteSolCotProfAut;
      Mtx3000.OnShow := FADMovimientos.OnShowSolCotProfAut;
      Mtx3000.SectionName := 'LOGSolProfAut';
      Mtx3000.FileNameIni := '\oaLog.ini';
      Mtx3000.Filter := '';
      Mtx3000.NoVisible.Clear;
      Mtx3000.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx3000.Execute;
   Finally
      Screen.Cursor := crDefault;
   End;
End;
}

{
Procedure TFADMovimientos.OnInsertSolCotProfAut(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select * '
      + '     from LOG302 '
      + '    where 1<>1';
   DMLOG.cdsSolCot.Close;
   DMLOG.cdsSolCot.IndexFieldNames := '';
   DMLOG.cdsSolCot.Filter := '';
   DMLOG.cdsSolCot.Filtered := False;
   DMLOG.cdsSolCot.DataRequest(xSQL);
   DMLOG.cdsSolCot.Open;

   If DMLOG.cdsSolCot.State In [dsInsert, dsEdit] Then
      DMLOG.cdsSolCot.Cancel;
   DMLOG.cdsSolCot.Insert;
   DMLOG.cdsSolCot.FieldByName('SCCEST').AsString := 'INICIAL';
   DMLOG.cdsSolCot.FieldByName('SCCFENT').AsDateTime := date;

   xSQL := 'select * '
      + '     from LOG303 '
      + '    where CIAID=''99'' '
      + '      and SCCID=''00000000''';
   DMLOG.cdsDSolCot.Close;
   DMLOG.cdsDSolCot.DataRequest(xSQL);
   DMLOG.cdsDSolCot.Open;

   DMLOG.wModo := 'A';
   FRegSolProfAut := TFRegSolProfAut.Create(Application);
   FRegSolProfAut.dblcCIA.Enabled := True;
   FRegSolProfAut.dbeNumSol.Enabled := True;
   Try
      FRegSolProfAut.ActiveMDIChild;
   Finally

   End;
End;
}

{
Procedure TFADMovimientos.OnEditSolCotProfAut(Sender: TObject;
   MantFields: TFields);
Var
   xSQL: String;
Begin
   xSQL := 'Select * '
      + '     from LOG302 '
      + '    where CIAID=' + quotedstr(MantFields.FieldByName('CIAID').AsString)
      + '      and SCCID=' + quotedstr(MantFields.FieldByName('SCCID').AsString);
   DMLOG.cdsSolCot.Close;
   DMLOG.cdsSolCot.IndexFieldNames := '';
   DMLOG.cdsSolCot.Filter := '';
   DMLOG.cdsSolCot.Filtered := False;
   DMLOG.cdsSolCot.DataRequest(xSQL);
   DMLOG.cdsSolCot.Open;
   If (DMLOG.cdsSolCot.RecNo <= 0) And
      (DMLOG.cdsSolCot.eof) Then
   Begin
      ErrorMsg('Error', 'No existen registros a Editar');
      exit;
   End;
   Screen.Cursor := crHourGlass;
   DMLOG.cdsSolCot.Edit;

   Screen.Cursor := crDefault;

   xSQL := 'Select * '
      + '     from LOG303 '
      + '    where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '      and SCCID=' + QuotedStr(MantFields.FieldByName('SCCID').AsString);
   DMLOG.cdsDSolCot.Close;
   DMLOG.cdsDSolCot.DataRequest(xSQL);
   DMLOG.cdsDSolCot.Open;

   DMLOG.wModo := 'M';
   FRegSolProfAut := TFRegSolProfAut.Create(Application);
   FRegSolProfAut.dblcCIA.Enabled := False;
   FRegSolProfAut.dbeNumSol.Enabled := False;
   Try
      FRegSolProfAut.ActiveMDIChild;
   Finally

   End;
End;

Procedure TFADMovimientos.OnDeleteSolCotProfAut(Sender: TObject;
   MantFields: TFields);
Var
   xSQL: String;
Begin
   xSQL := 'Select * '
      + '     from LOG302 '
      + '    where CIAID=' + quotedstr(MantFields.FieldByName('CIAID').AsString)
      + '      and SCCID=' + quotedstr(MantFields.FieldByName('SCCID').AsString);
   DMLOG.cdsSolCot.Close;
   DMLOG.cdsSolCot.IndexFieldNames := '';
   DMLOG.cdsSolCot.Filter := '';
   DMLOG.cdsSolCot.Filtered := False;
   DMLOG.cdsSolCot.DataRequest(xSQL);
   DMLOG.cdsSolCot.Open;

   If (trim(DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString) <> 'INICIAL') Then
   Begin
      ErrorMsg('Adquisiciones', 'Esta Solicitud ya a Sido Aceptada, No es Posible Eliminarla');
      Exit;
   End;
   If Question('Confirmar', 'Esta Seguro de Eliminar La Solicitud ' + #13 + #13 +
      DMLOG.cdsSolCot.FieldByName('SCCID').AsString + '  -  ' + #13 +
      #13 + ' Desea Continuar ') Then
   Begin
      Screen.Cursor := crHourGlass;
      sSQL := 'Delete FROM LOG303 '
         + '    where SCCID = ''' + DMLOG.cdsSolCot.FieldByName('SCCID').AsString + ''''
         + '      and CIAID = ''' + DMLOG.cdsSolCot.FieldByName('CIAID').AsString + ''' ';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
      sSQL := 'Delete FROM LOG310 '
         + '    where SCCID = ''' + DMLOG.cdsSolCot.FieldByName('SCCID').AsString + ''''
         + '      and CIAID = ''' + DMLOG.cdsSolCot.FieldByName('CIAID').AsString + ''' ';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
      xBorrar := '1';
      DMLOG.cdsSolCot.Delete;
      DMLOG.ControlTran(9, DMLOG.cdsSolCot, 'SOLCOT');
      xBorrar := '0';
      DMLOG.ActualizaFiltro(Mtx3000, DMLOG.cdsSolCot, 'E');
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFADMovimientos.OnShowSolCotProfAut(Sender: TObject);
Begin
//
End;

{
Procedure ADGeneraProformasAut00;
Var
   xSQL: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

   xSQL := 'Select * '
      + '     from LOG302 '
      + '    where 1<>1';
   DMLOG.cdsSolCot.Close;
   DMLOG.cdsSolCot.IndexFieldNames := '';
   DMLOG.cdsSolCot.Filter := '';
   DMLOG.cdsSolCot.Filtered := False;
   DMLOG.cdsSolCot.DataRequest(xSQL);
   DMLOG.cdsSolCot.Open;

   If DMLOG.cdsSolCot.State In [dsInsert, dsEdit] Then
      DMLOG.cdsSolCot.Cancel;
   DMLOG.cdsSolCot.Insert;
   DMLOG.cdsSolCot.FieldByName('SCCEST').AsString := 'INICIAL';
   DMLOG.cdsSolCot.FieldByName('SCCFENT').AsDateTime := date;

   xSQL := 'Select * '
      + '     from LOG303 '
      + '    where CIAID=''99'' '
      + '      and SCCID=''00000000''';
   DMLOG.cdsDSolCot.Close;
   DMLOG.cdsDSolCot.DataRequest(xSQL);
   DMLOG.cdsDSolCot.Open;

   DMLOG.wModo := 'A';
   FRegSolProfAut := TFRegSolProfAut.Create(Application);
   FRegSolProfAut.dblcCIA.Enabled := True;
   FRegSolProfAut.dbeNumSol.Enabled := True;
   Try
      FRegSolProfAut.ActiveMDIChild;
   Finally

   End;
End;
// Fin de Generación de Proformas Automáticas
}

////////////////////////////////////////////////////////////////////////
// SEGUIMIENTO DE REQUISICIONES
////////////////////////////////////////////////////////////////////////
(*
Procedure ADRegistroProformas;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

   Screen.Cursor := crHourGlass;

   DMLOG.cdsUMed.Close;
   DMLOG.cdsUMed.DataRequest('Select * from TGE130');
   DMLOG.cdsUMed.open;

   DMLOG.cdsFPago.Close;
   DMLOG.cdsFPago.DataRequest('Select * from CXC101 Order by CCOMERID');
   DMLOG.cdsFPago.Open;

   DMLOG.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx3000 := TMant.Create(Application);
   Try
      Mtx3000.Admin := DMLOG.wAdmin;
      Mtx3000.User := DMLOG.wUsuario;
      Mtx3000.Module := DMLOG.wModulo;
      Mtx3000.OnCreateMant := Nil;
      Mtx3000.TableName := 'LOG312';
      Mtx3000.Titulo := 'Registro de Proformas';
      Mtx3000.ClientDataSet := DMLOG.cdsProforma;
      Mtx3000.DComC := DMLOG.DCOM1;
      Mtx3000.OnEdit := FADMovimientos.OnEditProf;
      Mtx3000.OnInsert := FADMovimientos.OnInsertProf;
      Mtx3000.OnDelete := FADMovimientos.OnDeleteProf;
      Mtx3000.OnShow := FADMovimientos.OnShowProf;
      Mtx3000.SectionName := 'LOGProF';
      Mtx3000.FileNameIni := '\oaLog.ini';
      Mtx3000.Filter := '';
      Mtx3000.NoVisible.Clear;
      Mtx3000.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx3000.Execute;
   Finally
   End;
End;
*)
(*
Procedure TFADMovimientos.OnInsertProf(Sender: TObject);
Var
   xSQL: String;
Begin
   DMLOG.wModo := 'A';

   xSQL := 'select * '
      + '    from LOG312 '
      + '   where 1<>1';
   DMLOG.cdsProforma.Close;
   DMLOG.cdsProforma.IndexFieldNames := '';
   DMLOG.cdsProforma.Filter := '';
   DMLOG.cdsProforma.Filtered := False;
   DMLOG.cdsProforma.DataRequest(xSQL);
   DMLOG.cdsProforma.Open;

   xSQL := 'select * '
      + '     from LOG313 '
      + '    where 1<>1';
   DMLOG.cdsDProforma.Close;
   DMLOG.cdsDProforma.IndexFieldNames := '';
   DMLOG.cdsDProforma.Filter := '';
   DMLOG.cdsDProforma.Filtered := False;
   DMLOG.cdsDProforma.DataRequest(xSQL);
   DMLOG.cdsDProforma.Open;
   DMLOG.cdsDProforma.IndexFieldNames := 'DPROFID';

   FRegProf := TFRegProf.Create(Application);
   FRegProf.dblcCIA.Enabled := True;
   FRegProf.dedNProforma.Enabled := True;
   Try
      FRegProf.ActiveMDIChild;
   Finally

   End;
End;
*)
(*
Procedure TFADMovimientos.OnEditProf(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
Begin
   xSQL := 'Select * '
      + '     from LOG312 '
      + '    where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '      and PROFID=' + QuotedStr(MantFields.FieldByName('PROFID').AsString);
   DMLOG.cdsProforma.Close;
   DMLOG.cdsProforma.IndexFieldNames := '';
   DMLOG.cdsProforma.Filter := '';
   DMLOG.cdsProforma.Filtered := False;
   DMLOG.cdsProforma.DataRequest(xSQL);
   DMLOG.cdsProforma.Open;

   If (DMLOG.cdsProforma.RecNo <= 0) And
      (DMLOG.cdsProforma.eof) Then
   Begin
      ErrorMsg('Error', 'No Existen Registros a Editar');
      exit;
   End;
   DMLOG.wModo := 'M';
   Screen.Cursor := crhourGlass;

   xSQL := 'Select * '
      + '     from LOG313 '
      + '    where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '      and PROFID=' + QuotedStr(MantFields.FieldByName('PROFID').AsString);
   DMLOG.cdsDProforma.Close;
   DMLOG.cdsDProforma.IndexFieldNames := '';
   DMLOG.cdsDProforma.Filter := '';
   DMLOG.cdsDProforma.Filtered := False;
   DMLOG.cdsDProforma.DataRequest(xSQL);
   DMLOG.cdsDProforma.Open;
   DMLOG.cdsDProforma.IndexFieldNames := 'DPROFID';

   Screen.Cursor := crDefault;

   FRegProf := TFRegProf.Create(Application);
   FRegProf.dblcCIA.Enabled := False;
   FRegProf.dedNProforma.Enabled := False;
   DMLOG.cdsProforma.Edit;
   Try
      FRegProf.ActiveMDIChild;
   Finally

   End;
End;
*)
(*
Procedure TFADMovimientos.OnDeleteProf(Sender: TObject;
   MantFields: TFields);
Var
   xSQL, sSQL, xProvDes: String;
Begin
   xSQL := 'Select * '
      + '     from LOG312 '
      + '    where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '      and PROFID=' + QuotedStr(MantFields.FieldByName('PROFID').AsString);
   DMLOG.cdsProforma.Close;
   DMLOG.cdsProforma.IndexFieldNames := '';
   DMLOG.cdsProforma.Filter := '';
   DMLOG.cdsProforma.Filtered := False;
   DMLOG.cdsProforma.DataRequest(xSQL);
   DMLOG.cdsProforma.Open;

   If (trim(DMLOG.cdsProforma.FieldbyName('PROFEST').AsString) <> 'INICIAL') Then
   Begin
      ErrorMsg(DMLOG.wModulo, 'Esta Proforma ya fue Aceptada, No es Posible Eliminarla');
      Exit;
   End;
   xProv := DMLOG.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');

   xProvDes := 'PROV=' + QuotedStr(DMLOG.cdsProforma.FieldByName('PROV').AsString) + ' AND CLAUXID=''' + xProv + '''';

   xProvDes := Trim(DMLOG.DisplayDescrip('prvTGE', 'TGE201', 'PROVDES', xProvDes, 'PROVDES'));

   If Question('Confirmar', 'Se eliminará La Proforma ' + #13 + #13 +
      DMLOG.cdsProforma.FieldByName('PROFID').AsString + '  -  Proveedor  ' +
      DMLOG.cdsProforma.FieldByName('PROV').AsString + '  ' + xProvDes +
      #13 + #13 + ' ¿Desea Continuar? ') Then
   Begin
      Screen.Cursor := crHourGlass;
      sSQL := 'Delete from LOG313 '
         + '    where PROFID = ''' + DMLOG.cdsProforma.FieldByName('PROFID').AsString + ''' '
         + '      and CIAID = ''' + DMLOG.cdsProforma.FieldByName('CIAID').AsString + '''';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
      sSQL := 'Delete from LOG326 '
         + '    where PROFID = ''' + DMLOG.cdsProforma.FieldByName('PROFID').AsString + ''' '
         + '      and CIAID = ''' + DMLOG.cdsProforma.FieldByName('CIAID').AsString + '''';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
      xBorrar := '1';
      DMLOG.cdsProforma.Delete;
      DMLOG.ControlTran(9, DMLOG.cdsProforma, 'PROFORMA');
      xBorrar := '0';
      DMLOG.ActualizaFiltro(Mtx3000, DMLOG.cdsProforma, 'E');
      Screen.Cursor := crDefault;
   End;
End;
*)

(*
Procedure TFADMovimientos.OnShowProf(Sender: TObject);
Begin
//
End;
*)

(*
Procedure ADRegistroProformas00;
Var
   xSQL: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

   DMLOG.wModo := 'A';

   xSQL := 'Select * '
      + '     from LOG312 '
      + '    where 1<>1';
   DMLOG.cdsProforma.Close;
   DMLOG.cdsProforma.IndexFieldNames := '';
   DMLOG.cdsProforma.Filter := '';
   DMLOG.cdsProforma.Filtered := False;
   DMLOG.cdsProforma.DataRequest(xSQL);
   DMLOG.cdsProforma.Open;

   xSQL := 'Select * '
      + '     from LOG313 '
      + '    where 1<>1';
   DMLOG.cdsDProforma.Close;
   DMLOG.cdsDProforma.IndexFieldNames := '';
   DMLOG.cdsDProforma.Filter := '';
   DMLOG.cdsDProforma.Filtered := False;
   DMLOG.cdsDProforma.DataRequest(xSQL);
   DMLOG.cdsDProforma.Open;
   DMLOG.cdsDProforma.IndexFieldNames := 'DPROFID';

   FRegProf := TFRegProf.Create(Application);
   FRegProf.dblcCIA.Enabled := True;
   FRegProf.dedNProforma.Enabled := True;
   Try
      FRegProf.ActiveMDIChild;
   Finally

   End;
End;
// Fin de Registro de Proformas
*)
////////////////////////////////////////////////////////////////////////
// EVALUACION DE PROFORMAS
////////////////////////////////////////////////////////////////////////
Procedure TFADMovimientos.ArtActSer(xTipo: String);
Var
   sWhere: String;
Begin
   sWhere := 'TIPOADQ=' + quotedstr(xTipo) + ' AND SCCEST=''ACEPTADO''';
   Mtx3000 := TMant.Create(Application);
   Try
      Mtx3000.Admin := DMLOG.wAdmin;
      Mtx3000.User := DMLOG.wUsuario;
      Mtx3000.Module := DMLOG.wModulo;
      Mtx3000.TableName := 'LOG302';
      Mtx3000.Filter := sWhere;
      Mtx3000.Titulo := 'Evaluación de Proformas';
      Mtx3000.DComC := DMLOG.DCOM1;
      Mtx3000.ClientDataSet := DMLOG.cdsSolCot;
      Mtx3000.OnCreateMant := Nil;
      Mtx3000.OnEdit := FADMovimientos.OnEditEvalProf;
      Mtx3000.OnDelete := Nil;
      Mtx3000.OnInsert := Nil;
      Mtx3000.OnShow := Nil;
      If xTipo = 'C' Then
         Mtx3000.SectionName := 'LOGEvalProfC'
      Else
         If xTipo = 'S' Then
            Mtx3000.SectionName := 'LOGEvalProfS'
         Else
            If xTipo = 'A' Then
               Mtx3000.SectionName := 'LOGEvalProfA';
      Mtx3000.FileNameIni := '\oaLog.ini';
      Mtx3000.MultiSelect := False;
      Mtx3000.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx3000.Execute;
   Finally
   End;
End;

Procedure TFADMovimientos.OnEditEvalProf(Sender: TObject;
   MantFields: TFields);
Var
   sSQL, SCC, CIA: String;
Begin
   xSQL := 'Select * '
      + '     from LOG302 '
      + '    where CIAID=' + quotedstr(MantFields.FieldByName('CIAID').AsString)
      + '      and SCCID=' + quotedstr(MantFields.FieldByName('SCCID').AsString);
   DMLOG.cdsSolCot.Close;
   DMLOG.cdsSolCot.IndexFieldNames := '';
   DMLOG.cdsSolCot.Filter := '';
   DMLOG.cdsSolCot.Filtered := False;
   DMLOG.cdsSolCot.DataRequest(xSQL);
   DMLOG.cdsSolCot.Open;

   If (DMLOG.cdsSolCot.RecNo <= 0) And
      (DMLOG.cdsSolCot.eof) Then
   Begin
      ErrorMsg('Error', 'No Existen Registros a Editar');
      exit;
   End;
   Screen.Cursor := crHourGlass;
   SCC := MantFields.FieldByName('SCCID').AsString;
   CIA := MantFields.FieldByName('CIAID').AsString;
   xProv := DMLOG.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');

   sSQL := 'Select DISTINCT A.CIAID, A.SCCID, B.PROFID, B.PROV, C.PROVDES, 0 TOTAL, '
      + '          case when B.PROFEVAL = ''P'' then ''Pendiente por Evaluar'' '
      + '               when B.PROFEVAL = ''A'' then ''Evaluado y Aceptado'' '
      + '               when B.PROFEVAL = ''D'' then ''Evaluado y Descartado'' END EVALU '
      + '     from LOG326 A, LOG312 B, TGE201 C '
      + '    where A.SCCID=' + QuotedStr(SCC) + ' '
      + '      and A.CIAID=' + QuotedStr(CIA) + ' '
      + '      and A.CIAID=B.CIAID '
      + '      and A.SCCID=B.SCCID '
      + '      and A.PROFID=B.PROFID '
      + '      and B.PROV=C.PROV '
      + '      and C.CLAUXID=' + QuotedStr(xProv);
   DMLOG.cdsProfxEval.Close;
   DMLOG.cdsProfxEval.DataRequest(sSQL);
   DMLOG.cdsProfxEval.Open;

   TNumericField(DMLOG.cdsProfxEval.FieldByName('TOTAL')).DisplayFormat := '###,###,##0.00';
   Screen.Cursor := crDefault;

   FEvalProforma := TFEvalProforma.Create(Application);

   If (DMLOG.cdsProfxEval.RecNo <= 0) And
      (DMLOG.cdsProfxEval.eof) Then
   Begin
      ErrorMsg('Adquisiciones', ' No Existen Proformas para esta Solicitud ');
      Exit;
   End;
   If DMLOG.cdsSolCot.fieldbyname('PROFEVAL').AsString = 'E' Then
   Begin
      FEvalProforma.Z2bbtnAcepta.Click;
      DMLOG.wNoPanel := 0;
   End
   Else
      DMLOG.wNoPanel := 1;
   Screen.Cursor := crDefault;

   FEvalProforma.dbgResultado.Selected.Clear;
   FEvalProforma.dbgResultado.Selected.Add('PROFID' + #9 + '9' + #9 + 'Proforma');
   FEvalProforma.dbgResultado.Selected.Add('PROV' + #9 + '10' + #9 + 'Proveedor');
   FEvalProforma.dbgResultado.Selected.Add('PROVDES' + #9'32' + #9 + 'Nombre');
   FEvalProforma.dbgResultado.Selected.Add('EVALU' + #9'18' + #9 + 'Evaluación');
   FEvalProforma.dbgResultado.Selected.Add('TOTAL' + #9 + '7' + #9 + 'Total');
   Try
      FEvalProforma.ActiveMDIChild;
   Finally

   End;
End;

////////////////////////////////////////////////////////////////////////
// EVALUACION DE PROFORMAS DE ALMACEN
////////////////////////////////////////////////////////////////////////
(*
Procedure ADEvalProfAlmacen;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

   FADMovimientos.ArtActSer('C');
End;
// Fin de Evaluación de Proformas de Almacén
*)

////////////////////////////////////////////////////////////////////////
// EVALUACION DE PROFORMAS DE SERVICIOS
////////////////////////////////////////////////////////////////////////
Procedure ADEvalProfServicio;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;
   FADMovimientos.ArtActSer('S');
End;
// Fin de Evaluación de Proformas de Servicios

////////////////////////////////////////////////////////////////////////
// EVALUACION DE PROFORMAS DE ACTIVOS FIJOS
////////////////////////////////////////////////////////////////////////
Procedure ADEvalProfActFijo;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;
   FADMovimientos.ArtActSer('A');
End;
// Fin de Evaluación de Proformas de Activos Fijos

////////////////////////////////////////////////////////////////////////
// REQUERIMIENTO AUTOMÁTICO POR PUNTO DE REPOSICIÓN
////////////////////////////////////////////////////////////////////////
Procedure ADReqAutxPtoReposicion;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;
   ShowMessage('Esta opción se encuentra deshabilitada, ya no hay Requisiciones');
   Exit;
{
   If Not DMLOG.wf_AccesoOpcion('3010314') Then Exit;

   Screen.Cursor := crHourGlass;
   DMLOG.FiltraTabla(DMLOG.cdsLoc, 'TGE126', 'LOCID', 'LOCID');
   DMLOG.FiltraTabla(DMLOG.cdsObra, 'TGE213', 'OBRAID', 'OBRAID');
   DMLOG.FiltraTabla(DMLOG.cdsTipSol, 'TGE173', 'TIPOADQ', 'TIPOADQ');
   DMLOG.FiltraTabla(DMLOG.cdsUMed, 'TGE130', 'UNMID', 'UNMID');

   sSQL := 'Select * from LOG308 where 1<>1';
   DMLOG.cdsReqs.Close;
   DMLOG.cdsReqs.DataRequest(sSQL);
   DMLOG.cdsReqs.Open;

   DMLOG.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx3000 := TMant.Create(Application);
   Try
      Mtx3000.Admin := DMLOG.wAdmin;
      Mtx3000.User := DMLOG.wUsuario;
      Mtx3000.Module := DMLOG.wModulo;
      Mtx3000.TableName := 'TGE205';
      Mtx3000.Titulo := 'Generación de Requisiciones por Punto de Reposición';
      Mtx3000.OnCreateMant := Nil; //PegaPanelToolReqAut;
      Mtx3000.ClientDataSet := DMLOG.cdsReqAut;
      Mtx3000.DComC := DMLOG.DCOM1;
      Mtx3000.OnEdit := Nil; //OnEditOrdC;
      Mtx3000.OnDelete := Nil; //OnDeleteOrdC;
      Mtx3000.OnInsert := FADMovimientos.OnInsertReqAut;
      Mtx3000.OnShow := Nil; //OnShowOrdC;
      Mtx3000.SectionName := 'LOGReqAut';
      Mtx3000.FileNameIni := '\oaLog.ini';
      Mtx3000.Filter := '(STKSPRE >= ARTCNTG AND STKSPRE > 0)';
      Mtx3000.NoVisible.Clear;
      Mtx3000.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx3000.Execute;
   Finally
   End;
}
End;

{
Procedure TFADMovimientos.OnInsertReqAut(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'select * from TGE205 WHERE (STKSPRE >= ARTCNTG AND STKSPRE > 0) ';
   DMLOG.cdsReqAut.Close;
   DMLOG.cdsReqAut.IndexFieldNames := '';
   DMLOG.cdsReqAut.Filter := '';
   DMLOG.cdsReqAut.Filtered := False;
   DMLOG.cdsReqAut.DataRequest(sSQL);
   DMLOG.cdsReqAut.Open;

   If (DMLOG.cdsReqAut.RecNo <= 0) And
      (DMLOG.cdsReqAut.eof) Then
   Begin
      ErrorMsg('Error', 'No Existen Articulos para Generar la Requisición ');
      Exit;
   End;

   If DMLOG.cdsReqs.State In [dsInsert, dsEdit] Then
      DMLOG.cdsReqs.Cancel;

   DMLOG.wModo := 'A';
   FRegReqs := TFRegReqs.create(Application);
   FRegReqs.xReqAut := 'S';
   FRegReqs.xValorX := 'X';
   DMLOG.cdsReqs.Insert;
   DMLOG.cdsReqs.FieldByName('RQSEST').AsString := 'INICIAL';
   DMLOG.cdsReqs.FieldByName('RQSOBS').AsString := 'Requisición Automatica Generada por Punto de Reposición';
   FRegReqs.dblcCIA.Enabled := True;
   FRegReqs.dbeNumRqs.Enabled := True;
   FRegReqs.dblcLOC.Enabled := True;
   FRegReqs.xReqAut := '';

   Try
      FRegReqs.ActiveMDIChild;
   Finally

   End;
End;
}

{
Procedure ADReqAutxPtoReposicion00; Stdcall;
Var
   sSQL: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;
   sSQL := 'Select * from TGE205 where (STKSPRE >= ARTCNTG and STKSPRE > 0) ';
   DMLOG.cdsReqAut.Close;
   DMLOG.cdsReqAut.IndexFieldNames := '';
   DMLOG.cdsReqAut.Filter := '';
   DMLOG.cdsReqAut.Filtered := False;
   DMLOG.cdsReqAut.DataRequest(sSQL);
   DMLOG.cdsReqAut.Open;

   If (DMLOG.cdsReqAut.RecNo <= 0) And
      (DMLOG.cdsReqAut.eof) Then
   Begin
      ErrorMsg('Error', 'No Existen Artículos para generar la Requisición ');
      Exit;
   End;

   If DMLOG.cdsReqs.State In [dsInsert, dsEdit] Then
      DMLOG.cdsReqs.Cancel;

   DMLOG.wModo := 'A';
   FRegReqs := TFRegReqs.create(Application);

   FRegReqs.xReqAut := 'S';
   FRegReqs.xValorX := 'X';
   DMLOG.cdsReqs.Insert;
   DMLOG.cdsReqs.FieldByName('RQSEST').AsString := 'INICIAL';
   DMLOG.cdsReqs.FieldByName('RQSOBS').AsString := 'Requisición Automática generada por Punto de Reposición';
   FRegReqs.dblcCIA.Enabled := True;
   FRegReqs.dbeNumRqs.Enabled := True;
   FRegReqs.dblcLOC.Enabled := True;
   FRegReqs.xReqAut := '';

   Try
      FRegReqs.ActiveMDIChild;
   Finally

   End;
End;
///// Fin Requerimiento Automático por Punto de Reposición
}

// Inicio HPC_201702_LOG
// Retiro de Opción NO USADA
{
////////////////////////////////////////////////////////////////////////
// TRANSFERENCIA DE REQUERIMIENTO
////////////////////////////////////////////////////////////////////////
Procedure ADTransfRequerimiento;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

   If Length(Trim(DMLOG.DisplayDescrip('prvLOG', 'TGE171', 'USERID', 'USERID=' + quotedstr(DMLOG.wUsuario), 'USERID'))) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', 'Usted No Tiene Autorización para ejecutar esta Opción' + #13 +
         ' Sólo puede ser usada por Usuario de Administración ' + #13 +
         '          del Módulo de Adquisiciones                ');
      exit;
   End;
   Try
      FTransfReq := TFTransfReq.Create(Application);
      FTransfReq.ActiveMDIChild;
   Finally
   End;
End;
}
// Fin HPC_201702_LOG

Procedure ADVerificaVersion;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;
   FADMovimientos := TFADMovimientos.Create(Application);
   If DMLOG.fg_VerificaVersion(FADMovimientos.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

End.


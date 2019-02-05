Unit LOG219;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG219
//Formulario               : FToolOC
//Fecha de Creación        :
//Autor                    : Equipo de Desarrollo
//Objetivo                 : Barra de herramientas de la Orden de Compra

// HPC_201203_LOG 24/04/2012: se implementó la funcionalidad de registrar OC desde
//                            los requerimientos de usuario en estado ACEPTADO
// HPC_201211_LOG 19/07/2012: Se implementó el reporte de Ordenes de Compra
// HPC_201304_LOG 19/08/2013: Se adiciona control de diseño en los reportes, se corrige mensaje de error de cds
//                            se verifica que el reporte sea el solicitado por Servicios Generales.
//                            Cierra O/Compra de Servicio Institucional
//                            Vuelve OC a Estado Inicial
// HPC_201405_LOG             Identación    REORDENAMIENTO DE SANGRIA
// HPC_201701_LOG 07/06/2017  Se añade consulta de Cuentas por Pagar y Pagos de la Orden de Compra

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, StdCtrls, Buttons, db, ComCtrls, ppProd, ppClass, ppReport,
   ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppPrnabl, ppCtrls, ppBands,
   ppEndUsr, ppStrtch, ppMemo, ppVar, ppViewr, ppTypes, ppParameter, Mant, MsgDlgs;

Type
   TFToolOC = Class(TForm)
      pnlComandos: TPanel;
      Panel1: TPanel;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      dtpDesde: TDateTimePicker;
      dtpHasta: TDateTimePicker;
      Z1sbPeriodo: TBitBtn;
      ppData: TppDBPipeline;
      ppReporte: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      pplblPeriodo: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLine1: TppLine;
      ppDBText9: TppDBText;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBMemo1: TppDBMemo;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppLine2: TppLine;
      sbOCDirecta: TSpeedButton;
      sbOCArticulo: TSpeedButton;
      SpeedButton4: TSpeedButton;
      Timer1: TTimer;
      GroupBox1: TGroupBox;
      btnOrdenCompraVSOrdenPago: TBitBtn;
      ppdbRptOrdenPago: TppDBPipeline;
      pprRptOrdenPago: TppReport;
      ppdRptOrdenPago: TppDesigner;
      ppHeaderBand2: TppHeaderBand;
      ppDetailBand2: TppDetailBand;
      ppFooterBand2: TppFooterBand;
      Label1: TLabel;
      btnReporteOC: TBitBtn;
      Label2: TLabel;
      ppdbRptOrdenCompra: TppDBPipeline;
      pprRptOrdenCompra: TppReport;
      ppdRptOrdenCompra: TppDesigner;
      ppParameterList1: TppParameterList;
      ppHeaderBand3: TppHeaderBand;
      ppShape13: TppShape;
      ppShape12: TppShape;
      ppShape11: TppShape;
      ppShape10: TppShape;
      ppShape9: TppShape;
      ppShape8: TppShape;
      ppShape7: TppShape;
      ppShape6: TppShape;
      ppShape5: TppShape;
      ppShape4: TppShape;
      ppShape3: TppShape;
      ppShape1: TppShape;
      ppShape2: TppShape;
      ppSystemVariable4: TppSystemVariable;
      ppLabel57: TppLabel;
      ppSystemVariable5: TppSystemVariable;
      ppLabel58: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppLabel60: TppLabel;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppSystemVariable10: TppSystemVariable;
      ppDBText13: TppDBText;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppDBText5: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText14: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppDBText37: TppDBText;
      ppLabel2: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppDBCalc3: TppDBCalc;
      ppFooterBand3: TppFooterBand;
      cbDiseno: TCheckBox;
      BtnEstadoInicial: TButton;
      BtnCerrarServicios: TButton;
      btnAtenParcial: TButton;
      sbBuscaCxP: TSpeedButton;
      Procedure Z1sbPeriodoClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormDestroy(Sender: TObject);
      Procedure ppReportePreviewFormCreate(Sender: TObject);
      Procedure sbOCDirectaClick(Sender: TObject);
//      Procedure sbOCArticuloClick(Sender: TObject);
      Procedure SpeedButton4Click(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure btnOrdenCompraVSOrdenPagoClick(Sender: TObject);
      Procedure btnReporteOCClick(Sender: TObject);
      Procedure BtnEstadoInicialClick(Sender: TObject);
      Procedure BtnCerrarServiciosClick(Sender: TObject);
      Procedure btnAtenParcialClick(Sender: TObject);
   // Inicio HPC_201701_LOG
   // 07/06/2017 Botón que muestra Provisiones por Pagar en CXP y Pagos según Solicitud de Orden de Pago
      Procedure sbBuscaCxPClick(Sender: TObject);
   // Fin HPC_201701_LOG
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolOC: TFToolOC;
   xAccesoBotones: Boolean;
// Inicio HPC_201701_LOG
// xSQL es variable global del formulario
   xSQL: String;
// Fin HPC_201701_LOG

Implementation

//Uses LOGDM1, LOG209, LOG210, LOG221, LOG228, LOG222, oaAD3100, LOG232, LOG231;
Uses LOGDM1, LOG228, oaAD3100, LOG232, LOG231;

{$R *.DFM}

Procedure TFToolOC.Z1sbPeriodoClick(Sender: TObject);
Var
   xProv, xWhere, sDesde, sHasta, sSQL: String;
   iX, iY, x10: integer;
Begin
   Screen.Cursor := crHourGlass;
   xSQL := Mtx3100.FMant.SQL;
   For iX := 0 To Length(xsql) Do
   Begin
      If copy(xSQL, iX, 5) = 'WHERE' Then
      Begin
         xWhere := copy(xSQL, iX + 6, length(xSQL));
         break;
      End;
   End;
   For iY := 0 To Length(xWhere) Do
   Begin
      If copy(xWhere, iY, 8) = 'ORDER BY' Then
      Begin
         xWhere := copy(xWhere, 1, iY - 2);
         break;
      End;
   End;

   sDesde := QuotedStr(FormatDateTime(DMLOG.wFormatFecha, dtpDesde.DateTime));
   sHasta := QuotedStr(FormatDateTime(DMLOG.wFormatFecha, dtpHasta.DateTime));

   xProv := DMLOG.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');

   sSQL := 'Select LOG304.TMONID, LOG304.ODCFREG, LOG304.ODCEST, LOG304.ODCOBS, '
      + '          LOG304.ODCUSER, LOG304.ODCTOTALG, LOG304.ODCTTIMPU, LOG304.ODCVISADOR, LOG304.TIPOADQ, LOG304.PROVDES, '
      + '          CASE WHEN LOG304.TMONID=' + QuotedStr(DMLOG.wTMonLoc) + ' THEN B.DODCIMP ELSE 0 END SOLES, '
      + '          CASE WHEN LOG304.TMONID=' + QuotedStr(DMLOG.wTMonExt) + ' THEN B.DODCIMP ELSE 0 END DOLAR, '
      + '          B.*, '
      + '          C.CPANOMES, C.TDIARID, C.CPNOREG, C.CLAUXID, C.DOCID, C.CPSERIE, CPNODOC, C.CPFRECEP, C.CPESTADO, '
      + '          C.TMONID, C.CPGRAVAD, C.CPMTOORI, C.CPMTOLOC, C.CPMTOEXT, C.CPSALORI, C.CPSALLOC, C.CPSALEXT, C.CPUSER, '
      + '          D.CIADES '
      + '     from LOG304, LOG305 B, CXP301 C, TGE101 D '
      + '    where LOG304.ODCFREG>=' + sDesde + ' '
      + '      and LOG304.ODCFREG<=' + sHasta + ' '
      + '      and LOG304.CIAID=B.CIAID '
      + '      and LOG304.ODCID=B.ODCID '
      + '      and LOG304.PROV=C.PROV(+) '
      + '      and LOG304.ODCID=C.CPOCOMP(+) '
      + '      and C.CLAUXID(+)=' + QuotedStr(xProv) + ' '
      + '      and D.CNTCONSOL=''S'' ';

   If Length(Trim(xWhere)) > 0 Then
      sSQL := sSQL + ' AND ' + xWhere + ' ORDER BY LOG304.CIAID, LOG304.ODCFREG, LOG304.ODCID'
   Else
      sSQL := sSQL + ' ORDER BY LOG304.CIAID, LOG304.ODCFREG, LOG304.ODCID';

   DMLOG.cdsReporte.Close;
   DMLOG.cdsReporte.DataRequest(sSQL);
   DMLOG.cdsReporte.Open;

   If DMLOG.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      Information('Adquisiciones', 'No Existe Información para Imprimir');
      Exit;
   End;

   ppReporte.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\Analisis_OC.rtm';
   ppReporte.Template.LoadFromFile;

   pplblPeriodo.Caption := 'Del ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date);

   Screen.Cursor := crDefault;
  //ppDiseno.Show;
   ppReporte.Print;
   ppReporte.Stop;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;

End;

Procedure TFToolOC.FormCreate(Sender: TObject);
Begin
   ppData.DataSource := DMLOG.dsReporte;
End;

Procedure TFToolOC.FormDestroy(Sender: TObject);
Begin
   ppData.DataSource := Nil;
End;

Procedure TFToolOC.ppReportePreviewFormCreate(Sender: TObject);
Begin
   ppReporte.PreviewForm.ClientHeight := 500;
   ppReporte.PreviewForm.ClientWidth := 650;
   tppviewer(ppReporte.PreviewForm.Viewer).zoomSetting := zspageWidth;
End;

Procedure TFToolOC.sbOCDirectaClick(Sender: TObject);
Begin
   Try
      DMLOG.cdsArtPendX.close;
      DMLOG.cdsDOrdComp.close;
      DMLOG.cdsFPago.close;
      DMLOG.cdsgrab.close;
      DMLOG.cdsLEntrega.close;
      DMLOG.cdsSQL.close;

      DMLOG.cdsArti.Close;
      DMLOG.cdsArti.DataRequest('Select ARTID, ARTDES, ARTPCG, UNMIDG, CIAID from TGE205');
      DMLOG.cdsArti.FetchOnDemand := False;
      DMLOG.cdsArti.PacketRecords := 20;
      DMLOG.cdsArti.FetchOnDemand := True;
      DMLOG.cdsArti.IndexFieldNames := 'ARTID';
      DMLOG.cdsArti.Open;

      xSQL := 'Select * from LOG304 '
         + '    where 1<>1';
      DMLOG.cdsOrdComp.Close;
      DMLOG.cdsOrdComp.IndexFieldNames := '';
      DMLOG.cdsOrdComp.Filter := '';
      DMLOG.cdsOrdComp.Filtered := False;
      DMLOG.cdsOrdComp.DataRequest(xSQL);
      DMLOG.cdsOrdComp.Open;

      If DMLOG.cdsOrdComp.State In [dsInsert, dsEdit] Then
      Begin
         DMLOG.cdsOrdComp.Cancel;
      End;
      FOrdendeCompra.wTipoOC := 'xOCDirecta';
      DMLOG.wModo := 'A';
      FRegOrdCD := TFRegOrdCD.create(self);
      FRegOrdCD.pnlCabecera.enabled := true;
      FRegOrdCD.ActiveMDIChild;
   Finally
   End;
End;

Procedure TFToolOC.SpeedButton4Click(Sender: TObject);
Begin
   DMLOG.cdsArtPendX.close;
   DMLOG.cdsDOrdComp.close;
   DMLOG.cdsFPago.close;
   DMLOG.cdsgrab.close;
   DMLOG.cdsLEntrega.close;
   DMLOG.cdsSQL.close;
   xSQL := 'Select * '
      + '     from LOG304 '
      + '    where 1<>1';
   DMLOG.cdsOrdComp.Close;
   DMLOG.cdsOrdComp.IndexFieldNames := '';
   DMLOG.cdsOrdComp.Filter := '';
   DMLOG.cdsOrdComp.Filtered := False;
   DMLOG.cdsOrdComp.DataRequest(xSQL);
   DMLOG.cdsOrdComp.Open;

   If DMLOG.cdsOrdComp.State In [dsInsert, dsEdit] Then
   Begin
      DMLOG.cdsOrdComp.Cancel;
   End;
   FOrdendeCompra.wTipoOC := 'xRequerimiento';
   DMLOG.wModo := 'A';
   Try
      FRegOrdCD := TFRegOrdCD.create(self);
      FRegOrdCD.pnlCabecera.enabled := true;
      FRegOrdCD.ActiveMDIChild;
   Finally
   End;
End;

Procedure TFToolOC.Timer1Timer(Sender: TObject);
Begin
   cbDiseno.Visible := False;
   cbDiseno.checked := (DMLOG.wAdmin = 'G');
   If (DMLOG.wAdmin = 'G') Or (DMLOG.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMLOG.AccesosUsuariosR(DMLOG.wModulo, DMLOG.wUsuario, '2', FToolOC);
      xAccesoBotones := True;
   End;
   sbBuscaCxP.Visible := True;
   Timer1.Destroy;
End;

Procedure TFToolOC.btnOrdenCompraVSOrdenPagoClick(Sender: TObject);
Var
// Inicio HPC_201701_LOG
// 07/06/2017 - xSQL es variable global del formulario
//   xSQL, xsFiltro: String;
   xsFiltro: String;
// Fin HPC_201701_LOG
//
   xsFiltroTexto1, xsFiltroTexto2, xsFiltroTexto3, xsFiltroTexto4: String;
   xsFiltroTexto5, xsFiltroTexto6, xsFiltroTexto7, xsFiltroTexto8: String;
   xnContador: integer;
Begin
   xsFiltroTexto1 := ' ';
   xsFiltroTexto2 := ' ';
   xsFiltroTexto3 := ' ';
   xsFiltroTexto4 := ' ';
   xsFiltroTexto5 := ' ';
   xsFiltroTexto6 := ' ';
   xsFiltroTexto7 := ' ';
   xsFiltroTexto8 := ' ';
   xsFiltro := '';
   For xnContador := 0 To Mtx3100.FMant.lbFiltroReal.Count - 1 Do
   Begin
      If length(trim(xsFiltro)) = 0 Then
      Begin
         xsFiltro := Mtx3100.FMant.lbFiltroReal.items[xnContador];
      End
      Else
      Begin
         xsFiltro := xsFiltro + ' and ' + Mtx3100.FMant.lbFiltroReal.items[xnContador];
      End;
      If xnContador = 0 Then
         xsFiltroTexto1 := Mtx3100.FMant.lbFiltro.items[xnContador]
      Else
         If xnContador = 1 Then
            xsFiltroTexto2 := Mtx3100.FMant.lbFiltro.items[xnContador]
         Else
            If xnContador = 2 Then
               xsFiltroTexto3 := Mtx3100.FMant.lbFiltro.items[xnContador]
            Else
               If xnContador = 3 Then
                  xsFiltroTexto4 := Mtx3100.FMant.lbFiltro.items[xnContador]
               Else
                  If xnContador = 4 Then
                     xsFiltroTexto5 := Mtx3100.FMant.lbFiltro.items[xnContador]
                  Else
                     If xnContador = 5 Then
                        xsFiltroTexto6 := Mtx3100.FMant.lbFiltro.items[xnContador]
                     Else
                        If xnContador = 6 Then
                           xsFiltroTexto7 := Mtx3100.FMant.lbFiltro.items[xnContador]
                        Else
                           If xnContador = 7 Then xsFiltroTexto8 := Mtx3100.FMant.lbFiltro.items[xnContador];
   End;
   If length(trim(xsFiltro)) > 0 Then
   Begin
      xsFiltro := ' AND ' + xsFiltro;
   End;
   xSQL := ' Select LOG304.CIAID OC_COMPANIA , '
      + '          (Select TGE101.CIADES '
      + '             from TGE101 '
      + '            where TGE101.CIAID = LOG304.CIAID) OC_COMPANIA_DES, '
      + '           LOG304.ODCID OC_NUMERO, '
      + '           LOG304.ODCTOTALG OC_TOTAL, '
      + '           LOG304.ODCTOTALG - NVL(LOG304.ORDPAGTOT,0) OC_PENDIENTE_ORDPAGO, '
      + '           LOG304.ORDPAGEST OC_ESTADO_ORDPAGO, '
      + '           LOG304.PROV PROVEEDOR, '
      + '           LOG304.PROVDES PROVEEDOR_DES, '
      + '           LOG130.NUMORDPAG OP_NUMERO, '
      + '           LOG130.CPCIAID OP_COMPANIA, '
      + '          (Select TGE101.CIADES '
      + '             from TGE101 '
      + '            where TGE101.CIAID = LOG130.CPCIAID) OP_COMPANIA_DES, '
      + '           LOG130.DOCID OP_DOCUMENTO,  '
      + '          (Select TGE110.DOCDES '
      + '             from TGE110 '
      + '            where TGE110.DOCID = LOG130.DOCID '
      + '              and TGE110.DOCMOD IN (' + QuotedStr('CXP') + ',' + QuotedStr('LOG') + ')) OP_DOCUMENTO_DES, '
      + '           LOG130.CPSERIE OP_SERIE, '
      + '           LOG130.CPNODOC OP_NUMERO_DOC, '
      + '           LOG130.TMONID OP_MONEDA, '
      + '           LOG130.CPFEMIS OP_EMISION, '
      + '           LOG130.CPFRECEP OP_RECEPCION, '
      + '           LOG130.TOTAL OP_TOTAL, '
      + '           LOG130.CPESTTRA OP_ESTADO, '
      + '           CXP301.CPMTOORI CXP_MONTO, '
      + '           CXP301.CPPAGORI CXP_PAGADO, '
      + '           CXP301.CPSALORI CXP_SALDO , '
      + QuotedStr(DMLOG.wUsuario) + ' USUARIO_IMPRIME, '
      + QuotedStr(xsFiltroTexto1) + ' FILTRO1, '
      + QuotedStr(xsFiltroTexto2) + ' FILTRO2, '
      + QuotedStr(xsFiltroTexto3) + ' FILTRO3, '
      + QuotedStr(xsFiltroTexto4) + ' FILTRO4, '
      + QuotedStr(xsFiltroTexto5) + ' FILTRO5, '
      + QuotedStr(xsFiltroTexto6) + ' FILTRO6, '
      + QuotedStr(xsFiltroTexto7) + ' FILTRO7, '
      + QuotedStr(xsFiltroTexto8) + ' FILTRO8 '
      + '      from LOG130, LOG304 ,CXP301  '
      + '     where LOG130.ODCCIAID = LOG304.CIAID '
      + '       and LOG130.ODCID = LOG304.ODCID  '
      + '       and LOG130.CPESTTRA <> ' + QuotedStr('ANULADO')
      + '       and LOG130.CPCIAID = CXP301.CIAID(+) '
      + '       and LOG130.PROV = CXP301.PROV(+) '
      + '       and LOG130.DOCID = CXP301.DOCID(+) '
      + '       and LOG130.CPSERIE = CXP301.CPSERIE(+) '
      + '       and LOG130.CPNODOC = CXP301.CPNODOC(+)  ' + xsFiltro
      + '    Union all '
      + '    Select LOG304.CIAID OC_COMPANIA , '
      + '          (Select TGE101.CIADES '
      + '             from TGE101 '
      + '            where TGE101.CIAID = LOG304.CIAID) OC_COMPANIA_DES, '
      + '           LOG304.ODCID OC_NUMERO, '
      + '           LOG304.ODCTOTALG OC_TOTAL, '
      + '           LOG304.ODCTOTALG - NVL(LOG304.ORDPAGTOT,0) OC_PENDIENTE_ORDPAGO, '
      + '           LOG304.ORDPAGEST OC_ESTADO_ORDPAGO, '
      + '           LOG304.PROV PROVEEDOR, '
      + '           LOG304.PROVDES PROVEEDOR_DES, '
      + '           null OP_NUMERO,  '
      + '           null OP_COMPANIA,  '
      + '           null OP_COMPANIA_DES, '
      + '           null OP_DOCUMENTO,  '
      + '           null OP_DOCUMENTO_DES , '
      + '           null OP_SERIE, '
      + '           null OP_NUMERO_DOC, '
      + '           null OP_MONEDA, '
      + '           null OP_EMISION, '
      + '           null OP_RECEPCION, '
      + '           null OP_TOTAL, '
      + '           null OP_ESTADO, '
      + '           null CXP_MONTO, '
      + '           null CXP_PAGADO, '
      + '           null CXP_SALDO , '
      + QuotedStr(DMLOG.wUsuario) + ' USUARIO_IMPRIME, '
      + QuotedStr(xsFiltroTexto1) + ' FILTRO1, '
      + QuotedStr(xsFiltroTexto2) + ' FILTRO2, '
      + QuotedStr(xsFiltroTexto3) + ' FILTRO3, '
      + QuotedStr(xsFiltroTexto4) + ' FILTRO4, '
      + QuotedStr(xsFiltroTexto5) + ' FILTRO5, '
      + QuotedStr(xsFiltroTexto6) + ' FILTRO6, '
      + QuotedStr(xsFiltroTexto7) + ' FILTRO7, '
      + QuotedStr(xsFiltroTexto8) + ' FILTRO8 '
      + '      from LOG304 '
      + '     where not exists (Select 1 from LOG130 '
      + '                        where LOG130.ODCCIAID = LOG304.CIAID '
      + '                          and LOG130.ODCID = LOG304.ODCID )'
      + xsFiltro
      + '    Order by OC_COMPANIA, OC_NUMERO, OP_NUMERO, OP_NUMERO_DOC ';

   ppdbRptOrdenCompra.DataSource := Nil;
   ppdbRptOrdenPago.DataSource := Nil;

   DMLOG.cdsReporte.Close;
   DMLOG.cdsReporte.DataRequest(xSQL);
   DMLOG.cdsReporte.Open;

   If DMLOG.cdsReporte.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppdbRptOrdenPago.DataSource := DMLOG.dsReporte;
   pprRptOrdenPago.DataPipeline := ppdbRptOrdenPago;

   pprRptOrdenPago.Template.FileName := wRutaRpt + '\RptOrdenPago.rtm';
   pprRptOrdenPago.Template.LoadFromFile;

   If cbDiseno.checked Then
   Begin
   // para mostrar el diseñador del reporte
      ppdRptOrdenPago.Report := pprRptOrdenPago;
      ppdRptOrdenPago.ShowModal();
   End
   Else
   Begin
      pprRptOrdenPago.Print;
      pprRptOrdenPago.Stop;
   End;
End;

Procedure TFToolOC.btnReporteOCClick(Sender: TObject);
Var
// Inicio HPC_201701_LOG
// 07/06/2017 - xSQL es variable global del formulario
//   xSQL, xsFiltro: String;
   xsFiltro: String;
// Fin HPC_201701_LOG
   xsFiltroTexto1, xsFiltroTexto2, xsFiltroTexto3, xsFiltroTexto4: String;
   xsFiltroTexto5, xsFiltroTexto6, xsFiltroTexto7, xsFiltroTexto8: String;
   xsFiltroUsuario: String;
   xnContador: integer;
Begin
   xsFiltroUsuario := '';
   xsFiltroTexto1 := ' ';
   xsFiltroTexto2 := ' ';
   xsFiltroTexto3 := ' ';
   xsFiltroTexto4 := ' ';
   xsFiltroTexto5 := ' ';
   xsFiltroTexto6 := ' ';
   xsFiltroTexto7 := ' ';
   xsFiltroTexto8 := ' ';
   xsFiltro := '';
   For xnContador := 0 To Mtx3100.FMant.lbFiltroReal.Count - 1 Do
   Begin
      If length(trim(xsFiltro)) = 0 Then
      Begin
         xsFiltro := Mtx3100.FMant.lbFiltroReal.items[xnContador];
      End
      Else
      Begin
         xsFiltro := xsFiltro + ' and ' + Mtx3100.FMant.lbFiltroReal.items[xnContador];
      End;
      If xnContador = 0 Then
         xsFiltroTexto1 := Mtx3100.FMant.lbFiltro.items[xnContador]
      Else
         If xnContador = 1 Then
            xsFiltroTexto2 := Mtx3100.FMant.lbFiltro.items[xnContador]
         Else
            If xnContador = 2 Then
               xsFiltroTexto3 := Mtx3100.FMant.lbFiltro.items[xnContador]
            Else
               If xnContador = 3 Then
                  xsFiltroTexto4 := Mtx3100.FMant.lbFiltro.items[xnContador]
               Else
                  If xnContador = 4 Then
                     xsFiltroTexto5 := Mtx3100.FMant.lbFiltro.items[xnContador]
                  Else
                     If xnContador = 5 Then
                        xsFiltroTexto6 := Mtx3100.FMant.lbFiltro.items[xnContador]
                     Else
                        If xnContador = 6 Then
                           xsFiltroTexto7 := Mtx3100.FMant.lbFiltro.items[xnContador]
                        Else
                           If xnContador = 7 Then xsFiltroTexto8 := Mtx3100.FMant.lbFiltro.items[xnContador];

   End;
   If length(trim(xsFiltro)) > 0 Then
   Begin
      xsFiltro := ' AND ' + xsFiltro;
   End;
   If Length(Mtx3100.Filter) > 0 Then
   Begin
      xsFiltroUsuario := ' AND ' + Mtx3100.Filter;
   End;
   xSQL := 'Select LOG304.CIAID COMPANIAID, '
      + '          LOG304.ODCFEMI FECHA, '
      + '          LOG304.ODCID NUMOC, '
      + '          LOG304.PROV PROVEEDORID, '
      + '          LOG304.PROVDES PROVEEDORDES, '
      + '          LOG304.TMONID MONEDA, '
      + '          (SELECT TGE103.TMONABR FROM TGE103 WHERE TGE103.TMONID = LOG304.TMONID ) MONEDADES, '
      + '          LOG304.ODCTCAMB TIPOCAMBIO, '
      + '          LOG304.ODCEST ESTADO,  '
      + '          LOG304.ODCOBS OBSERVACION, '
      + '          LOG304.ODCUSER USUARIO,  '
      + '          LOG304.ODCTOTALG TOTAL,  '
      + '          LOG304.TIPOADQ TIPOADQ,  '
      + '          LOG304.ODCDEPURA USUARIODEPURA, '
      + '          LOG304.ODCANULA USUARIOANULA,  '
      + '          LOG304.OCANUFREG FECHAANULA, '
      + '          LOG304.ORDPAGTOT TOTALORDENPAGO, '
      + '          LOG304.ORDPAGPEN PENDIENTEORDENPAGO, '
      + '          LOG304.ORDPAGEST ESTADOORDENPAGO, '
      + QuotedStr(DMLOG.wUsuario) + ' USUARIO_IMPRIME, '
      + QuotedStr(xsFiltroTexto1) + ' FILTRO1, '
      + QuotedStr(xsFiltroTexto2) + ' FILTRO2, '
      + QuotedStr(xsFiltroTexto3) + ' FILTRO3, '
      + QuotedStr(xsFiltroTexto4) + ' FILTRO4, '
      + QuotedStr(xsFiltroTexto5) + ' FILTRO5, '
      + QuotedStr(xsFiltroTexto6) + ' FILTRO6, '
      + QuotedStr(xsFiltroTexto7) + ' FILTRO7, '
      + QuotedStr(xsFiltroTexto8) + ' FILTRO8 '
      + '     from LOG304  '
      + '    where 1 = 1 ' + xsFiltroUsuario + xsFiltro
      + '    order by LOG304.CIAID, LOG304.ODCID';
   ppdbRptOrdenCompra.DataSource := Nil;
   ppdbRptOrdenPago.DataSource := Nil;

   DMLOG.cdsReporte.Close;
   DMLOG.cdsReporte.DataRequest(xSQL);
   DMLOG.cdsReporte.Open;

   If DMLOG.cdsReporte.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppdbRptOrdenCompra.DataSource := DMLOG.dsReporte;
   pprRptOrdenCompra.DataPipeline := ppdbRptOrdenCompra;

   pprRptOrdenCompra.Template.FileName := wRutaRpt + '\RptOrdenCompra.rtm';
   pprRptOrdenCompra.Template.LoadFromFile;

   If cbDiseno.checked Then
   Begin
      ppdRptOrdenCompra.Report := pprRptOrdenCompra;
      ppdRptOrdenCompra.ShowModal();
   End
   Else
   Begin
      pprRptOrdenCompra.Print;
      pprRptOrdenCompra.Stop;
   End;
End;

Procedure TFToolOC.BtnEstadoInicialClick(Sender: TObject);
// Inicio HPC_201701_LOG
// 07/06/2017 - xSQL es variable global del formulario
{
Var
   xSQL: String;
}
// Fin HPC_201701_LOG
Begin
   DMLOG.cdsOrdComp.Data := Mtx3100.FMant.cds2.Data;
   DMLOG.cdsOrdComp.GotoCurrent(Mtx3100.FMant.cds2);

   If (DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString = 'INICIAL') And
      (DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString = '') Then
   Begin
      ShowMessage('La OC ya se encuentra en estado INICIAL');
      Exit;
   End;

   If (DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString = 'ACEPTADO') Or
      (DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString = 'VISADO') Or
      ((DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString = 'INICIAL') And
      (DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString <> '')) Then
   Begin
      If MessageDlg('Retornará al estado INICIAL a la OC. ' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString) + ' ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         xSQL := 'Update Log304 '
            + '      set ODCEST=''INICIAL'', ODCVISADOR=NULL '
            + '    Where CIAID=' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
            + '      And ODCID=' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);
         DMLOG.DCOM1.AppServer.EjecutaSQL(XSQL);
         Mtx3100.FMant.cds2.Edit;
         Mtx3100.FMant.cds2.FieldByName('ODCEST').AsString := 'INICIAL';
         Mtx3100.FMant.cds2.Post;
         ShowMessage('Ok');
      End;
   End
   Else
   Begin
      ShowMessage('Sólo puede pasar a estado INICIAL OC con estado ACEPTADO o VISADO');
      Exit;
   End;
End;

Procedure TFToolOC.BtnCerrarServiciosClick(Sender: TObject);
Begin
   DMLOG.cdsOrdComp.Data := Mtx3100.FMant.cds2.Data;
   DMLOG.cdsOrdComp.GotoCurrent(Mtx3100.FMant.cds2);

   If DMLOG.cdsOrdComp.FieldByName('TIPOADQ').AsString <> 'S' Then
   Begin
      ShowMessage('Sólo puede poner como ATENDIDO OC de SERVICIOS');
      Exit;
   End;

   If DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString <> 'ACEPTADO' Then
   Begin
      ShowMessage('La OC debe estar en estado ACEPTADO');
      Exit;
   End;

   If MessageDlg('Esta seguro de pasar como ATENDIDO  la OC. ' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString) + ' ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      xSQL := ' Update Log304 '
         + '       set ODCEST=''ATENDIDO'' '
         + '     Where CIAID=' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
         + '       And ODCID=' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);
      DMLOG.DCOM1.AppServer.EjecutaSQL(XSQL);
      Mtx3100.FMant.cds2.Edit;
      Mtx3100.FMant.cds2.FieldByName('ODCEST').AsString := 'ATENDIDO';
      Mtx3100.FMant.cds2.Post;
      ShowMessage('Ok');
   End;
End;

Procedure TFToolOC.btnAtenParcialClick(Sender: TObject);
// Inicio HPC_201701_LOG
// 07/06/2017 - xSQL es variable global del formulario
{
Var
   xSQL: String;
}
// Fin HPC_201701_LOG
Begin
   DMLOG.cdsOrdComp.Data := Mtx3100.FMant.cds2.Data;
   DMLOG.cdsOrdComp.GotoCurrent(Mtx3100.FMant.cds2);

   If DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString = 'INICIAL' Then
   Begin
      ShowMessage('La OC ya se encuentra en estado INICIAL');
      Exit;
   End;

   If DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString = 'ATENDIDO' Then
   Begin
      If MessageDlg('Pondrá en ATENCIÓN PARCIAL la OC. ' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString) + ' ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         xSQL := 'Update Log304 '
            + '      set ODCEST=''PARCIAL'' '
            + '    where CIAID=' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
            + '      and ODCID=' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);
         DMLOG.DCOM1.AppServer.EjecutaSQL(XSQL);
         Mtx3100.FMant.cds2.Edit;
         Mtx3100.FMant.cds2.FieldByName('ODCEST').AsString := 'PARCIAL';
         Mtx3100.FMant.cds2.Post;
         ShowMessage('Ok');
      End;
   End
   Else
   Begin
      ShowMessage('Sólo puede pasar a estado PARCIAL OC con estado ATENDIDO');
      Exit;
   End;
End;

// Inicio HPC_201701_LOG
// 07/06/2017 Botón que muestra Provisiones por Pagar en CXP y Pagos según Solicitud de Orden de Pago

Procedure TFToolOC.sbBuscaCxPClick(Sender: TObject);
Begin
   Try
   // LOG231
      FConsultaCXP := TFConsultaCXP.create(self);
      FConsultaCXP.sHOWmODAL;
   Finally
   End;
End;
// Fin HPC_201701_LOG

End.


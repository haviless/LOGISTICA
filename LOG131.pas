Unit LOG131;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG131
//Formulario               : FOrdenPago_CerrarOC
//Fecha de Creación        : 22/06/2011
//Autor                    : Abelardo Sulca Palomino
//Objetivo                 : Esta ventana cierra la Orden de Compra para que ya no
//                         permita el registro de más Ordenes de Pago
//                         En esta ventana el estado de la Orden de Compra pasa
//                         a estado CERRADO y se inserta en el detalle un registro
//                         por el total pendiente

//Actualizaciones:
//HPC_201106_LOG 08/11/2011: Al cerrar la Orden de Compra se generará una cabecera
//                           en la tabla LOG131 y un detalle en la tabla LOG130.

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ppEndUsr, ppBands, ppCache, ppClass, ppProd, ppReport, ppComm,
   ppRelatv, ppDB, ppDBPipe, ExtCtrls, StdCtrls, Buttons, DBCtrls,
   wwdbdatetimepicker, Mask, wwdbedit, Wwdbdlg, wwdblook;

Type
   TFOrdenPago_CerrarOC = Class(TForm)
      lblCia: TLabel;
      lblNro: TLabel;
      lblProv: TLabel;
      lblTMon: TLabel;
      lblTCam: TLabel;
      lblFEmi: TLabel;
      lblTCom: TLabel;
      Label15: TLabel;
      dblcCompania: TwwDBLookupCombo;
      dblcCompania_des: TEdit;
      dblcdProv: TwwDBLookupComboDlg;
      dblcdProv_des: TwwDBEdit;
      dblcTMoneda: TwwDBLookupCombo;
      dblcTMoneda_des: TEdit;
      dbeTCambio: TwwDBEdit;
      dblcTipoCompra: TwwDBLookupCombo;
      dblcTipoCompra_des: TEdit;
      dbdtpFEmi: TwwDBDateTimePicker;
      dbmObs: TDBMemo;
      dblcdOrdenCompra: TwwDBLookupComboDlg;
      Z2bbtnImprime: TBitBtn;
      pnlEstado: TPanel;
      Label16: TLabel;
      dbeEstado: TwwDBEdit;
      Z2bbtnAcepta: TBitBtn;
      ppDBPipeline_OrdenPago: TppDBPipeline;
      ppReport_OrdenPago: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppDesigner_OrdenPago: TppDesigner;
      dbdtp_FechaCierre: TwwDBDateTimePicker;
      Label1: TLabel;
      dbm_ObservacionCierre: TDBMemo;
      Label7: TLabel;
      dbePendiente: TwwDBEdit;
      Label19: TLabel;
      dbeTotalOC: TwwDBEdit;
      Label12: TLabel;
      Procedure dblcCompaniaExit(Sender: TObject);
      Procedure dblcdProvExit(Sender: TObject);
      Procedure dblcdOrdenCompraExit(Sender: TObject);
      Procedure Z2bbtnImprimeClick(Sender: TObject);
      Procedure dblcTMonedaExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormShow(Sender: TObject);
      Procedure Z2bbtnAceptaClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
    { Private declarations }
      Procedure AsignaDataSource;
      Procedure RecuperaCabecera(ps_OCCiaId, ps_NumOC: String);
      Procedure Asignalookup;
   Public
    { Public declarations }
      xCia, xNumOrdenCompra: String;
   End;

Var
   FOrdenPago_CerrarOC: TFOrdenPago_CerrarOC;

Implementation
Uses LOGDM1, oaAD3100;
{$R *.dfm}

Procedure TFOrdenPago_CerrarOC.Asignalookup;

Begin

   //Compañia
   dblcCompania.Selected.Clear;
   dblcCompania.Selected.Add('CIAID'#9'2'#9'CIA'#9'F');
   dblcCompania.Selected.Add('CIADES'#9'25'#9'Descripci'#243'n'#9'F');
   dblcCompania.LookupField := 'CIAID';
   dblcCompania.LookupTable := DMLOG.cdsCIA;
   //Proveedor
   If DMLOG.cdsProv.Active = False Then
      DMLOG.FiltraTabla(DMLOG.cdsProv, 'TGE201', 'PROV', 'PROV');
   dblcdProv.Selected.Clear;
   dblcdProv.Selected.Add('PROV'#9'8'#9'Prov'#9'F');
   dblcdProv.Selected.Add('PROVDES'#9'50'#9'Descripci'#243'n'#9'F');
   dblcdProv.LookupField := 'PROV';
   dblcdProv.LookupTable := DMLOG.cdsProv;
   //Orden de Compra
   xSQL := 'SELECT * FROM  LOG304 WHERE 1 = 2';
   DMLOG.cdsQry6.Close;
   DMLOG.cdsQry6.DataRequest(xSQL);
   DMLOG.cdsQry6.Open;
   dblcdOrdenCompra.Selected.Clear;
   dblcdOrdenCompra.Selected.Add('ODCID'#9'8'#9'O/C'#9'F');
   dblcdOrdenCompra.Selected.Add('ODCFEMI'#9'8'#9'Fecha'#9'F');
   dblcdOrdenCompra.Selected.Add('TMONID'#9'5'#9'M'#9'F');
   dblcdOrdenCompra.Selected.Add('ODCOBS'#9'40'#9'Observacion'#9'F');
   dblcdOrdenCompra.Selected.Add('ODCTOTALG'#9'8'#9'Total'#9'F');
   dblcdOrdenCompra.LookupField := 'ODCID';
   dblcdOrdenCompra.LookupTable := DMLOG.cdsQry6;

End;

Procedure TFOrdenPago_CerrarOC.AsignaDataSource;
Begin
   xSQL := 'SELECT * FROM  LOG304 WHERE  1=2';
   DMLOG.cdsOrdComp.Close;
   DMLOG.cdsOrdComp.DataRequest(xSQL);
   DMLOG.cdsOrdComp.Open;

   dblcCompania.DataSource := DMLOG.dsOrdComp;
   dblcCompania.DataField := 'CIAID';
   dblcdProv.DataSource := DMLOG.dsOrdComp;
   dblcdProv.DataField := 'PROV';
   dblcdProv_des.DataSource := DMLOG.dsOrdComp;
   dblcdProv_des.DataField := 'PROVDES';

   dblcdOrdenCompra.DataSource := DMLOG.dsOrdComp;
   dblcdOrdenCompra.DataField := 'ODCID';

   dblcTMoneda.DataSource := DMLOG.dsOrdComp;
   dblcTMoneda.DataField := 'TMONID';
   dbeTCambio.DataSource := DMLOG.dsOrdComp;
   dbeTCambio.DataField := 'ODCTCAMB';
   dblcTipoCompra.DataSource := DMLOG.dsOrdComp;
   dblcTipoCompra.DataField := 'TIPOADQ';
   dbdtpFEmi.DataSource := DMLOG.dsOrdComp;
   dbdtpFEmi.DataField := 'ODCFEMI';

   dbmObs.DataSource := DMLOG.dsOrdComp;
   dbmObs.DataField := 'ODCOBS';
   dbeTotalOC.DataSource := DMLOG.dsOrdComp;
   dbeTotalOC.DataField := 'ODCTOTALG';

   dbeEstado.DataSource := DMLOG.dsOrdComp;
   dbeEstado.DataField := 'ORDPAGEST';

   //DataSource en el Panel
   xSQL := 'SELECT * FROM  LOG130 WHERE  1=2';
   DMLOG.cdsQry5.Close;
   DMLOG.cdsQry5.DataRequest(xSQL);
   DMLOG.cdsQry5.Open;

   dbm_ObservacionCierre.DataSource := DMLOG.dsQry5;
   dbm_ObservacionCierre.DataField := 'CPOBS';
End;

Procedure TFOrdenPago_CerrarOC.dblcCompaniaExit(Sender: TObject);
Begin
   xSQL := 'CIAID=' + quotedstr(dblcCompania.Text);
   If dblcCompania.Text = '' Then
   Begin
      dblcCompania_des.Text := '';
      exit;
   End;
   If dblcCompania.text <> '' Then
   Begin
      dblcCompania_des.text := DMLOG.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', xSQL, 'CIADES');
      If dblcCompania_des.text = '' Then
      Begin
         showmessage('Ingrese una Compañía válida');
         dblcCompania.SetFocus;
         exit;
      End;
   End;
End;

Procedure TFOrdenPago_CerrarOC.dblcdProvExit(Sender: TObject);
Begin
   xSQL := 'PROV=' + quotedstr(dblcdProv.Text);
   If dblcdProv.Text = '' Then
   Begin
      dblcdProv_des.Text := '';
      exit;
   End;
   If dblcdProv.text <> '' Then
   Begin
      dblcdProv_des.text := DMLOG.DisplayDescrip('prvTGE', 'TGE201', 'PROVDES', xSQL, 'PROVDES');
      If dblcdProv_des.text = '' Then
      Begin
         showmessage('Ingrese una Compañía válida');
         dblcdProv.SetFocus;
         exit;
      End;

      xSQL := 'Select * '
         + '     from LOG304 '
         + '    where CIAID = ' + QuotedStr(dblcCompania.Text)
         + '      and NVL(ORDPAGEST,' + QuotedStr('X') + ') <>' + QuotedStr('COMPLETADO')
         + '      and ODCEST IN (' + QuotedStr('ATENDIDO') + ',' + QuotedStr('ACEPTADO') + ',' + QuotedStr('PARCIAL') + ')'
         + '      and PROV = ' + QuotedStr(dblcdProv.Text);
      DMLOG.cdsQry6.Close;
      DMLOG.cdsQry6.DataRequest(xSQL);
      DMLOG.cdsQry6.Open;
      If DMLOG.cdsQry6.RecordCount = 0 Then
      Begin
         ShowMessage('No se encontraró Ordenes de Compra para el Proveedor Seleccionado');
         Exit;
      End;
   End;
End;

Procedure TFOrdenPago_CerrarOC.dblcdOrdenCompraExit(Sender: TObject);
Begin
   If dblcdOrdenCompra.Text = '' Then
   Begin
      Exit;
   End;
   RecuperaCabecera(dblcCompania.Text, dblcdOrdenCompra.Text);
End;

Procedure TFOrdenPago_CerrarOC.RecuperaCabecera(ps_OCCiaId, ps_NumOC: String);
Begin
   xSQL := 'Select * '
      + '     from LOG304 '
      + '    where CIAID = ' + QuotedStr(ps_OCCiaId)
      + '      and ODCID = ' + QuotedStr(ps_NumOC);
   DMLOG.cdsOrdComp.Close;
   DMLOG.cdsOrdComp.DataRequest(xSQL);
   DMLOG.cdsOrdComp.Open;
   If DMLOG.cdsOrdComp.RecordCount = 0 Then
   Begin
      ShowMessage('No se recuperó datos de la Orden de Compra');
      Exit;
   End;

   If DMLOG.cdsOrdComp.FieldbyName('ORDPAGEST').AsString = 'INICIAL' Then
   Begin
      Z2bbtnAcepta.Enabled := True;
   End
   Else
   Begin
      Z2bbtnAcepta.Enabled := False;
   End;
   If DMLOG.cdsOrdComp.FieldbyName('ORDPAGEST').AsString = 'COMPLETADO' Then
   Begin
      dbeEstado.Font.Color := clGreen;
   End
   Else
      If DMLOG.cdsOrdComp.FieldbyName('ORDPAGEST').AsString = 'CERRADO' Then
      Begin
         dbeEstado.Font.Color := clBlue;
      End
      Else
      Begin
         dbeEstado.Font.Color := clBlack;
      End;

   dblcCompaniaExit(dblcCompania);
   dblcTMonedaExit(dblcTMoneda);

   If DMLOG.cdsOrdComp.FieldbyName('ORDPAGTOT').AsString <> '' Then
   Begin
      dbePendiente.Text := FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').Value - DMLOG.cdsOrdComp.FieldbyName('ORDPAGTOT').Value);
   End;
   dbdtp_FechaCierre.Date := now;
End;

Procedure TFOrdenPago_CerrarOC.Z2bbtnImprimeClick(Sender: TObject);
Var
   ls_labelCerrado, ls_observacionCerrado, ls_where: String;
Begin
   If dblcdOrdenCompra.Text = '' Then
   Begin
      exit;
   End;

// Obteniendo Observación en el caso de OC cerradas
   If DMLOG.cdsOrdComp.FieldbyName('ORDPAGEST').AsString = 'CERRADO' Then
   Begin
      ls_where := ' ODCCIAID = ' + QuotedStr(dblcCompania.Text) +
         ' AND ODCID = ' + QuotedStr(dblcdOrdenCompra.Text) +
         ' AND DOCID = ' + QuotedStr('99');

      ls_labelCerrado := 'OBSERVACION DE CIERRE:';
      ls_observacionCerrado := DMLOG.DisplayDescrip('prvTGE', 'LOG130', 'CPOBS', ls_where, 'CPOBS');
   End
   Else
   Begin
      ls_labelCerrado := ' ';
      ls_observacionCerrado := ' ';
   End;

   xSQL := ' SELECT LOG304.CIAID COMPANIA, '
      + '           (SELECT TGE101.CIADES FROM TGE101 WHERE TGE101.CIAID = LOG304.CIAID ) COMPANIA_DES, '
      + '           LOG304.PROV PROVEEDOR, '
      + '           (SELECT TGE201.PROVRUC FROM TGE201 WHERE TGE201.PROV = LOG304.PROV) PROVEEDOR_RUC, '
      + '           LOG304.PROVDES PROVEEDOR_DES,  '
      + '           LOG304.TMONID MONEDA, '
      + '           (SELECT TGE103.TMONDES FROM TGE103 WHERE LOG304.TMONID = TGE103.TMONID) MONEDA_DES, '
      + '           LOG304.ODCID OC_NUMERO, '
      + '           LOG304.ODCFEMI OC_FECHAEMI, '
      + '           LOG304.ODCOBS OC_OBSERVACION,  '
      + '           LOG304.ODCTOTALG OC_TOTAL,  '
      + '           LOG304.ORDPAGEST OC_ESTADOORDENPAGO, '
      + '           LOG304.ORDPAGTOT OC_TOTALORDENPAGO, '
      + '           LOG304.TIPOADQ OC_TIPOADQUISICION, '
      + '           (SELECT TGE173.TIPADQDES FROM TGE173 WHERE TGE173.TIPOADQ = LOG304.TIPOADQ) OC_TIPOADQUISICION_DES, '
      + '           LOG304.CCOMERID OC_COMERCIAL, '
      + '           (SELECT CXC101.CCOMERDES FROM CXC101 WHERE CXC101.CIAID = LOG304.CIAID AND CXC101.CCOMERID = LOG304.CCOMERID) OC_COMERCIAL_DES, '
      + '           LOG130.NUMORDPAG ORDENPAGO, '
      + '           LOG130.CPCIAID CXP_COMPANIA,  '
      + '           LOG130.DOCID CXP_DOCUMENTO, '
      + '           (SELECT TGE110.DOCDES FROM TGE110 WHERE LOG130.DOCID = TGE110.DOCID) CXP_DOCUMENTO_DES, '
      + '           LOG130.CPOBS OBSERVACION, '
      + '           LOG130.CPSERIE CXP_SERIE,  '
      + '           LOG130.CPNODOC CXP_NUMERO,  '
      + '           LOG130.CPFRECEP CXP_RECEPCION, '
      + '           LOG130.CPFEMIS CXP_EMISION,  '
      + '           LOG130.BASIMP CXP_BIMPONIBLE, '
      + '           LOG130.IGV CXP_IGV,   '
      + '           LOG130.TOTAL CXP_TOTAL,  '
      + '           LOG130.CPESTTRA CXP_ESTADOTRANSF,  '
      + QuotedStr(DMLOG.wUsuario) + ' USUARIO_IMPRIME, '
      + QuotedStr(ls_labelCerrado) + ' OBSCERRADO_LABEL, '
      + QuotedStr(ls_observacionCerrado) + 'OBSCERRADO '
      + '      FROM LOG304, LOG130  '
      + '     WHERE LOG304.CIAID = LOG130.ODCCIAID  '
      + '       AND LOG304.ODCID = LOG130.ODCID  '
      + '       AND LOG304.CIAID = ' + QuotedStr(dblcCompania.Text)
      + '       AND LOG304.ODCID = ' + QuotedStr(dblcdOrdenCompra.Text)
      + '     ORDER BY LOG130.CPCIAID, LOG130.NUMORDPAG';
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   If DMLOG.cdsQry.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppDBPipeline_OrdenPago.DataSource := DMLOG.dsQry;
   ppReport_OrdenPago.DataPipeline := ppDBPipeline_OrdenPago;
   ppReport_OrdenPago.Template.FileName := wRutaRpt + '\OrdenPago.rtm';
   ppReport_OrdenPago.Template.LoadFromFile;
   //para mostrar el diseñador del reporte
   //ppDesigner_OrdenPago.Report := ppReport_OrdenPago ;
   //ppDesigner_OrdenPago.ShowModal() ;
   ppReport_OrdenPago.Print;
End;

Procedure TFOrdenPago_CerrarOC.dblcTMonedaExit(Sender: TObject);
Begin
   If dblcTMoneda.Text = '' Then
   Begin
      dblcTMoneda_des.Text := '';
      Exit;
   End;
   If dblcTMoneda.Text <> '' Then
   Begin
      dblcTMoneda_des.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE103', 'TMONDES', 'TMONID=' + quotedStr(dblcTMoneda.text), 'TMONDES');
   End;
End;

Procedure TFOrdenPago_CerrarOC.FormKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFOrdenPago_CerrarOC.FormShow(Sender: TObject);
Begin
   Asignalookup;
   AsignaDataSource;
   RecuperaCabecera(xCia, xNumOrdenCompra);
   dbdtp_FechaCierre.Date := now;
End;

Procedure TFOrdenPago_CerrarOC.Z2bbtnAceptaClick(Sender: TObject);
Var
   xsNumeroOrdenPago, xsAnio: String;
   xsDocid: String;
Begin
   If dbm_ObservacionCierre.Text = '' Then
   Begin
      ShowMessage('Debe ingresar la Observación del Cierre de la Orden de Compra ');
      Exit;
   End;
   If dbdtp_FechaCierre.Text = '' Then
   Begin
      ShowMessage('Debe Ingresar la Fecha del Cierre');
      Exit;
   End;

   If MessageDlg('Se cambiará el estado del Registro de Ordenes de Pago  CERRADO' + #13 + '¿Desea Continuar?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
   Begin
   // documento de cierre de la OC
      xsDocid := '73';
      xsAnio := Copy(datetoStr(dbdtp_FechaCierre.Date), 7, 4);
      xSQL := ' CIAID = ' + QuotedStr(xCia) + ' AND  TO_CHAR(CPFEMIS,' + QuotedStr('YYYY') + ') = ' + QuotedStr(xsAnio);
      xsNumeroOrdenPago := xsAnio + DMLOG.DisplayDescrip('prvTGE', 'LOG130', 'LPAD( NVL(MAX(TO_NUMBER(SUBSTR(NUMORDPAG,5,4)))+1,1),4,' + QuotedStr('0') + ') as F', xSQL, 'F');

   // Inserta cabecera de Orden de Pago
      xSQL := ' INSERT INTO LOG131 (CIAID,NUMORDPAG,ODCCIAID,ODCID,TMONID, '
         + '                        BASEIMP,IGV,TOTAL,OBSERVACION,FECHA, '
         + '                        ESTADO,USUREG,FECREG,USUMOD,FECMOD) '
         + '    VALUES (' + QuotedStr(xCia) + ', '
         + QuotedStr(xsNumeroOrdenPago) + ', '
         + QuotedStr(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString) + ', '
         + Quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString) + ', '
         + Quotedstr(DMLOG.cdsOrdComp.FieldbyName('TMONID').AsString) + ', '
         + 'null, ' //BASEIMP,
         + 'null, ' //IGV,
         + dbePendiente.Text + ', ' //TOTAL,
         + QuotedStr(dbm_ObservacionCierre.Text) + ', '
         + 'sysdate, ' //dtpFecha.Now
         + Quotedstr('ACEPTADO') + ', '
         + 'USER, '
         + 'SYSDATE, '
         + 'NULL, '
         + 'NULL )';
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);

   // inserta una nueva línea en el detalle del registro de Ordenes de pago
      xSQL := ' Insert into LOG130 (CIAID,NUMORDPAG,ODCCIAID,ODCID,PROV,CPCIAID,CPANOMES,TDIARID,CPNOREG, '
         + '                        DOCID,CPSERIE,CPNODOC,CPFRECEP,CPFEMIS,CPOBS,TMONID,CPTCAMPR,BASIMP, '
         + '                        IGV,TOTAL,CPESTTRA,CPFECTRA,CPUSUTRA,USUREG,FECREG,USUMOD,FECMOD,ITEM) '
         + '    Values (' + QuotedStr(xCia) + ', '
         + QuotedStr(xsNumeroOrdenPago) + ', '
         + QuotedStr(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString) + ', '
         + QuotedStr(DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString) + ', '
         + QuotedStr(DMLOG.cdsOrdComp.FieldbyName('PROV').AsString) + ', '
         + QuotedStr(xCia) + ', '
         + 'NULL, '
         + 'NULL, '
         + 'NULL, '
         + QuotedStr(xsDocid) + ', '
         + QuotedStr('000') + ', '
         + QuotedStr('000') + ', '
         + ' TO_DATE( ' + QuotedStr(DateToStr(dbdtp_FechaCierre.date)) + ',' + QuotedStr('DD/MM/YYYY') + '), '
         + ' TO_DATE( ' + QuotedStr(DateToStr(dbdtp_FechaCierre.date)) + ',' + QuotedStr('DD/MM/YYYY') + '), '
         + QuotedStr(dbm_ObservacionCierre.Text) + ', '
         + QuotedStr(DMLOG.cdsOrdComp.FieldbyName('TMONID').AsString) + ', '
         + 'NULL, '
         + '0,'
         + '0,'
         + dbePendiente.Text + ', '
         + QuotedStr('ACEPTADO') + ', '
         + 'NULL, '
         + 'NULL, '
         + 'USER, '
         + 'SYSDATE, '
         + 'NULL, '
         + 'NULL,1 )';
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);

      xSQL := ' Update LOG304 '
         + '       set LOG304.ORDPAGTOT = (Select SUM(LOG130.TOTAL) '
         + '                                 from LOG130 '
         + '                                where LOG130.ODCCIAID = LOG304.CIAID '
         + '                                  and LOG130.ODCID =  LOG304.ODCID '
         + '                                  and LOG130.CPESTTRA <> ' + QuotedStr('ANULADO') + '), '
         + '           LOG304.ORDPAGPEN  =  0 ,'
         + '           LOG304.ORDPAGEST  = ' + QuotedStr('CERRADO')
         + '     where LOG304.CIAID = ' + QuotedStr(dblcCompania.Text)
         + '       and LOG304.ODCID = ' + QuotedStr(dblcdOrdenCompra.Text);
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);

      RecuperaCabecera(dblcCompania.Text, dblcdOrdenCompra.Text);
      ShowMessage('La Orden de Compra fue cerrada correctamente');
      Close;
   End;
End;

Procedure TFOrdenPago_CerrarOC.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMLOG.cdsQry6.Close;
   DMLOG.cdsQry.Close;
End;

End.


Unit LOG281;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG281 (ex LOG268)
//Formulario               : FReciboServicios
//Fecha de Creación        : 23/10/2013
//Autor                    : Ricardo Medina
//Objetivo                 : Ingresar Recibo de Servicios Institucionales
//Actualizaciones          :
// HPC_201304_LOG          : 23/09/2013 Creación de Formulario
// HPC_201403_LOG          : 13/06/2014  Se modifica el SELECT, de la persona que paga el SERVICIO
//                                       se reindenta el formulario
// HPC_201305_LOG          : 14/10/2014  Se renombran las Unidades Pascal de Mantenimiento del Maestro de Servicios Institucionales
//                                       de LOG268 a LOG281
//                                       reordenamiento de Sangría
// HPC_201505_LOG          : 09/09/2015  Se añade N°Cliente (NUMCLISUM) a grid dbgServicios.
// HPC_201804_LOG          : 09/04/2018  Cambio el DFM : Añade long. al control de Número de Recibo
//                                       Alertas en el Recibo de Servicios
// LOG_201805              : 15/11/2018  Ajustes en el Formulario de Recibo de Servicios

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, wwdbdatetimepicker, StdCtrls, Wwdbdlg, Mask, wwdbedit, Wwdbspin,
   wwdblook, Buttons, ExtCtrls, wwidlg, mant, Grids, Wwdbigrd, Wwdbgrid, DB, 
// Inicio HPC_201804_LOG
// Se implementa debido al recibo de servicio
   DBClient, ComCtrls;						 
// Fin HPC_201804_LOG

Type
   TFReciboServicios = Class(TForm)
      dtnSalir: TBitBtn;
      gbDatosServicio: TGroupBox;
      edtNumero: TEdit;
      lblNumero: TLabel;
      edtTipoServicio: TEdit;
      lblTipoServicio: TLabel;
      lblProveedor: TLabel;
      lblLocal: TLabel;
      edtLocal: TEdit;
      edtProvServicio: TEdit;
      edtTitularServicio: TEdit;
      lblTitularServ: TLabel;
      gbServicios: TGroupBox;
      dbgServicios: TwwDBGrid;
      gbRecibo: TGroupBox;
      lblNroRecibo: TLabel;
      lblFVencmto: TLabel;
	  dbdFecVencimeinto: TwwDBDateTimePicker;
      lblFRecepcion: TLabel;          
      dbdFecRecep: TwwDBDateTimePicker;
      edtImporte: TEdit;
	  lblFacturado: TLabel;
      gbFRegistro: TGroupBox;
      lblFRegistro: TLabel;
      edtFecReg: TEdit;
      edtUsuario: TEdit;
      memObservacion: TMemo;
      gbFiltro: TGroupBox;
      lblCia: TLabel;
      dblcCIA: TwwDBLookupCombo;
      edtCia: TEdit;
      lblFecha: TLabel;
      rdLocal: TRadioButton;
      rdProveedor: TRadioButton;
      rdSuministro: TRadioButton;
      dbfiltro: TwwDBLookupComboDlg;
      gbCriterioBusqueda: TGroupBox;
      edtDesfiltro: TEdit;
	  gbEstado: TGroupBox;
      lblEstado: TLabel;
      edtEstado: TEdit;
      edtUbicacion: TEdit;
      edtSerie: TEdit;
	  lblSeparaSerieNro: TLabel;
      lblSerie: TLabel;
      gbcontrol: TGroupBox;
      btnEliminar: TBitBtn;
      btnAnular: TBitBtn;
      btnGrabar: TBitBtn;
	  gbFechasFacturacion: TGroupBox;    
      dbdFechadel: TwwDBDateTimePicker;
      dbdFechaAl: TwwDBDateTimePicker;
      sbFiltra: TSpeedButton;
      dbdFechaP: TwwDBDateTimePicker;
      imgAnulado: TImage;
      imgeliminado: TImage;
	  bdeFecEmi: TwwDBDateTimePicker;
	  lblFEmision: TLabel;
      lblTMon: TLabel;
      dblcTMoneda: TwwDBLookupCombo;
      edtNumRec: TEdit;
      pnlAdvertencias: TPanel;
      shpTitPnlAdvert: TShape;
      lblTitPnlAdvert: TLabel;
      shpAcepPnlAdvert: TShape;
      dbgPnlAdvert: TwwDBGrid;
      bbtnAceptaPnlAdvert: TBitBtn;
      cdsFaltInfo: TClientDataSet;
      dsFaltInfo: TDataSource;
	  lblFechaAl: TLabel;
      lblFechaDel: TLabel;
      bvlDatosBusqueda: TBevel;
      edtNeto: TEdit;
      BaseImp: TLabel;
      lblIGV: TLabel;
      edtIGV: TEdit;
      Label1: TLabel;
      EdtOtros: TEdit;
      edtNumeroCli: TEdit;	   
// Inicio HPC_201804_LOG
// Se implementa debido al recibo de servicio
      pcPagoServicio: TPageControl;
      TabSheet1: TTabSheet;
      TabSheet2: TTabSheet;
      dbgMovServicios: TwwDBGrid;			 
// Fin HPC_201804_LOG
      Procedure FormActivate(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dbfiltroExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcCIAChange(Sender: TObject);
      Procedure edtNumRecExit(Sender: TObject);
      Procedure dbdFechadelExit(Sender: TObject);
      Procedure dbdFechaAlExit(Sender: TObject);
      Procedure dbdFecVencimeintoExit(Sender: TObject);
      Procedure dbdFecRecepExit(Sender: TObject);
      Procedure edtImporteExit(Sender: TObject);
      Procedure dtnSalirClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure btnGrabarClick(Sender: TObject);
      Procedure rdLocalClick(Sender: TObject);
      Procedure rdProveedorClick(Sender: TObject);
      Procedure rdSuministroClick(Sender: TObject);
      Procedure spbFiltraClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dbgServiciosRowChanged(Sender: TObject);
      Procedure dbfiltroChange(Sender: TObject);
      Procedure dbgServiciosDblClick(Sender: TObject);
      Procedure btnAnularClick(Sender: TObject);
      Procedure btnEliminarClick(Sender: TObject);
      Procedure edtSerieExit(Sender: TObject);
  //Inicio HPC_201505_LOG
    //Procedure edtNetoExit(Sender: TObject);
    //Procedure edtIGVExit(Sender: TObject);
  //Final HPC_201505_LOG
      Procedure dbgServiciosCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure bdeFecEmiExit(Sender: TObject);
      Procedure dblcTMonedaExit(Sender: TObject);
      Procedure bbtnAceptaPnlAdvertClick(Sender: TObject);
      Procedure edtNetoExit(Sender: TObject);
      Procedure edtIGVChange(Sender: TObject);	
// Inicio HPC_201804_LOG
// Se implementa debido al recibo de servicio
    procedure memObservacionExit(Sender: TObject);
// Fin HPC_201804_LOG
   Private
    { Private declarations }
   Public
      vestado, vubicacion, destado, dubicacion, vTipoCambio: String;
      vIGV: Currency;
      vFeciniPer, vFecfinPer: tdate;
      Function Valores(Texto: String): Currency;
      Procedure Blanquea();	  
// Inicio HPC_201804_LOG
// Se implementa debido al recibo de servicio
      Procedure cargagrid();				 
// Fin HPC_201804_LOG
      Function ValidaIngreso(): boolean;
      //Inicio HPC_201505_LOG
      Procedure DesagregaIgv();
      //Final  HPC_201505_LOG
    { Public declarations }
   End;

Var
   FReciboServicios: TFReciboServicios;

Implementation

Uses LOGDM1, oaAD3100;

{$R *.dfm}

Procedure TFReciboServicios.FormActivate(Sender: TObject);
Begin
   If (DMLOG.wModo = 'A') And (DMLOG.cdsCIA.RecordCount > 1) Then
   Begin
      dblcCIA.SetFocus;
      rdLocal.Checked := True;
      dblcCIA.DropDown;
   End;
End;

Procedure TFReciboServicios.FormCreate(Sender: TObject);
Var
   XSQL: String;
Begin
 //IGV
   XSQL := 'SELECT TASACAN FROM TGE108 WHERE TASAFLG=''I'' ';
   DMLOG.cdsTASAS.Close;
   DMLOG.cdsTASAS.DataRequest(XSQL);
   DMLOG.cdsTASAS.Open;
   vIGV := DMLOG.cdsTASAS.FieldByname('TASACAN').AsFloat;
   DMLOG.cdsTASAS.Close;

 //Tipo de Modena
   xsql := 'SELECT * FROM  TGE103 ';
   DMLOG.cdsTMoneda.Close;
   DMLOG.cdsTMoneda.DataRequest(XSQL);
   DMLOG.cdsTMoneda.Open;
   dblcTMoneda.LookupTable := DMLOG.cdsTMoneda;

   If DMLOG.cdsCia.Active = False Then
      DMLOG.FiltraTabla(DMLOG.cdsCia, 'TGE101', 'CIAID', 'CIAID');
   dblcCIA.LookUpField := 'CIAID';
   dblcCIA.LookUpTable := DMLOG.cdsCIA;
   dblcCIA.Selected.Clear;
   dblcCIA.Selected.Add('CIAID'#9'2'#9'Código'#9'F');
   dblcCIA.Selected.Add('CIADES'#9'40'#9'Descripción'#9'F');
   dblcCIA.Selected.Add('CIAABR'#9'15'#9'Abreviatura'#9'F');
   If DMLOG.wModo = 'A' Then
   Begin
      If DMLOG.cdsCia.RecordCount = 1 Then
      Begin
         dblcCIA.Text := DMLOG.cdsCia.FieldByname('CIAID').AsString;
         dblcCia.Enabled := False;
         If DMLOG.cdsCIA.locate('CIAID', VarArrayOf([DMLOG.cdsCIA.FieldByName('CIAID').AsString]), []) Then
            edtCia.Text := DMLOG.cdsCIA.FieldByname('CIADES').AsString
         Else
            edtCia.Text := '';
        //Rango de periodo
         XSQL := 'SELECT FINICIO, FCIERRE FROM CXP202 WHERE CIAID=' + quotedstr(dblcCIA.Text) + ' ORDER BY NOCIERRE';
         DMLOG.cdsSQL.Close;
         DMLOG.cdsSQL.DataRequest(XSQL);
         DMLOG.cdsSQL.Open;
         DMLOG.cdsSQL.Last;
         vFeciniPer := DMLOG.cdsSQL.FieldByname('FINICIO').AsDateTime;
         vFecfinPer := DMLOG.cdsSQL.FieldByname('FCIERRE').AsDateTime;
         DMLOG.cdsSQL.Close;
         rdLocalClick(Self);
      End
      Else
      Begin
         gbFiltro.Enabled := True;
         dblcCia.Enabled := True;
      End;
   End;
End;

Procedure TFReciboServicios.dblcCIAExit(Sender: TObject);
Var
   XSQL: String;
Begin

   If DMLOG.cdsCIA.locate('CIAID', VarArrayOf([DMLOG.cdsCIA.FieldByName('CIAID').AsString]), []) Then
      edtCia.Text := DMLOG.cdsCIA.FieldByname('CIADES').AsString
   Else
      edtCia.Text := '';
   dbdFechaP.SetFocus;

// Rango de periodo
   XSQL := 'SELECT FINICIO, FCIERRE FROM CXP202 WHERE CIAID=' + quotedstr(dblcCIA.Text) + ' ORDER BY NOCIERRE';
   DMLOG.cdsSQL.Close;
   DMLOG.cdsSQL.DataRequest(XSQL);
   DMLOG.cdsSQL.Open;
   DMLOG.cdsSQL.Last;
   vFeciniPer := DMLOG.cdsSQL.FieldByname('FINICIO').AsDateTime;
   vFecfinPer := DMLOG.cdsSQL.FieldByname('FCIERRE').AsDateTime;
   DMLOG.cdsSQL.Close;

   If rdLocal.Checked Then rdLocalClick(Self);
   If rdProveedor.Checked Then rdProveedorClick(Self);
   If rdSuministro.Checked Then rdSuministroClick(Self);

End;

Procedure TFReciboServicios.dbfiltroExit(Sender: TObject);
Begin

   If rdLocal.Checked Then
   Begin
      If DMLOG.cdsLOC.locate('LOCID', VarArrayOf([DMLOG.cdsLOC.FieldByName('LOCID').AsString]), []) Then
         EdtDesfiltro.Text := DMLOG.cdsLOC.FieldByname('LOCDES').AsString
      Else
         EdtDesfiltro.Text := '';
   End;

   If rdProveedor.Checked Then
   Begin
      If DMLOG.cdsLinea.Locate('PROV', VarArrayOf([DMLOG.cdsLinea.FieldByName('PROV').AsString]), []) Then
         EdtDesfiltro.Text := DMLOG.cdsLinea.FieldByName('PROVDES').AsString
      Else
         EdtDesfiltro.Text := '';
   End;

   If rdSuministro.Checked Then
   Begin
      If DmLOG.cdsLEntrega.Locate('NUMCLISUM', VarArrayOf([DMLOG.cdsLEntrega.FieldByName('NUMCLISUM').AsString]), []) Then
         EdtDesfiltro.Text := DMLOG.cdsLEntrega.FieldByName('DESCRIPCION').AsString
      Else
         EdtDesfiltro.Text := '';

   End;

End;

Procedure TFReciboServicios.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMLOG.cdsQry10.close;
   edtEstado.Font.Color := clGreen;
   Action := caFree;
   Mtx3100.RefreshFilter;
   DMLOG.cdsLEntrega.Close;
End;

Procedure TFReciboServicios.dblcCIAChange(Sender: TObject);
Begin
   edtCia.Text := '';
   If DMLOG.wModo = 'A' Then
      Blanquea
End;

Procedure TFReciboServicios.edtNumRecExit(Sender: TObject);
Begin
   If (btnGrabar.Focused) Or (dtnSalir.Focused) Then Exit;
//   edtNumRec.Text := DMLOG.StrZero(TRIM(edtNumRec.Text), 7);
// Inicio HPC_201804_LOG
// Se actualiza el grid de movimientos de pagos
//   bdeFecEmi.SetFocus;
// Fin HPC_201804_LOG
End;

Procedure TFReciboServicios.dbdFechadelExit(Sender: TObject);
Begin
   If (btnGrabar.Focused) Or (dtnSalir.Focused) Then Exit;
// Inicio HPC_201804_LOG
// Se actualiza el grid de movimientos de pagos
//   dbdFechaAl.SetFocus;
// Fin HPC_201804_LOG
End;

Procedure TFReciboServicios.dbdFechaAlExit(Sender: TObject);
Begin
   If (btnGrabar.Focused) Or (dtnSalir.Focused) Then Exit;
   dbdFecVencimeinto.SetFocus;
End;

Procedure TFReciboServicios.dbdFecVencimeintoExit(Sender: TObject);
Begin
   If (btnGrabar.Focused) Or (dtnSalir.Focused) Then Exit;
 //Inicio HPC_201505_LOG
// Inicio HPC_201804_LOG
// Se actualiza el grid de movimientos de pagos
// dbdFecRecep.SetFocus;
// Fin HPC_201804_LOG
 //Final HPC_201505_LOG
End;

Procedure TFReciboServicios.dbdFecRecepExit(Sender: TObject);
Begin
   If (btnGrabar.Focused) Or (dtnSalir.Focused) Then Exit;
 //Inicio HPC_201505_LOG
   //memObservacion.SetFocus;
// Inicio HPC_201804_LOG
// Se actualiza el grid de movimientos de pagos
//   dblcTMoneda.SetFocus;
// Fin HPC_201804_LOG
 //Final HPC_201505_LOG
End;

Procedure TFReciboServicios.edtImporteExit(Sender: TObject);
Begin
   If Length(Trim(edtImporte.Text)) = 0 Then
   Begin
      edtImporte.Text := '0.00';
   End;
   edtImporte.Text := FormatFloat('###,###.00', Valores(edtImporte.Text));
   //Inicio HPC_201505_LOG
   //dbdFecRecep.SetFocus;
// Inicio HPC_201804_LOG
// Se actualiza el grid de movimientos de pagos
//   memObservacion.SetFocus;
// Fin HPC_2018_LOG
   //Final HPC_201505_LOG
End;

Function TFReciboServicios.Valores(Texto: String): Currency;
Var
   xMont, xValor: String;
   I: Integer;
Begin
   For I := 1 To Length(Trim(Texto)) Do
   Begin
      xMont := Copy(Texto, I, 1);
      If xMont <> ',' Then
         xValor := Trim(xValor) + Trim(xMont);
   End;
   Result := StrToFloat(xValor);
End;

Procedure TFReciboServicios.dtnSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFReciboServicios.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFReciboServicios.btnGrabarClick(Sender: TObject);
Var
   xsql: String;
// Inicio HPC_201804_LOG
// Se implementa debido al recibo de servicio
   xfechaantdel, xfechaantal : String;
// Fin HPC_201804_LOG
Begin
//Captura tipo de Cambio
   vTipoCambio := DMLOG.CalcTipoCambio(dblcTMoneda.text, bdeFecEmi.Date, DMLOG.wTipoCambio);
   If Length(trim(vTipoCambio)) = 0 Then vTipoCambio := '0.00';

   If Not ValidaIngreso Then
   Begin
      pnlAdvertencias.Top := 132;
      pnlAdvertencias.Left := 138;
      pnlAdvertencias.Visible := True;
      Exit;
   End;

   If DMLOG.wModo = 'A' Then
   Begin
      If TRIM(DMLOG.cdsObra.FieldByName('FLGCANAUT').AsString) = 'S' Then
      Begin
         vestado := 'CANCELADO';
         vubicacion := 'AUTOMAT.';
         destado := 'C';
         dubicacion := 'AU';
      End
      Else
      Begin
         vestado := 'INICIAL';
         vubicacion := 'SER.GENE';
         destado := 'I';
         dubicacion := 'SG';
      End;

   // Verificar si el RECIBO YA EXISTE
   // HPC_201403_LOG
      Xsql := 'Select NUMREC '
         + '  From LOG_MOV_SERVICIOS '
         + ' Where CIAID=' + quotedstr(dblcCIA.Text)
         + '   AND CODUNICO=' + quotedstr(trim(DMLOG.cdsObra.FieldByName('CODUNICO').AsString))
         + '   AND SERIE=' + quotedstr(Trim(edtSerie.Text))
         + '   AND NUMREC=' + quotedstr(Trim(edtNumRec.Text))
         + '   AND ESTADO <> ''E'' ';
      DMLOG.cdsQry1.Close;
      DMLOG.cdsQry1.DataRequest(XSQL);
      DMLOG.cdsQry1.Open;

      If DMLOG.cdsQry1.RecordCount > 0 Then
      Begin
         ShowMessage('El Recibo ya existe, verifique.......');
         Exit;
      End;
// Inicio HPC_201804_LOG
// Verificar si el RECIBO del mes anterior EXISTE
      xfechaantdel := Datetostr(IncMonth(dbdFechadel.Date, -1));
      xfechaantal := Datetostr(IncMonth(dbdFechaal.Date, -1));
      Xsql := 'Select NUMREC '
         + '  From LOG_MOV_SERVICIOS '
         + ' Where CIAID=' + quotedstr(dblcCIA.Text)
         + '   AND CODUNICO=' + quotedstr(trim(DMLOG.cdsObra.FieldByName('CODUNICO').AsString))
         + '   AND FECINIFAC=' + quotedstr(xfechaantdel)
         + '   AND FECFINFAC=' + quotedstr(xfechaantal)
         + '   AND ESTADO <> ''E'' ';
      DMLOG.cdsQry1.Close;
      DMLOG.cdsQry1.DataRequest(XSQL);
      DMLOG.cdsQry1.Open;

      If DMLOG.cdsQry1.RecordCount = 0 Then
      Begin
         If MessageDlg(' El Recibo del mes anterior no ha sido generado' + chr(13) + chr(13) +
         '       ¿ desea continuar... ?      ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Begin
            Exit;
         end;

      End;
// Fin HPC_201804_LOG
      If MessageDlg('Desea grabar el Servicio.?', mtconfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
    //Inicio HPC_201505_LOG
         DesagregaIgv;
    //Final HPC_201505_LOG
// Inicio LOG_201805
// Se ajusta el grabado en la columna FECRECREC y FECVENREC, anteriormente estaba invertido.
         xSQL := ' Insert into LOG_MOV_SERVICIOS(CIAID, CODUNICO, FECPERIODO, NUMCLISUM, SERIE, NUMREC, KEYRECIBO,'
            + '                               FECINIFAC, FECFINFAC, ESTADO, UBICACION, NETO, IGV, IMPORTE,'
            + '                               OBSERVACION, FECRECREC, FECVENREC, FECREGREC, TIPCAM, TIPMON, FECEMIREC, USUARIO) '
            + ' values('
            + quotedstr(dblcCIA.Text) + ', '
            + quotedstr(trim(DMLOG.cdsObra.FieldByName('CODUNICO').AsString)) + ', '
            + quotedstr(dbdFechaP.Text) + ', '
            + quotedstr(trim(DMLOG.cdsObra.FieldByName('NUMCLISUM').AsString)) + ', '
            + quotedstr(trim(edtSerie.Text)) + ', '
            + quotedstr(trim(edtNumRec.Text)) + ', '
            + quotedstr(trim(DMLOG.cdsObra.FieldByName('CODUNICO').AsString) + trim(edtSerie.Text) + trim(edtNumRec.Text)) + ', '
            + quotedstr(dbdFechadel.Text) + ', '
            + quotedstr(dbdFechaAl.Text) + ', '
            + quotedstr(destado) + ', '
            + quotedstr(dubicacion) + ', '
            + CurrToStr(DMLOG.Valores(edtNeto.Text)) + ','
            + CurrToStr(DMLOG.Valores(edtIGV.Text)) + ','
            + CurrToStr(DMLOG.Valores(edtImporte.Text)) + ','
            + quotedstr(trim(memObservacion.Text)) + ', '
            + quotedstr(dbdFecRecep.Text) + ', '
            + quotedstr(dbdFecVencimeinto.Text) + ', '
            + 'sysdate, '
            + vTipoCambio + ', '
            + quotedstr(dblcTMoneda.Text) + ', '
            + quotedstr(bdeFecEmi.Text) + ', '
            + quotedstr(DMLOG.wUsuario) + ')';
         DMLOG.DCOM1.AppServer.EjecutaSQL(Xsql);
         edtEstado.Text := vestado;
         edtUbicacion.Text := vubicacion;
         ShowMessage('Grabación exitosa');
         btnGrabar.Enabled := False;
         btnEliminar.Enabled := True;
         btnAnular.Enabled := True;
         gbRecibo.Enabled := False;
// Fin LOG_201805
// Inicio HPC_201804_LOG
// Se actualiza el grid de movimientos de pagos
         cargagrid;
// Fin HPC_201804_LOG
      End;

   End;

   If DMLOG.wModo = 'M' Then
   Begin
      If MessageDlg('Desea grabar las Modificaciones.?', mtconfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
    //Inicio HPC_201505_LOG
         DesagregaIgv;
    //Final HPC_201505_LOG
         Xsql := 'Update LOG_MOV_SERVICIOS '
            + '   Set SERIE=' + quotedstr(edtSerie.Text) + ', '
            + '       NUMREC=' + quotedstr(edtNumRec.Text) + ', '
            + '       FECINIFAC=' + quotedstr(dbdFechadel.Text) + ', '
            + '       FECFINFAC=' + quotedstr(dbdFechaAl.Text) + ', '
            + '       FECVENREC=' + quotedstr(dbdFecVencimeinto.Text) + ', '
            + '       FECRECREC=' + quotedstr(dbdFecRecep.Text) + ', '
            + '       IMPORTE=' + CurrToStr(DMLOG.Valores(edtImporte.Text)) + ', '
            + '       FECMODREC=SYSDATE, '
            + '       USRMODREC=' + quotedstr(DMLOG.wUsuario) + ', '
            + '       NETO=' + CurrToStr(DMLOG.Valores(edtNeto.Text)) + ', '
            + '       IGV=' + CurrToStr(DMLOG.Valores(edtIGV.Text)) + ', '
            + '       TIPCAM=' + vTipoCambio + ', '
            + '       TIPMON=' + quotedstr(dblcTMoneda.Text) + ', '
            + '       FECEMIREC=' + quotedstr(bdeFecEmi.Text) + ', '
            + '       KEYRECIBO=' + quotedstr(trim(DMLOG.cdsObra.FieldByName('CODUNICO').AsString) + trim(edtSerie.Text) + trim(edtNumRec.Text)) + ' '
            + ' where CIAID=' + quotedstr(Mtx3100.FMant.cds2.fieldbyname('CIAID').AsString)
            + '   and KEYRECIBO=' + quotedstr(Mtx3100.FMant.cds2.fieldbyname('KEYRECIBO').AsString);
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
         ShowMessage('Grabación exitosa');
         btnGrabar.Enabled := False;
         btnEliminar.Enabled := True;
         btnAnular.Enabled := True;
         gbRecibo.Enabled := False;
      End;
   End;
End;

Procedure TFReciboServicios.rdLocalClick(Sender: TObject);
Var
   xSQL: String;
Begin
// Tabla de Locales
   xSQL := 'Select A.*, B.PROVDES PROPIETARIO '
      + '  From ACF120 A, TGE201 B '
      + ' Where A.CODPRO=B.PROV(+) '
      + '   and LOCID in (select A.LOCID '
      + '                   from LOG_MAE_SERVICIOS A '
      + '                  where A.CIAID=' + quotedstr(dblcCia.text)
      + '                  group by LOCID)';
   DMLOG.cdsLOC.Close;
   DMLOG.cdsLOC.DataRequest(XSQL);
   DMLOG.cdsLOC.Open;
   dbfiltro.Clear;
   dbfiltro.Caption := 'Local';
   dbfiltro.LookupField := '';
   dbfiltro.LookupTable := DMLOG.cdsLOC;
   dbfiltro.LookupField := 'LOCID';
   dbfiltro.Selected.Clear;
   dbfiltro.Selected.Add('LOCID'#9'2'#9'Código'#9'F');
   dbfiltro.Selected.Add('LOCDES'#9'30'#9'Descripción'#9'F');
   EdtDesfiltro.Text := '';
   If DMLOG.wModo = 'A' Then
      Blanquea;
End;

Procedure TFReciboServicios.rdProveedorClick(Sender: TObject);
Var
   xSQL: String;
Begin
   //Tabla de Proveedora
   xSQL := 'Select A.PROV, A.PROVDES, A.CLAUXID '
      + '  from TGE201 A '
      + ' where PROV IN (select A.CODPROV '
      + '                  from LOG_MAE_SERVICIOS A '
      + '                 where A.CIAID=' + quotedstr(dblcCia.text)
      + '                 group by CODPROV)';
   DMLOG.cdsLinea.Close;
   DMLOG.cdsLinea.DataRequest(XSQL);
   DMLOG.cdsLinea.IndexFieldNames := 'PROVDES';
   DMLOG.cdsLinea.Open;
   dbfiltro.Clear;
   dbfiltro.Caption := 'Proveedor';
   dbfiltro.LookupField := '';
   dbfiltro.LookupTable := DMLOG.cdsLinea;
   dbfiltro.LookupField := 'PROV';
   dbfiltro.Selected.Clear;
   dbfiltro.Selected.Add('PROV'#9'3'#9'Código'#9'F');
   dbfiltro.Selected.Add('PROVDES'#9'30'#9'Descripción'#9'F');
   dbfiltro.Selected.Add('CLAUXID'#9'2'#9'Clase'#9'F');
   gbServicios.Caption := 'Proveedores - Servicios ';
   EdtDesfiltro.Text := '';
   Blanquea;
End;

Procedure TFReciboServicios.rdSuministroClick(Sender: TObject);
Var
   xSQL: String;
Begin
   //Table de Servicio
   xSQL := 'SELECT A.CIAID, A.NUMCLISUM, A.NUMSER, A.CODSER, B.DESTIPSER, A.CODPROV, '
      + '       C.PROVDES, A.LOCID, D.LOCDES, A.CODTITSER, E.PROVDES TITUSER, A.DESCRIPCION, SYSDATE FECREG '
      + '  FROM LOG_MAE_SERVICIOS A, LOG_TIP_SERVICIOS B, TGE201 C, ACF120 D, TGE201 E '
      + ' WHERE A.CIAID=' + quotedstr(dblcCia.text)
      + '   AND A.CODSER=B.CODSER(+) '
      + '   AND A.CODPROV=C.PROV(+) AND C.CLAUXID IN (''H'',''P'') AND C.ACTIVO=''S'' '
      + '   AND A.LOCID=D.LOCID(+) '
      + '   AND A.CODTITSER=E.PROV(+) AND E.CLAUXID IN (''H'',''P'') AND E.ACTIVO=''S''  ';
   DMLOG.cdsLEntrega.Close;
   DMLOG.cdsLEntrega.DataRequest(XSQL);
   DMLOG.cdsLEntrega.Open;
   dbfiltro.Clear;
   dbfiltro.LookupField := '';
   dbfiltro.LookupTable := DMLOG.cdsLEntrega;
   dbfiltro.Caption := 'Cliente/Sevicio';
   dbfiltro.LookupField := 'NUMCLISUM';
   dbfiltro.Selected.Clear;
   dbfiltro.Selected.Add('NUMCLISUM'#9'15'#9'Cli/Sum'#9'F');
   dbfiltro.Selected.Add('DESTIPSER'#9'30'#9'Servicio'#9'F');
   dbfiltro.Selected.Add('DESCRIPCION'#9'30'#9'Descripcion'#9'F');
   gbServicios.Refresh;
   EdtDesfiltro.Text := '';
   Blanquea;
End;

Procedure TFReciboServicios.spbFiltraClick(Sender: TObject);
Var
   xWhere, xSQL: String;
Begin
// Verifica si el periodo está correcto
   If (dbdFechaP.Date < vFeciniPer) Or (dbdFechaP.Date > vFecfinPer) Then
   Begin
      ShowMessage('La Fecha indicada, no está dentro del rango de fechas vigentes de Cuentas por Pagar');
      exit;
   End;

   If rdLocal.Checked Then xwhere := ' A.LOCID    =' + quotedstr(trim(dbfiltro.Text));
   If rdProveedor.Checked Then xwhere := ' A.CODPROV  =' + quotedstr(trim(dbfiltro.Text));
   If rdSuministro.Checked Then xwhere := ' A.NUMCLISUM=' + quotedstr(trim(dbfiltro.Text));

// Servicio
  //Inicio HPC_201403_LOG
  {xSQL := 'Select A.CIAID, A.CODUNICO, A.NUMCLISUM, A.NUMSER, A.CODSER, B.DESTIPSER, A.CODPROV, '
         + '       C.PROVDES, A.LOCID, D.LOCDES, A.CODTITSER,'
         + '       case when FLGPAGDER=''S'' then ''DERRAMA MAGISTERIAL'' else E.PROVDES end TITUSER, '
         + '       A.DESCRIPCION, sysdate FECREG, FLGCANAUT '
         + '  from LOG_MAE_SERVICIOS A, LOG_TIP_SERVICIOS B, TGE201 C, ACF120 D, TGE201 E '
         + '  where A.CIAID='+quotedstr(dblcCia.text)
         + '    and ' + xwhere
         + '    and A.CODSER=B.CODSER(+) '
         + '    and A.CODPROV=C.PROV(+) and C.CLAUXID in (''H'',''P'') and C.ACTIVO=''S'' '
         + '    and A.LOCID=D.LOCID(+) '
         + '    and A.CODTITSER=E.PROV(+) AND E.CLAUXID IN (''H'',''P'') AND E.ACTIVO=''S''  ';}

   xSQL := 'Select A.CIAID, A.CODUNICO, A.NUMCLISUM, A.NUMSER, A.CODSER, B.DESTIPSER, A.CODPROV, '
      + '       C.PROVDES, A.LOCID, D.LOCDES, A.CODTITSER,'
      + '       case when FLGPAGDER=''S'' then ''DERRAMA MAGISTERIAL'' else '
      + '       (Select PROVDES  From TGE201 E Where  A.CODTITSER=E.PROV(+) AND E.CLAUXID IN (''H'',''P'') AND E.ACTIVO=''S'') end TITUSER, '
      + '       A.DESCRIPCION, sysdate FECREG, FLGCANAUT '
      + '  from LOG_MAE_SERVICIOS A, LOG_TIP_SERVICIOS B, TGE201 C, ACF120 D '
      + '  where A.CIAID=' + quotedstr(dblcCia.text)
      + '    and ' + xwhere
      + '    and A.CODSER=B.CODSER(+) '
      + '    and A.CODPROV=C.PROV(+) and C.CLAUXID in (''H'',''P'') and C.ACTIVO=''S'' '
      + '    and A.LOCID=D.LOCID(+) ';
  //Final HPC_201403_LOG

   DMLOG.cdsObra.Close;
   DMLOG.cdsObra.DataRequest(xSQL);
   DMLOG.cdsObra.Open;

   dbgServicios.DataSource := DMLOG.dsObra;
   dbgServicios.Selected.Clear;
   dbgServicios.Selected.Add('DESTIPSER'#9'20'#9'Tipo~Servicio'#9'F');
   If Not rdProveedor.Checked Then
      dbgServicios.Selected.Add('PROVDES'#9'20'#9'Proveedor~Servicio'#9'F');
 //Inicio HPC_201505_LOG
   dbgServicios.Selected.Add('NUMCLISUM'#9'10'#9'N°Cliente'#9'F');
 //Final HPC_201505_LOG
   dbgServicios.Selected.Add('NUMSER'#9'10'#9'Numero'#9'F');
   If Not rdLocal.Checked Then
      dbgServicios.Selected.Add('LOCDES'#9'20'#9'Local'#9'F');
   dbgServicios.Selected.Add('DESCRIPCION'#9'20'#9'Descripción'#9'F');
   dbgServicios.ApplySelected;
   dbgServicios.RefreshDisplay;
   dbgServiciosRowChanged(Self);
   dbfiltroExit(Self);
End;

Procedure TFReciboServicios.FormShow(Sender: TObject);
Var
   xSQL, xSQL2: String;
Begin
   If DMLOG.wModo = 'A' Then
   Begin
      btnGrabar.Enabled := True;
      btnEliminar.Enabled := False;
      btnAnular.Enabled := False;
      gbRecibo.Color := clBtnFace;
      xSQL := 'SELECT LPAD('' '',2)  CIAID, '
         + '       LPAD('' '',10) NUMCLISUM, '
         + '       LPAD('' '',10) NUMSER, '
         + '       LPAD('' '',10) CODSER, '
         + '       LPAD('' '',20) DESTIPSER, '
         + '       LPAD('' '',5)  CODPROV, '
         + '       LPAD('' '',10) PROVDES, '
         + '       LPAD('' '',10) LOCID, '
         + '       LPAD('' '',10) LOCDES,'
         + '       LPAD('' '',10) CODTITSER, '
         + '       LPAD('' '',10) TITUSER, '
         + '       LPAD('' '',10) DESCRIPCION, '
         + '       '' '' FLGCANAUT, '
         + '       Sysdate FECREG'
         + '  from DUAL  ';
      DMLOG.cdsObra.Close;
      DMLOG.cdsObra.DataRequest(XSQL);
      DMLOG.cdsObra.Open;
      dbgServicios.DataSource := DMLOG.dsObra;
      dbgServicios.Selected.Clear;
      dbgServicios.Selected.Add('DESTIPSER'#9'20'#9'Tipo~Servicio'#9'F');
      dbgServicios.Selected.Add('PROVDES'#9'20'#9'Proveedor~Servicio'#9'F');
   //Inicio HPC_201505_LOG
      dbgServicios.Selected.Add('NUMCLISUM'#9'10'#9'N°Cliente'#9'F');
   //Final HPC_201505_LOG
      dbgServicios.Selected.Add('NUMSER'#9'10'#9'Numero'#9'F');
      dbgServicios.Selected.Add('LOCDES'#9'20'#9'Local'#9'F');
      dbgServicios.Selected.Add('DESCRIPCION'#9'20'#9'Descripción'#9'F');
      dbgServicios.ApplySelected;
   End;

   If DMLOG.wModo = 'M' Then
   Begin
   // Servicio
   //Inicio HPC_201403_LOG
      {xSQL := 'SELECT A.CIAID, A.CODUNICO, A.NUMCLISUM, A.NUMSER, A.CODSER, B.DESTIPSER, A.CODPROV, '
            + '       C.PROVDES, A.LOCID, D.LOCDES, A.CODTITSER, E.PROVDES TITUSER, A.DESCRIPCION, '
            + '       Sysdate FECREG,FLGCANAUT '
            + '  from LOG_MAE_SERVICIOS A, LOG_TIP_SERVICIOS B, TGE201 C, ACF120 D, TGE201 E '
            + ' Where A.CIAID='+quotedstr(Mtx3100.FMant.cds2.fieldbyname('CIAID').AsString)
            + '   and CODUNICO='+quotedstr(Mtx3100.FMant.cds2.fieldbyname('CODUNICO').AsString)
            + '   and A.CODSER=B.CODSER(+) '
            + '   and A.CODPROV=C.PROV(+) and C.CLAUXID IN (''H'',''P'') and C.ACTIVO=''S'' '
            + '   and A.LOCID=D.LOCID(+) '
            + '   and A.CODTITSER=E.PROV(+) and E.CLAUXID IN (''H'',''P'') and E.ACTIVO=''S'' '; }

      xSQL := 'SELECT A.CIAID, A.CODUNICO, A.NUMCLISUM, A.NUMSER, A.CODSER, B.DESTIPSER, A.CODPROV, '
         + '       C.PROVDES, A.LOCID, D.LOCDES, A.CODTITSER,'
         + '       case when FLGPAGDER=''S'' then ''DERRAMA MAGISTERIAL'' else '
         + '       (Select PROVDES  From TGE201 E Where  A.CODTITSER=E.PROV(+) AND E.CLAUXID IN (''H'',''P'') AND E.ACTIVO=''S'') end TITUSER, '
         + ' A.DESCRIPCION,Sysdate FECREG,FLGCANAUT '
         + '  from LOG_MAE_SERVICIOS A, LOG_TIP_SERVICIOS B, TGE201 C, ACF120 D '
         + ' Where A.CIAID=' + quotedstr(Mtx3100.FMant.cds2.fieldbyname('CIAID').AsString)
         + '   and CODUNICO=' + quotedstr(Mtx3100.FMant.cds2.fieldbyname('CODUNICO').AsString)
         + '   and A.CODSER=B.CODSER(+) '
         + '   and A.CODPROV=C.PROV(+) and C.CLAUXID IN (''H'',''P'') and C.ACTIVO=''S'' '
         + '   and A.LOCID=D.LOCID(+) ';
  //Final HPC_201403_LOG

      DMLOG.cdsObra.Close;
      DMLOG.cdsObra.DataRequest(xSQL);
      DMLOG.cdsObra.Open;
      If DMLOG.cdsObra.RecordCount = 1 Then
      Begin
         dbgServicios.DataSource := DMLOG.dsObra;
         dbgServicios.Selected.Clear;
         dbgServicios.Selected.Add('DESTIPSER'#9'20'#9'Tipo~Servicio'#9'F');
         If Not rdProveedor.Checked Then
            dbgServicios.Selected.Add('PROVDES'#9'20'#9'Proveedor~Servicio'#9'F');
      //Inicio HPC_201505_LOG
         dbgServicios.Selected.Add('NUMCLISUM'#9'10'#9'N°Cliente'#9'F');
      //Final HPC_201505_LOG
         dbgServicios.Selected.Add('NUMSER'#9'10'#9'Numero'#9'F');
         If Not rdLocal.Checked Then
            dbgServicios.Selected.Add('LOCDES'#9'20'#9'Local'#9'F');
         dbgServicios.Selected.Add('DESCRIPCION'#9'20'#9'Descripción'#9'F');
         dbgServicios.ApplySelected;
         dbgServicios.RefreshDisplay;
         dbgServiciosRowChanged(Self);
      End;

      xSQL2 := ' Select * '
         + '   from LOG_MOV_SERVICIOS '
         + '  where CIAID=' + quotedstr(DMLOG.cdsObra.fieldByname('CIAID').Asstring)
         + '    and KEYRECIBO=' + quotedstr(Mtx3100.FMant.cds2.fieldbyname('KEYRECIBO').AsString);
      DMLOG.cdsQry10.Close;
      DMLOG.cdsQry10.DataRequest(XSQL2);
      DMLOG.cdsQry10.Open;
      If DMLOG.cdsQry10.RecordCount = 1 Then
      Begin
         If TRIM(DMLOG.cdsQry10.FieldByName('ESTADO').AsString) = 'I' Then vestado := 'INICIAL';
         If TRIM(DMLOG.cdsQry10.FieldByName('ESTADO').AsString) = 'P' Then vestado := 'ACEPTADO';
         If TRIM(DMLOG.cdsQry10.FieldByName('ESTADO').AsString) = 'A' Then vestado := 'ANULADO';
         If TRIM(DMLOG.cdsQry10.FieldByName('ESTADO').AsString) = 'E' Then vestado := 'ELIMINADO';
         If TRIM(DMLOG.cdsQry10.FieldByName('ESTADO').AsString) = 'C' Then vestado := 'CANCELADO';

         If TRIM(DMLOG.cdsQry10.FieldByName('UBICACION').AsString) = 'OC' Then vubicacion := 'O.COMPRA';
         If TRIM(DMLOG.cdsQry10.FieldByName('UBICACION').AsString) = 'OP' Then vubicacion := 'O.PAGO';
         If TRIM(DMLOG.cdsQry10.FieldByName('UBICACION').AsString) = 'CP' Then vubicacion := 'CTA.PAG.';
         If TRIM(DMLOG.cdsQry10.FieldByName('UBICACION').AsString) = 'CJ' Then vubicacion := 'CAJA';
         If TRIM(DMLOG.cdsQry10.FieldByName('UBICACION').AsString) = 'AU' Then vubicacion := 'AUTOMAT.';
         If TRIM(DMLOG.cdsQry10.FieldByName('UBICACION').AsString) = 'SG' Then vubicacion := 'SER.GENE';
      End;

      dblcCIA.Text := DMLOG.cdsQry10.Fieldbyname('CIAID').AsString;
      dbdFechaP.DateTime := DMLOG.cdsQry10.Fieldbyname('FECPERIODO').AsDateTime;
      rdLocalClick(SELF);
      dbfiltro.Text := Mtx3100.FMant.cds2.fieldbyname('LOCID').AsString;
      If DMLOG.cdsLOC.locate('LOCID', VarArrayOf([Mtx3100.FMant.cds2.fieldbyname('LOCID').AsString]), []) Then
         EdtDesfiltro.Text := DMLOG.cdsLOC.FieldByname('LOCDES').AsString;
      If DMLOG.cdsCIA.locate('CIAID', VarArrayOf([DMLOG.cdsCIA.FieldByName('CIAID').AsString]), []) Then edtCia.Text := DMLOG.cdsCIA.FieldByname('CIADES').AsString;
    //Inicio HPC_201505_LOG
    // edtSerie.Text := DMLOG.StrZero(DMLOG.cdsQry10.Fieldbyname('SERIE').AsString, 3);
      edtSerie.Text := Trim(DMLOG.cdsQry10.Fieldbyname('SERIE').AsString);
    //Final HPC_201505_LOG
      edtNumRec.Text := DMLOG.cdsQry10.Fieldbyname('NUMREC').AsString;
      dbdFechadel.Date := DMLOG.cdsQry10.Fieldbyname('FECINIFAC').AsDateTime;
      dbdFechaAl.Date := DMLOG.cdsQry10.Fieldbyname('FECFINFAC').AsDateTime;
      dbdFecVencimeinto.Date := DMLOG.cdsQry10.Fieldbyname('FECVENREC').AsDateTime;
      dbdFecRecep.Date := DMLOG.cdsQry10.Fieldbyname('FECRECREC').AsDateTime;
      edtNeto.Text := DMLOG.cdsQry10.Fieldbyname('NETO').AsString;
      edtIgv.Text := DMLOG.cdsQry10.Fieldbyname('IGV').AsString;
      edtImporte.Text := DMLOG.cdsQry10.Fieldbyname('IMPORTE').AsString;
      edtFecReg.Text := DMLOG.cdsQry10.Fieldbyname('FECREGREC').AsString;
      edtUsuario.Text := DMLOG.cdsQry10.Fieldbyname('USUARIO').AsString;
      edtEstado.Text := vestado;
      edtUbicacion.Text := vubicacion;
      memObservacion.Lines.Text := DMLOG.cdsQry10.Fieldbyname('OBSERVACION').AsString;
      destado := DMLOG.cdsQry10.Fieldbyname('ESTADO').AsString;
      dblcTMoneda.Text := DMLOG.cdsQry10.Fieldbyname('TIPMON').AsString;
      bdeFecEmi.Date := DMLOG.cdsQry10.Fieldbyname('FECEMIREC').AsDateTime;

      gbFiltro.Enabled := False;
      gbRecibo.Enabled := False;
      gbFiltro.Enabled := False;
      gbServicios.Enabled := False;

   // Rango de periodo
      xSQL := 'Select FINICIO, FCIERRE from CXP202 where CIAID=' + quotedstr(dblcCIA.Text) + ' Order by NOCIERRE';
      DMLOG.cdsSQL.Close;
      DMLOG.cdsSQL.DataRequest(XSQL);
      DMLOG.cdsSQL.Open;
      DMLOG.cdsSQL.Last;
      vFeciniPer := DMLOG.cdsSQL.FieldByname('FINICIO').AsDateTime;
      vFecfinPer := DMLOG.cdsSQL.FieldByname('FCIERRE').AsDateTime;
      DMLOG.cdsSQL.Close;

      imgAnulado.Visible := False;
      imgeliminado.Visible := False;
      dbgServicios.Visible := True;

      If DMLOG.cdsQry10.FieldByName('ESTADO').AsString = 'I' Then
      Begin
         gbRecibo.Color := $00C2E0CA;
         gbRecibo.Enabled := True;
         gbcontrol.Enabled := True;
         btnEliminar.Enabled := True;
         btnAnular.Enabled := True;
      End
      Else
         If (DMLOG.cdsQry10.FieldByName('ESTADO').AsString = 'C') And
            (TRIM(DMLOG.cdsQry10.FieldByName('UBICACION').AsString) = 'AU') Then
         Begin
            gbRecibo.Color := $00C2E0CA;
            btnEliminar.Enabled := True;
            btnAnular.Enabled := True;
            btnGrabar.Enabled := False;
         End
         Else
         Begin
            If DMLOG.cdsQry10.FieldByName('ESTADO').AsString = 'A' Then
            Begin
               gbcontrol.Enabled := False;
               gbRecibo.Color := clBtnFace;
               btnEliminar.Enabled := False;
               btnAnular.Enabled := False;
               imgAnulado.Visible := True;
               dbgServicios.Visible := False;
            End
            Else
               If DMLOG.cdsQry10.FieldByName('ESTADO').AsString = 'E' Then
               Begin
                  gbcontrol.Enabled := False;
                  gbRecibo.Color := clBtnFace;
                  btnEliminar.Enabled := False;
                  btnAnular.Enabled := False;
                  imgeliminado.Visible := True;
                  dbgServicios.Visible := False;
               End
               Else
               Begin
                  gbcontrol.Enabled := False;
                  gbRecibo.Color := clBtnFace;
                  btnEliminar.Enabled := False;
                  btnAnular.Enabled := False;
               End;
         End;
   End;
End;   

// Inicio HPC_201804_LOG
// Se actualiza el grid de movimientos de pagos
Procedure TFReciboServicios.dbgServiciosRowChanged(Sender: TObject);
var
    xsql : String;
Begin
   edtNumero.Text := DMLOG.cdsObra.FieldByname('NUMSER').Asstring;
   edtNumeroCli.Text := DMLOG.cdsObra.FieldByname('NUMCLISUM').Asstring;
   edtTipoServicio.Text := DMLOG.cdsObra.FieldByname('DESTIPSER').Asstring;
   edtLocal.Text := DMLOG.cdsObra.FieldByname('LOCDES').Asstring;
   edtProvServicio.Text := DMLOG.cdsObra.FieldByname('PROVDES').Asstring;
   edtTitularServicio.Text := DMLOG.cdsObra.FieldByname('TITUSER').Asstring;
   edtFecReg.Text := DMLOG.cdsObra.FieldByname('FECREG').Asstring;
   edtUsuario.Text := DMLOG.wUsuario;
   if length(Trim(edtNumero.Text))>0 then
   begin
      cargagrid;
   end;

End;
// Fin HPC_201804_LOG
Procedure TFReciboServicios.Blanquea;
Begin
   edtNumero.Text := '';
   edtTipoServicio.Text := '';
   edtLocal.Text := '';
   edtProvServicio.Text := '';
   edtTitularServicio.Text := '';
   If DMLOG.cdsObra.Active Then DMLOG.cdsObra.EmptyDataSet;
   EdtDesfiltro.Text := '';
End;

Procedure TFReciboServicios.dbfiltroChange(Sender: TObject);
Begin
   If DMLOG.wModo = 'A' Then Blanquea;
End;

Procedure TFReciboServicios.dbgServiciosDblClick(Sender: TObject);
Begin
   gbRecibo.Enabled := True;
   gbRecibo.Color := $00C2E0CA;
   edtSerie.SetFocus;
End;

Procedure TFReciboServicios.btnAnularClick(Sender: TObject);
Var
   xSQL, vGraba: String;
Begin
   If (DateS < vFeciniPer) Or (DateS > vFecfinPer) Then
   Begin
      ShowMessage('No puede eliminar el RECIBO, ESTA FUERA DEL PERIODO OPERATIVO');
      exit;
   End;

   If MessageDlg('Esta seguro de ANULAR RECIBO' + #13 + ' ¿Desea Continuar?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
   Begin
      If (destado <> 'I') Then
      Begin
         If ((Mtx3100.FMant.cds2.fieldbyname('ESTADO').AsString <> 'C') And
            (TRIM(Mtx3100.FMant.cds2.fieldbyname('UBICACION').AsString) <> 'AU')) Then
         Begin
            ShowMessage('Solo puede ANULAR RECIBOS en estado INICIAL');
            vGraba := 'N'
         End
         Else
            vGraba := 'S';
      End
      Else
         vGraba := 'S';

      If vGraba = 'S' Then
      Begin
         xSQL := 'update LOG_MOV_SERVICIOS '
            + '   set ESTADO=''A'', USRANULA=''' + DMLOG.wUsuario + ''', FECANULA=SYSDATE  '
            + ' where CIAID=' + quotedstr(Mtx3100.FMant.cds2.fieldbyname('CIAID').AsString)
            + '   and KEYRECIBO=' + quotedstr(Mtx3100.FMant.cds2.fieldbyname('KEYRECIBO').AsString);
         DMLOG.DCOM1.AppServer.EjecutaSQL(Xsql);
         edtEstado.Text := 'ANULADO';
         edtEstado.Font.Color := clRed;
         ShowMessage('Se ANULÓ con Éxito');
         gbRecibo.Enabled := false;
         imgAnulado.Visible := True;
         btnAnular.Enabled := False;
         btnEliminar.Enabled := False;
         btnGrabar.Enabled := False;
         dbgServicios.Visible := False;
         vGraba := 'N'
      End;

   End;

End;

Procedure TFReciboServicios.btnEliminarClick(Sender: TObject);
Var
   xsql, vGraba: String;
Begin
   If (DateS < vFeciniPer) Or (DateS > vFecfinPer) Then
   Begin
      ShowMessage('No puede eliminar el RECIBO, ESTA FUERA DEL PERIODO OPERATIVO');
      exit;
   End;
   If MessageDlg('Esta seguro de ELIMINAR RECIBO' + #13 + ' ¿Desea Continuar?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
   Begin
      If (destado <> 'I') Then
      Begin
         If ((Mtx3100.FMant.cds2.fieldbyname('ESTADO').AsString <> 'C') And
            (TRIM(Mtx3100.FMant.cds2.fieldbyname('UBICACION').AsString) <> 'AU')) Then
         Begin
            ShowMessage('Solo puede ELIMINAR RECIBOS en estado INICIAL');
            vGraba := 'N'
         End
         Else
            vGraba := 'S';
      End
      Else
         vGraba := 'S';

      If vGraba = 'S' Then
      Begin
         xSQL := 'Update LOG_MOV_SERVICIOS '
            + '   set ESTADO=''E'', USRANULA=' + quotedstr(DMLOG.wUsuario) + ', '
            + '       FECANULA=SYSDATE '
            + ' where CIAID=' + quotedstr(Mtx3100.FMant.cds2.fieldbyname('CIAID').AsString)
            + '   and KEYRECIBO=' + quotedstr(Mtx3100.FMant.cds2.fieldbyname('KEYRECIBO').AsString);
         DMLOG.DCOM1.AppServer.EjecutaSQL(Xsql);
         edtEstado.Text := 'ELIMINADO';
         edtEstado.Font.Color := clRed;
         ShowMessage('Se ANULÓ con éxito');
         gbRecibo.Enabled := false;
         imgeliminado.Visible := True;
         btnAnular.Enabled := False;
         btnEliminar.Enabled := False;
         btnGrabar.Enabled := False;
         dbgServicios.Visible := False;
         vGraba := 'N'
      End;
   End;
End;

Procedure TFReciboServicios.edtSerieExit(Sender: TObject);
Begin
   If (btnGrabar.Focused) Or (dtnSalir.Focused) Then Exit;
//   edtSerie.Text := DMLOG.StrZero(TRIM(edtSerie.Text), 3);
// Inicio HPC_201804_LOG
// Se actualiza el grid de movimientos de pagos
//   edtNumRec.MaxLength := 10 - Length(TRIM(edtSerie.Text));
//   edtNumRec.SetFocus;
// Fin HPC_201804_LOG
End;

Procedure TFReciboServicios.edtNetoExit(Sender: TObject);
Begin
//Inicio HPC_201505_LOG
  { If (btnGrabar.Focused) Or (dtnSalir.Focused) Then Exit;
   If Length(Trim(edtNeto.Text)) = 0 Then
   Begin
      edtNeto.Text := '0.00';
   End;
   If Valores(edtNeto.Text) > 0 Then
   Begin
      edtIGV.Text := FloatToStr((Valores(edtNeto.Text) * vIGV) / 100);
   End;
   edtNeto.Text := FormatFloat('###,###.00', Valores(edtNeto.Text));
   edtImporte.Text := FormatFloat('###,###.00', Valores(edtNeto.Text) + Valores(edtIGV.Text));
   edtIGV.SetFocus;
   edtIGV.SelText;}
//Final HPC_201505_LOG
End;

Procedure TFReciboServicios.edtIGVChange(Sender: TObject);
Begin
//Inicio HPC_201505_LOG
   {If (btnGrabar.Focused) Or (dtnSalir.Focused) Then Exit;
   If Length(Trim(edtIGV.Text)) = 0 Then
   Begin
      edtIGV.Text := '0.00';
   End;
   edtIGV.Text := FormatFloat('###,###.00', Valores(edtIGV.Text));
   edtImporte.Text := FormatFloat('###,###.00', Valores(edtNeto.Text) + Valores(edtIGV.Text));
   dbdFecRecep.SetFocus; }
//Final HPC_201505_LOG

End;

Procedure TFReciboServicios.dbgServiciosCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
Begin
   If DMLOG.cdsObra.FieldByName('FLGCANAUT').AsString = 'S' Then
   Begin
      If Not Highlight Then
         AFont.Color := clGreen
      Else
         AFont.Color := clYellow;
   End;
End;

Procedure TFReciboServicios.bdeFecEmiExit(Sender: TObject);
Begin
   If (btnGrabar.Focused) Or (dtnSalir.Focused) Then Exit;
   dbdFechadel.SetFocus;
End;

Procedure TFReciboServicios.dblcTMonedaExit(Sender: TObject);
Begin
   If (btnGrabar.Focused) Or (dtnSalir.Focused) Then Exit;
 //Inicio HPC_201505_LOG
   //edtNeto.SetFocus;
// Inicio HPC_201804_LOG
// Se actualiza el grid de movimientos de pagos
//   edtImporte.SetFocus;
// Fin HPC_201804_LOG
 //Final HPC_201505_LOG
End;

//Validación de los datos ingresados

Function TFReciboServicios.ValidaIngreso: boolean;
Var
   xresult: boolean;
Begin
   CDSFALTINFO.EmptyDataSet;
   If (Length(TRim(edtNumRec.Text)) = 0) Then
   Begin
      CDSFALTINFO.Insert;
      CDSFALTINFO.FieldByName('DATO').AsString := 'Debe ingresar un NUMERO DE RECIBO valido';
   End;

   If Length(trim(bdeFecEmi.Text)) = 0 Then
   Begin
      CDSFALTINFO.Insert;
      CDSFALTINFO.FieldByName('DATO').AsString := 'Debe ingresar Fecha de Emisión';
   End;

   If (Length(trim(dbdFechadel.Text)) = 0) Or
      (Length(trim(dbdFechaal.Text)) = 0) Then
   Begin
      CDSFALTINFO.Insert;
      CDSFALTINFO.FieldByName('DATO').AsString := 'Debe ingresar Fecha de Facturación';
   End;

   If dbdFechaal.Date < dbdFechadel.Date Then
   Begin
      CDSFALTINFO.Insert;
      CDSFALTINFO.FieldByName('DATO').AsString := 'Fechas de Facturación Inconsistentes';
   End;

   If Length(trim(dbdFecVencimeinto.Text)) = 0 Then
   Begin
      CDSFALTINFO.Insert;
      CDSFALTINFO.FieldByName('DATO').AsString := 'Debe ingresar Fecha de Emisión';
   End;

   If Length(trim(dbdFecRecep.Text)) = 0 Then
   Begin
      CDSFALTINFO.Insert;
      CDSFALTINFO.FieldByName('DATO').AsString := 'Debe ingresar Fecha de Recepción';
   End;

   If Length(trim(dblcTMoneda.Text)) = 0 Then
   Begin
      CDSFALTINFO.Insert;
      CDSFALTINFO.FieldByName('DATO').AsString := 'Debe ingresar Tipo de Modena';
   End;
 //Inicio HPC_201505_LOG
  {If DMLOG.Valores(edtNeto.Text) = 0 Then
   Begin
      CDSFALTINFO.Insert;
      CDSFALTINFO.FieldByName('DATO').AsString := 'Debe ingresar valor Neto';
   End;}
 //Final HPC_201505_LOG

   If DMLOG.Valores(vTipoCambio) = 0 Then
   Begin
      CDSFALTINFO.Insert;
      CDSFALTINFO.FieldByName('DATO').AsString := 'No existe Tipo de Cambio del ' + bdeFecEmi.Text;
   End;

   CDSFALTINFO.First;
   //Inicio HPC_201505_LOG
   xresult := True;
   //Final HPC_201505_LOG
   If CDSFALTINFO.RecordCount > 0 Then xresult := False;
   Result := xResult;
End;

Procedure TFReciboServicios.bbtnAceptaPnlAdvertClick(Sender: TObject);
Begin
   pnlAdvertencias.visible := False;
   exit;
End;

//Inicio HPC_201505_LOG
//Desagrega IGV

Procedure TFReciboServicios.DesagregaIgv;
Begin
   edtNeto.Text := FloatToStr(Valores(edtImporte.Text) / ((vIGV / 100) + 1));
   edtIGV.Text := FloatToStr(Valores(edtImporte.Text) - Valores(edtNeto.Text));
End;
//Final HPC_201505_LOG	

// Inicio HPC_201804_LOG
// Se actualiza el grid de movimientos de pagos
Procedure TFReciboServicios.cargagrid;
var
  xsql : String;
begin
     xsql := 'Select SERIE, NUMREC, FECEMIREC, FECINIFAC, FECFINFAC, TIPMON, IMPORTE '
             + '  From LOG_MOV_SERVICIOS '
             + ' Where CIAID=' + quotedstr(trim(DMLOG.cdsObra.FieldByName('CIAID').AsString))
             + '   AND CODUNICO=' + quotedstr(trim(DMLOG.cdsObra.FieldByName('CODUNICO').AsString))
             + '   AND ESTADO <> ''E'' '
             + '   ORDER BY FECINIFAC DESC ';
     DMLOG.cdsMovPag.Close;
     DMLOG.cdsMovPag.DataRequest(xsql);
     DMLOG.cdsMovPag.Open;
     dbgMovServicios.DataSource := DMLOG.dsMovPag;
     dbgMovServicios.Selected.Clear;
     dbgMovServicios.Selected.Add('SERIE'#9'5'#9'Serie~Recibo'#9'F');
     dbgMovServicios.Selected.Add('NUMREC'#9'20'#9'Num~Recibo'#9'F');
     dbgMovServicios.Selected.Add('FECEMIREC'#9'10'#9'Fecha~Emisión'#9'F');
     dbgMovServicios.Selected.Add('FECINIFAC'#9'10'#9'Fecha~Inicio'#9'F');
     dbgMovServicios.Selected.Add('FECFINFAC'#9'10'#9'Fecha~Fin'#9'F');
     dbgMovServicios.Selected.Add('TIPMON'#9'2'#9'Tipo~Moneda'#9'F');
     dbgMovServicios.Selected.Add('IMPORTE'#9'14'#9'Importe'#9'F');
     dbgMovServicios.ApplySelected;
     dbgMovServicios.RefreshDisplay;
end;
// Fin HPC_201804_LOG
// Inicio HPC_201804_LOG
// Se actualiza el grid de movimientos de pagos
procedure TFReciboServicios.memObservacionExit(Sender: TObject);
begin
  if btnGrabar.Enabled = true then
     btnGrabar.Setfocus;
end;
// Fin HPC_201804_LOG
End.


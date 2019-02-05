Unit LOG271;
// Actualizaciones:
// HPC_201305_LOG 19/11/2011: Inicio de Formulario
//                            Orden de Trabajo
// HPC_201401_LOG 29/05/2014  En el GRID de detalle de OT al dar doble click está mostrando la descripción del trabajo detallado
//                            En la pantalla de asignación de OT se adicionó un botón para poder seguir asignado una nueva orden
//                            de trabajo sin necesidad de salir a la pantalla anterior
// HPC_201402_LOG 01/06/2014  Se adicionó rutina de eliminación de detalle
// HPC_201405_LOG 22/09/2014  Se adiciona control transaccional a la grabación de Órdenes de Trabajo
//                            Reordenaqmiento de la sangría
// HPC_201503_LOG 09/07/2015  Sólo se puede eliminar cuando el Estado es INICIAL
// HPC_201504_LOG 21/08/2015: Ajustes para visualización correcta de fechas

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Buttons, Wwdbigrd, StdCtrls, wwdbdatetimepicker, wwdblook,
   Grids, Wwdbgrid, ExtCtrls, Wwdbdlg, ppBands, ppCache, ppClass, ppDB,
   ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppReport, ppCtrls, ppStrtch,
   ppMemo, ppVar, ppPrnabl, DB, ppEndUsr, ppParameter;

Type
   TFOrdenTrabajo = Class(TForm)
      gbCabOrdenTrabajo: TGroupBox;
      Panel1: TPanel;
      edtOrdTrab: TEdit;
      gbDetalleOrdenTrabajo: TGroupBox;
      dbgDetalleTrabajo: TwwDBGrid;
      Label3: TLabel;
      dblcCIA: TwwDBLookupCombo;
      Label5: TLabel;
      edtCia: TEdit;
      gbReferencia: TGroupBox;
      dblcReferencia: TwwDBLookupCombo;
      edtReferencia: TEdit;
      edtNumReferencia: TEdit;
      dbdFecReferencia: TwwDBDateTimePicker;
      Label4: TLabel;
      Label6: TLabel;
      gbUbicacion: TGroupBox;
      Label1: TLabel;
      EdtLoc: TEdit;
      Label2: TLabel;
      edtCCosto: TEdit;
      gbTipTrabajo: TGroupBox;
      edtTipTrabajo: TEdit;
      memDescripcion: TMemo;
      Label7: TLabel;
      gbDatosGenerales: TGroupBox;
      Label8: TLabel;
      EdtFecCrea: TEdit;
      Label9: TLabel;
      edtUserCrea: TEdit;
      Label10: TLabel;
      Label11: TLabel;
      EdtFecInicio: TEdit;
      EdtFecFinal: TEdit;
      EdtEstado: TEdit;
      dbgDetalleTrabajoIButton: TwwIButton;
      Label12: TLabel;
      BiGrabaCabecera: TBitBtn;
      dblcLoc: TwwDBLookupComboDlg;
      dblCCosto: TwwDBLookupComboDlg;
      dblcTipTrabajo: TwwDBLookupComboDlg;
      dtnSalir: TBitBtn;
      Z1sbAcepta: TBitBtn;
      ppROrdenTrabajo: TppReport;
      ppDB1: TppBDEPipeline;
      btnReporteOC: TBitBtn;
      Z2bbtnRegresa: TBitBtn;
      BitBtn1: TBitBtn;
      Label13: TLabel;
      dbdFecRecepcion: TwwDBDateTimePicker;
      pD1: TppDesigner;
      ppHeaderBand1: TppHeaderBand;
      ppParameterList1: TppParameterList;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLabel1: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      pplbOrdenTrabajo: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppShape2: TppShape;
      ppShape1: TppShape;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppShape3: TppShape;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppmDescripcion: TppMemo;
      ppLine1: TppLine;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppShape4: TppShape;
      ppLabel20: TppLabel;
      pplblLocalidad: TppLabel;
      pplblCCosto: TppLabel;
      pplblProyecto: TppLabel;
      pplReferencia: TppLabel;
      pplNumeroRef: TppLabel;
      pplFechaRef: TppLabel;
      pplFechaInicio: TppLabel;
      pplFechaFinal: TppLabel;
      pplFechCreacion: TppLabel;
      pplEstado: TppLabel;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppLabel5: TppLabel;
      ppImage1: TppImage;
      ppDBMemo1: TppDBMemo;
      ppLine2: TppLine;
      pnlDetalleTrabajo: TPanel;
      memDetalle: TMemo;
      BitBtn2: TBitBtn;
      btnNuevo: TBitBtn;
      Procedure FormCreate(Sender: TObject);
      Procedure BiGrabaCabeceraClick(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcLocExit(Sender: TObject);
      Procedure dblCCostoExit(Sender: TObject);
      Procedure dblcTipTrabajoExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcReferenciaExit(Sender: TObject);
      Procedure dbgDetalleTrabajoIButtonClick(Sender: TObject);
      Procedure dtnSalirClick(Sender: TObject);
      Procedure btnReporteOCClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure Z1sbAceptaClick(Sender: TObject);
      Procedure Z2bbtnRegresaClick(Sender: TObject);
      Procedure dbgDetalleTrabajoKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure dbgDetalleTrabajoDblClick(Sender: TObject);
      Procedure btnNuevoClick(Sender: TObject);
      Procedure memDescripcionKeyPress(Sender: TObject; Var Key: Char);
      Procedure edtNumReferenciaKeyPress(Sender: TObject; Var Key: Char);
   Private
    { Private declarations }
      Procedure MuestraCabecera(vCiaid, vNumeroOrd: String);
      //Inicio HPC_201401_LOG
      Procedure blanqueaCampos();
      //Final HPC_201401_LOG
   Public
    { Public declarations }
   End;

Var
   FOrdenTrabajo: TFOrdenTrabajo;

Implementation
Uses LOGDM1, oaAD3100, LOG272;

{$R *.dfm}

Procedure TFOrdenTrabajo.FormCreate(Sender: TObject);
Var
   xSQL: String;
Begin

   gbCabOrdenTrabajo.color := clBtnFace;
   gbDetalleOrdenTrabajo.color := clBtnFace;
   pnlDetalleTrabajo.Visible := False;

// Compañia
   If DMLOG.cdsCia.Active = False Then
      DMLOG.FiltraTabla(DMLOG.cdsCia, 'TGE101', 'CIAID', 'CIAID');
   dblcCIA.LookUpField := 'CIAID';
   dblcCIA.LookUpTable := DMLOG.cdsCIA;
   dblcCIA.Selected.Clear;
   dblcCIA.Selected.Add('CIAID'#9'2'#9'Código'#9'F');
   dblcCIA.Selected.Add('CIADES'#9'40'#9'Descripción'#9'F');
   dblcCIA.Selected.Add('CIAABR'#9'15'#9'Abreviatura'#9'F');
   If DMLOG.cdsCia.RecordCount = 1 Then
   Begin
      dblcCIA.Text := DMLOG.cdsCia.FieldByname('CIAID').AsString;
      dblcCia.Enabled := False;
      If DMLOG.cdsCIA.locate('CIAID', VarArrayOf([DMLOG.cdsCIA.FieldByName('CIAID').AsString]), []) Then
         edtCia.Text := DMLOG.cdsCIA.FieldByname('CIADES').AsString
      Else
         edtCia.Text := '';
   End
   Else
   Begin
      dblcCia.Enabled := True;
   End;

// Locales
   xSQL := 'Select A.*,B.PROVDES PROPIETARIO From ACF120 A, TGE201 B WHERE A.CODPRO=B.PROV(+) order by LOCDES ';
   DMLOG.cdsLOC.Close;
   DMLOG.cdsLOC.DataRequest(xSQL);
   DMLOG.cdsLOC.PacketRecords := 20;
   DMLOG.cdsLOC.Open;
   dblcLOC.LookupField := 'LOCID';
   dblcLOC.LookupTable := DMLOG.cdsLOC;
   dblcLOC.Selected.Clear;
   dblcLOC.Selected.Add('LOCID'#9'4'#9'Código'#9'F');
   dblcLOC.Selected.Add('LOCDES'#9'30'#9'Descripción'#9'F');

// Centro de Costo
   xSQL := 'Select * FROM TGE203 WHERE CCOSACT=''S'' AND CCOSMOV=''S'' ';
   DMLOG.cdsCCost.Close;
   DMLOG.cdsCCost.DataRequest(xSQL);
   DMLOG.cdsCCost.Open;
   dblCCosto.LookupField := 'CCOSID';
   dblCCosto.LookupTable := DMLOG.cdsCCost;
   dblCCosto.Selected.Clear;
   dblCCosto.Selected.add('CCOSID'#9'10'#9'Código'#9'F');
   dblCCosto.Selected.add('CCOSABR'#9'30'#9'Descripción'#9'F');

// Referencia
   xSQL := 'Select * From LOG_TREQ_ORD_TRAB ';
   DMLOG.cdsTReqOrdTrab.Close;
   DMLOG.cdsTReqOrdTrab.DataRequest(xSQL);
   DMLOG.cdsTReqOrdTrab.Open;
   dblcReferencia.LookupField := 'TREQ_OT_ID';
   dblcReferencia.LookupTable := DMLOG.cdsTReqOrdTrab;
   dblcReferencia.Selected.Clear;
   dblcReferencia.Selected.add('TREQ_OT_ID'#9'5'#9'Código'#9'F');
   dblcReferencia.Selected.add('TREQ_OT_DES'#9'20'#9'Descripción'#9'F');

// Tipo de Trabajo
   xSQL := 'Select * From LOG_TIPO_TRABAJO ';
   DMLOG.cdsFAB.Close;
   DMLOG.cdsFAB.DataRequest(xSQL);
   DMLOG.cdsFAB.Open;
   dblcTipTrabajo.LookupField := 'TIPOTRABAJOID';
   dblcTipTrabajo.LookupTable := DMLOG.cdsFAB;
   dblcTipTrabajo.Selected.Clear;
   dblcTipTrabajo.Selected.add('TIPOTRABAJOID'#9'6'#9'Código'#9'F');
   dblcTipTrabajo.Selected.add('TIPOTRABAJODES'#9'30'#9'Descripción'#9'F');

   If DMLOG.wModo = 'M' Then
   Begin
      MuestraCabecera(Mtx3100.FMant.cds2.FieldByName('CIAID').AsString, Mtx3100.FMant.cds2.FieldByName('NUMORDTRA').AsString);
      gbCabOrdenTrabajo.Enabled := false;
      gbCabOrdenTrabajo.Color := clCream;

      If DMLOG.cdsOrdComp.FieldByName('ESTGENERAL').AsString <> 'INICIAL' Then
      Begin
         dbgDetalleTrabajoIButton.Enabled := False;
         gbDetalleOrdenTrabajo.Color := clCream;
         Z2bbtnRegresa.Enabled := False;
         Z1sbAcepta.Enabled := False;
      End
      Else
      Begin
         gbDetalleOrdenTrabajo.Enabled := True;
         dbgDetalleTrabajoIButton.Enabled := True;
         gbDetalleOrdenTrabajo.Color := clBtnFace;
         Z2bbtnRegresa.Enabled := True;
         Z1sbAcepta.Enabled := True;
      End;
   End;
End;

Procedure TFOrdenTrabajo.BiGrabaCabeceraClick(Sender: TObject);
Var
   xSQL, vSIGUIENTE: String;
   vFechaInicio: tdate;
Begin
// Consistencia datos ingresados
   If Length(Trim(dblcCIA.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar el código de compañia');
      exit;
   End;

   If Length(TRim(dbdFecRecepcion.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar la Fecha de Recepción');
      exit;
   End;

   If Length(Trim(dblcLoc.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar la Localidad');
      exit;
   End;

   If Length(Trim(dblCCosto.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar el Centro de Costo');
      exit;
   End;

   If Length(Trim(dblcTipTrabajo.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar el Centro de Costo');
      exit;
   End;

   If Length(Trim(dblcTipTrabajo.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar el Centro de Costo');
      exit;
   End;

   If Length(Trim(dbdFecReferencia.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar la Fecha de Referencia');
      exit;
   End;

// Inserta Informacion
   If DMLOG.wModo = 'A' Then
   Begin
   // Correlativo siguiente
      xSQL := 'Select nvl(max(NUMORDTRA),''000000000'')ULTIMO, to_char(SYSDATE,''YYYY'') ANHO '
         + '     from LOG_ORDEN_TRABAJO_CAB '
         + '    where SUBSTR(NUMORDTRA,1,4)=TO_CHAR(SYSDATE,''YYYY'')';
      DMLOG.cdsQry1.Close;
      DMLOG.cdsQry1.DataRequest(xSQL);
      DMLOG.cdsQry1.Open;
      If DMLOG.cdsQry1.FieldByName('ULTIMO').AsInteger = 0 Then
         VSIGUIENTE := DMLOG.cdsQry1.FieldByName('ANHO').AsString + '000001'
      Else
         VSIGUIENTE := IntToStr(DMLOG.cdsQry1.FieldByName('ULTIMO').AsInteger + 1);

      If MessageDlg('Desea grabar la Orden de Trabajo?', mtconfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         xSQL := 'Insert INTO LOG_ORDEN_TRABAJO_CAB(CIAID,FECCREACION,NUMORDTRA,TREQ_OT_ID,NUMREF,FECREF,FECREC,CODLOC,'
            + '                                     CCOSID,TIPOTRABAJOID,OBSTRAB,ESTGENERAL,FECINIGEN,USUARIO)'
            + '   Values('+quotedstr(dblcCIA.Text)+',Sysdate,'+quotedstr(VSIGUIENTE)+','+quotedstr(trim(dblcReferencia.Text))+','
            +              quotedstr(trim(edtNumReferencia.Text))+','
            +              quotedstr(dbdFecReferencia.Text)+','
            +              quotedstr(dbdFecRecepcion.Text)+','
            +              quotedstr(dblcLoc.Text)+','
            +              quotedstr(dblCCosto.Text)+','
            +              quotedstr(dblcTipTrabajo.Text)+','
            +              quotedstr(memDescripcion.Lines.Text)+','
            +              quotedstr('INICIAL')+','
            + '            Sysdate,'
            +              quotedstr(DMLOG.wUsuario)+')';
         DMLOG.DCOM1.AppServer.IniciaTransaccion;
         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo añadir la Orden de Trabajo');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            Raise;
            exit;
         End;
         DMLOG.DCOM1.AppServer.GrabaTransaccion;
         edtOrdTrab.Text := VSIGUIENTE;
         BiGrabaCabecera.Enabled := False;
         ShowMessage('Grabación exitosa' + #13 + 'La Orden de Trabajo se ha grabado con el N°' + VSIGUIENTE);
         MuestraCabecera(dblcCIA.Text, VSIGUIENTE);
         gbCabOrdenTrabajo.Enabled := False;
         gbDetalleOrdenTrabajo.Enabled := True;
         gbCabOrdenTrabajo.Color := clCream;
      End;
   End;

   If DMLOG.wModo = 'M' Then
   Begin
      If MessageDlg('Desea grabar las Modificaciones?', mtconfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         xSQL := 'Update LOG_ORDEN_TRABAJO_CAB '
            + '      Set TREQ_OT_ID=''' + TRIM(dblcReferencia.Text) + ''','
            + '          NUMREF=''' + TRIM(edtNumReferencia.Text) + ''','
            + '          FECREF=''' + dbdFecReferencia.Text + ''','
            + '          FECREC=''' + dbdFecRecepcion.Text + ''','
            + '          CODLOC=''' + dblcLoc.Text + ''','
            + '          CCOSID=''' + dblCCosto.Text + ''','
            + '          TIPOTRABAJOID=''' + dblcTipTrabajo.Text + ''', '
            + '          OBSTRAB = ' + quotedstr(memDescripcion.lines.Text)
            + '    Where CIAID=''' + dblcCIA.Text + ''' And NUMORDTRA=''' + edtOrdTrab.Text + ''' ';
         DMLOG.DCOM1.AppServer.IniciaTransaccion;
         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo grabar la Orden de Trabajo');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            Raise;
            exit;
         End;
         DMLOG.DCOM1.AppServer.GrabaTransaccion;
         BiGrabaCabecera.Enabled := False;
         ShowMessage('Grabación exitosa' + #13 + 'La Orden de Trabajo se ha grabado con el N°' + edtOrdTrab.Text);
         MuestraCabecera(dblcCIA.Text, edtOrdTrab.Text);
         gbCabOrdenTrabajo.Enabled := False;
         gbDetalleOrdenTrabajo.Enabled := True;
         gbCabOrdenTrabajo.Color := clCream;
      End;
   End;
End;

Procedure TFOrdenTrabajo.MuestraCabecera(vCiaid, vNumeroOrd: String);
Var
   xSQL: String;
Begin

   xSQL := 'Select * From LOG_ORDEN_TRABAJO_CAB Where Ciaid=''' + vCiaid + ''' And NumOrdTra=''' + vNumeroOrd + ''' ';
   DMLOG.cdsOrdComp.Close;
   DMLOG.cdsOrdComp.DataRequest(xSQL);
   DMLOG.cdsOrdComp.Open;
   If DMLOG.cdsOrdComp.RecordCount > 0 Then
   Begin
      dblcCIA.Text := DMLOG.cdsOrdComp.FieldByname('CIAID').AsString;
      dbdFecRecepcion.DateTime := DMLOG.cdsOrdComp.FieldByname('FECREC').AsDateTime;
      dbdFecReferencia.DateTime := DMLOG.cdsOrdComp.FieldByname('FECREF').AsDateTime;
      dblcLoc.Text := DMLOG.cdsOrdComp.FieldByname('CODLOC').AsString;
      dblcReferencia.Text := DMLOG.cdsOrdComp.FieldByname('TREQ_OT_ID').AsString;
      edtNumReferencia.Text := DMLOG.cdsOrdComp.FieldByname('NUMREF').AsString;
      dblCCosto.Text := DMLOG.cdsOrdComp.FieldByname('CCOSID').AsString;
      dblcTipTrabajo.Text := DMLOG.cdsOrdComp.FieldByname('TIPOTRABAJOID').AsString;
      memDescripcion.Lines.Text := DMLOG.cdsOrdComp.FieldByname('OBSTRAB').AsString;
      EdtFecCrea.Text := DMLOG.cdsOrdComp.FieldByname('FECCREACION').AsString;
      EdtFecInicio.Text := DMLOG.cdsOrdComp.FieldByname('FECINIGEN').AsString;
      EdtFecFinal.Text := DMLOG.cdsOrdComp.FieldByname('FECFINGEN').AsString;
      EdtUserCrea.Text := DMLOG.cdsOrdComp.FieldByname('USUARIO').AsString;
      EdtEstado.Text := DMLOG.cdsOrdComp.FieldByname('ESTGENERAL').AsString;
      edtOrdTrab.Text := DMLOG.cdsOrdComp.FieldByname('NUMORDTRA').AsString;
      dblcCIAExit(self);
      dblcLocExit(self);
      dblCCostoExit(Self);
      dblcTipTrabajoExit(Self);
      dblcReferenciaExit(Self);
   End;
End;

Procedure TFOrdenTrabajo.dblcCIAExit(Sender: TObject);
Begin
   If DMLOG.cdsCIA.locate('CIAID', VarArrayOf([dblcCIA.Text]), []) Then
      edtCia.Text := DMLOG.cdsCIA.FieldByname('CIADES').AsString
   Else
      edtCia.Text := '';
End;

Procedure TFOrdenTrabajo.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFOrdenTrabajo.dblcLocExit(Sender: TObject);
Begin
   If DMLOG.cdsLOC.locate('LOCID', VarArrayOf([dblcLoc.Text]), []) Then
      EdtLoc.Text := DMLOG.cdsLOC.FieldByname('LOCDES').AsString
   Else
      EdtLoc.Text := '';
End;

Procedure TFOrdenTrabajo.dblCCostoExit(Sender: TObject);
Begin
   If DMLOG.cdsCCost.locate('CCOSID', VarArrayOf([dblCCosto.Text]), []) Then
      EdtCCosto.Text := DMLOG.cdsCCost.FieldByname('CCOSDES').AsString
   Else
      EdtCCosto.Text := '';
End;

Procedure TFOrdenTrabajo.dblcTipTrabajoExit(Sender: TObject);
Begin
   If DMLOG.cdsFAB.locate('TIPOTRABAJOID', VarArrayOf([dblcTipTrabajo.Text]), []) Then
      edtTipTrabajo.Text := DMLOG.cdsFAB.FieldByname('TIPOTRABAJODES').AsString
   Else
      edtTipTrabajo.Text := '';
End;

Procedure TFOrdenTrabajo.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMLOG.cdsLOC.Close;
   DMLOG.cdsCCost.Close;
   DMLOG.cdsTReqOrdTrab.Close;
   DMLOG.cdsFAB.Close;
   DMLOG.cdsQry1.Close;
   DMLOG.cdsOrdComp.Close;
   DMLOG.cdsOCNIA.Close;
   Action := caFree;
End;

Procedure TFOrdenTrabajo.dblcReferenciaExit(Sender: TObject);
Begin
   If DMLOG.cdsTReqOrdTrab.locate('TREQ_OT_ID', VarArrayOf([dblcReferencia.Text]), []) Then
      edtReferencia.Text := DMLOG.cdsTReqOrdTrab.FieldByname('TREQ_OT_DES').AsString
   Else
      edtReferencia.Text := '';
End;

Procedure TFOrdenTrabajo.dbgDetalleTrabajoIButtonClick(Sender: TObject);
Begin

   If Length(Trim(edtOrdTrab.Text)) = 0 Then
   Begin
      ShowMessage('No puede ingresar detalle de OT, debe primero GRABAR la cabecera de la OT');
      EXIT;
   End;

   DMLOG.wModo := 'A'; //Adiciona
   fDetalleOrdTrab := TfDetalleOrdTrab.Create(Self); // LOG272.PAS
   fDetalleOrdTrab.edtOrdTrebajo.Text := edtOrdTrab.Text;
   fDetalleOrdTrab.edtFecCreacion.Text := EdtFecCrea.Text;
   fDetalleOrdTrab.memDescripcion.Lines.Text := memDescripcion.Lines.Text;
   fDetalleOrdTrab.edtUsuCreacion.Text := edtUserCrea.Text;
   fDetalleOrdTrab.EdtCiaid.Text := dblcCIA.Text;
   fDetalleOrdTrab.EdtCia.Text := edtCia.Text;
   fDetalleOrdTrab.ShowModal;

// Actualiza grid
   xSQL := 'Select * From LOG_ORDEN_TRABAJO_DET A, LOG_TIPO_TRABAJO B,TGE135 C '
      + ' Where A.CIAID=' + quotedstr(dblcCIA.Text)
      + '   and A.NUMORDTRA=' + quotedstr(Trim(edtOrdTrab.Text))
      + '   and A.TIPOTRABAJOID=B.TIPOTRABAJOID(+) AND A.CODRESPONSABLE=COMPCID(+) '
      + ' Order by NUMORDDET  ';
   DMLOG.cdsOCNIA.Close;
   DMLOG.cdsOCNIA.DataRequest(xSQL);
   DMLOG.cdsOCNIA.Open;
End;

Procedure TFOrdenTrabajo.dtnSalirClick(Sender: TObject);
Begin
   close;
End;

Procedure TFOrdenTrabajo.btnReporteOCClick(Sender: TObject);
Begin

   If (DMLOG.cdsOCNIA.RecordCount = 0) Or
      (Length(Trim(edtOrdTrab.Text)) = 0) Then
   Begin
      ShowMessage('No Puede imprimir OT, información incompleta');
      Exit;
   End;

 //Cabecera de Orden de Trabajo
   pplblLocalidad.Caption := EdtLoc.Text;
   pplblCCosto.Caption := edtCCosto.Text;
   pplblProyecto.Caption := edtTipTrabajo.Text;
   pplReferencia.Caption := edtReferencia.Text;
   pplNumeroRef.Caption := edtNumReferencia.Text;
   pplFechaRef.Caption := dbdFecReferencia.Text;
   pplFechaInicio.Caption := EdtFecInicio.Text;
   pplFechaFinal.Caption := EdtFecFinal.Text;
   pplFechCreacion.Caption := EdtFecCrea.Text;
   ppmDescripcion.Lines.Text := memDescripcion.Lines.Text;
   pplbOrdenTrabajo.Caption := edtOrdTrab.Text;
   pplEstado.Caption := EdtEstado.Text;

   ppDB1.DataSource := DMLOG.dsOCNIA;
   ppROrdenTrabajo.Print;
   ppROrdenTrabajo.Stop;
End;

Procedure TFOrdenTrabajo.FormShow(Sender: TObject);
Var
   xsq: String;
Begin
 //Detalle de trabajo
   dbgDetalleTrabajo.Selected.Clear;
   dbgDetalleTrabajo.Selected.Add('NUMORDDET'#9'04'#9'Nro'#9'F');
   dbgDetalleTrabajo.Selected.Add('COMPDES'#9'20'#9'Responsable'#9'F');
   dbgDetalleTrabajo.Selected.Add('TIPOTRABAJODES'#9'20'#9'Desc.Trabajo'#9'F');
   dbgDetalleTrabajo.Selected.Add('ESTTRAB'#9'10'#9'Estado'#9'F');
   dbgDetalleTrabajo.Selected.Add('FECINITRAB'#9'10'#9'Fec.Ini'#9'F');
   dbgDetalleTrabajo.Selected.Add('FECFINTRAB'#9'10'#9'Fec.Fin'#9'F');
   dbgDetalleTrabajo.Selected.Add('NUMATENCION'#9'10'#9'Doc.Aten.'#9'F');
   dbgDetalleTrabajo.Refresh;
   xSQL := 'Select * '
      + '     From LOG_ORDEN_TRABAJO_DET A, LOG_TIPO_TRABAJO B,TGE135 C '
      + '    Where A.CIAID=' + quotedstr(dblcCIA.Text)
      + '      and A.NUMORDTRA=' + quotedstr(Trim(edtOrdTrab.Text))
      + '      and A.TIPOTRABAJOID=B.TIPOTRABAJOID(+) AND A.CODRESPONSABLE=COMPCID(+) '
      + '    Order by NUMORDDET ';
   DMLOG.cdsOCNIA.Close;
   DMLOG.cdsOCNIA.DataRequest(xSQL);
   DMLOG.cdsOCNIA.Open;
   dbgDetalleTrabajo.DataSource := DMLOG.dsOCNIA;
End;

Procedure TFOrdenTrabajo.Z1sbAceptaClick(Sender: TObject);
Var
   xSQL: String;
Begin

   If DMLOG.cdsOCNIA.RecordCount = 0 Then
   Begin
      ShowMessage('No Existe detalle de OT, No puede cerrar');
      exit;
   End;

   If MessageDlg('Desea Aceptar la Orden de trabajo?', mtconfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      xSQL := 'Update LOG_ORDEN_TRABAJO_CAB '
         + '      Set ESTGENERAL=''PENDIENTE'' '
         + '    Where Ciaid=''' + Trim(dblcCIA.Text) + ''' And Numordtra=''' + Trim(edtOrdTrab.Text) + ''' ';
      DMLOG.DCOM1.AppServer.IniciaTransaccion;
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo aceptar la Cabecera de Orden de Trabajo');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Raise;
         exit;
      End;

      xSQL := 'Update LOG_ORDEN_TRABAJO_DET '
         + '      Set ESTTRAB=''PENDIENTE'' '
         + '    Where Ciaid=''' + Trim(dblcCIA.Text) + ''' And Numordtra=''' + Trim(edtOrdTrab.Text) + ''' ';

      DMLOG.DCOM1.AppServer.IniciaTransaccion;
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo aceptar el Detalle de la Orden de Trabajo');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Raise;
         exit;
      End;

      DMLOG.DCOM1.AppServer.GrabaTransaccion;
      ShowMessage('Se Aceptó la Orden de Trabajo con Éxito.');
      gbDetalleOrdenTrabajo.Enabled := False;
      gbDetalleOrdenTrabajo.Color := clCream;
      blanqueaCampos();
   End;
End;

Procedure TFOrdenTrabajo.Z2bbtnRegresaClick(Sender: TObject);
Begin
   DMLOG.wModo := 'M';
   gbCabOrdenTrabajo.Enabled := True;
   gbCabOrdenTrabajo.Color := clBtnFace;
   dbdFecRecepcion.SetFocus;
   gbDetalleOrdenTrabajo.Enabled := True;
   BiGrabaCabecera.Enabled := True;
End;

Procedure TFOrdenTrabajo.dbgDetalleTrabajoKeyDown(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Var
   xSQL: String;
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
   // Sólo se puede eliminar cuando el Estado es INICIAL
      If DMLOG.cdsOrdComp.FieldByName('ESTGENERAL').AsString <> 'INICIAL' Then
      Begin
         ShowMessage('Sólo se puede eliminar cuando el Estado es INICIAL');
         Exit;
      End;

      If MessageDlg('¿Esta Seguro de Eliminar Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         xSQL := 'Delete LOG_ORDEN_TRABAJO_DET '
            + '    Where CIAID=''' + DMLOG.cdsOCNIA.FieldByname('CIAID').Asstring + ''' '
            + '      and NUMORDTRA=''' + DMLOG.cdsOCNIA.FieldByname('NUMORDTRA').Asstring + ''' '
            + '      and NUMORDDET=''' + DMLOG.cdsOCNIA.FieldByname('NUMORDDET').Asstring + ''' '
            + '      and CODRESPONSABLE=''' + DMLOG.cdsOCNIA.FieldByname('CODRESPONSABLE').Asstring + ''' ';
         DMLOG.DCOM1.AppServer.IniciaTransaccion;
         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo ELIMINAR la Orden de Trabajo');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            Raise;
            exit;
         End;
         DMLOG.DCOM1.AppServer.GrabaTransaccion;
         FormShow(Self);
      End;
   End;
End;

Procedure TFOrdenTrabajo.BitBtn2Click(Sender: TObject);
Begin
   pnlDetalleTrabajo.Visible := False;
End;

Procedure TFOrdenTrabajo.dbgDetalleTrabajoDblClick(Sender: TObject);
Begin
   pnlDetalleTrabajo.Left := 152;
   pnlDetalleTrabajo.Top := 488;
   memDetalle.Lines.Text := DMLOG.cdsOCNIA.FieldByName('OBSDETTRAB').AsString;
   pnlDetalleTrabajo.Visible := True;
End;

Procedure TFOrdenTrabajo.blanqueaCampos;
Begin
   gbCabOrdenTrabajo.Enabled := True;
   dblcLoc.Text := '';
   dblCCosto.Text := '';
   dblcTipTrabajo.Text := '';
   dblcReferencia.Text := '';
   edtNumReferencia.Text := '';
   dbdFecReferencia.Text := '';
   dbdFecRecepcion.Text := '';
   edtFecCrea.Text := '';
   edtUserCrea.Text := '';
   edtFecInicio.Text := '';
   edtFecFinal.Text := '';
   edtEstado.Text := '';
   memDescripcion.Lines.Text := '';
   edtTipTrabajo.Text := '';
   edtCCosto.Text := '';
   edtLoc.Text := '';
   edtReferencia.Text := '';
   edtOrdTrab.Text := '';
   DMLOG.wModo := 'A';
   BiGrabaCabecera.Enabled := True;
   DMLOG.cdsOCNIA.EmptyDataSet;
   dbgDetalleTrabajoIButton.Enabled := True;
   dblcLoc.SetFocus;
End;

Procedure TFOrdenTrabajo.btnNuevoClick(Sender: TObject);
Begin
   blanqueaCampos();
End;

Procedure TFOrdenTrabajo.memDescripcionKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If Key In [Chr(39), '´'] Then
      Key := #0;
End;

Procedure TFOrdenTrabajo.edtNumReferenciaKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If Key In [Chr(39), '´'] Then
      Key := #0;
End;

End.


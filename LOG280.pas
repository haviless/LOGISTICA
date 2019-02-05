Unit LOG280;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG280 (ex LOG267)
//Formulario               : FMaestroServicios
//Fecha de Creación        : 23/10/2013
//Autor                    : Ricardo Medina
//Objetivo                 : Ingresar los Servicios Institucionales por local
//Actualizaciones:
// HPC_201304_LOG          : 23/09/2013  CREACIÓN DE FORMULARIO
// HPC_201403_LOG          : 13/06/0214  SE ADICIONA UN CHK PARA PODER MODIFICAR DETALLE DEL SERVICIO
// HPC_201305_LOG          : 14/10/2014  Se renombran las Unidades Pascal de Mantenimiento del Maestro de Servicios Institucionales
//                                       de LOG267 a LOG280
//                                       reordenamiento de Sangría

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, wwdblook, Buttons, Wwdbdlg, Mask, wwdbedit, Wwdbspin, wwidlg, mant,
   ExtCtrls, DB;

Type
   TFMaestroServicios = Class(TForm)
      gbDatosGenerales: TGroupBox;
      gbParametros: TGroupBox;
      dblcCIA: TwwDBLookupCombo;
      edtCia: TEdit;
      dblcLOC: TwwDBLookupCombo;
      edtLoc: TEdit;
      edtCliSuministro: TEdit;
      EdtDireccion: TEdit;
      edtProvServicio: TEdit;
      cbSerRecurr: TComboBox;
      cbTipIntervalo: TComboBox;
      dbsNumIntervalo: TwwDBSpinEdit;
      gbEstado: TGroupBox;
      cbSerActivo: TComboBox;
      dblcTipServicio: TwwDBLookupCombo;
      edtTipServicio: TEdit;
      EdtPropietario: TEdit;
      dblcTitServicio: TwwDBLookupComboDlg;
      EdtTitServicio: TEdit;
      edtNumServicio: TEdit;
      lblCia: TLabel;
      lblLocal: TLabel;
      lblDireccion: TLabel;
      lblPropietario: TLabel;
      lblTipServicio: TLabel;
      lblCliente: TLabel;
      lblNumServ: TLabel;
      lblProveedor: TLabel;
      lblTitular: TLabel;
      lblSerRec: TLabel;
      lblTipInt: TLabel;
      lblNumInt: TLabel;
      lblSerAct: TLabel;
      dblcProvServ: TwwDBLookupComboDlg;
      edtDescripcion: TEdit;
      lblDescripAbrev: TLabel;
      chkCanAut: TCheckBox;
      memoObservacion: TMemo;
      GroupBox3: TGroupBox;
      edtCodUnico: TEdit;
      pnlConfirme: TPanel;
      Shape1: TShape;
      lblConfirmaServicio: TLabel;
      edtConfirme: TEdit;
      Z2bbtnGraba: TBitBtn;
      btnSalir: TBitBtn;
      gbopciones: TGroupBox;
      chkDerrama: TCheckBox;
      chkmodifica: TCheckBox;
      BitBtn1: TBitBtn;
      Label1: TLabel;
      dblcClaseAux: TwwDBLookupCombo;
      edtClaseAux: TEdit;
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcProvServExit(Sender: TObject);
      Procedure dblcTitServicioExit(Sender: TObject);
      Procedure cbSerRecurrExit(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormCreate(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure edtNumServicioExit(Sender: TObject);
      Procedure dblcTipServicioExit(Sender: TObject);
      Procedure dblcProvServChange(Sender: TObject);
      Procedure dblcTitServicioChange(Sender: TObject);
      Procedure dblcTipServicioChange(Sender: TObject);
      Procedure dblcLOCChange(Sender: TObject);
      Procedure dblcCIAChange(Sender: TObject);
      Procedure edtDescripcionExit(Sender: TObject);
      Procedure btnSalirClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure edtCliSuministroExit(Sender: TObject);
      Procedure edtConfirmeExit(Sender: TObject);
      Procedure edtCliSuministroKeyPress(Sender: TObject; Var Key: Char);
      Procedure chkDerramaClick(Sender: TObject);
      Procedure chkmodificaClick(Sender: TObject);
      Procedure nuevo();
      Procedure BitBtn1Click(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
      xconponente: String;
   End;

Var
   FMaestroServicios: TFMaestroServicios;
   xClaseAux: String;

Implementation

Uses LOGDM1, oaAD2000;

{$R *.dfm}

Procedure TFMaestroServicios.dblcCIAExit(Sender: TObject);
Begin
   If DMLOG.cdsCIA.locate('CIAID', VarArrayOf([DMLOG.cdsCIA.FieldByName('CIAID').AsString]), []) Then
      edtCia.Text := DMLOG.cdsCIA.FieldByname('CIADES').AsString
   Else
      edtCia.Text := '';

   If Length(trim(dblcLOC.Text)) = 0 Then
   Begin
      dblcLOC.SetFocus;
      dblcLOC.DropDown;
   End;
End;

Procedure TFMaestroServicios.dblcLOCExit(Sender: TObject);
Begin
   If (Z2bbtnGraba.Focused) Or (btnSalir.Focused) Then Exit;

   If DMLOG.cdsLOC.locate('LOCID', VarArrayOf([DMLOG.cdsLOC.FieldByName('LOCID').AsString]), []) Then
   Begin
      EdtLoc.Text := DMLOG.cdsLOC.FieldByname('LOCDES').AsString;
      EdtDireccion.Text := DMLOG.cdsLOC.FieldByname('DIRECCION').AsString;
      EdtPropietario.Text := DMLOG.cdsLOC.FieldByname('PROPIETARIO').AsString;
   End
   Else
   Begin
      EdtLoc.Text := '';
      EdtDireccion.Text := '';
      EdtPropietario.Text := '';
   End;

   If Length(Trim(dblcTipServicio.Text)) = 0 Then
   Begin
      dblcTipServicio.SetFocus;
      dblcTipServicio.DropDown;
   End;
End;

Procedure TFMaestroServicios.dblcProvServExit(Sender: TObject);
Begin
   If (Z2bbtnGraba.Focused) Or (btnSalir.Focused) Then Exit;
   If DMLOG.cdsProv.Locate('PROV', VarArrayOf([DMLOG.cdsProv.FieldByName('PROV').AsString]), []) Then
   Begin
      xClaseAux := DMLOG.cdsProv.FieldByName('CLAUXID').AsString;
      edtProvServicio.Text := DMLOG.cdsProv.FieldByName('PROVDES').AsString;
      dblcClaseAux.Text := DMLOG.cdsProv.FieldByName('CLAUXID').AsString;
      edtClaseAux.Text := DMLOG.BuscaQry('prvTGE', 'TGE102', 'CLAUXDES', 'CLAUXID=' + quotedstr(xClaseAux), 'CLAUXDES');
   End
   Else
      edtProvServicio.Text := '';
End;

Procedure TFMaestroServicios.dblcTitServicioExit(Sender: TObject);
Begin
   If (Z2bbtnGraba.Focused) Or (btnSalir.Focused) Then Exit;
   If DMLOG.cdsListaTx.Locate('PROV', VarArrayOf([DMLOG.cdsListaTx.FieldByName('PROV').AsString]), []) Then
      EdtTitServicio.Text := DMLOG.cdsListaTx.FieldByName('PROVDES').AsString
   Else
      EdtTitServicio.Text := '';

   cbSerRecurr.SetFocus;
   cbSerRecurr.DroppedDown;
End;

Procedure TFMaestroServicios.cbSerRecurrExit(Sender: TObject);
Begin
   If cbSerRecurr.Text = 'S' Then
   Begin
      cbTipIntervalo.Enabled := True;
      dbsNumIntervalo.Enabled := True;
   End
   Else
   Begin
      cbTipIntervalo.Text := '';
      dbsNumIntervalo.Value := 0;
      cbTipIntervalo.Enabled := False;
      dbsNumIntervalo.Enabled := False;
   End;
End;

Procedure TFMaestroServicios.Z2bbtnGrabaClick(Sender: TObject);
Var
   xSQL, VCANAUT, VSIGUIENTE, VPAGDERRAMA: String;
Begin
// Consistencia Información
   If Length(Trim(dblcCIA.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar Compañía..');
      exit;
   End;

   If Length(Trim(dblcLOC.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar Local...');
      exit;
   End;

   If Length(Trim(dblcTipServicio.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar Tipo de Servicio...');
      exit;
   End;

   If Length(Trim(dblcProvServ.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar Proveedor del Servicio...');
      exit;
   End;

   If (Length(Trim(dblcTitServicio.Text)) = 0) And (Not chkDerrama.Checked) Then
   Begin
      ShowMessage('Debe ingresar Titular del Servicio...');
      exit;
   End;

   If chkCanAut.Checked Then
      VCANAUT := 'S'
   Else
      VCANAUT := 'N';

   If chkDerrama.Checked Then
      VPAGDERRAMA := 'S'
   Else
      VPAGDERRAMA := 'N';

// Inserta Informacion
   If DMLOG.wModo = 'A' Then
   Begin
   // Correlativo siguiente
      xSQL := 'Select nvl(max(CODUNICO),''000000000'') ULTIMO, '
         + '          to_char(Sysdate,''YYYY'') ANHO '
         + '     from LOG_MAE_SERVICIOS '
         + '    where substr(CODUNICO,1,4) = to_char(Sysdate,''YYYY'')';
      DMLOG.cdsQry1.Close;
      DMLOG.cdsQry1.DataRequest(xSQL);
      DMLOG.cdsQry1.Open;
      If DMLOG.cdsQry1.FieldByName('ULTIMO').AsInteger = 0 Then
         VSIGUIENTE := DMLOG.cdsQry1.FieldByName('ANHO').AsString + '00001'
      Else
         VSIGUIENTE := IntToStr(DMLOG.cdsQry1.FieldByName('ULTIMO').AsInteger + 1);

   // Verificar si el servicio ya existe y esta activo
      xSQL := 'Select nvl(FLGESTADO,''I'') FLGESTADO '
         + '     From LOG_MAE_SERVICIOS '
         + '    Where CODSER=' + quotedstr(dblcTipServicio.Text)
         + '      and NUMCLISUM=' + quotedstr(trim(edtCliSuministro.Text))
         + '      and NUMSER=' + quotedstr(trim(edtNumServicio.Text));
      DMLOG.cdsQry1.Close;
      DMLOG.cdsQry1.DataRequest(xSQL);
      DMLOG.cdsQry1.Open;

      If DMLOG.cdsQry1.RecordCount > 0 Then
      Begin
         ShowMessage('El Servicio a registrar ya existe, verifique.......');
         Exit;
      End;

      If MessageDlg('¿Desea grabar el Servicio?', mtconfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         xSQL := 'Insert into LOG_MAE_SERVICIOS('
            + '                 CIAID, CODSER, NUMCLISUM, NUMSER, FLGESTADO, CODPROV, '
            + '                 LOCID, SERREC, TIPINT, NUMINT, CODTITSER, USUREG, '
            + '                 DESCRIPCION, FLGCANAUT, CODUNICO, OBSERVACION, FLGPAGDER, '
            + '                 FECREG, CLAUXID) '
            + 'values(' + quotedstr(dblcCIA.Text) + ',' // CODIGO DE COMPAÑIA
            + quotedstr(dblcTipServicio.Text) + ',' // CODIGO DE SERVICIO (TIPO DE SERVICIO)
            + quotedstr(trim(edtCliSuministro.Text)) + ',' // NUMERO DE CLIENTE/SUMINISTRO
            + quotedstr(trim(edtNumServicio.Text)) + ',' // NUMERO DE SERVICIO
            + quotedstr(cbSerActivo.Text) + ',' // FLAG DE ESTADO DEL SERVICIO I=INACTIVO A o NULL ACTIVO
            + quotedstr(dblcProvServ.Text) + ',' // CODIGO DE PROVEEDOR (TGE201)  (P y H)
            + quotedstr(dblcLOC.Text) + ',' // CODIGO DE LOCAL (ACF120)
            + quotedstr(cbSerRecurr.Text) + ',' // SERVICIO RECURRENTE  NULL=NO  X=SI
            + quotedstr(UpperCase(COPY(cbTipIntervalo.Text, 1, 3))) + ',' // TIPO DE INTERVALO DIA,MES
            + dbsNumIntervalo.Text + ',' // NUMERO DE INTERVALO
            + quotedstr(dblcTitServicio.Text) + ',' // CODIGO DEL TITULAR DEL SERVICIO (TGE201) (P y H)
            + quotedstr(DMLOG.wUsuario) + ',' // USUARIO QUE REGISTRA
            + quotedstr(edtDescripcion.Text) + ',' // DESCRIPCION ABRE DEL SERVICIO
            + quotedstr(VCANAUT) + ',' // FLAG DE CANCELACION AUTOMATICA
            + quotedstr(VSIGUIENTE) + ',' // CODIGO UNICO  YYYYCORR
            + quotedstr(Trim(memoObservacion.Lines.Text)) + ',' // ALGUNA OBSERVACIÓN
            + quotedstr(VPAGDERRAMA) + ',' // PAGA DERRAMA  SI=S NO= N o blanco
            + '          sysdate, ' // FECHA QUE REGISTRA
            + quotedstr(xClaseAux) + ')'; // CLASE DE AUXILIAR
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
         edtCodUnico.Text := VSIGUIENTE;
         Z2bbtnGraba.Enabled := False;
         ShowMessage('Grabación exitosa' + #13 + 'Su servicio se ha grabado con el N°' + VSIGUIENTE);
         gbDatosGenerales.Enabled := False;
      End;

   End;

   If DMLOG.wModo = 'M' Then
   Begin
      If chkCanAut.Checked Then
         VCANAUT := 'S'
      Else
         VCANAUT := 'N';

      If chkmodifica.Checked Then
      Begin
         xSQL := 'Update LOG_MAE_SERVICIOS '
            + '      set CODSER=' + quotedstr(dblcTipServicio.Text) + ','
            + '          NUMCLISUM=' + quotedstr(TRIM(edtCliSuministro.Text)) + ','
            + '          NUMSER=' + quotedstr(TRIM(edtNumServicio.Text)) + ','
            + '          FLGESTADO=' + quotedstr(cbSerActivo.Text) + ','
            + '          CODPROV=' + quotedstr(dblcProvServ.Text) + ','
            + '          LOCID=' + quotedstr(dblcLOC.Text) + ','
            + '          SERREC=' + quotedstr(cbSerRecurr.Text) + ','
            + '          TIPINT=' + quotedstr(UpperCase(copy(cbTipIntervalo.Text, 1, 3))) + ','
            + '          NUMINT=' + quotedstr(dbsNumIntervalo.Text) + ','
            + '          CODTITSER=' + quotedstr(dblcTitServicio.Text) + ','
            + '          USUREG=' + quotedstr(DMLOG.wUsuario) + ','
            + '          DESCRIPCION=' + quotedstr(edtDescripcion.Text) + ','
            + '          FLGCANAUT=' + quotedstr(VCANAUT) + ','
            + '          OBSERVACION=' + quotedstr(Trim(memoObservacion.Lines.Text)) + ','
            + '          FLGPAGDER=' + quotedstr(VPAGDERRAMA) + ','
            + '          FECREG=sysdate '
            + '    Where CIAID=' + quotedstr(trim(dblcCIA.Text))
            + '      and CODUNICO=' + quotedstr(trim(edtCodUnico.Text));
      End
      Else
      Begin
         xSQL := 'Update LOG_MAE_SERVICIOS '
            + '      set FLGESTADO=' + quotedstr(cbSerActivo.Text) + ','
            + '          FLGCANAUT=' + quotedstr(VCANAUT) + ','
            + '          TIPINT=' + quotedstr(UpperCase(COPY(cbTipIntervalo.Text, 1, 3))) + ','
            + '          NUMINT=' + dbsNumIntervalo.Text
            + '    Where CIAID=' + quotedstr(trim(dblcCIA.Text))
            + '      and CODUNICO=' + quotedstr(trim(edtCodUnico.Text));
      End;
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);

      ShowMessage('Grabación exitosa');
      chkmodifica.Checked := False;
   End;
End;

Procedure TFMaestroServicios.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMLOG.cdsProv.Close;
   DMLOG.cdsProv.IndexFieldNames := '';
   DMLOG.cdsCIA.Close;
   DMLOG.cdsCIA.IndexFieldNames := '';
   DMLOG.cdsLOC.Close;
   DMLOG.cdsLOC.IndexFieldNames := '';
   DMLOG.cdsObra.ClOSE;
   DMLOG.cdsObra.IndexFieldNames := '';
   DMLOG.cdsListaTx.Close;
   DMLOG.cdsListaTx.IndexFieldNames := '';
   Action := caFree;
   Mtx2000.RefreshFilter;
End;

Procedure TFMaestroServicios.FormCreate(Sender: TObject);
Var
   xSQL: String;
Begin
// Tabla de Locales
   xSQL := 'Select A.LOCID, A.LOCDES, A.DIRECCION, A.CLAUXID, A.CODPRO, B.PROVDES PROPIETARIO '
      + '     From ACF120 A, TGE201 B '
      + '    where B.CLAUXID(+)=A.CLAUXID and B.PROV(+)=A.CODPRO '
      + '    order by LOCDES ';
   DMLOG.cdsLOC.Close;
   DMLOG.cdsLOC.DataRequest(xSQL);
   DMLOG.cdsLOC.PacketRecords := 20;
   DMLOG.cdsLOC.Open;
   dblcLOC.LookupField := 'LOCID';
   dblcLOC.LookupTable := DMLOG.cdsLOC;
   dblcLOC.Selected.Clear;
   dblcLOC.Selected.Add('LOCID'#9'2'#9'Código'#9'F');
   dblcLOC.Selected.Add('LOCDES'#9'30'#9'Descripción'#9'F');

// Tabla de Tipo de Servicios
   xSQL := 'Select CODSER, DESTIPSER from LOG_TIP_SERVICIOS';
   DMLOG.cdsObra.Close;
   DMLOG.cdsObra.DataRequest(xSQL);
   DMLOG.cdsObra.PacketRecords := 100;
   DMLOG.cdsObra.Open;
   dblcTipServicio.LookupField := 'CODSER';
   dblcTipServicio.LookupTable := DMLOG.cdsObra;
   dblcTipServicio.Selected.Clear;
   dblcTipServicio.Selected.add('CODSER'#9'3'#9'Código'#9'F');
   dblcTipServicio.Selected.add('DESTIPSER'#9'20'#9'Descripción'#9'F');
   Z2bbtnGraba.Enabled := True;

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
End;

Procedure TFMaestroServicios.FormActivate(Sender: TObject);
Begin
   If DMLOG.wModo = 'A' Then
   Begin
      If dblcCIA.Enabled Then dblcCIA.SetFocus;
   End;
End;

Procedure TFMaestroServicios.FormKeyPress(Sender: TObject; Var Key: Char);
Var
   x: integer;
Begin
   If (key = #13) Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFMaestroServicios.edtNumServicioExit(Sender: TObject);
Begin
   If (Z2bbtnGraba.Focused) Or (btnSalir.Focused) Then Exit;
   If Length(Trim(edtNumServicio.Text)) > 0 Then
   Begin
      xconponente := 'edtNumServicio';
      lblConfirmaServicio.Caption := 'Confirme Número del Servicio';
      edtConfirme.Text := '';
      pnlConfirme.Top := 176;
      pnlConfirme.Left := 229;
      pnlConfirme.Visible := True;
      edtConfirme.SetFocus;
   End;
End;

Procedure TFMaestroServicios.dblcTipServicioExit(Sender: TObject);
Begin
   If (Z2bbtnGraba.Focused) Or (btnSalir.Focused) Then Exit;
   If DMLOG.cdsObra.Locate('CODSER', VarArrayOf([DMLOG.cdsObra.FieldByName('CODSER').AsString]), []) Then
      EdtTipServicio.Text := DMLOG.cdsObra.FieldByName('DESTIPSER').AsString
   Else
      EdtTipServicio.Text := '';
End;

Procedure TFMaestroServicios.dblcProvServChange(Sender: TObject);
Begin
   edtProvServicio.Text := '';
End;

Procedure TFMaestroServicios.dblcTitServicioChange(Sender: TObject);
Begin
   EdtTitServicio.Text := '';
End;

Procedure TFMaestroServicios.dblcTipServicioChange(Sender: TObject);
Begin
   edtTipServicio.Text := '';
End;

Procedure TFMaestroServicios.dblcLOCChange(Sender: TObject);
Begin
   edtLoc.Text := '';
   EdtDireccion.Text := '';
   EdtPropietario.Text := '';
End;

Procedure TFMaestroServicios.dblcCIAChange(Sender: TObject);
Begin
   edtCia.Text := '';
End;

Procedure TFMaestroServicios.edtDescripcionExit(Sender: TObject);
Begin
   If Length(Trim(edtDescripcion.Text)) > 0 Then
   Begin
      dblcProvServ.SetFocus;
      If Length(Trim(dblcProvServ.Text)) = 0 Then
         dblcProvServ.DropDown;
   End;
End;

Procedure TFMaestroServicios.btnSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFMaestroServicios.FormShow(Sender: TObject);
Var
   xSQL, xSQL1: String;
Begin
   chkmodifica.Visible := False;
   xSQL := 'Select * from TGE201 WHERE CLAUXID IN (''H'',''P'') AND ACTIVO=''S'' ';
   xSQL1 := 'Select * from TGE201 WHERE CLAUXID IN (''H'',''P'') AND ACTIVO=''S'' ';

 //Tabla de PR0VEEDORES para Proveedor del Servicio
   DMLOG.cdsProv.Close;
   DMLOG.cdsProv.DataRequest(xSQL);
   DMLOG.cdsProv.IndexFieldNames := 'PROVDES';
   DMLOG.cdsProv.Open;
   dblcProvServ.LookupField := 'PROV';
   dblcProvServ.LookupTable := DMLOG.cdsProv;
   dblcProvServ.Selected.Clear;
   dblcProvServ.Selected.Add('PROV'#9'3'#9'Código'#9'F');
   dblcProvServ.Selected.Add('PROVDES'#9'30'#9'Descripción'#9'F');
   dblcProvServ.Selected.Add('CLAUXID'#9'2'#9'Clase'#9'F');

 //Tabla de PR0VEEDORES para Titular del Servicio
   DMLOG.cdsListaTx.Close;
   DMLOG.cdsListaTx.DataRequest(xSQL1);
   DMLOG.cdsListaTx.IndexFieldNames := 'PROVDES';
   DMLOG.cdsListaTx.Open;
   dblcTiTServicio.LookupField := 'PROV';
   dblcTiTServicio.LookupTable := DMLOG.cdsListaTx;
   dblcTiTServicio.Selected.Clear;
   dblcTiTServicio.Selected.Add('PROV'#9'3'#9'Código'#9'F');
   dblcTiTServicio.Selected.Add('PROVDES'#9'30'#9'Descripción'#9'F');
   dblcTiTServicio.Selected.Add('CLAUXID'#9'2'#9'Clase'#9'F');
   gbDatosGenerales.Enabled := True;

   If DMLOG.wModo = 'M' Then
   Begin
      chkmodifica.Visible := True;
      xSQL := 'Select * '
         + '  from LOG_MAE_SERVICIOS '
         + ' where CODUNICO=' + quotedstr(Mtx2000.FMant.cds2.fieldbyname('CODUNICO').AsString);
      DMLOG.cdsFPago.Close;
      DMLOG.cdsFPago.DataRequest(xSQL);
      DMLOG.cdsFPago.Open;

      If DMLOG.cdsFPago.RecordCount > 0 Then
      Begin
         dblcCIA.Text := DMLOG.cdsFPago.FieldByname('CIAID').AsString;
         If DMLOG.cdsCIA.locate('CIAID', VarArrayOf([DMLOG.cdsCIA.FieldByName('CIAID').AsString]), []) Then
         Begin
            edtCia.Text := DMLOG.cdsCIA.FieldByname('CIADES').AsString;
            dblcLOC.Text := DMLOG.cdsFPago.FieldByname('LOCID').AsString;
         End
         Else
         Begin
            edtCia.Text := '';
            dblcLOC.Text := '';
         End;

         If DMLOG.cdsLOC.locate('LOCID', VarArrayOf([DMLOG.cdsFPago.FieldByName('LOCID').AsString]), []) Then
         Begin
            EdtLoc.Text := DMLOG.cdsLOC.FieldByname('LOCDES').AsString;
            EdtDireccion.Text := DMLOG.cdsLOC.FieldByname('DIRECCION').AsString;
            EdtPropietario.Text := DMLOG.cdsLOC.FieldByname('PROPIETARIO').AsString;
         End
         Else
         Begin
            EdtLoc.Text := '';
            EdtDireccion.Text := '';
            EdtPropietario.Text := '';
         End;

         EdtDireccion.Text := DMLOG.cdsFPago.FieldByname('DIRECCION').AsString;

         dblcTipServicio.Text := DMLOG.cdsFPago.FieldByname('CODSER').AsString;
         If DMLOG.cdsObra.Locate('CODSER', VarArrayOf([DMLOG.cdsObra.FieldByName('CODSER').AsString]), []) Then
            EdtTipServicio.Text := DMLOG.cdsObra.FieldByName('DESTIPSER').AsString
         Else
            EdtTipServicio.Text := ' ';

         edtCliSuministro.Text := DMLOG.cdsFPago.FieldByname('NUMCLISUM').AsString;
         edtNumServicio.Text := DMLOG.cdsFPago.FieldByname('NUMSER').AsString;
         edtDescripcion.Text := DMLOG.cdsFPago.FieldByname('DESCRIPCION').AsString;
         dblcProvServ.Text := DMLOG.cdsFPago.FieldByname('CODPROV').AsString;
         If DMLOG.cdsProv.Locate('PROV', VarArrayOf([DMLOG.cdsFPago.FieldByName('CODPROV').AsString]), []) Then
            edtProvServicio.Text := DMLOG.cdsProv.FieldByName('PROVDES').AsString
         Else
            edtProvServicio.Text := '';

         dblcTitServicio.Text := DMLOG.cdsFPago.FieldByname('CODTITSER').AsString;

         If Length(Trim(dblcTitServicio.Text)) <> 0 Then
            If DMLOG.cdsListaTx.Locate('PROV', VarArrayOf([DMLOG.cdsFPago.FieldByName('CODTITSER').AsString]), []) Then
               EdtTitServicio.Text := DMLOG.cdsListaTx.FieldByName('PROVDES').AsString
            Else
               EdtTitServicio.Text := '';

         cbSerRecurr.Text := DMLOG.cdsFPago.FieldByname('SERREC').AsString;
         cbTipIntervalo.Text := DMLOG.cdsFPago.FieldByname('TIPINT').AsString;
         dbsNumIntervalo.Value := DMLOG.cdsFPago.FieldByname('NUMINT').AsInteger;
         cbSerActivo.Text := DMLOG.cdsFPago.FieldByname('FLGESTADO').AsString;
         memoObservacion.Lines.Text := DMLOG.cdsFPago.FieldByname('OBSERVACION').AsString;
         If DMLOG.cdsFPago.FieldByname('FLGCANAUT').AsString = 'S' Then
            chkCanAut.Checked := True
         Else
            chkCanAut.Checked := False;
         If DMLOG.cdsFPago.FieldByname('FLGPAGDER').AsString = 'S' Then
            chkDerrama.Checked := True
         Else
            chkDerrama.Checked := False;
         edtCodUnico.Text := DMLOG.cdsFPago.FieldByname('CODUNICO').AsString;
         gbDatosGenerales.Enabled := False;
      End;
   End;

End;

Procedure TFMaestroServicios.edtCliSuministroExit(Sender: TObject);
Begin
   If (Z2bbtnGraba.Focused) Or (btnSalir.Focused) Then Exit;
  //Confirme cliente suministro
   If (Length(Trim(edtCliSuministro.Text)) > 0) Then
   Begin
      lblConfirmaServicio.Caption := 'Confirme Cliente/Suministro';
      xconponente := 'edtCliSuministro';
      edtConfirme.Text := '';
      pnlConfirme.Top := 176;
      pnlConfirme.Left := 165;
      pnlConfirme.Visible := True;
      edtConfirme.SetFocus;
   End;
End;

Procedure TFMaestroServicios.edtConfirmeExit(Sender: TObject);
Begin
   If xconponente = 'edtCliSuministro' Then
   Begin
      If UpperCase(Trim(edtCliSuministro.Text)) <> UpperCase(Trim(edtConfirme.Text)) Then
      Begin
         ShowMessage('Cliente/Suministro diferentes, escríbalo nuevamente');
         edtConfirme.Text := '';
         pnlConfirme.Visible := False;
         edtCliSuministro.SetFocus;
         edtCliSuministro.SelectAll;
      End
      Else
      Begin
         pnlConfirme.Visible := False;
         edtNumServicio.SetFocus;
      End;
   End;

   If xconponente = 'edtNumServicio' Then
   Begin
      If UpperCase(Trim(edtNumServicio.Text)) <> UpperCase(Trim(edtConfirme.Text)) Then
      Begin
         ShowMessage('Número del Servicio diferentes, escríbalo nuevamente');
         edtConfirme.Text := '';
         pnlConfirme.Visible := False;
         edtNumServicio.SetFocus;
         edtNumServicio.SelectAll;
      End
      Else
      Begin
         pnlConfirme.Visible := False;
         edtDescripcion.SetFocus;
      End;
   End;

End;

Procedure TFMaestroServicios.edtCliSuministroKeyPress(Sender: TObject;
   Var Key: Char);
Begin

   If key = #0 Then
   Begin
      pnlConfirme.Top := 224;
      pnlConfirme.Left := 128;
      pnlConfirme.Visible := True;
      edtConfirme.SetFocus;
      perform(CM_DialogKey, VK_TAB, 0);
   End;

End;

Procedure TFMaestroServicios.chkDerramaClick(Sender: TObject);
Begin
   If chkDerrama.Checked Then
   Begin
      edtTiTServicio.Text := 'Derrama Magisterial';
      dblcTitServicio.Enabled := False;
   End
   Else
      dblcTitServicio.Enabled := True;
End;

Procedure TFMaestroServicios.chkmodificaClick(Sender: TObject);
Begin
   If chkmodifica.Checked Then
      gbDatosGenerales.Enabled := True
   Else
      gbDatosGenerales.Enabled := False;
End;

Procedure TFMaestroServicios.nuevo;
Begin
   edtCodUnico.Text := '';
   dblcLOC.Text := '';
   edtLoc.Text := '';
   EdtDireccion.Text := '';
   EdtPropietario.Text := '';
   dblcTipServicio.Text := '';
   edtTipServicio.Text := '';
   edtCliSuministro.Text := '';
   edtNumServicio.Text := '';
   dblcProvServ.Text := '';
   edtProvServicio.Text := '';
   dblcTitServicio.Text := '';
   EdtTitServicio.Text := '';
   memoObservacion.Lines.Text := '';
   chkCanAut.Checked := False;
   chkDerrama.Checked := False;
End;

Procedure TFMaestroServicios.BitBtn1Click(Sender: TObject);
Begin
   nuevo;
   DMLOG.wModo := 'A';
   gbDatosGenerales.Enabled := True;
   chkmodifica.Visible := False;
   dblcLOC.SetFocus;
End;

End.


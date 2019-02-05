Unit oaAD2000;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaAD2000
// FORMULARIO               : FADMaestros
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Formulario inicial que contiene las funcionalidades
//                            que permiten acceder a las opciones de transacciones

// ACTUALIZACIONES:
// HPC_201208_LOG 22/05/2012:  Se implementó el control de versiones
// HPC_201304_LOG 23/09/2013:  Se implementa el Maestro de Servicios Institucionales
// HPC_201404_LOG 21/10/2014   Control de Versiones 20141022080000
// HPC_201305_LOG 14/10/2014:  Se renombran las Unidades Pascal de Mantenimiento del Maestro de Servicios Institucionales
//                             de LOG267 a LOG280 y LOG268 a LOG281
// HPC_201506_LOG 20/11/2014   Entrega al área de Calidad
// HPC_201601_LOG 22/09/2016   Añade Control de Acceso por Grupo de Usuario
//                             Control de Versión 20160923083000
// HPC_201602_LOG 24/10/2016   Cambio de Control de Versión a 20161024083000
// HPC_201702_LOG 16/10/2017   Retiro del Maestro de Artículos por Adquisiciones
// LOG_201805     19/11/2018   Cambio de Control de Versión a LOG-201805, cambio solo en el DFM

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, DB, ExtCtrls, StdCtrls, MsgDlgs;

Type
   TFADMaestros = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }

   // Inicio HPC_201702_LOG
   // Retiro del Mantenimiento y Consulta del Maestro de Artículos de Almacén del módulo de Adquisiciones
   {
      Procedure PegaPanelToolArti(Sender: TObject);
      Procedure OnInsertArticulo(Sender: TObject);
      Procedure OnEditArticulo(Sender: TObject; MantFields: TFields);
      Procedure OnDeleteArticulo(Sender: TObject; MantFields: TFields);
      Procedure OnShowArticulo(Sender: TObject);
   }
   // Fin HPC_201702_LOG

      Procedure InsertaServicios(Sender: TObject);
      Procedure ModificaServicios(Sender: TObject; MantFields: TFields);

   End;

Procedure ADVerificaVersion; stdcall;
Procedure ADMaestroServicio; stdcall;

Exports
   ADVerificaVersion,
   ADMaestroServicio;

Var
   FADMaestros: TFADMaestros;
   Mtx2000: TMant;

Implementation

{$R *.dfm}

//Uses LOGDM1, LOG212, LOG700, LOG280;
Uses LOGDM1, LOG280;

// LOG212 Maestro de Artículos - FRegArti
// LOG700 Tool del Maestro de Artículos - FToolArti
// LOG280 (ex LOG267) Maestro de Servicios
// LOG281 (ex LOG268) Recibo de Servicios

// Inicio HPC_201702_LOG
// Retiro del Mantenimiento y Consulta del Maestro de Artículos de Almacén del módulo de Adquisiciones
{
Procedure TFADMaestros.OnInsertArticulo(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMLOG.cdsArti.State In [dsInsert, dsEdit] Then DMLOG.cdsArti.Cancel;

   DMLOG.wModo := 'A';

   xSQL := 'Select * '
      + '     from TGE205 '
      + '    where 1<>1 ';
   DMLOG.cdsArti.Close;
   DMLOG.cdsArti.IndexFieldNames := '';
   DMLOG.cdsArti.Filter := '';
   DMLOG.cdsArti.Filtered := False;
   DMLOG.cdsArti.DataRequest(xSQL);
   DMLOG.cdsArti.Open;

   FRegArti := TFRegArti.create(Application);
   FRegArti.dblcCIA.Enabled := True;
   FRegArti.dbeCodArti.Enabled := True;

   FRegArti.ActiveMDIChild;
End;
}
// Fin HPC_201702_LOG

// Inicio HPC_201702_LOG
// Retiro del Mantenimiento y Consulta del Maestro de Artículos de Almacén del módulo de Adquisiciones
{
Procedure TFADMaestros.OnEditArticulo(Sender: TObject;
   MantFields: TFields);
Var
   xSQL: String;
Begin
// se ubica en registro a actualizar
   xSQL := 'Select * '
      + '     from TGE205 '
      + '    where CIAID=' + quotedstr(Mtx2000.FMant.cds2.fieldbyname('CIAID').AsString)
      + '      and ARTID=' + quotedStr(Mtx2000.FMant.cds2.fieldbyname('ARTID').AsString);
   DMLOG.cdsArti.Close;
   DMLOG.cdsArti.IndexFieldNames := '';
   DMLOG.cdsArti.Filter := '';
   DMLOG.cdsArti.Filtered := False;
   DMLOG.cdsArti.DataRequest(xSQL);
   DMLOG.cdsArti.Open;

   If (DMLOG.cdsArti.Recordcount = 0) Then
   Begin
      ErrorMsg('Error', 'No existen registros que modificar');
      exit;
   End;
   DMLOG.wModo := 'M';
   FRegArti := TFRegArti.create(Application);

   FRegArti.ActiveMDIChild;
End;
}
// Fin HPC_201702_LOG

// Inicio HPC_201702_LOG
// Retiro del Mantenimiento y Consulta del Maestro de Artículos de Almacén del módulo de Adquisiciones
{
Procedure TFADMaestros.OnDeleteArticulo(Sender: TObject;
   MantFields: TFields);
Var
   xSQL, sSQL: String;
Begin
// se ubica en registro a actualizar
   xSQL := 'Select * '
      + '     from TGE205 '
      + '    where CIAID=' + quotedstr(Mtx2000.FMant.cds2.fieldbyname('CIAID').AsString)
      + '      and ARTID=' + quotedStr(Mtx2000.FMant.cds2.fieldbyname('ARTID').AsString);
   DMLOG.cdsArti.Close;
   DMLOG.cdsArti.IndexFieldNames := '';
   DMLOG.cdsArti.Filter := '';
   DMLOG.cdsArti.Filtered := False;
   DMLOG.cdsArti.DataRequest(xSQL);
   DMLOG.cdsArti.Open;

   sSQL := 'CIAID = ''' + DMLOG.cdsArti.FieldByName('CIAID').AsString + ''''
      + ' and ARTID = ''' + DMLOG.cdsArti.FieldByName('ARTID').AsString + ''' ';

 //--------------------------------------- Facturación ----------------------------------------------
   DMLOG.DisplayDescrip('prvTGE', 'FAC306', 'ARTID', sSQL, 'ARTID');
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      Information('Adquisiciones', ' Este Artículo Tiene Movimiento en la Facturación');
      Exit;
   End;

 //--------------------------------------- Proforma de Venta  ---------------------------------------
   DMLOG.DisplayDescrip('prvTGE', 'FAC312', 'ARTID', sSQL, 'ARTID');
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      Information('Adquisiciones', ' Este Artículo Tiene Movimiento en la Proforma de Venta');
      Exit;
   End;

 //--------------------------------------- Requerimiento de Usuario --------------------------------
   DMLOG.DisplayDescrip('prvTGE', 'LOG307', 'ARTID', sSQL, 'ARTID');
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      Information('Adquisiciones', ' Este Artículo Tiene Movimiento en el Requerimiento de Usuarios');
      Exit;
   End;

 //--------------------------------------- Requisición ---------------------------------------------
   DMLOG.DisplayDescrip('prvTGE', 'LOG309', 'ARTID', sSQL, 'ARTID');
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      Information('Adquisiciones', ' Este Artículo Tiene Movimiento en la Requisición ');
      Exit;
   End;

 //--------------------------------------- Orden de Compra ----------------------------------------
   DMLOG.DisplayDescrip('prvTGE', 'LOG305', 'ARTID', sSQL, 'ARTID');
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      Information('Adquisiciones', ' Este Artículo Tiene Movimiento en Ordenes de Compra ');
      Exit;
   End;

 //------------------------------ Movimientos de Nota de Entrada / Salida--------------------------
   DMLOG.DisplayDescrip('prvTGE', 'LOG315', 'ARTID', sSQL, 'ARTID');
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      Information('Adquisiciones', ' Este Artículo Tiene Movimiento en la Nota de Entrada / Salida ');
      Exit;
   End;

 //--------------------------------------- Kardex --------------------------------------------------
   DMLOG.DisplayDescrip('prvTGE', 'LOG316', 'ARTID', sSQL, 'ARTID');
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      Information('Adquisiciones', ' Este Artículo Tiene Movimiento en el Kardex ');
      Exit;
   End;

   If Question('Confirmar', 'Va a Eliminar El Artículo ' + #13 + #13 +
      DMLOG.cdsArti.FieldByName('ARTID').AsString + '  -  ' +
      DMLOG.cdsArti.FieldByName('ARTDES').AsString + #13 +
      #13 + ' ¿Desea Continuar? ') Then
   Begin

      Screen.Cursor := crHourGlass;
    //---------------------------------------  --------------------------------------------------
      sSQL := 'DELETE FROM TGE207 '
         + '    WHERE ARTID = ''' + DMLOG.cdsArti.FieldByName('ARTID').AsString + ''''
         + '      AND CIAID = ''' + DMLOG.cdsArti.FieldByName('CIAID').AsString + ''' ';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;

    //---------------------------------------  --------------------------------------------------
      sSQL := 'DELETE FROM TGE206 '
         + '    WHERE ARTID = ''' + DMLOG.cdsArti.FieldByName('ARTID').AsString + ''''
         + '      AND CIAID = ''' + DMLOG.cdsArti.FieldByName('CIAID').AsString + ''' ';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;

    //--------------------------------------- Lista de Precios ----------------------------------------
      sSQL := 'DELETE FROM FAC201 '
         + '    WHERE ARTID = ''' + DMLOG.cdsArti.FieldByName('ARTID').AsString + ''''
         + '      AND CIAID = ''' + DMLOG.cdsArti.FieldByName('CIAID').AsString + ''' ';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
      xBorrar := '1';
      DMLOG.cdsArti.Delete;
      DMLOG.ControlTran(9, DMLOG.cdsArti, 'ARTI');
      xBorrar := '0';
      DMLOG.ActualizaFiltro(Mtx2000, DMLOG.cdsArti, 'E');
      Screen.Cursor := crDefault;
   End;
End;
}
// Fin HPC_201702_LOG

// Inicio HPC_201702_LOG
// Retiro del Mantenimiento y Consulta del Maestro de Artículos de Almacén del módulo de Adquisiciones
{
Procedure TFADMaestros.OnShowArticulo(Sender: TObject);
Begin
//
End;
}
// Fin HPC_201702_LOG

// Inicio HPC_201702_LOG
// Retiro del Mantenimiento y Consulta del Maestro de Artículos de Almacén del módulo de Adquisiciones
{
Procedure TFADMaestros.PegaPanelToolArti(Sender: TObject);
Var
   p1: TPanel;
   pg: TPanel;
Begin
   pg := FToolArti.pnlTools;
   p1 := TMant(Sender).FMant.pnlBtns;
   p1.Height := pg.Height + 5;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   p1.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;
}
// Fin HPC_201702_LOG

Procedure ADVerificaVersion;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;
   FADMaestros := TFADMaestros.Create(Application);
   If DMLOG.fg_VerificaVersion(FADMaestros.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

/////////////////////////////////////////////////////////
// Maestro de SERVICIOS
/////////////////////////////////////////////////////////
Procedure ADMaestroServicio;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

// Control de Acceso por Grupo de Usuario
   If Not DMLOG.wf_AccesoOpcion('3010203') Then Exit;

   Screen.Cursor := crHourGlass;

// SERVICIOS
   xSQL := 'SELECT A.CIAID, A.CODUNICO, A.CODSER, A.NUMCLISUM, B.DESTIPSER, A.NUMSER, C.DIRECCION, '
      + '          A.FLGESTADO, A.CLAUXID, A.CODPROV, D.PROVDES, A.LOCID, C.LOCDES, A.SERREC, A.TIPINT, '
      + '          A.NUMINT, A.FECULTREC, A.FECULTPAG, A.FECSIGREC, A.PERULT, A.PERSIG, '
      + '          A.CODTITSER, E.PROVDES PROVDES2, A.USUREG, A.FECREG, USUMOD, FECMOD '
      + '     FROM LOG_MAE_SERVICIOS A, LOG_TIP_SERVICIOS B, ACF120 C, TGE201 D, TGE201 E '
      + '    WHERE B.CODSER(+) = A.CODSER '
      + '      AND C.LOCID(+)  = A.LOCID '
      + '      AND D.CLAUXID(+)= A.CLAUXID and D.PROV(+)=A.CODPROV '
      + '      AND E.PROV(+)   = A.CODTITSER';

   Mtx2000 := TMant.Create(Application);
   Try
      Mtx2000.Admin := DMLOG.wAdmin;
      Mtx2000.User := DMLOG.wUsuario;
      Mtx2000.DComC := DMLOG.DCOM1;
      Mtx2000.Titulo := 'Maestro de Servicios Institucionales';
      Mtx2000.Module := DMLOG.wModulo;
      Mtx2000.Tablename := 'MAESERV';
      Mtx2000.Filter := '';
      Mtx2000.UsuarioSQL.Text := xSQL;
      Mtx2000.ClientDataset := DMLOG.cdsQry12;
      Mtx2000.OnInsert := FADMaestros.InsertaServicios;
      Mtx2000.OnDelete := Nil;
      Mtx2000.OnEdit := FADMaestros.ModificaServicios;
      Mtx2000.OnCreateMant := Nil;
      Mtx2000.SectionName := 'LOGServicios';
      Mtx2000.FileNameIni := '\oaLog.ini';
      Mtx2000.OnCierra := DMLOG.DisminuyeForma;
      Mtx2000.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx2000.Execute;
   Finally
      DMLOG.cdsQry12.close;
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFADMaestros.InsertaServicios(Sender: TObject);
Begin
   DMLOG.wModo := 'A'; //Adiciona
   FMaestroServicios := TFMaestroServicios.Create(Application);
   FMaestroServicios.ShowModal;
End;

Procedure TFADMaestros.ModificaServicios(Sender: TObject; MantFields: TFields);
Begin
   DMLOG.wModo := 'M'; //Modifica
   FMaestroServicios := TFMaestroServicios.Create(Application);
   FMaestroServicios.ShowModal;
End;

End.


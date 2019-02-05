Unit oaAD3050;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaAD2000
// FORMULARIO               : FADMaestros
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Formulario inicial que contiene las funcionalidades
//                            que permiten acceder a las opciones de transacciones

// ACTUALIZACIONES:
// HPC_201208_LOG 22/05/2012:  Se implementó el control de versiones
// HPC_201404_LOG 21/10/2014   Control de Versiones 20141022080000
// HPC_201506_LOG 20/11/2014   Entrega al área de Calidad
// HPC_201601_LOG 22/09/2016   Añade Control de Acceso por Grupo de Usuario
//                             Control de Versión 20160923083000
// HPC_201602_LOG 24/10/2016   Cambio de Control de Versión a 20161024083000

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, DB, StdCtrls, MsgDlgs;

Type
   TFControlRequis = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }

  // Requisiciones
  // LOG201 - FRegReqs       Requisiciones
      Procedure OnInsertRequis(Sender: TObject);
      Procedure OnEditRequis(Sender: TObject; MantFields: TFields);
      Procedure OnDeleteRequis(Sender: TObject; MantFields: TFields);
      Procedure OnShowRequis(Sender: TObject);

  // Seguimiento/Visado de Requisiciones
  // LOG500 - FSeguiReqs     Seguimiento/Visado de Requisiciones
      Procedure OnSeguiRequis(Sender: TObject; MantFields: TFields);

   End;

Procedure ADRequisiciones; stdcall;
Procedure ADRequisiciones00; stdcall;
Procedure ADSeguimRequisicion; stdcall;
Procedure ADVerificaVersion; stdcall;
Exports
   ADRequisiciones,
   ADRequisiciones00,
   ADSeguimRequisicion,
   ADVerificaVersion;

Var
   FControlRequis: TFControlRequis;
   Mtx3050: TMant;

Implementation

{$R *.dfm}

Uses LOGDM1, LOG201, LOG500;

// LOG201 - FRegReqs       Requisiciones
// LOG500 - FSeguiReqs     Seguimiento/Visado de Requisiciones

////////////////////////////////////////////////////////////////////////
// REQUISICIONES
////////////////////////////////////////////////////////////////////////

Procedure ADRequisiciones;
Var
   cFilterCiaUser: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

   Screen.Cursor := crHourGlass;
   If wActuaPresu Then
   Begin
      DMLOG.FiltraTabla(DMLOG.cdsParPre, 'PPRES201', 'PARPRESID', 'PARPRESID');
      DMLOG.FiltraTabla(DMLOG.cdsTipPre, 'PPRES101', 'TIPPRESID', 'TIPPRESID');
   End;
   DMLOG.FiltraTabla(DMLOG.cdsLoc, 'TGE126', 'LOCID', 'LOCID');

   DMLOG.cdsObra.Close;
   DMLOG.cdsObra.DataRequest('SELECT * FROM TGE213 ORDER BY OBRAID');
   DMLOG.cdsObra.Open;

   DMLOG.FiltraTabla(DMLOG.cdsTipSol, 'TGE173', 'TIPOADQ', 'TIPOADQ');
   DMLOG.FiltraTabla(DMLOG.cdsTSolCot, 'TGE137', 'TSCID', 'TSCID');
   DMLOG.cdsArti.Close;
   DMLOG.cdsArti.DataRequest('SELECT * FROM TGE205');
   DMLOG.cdsArti.Open;
   DMLOG.FiltraTabla(DMLOG.cdsUMed, 'TGE130', 'UNMID', 'UNMID');

   If DMLOG.cdsCia.Active = False Then
      DMLOG.FiltraTabla(DMLOG.cdsCia, 'TGE101', 'CIAID', 'CIAID');

   cFilterCiaUser := DMLOG.FiltraCiaPorUsuario(DMLOG.cdsCia);

   DMLOG.wTipoAdicion := 'xFiltro';
   Mtx3050 := TMant.Create(Application);
   Try
      Mtx3050.Admin := DMLOG.wAdmin;
      Mtx3050.User := DMLOG.wUsuario;
      Mtx3050.Module := DMLOG.wModulo;
      Mtx3050.TableName := 'LOG308';
      Mtx3050.TablaLlave := 'CIAID;LOCID;RQSID';
      Mtx3050.Tabla2 := 'LOG309';
      Mtx3050.Tabla2Llave := 'CIAID;LOCID;RQSID';
      Mtx3050.Titulo := 'Requisiciones';
      Mtx3050.ClientDataSet := DMLOG.cdsReqs;
      Mtx3050.OnCreateMant := Nil;
      Mtx3050.DComC := DMLOG.DCOM1;
      Mtx3050.OnEdit := FControlRequis.OnEditRequis;
      Mtx3050.OnInsert := FControlRequis.OnInsertRequis;
      Mtx3050.OnDelete := FControlRequis.OnDeleteRequis;
      Mtx3050.OnShow := FControlRequis.OnShowRequis;
      Mtx3050.SectionName := 'LOGRqs';
      Mtx3050.FileNameIni := '\oaLog.ini';
      Mtx3050.Filter := cFilterCiaUser;
      Mtx3050.OnCierra := DMLOG.DisminuyeForma;
      Mtx3050.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx3050.Execute;
   Finally
   End;
End;

Procedure TFControlRequis.OnInsertRequis(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'select * from LOG308 '
      + '    where 1<>1';
   DMLOG.cdsReqs.Close;
   DMLOG.cdsReqs.IndexFieldNames := '';
   DMLOG.cdsReqs.Filter := '';
   DMLOG.cdsReqs.Filtered := False;
   DMLOG.cdsReqs.DataRequest(sSQL);
   DMLOG.cdsReqs.Open;

   If DMLOG.cdsReqs.State In [dsInsert, dsEdit] Then
      DMLOG.cdsReqs.Cancel;
   DMLOG.wModo := 'A';

// LOG201 - FRegReqs       Requisiciones
   FRegReqs := TFRegReqs.Create(Application);
   FRegReqs.xValorX := '';
   FRegReqs.xReqLec := '';
   DMLOG.cdsReqs.Insert;
   FRegReqs.dblcCIA.Enabled := True;
   FRegReqs.dbeNumRqs.Enabled := True;
   FRegReqs.dblcLOC.Enabled := True;
   Try
      FRegReqs.ActiveMDIChild;
   Finally

   End;
End;

Procedure TFControlRequis.OnEditRequis(Sender: TObject;
   MantFields: TFields);
Var
   sCIA, sLOC, sRQS, sSQL: String;
Begin
   sCIA := MantFields.FieldByName('CIAID').AsString;
   sLOC := MantFields.FieldByName('LOCID').AsString;
   sRQS := MantFields.FieldByName('RQSID').AsString;

   sSQL := 'Select * from LOG308 '
      + '    where CIAID=' + quotedstr(sCIA)
      + '      and LOCID=' + quotedstr(sLOC)
      + '      and RQSID=' + quotedstr(sRQS);
   DMLOG.cdsReqs.Close;
   DMLOG.cdsReqs.IndexFieldNames := '';
   DMLOG.cdsReqs.Filter := '';
   DMLOG.cdsReqs.Filtered := False;
   DMLOG.cdsReqs.DataRequest(sSQL);
   DMLOG.cdsReqs.Open;

   If (DMLOG.cdsReqs.RecNo <= 0) And
      (DMLOG.cdsReqs.eof) Then
   Begin
      ErrorMsg('Error', 'No existen registros a editar');
      exit;
   End;

   sSQL := 'Select * '
      + '     from LOG309 '
      + '    where CIAID=' + quotedstr(sCIA)
      + '      and LOCID=' + quotedstr(sLOC)
      + '      and RQSID=' + quotedstr(sRQS)
      + '    order by DRQSID';
   DMLOG.cdsDReqs.Close;
   DMLOG.cdsDReqs.DataRequest(sSQL);
   DMLOG.cdsDReqs.IndexFieldNames := 'DRQSID';
   DMLOG.cdsDReqs.Open;

   DMLOG.wModo := 'M';
// LOG201 - FRegReqs       Requisiciones
   FRegReqs := TFRegReqs.Create(Application);
   FRegReqs.xValorX := '';
   FRegReqs.xReqLec := '';
   FRegReqs.dblcCIA.Enabled := False;
   FRegReqs.dbeNumRqs.Enabled := False;
   FRegReqs.dblcLOC.Enabled := False;
   Try
      FRegReqs.ActiveMDIChild;
   Finally

   End;
End;

Procedure TFControlRequis.OnDeleteRequis(Sender: TObject;
   MantFields: TFields);
Var
   sSQL: String;
Begin
   sSQL := 'Select * from LOG308 '
      + '    where CIAID=' + quotedstr(MantFields.FieldByName('CIAID').AsString)
      + '      and LOCID=' + quotedstr(MantFields.FieldByName('LOCID').AsString)
      + '      and RQSID=' + quotedstr(MantFields.FieldByName('RQSID').AsString);
   DMLOG.cdsReqs.Close;
   DMLOG.cdsReqs.IndexFieldNames := '';
   DMLOG.cdsReqs.Filter := '';
   DMLOG.cdsReqs.Filtered := False;
   DMLOG.cdsReqs.DataRequest(sSQL);
   DMLOG.cdsReqs.Open;

   If (trim(DMLOG.cdsReqs.FieldbyName('RQSEST').AsString) <> 'INICIAL') Or
      (Length(Trim(DMLOG.cdsReqs.fieldbyname('RQSVISADOR').AsString)) > 0) Then
   Begin
      ErrorMsg('Adquisiciones', 'Esta Requisición ya a Sido Aceptada ó Visada, No es Posible Eliminarla');
      Exit;
   End;
   If Question('Confirmar', 'Esta Seguro de Eliminar La Requisición ' + #13 + #13 +
      DMLOG.cdsReqs.FieldByName('RQSID').AsString + '  -  ' + #13 +
      #13 + ' Desea Continuar ') Then
   Begin
      Screen.Cursor := crHourGlass;
      sSQL := 'delete from LOG309 '
         + '    where CIAID=''' + DMLOG.cdsReqs.FieldByName('CIAID').AsString + ''' '
         + '      and LOCID=''' + DMLOG.cdsReqs.FieldByName('LOCID').AsString + ''' '
         + '      and RQSID=''' + DMLOG.cdsReqs.FieldByName('RQSID').AsString + '''';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
      xBorrar := '1';
      DMLOG.cdsReqs.Delete;
      DMLOG.ControlTran(9, DMLOG.cdsReqs, 'REQS');
      xBorrar := '0';
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFControlRequis.OnShowRequis(Sender: TObject);
Begin
//
End;

Procedure ADRequisiciones00;
Var
   sSQL: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

   sSQL := 'select * from LOG308 '
      + '    where 1<>1';
   DMLOG.cdsReqs.Close;
   DMLOG.cdsReqs.IndexFieldNames := '';
   DMLOG.cdsReqs.Filter := '';
   DMLOG.cdsReqs.Filtered := False;
   DMLOG.cdsReqs.DataRequest(sSQL);
   DMLOG.cdsReqs.Open;

   If DMLOG.cdsReqs.State In [dsInsert, dsEdit] Then
      DMLOG.cdsReqs.Cancel;
   DMLOG.wModo := 'A';

   FRegReqs := TFRegReqs.Create(Application);
   FRegReqs.xValorX := '';
   FRegReqs.xReqLec := '';
   DMLOG.cdsReqs.Insert;
   FRegReqs.dblcCIA.Enabled := True;
   FRegReqs.dbeNumRqs.Enabled := True;
   FRegReqs.dblcLOC.Enabled := True;
   Try
      FRegReqs.ActiveMDIChild;
   Finally

   End;
End;
// Fin de Requisiciones

////////////////////////////////////////////////////////////////////////
// SEGUIMIENTO DE REQUISICIONES
////////////////////////////////////////////////////////////////////////
Procedure ADSeguimRequisicion;
Var
   sSQL: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

   If DMLOG.wReqComp = 'S' Then
      DMLOG.FiltraTabla(DMLOG.cdsComprador, 'TGE135', 'COMPCID', 'COMPCID');

   DMLOG.FiltraTabla(DMLOG.cdsLoc, 'TGE126', 'LOCID', 'LOCID');
   sSQL := 'Select * from TGE151 where ACTIVO=''S''';
   DMLOG.cdsALM.Close;
   DMLOG.cdsALM.DataRequest(sSQL);
   DMLOG.cdsALM.Open;

   DMLOG.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx3050 := TMant.Create(Application);
   Try
      Mtx3050.Admin := DMLOG.wAdmin;
      Mtx3050.User := DMLOG.wUsuario;
      Mtx3050.Module := DMLOG.wModulo;
      Mtx3050.OnCreateMant := Nil;
      Mtx3050.TableName := 'LOG308';
      Mtx3050.Titulo := 'Requisiciones - Seguimiento y Visados';
      Mtx3050.ClientDataSet := DMLOG.cdsReqs;
      Mtx3050.DComC := DMLOG.DCOM1;
      Mtx3050.OnEdit := FControlRequis.OnSeguiRequis;
      Mtx3050.OnInsert := Nil;
      Mtx3050.OnDelete := Nil;
      Mtx3050.OnShow := Nil;
      Mtx3050.SectionName := 'LOGSegVisReqs';
      Mtx3050.FileNameIni := '\oaLog.ini';
      Mtx3050.Filter := '';
      Mtx3050.NoVisible.Clear;
      Mtx3050.OnCierra := DMLOG.DisminuyeForma;
      Screen.Cursor := crDefault;
      Mtx3050.Execute;
   Finally
   End;
End;

Procedure TFControlRequis.OnSeguiRequis(Sender: TObject;
   MantFields: TFields);
Var
   sCIA, sLOC, sALM, sRQS, sSQL: String;
Begin
// se ubica en registro a actualizar
   sCIA := MantFields.FieldByName('CIAID').AsString;
   sLOC := MantFields.FieldByName('LOCID').AsString;
   sRQS := MantFields.FieldByName('RQSID').AsString;

   sSQL := 'Select * from LOG308 '
      + 'where CIAID=' + quotedstr(sCIA)
      + '  and LOCID=' + quotedstr(sLOC)
      + '  and RQSID=' + quotedstr(sRQS);
   DMLOG.cdsReqs.Close;
   DMLOG.cdsReqs.IndexFieldNames := '';
   DMLOG.cdsReqs.Filter := '';
   DMLOG.cdsReqs.Filtered := False;
   DMLOG.cdsReqs.DataRequest(sSQL);
   DMLOG.cdsReqs.Open;

   If (DMLOG.cdsReqs.RecNo <= 0) And
      (DMLOG.cdsReqs.eof) Then
   Begin
      ErrorMsg('Error', 'No Existen Registros a Editar');
      exit;
   End;
   Screen.Cursor := crHourGlass;

   sSQL := 'Select * '
      + '     from LOG309 '
      + '    where CIAID=' + quotedstr(sCIA)
      + '      and LOCID=' + quotedstr(sLOC)
      + '      and RQSID=' + quotedstr(sRQS)
      + '    order by DRQSID';
   DMLOG.cdsDReqs.Close;
   DMLOG.cdsDReqs.DataRequest(sSQL);
   DMLOG.cdsDReqs.IndexFieldNames := 'DRQSID';
   DMLOG.cdsDReqs.Open;

// LOG500 - FSeguiReqs     Seguimiento/Visado de Requisiciones
   DMLOG.wModo := 'M';
   FSeguiReqs := TFSeguiReqs.create(Application);

   FSeguiReqs.dblcCIA.Enabled := False;
   FSeguiReqs.dbeNumRqs.Enabled := False;
   FSeguiReqs.dblcLOC.Enabled := False;
   FSeguiReqs.dblcALM.Enabled := False;
   FSeguiReqs.ActiveMDIChild;
End;
///// Fin Seguimiento de Requisiciones

Procedure ADVerificaVersion;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;
   FControlRequis := TFControlRequis.Create(Application);
   If DMLOG.fg_VerificaVersion(FControlRequis.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

End.


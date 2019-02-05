Unit oaAD4000;

// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaAD4000
// FORMULARIO               : TFADProcesos
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Formulario inicial que contiene las funcionalidades
//                            que permiten acceder a las opciones de procesos

// ACTUALIZACIONES:
// HPP_201104_LOG 24/05/2011   Carga el MLOG.cdsDReqs antes que sea invocado, este
//                             cambio corrige el error que se muestra al
//                             Depurar las Requisiciones de usuario
// HPC_201208_LOG 22/05/2012:  Se implementó el control de versiones
// HPC_201404_LOG 21/10/2014   Control de Versiones 20141022080000
// HPC_201506_LOG 20/11/2014   Entrega al área de Calidad
// HPC_201601_LOG 22/09/2016   Añade Control de Acceso por Grupo de Usuario
//                             Control de Versión 20160923083000
// HPC_201602_LOG 24/10/2016   Cambio de Control de Versión a 20161024083000

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, DB, ExtCtrls, StdCtrls, MsgDlgs;

Type
   TFADProcesos = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }

    // Depura Requisiciones
      Procedure ToolsCreate(Sender: TObject);
      Procedure OnEditCierre(Sender: TObject; MantFields: TFields);

    // Depura Ordenes de Compra
      Procedure OnEditCierreOCDep(Sender: TObject; MantFields: TFields);

   End;
Procedure ADDepuraRequisPendientes; stdcall;
Procedure ADDepuraOrdCompra; stdcall;
Procedure ADVerificaVersion; stdcall;

Exports
   ADDepuraRequisPendientes,
   ADDepuraOrdCompra,
   ADVerificaVersion;
Var
   FADProcesos: TFADProcesos;
   Mtx4000: TMant;
   wTipoOC: String;
   D, M, Y: word;

Implementation

{$R *.dfm}
Uses LOGDM1, LOG201, LOG216, LOG602, LOG227, LOG603;

// LOG216 Tool Depuración de Requisiciones/Ordenes de Compra
// LOG602 Glosa para Depuración de Requisiciones
// LOG227 Depuración de Ordenes de Compra
// LOG603 Glosa para Depuración de Ordenes de Compra

////////////////////////////////////////////////////////////////////////
// DEPURA REQUISICIONES PENDIENTES
////////////////////////////////////////////////////////////////////////
Procedure ADDepuraRequisPendientes;
Var
   sWhere: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;

   sWhere := 'RQSEST=' + quotedstr('PARCIAL') + ' OR RQSEST=' + quotedstr('ACEPTADO') + ' OR RQSEST=' + quotedstr('DEPURADO');
   FToolRqs := TFToolRqs.Create(Application);
   FToolRqs.Z2bbtnGrabaRqs.Visible := True;
   FToolRqs.Z2bbtnGrabaOC.Visible := False;
   FToolRqs.Visible := False;
   FDepRqs := TFDepRqs.create(Application);
   DMLOG.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx4000 := TMant.Create(Application);
   Try
      Mtx4000.Admin := DMLOG.wAdmin;
      Mtx4000.User := DMLOG.wUsuario;
      Mtx4000.Module := DMLOG.wModulo;
      Mtx4000.TableName := 'LOG308';
      Mtx4000.Filter := sWhere;
      Mtx4000.Titulo := 'Depura Requisiciones';
      Mtx4000.ClientDataSet := DMLOG.cdsReqs;
      Mtx4000.DComC := DMLOG.DCOM1;
      Mtx4000.OnCreateMant := FADProcesos.ToolsCreate;
      Mtx4000.OnDelete := Nil;
      Mtx4000.OnEdit := FADProcesos.OnEditCierre;
      Mtx4000.OnInsert := Nil;
      Mtx4000.OnShow := Nil;
      Mtx4000.SectionName := 'LOGDepReqsPend';
      Mtx4000.FileNameIni := '\oaLog.ini';
      Mtx4000.MultiSelect := True;
      Mtx4000.OnCierra := DMLOG.DisminuyeForma;
      Mtx4000.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx4000.Execute;
   Finally
   End;
End;

Procedure TFADProcesos.ToolsCreate(Sender: TObject);
Var
   pl, pl2: TPanel;
Begin
   //Panel Tools
   pl := FToolRqs.pnlBtn;
   pl2 := TMant(Sender).FMant.pnlBtns;
   pl2.Height := pl.Height + 5;
   pl.Parent := TMant(Sender).FMant.pnlBtns;
   pl.Align := alClient;
   pl2.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;

   //Panel Flotante
   pl := FToolRqs.pnlDepODC;
   pl2 := TMant(Sender).FMant.pnlFRegistro;
   pl2.Height := pl.Height + 5;
   pl.Parent := TMant(Sender).FMant.pnlFRegistro;
   pl.Align := alClient;
   pl2.AutoSize := True;
End;

Procedure TFADProcesos.OnEditCierre(Sender: TObject;
   MantFields: TFields);
Var
   sCIA, sLOC, sRQS, sSQL: String;
Begin

   sCIA := MantFields.FieldByName('CIAID').AsString;
   sLOC := MantFields.FieldByName('LOCID').AsString;
   sRQS := MantFields.FieldByName('RQSID').AsString;

   sSQL := 'Select * '
      + '     from LOG308 '
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
      ErrorMsg('Error', 'No Existen Registros a Editar');
      exit;
   End;
   Screen.Cursor := crHourGlass;
   wModo := 'M';
   sSQL := 'Select * '
      + '     from LOG309 '
      + '     here CIAID=''' + sCIA + ''' AND RQSID=''' + sRQS + ''' AND LOCID=''' + sLOC + ''' ORDER BY CIAID, LOCID, RQSID, DRQSID';
   DMLOG.cdsDReqs.Close;
   DMLOG.cdsDReqs.MasterSource := Nil;
   DMLOG.cdsDReqs.MasterFields := '';
   DMLOG.cdsDReqs.IndexFieldNames := '';
   DMLOG.cdsDReqs.DataRequest(sSQL);
   DMLOG.cdsDReqs.Open;
   FRegReqs := TFRegReqs.create(Application);

   FRegReqs.xValorX := 'X';
   FRegReqs.dblcCIA.Enabled := False;
   FRegReqs.dbeNumRqs.Enabled := False;
   FRegReqs.dblcLOC.Enabled := False;
   FRegReqs.Z2bbtnNuevo.Enabled := False;
   Screen.Cursor := crDefault;
   FRegReqs.ActiveMDIChild;
End;
// Fin Depura Requisiciones

////////////////////////////////////////////////////////////////////////
// DEPURA ORDENES DE COMPRA
////////////////////////////////////////////////////////////////////////
Procedure ADDepuraOrdCompra;
Var
   sWhere: String;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;
   sWhere := 'ODCEST=' + quotedstr('PARCIAL') + ' OR ODCEST=' + quotedstr('ACEPTADO') + ' OR ODCEST=' + quotedstr('DEPURADO');
   FToolRqs := TFToolRqs.Create(Application);
   FToolRqs.Z2bbtnGrabaRqs.Visible := False;
   FToolRqs.Z2bbtnGrabaOC.Visible := True;
   FToolRqs.Visible := False;

   DMLOG.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mtx4000 := TMant.Create(Application);
   Try
      Mtx4000.Admin := DMLOG.wAdmin;
      Mtx4000.User := DMLOG.wUsuario;
      Mtx4000.Module := DMLOG.wModulo;
      Mtx4000.TableName := 'LOG304';
      Mtx4000.Filter := sWhere;
      Mtx4000.Titulo := 'Depura Ordenes de Compra';
      Mtx4000.DComC := DMLOG.DCOM1;
      Mtx4000.ClientDataSet := DMLOG.cdsOrdComp;
      Mtx4000.OnCreateMant := FADProcesos.ToolsCreate;
      Mtx4000.OnEdit := FADProcesos.OnEditCierreOCDep;
      Mtx4000.OnDelete := Nil;
      Mtx4000.OnInsert := Nil;
      Mtx4000.OnShow := Nil;
      Mtx4000.SectionName := 'LOGDepOComPend';
      Mtx4000.FileNameIni := '\oaLog.ini';
      Mtx4000.MultiSelect := True;
      Mtx4000.OnCierra := DMLOG.DisminuyeForma;
      Mtx4000.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx4000.Execute;
   Finally
   End;
End;

Procedure TFADProcesos.OnEditCierreOCDep(Sender: TObject;
   MantFields: TFields);
Begin
   xSQL := 'select * from LOG304 '
      + 'where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '  and ODCID=' + QuotedStr(MantFields.FieldByName('ODCID').AsString);
   DMLOG.cdsOrdComp.Close;
   DMLOG.cdsOrdComp.IndexFieldNames := '';
   DMLOG.cdsOrdComp.Filter := '';
   DMLOG.cdsOrdComp.Filtered := False;
   DMLOG.cdsOrdComp.DataRequest(xSQL);
   DMLOG.cdsOrdComp.Open;

   If (DMLOG.cdsOrdComp.RecNo <= 0) And
      (DMLOG.cdsOrdComp.eof) Then
   Begin
      ErrorMsg('Error', 'No existen registros a editar');
      exit;
   End;
   Screen.Cursor := crHourGlass;

   FRegOrdCDep := TFRegOrdCDep.create(Application);

   wModo := 'M';
   FRegOrdCDep.xValorX := 'X';
   FRegOrdCDep.dblcCIA.Enabled := False;
   FRegOrdCDep.dedNProforma.Enabled := False;
   Screen.Cursor := crHourGlass;
   FRegOrdCDep.ActiveMDIChild;
End;

Procedure ADVerificaVersion;
Begin
   If DMLOG = Nil Then exit;
   If Not DMLOG.DCOM1.Connected Then Exit;
   FADProcesos := TFADProcesos.Create(Application);
   If DMLOG.fg_VerificaVersion(FADProcesos.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

End.


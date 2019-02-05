Unit LOG120;
// Inicio Uso Estándares: 01/08/2011
// Unidad               : LOG120
// Formulario           : FTextoTickets
// Fecha de Creación    : 09/09/2016
// Autor                : Ricardo Medina.
// Objetivo             : Adicionar, Modificar Texto de los Tickets
// Actualizaciones      :
// HPC_201601_LOG       : Creación de formulario

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ExtCtrls, jpeg, ComCtrls, Buttons, ppPrnabl, ppClass,
   ppCtrls, ppBands, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppEndUsr, ppParameter;

Type
   TFTextoTickets = Class(TForm)
      edtP1_1: TEdit;
      Image1: TImage;
      Shape1: TShape;
      edtP1_2: TEdit;
      edtP1_3: TEdit;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      edtP2_1: TEdit;
      edtP2_2: TEdit;
      edtP2_3: TEdit;
      GroupBox1: TGroupBox;
      btnPrevio: TBitBtn;
      btnGrabar: TBitBtn;
      btnHistorico: TBitBtn;
      btnSalir: TBitBtn;
      Label5: TLabel;
      dateInicio: TDateTimePicker;
      Label6: TLabel;
      dateFinal: TDateTimePicker;
      chkActivo: TCheckBox;
      Label7: TLabel;
      btnNuevo: TBitBtn;
      Label8: TLabel;
      edtReferencia: TEdit;
      ppDBPipeline1: TppDBPipeline;
      ppTickets: TppReport;
      ppD1: TppDesigner;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppImage1: TppImage;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLine1: TppLine;
      P1_1: TppLabel;
      P1_2: TppLabel;
      P1_3: TppLabel;
      P2_1: TppLabel;
      P2_2: TppLabel;
      P2_3: TppLabel;
      ppDetailBand1: TppDetailBand;
      Label9: TLabel;
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure btnSalirClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure btnGrabarClick(Sender: TObject);
      Procedure edtP1_1KeyPress(Sender: TObject; Var Key: Char);
      Procedure edtP1_2KeyPress(Sender: TObject; Var Key: Char);
      Procedure edtP1_3KeyPress(Sender: TObject; Var Key: Char);
      Procedure edtP2_1KeyPress(Sender: TObject; Var Key: Char);
      Procedure edtP2_2KeyPress(Sender: TObject; Var Key: Char);
      Procedure edtP2_3KeyPress(Sender: TObject; Var Key: Char);
      Procedure btnPrevioClick(Sender: TObject);
      Procedure btnHistoricoClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure btnNuevoClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
      vmodo, vcodigo, vchk: String;
   End;

Var
   FTextoTickets: TFTextoTickets;

Implementation

{$R *.dfm}
Uses LOGDM1, LOG121;

Procedure TFTextoTickets.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFTextoTickets.btnSalirClick(Sender: TObject);
Begin
   close;
End;

Procedure TFTextoTickets.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   Action := CAFree;
End;

Procedure TFTextoTickets.btnGrabarClick(Sender: TObject);
Var
   xsql, NUEVOTEX, vactivo: String;
Begin
   If MessageDlg('Desea grabar el Texto del Tickets', mtconfirmation, [mbYes, mbNo], 0) = mrNo Then
   Begin
      Exit;
   End;

   If dateInicio.Date > dateFinal.Date Then
   Begin
      ShowMessage('Fechas inconsistentes, verifique');
      exit;
   End;

   If Length(trim(edtReferencia.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar una referencia del Mensaje');
      exit;
   End;

   If chkActivo.Checked = False Then
   Begin
      ShowMessage('Se grabará pero NO esta [Activo] el Mensaje...');
   End;

   If chkActivo.Checked Then
      vactivo := 'S'
   Else
      vactivo := '';

   DMLOG.DCOM1.AppServer.IniciaTransaccion;

// Primero desactiva
   xsql := 'Update DM_PIE_TICKET set activo=null,USUMOD=''' + DMLOG.wUsuario + ''',FECMOD=SYSDATE  Where nvl(activo,''X'')=''S'' ';
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xsql);
   Except
      Screen.Cursor := crDefault;
      ShowMessage('Error al actualizar los mensajes del tickets (1 DM_PIE_TICKET)');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Exit;
   End;

// Segundo Inserto nuevo texto
   If Length((vcodigo)) = 0 Then
   Begin
      xsql := 'Select nvl(MAX(CODTEX)+1,1) NUEVOTEX FROM  DM_PIE_TICKET ';
      DMLOG.cdsQry.Close;
      DMLOG.cdsQry.DataRequest(xsql);
      DMLOG.cdsQry.Open;
      NUEVOTEX := DMLOG.StrZero(trim(DMLOG.cdsQry.Fieldbyname('NUEVOTEX').AsString), 10);
   End
   Else
   Begin
      NUEVOTEX := vcodigo;
      xsql := 'Delete DM_PIE_TICKET where CODTEX=''' + vcodigo + ''' ';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xsql);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al actualizar los mensajes del tickets (0 DM_PIE_TICKET)');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End;

   If Length(Trim(edtP1_1.Text)) > 0 Then
   Begin
      xsql := 'Insert into  DM_PIE_TICKET(CODTEX,PIEPAG,ORDEN,REFERENCIA,LINEA,FECINI,FECFIN,ACTIVO,USUCRE,FECCRE) VALUES(' +
         '''' + NUEVOTEX + ''',''P1'',1,''' + Trim(edtReferencia.Text) + ''',''' + Trim(edtP1_1.Text) + ''',''' + DateToStr(dateInicio.Date) + ''',''' + DateToStr(dateFinal.Date) + ''',''' + vactivo + ''',''' + DMLOG.wUsuario + ''',SYSDATE)';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xsql);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al actualizar los mensajes del tickets (2 DM_PIE_TICKET)');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End;

   If Length(Trim(edtP1_2.Text)) > 0 Then
   Begin
      xsql := 'Insert into  DM_PIE_TICKET(CODTEX,PIEPAG,ORDEN,REFERENCIA,LINEA,FECINI,FECFIN,ACTIVO,USUCRE,FECCRE) VALUES(' +
         '''' + NUEVOTEX + ''',''P1'',2,''' + Trim(edtReferencia.Text) + ''',''' + Trim(edtP1_2.Text) + ''',''' + DateToStr(dateInicio.Date) + ''',''' + DateToStr(dateFinal.Date) + ''',''' + vactivo + ''',''' + DMLOG.wUsuario + ''',SYSDATE)';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xsql);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al actualizar los mensajes del tickets (3 DM_PIE_TICKET)');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End;

   If Length(Trim(edtP1_3.Text)) > 0 Then
   Begin
      xsql := 'Insert into  DM_PIE_TICKET(CODTEX,PIEPAG,ORDEN,REFERENCIA,LINEA,FECINI,FECFIN,ACTIVO,USUCRE,FECCRE) VALUES(' +
         '''' + NUEVOTEX + ''',''P1'',3,''' + Trim(edtReferencia.Text) + ''',''' + Trim(edtP1_3.Text) + ''',''' + DateToStr(dateInicio.Date) + ''',''' + DateToStr(dateFinal.Date) + ''',''' + vactivo + ''',''' + DMLOG.wUsuario + ''',SYSDATE)';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xsql);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al actualizar los mensajes del tickets (4 DM_PIE_TICKET)');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End;

     //---------------
   If Length(Trim(edtP2_1.Text)) > 0 Then
   Begin
      xsql := 'Insert into  DM_PIE_TICKET(CODTEX,PIEPAG,ORDEN,REFERENCIA,LINEA,FECINI,FECFIN,ACTIVO,USUCRE,FECCRE) VALUES(' +
         '''' + NUEVOTEX + ''',''P2'',1,''' + Trim(edtReferencia.Text) + ''',''' + Trim(edtP2_1.Text) + ''',''' + DateToStr(dateInicio.Date) + ''',''' + DateToStr(dateFinal.Date) + ''',''' + vactivo + ''',''' + DMLOG.wUsuario + ''',SYSDATE)';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xsql);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al actualizar los mensajes del tickets (2 DM_PIE_TICKET)');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End;

   If Length(Trim(edtP2_2.Text)) > 0 Then
   Begin
      xsql := 'Insert into  DM_PIE_TICKET(CODTEX,PIEPAG,ORDEN,REFERENCIA,LINEA,FECINI,FECFIN,ACTIVO,USUCRE,FECCRE) VALUES(' +
         '''' + NUEVOTEX + ''',''P2'',2,''' + Trim(edtReferencia.Text) + ''',''' + Trim(edtP2_2.Text) + ''',''' + DateToStr(dateInicio.Date) + ''',''' + DateToStr(dateFinal.Date) + ''',''' + vactivo + ''',''' + DMLOG.wUsuario + ''',SYSDATE)';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xsql);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al actualizar los mensajes del tickets (3 DM_PIE_TICKET)');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End;

   If Length(Trim(edtP2_3.Text)) > 0 Then
   Begin
      xsql := 'Insert into  DM_PIE_TICKET(CODTEX,PIEPAG,ORDEN,REFERENCIA,LINEA,FECINI,FECFIN,ACTIVO,USUCRE,FECCRE) VALUES(' +
         '''' + NUEVOTEX + ''',''P2'',3,''' + Trim(edtReferencia.Text) + ''',''' + Trim(edtP2_3.Text) + ''',''' + DateToStr(dateInicio.Date) + ''',''' + DateToStr(dateFinal.Date) + ''',''' + vactivo + ''',''' + DMLOG.wUsuario + ''',SYSDATE)';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xsql);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al actualizar los mensajes del tickets (4 DM_PIE_TICKET)');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End;

   DMLOG.DCOM1.AppServer.GrabaTransaccion;
   ShowMessage('Grabación correcta');
End;

Procedure TFTextoTickets.edtP1_1KeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In ['''', '"', '{', '}', '|', '¨', '´', '`'] Then
      Key := #0;
End;

Procedure TFTextoTickets.edtP1_2KeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In ['''', '"', '{', '}', '|', '¨', '´', '`'] Then
      Key := #0;
End;

Procedure TFTextoTickets.edtP1_3KeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In ['''', '"', '{', '}', '|', '¨', '´', '`'] Then
      Key := #0;
End;

Procedure TFTextoTickets.edtP2_1KeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In ['''', '"', '{', '}', '|', '¨', '´', '`'] Then
      Key := #0;
End;

Procedure TFTextoTickets.edtP2_2KeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In ['''', '"', '{', '}', '|', '¨', '´', '`'] Then
      Key := #0;
End;

Procedure TFTextoTickets.edtP2_3KeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In ['''', '"', '{', '}', '|', '¨', '´', '`'] Then
      Key := #0;
End;

Procedure TFTextoTickets.btnPrevioClick(Sender: TObject);
Begin
   P1_1.Caption := edtP1_1.Text;
   P1_2.Caption := edtP1_2.Text;
   P1_3.Caption := edtP1_3.Text;

   P2_1.Caption := edtP2_1.Text;
   P2_2.Caption := edtP2_2.Text;
   P2_3.Caption := edtP2_3.Text;

   ppTickets.Print;
   ppTickets.Stop;
End;

Procedure TFTextoTickets.btnHistoricoClick(Sender: TObject);
Var
   xsql: String;
Begin

   xsql := 'Select CODTEX,REFERENCIA,ACTIVO,FECINI,FECFIN,USUCRE,FECCRE '
      + '  From DM_PIE_TICKET  '
      + ' Group by CODTEX,REFERENCIA,ACTIVO,FECINI,FECFIN,USUCRE,FECCRE '
      + ' Order by CODTEX ';
   DMLOG.cdsQry3.Close;
   DMLOG.cdsQry3.DataRequest(xsql);
   DMLOG.cdsQry3.Open;
   DMLOG.cdsQry3.IndexFieldNames := 'REFERENCIA';

   Try
      fTicketHistorico := TfTicketHistorico.Create(Self);
      fTicketHistorico.dbgHistorico.DataSource := DMLOG.dsQry3;
      fTicketHistorico.IBuscar.DataSource := DMLOG.dsQry3;
      fTicketHistorico.IBuscar.SearchField := 'REFERENCIA';
      fTicketHistorico.ShowModal;
   Finally
      vcodigo := DMLOG.cdsQry3.FieldByname('CODTEX').AsString;
      fTicketHistorico.Free;
   End;
   If vmodo = 'N' Then exit;

   xsql := 'Select CODTEX,PIEPAG,ORDEN,REFERENCIA,LINEA,FECINI,FECFIN,ACTIVO,USUCRE,FECCRE,USUMOD,FECMOD ' +
      'From DM_PIE_TICKET Where CODTEX=''' + DMLOG.cdsQry3.FieldByname('CODTEX').AsString + ''' ';
   DMLOG.cdsQry4.Close;
   DMLOG.cdsQry4.DataRequest(xsql);
   DMLOG.cdsQry4.Open;
   edtP1_1.Text := '';
   edtP1_2.Text := '';
   edtP1_3.Text := '';
   edtP2_1.Text := '';
   edtP2_2.Text := '';
   edtP2_3.Text := '';

   While Not DMLOG.cdsQry4.Eof Do
   Begin
      If (DMLOG.cdsQry4.FieldByName('PIEPAG').AsString = 'P1') And (DMLOG.cdsQry4.FieldByName('ORDEN').AsInteger = 1) Then
         edtP1_1.Text := DMLOG.cdsQry4.FieldByname('LINEA').AsString;
      If (DMLOG.cdsQry4.FieldByName('PIEPAG').AsString = 'P1') And (DMLOG.cdsQry4.FieldByName('ORDEN').AsInteger = 2) Then
         edtP1_2.Text := DMLOG.cdsQry4.FieldByname('LINEA').AsString;
      If (DMLOG.cdsQry4.FieldByName('PIEPAG').AsString = 'P1') And (DMLOG.cdsQry4.FieldByName('ORDEN').AsInteger = 3) Then
         edtP1_3.Text := DMLOG.cdsQry4.FieldByname('LINEA').AsString;
      If (DMLOG.cdsQry4.FieldByName('PIEPAG').AsString = 'P2') And (DMLOG.cdsQry4.FieldByName('ORDEN').AsInteger = 1) Then
         edtP2_1.Text := DMLOG.cdsQry4.FieldByname('LINEA').AsString;
      If (DMLOG.cdsQry4.FieldByName('PIEPAG').AsString = 'P2') And (DMLOG.cdsQry4.FieldByName('ORDEN').AsInteger = 2) Then
         edtP2_2.Text := DMLOG.cdsQry4.FieldByname('LINEA').AsString;
      If (DMLOG.cdsQry4.FieldByName('PIEPAG').AsString = 'P2') And (DMLOG.cdsQry4.FieldByName('ORDEN').AsInteger = 3) Then
         edtP2_3.Text := DMLOG.cdsQry4.FieldByname('LINEA').AsString;
      DMLOG.cdsQry4.Next;
   End;

   If DMLOG.cdsQry4.FieldByName('ACTIVO').AsString = 'S' Then
      chkActivo.Checked := True
   Else
      chkActivo.Checked := False;

   dateInicio.Date := DMLOG.cdsQry4.FieldByName('FECINI').AsDateTime;
   dateFinal.Date := DMLOG.cdsQry4.FieldByName('FECFIN').AsDateTime;
   edtReferencia.Text := DMLOG.cdsQry4.FieldByName('REFERENCIA').AsString;
End;

Procedure TFTextoTickets.FormCreate(Sender: TObject);
Begin
   vmodo := '';
   chkActivo.Checked := True;
   btnNuevoClick(self);
End;

Procedure TFTextoTickets.btnNuevoClick(Sender: TObject);
Var
   xsql: String;
Begin

   xsql := 'Select Trunc(Sysdate) vFecha From dual ';
   DMLOG.cdsFPago.Close;
   DMLOG.cdsFPago.DataRequest(xsql);
   DMLOG.cdsFPago.Open;

   vcodigo := '';
   edtP1_1.Text := '';
   edtP1_2.Text := '';
   edtP1_3.Text := '';
   edtP2_1.Text := '';
   edtP2_2.Text := '';
   edtP2_3.Text := '';
   edtReferencia.Text := '';
   dateInicio.Date := DMLOG.cdsFPago.FieldByname('vFecha').AsDateTime;
   dateFinal.Date := DMLOG.cdsFPago.FieldByname('vFecha').AsDateTime;
   chkActivo.Checked := True;
End;

End.


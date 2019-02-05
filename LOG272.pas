Unit LOG272;
// Actualizaciones:
// HPC_201305_LOG 19/11/2011: Inicio de Formulario
//                            Orden de Trabajo
// HPC_201401_LOG 10/01/2014
// HPC_201401_LOG 29/05/2014 -	Se amplió en la caja de texto "Numero de Atención" a 20 caracteres como máximo
//                              y también admite todos los tipo de caracteres posibles de procesar.
// HPC_201402_LOG 01/06/2014  Se adicionó rutina de eliminación de detalle
// HPC_201405_LOG 22/09/2014  Se adiciona control transaccional a la grabación de Órdenes de Trabajo

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, wwdblook, Wwdbdlg, ExtCtrls, Buttons,
   wwdbdatetimepicker, DB;

Type
   TfDetalleOrdTrab = Class(TForm)
      grbDetalle: TGroupBox;
      Panel1: TPanel;
      edtOrdTrebajo: TEdit;
      Label2: TLabel;
      edtResponsable: TEdit;
      dblcTipTrabajo2: TwwDBLookupComboDlg;
      Label1: TLabel;
      edtTrabajo: TEdit;
      memDescripcion: TMemo;
      GroupBox5: TGroupBox;
      Label8: TLabel;
      Label9: TLabel;
      edtFecCreacion: TEdit;
      edtUsuCreacion: TEdit;
      grbControles: TGroupBox;
      btnGrabar: TBitBtn;
      BtnSalir: TBitBtn;
      EdtCiaid: TEdit;
      EdtCia: TEdit;
      dblcResponsable: TwwDBLookupComboDlg;
      Label3: TLabel;
      dbfFecInicio: TwwDBDateTimePicker;
      Label4: TLabel;
      Procedure FormCreate(Sender: TObject);
      Procedure BtnSalirClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcResponsableExit(Sender: TObject);
      Procedure dblcTipTrabajo2Exit(Sender: TObject);
      Procedure btnGrabarClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormShow(Sender: TObject);
      Procedure memDescripcionKeyPress(Sender: TObject; Var Key: Char);
   Private
    { Private declarations }
   Public
    { Public declarations }

   End;

Var
   fDetalleOrdTrab: TfDetalleOrdTrab;

Implementation

Uses LOGDM1, LOG271;

{$R *.dfm}

Procedure TfDetalleOrdTrab.FormCreate(Sender: TObject);
Var
   XSQL: String;
Begin

 //Tipo de Trabajo
   XSQL := 'Select * From LOG_TIPO_TRABAJO ';
   DMLOG.cdsFAM.Close;
   DMLOG.cdsFAM.DataRequest(XSQL);
   DMLOG.cdsFAM.Open;
   dblcTipTrabajo2.LookupField := 'TIPOTRABAJOID';
   dblcTipTrabajo2.LookupTable := DMLOG.cdsFAM;
   dblcTipTrabajo2.Selected.Clear;
   dblcTipTrabajo2.Selected.add('TIPOTRABAJOID'#9'6'#9'Código'#9'F');
   dblcTipTrabajo2.Selected.add('TIPOTRABAJODES'#9'30'#9'Descripción'#9'F');
   dblcTipTrabajo2.Text := FOrdenTrabajo.dblcTipTrabajo.Text;
   If DMLOG.cdsFAM.locate('TIPOTRABAJOID', VarArrayOf([FOrdenTrabajo.dblcTipTrabajo.Text]), []) Then
      edtTrabajo.Text := DMLOG.cdsFAM.FieldByname('TIPOTRABAJODES').AsString
   Else
      edtTrabajo.Text := '';

 //Responsable
   XSQL := 'Select * From TGE135 Where USERID is not null ';
   DMLOG.cdsCompradores.Close;
   DMLOG.cdsCompradores.DataRequest(XSQL);
   DMLOG.cdsCompradores.Open;
   dblcResponsable.LookupField := 'COMPCID';
   dblcResponsable.LookupTable := DMLOG.cdsCompradores;
   dblcResponsable.Selected.Clear;
   dblcResponsable.Selected.add('COMPCID'#9'6'#9'Código'#9'F');
   dblcResponsable.Selected.add('COMPDES'#9'30'#9'Descripción'#9'F');

End;

Procedure TfDetalleOrdTrab.BtnSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfDetalleOrdTrab.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TfDetalleOrdTrab.dblcResponsableExit(Sender: TObject);
Begin
   If DMLOG.cdsCompradores.locate('COMPCID', VarArrayOf([DMLOG.cdsCompradores.FieldByName('COMPCID').AsString]), []) Then
      edtResponsable.Text := DMLOG.cdsCompradores.FieldByname('COMPDES').AsString
   Else
      edtResponsable.Text := '';
End;

Procedure TfDetalleOrdTrab.dblcTipTrabajo2Exit(Sender: TObject);
Begin
   If DMLOG.cdsFAM.locate('TIPOTRABAJOID', VarArrayOf([DMLOG.cdsFAM.FieldByName('TIPOTRABAJOID').AsString]), []) Then
      edtTrabajo.Text := DMLOG.cdsFAM.FieldByname('TIPOTRABAJODES').AsString
   Else
      edtTrabajo.Text := '';
End;

Procedure TfDetalleOrdTrab.btnGrabarClick(Sender: TObject);
Var
   xSql, cCorr: String;
Begin
   If Length(Trim(dbfFecInicio.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar la Fecha de Inicio de Trbajo');
      dbfFecInicio.SetFocus;
      exit;
   End;

// Adiciona trabajo al Reponsable
   If DMLOG.wModo = 'A' Then
   Begin
      If MessageDlg('Esta seguro de Insertar Nuevo Trabajo a la OT.?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
      Begin

      // Genera correlativo del detalle
         xSQL := 'Select LPAD(NVL(MAX(NUMORDDET),0)+1,4,''0'') NUMORDDET  From LOG_ORDEN_TRABAJO_DET '
            + 'Where Ciaid=''' + Trim(EdtCiaid.Text) + ''' And Numordtra=''' + Trim(edtOrdTrebajo.Text) + ''' ';
         DMLOG.cdsQry1.Close;
         DMLOG.cdsQry1.DataRequest(xSql);
         DMLOG.cdsQry1.Open;
         cCorr := DMLOG.cdsQry1.FieldByname('NUMORDDET').AsString;

         xSQL := 'Insert Into LOG_ORDEN_TRABAJO_DET(CIAID, NUMORDDET, NUMORDTRA, '
            + '                                  CODRESPONSABLE, TIPOTRABAJOID, '
            + '                                  OBSDETTRAB,FECINITRAB,ESTTRAB, '
            + '                                  USUARIO,FECCREACION)'
            + 'Values(' + quotedstr(Trim(EdtCiaid.Text)) + ','
            + quotedstr(cCorr) + ','
            + quotedstr(Trim(edtOrdTrebajo.Text)) + ','
            + quotedstr(Trim(dblcResponsable.Text)) + ','
            + quotedstr(Trim(dblcTipTrabajo2.Text)) + ','
      //         + '       ''' + memDescripcion.Lines.Text + ''',''' + dbfFecInicio.Text + ''',''PENDIENTE'',''' + DMLOG.wUsuario + ''',SYSDATE)';
         + quotedstr(memDescripcion.Lines.Text) + ','
            + quotedstr(datetostr(dbfFecInicio.date)) + ','
            + quotedstr('INICIAL') + ','
            + quotedstr(DMLOG.wUsuario) + ','
            + '         SysDate)';
      // Inicio HPC_201405_LOG
         DMLOG.DCOM1.AppServer.IniciaTransaccion;
         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo AÑADIR el Detalle de la Orden de Trabajo');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            Raise;
            exit;
         End;
         DMLOG.DCOM1.AppServer.GrabaTransaccion;
         ShowMessage('Se añadió con Exito el Detalle de la Orden de Trabajo');
         BtnSalirClick(self);
      // Final HPC_201405_LOG
      End;
   End;
End;

Procedure TfDetalleOrdTrab.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMLOG.cdsQry1.Close;
   DMLOG.cdsQry11.Close;
   DMLOG.cdsFAM.Close;
   DMLOG.cdsFAM.IndexFieldNames := '';
   DMLOG.cdsCompradores.Close;
End;

Procedure TfDetalleOrdTrab.FormShow(Sender: TObject);
Begin
   //Para solo consulta
   If DMLOG.wModo = 'C' Then
   Begin
      XSQL := 'Select * From LOG_ORDEN_TRABAJO_DET '
         + ' Where Ciaid=''' + DMLOG.wciaid + ''' and Numordtra=''' + DMLOG.wNumordtra + ''' and  Numorddet=''' + DMLOG.wNumorddet + ''' ';
      DMLOG.cdsQry11.Close;
      DMLOG.cdsQry11.DataRequest(xsql);
      DMLOG.cdsQry11.Open;
      If DMLOG.cdsQry11.RecordCount > 0 Then
      Begin
         EdtCiaid.Text := DMLOG.cdsQry11.FieldByname('CIAID').AsString;
         EdtCia.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=''' + EdtCiaid.Text + ''' ', 'CIADES');
         EdtOrdTrebajo.Text := DMLOG.cdsQry11.FieldByname('NUMORDTRA').AsString;

         dblcResponsable.Text := DMLOG.cdsQry11.FieldByname('CODRESPONSABLE').AsString;
         If DMLOG.cdsCompradores.locate('COMPCID', VarArrayOf([dblcResponsable.Text]), []) Then
            edtResponsable.Text := DMLOG.cdsCompradores.FieldByname('COMPDES').AsString
         Else
            edtResponsable.Text := '';

         dblcTipTrabajo2.Text := DMLOG.cdsQry11.FieldByname('TIPOTRABAJOID').AsString;
         If DMLOG.cdsFAM.locate('TIPOTRABAJOID', VarArrayOf([dblcTipTrabajo2.Text]), []) Then
            edtTrabajo.Text := DMLOG.cdsFAM.FieldByname('TIPOTRABAJODES').AsString
         Else
            edtTrabajo.Text := '';

         dbfFecInicio.DateTime := DMLOG.cdsQry11.FieldByname('FECINITRAB').AsDateTime;
         memDescripcion.Lines.Text := DMLOG.cdsQry11.FieldByname('OBSDETTRAB').AsString;
         edtFecCreacion.Text := DMLOG.cdsQry11.FieldByname('FECCREACION').AsString;
         edtUsuCreacion.Text := DMLOG.cdsQry11.FieldByname('USUARIO').AsString;

         grbDetalle.Enabled := False;
         grbControles.Enabled := False;
      End;

   End;
End;

Procedure TfDetalleOrdTrab.memDescripcionKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If Key In [Chr(39), '´'] Then
      Key := #0;
End;

End.


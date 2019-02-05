Unit LOG264;

// Actualizaciones
// HPC_201405_LOG          : 14/10/2014 Se lleva Lista de Precios de Adquisiciones Ventas a Adquisiciones SSGG
//                           14/10/2014 Reordenamiento de Sangría

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, wwdblook, ExtCtrls,
   Mask, wwdbedit, DB, msgdlgs;

Type
   TFCombos = Class(TForm)
      pnlDet: TPanel;
      dbgDet: TwwDBGrid;
      pnlCab: TPanel;
      dbgCab: TwwDBGrid;
      Label1: TLabel;
      dblcLPrecio: TwwDBLookupCombo;
      edtLPrecio: TEdit;
      Label14: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      bbtnRegOk: TBitBtn;
      Label6: TLabel;
      dblcTinid: TwwDBLookupCombo;
      edtTinid: TEdit;
      BitBtn2: TBitBtn;
      bbtnMostrar: TBitBtn;
      dbgCabIButton: TwwIButton;
      dbgDetIButton: TwwIButton;
      Panel1: TPanel;
      dbeCod: TwwDBEdit;
      dbeNombre: TwwDBEdit;
      Label3: TLabel;
      dbePrePub: TwwDBEdit;
      Label4: TLabel;
      dbeImpRec: TwwDBEdit;
      BitBtn1: TBitBtn;
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcTinidExit(Sender: TObject);
      Procedure bbtnMostrarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dbgCabIButtonClick(Sender: TObject);
      Procedure dbgCabDblClick(Sender: TObject);
      Procedure dbgDetIButtonClick(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure dblcLPrecioExit(Sender: TObject);
      Procedure dbgDetDblClick(Sender: TObject);
      Procedure CalculaFooter;
      Procedure bbtnRegOkClick(Sender: TObject);
      Procedure dblcLPrecioEnter(Sender: TObject);
      Procedure dbgCabRowChanged(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormActivate(Sender: TObject);
      Procedure dbgDetKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure BitBtn1Click(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FCombos: TFCombos;

Implementation

{$R *.dfm}

Uses LOGDM1, LOG265, LOG266; // MsgDlgs,

Procedure TFCombos.dblcCiaExit(Sender: TObject);
Begin
   edtCia.Text := DMLOG.DisplayDescrip('PRVSQL', 'TGE101', 'CIADES', 'CIAID=''' + dblcCia.Text + '''', 'CIADES');
   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Compañía no Existe');
      dblcCia.Text := '';
      dblcCia.SetFocus;
   End;

   xSQL := 'SELECT * FROM FAC101 '
      + 'WHERE CIAID=' + quotedStr(dblcCia.Text) + ' and TLISTAFLAG=''S''';
   DMLOG.cdsTLista.Close;
   DMLOG.cdsTLista.DataRequest(xSQL);
   DMLOG.cdsTLista.Open;

   DMLOG.cdsTINID.Close;
   DMLOG.cdsTINID.DataRequest('SELECT * FROM TGE152 WHERE CIAID=''' + dblcCia.Text + ''' AND TINVENTAS=''S''');
   DMLOG.cdsTINID.Open;
End;

Procedure TFCombos.dblcTinidExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CIAID=' + quotedstr(dblcCia.Text) + ' and TINID=' + quotedstr(dblcTinid.text);
   edtTinid.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE152', 'TINDES', xWhere, 'TINDES');
   If length(edtTinid.text) = 0 Then
   Begin
      Showmessage('Ingrese el Tipo de Inventario');
      dblcTinid.SetFocus;
   End;
End;

Procedure TFCombos.bbtnMostrarClick(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select * from FAC_COM_CAB '
      + 'Where CIAID=''' + dblcCia.Text + ''' AND TINID=''' + dblcTinid.Text + ''' '
      + 'ORDER BY CODCOM';
   DMLOG.cdsConsumo.Close;
   DMLOG.cdsConsumo.DataRequest(xSQL);
   DMLOG.cdsConsumo.Open;

   dblcLPrecio.Text := DMLOG.cdsTLista.FieldByname('TLISTAID').AsString;
   dblcLPrecioExit(self);
End;

Procedure TFCombos.FormCreate(Sender: TObject);
Begin
   DMLOG.FiltraTabla(DMLOG.cdsTMoneda, 'TGE103', 'TMONID', 'TMONID');

   dbgCab.DataSource := DMLOG.dsConsumo;
   dbgDet.DataSource := DMLOG.dsNegociacion;

   dblcCia.Text := DMLOG.cdsCIA.FieldByname('CIAID').AsString;
   dblcCiaExit(self);
   dblcTinid.Text := DMLOG.cdsTINID.FieldByname('TINID').AsString;
   dblcTinidExit(self);
End;

Procedure TFCombos.dbgCabIButtonClick(Sender: TObject);
Begin
   Try
      DMLOG.wModo := 'A';
      FComboCab := TFComboCab.Create(self);
      FComboCab.ShowModal;
   Finally
      FComboCab.Free;
   End;
End;

Procedure TFCombos.dbgCabDblClick(Sender: TObject);
Begin
   If Not DMLOG.cdsConsumo.Active Then
      Exit;

   If DMLOG.cdsConsumo.RecordCount <= 0 Then
   Begin
      ShowMessage('No Existen Combos');
      Exit;
   End;

   If DMLOG.cdsConsumo.FieldByname('ACTIVO').AsString = 'S' Then
   Begin
      ShowMessage('Para Hacer Cambios en Combo Tiene que DesActivarlo.');
      Exit;
   End;

   Try
      DMLOG.wModo := 'M';
      FComboCab := TFComboCab.Create(self);
      FComboCab.ShowModal;
   Finally
      FComboCab.Free;
   End;
End;

Procedure TFCombos.dbgDetIButtonClick(Sender: TObject);
Var
   cBusca: String;
Begin
   cBusca := 'Select * from FAC306 '
      + 'Where CIAID=''' + DMLOG.cdsConsumo.FieldByName('CIAID').AsString + ''' '
      + ' and CODCOM=''' + DMLOG.cdsConsumo.FieldByName('CODCOM').AsString + '''';
   DMLOG.cdsQry12.Close;
   DMLOG.cdsQry12.DataRequest(cBusca);
   DMLOG.cdsQry12.Open;
   If DMLOG.cdsQry12.RecordCount > 0 Then
   Begin
      ShowMessage('No se puede Insertar Articulo. Código de Combo usado por Ventas. Verificar');
      Exit;
   End;

   If DMLOG.cdsConsumo.FieldByname('CODCOM').AsString = '' Then
   Begin
      ShowMessage('Debe Crear el Combo, para ingresar Articulos');
      Exit;
   End;

   If DMLOG.cdsConsumo.FieldByname('ACTIVO').AsString = 'S' Then
   Begin
      ShowMessage('Para Hacer Cambios en Combo Tiene que DesActivarlo.');
      Exit;
   End;

   Try
      DMLOG.wModo := 'A';
      FComboDet := TFComboDet.Create(self);
      FComboDet.ShowModal;
   Finally
      FComboDet.Free;
      CalculaFooter;
   End;
End;

Procedure TFCombos.BitBtn2Click(Sender: TObject);
Var
   cMsg: String;
Begin
   If Not DMLOG.cdsConsumo.Active Then
      Exit;

   If DMLOG.cdsConsumo.RecordCount <= 0 Then
   Begin
      ShowMessage('No Existen Combos');
      Exit;
   End;

   If DMLOG.cdsConsumo.FieldByname('ACTIVO').AsString = 'S' Then
      cMsg := ' Combo Activo. ¿ Seguro de Desactivar ? '
   Else
   Begin
      cMsg := ' Combo Inactivo. ¿ Seguro de Activar ? ';
      If DMLOG.cdsNegociacion.RecordCount < 2 Then
      Begin
         ShowMessage('Combo debe Tener minimo dos Articulos');
         Exit;
      End;
   End;

   If MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin

      DMLOG.cdsConsumo.Edit;
      If DMLOG.cdsConsumo.FieldByname('ACTIVO').AsString = 'S' Then
         DMLOG.cdsConsumo.FieldByname('ACTIVO').AsString := 'N'
      Else
         DMLOG.cdsConsumo.FieldByname('ACTIVO').AsString := 'S';
      DMLOG.cdsConsumo.Post;
      If DMLOG.cdsConsumo.ApplyUpdates(0) > 0 Then
      Begin
         ShowMessage('Error al Grabar');
         Exit;
      End;

      ShowMessage('ok');

   End;
End;

Procedure TFCombos.dblcLPrecioExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If length(dblcLPrecio.text) = 0 Then
      Raise exception.create('Seleccione una Lista de Precios');
   xWhere := 'TLISTAID=' + quotedstr(dblcLPrecio.Text) + ' AND CIAID=' + QuotedStr(dblcCia.Text);

   edtLPrecio.Text := DMLOG.Buscaqry('dspUltTGE', 'FAC101', 'TLISTADES', xWhere, 'TLISTADES');

End;

Procedure TFCombos.dbgDetDblClick(Sender: TObject);
Begin
   If Not DMLOG.cdsNegociacion.Active Then
      Exit;

   If DMLOG.cdsNegociacion.RecordCount <= 0 Then
   Begin
      ShowMessage('No Existe Detalle');
      Exit;
   End;

   Try
      DMLOG.wModo := 'M';
      FComboDet := TFComboDet.Create(self);
      FComboDet.ShowModal;
   Finally
      FComboDet.Free;
      CalculaFooter;
   End;
End;

Procedure TFCombos.CalculaFooter;
Var
   dPreVen, dPrePub: double;
Begin

   dPreVen := 0;
   dPrePub := 0;

   DMLOG.cdsNegociacion.DisableControls;
   DMLOG.cdsNegociacion.First;
   While Not DMLOG.cdsNegociacion.Eof Do
   Begin
      dPreVen := dPreVen + DMLOG.cdsNegociacion.FieldByName('PREVEN').AsFloat;
      dPrePub := dPrePub + DMLOG.cdsNegociacion.FieldByName('PREPUB').AsFloat;
      DMLOG.cdsNegociacion.Next;
   End;

   dbgDet.ColumnByName('ARTID').FooterValue := ' Items = ' + IntToStr(DMLOG.cdsNegociacion.RecordCount);
   dbgDet.ColumnByName('ARTDES').FooterValue := '                                                            TOTALES ---->';
   dbgDet.ColumnByName('PREVEN').FooterValue := floattostrf(dPreVen, ffNumber, 10, 2);
   dbgDet.ColumnByName('PREPUB').FooterValue := floattostrf(dPrePub, ffNumber, 10, 2);

   DMLOG.cdsConsumo.Edit;
   DMLOG.cdsConsumo.FieldByname('PREVEN').AsFloat := dPreVen;
   DMLOG.cdsConsumo.FieldByname('PREPUB').AsFloat := dPrePub;
   Try
      (DMLOG.cdsNegociacion.FieldByName('PREVEN') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsNegociacion.FieldByName('PREVEN') As TFloatField).EditFormat := '########0.00';
      (DMLOG.cdsNegociacion.FieldByName('PREPUB') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsNegociacion.FieldByName('PREPUB') As TFloatField).EditFormat := '########0.00';
   Except
   End;

   DMLOG.cdsNegociacion.First;
   DMLOG.cdsNegociacion.EnableControls;
End;

Procedure TFCombos.bbtnRegOkClick(Sender: TObject);
Begin

   xSQL := 'select 0.00 IMPORTE from TGE101 WHERE ROWNUM=1';
   DMLOG.cdsQry10.Close;
   DMLOG.cdsQry10.DataRequest(xSQL);
   DMLOG.cdsQry10.Open;

   xSQL := 'select * from FAC_COM_DET '
      + 'Where CIAID=''' + dblcCia.Text + ''' AND TINID=''' + dblcTinid.Text + ''' '
      + 'and CODCOM=''' + DMLOG.cdsConsumo.FieldByname('CODCOM').AsString + ''' '
      + 'and TLISTAID=''' + dblcLPrecio.Text + ''' ';
   DMLOG.cdsNegociacion.Close;
   DMLOG.cdsNegociacion.DataRequest(xSQL);
   DMLOG.cdsNegociacion.Open;

   CalculaFooter;
End;

Procedure TFCombos.dblcLPrecioEnter(Sender: TObject);
Begin
   DMLOG.cdsNegociacion.Close;
End;

Procedure TFCombos.dbgCabRowChanged(Sender: TObject);
Begin
   If DMLOG.cdsConsumo.RecordCount <= 0 Then Exit;

   DMLOG.cdsNegociacion.Close;
   bbtnRegOkClick(self);
End;

Procedure TFCombos.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_Dialogkey, VK_TAB, 0);
   End;
End;

Procedure TFCombos.FormActivate(Sender: TObject);
Begin
   bbtnMostrarClick(self);
   bbtnRegOkClick(Self);
End;

Procedure TFCombos.dbgDetKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Var
   cBusca, cArt, xSQL: String;
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin

      If Not DMLOG.cdsNegociacion.Active Then
         Exit;

      If DMLOG.cdsNegociacion.RecordCount <= 0 Then
      Begin
         ShowMessage('No Existe Detalle');
         Exit;
      End;

      cBusca := 'Select * from FAC306 '
         + 'Where CIAID=''' + DMLOG.cdsConsumo.FieldByName('CIAID').AsString + ''' '
         + ' and CODCOM=''' + DMLOG.cdsConsumo.FieldByName('CODCOM').AsString + '''';
      DMLOG.cdsQry12.Close;
      DMLOG.cdsQry12.DataRequest(cBusca);
      DMLOG.cdsQry12.Open;
      If DMLOG.cdsQry12.RecordCount > 0 Then
      Begin
         ShowMessage('No se puede Eliminar Articulo. Código de Combo usado por Ventas. Verificar...');
         Exit;
      End;

      If DMLOG.cdsConsumo.FieldByname('ACTIVO').AsString = 'S' Then
      Begin
         ShowMessage('Para Hacer Cambios en Combo Tiene que DesActivarlo.');
         Exit;
      End;

      If MessageDlg('Eliminar Artículo' + chr(13) + chr(13) +
         ' ¿ Esta Seguro ? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Exit;

      cArt := DMLOG.cdsNegociacion.FieldByname('ARTID').AsString;

      DMLOG.cdsNegociacion.Delete;
      If DMLOG.cdsNegociacion.ApplyUpdates(0) > 0 Then
      Begin
         ShowMessage('Error al Eliminar');
         Exit;
      End;
      xSQL := 'Delete from FAC_COM_DET '
         + 'Where CIAID=''' + DMLOG.cdsConsumo.FieldByname('CIAID').AsString + ''' '
         + 'and TINID=''' + DMLOG.cdsConsumo.FieldByname('TINID').AsString + ''' '
         + 'and CODCOM=''' + DMLOG.cdsConsumo.FieldByname('CODCOM').AsString + ''' '
         + 'and ARTID=''' + cArt + ''' ';
      DMLOG.cdsQry12.Close;
      DMLOG.cdsQry12.DataRequest(xSQL);
      DMLOG.cdsQry12.Execute;

      ShowMessage('Eliminado');
   End;
End;

Procedure TFCombos.BitBtn1Click(Sender: TObject);
Var
   dPorcentaje, dIGV, dImpIGV, dDif, dImpPub: Double;
Begin

   If DMLOG.cdsConsumo.FieldByname('ACTIVO').AsString = 'S' Then
   Begin
      ShowMessage('Para Hacer Cambios en Combo Tiene que DesActivarlo.');
      Exit;
   End;

   If MessageDlg(' ¿ Esta seguro(a) de Recalcular Precio ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      DMLOG.BuscaQry('dspUltTGE', 'TGE108', '*', 'TASAFLG=''I'' ', 'TASAID');
      dIGV := DMLOG.cdsQry.FieldByName('TASACAN').AsFloat;

      dPorcentaje := FRound(DMLOG.cdsQry10.FieldByName('IMPORTE').AsFloat / DMLOG.cdsConsumo.FieldByName('PREPUB').AsFloat, 10, 5);

      DMLOG.cdsNegociacion.First;
      While Not DMLOG.cdsNegociacion.Eof Do
      Begin
         DMLOG.cdsNegociacion.Edit;
         DMLOG.cdsNegociacion.FieldByName('PREVEN').AsFloat := FRound(dPorcentaje * DMLOG.cdsNegociacion.FieldByName('PREVEN').AsFloat, 15, 2);
         dImpIGV := FRound(DMLOG.cdsNegociacion.FieldByName('PREVEN').AsFloat * dIGV / 100, 15, 2);
         DMLOG.cdsNegociacion.FieldByName('PREPUB').AsFloat := DMLOG.cdsNegociacion.FieldByName('PREVEN').AsFloat + dImpIGV;
         DMLOG.cdsNegociacion.Next;
      End;
      CalculaFooter;

      If FRound(DMLOG.cdsQry10.FieldByName('IMPORTE').AsFloat, 15, 2) <> FRound(DMLOG.cdsConsumo.FieldByName('PREPUB').AsFloat, 15, 2) Then
      Begin
         dDif := FRound(DMLOG.cdsQry10.FieldByName('IMPORTE').AsFloat - DMLOG.cdsConsumo.FieldByName('PREPUB').AsFloat, 15, 2);

         dImpPub := DMLOG.cdsNegociacion.FieldByName('PREPUB').AsFloat + dDif;

         DMLOG.cdsNegociacion.First;
         DMLOG.cdsNegociacion.Edit;
         DMLOG.cdsNegociacion.FieldByName('PREVEN').AsFloat := FRound(dImpPub / (1 + (dIGV / 100)), 15, 2);
         dImpIGV := FRound(DMLOG.cdsNegociacion.FieldByName('PREVEN').AsFloat * dIGV / 100, 15, 2);
         DMLOG.cdsNegociacion.FieldByName('PREPUB').AsFloat := DMLOG.cdsNegociacion.FieldByName('PREVEN').AsFloat + dImpIGV;
         DMLOG.cdsNegociacion.Post;
         CalculaFooter;
      End;

      DMLOG.cdsNegociacion.ApplyUpdates(-1);

      ShowMessage('Recalculo de Precio OK');
   End;
End;

End.


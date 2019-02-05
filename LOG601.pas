Unit LOG601;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, Wwdbigrd, Wwdbgrid, MsgDlgs;

Type
   TFDepODC = Class(TForm)
      bbtnAceObsAnu: TBitBtn;
      bbtnCerObsAnu: TBitBtn;
      memObsDep: TMemo;
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnAceObsAnuClick(Sender: TObject);
      Procedure bbtnCerObsAnuClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure memObsDepKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
    { Private declarations }
      grid: TwwDBGrid;
   Public
    { Public declarations }
   End;

Var
   FDepODC: TFDepODC;
   xSQL: String;

Implementation

Uses LOGDM1, oaAD3100;

{$R *.DFM}

Procedure TFDepODC.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFDepODC.bbtnCerObsAnuClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFDepODC.bbtnAceObsAnuClick(Sender: TObject);
Var
   sCIAID, sODCID, sSQL: String;
   i: Integer;
Begin
   If Length(Trim(memObsDep.Text)) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', 'Tiene que Ingresar una Observación para Poder Continuar');
      Exit;
   End;

   DMLOG.DCOM1.AppServer.IniciaTransaccion;
   If Question('Adquisiciones', ' Depura la Orden de Compra ' + #13 + #13 +
      'Confirme para Continuar con la Depuración ' + #13 + #13) Then
   Begin
      DMLOG.cdsOrdComp.Edit;
      DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString := 'DEPURADO';
      DMLOG.cdsOrdComp.FieldByName('ODCDEPURA').AsString := DMLOG.wUsuario;
      DMLOG.cdsOrdComp.FieldByName('ODCOBSDEP').AsString := Trim(copy(memObsDep.Text, 1, 100));
      DMLOG.cdsOrdComp.Post;
   // Cabecera
      xSQL := 'Update LOG304 '
         + '      Set ODCEST = ' + quotedstr('DEPURADO') + ','
         + '          ODCDEPURA = ' + quotedstr(DMLOG.wUsuario) + ','
         + '          ODCFATE = Sysdate,'
         + '          ODCOBSDEP = ' + quotedstr(Trim(copy(memObsDep.Text, 1, 100)))
         + '    where CIAID=' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
         + '      and ODCID=' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Error al intentar cambiar Estado de la Cabecera a DEPURADO a la O/C');
         exit;
      End;
   // Detalle
      xSQL := 'Update LOG305 '
         + '      Set ODCEST = ' + quotedstr('DEPURADO')
         + '    where CIAID=' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
         + '      and ODCID=' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString)
         + '      and (DODCCSLD > 0 OR DODCCSLDU > 0)';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Error al intentar cambiar Estado del Detalle a DEPURADO a la O/C');
         exit;
      End;
   End;
   DMLOG.DCOM1.AppServer.GrabaTransaccion;
   Close;
End;

Procedure TFDepODC.FormActivate(Sender: TObject);
Begin
   memObsDep.SetFocus;
End;

Procedure TFDepODC.memObsDepKeyPress(Sender: TObject; Var Key: Char);
Var
   sC: String;
Begin
   sC := Key;
   sC := Uppercase(sC);
   Key := sC[1];
End;

Procedure TFDepODC.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Action := CAFree;
End;

End.


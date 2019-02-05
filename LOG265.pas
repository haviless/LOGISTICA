Unit LOG265;

// Actualizaciones
// HPC_201405_LOG          : 14/10/2014 Se lleva Lista de Precios de Adquisiciones Ventas a Adquisiciones SSGG
//                           14/10/2014 Reordenamiento de Sangría

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, wwdblook, wwcheckbox, Mask, wwdbedit, db,
   ExtCtrls, msgdlgs;

Type
   TFComboCab = Class(TForm)
      dbeCodCom: TwwDBEdit;
      dbeDesCom: TwwDBEdit;
      Label1: TLabel;
      Label2: TLabel;
      Label5: TLabel;
      dblcTMon: TwwDBLookupCombo;
      edtTMon: TEdit;
      bbtnRegOk: TBitBtn;
      bbtnRegCanc: TBitBtn;
      Panel1: TPanel;
      cbActivo: TwwCheckBox;
      Procedure FormActivate(Sender: TObject);
      Procedure bbtnRegOkClick(Sender: TObject);
      Procedure dblcTMonExit(Sender: TObject);
      Procedure dblcTMonNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure FormCreate(Sender: TObject);
      Procedure dbePreVenExit(Sender: TObject);
      Procedure dbePrePubExit(Sender: TObject);
      Procedure bbtnRegCancClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbeCodComExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
   Private
    { Private declarations }
      dIGV: Double;
      cCodGra: String;
      Function CodigoCombo: String;
   Public
    { Public declarations }
   End;

Var
   FComboCab: TFComboCab;

Implementation

{$R *.dfm}

Uses LOGDM1, LOG264; // MsgDlgs,

Procedure TFComboCab.FormActivate(Sender: TObject);
Var
   xSQL, cCodCom: String;
Begin
   If DMLOG.wModo = 'A' Then
   Begin
      cCodCom := CodigoCombo;

      cCodGra := '';
      dbeCodCom.Enabled := True;
      If DMLOG.cdsConsumo.FieldByname('CIAID').AsString <> '' Then
         DMLOG.cdsConsumo.Append
      Else
         DMLOG.cdsConsumo.Edit;
      DMLOG.cdsConsumo.FieldByname('CIAID').AsString := FCombos.dblcCia.Text;
      DMLOG.cdsConsumo.FieldByname('TINID').AsString := FCombos.dblcTinid.Text;
      DMLOG.cdsConsumo.FieldByname('CODCOM').AsString := cCodCom;
      DMLOG.cdsConsumo.FieldByname('ACTIVO').AsString := 'N';
      DMLOG.cdsConsumo.FieldByname('TMONID').AsString := DMLOG.wTMonLoc;
      dblcTMonExit(Self);
      dbeDesCom.SetFocus;
   End
   Else
   Begin
      cCodGra := DMLOG.cdsConsumo.FieldByname('CODCOM').AsString;
      dbeCodCom.Enabled := False;
      DMLOG.cdsConsumo.Edit;

      xSQL := 'select * from FAC_COM_DET '
         + 'Where CIAID=''' + DMLOG.cdsConsumo.FieldByname('CIAID').AsString + ''' '
         + 'AND TINID=''' + DMLOG.cdsConsumo.FieldByname('TINID').AsString + ''' '
         + 'and CODCOM=''' + DMLOG.cdsConsumo.FieldByname('CODCOM').AsString + ''' ';

      DMLOG.cdsQry11.Close;
      DMLOG.cdsQry11.DataRequest(xSQL);
      DMLOG.cdsQry11.Open;

      dblcTMonExit(Self);

      dblcTMon.Enabled := True;
      If DMLOG.cdsQry11.RecordCount > 0 Then
         dblcTMon.Enabled := False;
   End;
End;

Function TFComboCab.CodigoCombo: String;
Var
   xSQL: String;
Begin
   xSQL := 'Select nvl(MAX(CODCOM),''0'') CODMAX FROM FAC_COM_CAB '
      + 'Where CIAID=''' + DMLOG.cdsConsumo.FieldByname('CIAID').AsString + ''' '
      + 'AND TINID=''' + DMLOG.cdsConsumo.FieldByname('TINID').AsString + ''' ';
   DMLOG.cdsQry11.Close;
   DMLOG.cdsQry11.DataRequest(xSQL);
   DMLOG.cdsQry11.Open;

   Result := DMLOG.StrZero(IntToStr(DMLOG.cdsQry11.FieldByName('CODMAX').AsInteger + 1), 8);
End;

Procedure TFComboCab.bbtnRegOkClick(Sender: TObject);
Var
   cCombo: String;
   fGrab: Boolean;
   i: Integer;
Begin
   If dbeDesCom.Text = '' Then
   Begin
      ShowMessage('Debe Ingresar Descripción de Combo');
      Exit;
   End;

   If dbeCodCom.Text = '' Then
   Begin
      ShowMessage('Debe Ingresar el Tipo de Moneda');
      Exit;
   End;

   If dblcTMon.Text = '' Then
   Begin
      ShowMessage('Debe Ingresar el Tipo de Moneda');
      Exit;
   End;

   // VHNDEMA 20060105
   i := 0;
   fGrab := False;
   While Not fGrab Do
   Begin
      If i = 10 Then
      Begin
         ShowMessage('No se puedo Grabar Combo');
         Exit;
      End;
      i := i + 1;

      DMLOG.cdsConsumo.Edit;
      DMLOG.cdsConsumo.FieldByname('USUCOM').AsString := DMLOG.wUsuario;
      DMLOG.cdsConsumo.FieldByname('FECREG').AsDateTime := Date + Time;
      DMLOG.cdsConsumo.Post;

     //DMLOG.AplicaDatos( DMLOG.cdsConsumo, 'LPRECIO' );

      If DMLOG.cdsConsumo.ApplyUpdates(0) > 0 Then
      Begin
         fGrab := False;

         If cCodGra = '' Then
         Begin
            cCombo := CodigoCombo;
            ShowMessage('Código de Combo ' + DMLOG.cdsConsumo.FieldByname('CODCOM').AsString + ' Existe. Se cambiara el Código a ' + cCombo);
            DMLOG.cdsConsumo.Edit;
            DMLOG.cdsConsumo.FieldByname('CODCOM').AsString := cCombo;
         End;
      End
      Else
      Begin
         cCodGra := DMLOG.cdsConsumo.FieldByname('CODCOM').AsString;
         fGrab := True;
      End;
   End;
   ShowMessage('ok');
   Close;
End;

Procedure TFComboCab.dblcTMonExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'TMONID=' + quotedstr(dblcTMon.Text)
      + ' AND (TMON_LOC=' + '''' + 'L' + '''' + ' OR TMON_LOC=' + '''' + 'E' + '''' + ')';
   edtTMon.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
End;

Procedure TFComboCab.dblcTMonNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFComboCab.FormCreate(Sender: TObject);
Var
   xSQL: String;
Begin
   DMLOG.BuscaQry('dspUltTGE', 'TGE108', '*', 'TASAFLG=''I'' ', 'TASAID');
   dIGV := DMLOG.cdsQry.FieldByName('TASACAN').AsFloat;

   xSQL := 'select 0.00 IGVIMP, ' + DMLOG.cdsQry.FieldByName('TASACAN').AsString + ' IGVPOR from TGE101 WHERE ROWNUM=1';
   DMLOG.cdsQry12.Close;
   DMLOG.cdsQry12.DataRequest(xSQL);
   DMLOG.cdsQry12.Open;
End;

Procedure TFComboCab.dbePreVenExit(Sender: TObject);
Begin
   DMLOG.cdsQry12.Edit;
   DMLOG.cdsConsumo.Edit;
   DMLOG.cdsQry12.FieldByname('IGVIMP').AsFloat := FRound(DMLOG.cdsConsumo.FieldByname('PREVEN').AsFloat * (dIGV / 100), 15, 2);
   DMLOG.cdsConsumo.FieldByname('PREPUB').AsFloat := FRound(DMLOG.cdsConsumo.FieldByname('PREVEN').AsFloat + DMLOG.cdsQry12.FieldByname('IGVIMP').AsFloat, 15, 2);
   DMLOG.cdsConsumo.Post;
End;

Procedure TFComboCab.dbePrePubExit(Sender: TObject);
Begin
   DMLOG.cdsQry12.Edit;
   DMLOG.cdsConsumo.Edit;
   DMLOG.cdsConsumo.FieldByname('PREVEN').AsFloat := FRound(DMLOG.cdsConsumo.FieldByname('PREPUB').AsFloat / (1 + (dIGV / 100)), 15, 2);
   DMLOG.cdsQry12.FieldByname('IGVIMP').AsFloat := FRound(DMLOG.cdsConsumo.FieldByname('PREVEN').AsFloat * (dIGV / 100), 15, 2);
   DMLOG.cdsConsumo.FieldByname('PREPUB').AsFloat := FRound(DMLOG.cdsConsumo.FieldByname('PREVEN').AsFloat + DMLOG.cdsQry12.FieldByname('IGVIMP').AsFloat, 15, 2);
   DMLOG.cdsConsumo.Post;
End;

Procedure TFComboCab.bbtnRegCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFComboCab.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMLOG.cdsConsumo.CancelUpdates;
End;

Procedure TFComboCab.dbeCodComExit(Sender: TObject);
Begin
   If DMLOG.wModo = 'A' Then
      DMLOG.cdsConsumo.FieldByName('CODCOM').AsString := DMLOG.StrZero(DMLOG.cdsConsumo.FieldByName('CODCOM').AsString, 8);
End;

Procedure TFComboCab.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_Dialogkey, VK_TAB, 0);
   End;
End;

End.


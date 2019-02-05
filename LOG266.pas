Unit LOG266;

// Actualizaciones
// HPC_201405_LOG          : 14/10/2014 Se lleva Lista de Precios de Adquisiciones Ventas a Adquisiciones SSGG
//                           14/10/2014 Reordenamiento de Sangría

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DBCtrls, ExtCtrls, StdCtrls, Mask, wwdbedit, wwdblook, Wwdbdlg,
   Buttons, db, msgdlgs;

Type
   TFComboDet = Class(TForm)
      Panel1: TPanel;
      Label2: TLabel;
      dblcdArticulo: TwwDBLookupComboDlg;
      dbeArt: TwwDBEdit;
      pnlDato: TPanel;
      Label48: TLabel;
      Label49: TLabel;
      Label50: TLabel;
      Label54: TLabel;
      Label55: TLabel;
      Label56: TLabel;
      Label68: TLabel;
      Label62: TLabel;
      dbeUtilidad: TwwDBEdit;
      dbePV: TwwDBEdit;
      dbePorUti: TwwDBEdit;
      dbeIGVPV: TwwDBEdit;
      dbePVIGV: TwwDBEdit;
      dbeIGV: TwwDBEdit;
      lblTM: TLabel;
      Panel3: TPanel;
      GroupBox1: TGroupBox;
      dbeTCD: TwwDBEdit;
      GroupBox2: TGroupBox;
      dbeStock: TwwDBEdit;
      bbtnRegOk: TBitBtn;
      bbtnRegCanc: TBitBtn;
      Panel4: TPanel;
      Label3: TLabel;
      dbeCF: TwwDBEdit;
      lblObsequio: TLabel;
      Procedure dblcdArticuloExit(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure bbtnRegOkClick(Sender: TObject);
      Procedure dbePVExit(Sender: TObject);
      Procedure dbePVIGVExit(Sender: TObject);
      Procedure dbeUtilidadExit(Sender: TObject);
      Procedure dbePorUtiExit(Sender: TObject);
      Procedure bbtnRegCancClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
    { Private declarations }
      Procedure CostoDeArticulo;
      Procedure CalculaMontosDetalle(cOrigen: String);
      Procedure FormatoImportes(cTipo: String);
   Public
    { Public declarations }
      dIGV: dOUBLE;
   End;

Var
   FComboDet: TFComboDet;

Implementation

{$R *.dfm}

Uses LOGDM1, LOG264; // MsgDlgs,

Procedure TFComboDet.CostoDeArticulo;
Var
   xSQL, cFecha, cAno: String;
Begin

   DMLOG.BuscaQry('dspUltTGE', 'TGE108', '*', 'TASAFLG=''I'' ', 'TASAID');
   dIGV := DMLOG.cdsQry.FieldByName('TASACAN').AsFloat;

   cFecha := DateToStr(Date);
   cAno := Copy(cFecha, 7, 4);
   xSQL := 'Select nvl(TCAMVBV,1) TCD, ' + FloatToStr(dIGV) + ' IGV from TGE107 WHERE FECHA(+)<=''' + cFecha + ''' ORDER BY FECHA DESC';
   DMLOG.cdsQry6.Close;
   DMLOG.cdsQry6.DataRequest(xSQL);
   DMLOG.cdsQry6.Open;

   xSQL := 'Select B.NISSIT, B.NISAFREG, A.CIAID, A.TINID, A.ALMID, A.TDAID, A.NISAID, A.NISATIP, '
      + 'KDXCNTG, A.ARTPCG PFS, ARTTOTALG, COSARTFAC, IMPNOTCRE,  C.ARTCPROG CPS, ROUND(C.ARTCPROG/D.TCAMVBV,2) CPD, '
      + 'ROUND(COSARTFAC/KDXCNTG,2) COS, ROUND(IMPNOTCRE/KDXCNTG,2) NCS, '
      + 'ROUND((IMPNOTCRE/CASE WHEN COSARTFAC=0 THEN 1 ELSE COSARTFAC END)*100,2) PNCS, '
      + 'ROUND((COSARTFAC/KDXCNTG)/D.TCAMVBV,2) COD, ROUND((IMPNOTCRE/KDXCNTG)/D.TCAMVBV,2) NCD, '
      + 'ROUND((IMPNOTCRE/CASE WHEN COSARTFAC=0 THEN 1 ELSE COSARTFAC END)*100,2) PNCD, '
      + 'ROUND(A.ARTPCG/D.TCAMVBC,2) PFD, D.TCAMVBC TC, '
      + '0.00 UTILIDAD, 0.0000 PORUTI, 0.00 DESCUENTO, 0.00 PORDES, '
      + '0.00 IGVPV, 0.00 PVIGV, 0.00 IGVPR, 0.00 PPIGV, '
      + '0.00 UTID, 0.00 DESD, 0.00 PVD, 0.00 PPD, 0.00 IGVPVD, 0.00 IGVPRD, 0.00 PVIGVD, 0.00 PPIGVD, '
      + 'S.ALMID, S.STKSACTG, C.OBSEQUIO '
      + 'From LOG315 A, LOG314 B, TGE205 C, TGE107 D, LOG316 S '
      + 'Where A.CIAID=''' + DMLOG.cdsConsumo.FieldByname('CIAID').AsString + ''' '
      + 'AND A.TINID=''' + DMLOG.cdsConsumo.FieldByname('TINID').AsString + ''' '
      + 'AND A.ARTID=''' + dblcdArticulo.Text + ''' '
      + 'AND A.NISATIP=''INGRESO'' '
      + 'and A.NISAFREG>=''01/01/2005'' '
      + 'and A.CIAID=B.CIAID and A.TINID=B.TINID and A.TDAID=B.TDAID and A.ALMID=B.ALMID '
      + 'and A.NISATIP=B.NISATIP and A.NISAID=B.NISAID and B.NISSIT=''ACEPTADO'' '
      + 'and A.CIAID=C.CIAID(+) and A.TINID=C.TINID(+) and A.GRARID=C.GRARID(+) and A.ARTID=C.ARTID(+) '
      + 'and B.NISAFREG=D.FECHA(+) '
      + 'and A.CIAID=S.CIAID(+) and A.TINID=S.TINID(+) and A.ARTID=S.ARTID(+) '
      + 'and S.STKANO(+)=''' + cAno + ''' and STKSACTG(+)>0 '
      + 'ORDER BY B.NISAFREG DESC';
   DMLOG.cdsQry7.Close;
   DMLOG.cdsQry7.DataRequest(xSQL);
   DMLOG.cdsQry7.Open;

   dbeStock.DataField := 'STKSACTG';
   dbeStock.DataSource := DMLOG.dsQry7;

   If DMLOG.cdsConsumo.FieldByName('TMONID').AsString = DMLOG.wTMonLoc Then
      dbeCF.DataField := 'PFS'
   Else
      dbeCF.DataField := 'PFD';
   dbeCF.DataSource := DMLOG.dsQry7;

   dbeUtilidad.DataField := 'UTILIDAD';
   dbeUtilidad.DataSource := DMLOG.dsQry7;
   dbePorUti.DataField := 'PORUTI';
   dbePorUti.DataSource := DMLOG.dsQry7;

   dbeIGVPV.DataField := 'IGVPV';
   dbeIGVPV.DataSource := DMLOG.dsQry7;
   dbeIGV.DataField := 'IGV';
   dbeIGV.DataSource := DMLOG.dsQry6;

   dbeTCD.DataField := 'TCD';
   dbeTCD.DataSource := DMLOG.dsQry6;

   If DMLOG.cdsQry7.FieldByName('OBSEQUIO').AsString = 'S' Then
   Begin
      pnlDato.Enabled := False;
      lblObsequio.Visible := True;
   End
   Else
   Begin
      lblObsequio.Visible := False;
      pnlDato.Enabled := True;
      dbeUtilidad.SetFocus;
   End;

   FormatoImportes('S');
End;

Procedure TFComboDet.FormatoImportes(cTipo: String);
Begin

   If Not DMLOG.cdsQry7.Active Then Exit;

   If cTipo = 'S' Then
   Begin
      (DMLOG.cdsQry7.FieldByName('COS') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('NCS') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PNCS') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PFS') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('COD') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('NCD') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PNCD') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PFD') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('CPS') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('CPD') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('TC') As TFloatField).DisplayFormat := '###,###,##0.000';

      (DMLOG.cdsQry7.FieldByName('UTILIDAD') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('UTILIDAD') As TFloatField).EditFormat := '########0.00';
      (DMLOG.cdsQry7.FieldByName('PORUTI') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PORUTI') As TFloatField).EditFormat := '########0.00';
      (DMLOG.cdsNegociacion.FieldByName('PREVEN') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsNegociacion.FieldByName('PREVEN') As TFloatField).EditFormat := '########0.00';
      (DMLOG.cdsNegociacion.FieldByName('PREPUB') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsNegociacion.FieldByName('PREPUB') As TFloatField).EditFormat := '########0.00';
      (DMLOG.cdsQry7.FieldByName('IGVPV') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PVIGV') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PVIGV') As TFloatField).EditFormat := '########0.00';
   End
   Else
   Begin
      (DMLOG.cdsQry7.FieldByName('COS') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('NCS') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PNCS') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PFS') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('COD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('NCD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PNCD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PFD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('CPS') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('CPD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('TC') As TFloatField).DisplayFormat := '';

      (DMLOG.cdsQry7.FieldByName('UTID') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PVD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('IGVPVD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PVIGVD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('DESD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PPD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('IGVPRD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PPIGVD') As TFloatField).DisplayFormat := '';
   End;
End;

Procedure TFComboDet.dblcdArticuloExit(Sender: TObject);
Var
   xSQL, cArt: String;
Begin
   If bbtnRegCanc.Focused Then Exit;
   If Not dblcdArticulo.Enabled Then
   Begin
      CostoDeArticulo;
      Exit;
   End;

   xSQL := 'CIAID=' + QuotedStr(DMLOG.cdsConsumo.FieldByname('CIAID').AsString) + ' AND '
      + 'TINID =' + QuotedStr(DMLOG.cdsConsumo.FieldByname('TINID').AsString) + ' and '
      + 'ARTID=' + QuotedStr(dblcdArticulo.Text);
   DMLOG.cdsNegociacion.FieldByname('ARTDES').AsString := DMLOG.BuscaQry('dspUltTGE', 'TGE205', 'ARTDES', xSQL, 'ARTDES');

   If dbeArt.Text = '' Then
   Begin
      ShowMessage('Debe ingresar Código de Articulo.');
      dblcdArticulo.SetFocus;
      Exit;
   End;

   xSQL := 'CIAID=''' + DMLOG.cdsConsumo.FieldByname('CIAID').AsString + ''' '
      + 'AND TINID=''' + DMLOG.cdsConsumo.FieldByname('TINID').AsString + ''' '
      + 'and CODCOM=''' + DMLOG.cdsConsumo.FieldByname('CODCOM').AsString + ''' '
      + 'and TLISTAID=''' + DMLOG.cdsNegociacion.FieldByname('TLISTAID').AsString + ''' '
      + 'and ARTID=''' + dblcdArticulo.Text + '''';
   cArt := DMLOG.BuscaQry('dspUltTGE', 'FAC_COM_DET', 'ARTID', xSQL, 'ARTID');
   If cArt <> '' Then
   Begin
      ShowMessage('Articulo ya fue registrado en Combo. Verificar...');
      dblcdArticulo.SetFocus;
      Exit;
   End;

   CostoDeArticulo;

   If DMLOG.cdsNegociacion.FieldByname('PREVEN').AsFloat = 0 Then
   Begin
      xSQL := 'Select ARTID, LPRETMONID, LPREPREGMO from FAC201 '
         + 'where CIAID=' + quotedstr(DMLOG.cdsConsumo.FieldByname('CIAID').AsString)
         + ' and TLISTAID=' + quotedStr(DMLOG.cdsNegociacion.FieldByname('TLISTAID').AsString)
         + ' and ARTID=' + quotedstr(dblcdArticulo.Text);
      DMLOG.cdsLPrecio.Close;
      DMLOG.cdsLPrecio.IndexFieldNames := '';
      DMLOG.cdsLPrecio.Filter := '';
      DMLOG.cdsLPrecio.Filtered := False;
      DMLOG.cdsLPrecio.DataRequest(xSQL);
      DMLOG.cdsLPrecio.Open;

      If DMLOG.cdsLPrecio.Recordcount = 1 Then
      Begin
         If DMLOG.cdsLPrecio.FieldByname('LPRETMONID').AsString = DMLOG.cdsConsumo.FieldByname('TMONID').AsString Then
            DMLOG.cdsNegociacion.FieldByname('PREVEN').AsFloat := DMLOG.cdsLPrecio.FieldByname('LPREPREGMO').AsFloat
         Else
         Begin
            If DMLOG.cdsConsumo.FieldByname('TMONID').AsString = DMLOG.wTMonLoc Then
               DMLOG.cdsNegociacion.FieldByname('PREVEN').AsFloat := Fround(DMLOG.cdsLPrecio.FieldByname('LPREPREGMO').AsFloat * DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2)
            Else
               DMLOG.cdsNegociacion.FieldByname('PREVEN').AsFloat := Fround(DMLOG.cdsLPrecio.FieldByname('LPREPREGMO').AsFloat / DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         End;
         CalculaMontosDetalle('PV');
      End;
   End;
End;

Procedure TFComboDet.FormActivate(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'TMONID=''' + DMLOG.cdsConsumo.FieldByname('TMONID').AsString + '''';
   lblTM.Caption := DMLOG.BuscaQry('dspUltTGE', 'TGE103', 'TMONDES', xSQL, 'TMONDES');

   pnlDato.Enabled := True;
   bbtnRegOk.Enabled := True;
   lblObsequio.Visible := False;

   If DMLOG.wModo = 'A' Then
   Begin
      xSQL := 'SELECT A.ARTID, A.ARTDES, A.ARTCONT, A.GRARID, A.FAMID, A.SFAMID, A.UNMIDG, A.ARTCNTG '
         + 'FROM TGE205 A '
         + 'Where A.CIAID=''' + DMLOG.cdsConsumo.FieldByname('CIAID').AsString + ''' '
         + 'AND A.TINID=''' + DMLOG.cdsConsumo.FieldByname('TINID').AsString + ''' ';

      DMLOG.cdsArti.IndexFieldNames := '';
      DMLOG.cdsArti.close;
      DMLOG.cdsArti.DataRequest(xSQL);
      DMLOG.cdsArti.IndexFieldNames := 'ARTID';
      DMLOG.cdsArti.open;

      dblcdArticulo.Selected.Clear;
      dblcdArticulo.Selected.Add('ARTID'#9'9'#9'Código');
      dblcdArticulo.Selected.Add('ARTDES'#9'40'#9'Artículo');
      dblcdArticulo.Selected.Add('UNMIDG'#9'4'#9'U.M');
      dblcdArticulo.Selected.Add('GRARID'#9'5'#9'Línea');
      dblcdArticulo.Selected.Add('FAMID'#9'4'#9'Fam.');
      dblcdArticulo.Selected.Add('SFAMID'#9'4'#9'S.Fam.');
      dblcdArticulo.Selected.Add('ARTCNTG'#9'4'#9'Stock');

      dblcdArticulo.Enabled := True;
      DMLOG.cdsNegociacion.Append;
      DMLOG.cdsNegociacion.FieldByname('CIAID').AsString := FCombos.dblcCia.Text;
      DMLOG.cdsNegociacion.FieldByname('TINID').AsString := FCombos.dblcTinid.Text;
      DMLOG.cdsNegociacion.FieldByname('TLISTAID').AsString := FCombos.dblcLPrecio.Text;
      DMLOG.cdsNegociacion.FieldByname('CODCOM').AsString := DMLOG.cdsConsumo.FieldByname('CODCOM').AsString;
      DMLOG.cdsNegociacion.FieldByname('TMONID').AsString := DMLOG.cdsConsumo.FieldByname('TMONID').AsString;
   End
   Else
   Begin
      dblcdArticulo.Enabled := False;
      CalculaMontosDetalle('PV');
      DMLOG.cdsNegociacion.Edit;
      DMLOG.cdsNegociacion.FieldByname('TMONID').AsString := DMLOG.cdsConsumo.FieldByname('TMONID').AsString;
      If DMLOG.cdsConsumo.FieldByname('ACTIVO').AsString = 'S' Then
      Begin
         pnlDato.Enabled := False;
         bbtnRegOk.Enabled := False;
         ShowMessage('Para Hacer Cambios en Combo Tiene que DesActivarlo.');
         Exit;
      End;
   End;

End;

Procedure TFComboDet.bbtnRegOkClick(Sender: TObject);
Begin

   If DMLOG.cdsqry7.FieldByName('OBSEQUIO').Asstring = '' Then
   Begin
      If DMLOG.cdsNegociacion.FieldByName('PREVEN').AsFloat <= 0 Then
      Begin
         ShowMessage('Precio de Venta debe ser mayor a Cero');
         Exit;
      End;
   End;

   If dbeCF.Text <> '' Then
   Begin
      If StrToFloat(StringReplace(dbePV.Text, ',', '', [rfreplaceall])) < StrToFloat(StringReplace(dbeCF.Text, ',', '', [rfreplaceall])) Then
      Begin
         If MessageDlg('El Precio de Venta es Menor al Precio de Costo' + chr(13) + chr(13) +
            '         ¿ Desea Continuar ?   ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
            Exit;
      End;
   End;

   If DMLOG.cdsNegociacion.ApplyUpdates(0) > 0 Then
   Begin
      ShowMessage('Error al Grabar');
      Exit;
   End;

   If DMLOG.wModo = 'A' Then
   Begin
      xSQL := 'INSERT INTO FAC_COM_DET '
         + 'select A.CIAID, A.TINID, A.CODCOM, B.TLISTAID, A.ARTID, A.ARTDES, A.TMONID, '
         + 'A.PREVEN, A.PREPUB, A.USUCOM, A.FECREG '
         + 'from FAC_COM_DET A, FAC101 B '
         + 'Where A.CIAID=''' + DMLOG.cdsConsumo.FieldByname('CIAID').AsString + ''' '
         + 'and A.TINID=''' + DMLOG.cdsConsumo.FieldByname('TINID').AsString + ''' '
         + 'and A.CODCOM=''' + DMLOG.cdsConsumo.FieldByname('CODCOM').AsString + ''' '
         + 'and A.TLISTAID=''' + DMLOG.cdsNegociacion.FieldByName('TLISTAID').AsString + ''' '
         + 'and A.ARTID=''' + DMLOG.cdsNegociacion.FieldByName('ARTID').AsString + ''' '
         + 'and A.CIAID=B.CIAID AND TLISTAFLAG=''S'' '
         + 'and B.TLISTAID<>''' + DMLOG.cdsNegociacion.FieldByName('TLISTAID').AsString + '''';
      DMLOG.cdsQry12.Close;
      DMLOG.cdsQry12.DataRequest(xSQL);
      DMLOG.cdsQry12.Execute;
   End;

   ShowMessage('ok');
   Close;
End;

Procedure TFComboDet.dbePVExit(Sender: TObject);
Begin
   CalculaMontosDetalle('PV');
End;

Procedure TFComboDet.dbePVIGVExit(Sender: TObject);
Begin
   CalculaMontosDetalle('PVI');
End;

Procedure TFComboDet.dbeUtilidadExit(Sender: TObject);
Begin
   CalculaMontosDetalle('UTI');
End;

Procedure TFComboDet.dbePorUtiExit(Sender: TObject);
Begin
   CalculaMontosDetalle('PUT');
End;

Procedure TFComboDet.CalculaMontosDetalle(cOrigen: String);
Var
   dCosto: Double;
Begin
   DMLOG.cdsQry7.Edit;
   DMLOG.cdsNegociacion.Edit;

   If DMLOG.cdsConsumo.FieldByName('TMONID').AsString = DMLOG.wTMonLoc Then
      dCosto := DMLOG.cdsQry7.FieldByName('PFS').AsFloat
   Else
      dCosto := DMLOG.cdsQry7.FieldByName('PFD').AsFloat;

   If (cOrigen = 'PVI') Then
      DMLOG.cdsNegociacion.FieldByName('PREVEN').AsFloat := FRound(DMLOG.cdsNegociacion.FieldByName('PREPUB').AsFloat / (1 + (dIGV / 100)), 15, 2);

   If dCosto = 0 Then
      dCosto := DMLOG.cdsNegociacion.FieldByName('PREVEN').AsFloat;

   If (cOrigen = 'PUT') Then
      DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('PORUTI').AsFloat * dCosto) / 100, 15, 2);

   If (cOrigen = 'PV') Or (cOrigen = 'PVI') Then
   Begin
      DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat := DMLOG.cdsNegociacion.FieldByName('PREVEN').AsFloat - dCosto;
      If dCosto > 0 Then
         DMLOG.cdsQry7.FieldByName('PORUTI').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat / dCosto) * 100, 15, 2);
   End
   Else
   Begin
      If dCosto > 0 Then
         DMLOG.cdsQry7.FieldByName('PORUTI').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat / dCosto) * 100, 15, 2);
      DMLOG.cdsNegociacion.FieldByName('PREVEN').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat + dCosto), 15, 2);
   End;
   DMLOG.cdsQry7.FieldByName('IGVPV').AsFloat := FRound((DMLOG.cdsNegociacion.FieldByName('PREVEN').AsFloat * (dIGV / 100)), 15, 2);
   DMLOG.cdsNegociacion.FieldByName('PREPUB').AsFloat := FRound(DMLOG.cdsNegociacion.FieldByName('PREVEN').AsFloat + DMLOG.cdsQry7.FieldByName('IGVPV').AsFloat, 15, 2);

   DMLOG.cdsNegociacion.Post;

   DMLOG.cdsQry7.Post;

End;

Procedure TFComboDet.bbtnRegCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFComboDet.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_Dialogkey, VK_TAB, 0);
   End;
End;

Procedure TFComboDet.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Try
      DMLOG.cdsQry7.Close;
      DMLOG.cdsNegociacion.CancelUpdates;
   Except
   End;
End;

End.


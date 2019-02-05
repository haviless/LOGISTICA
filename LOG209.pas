Unit LOG209;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Wwdbdlg, ExtCtrls, GridControl, StdCtrls, Buttons, Mask, wwdbedit,
   wwdblook, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, db, Variants, MsgDlgs;

Type
   TFGenOrdCom = Class(TForm)
      pcOC: TPageControl;
      tsOrd1: TTabSheet;
      pnlCabecera: TPanel;
      dbgOrdComp: TwwDBGrid;
      pnlCIA: TPanel;
      dblcCIA: TwwDBLookupCombo;
      dbeCIA: TwwDBEdit;
      pnlDetalle: TPanel;
      dbgDProf: TwwDBGrid;
      pnlTitle4: TPanel;
      Z2bbtnRqs: TBitBtn;
      pnlTotal: TPanel;
      gbTotales: TGroupBox;
      dbeTCompra: TwwDBEdit;
      dbeTimpues: TwwDBEdit;
      dbeTFlete: TwwDBEdit;
      dbeDesc: TwwDBEdit;
      dbeTotal: TwwDBEdit;
      Z2bbtnCanc2: TBitBtn;
      Z2bbtnGraba: TBitBtn;
      Z2bbtnSalir: TBitBtn;
      Procedure bbtnOKClick(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcEditExit(Sender: TObject);
      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dbgRqsArtDblClick(Sender: TObject);
      Procedure pnlDetalleEnter(Sender: TObject);
      Procedure pnlDetalleExit(Sender: TObject);
      Procedure pcOCChanging(Sender: TObject; Var AllowChange: Boolean);
      Procedure pcOCChange(Sender: TObject);
      Procedure Z2bbtnRqsClick(Sender: TObject);
      Procedure dbgDProfCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      Procedure dbgRqsArtCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      Procedure dbgArtPendCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      Procedure Z2bbtnSalirClick(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormCreate(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
      iEstado: Integer;
      iAction: TCloseAction;
      xGrabado: Boolean;
      Procedure AfterScroll(DataSet: TDataSet);
      Procedure AsigDat;
      Procedure OnOffDetalle(Value: Boolean);
      Procedure OnOffCabecera(Value: Boolean);
      Procedure dcCIA;
      Function EHandlerError(Ex: Exception): Boolean;
      Procedure GenHeaderOrdComp_PRF(Sender: TObject);
      Procedure GenHeaderOrdComp_RQS(Sender: TObject);
      Procedure GenDetailOrdComp_PRF(Sender: TObject);
      Procedure GenDetailOrdComp_RQS(Sender: TObject);
      Procedure cbmPanel;
      Procedure Cancelar;
   Public
    { Public declarations }
      sCIA, sNumORD: String;
      sumArt_A: Double;
   End;

Var
   FGenOrdCom: TFGenOrdCom;

Implementation

Uses LOGDM1, LOG210, oaAD3100;

{$R *.DFM}

Procedure TFGenOrdCom.bbtnOKClick(Sender: TObject);
Begin
   If DMLOG.cdsOrdComp.State In [dsInsert, dsEdit] Then
   Try
      AsigDat; // asignar los datos predeterminados
      DMLOG.cdsOrdComp.Post;
      OnOffCabecera(False); //Desactivar el panel de Cabecera
      OnOffDetalle(True); //Activar el panel de detalle
      Z2bbtnCanc2.Enabled := True;
   Except
      On E: Exception Do
         If Not EHandlerError(E) Then Raise;
   End;
End;

Procedure TFGenOrdCom.AsigDat;
Var
   D, M, Y: Word;
   sFecha, sSQL: String;
Begin
   If DMLOG.cdsOrdComp.State In [dsInsert, dsEdit] Then
   Begin
      DecodeDate(Now, Y, M, D);
      If (DMLOG.cdsOrdComp.State In [dsInsert]) And
         (DMLOG.cdsOrdComp.FieldbyName('ODCOBS').IsNull) Then
         DMLOG.cdsOrdComp.FieldbyName('ODCOBS').AsString := '.';
      If DMLOG.cdsOrdComp.State In [dsInsert] Then
         DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString := 'INICIAL';
      DMLOG.cdsOrdComp.FieldbyName('ODCUSER').AsString := DMLOG.wUsuario;

      sFecha := formatdatetime(DMLOG.wFormatFecha, Date);
      sSQL := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(sFecha);
      DMLOG.FiltraCDS(DMLOG.cdsPeriodo, sSQL);

      DMLOG.cdsOrdComp.FieldbyName('ODCANO').AsString := IntToStr(Y);
      DMLOG.cdsOrdComp.FieldbyName('ODCMM').AsString := DMLOG.strzero(IntToStr(M), 2);
      DMLOG.cdsOrdComp.FieldbyName('ODCDD').AsString := DMLOG.strzero(IntToStr(D), 2);
      DMLOG.cdsOrdComp.FieldbyName('ODCANOMM').AsString := IntToStr(Y) + DMLOG.strzero(IntToStr(M), 2);
      DMLOG.cdsOrdComp.FieldbyName('ODCTRI').AsString := DMLOG.cdsPeriodo.fieldbyName('FECTRIM').asString;
      DMLOG.cdsOrdComp.FieldbyName('ODCSEM').AsString := DMLOG.cdsPeriodo.fieldbyName('FECSEM').asString;
      DMLOG.cdsOrdComp.FieldbyName('ODCSS').AsString := DMLOG.cdsPeriodo.fieldbyName('FECSS').asString;
      DMLOG.cdsOrdComp.FieldbyName('ODCAATRI').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAATRI').asString;
      DMLOG.cdsOrdComp.FieldbyName('ODCAASEM').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAASEM').asString;
      DMLOG.cdsOrdComp.FieldbyName('ODCAASS').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAASS').asString;

      DMLOG.cdsOrdComp.FieldbyName('ODCFREG').AsDateTime := Date;
      DMLOG.cdsOrdComp.FieldbyName('ODCHREG').AsDateTime := SysUtils.Time;
   End;
End;

Procedure TFGenOrdCom.Z2bbtnGrabaClick(Sender: TObject);
Var
   SQLFiltro, xSQL, xLugEnt: String;
Begin
   If dbgOrdComp.DataSource.DataSet.RecordCount = 0 Then
      Raise Exception.create('No hay Proformas');
   Screen.cursor := crHourglass;
   iEstado := 0;

   sNumORD := DMLOG.StrZero(DMLOG.MaxORD(trim(dblcCia.Text)), 8);

   SQLFiltro := 'Select * '
              + '  from LOG304 '
              + ' where CIAID='+quotedstr(dblcCIA.Text)
              + '   and ODCID='+quotedstr(sNumORD);
   DMLOG.cdsOrdComp.DataRequest(SQLFiltro);

// apertura detalle de Orden de Compra
   xSQL := 'Select * '
         + '  from LOG305 '
         + ' where CIAID=' + quotedstr(dblcCIA.text)
         + '   and ODCID=' + quotedstr(sNumOrd);
   DMLOG.cdsDOrdComp.Close;
   DMLOG.cdsDOrdComp.DataRequest(xSQL);
   DMLOG.cdsDOrdComp.Open;

// apertura SOLICITUD de la Proforma seleccionada
// Cabecera de Solicitud
   xSQL := 'Select * '
         + '  from LOG302 '
         + ' where CIAID=' + quotedstr(dblcCIA.text)
         + '   and SCCID=' + quotedstr(DMLOG.cdsProfxCIA.FieldByName('SCCID').AsString);
   DMLOG.cdsSolCot.Close;
   DMLOG.cdsSolCot.DataRequest(xSQL);
   DMLOG.cdsSolCot.Open;

// Detalle de Solicitud
   xSQL := 'Select * '
         + '  from LOG303 '
         + ' where CIAID=' + quotedstr(dblcCIA.text)
         + '   and SCCID=' + quotedstr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString);
   DMLOG.cdsDSolCot.Close;
   DMLOG.cdsDSolCot.DataRequest(xSQL);
   DMLOG.cdsDSolCot.Open;

   If pcOC.ActivePage = tsOrd1 Then // pestaña de orden de compra por proformas
   Begin
  // .........................................................................
  // | Es aqui donde deben crearse las ordenes de compra                     |
  // | con los datos de las PROFORMAS                                        |
  // .........................................................................
      GenHeaderOrdComp_PRF(Nil);
      GenDetailOrdComp_PRF(Nil);
      FRegOrdC.dbeCnt.Enabled := True;
      FRegOrdC.dbePUnit.Enabled := False;
      FRegOrdC.dbeDscto.Enabled := False;
      FRegOrdC.dbeImpInd.Enabled := False;
      FRegOrdC.dbeImporte.Enabled := False;
   End
   Else
   Begin
 // .........................................................................
 // | Es aqui donde deben crearse las ordenes de compra                     |
 // | con los datos de las REQUISICIONES                                    |
 // .........................................................................
      GenHeaderOrdComp_RQS(Nil);
      GenDetailOrdComp_RQS(Nil);
      FRegOrdC.dbcldArti.Enabled := True;
      FRegOrdC.dbeCnt.Enabled := True;
      FRegOrdC.dbePUnit.Enabled := True;
      FRegOrdC.dbeDscto.Enabled := True;
      FRegOrdC.dbeImpInd.Enabled := True;
      FRegOrdC.dbeImporte.Enabled := True;
   End;

// predefine lugar de entrega en base a la Solicitud de la Proforma
   xLugEnt := DMLOG.cdsSolCot.fieldbyname('LGECID').AsString;
   DMLOG.cdsLEntrega.close;
   DMLOG.FiltraTabla(DMLOG.cdsLEntrega, 'TGE136', 'LGECID', 'LGECID');
   FRegOrdC.dblcLEntrega.Text := xLugEnt;
   FRegOrdC.edtLEntrega.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE136', 'LGECDES', 'LGECID=' + quotedStr(FRegOrdC.dblcLEntrega.text), 'LGECDES');

   FRegOrdC.CalcTotal(Nil);

   DMLOG.cdsOrdComp.Edit;
   DMLOG.cdsOrdComp.FieldByName('ODCFATE').asDatetime := date;
   FRegOrdC.dbdtpFAtt.DateTime := date;
   FRegOrdC.dblcdExits(FRegOrdC.dblcCIA);
   FRegOrdC.dblcdExits(FRegOrdC.dblcFPago);
   FRegOrdC.dblcdExits(FRegOrdC.dblcTMoneda);
   FRegOrdC.dblcdProv.OnExit(FRegOrdC.dblcdProv);
   DMLOG.ControlTran(0, Nil, '');

   DMLOG.cdsOrdComp.Edit;
   Screen.cursor := crDefault;
   FRegOrdC.ShowModal;
   close; //cierro FGenOrdCom
End;

Procedure TFGenOrdCom.Cancelar;
Begin
   Try
      If (DMLOG.cdsArtPendX.ChangeCount > 0) Or (DMLOG.cdsArtPendX.Modified) Then
         DMLOG.cdsArtPendX.CancelUpdates;
      If (DMLOG.cdsReqs.ChangeCount > 0) Or (DMLOG.cdsReqs.Modified) Then
         DMLOG.cdsReqs.CancelUpdates;
      If (DMLOG.cdsDProfxCIA.ChangeCount > 0) Or (DMLOG.cdsDProfxCIA.Modified) Then
         DMLOG.cdsDProfxCIA.CancelUpdates;
   Except
    //
   End;
End;

Procedure TFGenOrdCom.Z2bbtnCanc2Click(Sender: TObject);
Begin
   Screen.cursor := crHourglass;
   Cancelar;
   Repaint;
   If FRegOrdC.Visible Then FRegOrdC.Close;

   dbeDesc.Enabled := False;
   If pcOC.ActivePage = tsOrd1 Then
   Begin
      OnOffCabecera(True);
      OnOffDetalle(False);
   End;
   iEstado := -1;
   Screen.cursor := crDefault;
End;

Procedure TFGenOrdCom.Z2bbtnRegCancClick(Sender: TObject);
Begin
   OnOffDetalle(True); // activar detalle
   pnlDetalle.Enabled := True;
End;

Procedure TFGenOrdCom.OnOffCabecera(Value: Boolean);
Begin
  // ....................... activar cabecera de requisición ...................
   pnlCabecera.Enabled := Value;
End;

Procedure TFGenOrdCom.OnOffDetalle(Value: Boolean);
Begin
  // ....................... activar detalle de requisición ....................
   pnlDetalle.Enabled := Value;
   Z2bbtnCanc2.Enabled := Value;
   Z2bbtnGraba.Enabled := Value;
   If Value Then
   Begin
      Z2bbtnSalir.SetFocus;
   End;
End;

Procedure TFGenOrdCom.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   FOrdendeCompra.wTipoOC := '';
   DMLOG.wModo := '';
   Action := CAFree;
End;

Function TFGenOrdCom.EHandlerError(Ex: Exception): Boolean;
Var
   a, b: Integer;
   s1, s2: String;
Begin
   Result := true;
   If Ex.Message = 'Key violation.' Then
   Begin
      ErrorMsg('Error', 'No pueden existir registros duplicados.. ');
   End
   Else
   Begin
      a := pos('must have a value', Ex.Message);
      s1 := '';
      s2 := '';
      If a > 0 Then
      Begin
         s1 := Ex.Message;
         b := pos('''', s1);
         While s1[b + 1] <> '''' Do
         Begin
            inc(b);
            s2 := s2 + s1[b];
         End;
         ErrorMsg('Error', 'El campo ' + s2 + ' es obligatorio...  ');
      End
      Else
         Result := false;
   End;
End;

Procedure TFGenOrdCom.dblcEditExit(Sender: TObject);
Begin
   If TCustomEdit(Sender).Text = '' Then
   Begin
      ErrorMsg('Error', 'El Campo no debe estar vacío');
      TCustomEdit(Sender).SetFocus;
   End;
End;

Procedure TFGenOrdCom.dblcNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFGenOrdCom.dbgRqsArtDblClick(Sender: TObject);
Begin
   pnlDetalle.Enabled := False;
   pnlCabecera.Left := 218;
   pnlCabecera.Top := 241;
   pnlCabecera.Visible := True;
   iEstado := 0;
End;

{...............................................................................
                boton de atención individual de edicion
 ..............................................................................}

Procedure TFGenOrdCom.pnlDetalleEnter(Sender: TObject);
Begin
   pnlTitle4.Color := clHighlight;
End;

Procedure TFGenOrdCom.pnlDetalleExit(Sender: TObject);
Begin
   pnlTitle4.Color := clAppWorkSpace;
End;

Procedure TFGenOrdCom.pcOCChanging(Sender: TObject;
   Var AllowChange: Boolean);
Begin
   If iEstado = 0 Then
   Begin
      AllowChange := False;
      ErrorMsg('Error', 'Debe cancelar la Generación de Orden de Compra por' + #13
                       +'Proformas, para poder realizar Ordenes de Compra' + #13
                       +'por Requesiciones');
   End
   Else
   Begin
      If iEstado = 1 Then
      Begin
         AllowChange := False;
         ErrorMsg('Error', 'Debe cancelar la Generación de Orden de Compra por' + #13
                          +'Requisiciones, para poder realizar Ordenes de Compra' + #13
                          +'por Proformas');
      End
      Else
         AllowChange := True;
   End;
End;

{...............................................................................
 |                     BOTON DE ATENCION AL ARTICULO                           |
 .............................................................................. }

Procedure TFGenOrdCom.cbmPanel;
Begin
   pnlDetalle.Enabled := False;
End;

Procedure TFGenOrdCom.pcOCChange(Sender: TObject);
Begin
   DMLOG.cdsProfxCIA.Close;
   DMLOG.cdsProfxCIA.Open;
   If pcOC.ActivePage = tsOrd1 Then
      cbmPanel
   Else
   Begin
      DMLOG.cdsArtPendX.first;
   End;
   dcCIA;
End;

Procedure TFGenOrdCom.dcCIA;
Begin
   If DMLOG.cdsCIA.RecordCount = 1 Then
      DMLOG.cdsCIA.First;
   sCIA := trim(DMLOG.cdsCIA.FieldByName('CIAid').AsString);
   dblcCIA.Text := sCIA;
   dblcCIA.Enabled := DMLOG.cdsCIA.RecordCount > 1;
End;

Procedure TFGenOrdCom.Z2bbtnRqsClick(Sender: TObject);
Begin
   OnOffCabecera(False);
   OnOffDetalle(True);
   Z2bbtnCanc2.Enabled := True;
End;

Procedure TFGenOrdCom.GenDetailOrdComp_PRF(Sender: TObject);
Var
   sDORD, xSQL: String;
   Expresion: String;
   fP_Unitario, f_Importe, f_PorDcto, f_PorImpuesto, f_TImpuesto, f_TDcto, f_TCompra, f_Cantidad: Double;
   xFactor: Currency;
Begin
// Aquí se recuperan los posibles detalles del maestro articulo proveedor
   DMLOG.cdsGrab.close;
   xSQL := 'SELECT * FROM TGE215 WHERE PROV = ''' + DMLOG.cdsOrdComp.fieldbyname('PROV').AsString + ''' ';
   DMLOG.cdsGrab.DataRequest(xSQL);
   DMLOG.cdsGrab.Open;

   Expresion := 'SCCID=' + quotedStr(DMLOG.cdsProfxCIA.fieldbyname('SCCID').AsString);

   DMLOG.cdsDProfxCIA.first; //ya esta filtrado
   While Not DMLOG.cdsDProfxCIA.Eof Do
   Begin
      sDORD := DMLOG.StrZero(DMLOG.MaxValue('DODCID', DMLOG.cdsDOrdComp), 3);
      DMLOG.cdsDOrdComp.Insert;
      DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString := DMLOG.cdsOrdComp.FieldByName('CIAID').AsString;
      DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').AsString := DMLOG.cdsOrdComp.FieldByName('TIPOADQ').AsString;
      DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsFloat := DMLOG.cdsDProfxCIA.FieldByName('CANTIDAD').AsFloat; // sumArt_A;
      DMLOG.cdsDOrdComp.FieldByName('DODCCSLD').AsFloat := DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsFloat;
      DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString := sDORD;
      DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString := DMLOG.cdsDProfxCIA.FieldByName('ARTID').AsString;
      DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString := DMLOG.cdsDProfxCIA.FieldByName('UNMID').AsString;
      DMLOG.cdsDOrdComp.FieldByName('DODCOBS').AsString := Trim(DMLOG.cdsDProfxCIA.FieldByName('DPROFOBS').AsString);
      DMLOG.cdsDOrdComp.FieldByName('CCOMERID').asString := DMLOG.cdsOrdComp.FieldByName('CCOMERID').AsString;
      DMLOG.cdsDOrdComp.FieldByName('PROV').asString := DMLOG.cdsOrdComp.FieldByName('PROV').AsString;

      fP_Unitario := DMLOG.cdsDProfxCIA.FieldByName('PRECIO').AsFloat;
      f_PorDcto := DMLOG.cdsDProfxCIA.FieldByName('DPROFDSCTO').AsFloat;
      f_PorImpuesto := DMLOG.cdsDProfxCIA.FieldByName('DPROFIMPU').AsFloat;
      f_Cantidad := DMLOG.cdsDProfxCIA.FieldByName('CANTIDAD').AsFloat; // sumArt_A;
      f_Importe := fP_Unitario * f_Cantidad;
      f_TDcto := f_Importe * (f_PorDcto / 100);
      f_Importe := f_Importe - f_TDcto;
      f_TImpuesto := f_Importe * (f_PorImpuesto / 100);
      f_TCompra := f_Importe + f_TImpuesto;

      DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsFloat := fP_Unitario;
      DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsFloat := f_PorDcto;
      DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsFloat := f_PorImpuesto;
      DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat := f_Importe;

      DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsFloat := f_TCompra;
      DMLOG.cdsDOrdComp.FieldByName('IMPUNI').AsFloat := f_TCompra / f_Cantidad;

      Try
         If DMLOG.cdsGrab.RecordCount <> 0 Then
         Begin
            If DMLOG.cdsGrab.Locate('ARTID', Vararrayof([DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString]), []) Then
            Begin
               If (Not (DMLOG.cdsgrab.fieldbyname('ARTIDPROV').isnull)) And
                  (trim(DMLOG.cdsgrab.fieldbyname('ARTIDPROV').AsString) <> '') Then
                  DMLOG.cdsDOrdComp.FieldByName('ARTIDPROV').AsString := DMLOG.cdsgrab.FieldByName('ARTIDPROV').AsString;

               If (Not (DMLOG.cdsgrab.fieldbyname('ARTDESPROV').isnull)) And
                  (trim(DMLOG.cdsgrab.fieldbyname('ARTDESPROV').AsString) <> '') Then
                  DMLOG.cdsDOrdComp.FieldByName('ARTDESPROV').AsString := DMLOG.cdsgrab.FieldByName('ARTDESPROV').AsString;

               If (Not (DMLOG.cdsgrab.fieldbyname('UNMIDEQUIV').isnull)) And
                  (trim(DMLOG.cdsgrab.fieldbyname('UNMIDEQUIV').AsString) <> '') Then
               Begin
                  DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').AsString := DMLOG.cdsgrab.FieldByName('UNMIDEQUIV').AsString;
                  xFactor := DMLOG.Factor(DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString, DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').AsString);
                  DMLOG.cdsDOrdComp.FieldByName('PUNTEQUIV').AsCurrency := xFactor * DMLOG.cdsDOrdComp.FieldByName('DODCPUN').ascurrency;
                  DMLOG.cdsDOrdComp.FieldByName('CNTEQUIV').AsCurrency := xFactor * DMLOG.cdsDOrdComp.FieldByName('DODCCNT').ascurrency;
               End;
            End;
         End;
      Except
      End;

      wSQL := 'CIAID=' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
            + ' AND ARTID=' + QuotedStr(DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString);
      DMLOG.DisplayDescrip('prvSQL', 'TGE205', 'ARTID, TINID, GRARID, FAMID, SFAMID', wSQL, 'ARTID');

      DMLOG.cdsDOrdComp.FieldByName('TINID').AsString := DMLOG.cdsQry.FieldByName('TINID').AsString;
      DMLOG.cdsDOrdComp.FieldByName('GRARID').AsString := DMLOG.cdsQry.FieldByName('GRARID').AsString;
      DMLOG.cdsDOrdComp.FieldByName('FAMID').AsString := DMLOG.cdsQry.FieldByName('FAMID').AsString;
      DMLOG.cdsDOrdComp.FieldByName('SFAMID').AsString := DMLOG.cdsQry.FieldByName('SFAMID').AsString;

      DMLOG.cdsDOrdComp.FieldByName('ODCANO').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCANO').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCMES').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCMM').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCDIA').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCDD').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCANOMES').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCANOMM').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCTRIM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCTRI').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCSEM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCSEM').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCSS').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCSS').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCAATRI').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAATRI').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCAASEM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAASEM').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCAASS').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAASS').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCUSER').AsString := DMLOG.wUsuario;

      DMLOG.cdsDOrdComp.Post;
      DMLOG.cdsDProfxCIA.Next; // siguiente registro
   End;
End;

Procedure TFGenOrdCom.GenDetailOrdComp_RQS(Sender: TObject);
Var
   dCnts, dCnta, sumArt_A: Double;
   sDORD: String;

   Procedure ScanRQS;
   Begin
      DMLOG.cdsPxAxR.First;
      While Not DMLOG.cdsPxAxR.Eof Do
      Begin
         If DMLOG.cdsPxAxR.FieldByName('RQSMARK').AsString = '*' Then
         Begin
            dCnts := DMLOG.cdsPxAxR.FieldByName('DRQSCNSG').AsFloat;
            dCnta := DMLOG.cdsPxAxR.FieldByName('DRQSCNAG').AsFloat;
            sumArt_A := sumArt_A + dCnta;
         End;
         DMLOG.cdsPxAxR.Next;
      End;
   End;

   Procedure NewDatailOrd;
   Begin
      If sumArt_A > 0 Then
      Begin
         sDORD := DMLOG.StrZero(DMLOG.MaxValue('DODCID', DMLOG.cdsDOrdComp), 3);
         DMLOG.cdsDOrdComp.Insert;
         DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString := sDORD;
         DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString := sNumORD;
         DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString := DMLOG.cdsOrdComp.FieldByName('CIAID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').AsString := DMLOG.cdsOrdComp.FieldByName('TIPOADQ').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString := DMLOG.cdsArtPendX.FieldByName('ARTID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString := DMLOG.cdsArtPendX.FieldByName('UNMIDG').AsString;
         DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsFloat := sumArt_A;
         DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsFloat := 0;
         DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsFloat := 0;
         DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat := 0;
         DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsFloat := 0;

         wSQL := 'CIAID=' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
               + ' and ARTID=' + QuotedStr(DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString);
         DMLOG.DisplayDescrip('prvSQL', 'TGE205', 'ARTID, TINID, GRARID, FAMID, SFAMID', wSQL, 'ARTID');

         DMLOG.cdsDOrdComp.FieldByName('TINID').AsString := DMLOG.cdsQry.FieldByName('TINID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('GRARID').AsString := DMLOG.cdsQry.FieldByName('GRARID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('FAMID').AsString := DMLOG.cdsQry.FieldByName('FAMID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('SFAMID').AsString := DMLOG.cdsQry.FieldByName('SFAMID').AsString;

         DMLOG.cdsDOrdComp.FieldByName('ODCANO').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCANO').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCMES').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCMM').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCDIA').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCDD').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCANOMES').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCANOMM').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCTRIM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCTRI').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCSEM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCSEM').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCSS').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCSS').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCAATRI').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAATRI').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCAASEM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAASEM').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCAASS').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAASS').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCUSER').AsString := DMLOG.wUsuario;

         DMLOG.cdsDOrdComp.Post;
      End;
   End;

Var
 //Expresion : String;
   Articulo: String;
Begin
   DMLOG.cdsRqsArtX.First;
   While Not DMLOG.cdsRqsArtX.eof Do
   Begin
      sumArt_A := 0;
      Articulo := DMLOG.cdsRqsArtX.FieldByName('ARTID').AsString;
      If DMLOG.cdsRqsArtX.FieldByName('RQSFLAGUM').asString = 'G' Then
         sumArt_A := DMLOG.cdsRqsArtX.FieldByName('DRQSCNSG').AsFloat
      Else
         sumArt_A := DMLOG.cdsRqsArtX.FieldByName('DRQSCNSU').AsFloat;
      NewDatailOrd;
      DMLOG.cdsRqsArtX.next;
   End;
End;

Procedure TFGenOrdCom.GenHeaderOrdComp_PRF(Sender: TObject);
Var
   sVar: String;
Begin
   DMLOG.cdsOrdComp.Insert;
  // .........................................................................
  // |                   CREANDO CABECERA DE ORDENES DE COMPRA               |
  // .........................................................................
   DMLOG.cdsOrdComp.FieldByName('CIAID').AsString := DMLOG.cdsProfxCIA.FieldByName('CIAID').AsString;
   DMLOG.cdsOrdComp.FieldByName('TIPOADQ').AsString := DMLOG.cdsProfxCIA.FieldByName('TIPOADQ').AsString;
   DMLOG.cdsOrdComp.FieldByName('PROFID').AsString := DMLOG.cdsProfxCIA.FieldByName('PROFID').AsString;
   DMLOG.cdsOrdComp.FieldByName('ODCVALID').AsFloat := 0;
   DMLOG.cdsOrdComp.FieldByName('ODCTEN').AsFloat := 0;
   DMLOG.cdsOrdComp.FieldByName('ODCID').AsString := DMLOG.StrZero(DMLOG.MaxORD(dblccia.Text), 8);
   DMLOG.cdsOrdComp.FieldByName('ODCFEMI').AsDateTime := Date;

   DMLOG.cdsOrdComp.FieldByName('PROV').AsString := DMLOG.cdsProfxCIA.FieldByName('PROV').AsString;
   DMLOG.cdsOrdComp.FieldByName('CCOMERID').AsString := DMLOG.cdsProfxCIA.FieldByName('PROFCONCOM').AsString;
   DMLOG.cdsOrdComp.FieldByName('TMONID').AsString := DMLOG.cdsProfxCIA.FieldByName('TMONID').AsString;
   DMLOG.cdsOrdComp.FieldByName('ODCIDCP').AsString := DMLOG.cdsProfxCIA.FieldByName('PROFNPROV').AsString;
   DMLOG.cdsOrdComp.FieldByName('ODCTCAMB').AsFloat := DMLOG.cdsProfxCIA.FieldByName('PROFTCAMB').AsFloat;
   DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat := DMLOG.cdsProfxCIA.FieldByName('PROFIXFLE').AsFloat;

   sVar := DMLOG.cdsProfxCIA.FieldByName('SCCID').AsString;
   DMLOG.cdsOrdComp.FieldByName('COMPID').AsString := DMLOG.DisplayDescrip('prvSQL', 'LOG302', 'COMPID', 'SCCID=' + quotedStr(sVar), 'COMPID');
   DMLOG.cdsOrdComp.FieldByName('LGECID').AsString := DMLOG.DisplayDescrip('prvSQL', 'LOG302', 'LGECID', 'SCCID=' + quotedStr(sVar), 'LGECID');

   DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat := 0;
   DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat := 0;
   DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').AsFloat := 0;
   DMLOG.cdsOrdComp.FieldByName('ODCTIMP').AsString := DMLOG.cdsProfxCIA.FieldByName('PROFTIMP').AsString;
   DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat := 0;

   If DMLOG.cdsProfxCIA.FieldByName('PROFTIMP').AsString = 'TOTAL' Then
      DMLOG.cdsOrdComp.FieldByName('ODCIXTI').AsFloat := DMLOG.cdsProfxCIA.FieldByName('PROFIXTI').AsFloat // totalizar impuestos
   Else
      DMLOG.cdsOrdComp.FieldByName('ODCIXTI').AsFloat := 0;
   AsigDat;

   DMLOG.cdsOrdComp.Post;
End;

Procedure TFGenOrdCom.GenHeaderOrdComp_RQS(Sender: TObject);
Begin
   DMLOG.cdsOrdComp.Insert;
  // .........................................................................
  // |                   CREANDO CABECERA DE ORDENES DE COMPRA               |
  // .........................................................................
   DMLOG.cdsOrdComp.FieldByName('CIAID').AsString := sCIA;

   DMLOG.cdsOrdComp.FieldByName('PROFID').AsString := '';
   DMLOG.cdsOrdComp.FieldByName('ODCVALID').AsFloat := 0;
   DMLOG.cdsOrdComp.FieldByName('ODCTEN').AsFloat := 0;
   DMLOG.cdsOrdComp.FieldByName('ODCID').AsString := DMLOG.StrZero(DMLOG.MaxORD(dblccia.Text), 8);
   DMLOG.cdsOrdComp.FieldByName('ODCFEMI').AsDateTime := Date;
   DMLOG.cdsOrdComp.FieldByName('COMPID').AsString := '';
   DMLOG.cdsOrdComp.FieldByName('LGECID').AsString := '';
   DMLOG.cdsOrdComp.FieldByName('FPAGOID').AsString := '';
   DMLOG.cdsOrdComp.FieldByName('TMONID').AsString := '';
   DMLOG.cdsOrdComp.FieldByName('ODCIDCP').AsString := '';
   DMLOG.cdsOrdComp.FieldByName('ODCTCAMB').AsFloat := 0;
   DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat := 0;
   DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat := 0;
   DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat := 0;
   DMLOG.cdsOrdComp.FieldByName('ODCIXTI').AsFloat := 0;
   DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').AsFloat := 0;

   DMLOG.cdsOrdComp.FieldByName('ODCTIMP').AsString := 'TOTAL';
   DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat := 0;

   sNumORD := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;

   AsigDat; // ... DATOS ADICIONALES ...

   DMLOG.cdsOrdComp.Post;
End;

Procedure TFGenOrdCom.dbgDProfCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   If DMLOG.cdsDProfxCIA.FieldByName('DPROFMARK').AsString = '*' Then
   Begin
      If (Not Highlight) Then
      Begin
         AFont.Style := [fsBold];
         ABrush.Color := clInfoBk;
      End;
   End;

   If gdSelected In State Then
   Begin
      AFont.Color := clHighlightText;
      ABrush.Color := clHighlight;
   End;
End;

Procedure TFGenOrdCom.dbgRqsArtCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   If DMLOG.cdsPxAxR.FieldByName('RQSMARK').AsString = '*' Then
   Begin
      If (Not Highlight) Then
      Begin
         AFont.Style := [fsBold];
         ABrush.Color := clInfoBk;
      End;
   End;

   If gdSelected In State Then
   Begin
      AFont.Color := clHighlightText;
      ABrush.Color := clHighlight;
   End;
End;

Procedure TFGenOrdCom.dbgArtPendCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   If DMLOG.cdsArtPendX.FieldByName('RQSMARK').AsString = '*' Then
   Begin
      If (Not Highlight) Then
      Begin
         AFont.Style := [fsBold];
         ABrush.Color := clInfoBk;
      End;
   End;
End;

Procedure TFGenOrdCom.AfterScroll(DataSet: TDataSet);
Var
   sCIA, sARTID, sSCCID: String;
Begin
   sCIA := Dataset.FieldByName('CIAID').AsString;
   sARTID := Dataset.FieldByName('ARTID').AsString;

   If pcOC.ActivePage = tsOrd1 Then
   Begin
      sSCCID := dbgOrdComp.DataSource.DataSet.fieldbyName('SCCID').AsString;
      DMLOG.cdsPxAxR.Filtered := False;
      DMLOG.cdsPxAxR.filter := 'RQSEST = ''ACEPTADO'' '
                        + ' and CIAID = '+quotedstr(sCIA)
                        + ' and ARTID = '+quotedstr(sARTID)
                        + ' and SCCID = '+quotedstr(sSCCID);
      DMLOG.cdsPxAxR.filtered := True;
   End
   Else
   Begin
      DMLOG.cdsPxAxR.Filtered := False;
      DMLOG.cdsPxAxR.filter := 'RQSEST=''ACEPTADO'' '
                        + ' and CIAID = '+quotedstr(sCIA)
                        + ' and ARTID = '+quotedstr(sARTID);
      DMLOG.cdsPxAxR.filtered := True;
   End;
End;

Procedure TFGenOrdCom.Z2bbtnSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFGenOrdCom.dblcCIAExit(Sender: TObject);
Var
   xSQL: String;
Begin
   dbeCIA.Text := DMLOG.cdsCIA.FieldByName('CIADES').AsString;
   If trim(dblcCIA.Text) = '' Then
   Begin
      ErrorMsg('Error', 'La compañia no puede estar en blanco');
      pcOC.enabled := false;
      exit;
   End;

   pcOC.enabled := true;
   iEstado := -1;
   iAction := caNone;
   xSQL := 'Select P.*, O.PROFID '
         + '  from LOG312 P, LOG304 O '
         + ' where (P.PROFEST = ''ACEPTADO'' OR P.PROFEST = ''PARCIAL'') '
         + '   and O.PROFID IS NULL '
         + '   and P.CIAID=' + quotedstr(dblcCIA.text) + ' '
         + '   and P.PROFID = O.PROFID(+) '
         + '   and P.PROFEVAL=''A'' '
         + '   and P.SCCID IS NOT NULL '
         + ' order BY P.PROFID';
   DMLOG.cdsProfxCIA.Close;
   DMLOG.cdsProfxCIA.DataRequest(xSQL);
   DMLOG.cdsProfxCIA.Open;

   xSQL := 'Select A.CIAID, A.PROFID, A.ARTID, A.UNMIDG, A.UNMIDU, A.DPROFID, A.DPROFCNTG, '
         + '       A.DPROFCNTU, A.DPROFPUNG, A.DPROFPUNU, A.DPROFDSCTO, A.DPROFIMP, A.DPROFIMPU, '
         + '       A.DPROFMARK, A.DPROFEVAL, A.DPROFCONCOM, A.DPROFGARAN, A.DPROFGARDMA, '
         + '       A.DFPAGOID, A.DPROFTEN, A.DPROFVALID, A.DPROFLAGUM, A.DPROFISC, A.ODCID, '
         + '       A.DPROFPROV, A.DPROFPRVD, A.DPROFARTD, A.TRQSID, A.TIPOADQ, A.DPROFOBS, '
         + '       A.DPROFFREG, A.PROFUSER, A.TINID, A.GRARID, A.FAMID, A.SFAMID, A.PROFANO, '
         + '       A.PROFMES, A.PROFDIA, A.PROFTRIM, A.PROFSEM, A.PROFANOMES, A.PROFSS, '
         + '       A.PROFAATRI, A.PROFAASEM, A.PROFAASS, A.SCCID, A.DPROFTIPCCOM, A.CLAUXID, '
         + '       A.ARTIDMAE, B.UNMABR, '
         + '       case when DPROFLAGUM = ' + quotedstr('G') + ' then DPROFCNTG else DPROFCNTU end CANTIDAD, '
         + '       case when DPROFLAGUM = ' + quotedstr('G') + ' then DPROFPUNG else DPROFPUNU end PRECIO, '
         + '       case when DPROFLAGUM = ' + quotedstr('G') + ' then UNMIDG    else UNMIDU    end UNMID '
         + '  from LOG313 A, TGE130 B '
         + ' where CIAID=' + quotedstr(dblcCIA.text)
         + '   and ODCID IS NULL '
         + '   and (CASE WHEN DPROFLAGUM='+quotedstr('G')
         + '             THEN UNMIDG '
         + '             ELSE UNMIDU END) = B.UNMID(+) ';
   DMLOG.cdsDProfxCIA.Close;
   DMLOG.cdsDProfxCIA.DataRequest(xSQL);
   DMLOG.cdsDProfxCIA.MasterSource := DMLOG.dsProfxCIA;
   DMLOG.cdsDProfxCIA.MasterFields := 'CIAID;PROFID';
   DMLOG.cdsDProfxCIA.IndexFieldNames := 'CIAID;PROFID;DPROFID';
   DMLOG.cdsDProfxCIA.Open;

   dbgOrdComp.DataSource := DMLOG.dsProfxCIA;

   DMLOG.FiltraTabla(DMLOG.cdsLEntrega, 'TGE136', 'LGECID', 'LGECID');
   If DMLOG.cdsReqs.Active Then
      DMLOG.cdsReqs.Close;
   xSQL := 'Select * '
         + '  from LOG308 '
         + ' where CIAID=' + quotedstr(dblcCIA.text);
   DMLOG.cdsReqs.Close;
   DMLOG.cdsReqs.DataRequest(xSQL);
   DMLOG.cdsReqs.Open;
   DMLOG.cdsDProfxCIA.AfterScroll := AfterScroll;
   DMLOG.cdsArtPendX.AfterScroll := AfterScroll;
End;

Procedure TFGenOrdCom.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFGenOrdCom.FormCreate(Sender: TObject);
Begin
   If DMLOG.cdsCia.Active = False Then
      DMLOG.FiltraTabla(DMLOG.cdsCia, 'TGE101', 'CIAID', 'CIAID');
   dblcCIA.LookupTable := DMLOG.cdsCia;
End;

Procedure TFGenOrdCom.FormShow(Sender: TObject);
Begin
   DMLOG.AccesosUsuarios(DMLOG.wModulo, DMLOG.wUsuario, '2', Screen.ActiveForm.Name);
   xGrabado := false;
   pcOC.ActivePage := tsOrd1; // pone como default la generacion de o.compra por proforma
   Z2bbtnCanc2.enabled := true;
   Z2bbtnGraba.enabled := true;
   DMLOG.cdsCIA.First;
   dblcCia.text := DMLOG.cdsCIA.FieldByName('CIAID').asString;
   dblcCia.OnExit(sender);
   If trim(dblcCia.text) = '' Then
   Begin
      If DMLOG.cdsCIA.RecordCount = 1 Then
      Begin
         dblcCIA.Enabled := false;
         dbgOrdComp.SetFocus;
      End
      Else
      Begin
         dblcCIA.Enabled := true;
         dblcCIA.SetFocus;
      End;
   End;
End;

Initialization
   registerclasses([TLabel]);
End.


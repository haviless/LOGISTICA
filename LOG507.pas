Unit LOG507;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, DBCtrls, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, db,
   ComCtrls, wwriched, wwdblook, ppBands, ppClass, ppReport, ppStrtch,
   ppSubRpt, ppVar, ppCtrls, ppPrnabl, ppProd, ppComm, ppRelatv, ppCache,
   ppDB, ppDBPipe, ppViewr, ppTypes, ppEndUsr, MsgDlgs;

Type
   TFEvalProforma = Class(TForm)
      pnlCab: TPanel;
      pnlBtns: TPanel;
      Label1: TLabel;
      DBText1: TDBText;
      dbgResultado: TwwDBGrid;
      Z2bbtnPrint: TBitBtn;
      Z2bbtnAcepta: TBitBtn;
      Z2bbtnSalir: TBitBtn;
      dbgEvaluacion: TwwDBGrid;
      pnlVisar: TPanel;
      lblMotivos: TLabel;
      stxTitulo1: TStaticText;
      dblcMotivos: TwwDBLookupCombo;
      dbreMotivos3: TwwDBRichEdit;
      Z2bbtnOkResul: TBitBtn;
      Z2bbtnCancelResul: TBitBtn;
      edtDatosProf: TEdit;
      dbreMotivos: TMemo;
      ppdbEvalProf: TppDBPipeline;
      ppEvalProf: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppDBText1: TppDBText;
      ppDBText3: TppDBText;
      ppDBText5: TppDBText;
      ppLine1: TppLine;
      ppLabel1: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel2: TppLabel;
      ppDBText8: TppDBText;
      ppSystemVariable2: TppSystemVariable;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppLine2: TppLine;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLine3: TppLine;
      ppSubReport1: TppSubReport;
      ppChildReport1: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppDetailBand2: TppDetailBand;
      ppSummaryBand2: TppSummaryBand;
      ppLabel11: TppLabel;
      ppdbSubRpt: TppDBPipeline;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppLine4: TppLine;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      dbrgVisado: TRadioGroup;
      ppDesigner1: TppDesigner;
      Procedure Z2bbtnSalirClick(Sender: TObject);
      Procedure Z2bbtnAceptaClick(Sender: TObject);
      Procedure dbgEvaluacionCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      Procedure dbgResultadoDblClick(Sender: TObject);
      Procedure Z2bbtnOkResulClick(Sender: TObject);
      Procedure Z2bbtnCancelResulClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcMotivosChange(Sender: TObject);
      Procedure dbgResultadoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      Procedure Z2bbtnPrintClick(Sender: TObject);
      Procedure ppEvalProfPreviewFormCreate(Sender: TObject);
      Procedure dbrgVisadoClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
  { Private declarations }
      vsolcot, xCiaid: String;
      xEvalua: bool;
      xActivo: bool;
      wGrupoCols: Integer;
      Procedure Sumatoria;
      Procedure Compara;
      Procedure SQLGetText1(Sender: TField; Var Text: String; DisplayText: Boolean);
      Procedure EliminaGrupos;
      Procedure MuestraGrupos;
      Procedure ActuaGrid;
   Public
    { Public declarations }
   End;

Var
   FEvalProforma: TFEvalProforma;

Implementation

Uses LOGDM1, oaAD3000;

{$R *.DFM}

Procedure TFEvalProforma.Z2bbtnSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFEvalProforma.Z2bbtnAceptaClick(Sender: TObject);
Var
   xSql: String;
   xTotal: DOUBLE;
   xProfor: String;
Begin
   Screen.Cursor := crHourGlass;
   DMLOG.cdsRegEval.DisableControls;
   EliminaGrupos;
   vsolcot := DMLOG.cdsProfxEval.fieldbyname('SCCID').AsString;
   xCiaid := DMLOG.cdsProfxEval.fieldbyname('CIAID').AsString;

   xSql := 'Select CIAID, SCCID, PROFID, ITEM, CCOCODID, CCOCODDESC, '
      + '          ARTID, CCOTEND, CCOPTOS, VALOR, RESULTADO, '
      + '          CASE WHEN ARTID = ''-'' THEN CCOCODID ELSE ARTID END AS ARTI, ARTDES '
      + '     from LOG326 '
      + '    where CIAID=' + quotedstr(xCiaid)
      + '      and SCCID=' + quotedstr(vsolcot) + ' ORDER BY CCOCODID, ARTID, PROFID, VALOR';
   DMLOG.cdsRegEval.Close;
   dbgEvaluacion.Selected.Clear;
   dbgEvaluacion.Selected.Add('CCOCODDESC' + #9 + '16' + #9 + 'Condición');
   dbgEvaluacion.Selected.Add('PROFID' + #9 + '10' + #9 + 'Proforma');
   dbgEvaluacion.Selected.Add('ARTID' + #9'9' + #9 + 'Articulo');
   dbgEvaluacion.Selected.Add('ARTDES' + #9'15' + #9 + 'Articulo');
   dbgEvaluacion.Selected.Add('CCOTEND' + #9 + '6' + #9 + 'Tendencia');
   dbgEvaluacion.Selected.Add('CCOPTOS' + #9 + '7' + #9 + 'Puntos');
   dbgEvaluacion.Selected.Add('VALOR' + #9 + '7' + #9 + 'Valor');
   dbgEvaluacion.Selected.Add('RESULTADO' + #9 + '7' + #9 + 'Resultado');
   DMLOG.cdsRegEval.DataRequest(xSQL);
   DMLOG.cdsRegEval.Open;
   TNumericField(DMLOG.cdsRegEval.FieldByName('VALOR')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMLOG.cdsRegEval.FieldByName('RESULTADO')).DisplayFormat := '###,###,##0.00';

   DMLOG.cdsRegEval.IndexFieldNames := 'PROFID;CCOCODID;ARTI';

  //**** Cuando la Tendencia es < ***///////////
   xSql := 'Select CIAID, SCCID, PROFID, ITEM, CCOCODID, CCOCODDESC, '
      + '          ARTID, CCOTEND, CCOPTOS, VALOR, RESULTADO, '
      + '          CASE WHEN ARTID = ''-'' THEN CCOCODID ELSE ARTID END AS ARTI, ARTDES '
      + '     from LOG326 '
      + '    where CIAID=' + quotedstr(xCiaid)
      + '      and CCOTEND=' + quotedstr('<')
      + '      and SCCID=' + quotedstr(vsolcot)
      + '    order by CCOCODID, ARTID, VALOR, PROFID';
   DMLOG.cdsEval.Close;
   DMLOG.cdsEval.DataRequest(xSQL);
   DMLOG.cdsEval.Open;
   Compara;

 //**** Cuando la Tendencia es > ***///////////
   xSql := 'Select CIAID, SCCID, PROFID, ITEM, CCOCODID, CCOCODDESC, '
      + '          ARTID, CCOTEND, CCOPTOS, VALOR, RESULTADO, '
      + '          CASE WHEN ARTID= ''-'' THEN CCOCODID ELSE ARTID END AS ARTI '
      + '     from LOG326 '
      + '    where CIAID=' + quotedstr(xCiaid)
      + '      and CCOTEND=' + quotedstr('>')
      + '      and SCCID=' + quotedstr(vsolcot)
      + '    order by CCOCODID, ARTID, PROFID, VALOR DESC';
   DMLOG.cdsEval.Close;
   DMLOG.cdsEval.DataRequest(xSQL);
   DMLOG.cdsEval.Open;
   Compara;
   DMLOG.cdsRegEval.First;
   DMLOG.cdsEvalResul.open;
   DMLOG.cdsEvalResul.IndexFieldNames := 'PROFID;CCOCODID;ARTID';
   While Not DMLOG.cdsRegEval.Eof Do
   Begin
      DMLOG.cdsEvalResul.SetKey;
      DMLOG.cdsEvalResul.FieldByName('PROFID').AsString := DMLOG.cdsRegEval.fieldByName('PROFID').AsString;
      DMLOG.cdsEvalResul.FieldByName('CCOCODID').AsString := DMLOG.cdsRegEval.fieldByName('CCOCODID').AsString;
      DMLOG.cdsEvalResul.FieldByName('ARTID').AsString := DMLOG.cdsRegEval.fieldByName('ARTID').AsString;
      If DMLOG.cdsEvalResul.GotoKey Then
      Begin
         DMLOG.cdsEvalResul.Edit;
         DMLOG.cdsEvalResul.FieldByName('RESULTADO').AsString := DMLOG.cdsRegEval.fieldByName('RESULTADO').AsString;
         DMLOG.cdsEvalResul.Post;
      End;
      DMLOG.cdsRegEval.next;
   End;
   If DMLOG.cdsSolCot.fieldbyname('PROFEVAL').AsString <> 'E' Then
      DMLOG.ControlTran(0, Nil, '');

  //** se Asigna el Total por Proforma
   DMLOG.cdsRegEval.IndexFieldNames := 'PROFID';
   DMLOG.cdsRegEval.First;
   DMLOG.cdsProfxEval.IndexFieldNames := 'PROFID';
   xProfor := DMLOG.cdsRegEval.FieldByName('PROFID').AsString;
   xTotal := 0;
   While Not DMLOG.cdsRegEval.Eof Do
   Begin
      If xProfor = DMLOG.cdsRegEval.FieldByName('PROFID').AsString Then
      Begin
         xTotal := xTotal + DMLOG.cdsRegEval.FieldByName('RESULTADO').AsFloat;
         DMLOG.cdsProfxEval.SetKey;
         DMLOG.cdsProfxEval.FieldByName('PROFID').AsString := xProfor;
         If DMLOG.cdsProfxEval.GotoKey Then
         Begin
            DMLOG.cdsProfxEval.Edit;
            DMLOG.cdsProfxEval.FieldByName('TOTAL').AsFloat := xTotal;
         End;
      End
      Else
      Begin
         DMLOG.cdsProfxEval.SetKey;
         DMLOG.cdsProfxEval.FieldByName('PROFID').AsString := xProfor;
         If DMLOG.cdsProfxEval.GotoKey Then
         Begin
            DMLOG.cdsProfxEval.Edit;
            DMLOG.cdsProfxEval.FieldByName('TOTAL').AsFloat := xTotal;
         End;
         xProfor := DMLOG.cdsRegEval.FieldByName('PROFID').AsString;
         xTotal := 0;
         xTotal := xTotal + DMLOG.cdsRegEval.FieldByName('RESULTADO').AsFloat
      End;
      DMLOG.cdsRegEval.next;
   End;
   DMLOG.cdsRegEval.IndexFieldNames := 'CCOCODID;ARTID;PROFID';
   DMLOG.cdsRegEval.enablecontrols;
   MuestraGrupos;
   xEvalua := True;
   Screen.Cursor := crDefault;
End;

Procedure TFEvalProforma.Compara;
Var
   xArtid, xCCOCOID: String;
   xPtos: Integer;
   xValor: Double;
Begin
   DMLOG.cdsEval.first;
  //** como la tendencia es <, y el Select esta ordenado por CCOCODID,VALOR,PROFID
  //** se toma el primer registro como ganador
  //** y sus datos son comparados con otros si hubieran
   xCCOCOID := DMLOG.cdsEval.fieldByName('CCOCODID').AsString;
   xValor := DMLOG.cdsEval.fieldByName('VALOR').AsFloat;
   xPtos := DMLOG.cdsEval.fieldByName('CCOPTOS').AsInteger;
   xArtid := DMLOG.cdsEval.fieldByName('ARTI').AsString;
   While Not DMLOG.cdsEval.Eof Do
   Begin
    //** Si la Condición y el articulo son iguales
      If (xCCOCOID = DMLOG.cdsEval.fieldByName('CCOCODID').AsString) And
         (xArtid = DMLOG.cdsEval.fieldByName('ARTI').AsString) Then
      Begin
      //** si el valor es = al del ganador
         If (xValor = DMLOG.cdsEval.fieldByName('VALOR').AsFloat) Then
         Begin
        //** graba en la LOG326
            DMLOG.cdsRegEval.SetKey;
            DMLOG.cdsRegEval.FieldByName('PROFID').AsString := DMLOG.cdsEval.fieldByName('PROFID').AsString;
            DMLOG.cdsRegEval.FieldByName('CCOCODID').AsString := DMLOG.cdsEval.fieldByName('CCOCODID').AsString;
            DMLOG.cdsRegEval.FieldByName('ARTI').AsString := DMLOG.cdsEval.fieldByName('ARTI').AsString;
            If DMLOG.cdsRegEval.GotoKey Then
            Begin
               DMLOG.cdsRegEval.Edit;
               DMLOG.cdsRegEval.fieldByName('RESULTADO').AsFloat := xPtos * xValor;
               DMLOG.cdsRegEval.Post;
            End;
         End
         Else
         Begin
        //** graba en la LOG326
            DMLOG.cdsRegEval.SetKey;
            DMLOG.cdsRegEval.FieldByName('PROFID').AsString := DMLOG.cdsEval.fieldByName('PROFID').AsString;
            DMLOG.cdsRegEval.FieldByName('CCOCODID').AsString := DMLOG.cdsEval.fieldByName('CCOCODID').AsString;
            DMLOG.cdsRegEval.FieldByName('ARTI').AsString := DMLOG.cdsEval.fieldByName('ARTI').AsString;
            If DMLOG.cdsRegEval.GotoKey Then
            Begin
               DMLOG.cdsRegEval.Edit;
               DMLOG.cdsRegEval.fieldByName('RESULTADO').AsFloat := xPtos * DMLOG.cdsEval.fieldByName('VALOR').AsFloat;
               DMLOG.cdsRegEval.Post;
            End;
         End;
      End
      Else
      Begin
      //** Cuando la condicion varia o el articulo, se vuelve a tomar el valor como ganador
         xCCOCOID := DMLOG.cdsEval.fieldByName('CCOCODID').AsString;
         xValor := DMLOG.cdsEval.fieldByName('VALOR').AsFloat;
         xPtos := DMLOG.cdsEval.fieldByName('CCOPTOS').AsInteger;
         xArtid := DMLOG.cdsEval.fieldByName('ARTI').AsString;
      //** se graba
         DMLOG.cdsRegEval.SetKey;
         DMLOG.cdsRegEval.FieldByName('PROFID').AsString := DMLOG.cdsEval.fieldByName('PROFID').AsString;
         DMLOG.cdsRegEval.FieldByName('CCOCODID').AsString := DMLOG.cdsEval.fieldByName('CCOCODID').AsString;
         DMLOG.cdsRegEval.FieldByName('ARTI').AsString := DMLOG.cdsEval.fieldByName('ARTI').AsString;
         If DMLOG.cdsRegEval.GotoKey Then
         Begin
            DMLOG.cdsRegEval.Edit;
            DMLOG.cdsRegEval.fieldByName('RESULTADO').AsFloat := xPtos * xValor;
            DMLOG.cdsRegEval.Post;
         End;
      End;
      DMLOG.cdsEval.next;
   End;
End;

Procedure TFEvalProforma.dbgResultadoDblClick(Sender: TObject);
Var
   ssql: String;
Begin
   If xEvalua Then
   Begin
      pnlVisar.Height := 209;
      pnlVisar.Left := 37;
      pnlVisar.Top := 188;
      pnlVisar.Width := 565;
      pnlVisar.Visible := true;
      dbgResultado.Enabled := false;
      pnlBtns.Enabled := false;
      dbrgVisado.ItemIndex := 1;
      ssql := 'PROFID=' + quotedstr(DMLOG.cdsProfxEval.fieldbyname('PROFID').AsString);
      dbreMotivos.Text := DMLOG.displaydescrip('prvProforma', 'LOG312', 'PROFOBS', ssql, 'PROFOBS');
      edtDatosProf.Text := 'Proforma:' + DMLOG.cdsProfxEval.fieldbyname('PROFID').AsString + ',  '
         + 'Total Punt:' + DMLOG.cdsProfxEval.fieldbyname('TOTAL').AsString + ',  '
         + 'Estado Actual :' + DMLOG.cdsProfxEval.fieldbyname('EVALU').AsString + ',  '
         + 'Proveedor:' + DMLOG.cdsProfxEval.fieldbyname('PROVDES').AsString;
      pnlVisar.Visible := True;
      dbrgVisado.Enabled := True;
      If DMLOG.wNoPanel = 0 Then
      Begin
         If DMLOG.cdsProfxEval.fieldbyname('EVALU').AsString = 'Pendiente por Evaluar' Then
         Begin
            dbrgVisado.OnClick(Sender);
            dbrgVisado.Enabled := False;
            pnlVisar.Visible := true;
         End
         Else
            If DMLOG.cdsProfxEval.fieldbyname('EVALU').AsString = 'Evaluado y Aceptado' Then
            Begin
               dbrgVisado.ItemIndex := 0;
               Information('Adquisiciones', 'Ya Fue Evaluado y Aceptado esta Proforma');
            End;
         dbrgVisado.Enabled := False;
      End;
   End;
End;

Procedure TFEvalProforma.Z2bbtnOkResulClick(Sender: TObject);
Var
   vestado, vestdes: String;
   xObser: String;
   xEdicion: String;
Begin
   Screen.Cursor := crHourGlass;
   xObser := dbreMotivos.Text;
   If dbrgVisado.ItemIndex = 0 Then
      vestado := 'A'
   Else
      If dbrgVisado.ItemIndex = 1 Then
         vestado := 'D';

   vestdes := '';
   If vestado = 'A' Then
      vestdes := 'Evaluado y Aceptado'
   Else
      If vestado = 'D' Then
         vestdes := 'Evaluado y Descartado';
   DMLOG.cdsDProforma.Close;
   DMLOG.cdsDProforma.DataRequest('SELECT * FROM LOG313 WHERE PROFID=''' + DMLOG.cdsProfxEval.FieldByName('PROFID').AsString + '''');
   DMLOG.cdsDProforma.Open;
   DMLOG.cdsDProforma.First;
   While Not DMLOG.cdsDProforma.Eof Do
   Begin
      If DMLOG.cdsDProforma.fieldbyname('PROFID').AsString = DMLOG.cdsProfxEval.FieldByName('PROFID').AsString Then
      Begin
         DMLOG.cdsDProforma.Edit;
         DMLOG.cdsDProforma.FieldByName('DPROFEVAL').value := vestado;
         DMLOG.cdsDProforma.Post;
      End;
      DMLOG.cdsDProforma.Next;
   End;
   DMLOG.cdsProforma.Close;
   DMLOG.cdsProforma.DataRequest('SELECT * FROM LOG312 WHERE PROFID=''' + DMLOG.cdsProfxEval.FieldByName('PROFID').AsString + '''');
   DMLOG.cdsProforma.Open;
   DMLOG.cdsProforma.First;
   While Not DMLOG.cdsProforma.Eof Do
   Begin
      If DMLOG.cdsProforma.fieldbyname('PROFID').AsString = DMLOG.cdsProfxEval.FieldByName('PROFID').AsString Then
      Begin
         DMLOG.cdsProforma.Edit;
         DMLOG.cdsProforma.FieldByName('PROFEVAL').value := vestado;
         DMLOG.cdsProforma.FieldByName('PROFOBS').value := xObser;
         DMLOG.cdsProforma.Post;
      End;
      DMLOG.cdsProforma.Next;
   End;
   If DMLOG.cdsSolCot.fieldbyname('PROFEVAL').AsString <> 'E' Then
   Begin
      DMLOG.cdsSolCot.Edit;
      DMLOG.cdsSolCot.fieldbyname('PROFEVAL').AsString := 'E';
      DMLOG.cdsSolCot.Post;
   End;
   DMLOG.cdsProfxEval.Edit;
   DMLOG.cdsProfxEval.FieldByName('EVALU').AsString := vestdes;
   DMLOG.cdsProfxEval.Post;
   Screen.Cursor := crDefault;
   DMLOG.ControlTran(0, Nil, '');

   Screen.Cursor := crHourGlass;
   ActuaGrid;
   Screen.Cursor := crDefault;
   Z2bbtnCancelResul.Click;
   DMLOG.wNoPanel := 0;
End;

Procedure TFEvalProforma.Z2bbtnCancelResulClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   dbgResultado.Enabled := True;
   pnlBtns.Enabled := true;
   DMLOG.cdsProfxEval.CancelUpdates;
   If (DMLOG.cdsRegEval.ChangeCount > 0) Or (DMLOG.cdsRegEval.Modified) Then
      DMLOG.cdsRegEval.CancelUpdates;
   pnlVisar.Visible := false;
   Screen.Cursor := crDefault;
   Z2bbtnAcepta.Click;
End;

Procedure TFEvalProforma.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   xActivo := False;
   DMLOG.cdsProfxEval.CancelUpdates;
   If (DMLOG.cdsRegEval.ChangeCount > 0) Or (DMLOG.cdsRegEval.Modified) Then
      DMLOG.cdsRegEval.CancelUpdates;
   EliminaGrupos;

   If DMLOG.wTipoAdicion = 'xFiltro' Then
   Begin
      DMLOG.ActualizaFiltro(Mtx3000, DMLOG.cdsReqAut, DMLOG.wModo);
   End;

   Action := CAFree;
End;

Procedure TFEvalProforma.dblcMotivosChange(Sender: TObject);
Var
   Vmotivo: String;
Begin
   If dbrgVisado.ItemIndex = 0 Then
      vmotivo := 'Aceptado ' + dblcMotivos.Text; //+', '+#13;
   If dbrgVisado.ItemIndex = 1 Then
      vmotivo := 'Descartado ' + dblcMotivos.Text; //+', '+#13;
   If dblcMotivos.Text <> '' Then
      If Length(Trim(dbreMotivos.Text)) > 1 Then
         dbreMotivos.Text := Trim(dbreMotivos.Text) + ', ' + #13 + vmotivo
      Else
         dbreMotivos.Text := vmotivo;
End;

//** seteo los colores del grid de Resultados

Procedure TFEvalProforma.dbgResultadoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
//var
 //xz : Integer;
Begin
 //** si la evaluacón ya fue hecha
   If xEvalua Then
   Begin
  //** si es 'Evaluado y Aceptado'
      If DMLOG.cdsProfxEval.fieldbyname('EVALU').AsString = 'Evaluado y Aceptado' Then
         ABrush.color := clLime
      Else
         ABrush.Color := clwhite;
      If highlight Then
         Afont.color := clnavy;
   End;
End;

//** seteo los colores del grid de Evaluacion
Procedure TFEvalProforma.dbgEvaluacionCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   If (Field.FieldName = 'RESULTADO') Then
   Begin
      If (Field.Text <> '0') Then
      Begin
         AFont.Color := clRed;
         If (Not Highlight) Then ABrush.Color := clYellow;
      End;
   End;
End;

Procedure TFEvalProforma.MuestraGrupos;
Var
   xCReal, xIndex: String;
   ca: Integer;
Begin
   wGrupoCols := 1; //seGrupo.Value;
   If wGrupoCols > 0 Then
   Begin
      EliminaGrupos;
      // añadido para probar UsuarioSQL
      DMLOG.cdsRegEval.Filtered := False;
      DMLOG.cdsRegEval.Filter := '';
      DMLOG.cdsRegEval.Filtered := True;
      For ca := 1 To wGrupoCols Do
      Begin
         xCReal := 'CCOCODDESC'; // lbCamposReal.Items.Strings[ca-1];
         If ca = 1 Then
            xIndex := xCReal
         Else
            xIndex := xIndex + ';' + xCReal;
      End;
      If DMLOG.cdsRegEval.IndexName = 'XXX' Then
         DMLOG.cdsRegEval.DeleteIndex('XXX');
      DMLOG.cdsRegEval.AddIndex('XXX', xIndex + ';ARTID;PROFID', [ixCaseInsensitive], '', '', wGrupoCols);
      DMLOG.cdsRegEval.IndexName := 'XXX';

      For ca := 1 To wGrupoCols Do
      Begin
         xCReal := 'CCOCODDESC'; //lbCamposReal.Items.Strings[ca-1];
         DMLOG.cdsRegEval.Aggregates.Add;
         DMLOG.cdsRegEval.Aggregates[ca - 1].AggregateName := xCReal;
         DMLOG.cdsRegEval.Aggregates[ca - 1].GroupingLevel := ca;
         DMLOG.cdsRegEval.Aggregates[ca - 1].IndexName := 'XXX';
         If ca = 1 Then DMLOG.cdsRegEval.FieldByName(xCReal).OnGetText := SQLGetText1;
         DMLOG.cdsRegEval.Aggregates[ca - 1].Active := True;
      End;
      DMLOG.cdsRegEval.AggregatesActive := True;
      DMLOG.cdsRegEval.Filtered := True;
      DMLOG.cdsRegEval.First;
   End;
End;

Procedure TFEvalProforma.EliminaGrupos;
Var
   ca: Integer;
Begin
   If DMLOG.cdsRegEval.Aggregates.Count > 0 Then
   Begin
      For ca := 1 To DMLOG.cdsRegEval.Aggregates.Count Do
      Begin
         If Length(DMLOG.cdsRegEval.Aggregates[0].AggregateName) > 0 Then
            DMLOG.cdsRegEval.FieldByName(DMLOG.cdsRegEval.Aggregates[0].AggregateName).OnGetText := Nil;
         DMLOG.cdsRegEval.Aggregates[0].Active := False;
         DMLOG.cdsRegEval.Aggregates.Delete(0);
      End;
   End;
   DMLOG.cdsRegEval.AggregatesActive := False;
End;

Procedure TFEvalProforma.SQLGetText1(Sender: TField; Var Text: String; DisplayText: Boolean);
Begin
   If gbFirst In DMLOG.cdsRegEval.GetGroupState(1) Then
      Text := Sender.AsString
   Else
      Text := '';
End;

Procedure TFEvalProforma.Z2bbtnPrintClick(Sender: TObject);
Begin
   sumatoria;
  //No se Puede Por que tiene un Sub-Reporte

   Screen.Cursor := crHourGlass;
   DMLOG.CdsProfxEval.First;
   If DMLOG.CdsProfxEval.RecordCount = 1 Then
   Begin
      ppLabel5.Text := DMLOG.cdsProfxEval.FieldByName('PROVDES').AsString;
   End
   Else
      If DMLOG.CdsProfxEval.RecordCount = 2 Then
      Begin
         ppLabel5.Text := DMLOG.cdsProfxEval.FieldByName('PROVDES').AsString;
         DMLOG.cdsProfxEval.Next;
         ppLabel6.Text := DMLOG.cdsProfxEval.FieldByName('PROVDES').AsString;

         ppDBCalc2.DataField := 'R2';
         ppDBCalc6.DataField := 'R2';
         ppDBCalc8.DataField := 'V2';
         ppDBCalc9.DataField := 'V2';
      End
      Else
         If DMLOG.CdsProfxEval.RecordCount = 3 Then
         Begin
            ppLabel5.Text := DMLOG.cdsProfxEval.FieldByName('PROVDES').AsString;
            DMLOG.cdsProfxEval.Next;
            ppLabel6.Text := DMLOG.cdsProfxEval.FieldByName('PROVDES').AsString;
            DMLOG.cdsProfxEval.Next;
            ppLabel16.Text := DMLOG.cdsProfxEval.FieldByName('PROVDES').AsString;

            ppDBCalc2.DataField := 'R2';
            ppDBCalc6.DataField := 'R2';
            ppDBCalc8.DataField := 'V2';
            ppDBCalc9.DataField := 'V2';

            ppDBCalc3.DataField := 'R3';
            ppDBCalc11.DataField := 'R3';
            ppDBCalc12.DataField := 'V3';
            ppDBCalc13.DataField := 'V3';
         End
         Else
            If DMLOG.CdsProfxEval.RecordCount >= 4 Then
            Begin
               ppLabel5.Text := DMLOG.cdsProfxEval.FieldByName('PROVDES').AsString;
               DMLOG.cdsProfxEval.Next;
               ppLabel6.Text := DMLOG.cdsProfxEval.FieldByName('PROVDES').AsString;
               DMLOG.cdsProfxEval.Next;
               ppLabel16.Text := DMLOG.cdsProfxEval.FieldByName('PROVDES').AsString;
               DMLOG.cdsProfxEval.Next;
               ppLabel17.Text := DMLOG.cdsProfxEval.FieldByName('PROVDES').AsString;

               ppDBCalc2.DataField := 'R2';
               ppDBCalc6.DataField := 'R2';
               ppDBCalc8.DataField := 'V2';
               ppDBCalc9.DataField := 'V2';

               ppDBCalc3.DataField := 'R3';
               ppDBCalc11.DataField := 'R3';
               ppDBCalc12.DataField := 'V3';
               ppDBCalc13.DataField := 'V3';

               ppDBCalc4.DataField := 'R4';
               ppDBCalc14.DataField := 'R4';
               ppDBCalc15.DataField := 'V4';
               ppDBCalc16.DataField := 'V4';
            End;

   DMLOG.CdsProfxEval.First;
   ppDesigner1.Show;

   Screen.Cursor := crDefault;
End;

Procedure TFEvalProforma.Sumatoria;
Var
   sSQL, xProv, sProf: String;
   sConta: Integer;
Begin
   sConta := 0;
   Screen.Cursor := crHourGlass;
   xProv := DMLOG.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');
   sSQL := 'Select A.CIAID, A.SCCID, A.PROFID, A.CCOCODID, '
      + '          case when A.ARTID=''-'' THEN 0 ELSE A.VALOR END AS VALOR, '
      + '          case when A.ARTID=''-'' THEN A.CCOCODID ELSE A.ARTID END CODIGO, SUM(RESULTADO) AS RESULTADO, '
      + '          case when A.ARTID=''-'' THEN A.CCOCODDESC ELSE A.ARTDES END DESCRIPCION, ';
      DMLOG.cdsProfxEval.First;
      While Not DMLOG.cdsProfxEval.Eof Do
      Begin
         sConta := sConta + 1;
         sProf := DMLOG.cdsProfxEval.FieldByName('PROFID').AsString;
         sSQL := sSQL + 'case when A.PROFID=''' + sProf + ''' then sum(RESULTADO) ELSE 0 END AS R' + inttoStr(sConta) + ', '
            + '          case when A.PROFID=''' + sProf + ''' then case when A.ARTID=''-'' then 0 else sum(VALOR) end else 0 end as V' + inttoStr(sConta) + ', ';
         DMLOG.cdsProfxEval.Next;
      End;
      sSQL := sSQL + 'B.PROV, C.PROVDES, D.CIADES '
         + '  from LOG326 A, LOG312 B, TGE201 C, TGE101 D, LOG101 E '
         + ' where A.CIAID=''' + DMLOG.cdsSolCot.FieldByName('CIAID').AsString + ''' '
         + '   and A.SCCID=''' + DMLOG.cdsSolCot.FieldByName('SCCID').AsString + ''' '
         + '   and B.CIAID=A.CIAID '
         + '   and B.PROV=C.PROV '
         + '   and C.CLAUXID=' + QuotedStr(xProv)
         + '   and B.PROFID=A.PROFID '
         + '   and A.CIAID=D.CIAID '
         + '   and A.CCOCODID=E.CCOCODID '
         + ' group by E.CCOREL,A.CIAID, A.SCCID, A.CCOCODID, A.VALOR, A.ARTID, A.PROFID, A.CCOCODDESC, A.ARTDES, B.PROV, C.PROVDES, D.CIADES '
         + ' order by E.CCOREL,A.CCOCODID, CODIGO, A.PROFID';
   DMLOG.cdsReporte.Close;
   DMLOG.cdsReporte.DataRequest(sSQL);
   DMLOG.cdsReporte.Open;
   Screen.Cursor := crDefault;
End;

Procedure TFEvalProforma.ppEvalProfPreviewFormCreate(Sender: TObject);
Begin
   ppEvalProf.PreviewForm.ClientHeight := 500;
   ppEvalProf.PreviewForm.ClientWidth := 650;
   tppviewer(ppEvalProf.PreviewForm.Viewer).zoomSetting := zspageWidth;
End;

Procedure TFEvalProforma.dbrgVisadoClick(Sender: TObject);
Var
   vcaliftip, ssql: String;
Begin
   dblcMotivos.Clear;
   If dbrgVisado.ItemIndex = 0 Then
   Begin
      vcaliftip := 'A';
      lblMotivos.Caption := 'Motivos de Calificación'
   End;
   If dbrgVisado.ItemIndex = 1 Then
   Begin
      vcaliftip := 'D';
      lblMotivos.Caption := 'Motivos de Descalificación'
   End;
 { para filtar el dblcMotivos por el tipo de evaluación }
   ssql := '';
   ssql := 'Select * FROM TGE172 where TGE172.CALIFTIP =' + quotedstr(vcaliftip);
   DMLOG.cdsMotivos.Close;
   DMLOG.cdsMotivos.ProviderName := 'prvMotivos';
   DMLOG.cdsMotivos.DataRequest(sSQL);
   DMLOG.cdsMotivos.Open;
   DMLOG.cdsMotivos.First;
   dblcMotivos.Enabled := true;
   dbreMotivos.Enabled := true;
   If xActivo Then
   Begin
      sSQL := 'PROFID=' + quotedstr(DMLOG.cdsProfxEval.fieldbyname('PROFID').AsString);
      dbreMotivos.Text := DMLOG.displaydescrip('prvProforma', 'LOG312', 'PROFOBS', ssql, 'PROFOBS');
   End;
End;

Procedure TFEvalProforma.ActuaGrid;
Var
   xProv, sSQL, SCC, CIA: String;
Begin
   Screen.Cursor := crHourGlass;
   SCC := DMLOG.cdsSolCot.FieldByName('SCCID').AsString;
   CIA := DMLOG.cdsSolCot.FieldByName('CIAID').AsString;
   xProv := DMLOG.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');
   sSQL := 'Select distinct A.CIAID, A.SCCID, B.PROFID, B.PROV, C.PROVDES, 0 TOTAL, '
      + '          case when B.PROFEVAL=''P'' then ''Pendiente por Evaluar'' '
      + '               when B.PROFEVAL=''A'' then ''Evaluado y Aceptado'' '
      + '               when B.PROFEVAL=''D'' then ''Evaluado y Descartado'' '
      + '           end EVALU '
      + '     from LOG326 A, LOG312 B, TGE201 C '
      + '    where A.SCCID=' + QuotedStr(SCC)
      + '      and A.CIAID=' + QuotedStr(CIA)
      + '      and A.CIAID=B.CIAID '
      + '      and A.SCCID=B.SCCID '
      + '      and A.PROFID=B.PROFID '
      + '      and B.PROV=C.PROV '
      + '      and C.CLAUXID='+QuotedStr(xProv);
   DMLOG.cdsProfxEval.Close;
   FEvalProforma.dbgResultado.Selected.Clear;
   FEvalProforma.dbgResultado.Selected.Add('PROFID' + #9 + '9' + #9 + 'Proforma');
   FEvalProforma.dbgResultado.Selected.Add('PROV' + #9 + '10' + #9 + 'Proveedor');
   FEvalProforma.dbgResultado.Selected.Add('PROVDES' + #9'32' + #9 + 'Nombre');
   FEvalProforma.dbgResultado.Selected.Add('EVALU' + #9'18' + #9 + 'Evaluación');
   FEvalProforma.dbgResultado.Selected.Add('TOTAL' + #9 + '7' + #9 + 'Total');

   DMLOG.cdsProfxEval.DataRequest(sSQL);
   DMLOG.cdsProfxEval.Open;
   Screen.Cursor := crDefault;
End;

Procedure TFEvalProforma.FormShow(Sender: TObject);
Begin
   DMLOG.AccesosUsuarios(DMLOG.wModulo, DMLOG.wUsuario, '2', Screen.ActiveForm.Name);
   xActivo := True;
   xEvalua := True;
   pnlVisar.Visible := False;
End;

End.


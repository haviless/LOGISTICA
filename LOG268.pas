Unit LOG268;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG268
//Formulario               : FListaPreciosEdita
//Fecha de Creación        :
//Autor                    : Equipo de Desarrollo
//Objetivo                 : Formulario de ingreso a una lista de precio segun compañia y lista de precios requerida
// Actualizaciones
// HPC_201404_LOG          :05/09/2014 Reordenamiento de Sangría.
//                          revisión de correcta grabación de datos, no debe actualizar campo PREVEN
// HPC_201405_LOG          : 14/10/2014 Se lleva Lista de Precios de Adquisiciones Ventas a Adquisiciones SSGG


Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, DB, DBClient, wwclient, Wwdatsrc,
   StdCtrls, Buttons, Spin, ExtCtrls, wwexport, shellapi;

Type
   TFListaPreciosEdita = Class(TForm)
      dbgData: TwwDBGrid;
      cdsData: TwwClientDataSet;
      dsData: TwwDataSource;
      seDcto: TSpinEdit;
      BitBtn1: TBitBtn;
      bbtnAumento: TBitBtn;
      Label1: TLabel;
      bbtnGrabar: TBitBtn;
      bbtnMarcar: TBitBtn;
      BitBtn4: TBitBtn;
      dbgStock: TwwDBGrid;
      Panel1: TPanel;
      lbArt: TLabel;
      lbDes: TLabel;
      dbgIng: TwwDBGrid;
      bbtnExcel: TBitBtn;
      rbBase: TRadioGroup;
      GroupBox1: TGroupBox;
      seDec: TSpinEdit;
      Procedure FormShow(Sender: TObject);
      Procedure bbtnAumentoClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure bbtnMarcarClick(Sender: TObject);
      Procedure BitBtn4Click(Sender: TObject);
      Procedure bbtnGrabarClick(Sender: TObject);
      Procedure dbgDataTitleButtonClick(Sender: TObject; AFieldName: String);
      Procedure dbgDataDblClick(Sender: TObject);
      Procedure dbgDataRowChanged(Sender: TObject);
      Procedure bbtnExcelClick(Sender: TObject);
      Procedure dbgDataCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
   Private
    { Private declarations }
   Public
    { Public declarations }
      dIGV: Double;
      Procedure ExportaGridExcel(xDataGrid: TwwDBGrid; xFileName: String);
   End;

Var
   FListaPreciosEdita: TFListaPreciosEdita;

Implementation

{$R *.dfm}

Uses LOGDM1, oaAD1000;

Procedure TFListaPreciosEdita.ExportaGridExcel(xDataGrid: TwwDBGrid; xFileName: String);
Begin
   Screen.Cursor := crHourGlass;
   With xDataGrid, xDataGrid.ExportOptions Do
   Begin
      ExportType := wwgetSYLK;
      FileName := xFileName + '.slk';
      Save;
      If Not (esoClipboard In Options) Then
         ShellExecute(Handle, 'Open', PChar(xDataGrid.exportoptions.Filename),
            Nil, Nil, sw_shownormal);
   End;
   Screen.Cursor := crDefault;
End;

Procedure TFListaPreciosEdita.FormShow(Sender: TObject);
Begin
   Try
      Screen.Cursor := crHourGlass;

      DMLOG.BuscaQry('dspUltTGE', 'TGE108', '*', 'TASAFLG=''I'' ', 'TASAID');
      dIGV := DMLOG.cdsQry.FieldByName('TASACAN').AsFloat;

      dbgData.Selected.Clear;
      dbgData.Selected.Add('CHK' + #9 + '3' + #9 + '[x]');
      dbgData.Selected.Add('ARTID' + #9 + '09' + #9 + 'Articulo');
      dbgData.Selected.Add('ARTDES' + #9 + '32' + #9 + 'Descripción');
      dbgData.Selected.Add('NISAFREG' + #9 + '10' + #9 + 'Fecha Ult.~Compras');
      dbgData.Selected.Add('STKALM' + #9 + '05' + #9 + 'Stock');
      dbgData.Selected.Add('PRECIO_COM' + #9 + '08' + #9 + 'Precio~Compra');
      dbgData.Selected.Add('LPREPREGIGV' + #9 + '08' + #9 + 'Precio~Venta');
      dbgData.Selected.Add('PRECIO_NEW' + #9 + '08' + #9 + 'Precio~Editado');
      dbgData.SetControlType('CHK', fctCheckBox, 'S;N');

      cdsData.Close;
      cdsData.FieldDefs.Clear;
      cdsData.FieldDefs.Add('CHK', ftString, 1, False);
      cdsData.FieldDefs.Add('ARTID', ftString, 8, False);
      cdsData.FieldDefs.Add('ARTDES', ftString, 50, False);
      cdsData.FieldDefs.Add('NISAFREG', ftDate, 0, False);
      cdsData.FieldDefs.Add('STKALM', ftInteger, 0, False);
      cdsData.FieldDefs.Add('PRECIO_COM', ftFloat, 0, False);
      cdsData.FieldDefs.Add('LPREPREGIGV', ftFloat, 0, False);
      cdsData.FieldDefs.Add('PRECIO_NEW', ftFloat, 0, False);
      cdsData.CreateDataSet;
      cdsData.Open;
      cdsData.EmptyDataSet;

      cdsData.FieldByName('ARTID').ReadOnly := False;
      cdsData.FieldByName('ARTDES').ReadOnly := False;
      cdsData.FieldByName('NISAFREG').ReadOnly := False;
      cdsData.FieldByName('STKALM').ReadOnly := False;
      cdsData.FieldByName('PRECIO_COM').ReadOnly := False;
      cdsData.FieldByName('LPREPREGIGV').ReadOnly := False;

      TNumericField(cdsData.FieldByName('PRECIO_COM')).DisplayFormat := '###,##0.00';
      TNumericField(cdsData.FieldByName('LPREPREGIGV')).DisplayFormat := '###,##0.00';
      TNumericField(cdsData.FieldByName('PRECIO_NEW')).DisplayFormat := '###,##0.00';
      TNumericField(cdsData.FieldByName('PRECIO_NEW')).EditFormat := '#####0.00';

      GLPrecio.FMant.cds2.First;
      While Not GLPrecio.FMant.cds2.Eof Do
      Begin
         cdsData.Insert;
         cdsData.FieldByName('CHK').AsString := '';
         cdsData.FieldByName('ARTID').AsString := GLPrecio.FMant.cds2.FieldByname('ARTID').AsString;
         cdsData.FieldByName('ARTDES').AsString := GLPrecio.FMant.cds2.FieldByName('ARTDES').AsString;
         cdsData.FieldByName('STKALM').AsString := GLPrecio.FMant.cds2.FieldByName('STKALM').AsString;
         cdsData.FieldByName('LPREPREGIGV').AsString := GLPrecio.FMant.cds2.FieldByName('LPREPREGIGV').AsString;
         cdsData.FieldByName('PRECIO_NEW').AsString := GLPrecio.FMant.cds2.FieldByName('LPREPREGIGV').AsString;

      // Inicio HPC_201404_LOG
         xSQL := 'Select A.ARTID, B.NISAFREG, A.NISAID, KDXCNTG, ROUND(A.ARTPCG * (1 + 0.18), 2) COSTOIGVS '
               + '  From LOG315 A, LOG314 B '
               + ' Where A.CIAID=' + QuotedStr(GLPrecio.FMant.cds2.FieldByname('CIAID').AsString)
               + '   and A.TINID=''20'' AND A.NISATIP=''INGRESO'' '
               + '   and A.TRIID IN (''01'', ''02'', ''09'', ''11'', ''16'') '
               + '   and A.ARTID = ' + QuotedStr(cdsData.FieldByName('ARTID').AsString)
               + '   and A.NISAFREG >= ''01/01/2005'' '
               + '   and A.CIAID=B.CIAID(+) and A.TINID=B.TINID(+) and A.TDAID=B.TDAID(+) and A.ALMID=B.ALMID(+) '
               + '   and A.NISATIP=B.NISATIP(+) and A.NISAID=B.NISAID(+) and B.NISSIT(+)=''ACEPTADO'' '
               + ' ORDER BY B.NISAFREG DESC';
      // Fin HPC_201404_LOG

         DMLOG.cdsQry12.Close;
         DMLOG.cdsQry12.DataRequest(xSQL);
         DMLOG.cdsQry12.Open;
         cdsData.FieldByName('PRECIO_COM').AsString := DMLOG.cdsQry12.FieldByName('COSTOIGVS').AsString;
         cdsData.FieldByName('NISAFREG').AsString := DMLOG.cdsQry12.FieldByName('NISAFREG').AsString;

         cdsData.Post;
         GLPrecio.FMant.cds2.Next;
      End;

      DMLOG.cdsQry12.Close;

      cdsData.FieldByName('ARTID').ReadOnly := True;
      cdsData.FieldByName('ARTDES').ReadOnly := True;
      cdsData.FieldByName('STKALM').ReadOnly := True;
      cdsData.FieldByName('NISAFREG').ReadOnly := True;
      cdsData.FieldByName('LPREPREGIGV').ReadOnly := True;
      cdsData.FieldByName('PRECIO_COM').ReadOnly := True;
      Screen.Cursor := crDefault;
   Finally
      Screen.Cursor := crDefault;
   End;

End;

Procedure TFListaPreciosEdita.bbtnAumentoClick(Sender: TObject);
Var
   nPrecio: Double;
   sCampo_P: String;
Begin

   If rbBase.ItemIndex = 0 Then
      sCampo_P := 'LPREPREGIGV'
   Else
      sCampo_P := 'PRECIO_COM';

   cdsData.First;
   While Not cdsData.Eof Do
   Begin
      cdsData.Edit;
      If cdsData.FieldByName('CHK').AsString = 'S' Then
      Begin

         nPrecio := cdsData.FieldByName(sCampo_P).AsFloat * seDcto.Value / 100;

         cdsData.FieldByName('PRECIO_NEW').AsFloat := FRound(cdsData.FieldByName(sCampo_P).AsFloat + nPrecio, 10, seDec.value);

         cdsData.Post;
      End;
      cdsData.Next;
   End;
   cdsData.First;
End;

Procedure TFListaPreciosEdita.BitBtn1Click(Sender: TObject);
Var
   nPrecio: Double;
   sCampo_P: String;
Begin

   If rbBase.ItemIndex = 0 Then
      sCampo_P := 'LPREPREGIGV'
   Else
      sCampo_P := 'PRECIO_COM';

   cdsData.First;
   While Not cdsData.Eof Do
   Begin
      cdsData.Edit;
      If cdsData.FieldByName('CHK').AsString = 'S' Then
      Begin

         nPrecio := cdsData.FieldByName(sCampo_P).AsFloat * seDcto.Value / 100;

         cdsData.FieldByName('PRECIO_NEW').AsFloat := FRound(cdsData.FieldByName(sCampo_P).AsFloat - nPrecio, 10, seDec.Value);

         cdsData.Post;
      End;
      cdsData.Next;
   End;
   cdsData.First;
End;

Procedure TFListaPreciosEdita.bbtnMarcarClick(Sender: TObject);
Begin
   cdsData.First;
   While Not cdsData.Eof Do
   Begin
      cdsData.Edit;
      cdsData.FieldByName('CHK').AsString := 'S';
      cdsData.Post;
      cdsData.Next;
   End;
   cdsData.First;
End;

Procedure TFListaPreciosEdita.BitBtn4Click(Sender: TObject);
Begin
   cdsData.First;
   While Not cdsData.Eof Do
   Begin
      cdsData.Edit;
      cdsData.FieldByName('CHK').AsString := 'N';
      cdsData.Post;
      cdsData.Next;
   End;
   cdsData.First;
End;

Procedure TFListaPreciosEdita.bbtnGrabarClick(Sender: TObject);
Begin

   cdsData.First;
   While Not cdsData.Eof Do
   Begin
      If cdsData.FieldByName('PRECIO_NEW').AsFloat < 0 Then
      Begin
         ShowMessage('Error : Precio no puede ser Negativo');
         Exit;
      End;
      cdsData.Next;
   End;

   If MessageDlg('Grabar Nuevos Precios de Venta. ¿ Esta Seguro ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin

      cdsData.First;
      While Not cdsData.Eof Do
      Begin
         xSQL := 'Select * from FAC201 '
            + 'where CIAID=' + quotedstr(GLPrecio.FMant.cds2.FieldByname('CIAID').AsString)
            + '  and TLISTAID=' + quotedStr(GLPrecio.FMant.cds2.FieldByname('TLISTAID').AsString)
            + '  and ARTID=' + quotedstr(cdsData.fieldbyname('ARTID').AsString);
         DMLOG.cdsLPrecio.Close;
         DMLOG.cdsLPrecio.IndexFieldNames := '';
         DMLOG.cdsLPrecio.Filter := '';
         DMLOG.cdsLPrecio.Filtered := False;
         DMLOG.cdsLPrecio.DataRequest(xSQL);
         DMLOG.cdsLPrecio.Open;

         If cdsData.FieldByName('CHK').AsString = 'S' Then
         Begin
            DMLOG.cdsLPrecio.Edit;
            DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat := FRound(cdsData.FieldByName('PRECIO_NEW').AsFloat / (1 + (dIGV / 100)), 15, 3);
            DMLOG.cdsLPrecio.fieldbyname('LPREPREGMO').AsFloat := DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat;
            DMLOG.cdsLPrecio.fieldbyname('LPREPREGMN').AsFloat := DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat;
            DMLOG.cdsLPrecio.fieldbyname('LPREPREGME').AsFloat := 0;
            DMLOG.cdsLPrecio.Post;
            DMLOG.AplicaDatos(DMLOG.cdsLPrecio, 'LPRECIO');
         End;
         cdsData.Next;
      End;

      GLPrecio.FMant.cds2.Refresh;
      ShowMessage('Precios Actualizados')

   End;
End;

Procedure TFListaPreciosEdita.dbgDataTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
   cdsData.IndexFieldNames := AFieldName;
End;

Procedure TFListaPreciosEdita.dbgDataDblClick(Sender: TObject);
Var
   xSQL, sAno: String;
   xAno, xMes, xDia: word;
Begin
   DecodeDate(DateS, xAno, xMes, xDia);
   sAno := IntToStr(xAno);

// Inicio HPC_201404_LOG
   xSQL := 'Select A.ALMID, B.ALMDES, A.ARTCONT, A.ARTID, '
         + '       nvl(A.STKSACTG,0) - nvl(A.STKRACTG,0) AS STKSACTG '
         + '  from LOG316 A, TGE151 B '
         + ' where A.CIAID=' + QuotedStr(GLPrecio.FMant.cds2.FieldByname('CIAID').AsString)
         + '   and A.ARTID=' + QuotedStr(cdsData.fieldbyname('ARTID').AsString)
         + '   and A.STKANO=' + QuotedStr(sAno)
         + '   and A.CIAID=B.CIAID AND A.ALMID = B.ALMID'
         + '   and B.TINID=A.TINID ';
   DMLOG.cdsSTK.Close;
   DMLOG.cdsSTK.IndexFieldNames := '';
   DMLOG.cdsSTK.Filter := '';
   DMLOG.cdsSTK.Filtered := False;
   DMLOG.cdsSTK.DataRequest(xSQL);
   DMLOG.cdsSTK.Open;

   lbArt.Caption := 'Articulo: ' + cdsData.FieldByName('ARTID').AsString;
   lbDes.Caption := cdsData.FieldByName('ARTDES').AsString;

   dbgStock.Selected.Clear;
   dbgStock.Selected.Add('ALMID'#9'3'#9'Id'#9'F');
   dbgStock.Selected.Add('ALMDES'#9'13'#9'Almacén'#9'F');
   dbgStock.Selected.Add('STKSACTG'#9'06'#9'Stock'#9'F');
   dbgStock.DataSource := DMLOG.dsSTK;
   dbgStock.SetFocus;

// Inicio HPC_201404_LOG
   xSQL := 'Select A.ARTID, B.NISAFREG, A.NISAID, KDXCNTG, ROUND(A.ARTPCG * (1 + 0.18), 2) COSTOIGVS '
         + '  From LOG315 A, LOG314 B '
         + ' Where A.CIAID=' + QuotedStr(GLPrecio.FMant.cds2.FieldByname('CIAID').AsString)
         + '   and A.TINID=''20'' AND A.NISATIP=''INGRESO'' '
         + '   and A.TRIID IN (''01'', ''02'', ''09'', ''11'', ''16'') '
         + '   and A.ARTID = ' + QuotedStr(cdsData.FieldByName('ARTID').AsString)
         + '   and A.NISAFREG >= ''01/01/2005'' '
         + '   and A.CIAID=B.CIAID(+) and A.TINID=B.TINID(+) and A.TDAID=B.TDAID(+) and A.ALMID=B.ALMID(+) '
         + '   and A.NISATIP=B.NISATIP(+) and A.NISAID=B.NISAID(+) and B.NISSIT(+)=''ACEPTADO'' '
         + ' Order by B.NISAFREG DESC';
// Fin HPC_201404_LOG
   DMLOG.cdsQry12.Close;
   DMLOG.cdsQry12.DataRequest(xSQL);
   DMLOG.cdsQry12.Open;

   dbgIng.Selected.Clear;
   dbgIng.Selected.Add('NISAFREG'#9'10'#9'Fecha~Compra'#9'F');
   dbgIng.Selected.Add('KDXCNTG'#9'05'#9'Cant.'#9'F');
   dbgIng.Selected.Add('COSTOIGVS'#9'08'#9'Costo'#9'F');
   dbgIng.DataSource := DMLOG.dsQry12;
   dbgIng.SetFocus;

End;

Procedure TFListaPreciosEdita.dbgDataRowChanged(Sender: TObject);
Begin
   lbArt.Caption := 'Articulo: ';
   lbDes.Caption := '';
   DMLOG.cdsSTK.Close;
   DMLOG.cdsQry12.Close;
End;

Procedure TFListaPreciosEdita.bbtnExcelClick(Sender: TObject);
Begin
   ExportaGridExcel(dbgData, 'Exporta');
End;

Procedure TFListaPreciosEdita.dbgDataCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
Begin
   If Field.FieldName = 'PRECIO_NEW' Then
   Begin
      ABrush.Color := clInfoBk;
      AFont.Color := clNavy;
   End;

End;

End.


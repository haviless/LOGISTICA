Unit LOG600;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG600
//Formulario               : FToolLPrecio
//Fecha de Creación        :
//Autor                    : Equipo de Desarrollo
//Objetivo                 : Barra de tareas de la Lista de Precios

// HPC_201405_LOG          : 10/10/2014 Se adiciona una etiqueta que alerta cuando esta en estado de consulta
//                         : 14/10/2014 Se lleva Lista de Precios de Adquisiciones Ventas a Adquisiciones SSGG
//                           14/10/2014 Reordenamiento de Sangría
// HPC_201701_LOG            20/06/2017 Recálculo de Stock por Artículo

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ExtCtrls, wwdblook, Buttons, ppProd, ppClass, ppReport, ppComm,
   ppRelatv, ppCache, ppDB, ppDBPipe, ppEndUsr, ppBands, ComCtrls, ppCtrls,
   ppPrnabl, ppVar, ppViewr, StrContainer, ppTypes, oaVariables, ppParameter,
   ppBarCod, msgdlgs;

Type
   TFToolLPrecio = Class(TForm)
      pnlTool: TPanel;
      ppdbLPrecio: TppDBPipeline;
      ppReporte: TppReport;
      ppDesigner1: TppDesigner;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      dtpDesde: TDateTimePicker;
      dtpHasta: TDateTimePicker;
      Z1sbLPrecio: TBitBtn;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppDBText4: TppDBText;
      ppLine1: TppLine;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel17: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText11: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppLine2: TppLine;
      ppDBCalc1: TppDBCalc;
      ppLabel16: TppLabel;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppLabel15: TppLabel;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      z1sbImporta: TBitBtn;
      z1sbExporta: TBitBtn;
      scFILES: TStrContainer;
      sd: TSaveDialog;
      od: TOpenDialog;
      BitBtn1: TBitBtn;
      Timer1: TTimer;
      bbtnCodBar: TBitBtn;
      ppdb4: TppDBPipeline;
      ppr4: TppReport;
      ppHeaderBand3: TppHeaderBand;
      ppDetailBand3: TppDetailBand;
      ppDBBarCode1: TppDBBarCode;
      ppDBText12: TppDBText;
      ppLabel18: TppLabel;
      ppDBText13: TppDBText;
      ppLabel19: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppImage1: TppImage;
      ppImage2: TppImage;
      ppFooterBand3: TppFooterBand;
      ppParameterList2: TppParameterList;
      ppd4: TppDesigner;
      bbtnBarCat: TBitBtn;
      bbtnCie: TBitBtn;
      dblcTLista: TwwDBLookupCombo;
      BitBtn2: TBitBtn;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
      pnlCons: TPanel;
   // Inicio HPC_201702_LOG
   // 20/06/2017 Botón de Recálculo de Stock
      bbtnReproStock: TBitBtn;
   // Fin HPC_201702_LOG
      Procedure Z1sbLPrecioClick(Sender: TObject);
      Procedure ppReportePreviewFormCreate(Sender: TObject);
      Procedure z1sbImportaClick(Sender: TObject);
      Procedure z1sbExportaClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure Timer1Timer(Sender: TObject);
      Procedure bbtnCodBarClick(Sender: TObject);
      Procedure bbtnBarCatClick(Sender: TObject);
      Procedure bbtnCieClick(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
   // Inicio HPC_201702_LOG
   // 20/06/2017 Rutina de Recálculo de Stock
      Procedure bbtnReproStockClick(Sender: TObject);
   // Fin HPC_201702_LOG
   Private
    { Private declarations }
      Procedure Importa;
      Procedure VerificaCabecera;
      Procedure ActualizaFac201;
   Public
  { Public declarations }
      Procedure InsDataFil;
   End;

Var
   FToolLPrecio: TFToolLPrecio;
   xwhere, xSQL: String;
   Y, M, D: Word;
   pnl: TPanel;
   bCia, bTin, bTli, bGra, bArt, bTMo, bPre: boolean;
   xAccesoBotones: Boolean;

Implementation

Uses LOGDM1, oaAD1000, LOG260, LOG268; // MsgDlgs, //, LOG263;

{$R *.DFM}

Procedure TFToolLPrecio.InsDataFil;
Var
   sTOTAL, sWhere: String;
   xSQL, SalIniHas: String;
   D, M, Y, DH, MH, YH: Word;
   iX, iY: integer;
Begin
   Screen.Cursor := crHourGlass;
   DecodeDate(dtpDesde.Date, Y, M, D);
   DecodeDate(dtpHasta.Date, YH, MH, DH);
   If D = 1 Then
      SalIniHas := IntToStr(D) + '/' + IntToStr(M) + '/' + IntToStr(Y)
   Else
      SalIniHas := IntToStr(D - 1) + '/' + IntToStr(M) + '/' + IntToStr(Y);

   SalIniHas := QuotedStr(FormatDateTime(DMLOG.wFormatFecha, StrToDateTime(SalIniHas)));

   xSQL := 'DELETE FROM LOG323 WHERE USUARIO=''' + DMLOG.wUsuario + '''';
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xSQL := GLPrecio.FMant.SQL;
   For iX := 0 To Length(xsql) Do
   Begin
      If copy(xSQL, iX, 5) = 'WHERE' Then
      Begin
         xwhere := copy(xSQL, iX + 6, length(xSQL));
         break;
      End;
   End;
   For iY := 0 To Length(xWhere) Do
   Begin
      If copy(xWhere, iY, 8) = 'ORDER BY' Then
      Begin
         xwhere := copy(xWhere, 1, iY - 2);
         break;
      End;
   End;

   sWhere := xWhere;
   Screen.Cursor := crHourGlass;
   sTOTAL := 'INSERT INTO LOG323(CIAID, LOCID, ALMID, TINID, GRARID, NISAFREG, TDAID, TDAABR, ARTFUC, ARTID, ARTDES, UNMIDG, UMEDGDES, '
      + '                        UNMIDU, UMEDUDES, NISAID, NISATIP, SALDOG, SALDOU, MONTOG, MONTOU, KDXCNTG, KDXCNTU, KDXCNTGI, KDXCNTUI, '
      + '                        KDXCNTGS, KDXCNTUS, ARTCPROG, ARTCPROU, KDXCPROGI, KDXCPROUI, KDXCPROGS, KDXCPROUS, USUARIO ) '
      + '     SELECT CIAID, LOCID, ALMID, TINID, GRARID, (' + SalIniHas + '), ''00'', '''', (' + SalIniHas + '), ARTID, ARTDES, UNMIDG, '
      + '            '''', UNMIDU, '''', ''Saldo Inicial'', '''', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '
      + '            0.00, 0.00, 0.00, 0.00, 0.00, ''' + DMLOG.wUsuario + ''' '
      + '       FROM FAC201 ';
   If Length(sWhere) > 0 Then
      sTOTAL := sTOTAL + 'WHERE ' + sWhere + '';
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(sTOTAL);
   Except
      Screen.Cursor := crDefault;
   End;
   Screen.Cursor := crDefault;
End;

Procedure TFToolLPrecio.Z1sbLPrecioClick(Sender: TObject);
Var
   sDesde, sHasta, sSQL, Tasa, Porc: String;
   x10: Integer;
   xPreV, xPorc, xTasa: Double;
Begin
   If GLPrecio.FMant.cds2.RecordCount = 0 Then
   Begin
      Information('Adquisiciones', 'No Existe información a Mostrar');
      Exit;
   End;

   InsDataFil;

   Screen.Cursor := crHourGlass;
   DecodeDate(Date, Y, M, D);
   sDesde := quotedStr(formatdatetime(DMLOG.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMLOG.wFormatFecha, dtpHasta.DateTime));
   Tasa := DMLOG.DisplayDescrip('PRVSQL', 'TGE128', 'TASA', 'TIPDET=''I1''', 'TASA');

   sSQL := 'Select A.*, D.CIADES, E.ARTCNTG, E.ARTCONT, F.GRARDES, ' + Porc + ' PORC, ' + Tasa + ' IGV, 0.00 TOTAL, '
      + '          NVL(B.STKRACTG,0) RESERVA, NVL(E.ARTCNTG - NVL(B.STKRACTG,0),0) DISPONIBLE '
      + '     from FAC201 A, LOG316 B, TGE101 D, TGE205 E, TGE131 F, LOG323 G '
      + '    where A.CIAID=' + QuotedStr(Trim(wCia))
      + '      and A.TLISTAID=' + QuotedStr(Trim(wLPe))
      + '      and A.CIAID=B.CIAID(+) AND A.TINID=B.TINID(+) AND A.ARTID=B.ARTID(+) AND STKANO(+)=''' + IntToStr(Y) + ''' '
      + '      and A.LOCID=B.LOCID(+) AND A.ALMID=B.ALMID(+) '
      + '      and A.CIAID=D.CIAID(+) '
      + '      and A.CIAID=E.CIAID(+) AND A.TINID=E.TINID(+) AND A.ARTID=E.ARTID(+) '
      + '      and NVL(E.ARTEST,''H'')<>''A'' '
      + '      and A.CIAID=F.CIAID(+) AND A.TINID=F.TINID(+) AND A.GRARID=F.GRARID(+) '
      + '      and A.CIAID=G.CIAID(+) AND A.TINID=G.TINID(+) AND A.ARTID=G.ARTID(+) '
      + '      and G.USUARIO(+)=' + QuotedStr(DMLOG.wUsuario)
      + '    order BY A.CIAID, A.TINID, A.GRARID, A.ARTDES';
   DMLOG.cdsReporte.Close;
   DMLOG.cdsReporte.DataRequest(sSQL);
   DMLOG.cdsReporte.Open;

   Screen.Cursor := crDefault;
   If DMLOG.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Adquisiciones', 'No Existe Información a Mostrar');
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   ppReporte.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\LPrecio.rtm';
   ppReporte.Template.LoadFromFile;

   ppLabel5.Caption := DatetoStr(Date);
   ppLabel14.Caption := DMLOG.wUsuario;
   If Trim(Porc) = '0' Then
   Begin
      ppLabel10.Visible := False;
      ppDBText6.Visible := False;
   End
   Else
   Begin
      ppLabel10.Visible := True;
      ppDBText6.Visible := True;
   End;

   Screen.Cursor := crDefault;
   ppReporte.Print;
   ppReporte.Stop;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
End;

Procedure TFToolLPrecio.ppReportePreviewFormCreate(Sender: TObject);
Begin
   ppReporte.PreviewForm.ClientHeight := 500;
   ppReporte.PreviewForm.ClientWidth := 650;
   tppviewer(ppReporte.PreviewForm.Viewer).zoomSetting := zspageWidth;
End;

Procedure TFToolLPrecio.z1sbImportaClick(Sender: TObject);
Var
   sTabla, sSQL: String;
   pos: integer;
Begin
   If od.execute Then
   Begin
      Screen.Cursor := crHourGlass;
      pnl := TPanel.Create(Self);
      pnl.Parent := GLPrecio.FMant.dbgFiltro;
      pnl.name := 'pnlPrueba';
      pnl.Left := Round(GLPrecio.FMant.dbgFiltro.Width / 2);
      pnl.Top := Round(GLPrecio.FMant.dbgFiltro.Height / 2);
      pnl.Width := 200;
      pnl.Height := 41;
      pnl.Caption := 'Abriendo Tabla';

      pnl.Visible := True;
      pnl.Refresh;

      sTabla := od.filename;
      pos := LastDelimiter('\', sTabla);
      If pos > 0 Then
         sTabla := copy(stabla, pos + 1, Length(sTabla) - pos - 4);
      Try
         sSQL := 'SELECT * FROM ' + UpperCase(sTabla);
         DMLOG.cdsListaTx.Close;
         DMLOG.cdsListaTx.DataRequest(sSQL);
         DMLOG.cdsListaTx.Open;
      Except
         pnl.Free;
         Screen.Cursor := crDefault;
         ShowMessage('Error al Abrir la tabla');
      End;
      pnl.Caption := 'Verificando Cabecera';
      pnl.Refresh;
      VerificaCabecera;
      pnl.Caption := 'Importando Datos';
      pnl.Refresh;
      Importa;
      pnl.Caption := 'Actualizando Datos';
      pnl.Refresh;
      ActualizaFac201;
      pnl.Free;
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFToolLPrecio.Importa;
Var
   sSQL: String;
   cont: integer;
Begin
   cont := 0;

   DMLOG.DCOM1.AppServer.IniciaTransaccion;

   sSQL := 'DELETE FROM FAC205 ';
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      DMLOG.DCOM1.AppServer.GrabaTransaccion;
   Except
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
   End;

   sSQL := 'SELECT * FROM FAC205 ';

   DMLOG.cdsMovFac.Close;
   DMLOG.cdsMovFac.FetchOnDemand := False;
   DMLOG.cdsMovFac.PacketRecords := -1;
   DMLOG.cdsMovFac.FetchOnDemand := True;

   DMLOG.cdsMovFac.DataRequest(sSQL);
   DMLOG.cdsMovFac.Open;

   DMLOG.cdsListaTx.First;
   While Not DMLOG.cdsListaTx.EOF Do
   Begin
      bCia := False;
      bTin := False;
      bTli := False;
      bArt := False;
      bTMo := False;

      If Length(DMLOG.DisplayDescrip('prvTGE', 'TGE101', 'CIAID', 'CIAID=' + QuotedStr(DMLOG.cdsListaTx.FieldByName('CIAID').AsString), 'CIAID')) > 0 Then
         bCia := True;
      If Length(DMLOG.DisplayDescrip('prvTGE', 'TGE152', 'TINID', 'CIAID=' + QuotedStr(DMLOG.cdsListaTx.FieldByName('CIAID').AsString) +
         ' AND TINID=' + QuotedSTr(DMLOG.cdsListaTx.FieldByName('TINID').AsString), 'TINID')) > 0 Then
         bTin := True;
      If Length(DMLOG.DisplayDescrip('prvTGE', 'FAC101', 'TLISTAID', 'CIAID=' + QuotedStr(DMLOG.cdsListaTx.FieldByName('CIAID').AsString) +
         ' AND TLISTAID=' + QuotedSTr(DMLOG.cdsListaTx.FieldByName('TLISTAID').AsString), 'TLISTAID')) > 0 Then
         bTLi := True;
      If Length(DMLOG.DisplayDescrip('prvTGE', 'TGE205', 'ARTID', 'CIAID=' + QuotedStr(DMLOG.cdsListaTx.FieldByName('CIAID').AsString) +
         ' AND TINID=' + QuotedSTr(DMLOG.cdsListaTx.FieldByName('TINID').AsString) + ' AND ARTID=' + QuotedSTr(DMLOG.cdsListaTx.FieldByName('ARTID').AsString), 'ARTID')) > 0 Then
         bArt := True;
      If Length(DMLOG.DisplayDescrip('prvTGE', 'TGE103', 'TMONID', 'TMONID=' + QuotedStr(DMLOG.cdsListaTx.FieldByName('TMONID').AsString), 'TMONID')) > 0 Then
         bTMo := True;

      If (bCia) And (bTin) And (bTli) {and (bGra)} And (bArt) And (bTMo) Then
      Begin
         DMLOG.cdsMovFac.Insert;
         DMLOG.cdsMovFac.FieldByName('CIAID').AsString := DMLOG.cdsListaTx.FieldByName('CIAID').AsString;
         DMLOG.cdsMovFac.FieldByName('TINID').AsString := DMLOG.cdsListaTx.FieldByName('TINID').AsString;
         DMLOG.cdsMovFac.FieldByName('TLISTAID').AsString := DMLOG.cdsListaTx.FieldByName('TLISTAID').AsString;
         DMLOG.cdsMovFac.FieldByName('ARTID').AsString := DMLOG.cdsListaTx.FieldByName('ARTID').AsString;
         DMLOG.cdsMovFac.FieldByName('TMONID').AsString := DMLOG.cdsListaTx.FieldByName('TMONID').AsString;
         DMLOG.cdsMovFac.FieldByName('PRECIO').AsFloat := DMLOG.cdsListaTx.FieldByName('PRECIO').AsFloat;
         DMLOG.cdsMovFac.FieldByName('DESCTO').AsFloat := DMLOG.cdsListaTx.FieldByName('DESCTO').AsFloat;
         DMLOG.cdsMovFac.Post;
         cont := cont + 1;
      End
      Else
      Begin
         ShowMessage('El Registro                                        ' + #13 +
            'CIAID=' + DMLOG.cdsListaTx.FieldByName('CIAID').AsString + #13 +
            'TINID=' + DMLOG.cdsListaTx.FieldByName('TINID').AsString + #13 +
            'TLISTAID=' + DMLOG.cdsListaTx.FieldByName('TLISTAID').AsString + #13 +
            'ARTID=' + DMLOG.cdsListaTx.FieldByName('ARTID').AsString + #13 +
            'TMONID=' + DMLOG.cdsListaTx.FieldByName('TMONID').AsString + #13 +
            'PRECIO=' + FloatToStr(DMLOG.cdsListaTx.FieldByName('PRECIO').AsFloat) + #13 + 'No se pudo Importar');
      End;

      DMLOG.cdsListaTx.Next;
   End;
   DMLOG.ControlTran(9, DMLOG.cdsMovFac, 'MOVFAC');
   ShowMessage('Se transfirieron ' + IntToStr(cont) + ' de ' + IntToStr(DMLOG.cdsListaTx.RecordCount) + ' registros');
End;

Procedure TFToolLPrecio.z1sbExportaClick(Sender: TObject);
Var
   xLinea: String;
Begin
   If Not Question(Caption, 'Desea Exportar los Registros Seleccionados ?') Then
      exit;

   pnl := TPanel.Create(Self);
   pnl.Parent := GLPrecio.FMant.dbgFiltro;
   pnl.name := 'pnlPrueba';
   pnl.Left := Round(GLPrecio.FMant.dbgFiltro.Width / 2);
   pnl.Top := Round(GLPrecio.FMant.dbgFiltro.Height / 2);
   pnl.Width := 200;
   pnl.Height := 41;
   pnl.Caption := 'Preparando Tabla';

   pnl.Visible := True;
   pnl.Refresh;

   sSQL := 'SELECT * FROM FAC205 ';
   DMLOG.cdsMovFac.Close;
   DMLOG.cdsMovFac.DataRequest(sSQL);
   DMLOG.cdsMovFac.Open;
   DMLOG.cdsMovFac.First;
   While Not DMLOG.cdsMovFac.EOf Do
   Begin
      DMLOG.cdsMovFac.Delete
   End;
   DMLOG.ControlTran(9, DMLOG.cdsMovFac, 'MOVFAC');

   Screen.Cursor := crHourGlass;
   pnl.Caption := 'Insertando Registros';
   pnl.Refresh;

   DMLOG.cdsLPrecio.DisableControls;
   DMLOG.cdsLPrecio.First;
   While Not DMLOG.cdsLPrecio.EOF Do
   Begin
      DMLOG.cdsMovFac.Insert;
      DMLOG.cdsMovFac.FieldByName('CIAID').AsString := DMLOG.cdsLPrecio.FieldByName('CIAID').AsString;
      DMLOG.cdsMovFac.FieldByName('TINID').AsString := DMLOG.cdsLPrecio.FieldByName('TINID').AsString;
      DMLOG.cdsMovFac.FieldByName('TLISTAID').AsString := DMLOG.cdsLPrecio.FieldByName('TLISTAID').AsString;
      DMLOG.cdsMovFac.FieldByName('GRARID').AsString := DMLOG.cdsLPrecio.FieldByName('GRARID').AsString;
      DMLOG.cdsMovFac.FieldByName('ARTID').AsString := DMLOG.cdsLPrecio.FieldByName('ARTID').AsString;
      DMLOG.cdsMovFac.FieldByName('ARTDES').AsString := DMLOG.cdsLPrecio.FieldByName('ARTDES').AsString;
      DMLOG.cdsMovFac.FieldByName('TMONID').AsString := DMLOG.cdsLPrecio.FieldByName('LPRETMONID').AsString;
      DMLOG.cdsMovFac.FieldByName('DESCTO').AsFloat := DMLOG.cdsLPrecio.FieldByName('DESCTO').AsFloat;
      If DMLOG.cdsLPrecio.FieldByName('LPRETMONID').AsString = DMLOG.wTMonExt Then
         DMLOG.cdsMovFac.FieldByName('PRECIO').AsFloat := DMLOG.cdsLPrecio.FieldByName('LPREPREGME').AsFloat
      Else
         DMLOG.cdsMovFac.FieldByName('PRECIO').AsFloat := DMLOG.cdsLPrecio.FieldByName('LPREPREGMN').AsFloat;

      DMLOG.cdsMovFac.Post;
      DMLOG.cdsLPrecio.Next;
   End;
   DMLOG.cdsLPrecio.EnableControls;
   DMLOG.ControlTran(9, DMLOG.cdsMovFac, 'MOVFAC');

   If sd.execute Then
   Begin
      pnl.Caption := 'Creando Archivo ' + sd.Filename;
      pnl.Refresh;

      DMLOG.cdsMovFac.First;
      scFILES.Lines.Clear;
      xLinea := '';
      xLinea := 'Cia.;Tip.Inv.;Lista;Línea;Código;Descripción;Moneda;Precio';
      scFILES.Lines.Add(xLinea);
      While Not DMLOG.cdsMovFac.EOF Do
      Begin
         xLinea := DMLOG.cdsMovFac.fieldbyname('CIAID').AsString; //1
         xLinea := xLinea + ';' + DMLOG.cdsMovFac.fieldbyname('TINID').AsString; // 2
         xLinea := xLinea + ';' + DMLOG.cdsMovFac.fieldbyname('TLISTAID').AsString; // 3
         xLinea := xLinea + ';' + DMLOG.cdsMovFac.fieldbyname('GRARID').AsString; // 4
         xLinea := xLinea + ';' + DMLOG.cdsMovFac.fieldbyname('ARTID').AsString; // 5
         xLinea := xLinea + ';' + DMLOG.cdsMovFac.fieldbyname('ARTDES').AsString; // 6
         xLinea := xLinea + ';' + DMLOG.cdsMovFac.fieldbyname('TMONID').AsString; // 6
         xLinea := xLinea + ';' + FormatFloat('###########0.0000', DMLOG.cdsMovFac.fieldbyname('PRECIO').AsFloat); // 8
         xLinea := xLinea + ';' + FormatFloat('###########0.00', DMLOG.cdsMovFac.fieldbyname('DESCTO').AsFloat); // 8
         scFILES.Lines.Add(xLinea);
         DMLOG.cdsMovFac.Next;
      End;
      scFILES.Lines.SaveToFile(sd.FileName);
   End;
   pnl.Free;
   Screen.Cursor := crDefault;
   ShowMessage('Se Terminó con Exito');
End;

Procedure TFToolLPrecio.VerificaCabecera;
Var
   i: integer;

   bCia, bTin, bTli, bGra, bArt, bTMo, bPre, bDcto: boolean;
Begin
   bCia := False;
   bTin := False;
   bTli := False;
//QUITAR  bGra:=False;
   bArt := False;
   bTMo := False;
   bPre := False;
   bDcto := False;

   For i := 0 To DMLOG.cdsListaTx.Fields.Count - 1 Do
   Begin
      If UpperCase(DMLOG.cdsListaTx.Fields[i].FieldName) = 'CIAID' Then
      Begin
         bCia := True;
      End;
      If UpperCase(DMLOG.cdsListaTx.Fields[i].FieldName) = 'TINID' Then
      Begin
         bTin := True;
      End;
      If UpperCase(DMLOG.cdsListaTx.Fields[i].FieldName) = 'TLISTAID' Then
      Begin
         bTLi := True;
      End;
      If UpperCase(DMLOG.cdsListaTx.Fields[i].FieldName) = 'ARTID' Then
      Begin
         bArt := True;
      End;
      If UpperCase(DMLOG.cdsListaTx.Fields[i].FieldName) = 'TMONID' Then
      Begin
         bTMo := True;
      End;
      If UpperCase(DMLOG.cdsListaTx.Fields[i].FieldName) = 'PRECIO' Then
      Begin
         bPre := True;
      End;
      If UpperCase(DMLOG.cdsListaTx.Fields[i].FieldName) = 'DESCTO' Then
      Begin
         bDcto := True;
      End;
   End;
   If Not ((bCia) And (bTin) And (bTli) And (bGra) And (bArt) And (bTMo) And (bPre) And (bDcto)) Then
   Begin
      If Not bCia Then
      Begin
         pnl.Visible := False;
         pnl.Free;
         Screen.Cursor := crDefault;
         Raise Exception.Create('El archivo Origen no contiene el Campo CIAID (Compañía)');
      End;
      If Not bTin Then
      Begin
         pnl.Visible := False;
         pnl.Free;
         Screen.Cursor := crDefault;
         Raise Exception.Create('El archivo Origen no contiene el Campo TINID (Tipo de Inventario)');
      End;
      If Not bTli Then
      Begin
         pnl.Visible := False;
         pnl.Free;
         Screen.Cursor := crDefault;
         Raise Exception.Create('El archivo Origen no contiene el Campo TLISTAID (Tipo de Lista)');
      End;

      If Not bDcto Then
      Begin
         pnl.Visible := False;
         pnl.Free;
         Screen.Cursor := crDefault;
         Raise Exception.Create('El archivo Origen no contiene el Campo DESCTO (Descuento Artículo)');
      End;

      If Not bArt Then
      Begin
         pnl.Visible := False;
         pnl.Free;
         Screen.Cursor := crDefault;
         Raise Exception.Create('El archivo Origen no contiene el Campo ARTID (Código de Artículo)');
      End;
      If Not bTMo Then
      Begin
         pnl.Visible := False;
         pnl.Free;
         Screen.Cursor := crDefault;
         Raise Exception.Create('El archivo Origen no contiene el Campo TMONID (Moneda)');
      End;
      If Not bPre Then
      Begin
         pnl.Visible := False;
         pnl.Free;
         Screen.Cursor := crDefault;
         Raise Exception.Create('El archivo Origen no contiene el Campo PRECIO (Precio)');
      End;
   End;

End;

Procedure TFToolLPrecio.ActualizaFAC201;
Var
   sSQL: String;
Begin
   sSQL := 'SELECT * FROM FAC205 ';
   DMLOG.cdsMovFac.Close;
   DMLOG.cdsMovFac.DataRequest(sSQL);
   DMLOG.cdsMovFac.Open;
   DMLOG.cdsMovFac.First;
   While Not DMLOG.cdsMovFac.EOF Do
   Begin
      If DMLOG.cdsMovFac.FieldByName('TMONID').AsString = DMLOG.wTMonExt Then
      Begin
         sSQL := 'Update FAC201 '
            + '      set LPREPREGMO=' + FloatToStr(DMLOG.cdsMovFac.FieldByName('PRECIO').AsFloat) + ', '
            + '          LPREPREGME=' + FloatToStr(DMLOG.cdsMovFac.FieldByName('PRECIO').AsFloat) + ', '
            + '          LPREPREGMN=0.00, '
            + '          LPRETMONID=' + QuotedStr(DMLOG.cdsMovFac.FieldByName('TMONID').AsString) + ', '
            + '          LPREFREG=' + DMLOG.wRepFecServi + ', '
            + '          LPREHREG=' + DMLOG.wRepHorServi + ', '
            + '          LPREUSER=' + QuotedStr(DMLOG.wUsuario) + ', '
            + '          LPREPDCTOG=' + FloatToStr(DMLOG.cdsMovFac.FieldByName('DESCTO').AsFloat) + ' ';
         If DMLOG.cdsMovFac.FieldByName('DESCTO').AsFloat > 0 Then
            sSQL := sSQL + ' , LPREFLAGD=''S'' '
         Else
            sSQL := sSQL + ' , LPREFLAGD=''N'' ';

         sSQL := sSQL
            + '    where CIAID=' + QuotedSTr(DMLOG.cdsMovFac.FieldByName('CIAID').AsString)
            + '      and TINID=' + QuotedSTr(DMLOG.cdsMovFac.FieldByName('TINID').AsString)
            + '      and TLISTAID=' + QuotedSTr(DMLOG.cdsMovFac.FieldByName('TLISTAID').AsString)
            + '      and ARTID=' + QuotedSTr(DMLOG.cdsMovFac.FieldByName('ARTID').AsString);
         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
         Except
            ShowMessage('Error');
         End;
      End
      Else
      Begin
         If DMLOG.cdsMovFac.FieldByName('TMONID').AsString = DMLOG.wTMonlOC Then
         Begin
            sSQL := 'Update FAC201 '
               + '      set LPREPREGMO=' + FloatToStr(DMLOG.cdsMovFac.FieldByName('PRECIO').AsFloat) + ', '
               + '          LPREPREGMN=' + FloatToStr(DMLOG.cdsMovFac.FieldByName('PRECIO').AsFloat) + ', '
               + '          LPREPREGME=0.00, '
               + '          LPRETMONID=' + QuotedStr(DMLOG.cdsMovFac.FieldByName('TMONID').AsString) + ', '
               + '          LPREFREG=' + DMLOG.wRepFecServi + ', '
               + '          LPREHREG=' + DMLOG.wRepHorServi + ', '
               + '          LPREUSER=' + QuotedStr(DMLOG.wUsuario) + ', '
               + '          LPREPDCTOG=' + FloatToStr(DMLOG.cdsMovFac.FieldByName('DESCTO').AsFloat) + ', ';
            If DMLOG.cdsMovFac.FieldByName('DESCTO').AsFloat > 0 Then
               sSQL := sSQL + 'LPREFLAGD=''S'' '
            Else
               sSQL := sSQL + 'LPREFLAGD=''N'' ';
            sSQL := sSQL
               + '    where CIAID=' + QuotedSTr(DMLOG.cdsMovFac.FieldByName('CIAID').AsString)
               + '      and TINID=' + QuotedSTr(DMLOG.cdsMovFac.FieldByName('TINID').AsString)
               + '      and TLISTAID=' + QuotedSTr(DMLOG.cdsMovFac.FieldByName('TLISTAID').AsString)
               + '      and ARTID=' + QuotedSTr(DMLOG.cdsMovFac.FieldByName('ARTID').AsString);
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
               ShowMessage('Error');
            End;
         End;
      End;
      DMLOG.cdsMovFac.Next;
   End;
End;

Procedure TFToolLPrecio.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFToolLPrecio.Timer1Timer(Sender: TObject);
Begin
   FVariables.w_NombreForma := 'FToolLPrecio';
   If (DMLOG.wAdmin = 'G') Or (DMLOG.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMLOG.AccesosUsuariosR(DMLOG.wModulo, DMLOG.wUsuario, '2', FToolLPrecio);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

Procedure TFToolLPrecio.bbtnCodBarClick(Sender: TObject);
Var
   cOk, xSQL, cArtMod: String;
   wlAno, wlMes, wlDia: word;
Begin

   DecodeDate(strtodate(datetostr(Date)), wlAno, wlMes, wlDia);

   xSQL := 'Select * from FAC201 '
      + '    where CIAID=' + quotedstr(GLPrecio.FMant.cds2.fieldbyname('CIAID').AsString)
      + '      and TLISTAID=''2DE'' '
      + '      and ARTID=' + quotedstr(GLPrecio.FMant.cds2.fieldbyname('ARTID').AsString);
   DMLOG.cdsLPrecio.Close;
   DMLOG.cdsLPrecio.IndexFieldNames := '';
   DMLOG.cdsLPrecio.Filter := '';
   DMLOG.cdsLPrecio.Filtered := False;
   DMLOG.cdsLPrecio.DataRequest(xSQL);
   DMLOG.cdsLPrecio.Open;
   xSQL := 'Select A.ARTID, A.ARTDES, R.UTILIDAD, A.STKSACTG, A.ALMID, '
      + '          ROUND(C.PREVEN,2) PREVEN, '
      + '          ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_IGV, '
      + '          ROUND( NVL(C.PREVEN,0),2) + ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_CAL, '
      + '          ROUND(C.PREVENPRO,2) PREVENPRO, '
      + '          ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_IGVP, '
      + '          ROUND( NVL(C.PREVENPRO,0), 2) + ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_PRO, '
      + '          CASE WHEN PREVENPRO>0 THEN '
      + '          ROUND( NVL(C.PREVENPRO,0), 2) + ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) '
      + '          ELSE '
      + '          ROUND( NVL(C.PREVEN,0),2) + ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) '
      + '          END PRECIO, C.TLISTAID '
      + '     from LOG316 A, NUMEROS B, FAC201 C, TGE108 D, TGE103 M, TGE205 P, ALM_TIP_ART Q, ALM_LIN_COM R '
      + '    where A.CIAID=''' + DMLOG.cdsLPrecio.FieldByName('CIAID').AsString + ''' '
      + '      and A.STKANO=''' + inttostr(wlAno) + ''' and A.ARTID IN (''' + DMLOG.cdsLPrecio.FieldByName('ARTID').AsString + ''') '
      + '      and NUMERO<= A.STKSACTG '
      + '      and A.CIAID=C.CIAID AND C.TLISTAID=''2DE'' and A.ARTID=C.ARTID AND A.TINID=C.TINID '
      + '      and D.TASAFLG=''I'' and C.LPRETMONID=M.TMONID(+) and A.CIAID=P.CIAID(+) AND A.TINID=P.TINID(+) AND A.ARTID=P.ARTID(+) '
      + '      and P.TIPART=Q.TIPART(+) AND Q.LINCOM=R.LINCOM(+) '
      + '    order by A.ALMID, ARTID, NUMERO';
   DMLOG.cdsSQL.Close;
   DMLOG.cdsSQL.DataRequest(xSQL);
   DMLOG.cdsSQL.Open;

   cArtMod := '';
   cOk := 'S';

   DMLOG.cdsSQL.First;

   If cOk = 'N' Then
   Begin
      xSQL := 'Select A.ARTID, A.ARTDES, R.UTILIDAD, A.STKSACTG, ROUND(C.PREVEN,2) PREVEN, A.ALMID, '
         + '          ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_IGV, '
         + '          ROUND( NVL(C.PREVEN,0),2) + ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_CAL, '
         + '          ROUND(C.PREVENPRO,2) PREVENPRO, '
         + '          ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_IGVP, '
         + '          ROUND( NVL(C.PREVENPRO,0), 2) + ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_PRO, C.TLISTAID '
         + '     from LOG316 A, NUMEROS B, FAC201 C, TGE108 D, TGE103 M, TGE205 P, ALM_TIP_ART Q, ALM_LIN_COM R '
         + '    where A.CIAID=''' + DMLOG.cdsLPrecio.FieldByName('CIAID').AsString + ''' '
         + '      and A.STKANO=''2007'' and A.ARTID IN (''' + DMLOG.cdsLPrecio.FieldByName('CIAID').AsString + ''') '
         + '      and NUMERO<= A.STKSACTG '
         + '      and A.CIAID=C.CIAID AND C.TLISTAID=''2DE'' and A.ARTID=C.ARTID AND A.TINID=C.TINID '
         + '      and D.TASAFLG=''I'' and C.LPRETMONID=M.TMONID(+) and A.CIAID=P.CIAID(+) AND A.TINID=P.TINID(+) AND A.ARTID=P.ARTID(+) '
         + '      and P.TIPART=Q.TIPART(+) AND Q.LINCOM=R.LINCOM(+) '
         + '    order by A.ARTID, NUMERO';
      DMLOG.cdsSQL.Close;
      DMLOG.cdsSQL.DataRequest(xSQL);
      DMLOG.cdsSQL.Open;
   End;

   ppdb4.DataSource := DMLOG.dsSQL;

   ppr4.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\CodigoBarra04.rtm';
   ppr4.Template.LoadFromFile;
   Screen.Cursor := crDefault;

   If cbDisenoRep.Checked Then
   Begin
      ppd4.Report := ppr4;
      ppd4.ShowModal;
   End
   Else
   Begin
      ppr4.Print;

      ppdb4.DataSource := Nil;
      ppr4.Stop;
   End;
End;

Procedure TFToolLPrecio.bbtnBarCatClick(Sender: TObject);
Var
   cOk, xSQL, cArtMod: String;
   wlAno, wlMes, wlDia: word;
Begin

   DecodeDate(strtodate(datetostr(Date)), wlAno, wlMes, wlDia);

   xSQL := 'Select * from FAC201 '
      + '   where CIAID=' + quotedstr(GLPrecio.FMant.cds2.fieldbyname('CIAID').AsString)
      + '     and TLISTAID=''CAT'' '
      + '     and ARTID=' + quotedstr(GLPrecio.FMant.cds2.fieldbyname('ARTID').AsString);
   DMLOG.cdsLPrecio.Close;
   DMLOG.cdsLPrecio.IndexFieldNames := '';
   DMLOG.cdsLPrecio.Filter := '';
   DMLOG.cdsLPrecio.Filtered := False;
   DMLOG.cdsLPrecio.DataRequest(xSQL);
   DMLOG.cdsLPrecio.Open;
   xSQL := 'Select A.ARTID, A.ARTDES, R.UTILIDAD, A.STKSACTG, A.ALMID, '
      + '          ROUND(C.PREVEN,2) PREVEN, '
      + '          ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_IGV, '
      + '          ROUND( NVL(C.PREVEN,0),2) + ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_CAL, '
      + '          ROUND(C.PREVENPRO,2) PREVENPRO, '
      + '          ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_IGVP, '
      + '          ROUND( NVL(C.PREVENPRO,0), 2) + ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_PRO, '
      + '          CASE WHEN PREVENPRO>0 THEN '
      + '          ROUND( NVL(C.PREVENPRO,0), 2) + ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) '
      + '          ELSE '
      + '          ROUND( NVL(C.PREVEN,0),2) + ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) '
      + '          END PRECIO, C.TLISTAID '
      + '     from LOG316 A, NUMEROS B, FAC201 C, TGE108 D, TGE103 M, TGE205 P, ALM_TIP_ART Q, ALM_LIN_COM R '
      + '    where A.CIAID=''' + DMLOG.cdsLPrecio.FieldByName('CIAID').AsString + ''' '
      + '      and A.STKANO=''' + inttostr(wlAno) + ''' and A.ARTID IN (''' + DMLOG.cdsLPrecio.FieldByName('ARTID').AsString + ''') '
      + '      and NUMERO<= A.STKSACTG '
      + '      and A.CIAID=C.CIAID AND C.TLISTAID=''CAT'' and A.ARTID=C.ARTID AND A.TINID=C.TINID '
      + '      and D.TASAFLG=''I'' and C.LPRETMONID=M.TMONID(+) and A.CIAID=P.CIAID(+) AND A.TINID=P.TINID(+) AND A.ARTID=P.ARTID(+) '
      + '      and P.TIPART=Q.TIPART(+) AND Q.LINCOM=R.LINCOM(+) '
      + '    order by A.ALMID, ARTID, NUMERO';
   DMLOG.cdsSQL.Close;
   DMLOG.cdsSQL.DataRequest(xSQL);
   DMLOG.cdsSQL.Open;

   cArtMod := '';
   cOk := 'S';
   DMLOG.cdsSQL.First;

   If cOk = 'N' Then
   Begin
      xSQL := 'Select A.ARTID, A.ARTDES, R.UTILIDAD, A.STKSACTG, ROUND(C.PREVEN,2) PREVEN, A.ALMID, '
         + '          ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_IGV, '
         + '          ROUND( NVL(C.PREVEN,0),2) + ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_CAL, '
         + '          ROUND(C.PREVENPRO,2) PREVENPRO, '
         + '          ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_IGVP, '
         + '          ROUND( NVL(C.PREVENPRO,0), 2) + ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_PRO, C.TLISTAID '
         + '     from LOG316 A, NUMEROS B, FAC201 C, TGE108 D, TGE103 M, TGE205 P, ALM_TIP_ART Q, ALM_LIN_COM R '
         + '    where A.CIAID=''' + DMLOG.cdsLPrecio.FieldByName('CIAID').AsString + ''' '
         + '      and A.STKANO=''2007'' and A.ARTID IN (''' + DMLOG.cdsLPrecio.FieldByName('CIAID').AsString + ''') '
         + '      and NUMERO<= A.STKSACTG '
         + '      and A.CIAID=C.CIAID AND C.TLISTAID=''CAT'' and A.ARTID=C.ARTID AND A.TINID=C.TINID '
         + '      and D.TASAFLG=''I'' and C.LPRETMONID=M.TMONID(+) and A.CIAID=P.CIAID(+) AND A.TINID=P.TINID(+) AND A.ARTID=P.ARTID(+) '
         + '      and P.TIPART=Q.TIPART(+) AND Q.LINCOM=R.LINCOM(+) '
         + '    order by A.ARTID, NUMERO';
      DMLOG.cdsSQL.Close;
      DMLOG.cdsSQL.DataRequest(xSQL);
      DMLOG.cdsSQL.Open;
   End;

   ppdb4.DataSource := DMLOG.dsSQL;

   ppr4.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\CodigoBarra04.rtm';
   ppr4.Template.LoadFromFile;
   Screen.Cursor := crDefault;

   If cbDisenoRep.Checked Then
   Begin
      ppd4.Report := ppr4;
      ppd4.ShowModal;
   End
   Else
   Begin
      ppr4.Print;
      ppdb4.DataSource := Nil;
      ppr4.Stop;
   End;
End;

Procedure TFToolLPrecio.bbtnCieClick(Sender: TObject);
Var
   cOk, xSQL, cArtMod: String;
   wlAno, wlMes, wlDia: word;
Begin

   DecodeDate(strtodate(datetostr(Date)), wlAno, wlMes, wlDia);

   If GLPrecio.FMant.cds2.fieldbyname('TLISTAID').AsString = '' Then
   Begin
      ShowMessage('Error : elegir Lista de precios');
      Exit;
   End;

   xSQL := 'Select * from FAC201 '
      + '    where CIAID=' + quotedstr(GLPrecio.FMant.cds2.fieldbyname('CIAID').AsString)
      + '      and TLISTAID=''' + GLPrecio.FMant.cds2.fieldbyname('TLISTAID').AsString + ''' '
      + '      and ARTID=' + quotedstr(GLPrecio.FMant.cds2.fieldbyname('ARTID').AsString);
   DMLOG.cdsLPrecio.Close;
   DMLOG.cdsLPrecio.IndexFieldNames := '';
   DMLOG.cdsLPrecio.Filter := '';
   DMLOG.cdsLPrecio.Filtered := False;
   DMLOG.cdsLPrecio.DataRequest(xSQL);
   DMLOG.cdsLPrecio.Open;
   xSQL := 'Select A.ARTID, P.ARTDES, R.UTILIDAD, A.STKFIN STKSACTG, A.ALMID, '
      + '          ROUND(C.PREVEN,2) PREVEN, '
      + '          ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_IGV, '
      + '          ROUND( NVL(C.PREVEN,0),2) + ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_CAL, '
      + '          ROUND(C.PREVENPRO,2) PREVENPRO, '
      + '          ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_IGVP, '
      + '          ROUND( NVL(C.PREVENPRO,0), 2) + ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_PRO, '
      + '          CASE WHEN PREVENPRO>0 '
      + '               THEN ROUND( NVL(C.PREVENPRO,0), 2) + ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) '
      + '               ELSE ROUND( NVL(C.PREVEN,0),2) + ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) '
      + '           END PRECIO, '
      + '          C.TLISTAID '
      + '     from LOG319 A, NUMEROS B, FAC201 C, TGE108 D, TGE103 M, TGE205 P, ALM_TIP_ART Q, ALM_LIN_COM R '
      + '    where A.CIAID=' + quotedstr(DMLOG.cdsLPrecio.FieldByName('CIAID').AsString)
      + '      and A.LOGANOMM=' + quotedstr(inttostr(wlAno)+DMLOG.StrZero(inttostr(wlMes),2))
      + '      and A.ARTID in (' + quotedstr(DMLOG.cdsLPrecio.FieldByName('ARTID').AsString) + ') '
      + '      and NUMERO<= A.STKFIN '
      + '      and C.CIAID=A.CIAID and C.TLISTAID='+quotedstr(DMLOG.cdsLPrecio.FieldByName('TLISTAID').AsString)
      + '      and C.TINID=A.TINID and C.ARTID=A.ARTID '
      + '      and D.TASAFLG=''I'' '
      + '      and M.TMONID(+)=C.LPRETMONID '
      + '      and P.CIAID(+)=A.CIAID and P.TINID(+)=A.TINID and P.ARTID(+)=A.ARTID '
      + '      and Q.TIPART(+)=P.TIPART '
      + '      and R.LINCOM(+)=Q.LINCOM '
      + '    order by A.ALMID, A.ARTID, B.NUMERO';
   DMLOG.cdsSQL.Close;
   DMLOG.cdsSQL.DataRequest(xSQL);
   DMLOG.cdsSQL.Open;

   cArtMod := '';
   cOk := 'S';
   DMLOG.cdsSQL.First;

   If cOk = 'N' Then
   Begin
      xSQL := 'Select A.ARTID, A.ARTDES, R.UTILIDAD, A.STKSACTG, ROUND(C.PREVEN,2) PREVEN, A.ALMID, '
         + '          ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_IGV, '
         + '          ROUND( NVL(C.PREVEN,0),2) + ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_CAL, '
         + '          ROUND(C.PREVENPRO,2) PREVENPRO, '
         + '          ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_IGVP, '
         + '          ROUND( NVL(C.PREVENPRO,0), 2) + ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_PRO, C.TLISTAID '
         + '     from LOG316 A, NUMEROS B, FAC201 C, TGE108 D, TGE103 M, TGE205 P, ALM_TIP_ART Q, ALM_LIN_COM R '
         + '    where A.CIAID=''' + DMLOG.cdsLPrecio.FieldByName('CIAID').AsString + ''' '
         + '      and A.STKANO=''2007'' and A.ARTID IN (''' + DMLOG.cdsLPrecio.FieldByName('CIAID').AsString + ''') '
         + '      and NUMERO<= A.STKSACTG '
         + '      and A.CIAID=C.CIAID AND C.TLISTAID=''' + DMLOG.cdsLPrecio.FieldByName('TLISTAID').AsString + ''' and A.ARTID=C.ARTID AND A.TINID=C.TINID '
         + '      and D.TASAFLG=''I'' and C.LPRETMONID=M.TMONID(+) and A.CIAID=P.CIAID(+) AND A.TINID=P.TINID(+) AND A.ARTID=P.ARTID(+) '
         + '      and P.TIPART=Q.TIPART(+) AND Q.LINCOM=R.LINCOM(+) '
         + '    order by A.ARTID, NUMERO';
      DMLOG.cdsSQL.Close;
      DMLOG.cdsSQL.DataRequest(xSQL);
      DMLOG.cdsSQL.Open;
   End;

   ppdb4.DataSource := DMLOG.dsSQL;

   ppr4.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\CodigoBarra04.rtm';
   ppr4.Template.LoadFromFile;
   Screen.Cursor := crDefault;

   If cbDisenoRep.Checked Then
   Begin
      ppd4.Report := ppr4;
      ppd4.ShowModal;
   End
   Else
   Begin
      ppr4.Print;
      ppdb4.DataSource := Nil;
      ppr4.Stop;
   End;
End;

Procedure TFToolLPrecio.BitBtn2Click(Sender: TObject);
Var
   xWhere: String;
Begin

   xWhere := 'USERID=' + quotedStr(DMLOG.wUsuario);
   If DMLOG.DisplayDescrip('prvTGE', 'LOG_LIS_PRE', 'PREVILEGIO', xWhere, 'PREVILEGIO') <> 'S' Then
   Begin
      ShowMessage('Usuario no tiene Acceso a Editar Precios');
      Exit;
   End;

   Try
      FListaPreciosEdita := TFListaPreciosEdita.Create(self);
      Try
         FListaPreciosEdita.ShowModal;
      Except
      End;
   Finally
      FListaPreciosEdita.Free;
   End;
End;

Procedure TFToolLPrecio.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;

// Inicio HPC_201702_LOG
// 20/06/2017 Recálculo de Stock por Artículo
procedure TFToolLPrecio.bbtnReproStockClick(Sender: TObject);
Begin
   If MessageDlg('Recálculo Stock del Artículo' + chr(13) + ' ¿Esta Seguro?   ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then exit;
   Screen.Cursor := crHourGlass;
   Try
      DMLOG.DCOM1.AppServer.IniciaTransaccion;
      xSQL := 'BEGIN DB2ADMIN.SP_ALM_REGENERA_STOCK(''' + GLPrecio.FMant.cds2.FieldByName('CIAID').AsString + ''',''' + GLPrecio.FMant.cds2.FieldByName('ARTID').AsString + '''); END;';
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      DMLOG.DCOM1.AppServer.GrabaTransaccion;
   Except
      Screen.Cursor := crDefault;
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('Error en el proceso del artículo ' + GLPrecio.FMant.cds2.FieldByName('ARTID').AsString);
   End;
   ShowMessage('Procesó con exito...');
   Screen.Cursor := crDefault;
end;
// Fin HPC_201702_LOG

End.


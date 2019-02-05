Unit LOG511;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : LOGDM1
// FORMULARIO               : DMLOG
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Tool bar de la ventana de requerimiento de usuario

// ACTUALIZACIONES:
// HPC_201211_LOG 19/07/2012  Se adiciona el botón que invocará el reporte de
//                            Requerimiento de Usuarios.
// HPC_201401_LOG 07/02/2014  Se corrige la opcion de Anulación de Requerimiento de Usuario

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ComCtrls, ExtCtrls, Mant, db, Wwdbgrid, wwdblook,
   Wwdbdlg, ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppBands, ppCache, ppCtrls, ppVar, ppPrnabl, ppParameter, MsgDlgs;

Type
   TFToolPedUsu = Class(TForm)
      pnlTool: TPanel;
    sbRequisiciones: TSpeedButton;
    sbNotaSalida: TSpeedButton;
      spdAnula: TSpeedButton;
      Timer1: TTimer;
      Label1: TLabel;
      dblcdCC: TwwDBLookupComboDlg;
      edtCCostoSoli: TEdit;
      btnReporteRequerimientos: TBitBtn;
      Label2: TLabel;
      ppdbRequerimientoUsuario: TppDBPipeline;
      pprRequerimientoUsuario: TppReport;
      ppdRequerimientoUsuario: TppDesigner;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppShape5: TppShape;
      ppShape12: TppShape;
      ppShape11: TppShape;
      ppShape10: TppShape;
      ppShape9: TppShape;
      ppShape8: TppShape;
      ppShape7: TppShape;
      ppShape6: TppShape;
      ppShape4: TppShape;
      ppShape3: TppShape;
      ppShape1: TppShape;
      ppShape2: TppShape;
      ppSystemVariable4: TppSystemVariable;
      ppLabel57: TppLabel;
      ppSystemVariable5: TppSystemVariable;
      ppLabel58: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppLabel60: TppLabel;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppSystemVariable10: TppSystemVariable;
      ppDBText13: TppDBText;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppDBText5: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText14: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppDBText37: TppDBText;
      ppLabel2: TppLabel;
      ppLabel15: TppLabel;
      ppLabel18: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel27: TppLabel;
      ppLabel1: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText6: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppDBText7: TppDBText;
      ppFooterBand1: TppFooterBand;
//      Procedure sbRequisicionesClick(Sender: TObject);
      Procedure sbNotaSalidaClick(Sender: TObject);
      Procedure spdAnulaClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure dblcdCCExit(Sender: TObject);
      Procedure btnReporteRequerimientosClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   //   Procedure OnEditRequis(Sender: TObject; MantFields: TFields);
      Procedure OnEditNIS(Sender: TObject; MantFields: TFields);
   End;

Var
   FToolPedUsu: TFToolPedUsu;
   Mtx2: TMant;
   xAccesoBotones: Boolean;

Implementation

//Uses LOGDM1, LOG201, LOG240, oaAD3000;
Uses LOGDM1, LOG240, oaAD3000;
// LOG240 (ex ALM201)

{$R *.DFM}

Procedure TFToolPedUsu.OnEditNIS(Sender: TObject; MantFields: TFields);
Var
   xSQL, sCIA, sLOC, sALM, sNIS, sTDO, sSQL, sTIP: String;
Begin
   sCIA := MantFields.FieldByName('CIAID').AsString;
   sLOC := MantFields.FieldByName('LOCID').AsString;
   sALM := MantFields.FieldByName('ALMID').AsString;
   sNIS := MantFields.FieldByName('NISAID').AsString;
   sTDO := MantFields.FieldByName('TDAID').AsString;
   sTIP := MantFields.FieldByName('NISATIP').AsString;
   xSQL := ' Select * '
      + '      from LOG314 '
      + '     where NISATIP=''SALIDA'''
      + '       and NISAID=''' + sNIS + ''''
      + '       and CIAID =''' + sCIA + ''''
      + '       and LOCID =''' + sLOC + ''''
      + '       and TINID =''' + MantFields.FieldByName('TINID').AsString + ''''
      + '       and ALMID =''' + sALM + ''''
      + '       and TDAID =''' + MantFields.FieldByName('TDAID').AsString + ''' ';
   DMLOG.cdsNIS.Close;
   DMLOG.cdsNIS.DataRequest(xSQL);
   DMLOG.cdsNIS.Open;

   xSQL := ' Select * '
      + '      from LOG315 '
      + '     where NISATIP=''SALIDA'''
      + '       and NISAID=''' + DMLOG.cdsNIS.FieldByName('NISAID').AsString + ''''
      + '       and CIAID =''' + DMLOG.cdsNIS.FieldByName('CIAID').AsString + ''''
      + '       and LOCID =''' + DMLOG.cdsNIS.FieldByName('LOCID').AsString + ''''
      + '       and TINID =''' + DMLOG.cdsNIS.FieldByName('TINID').AsString + ''''
      + '       and ALMID =''' + DMLOG.cdsNIS.FieldByName('ALMID').AsString + ''''
      + '       and TDAID =''' + DMLOG.cdsNIS.FieldByName('TDAID').AsString + ''' ORDER BY KDXID ';
   DMLOG.cdsKDX.Close;
   DMLOG.cdsKDX.DataRequest(xSQL);
   DMLOG.cdsKDX.Open;
   Try
      DMLOG.wModo := 'M';
      FRegNtaS := TFRegNtaS.create(Application);
      Screen.Cursor := crHourGlass;
      FRegNtaS.xAlmLec := 'S';
      FRegNtaS.dblcCIA.Enabled := False;
      FRegNtaS.dblcLOC.Enabled := False;
      FRegNtaS.dblcTInv.Enabled := False;
      FRegNtaS.dblcdCC.Enabled := False;
      FRegNtaS.dbdtpFDoc.Enabled := False;
      FRegNtaS.dblcTALM.Enabled := False;
      FRegNtaS.dblcTDA.Enabled := False;
      FRegNtaS.dblcTransac.Enabled := False;
      FRegNtaS.dbeNumNISA.Enabled := False;
      sSQL := 'Select * from TGE208 where TRISGT=''S''';
      DMLOG.cdsTRAN.Close;
      DMLOG.cdsTRAN.DataRequest(sSQL);
      DMLOG.cdsTRAN.Open;
      FRegNtaS.Edita;
      DMLOG.cdsNIS.Edit;
      FRegNtaS.wOperacion := 'MOD';
      Screen.Cursor := crDefault;
   Finally
      FRegNtaS.ActiveMDIChild;
   End;
End;

{
Procedure TFToolPedUsu.OnEditRequis(Sender: TObject; MantFields: TFields);
Var
   sCIA, sLOC, sRQS, sSQL: String;
Begin
   sCIA := MantFields.FieldByName('CIAID').AsString;
   sLOC := MantFields.FieldByName('LOCID').AsString;
   sRQS := MantFields.FieldByName('RQSID').AsString;

   sSQL := ' Select * '
      + '      from LOG308 '
      + '     where CIAID=' + quotedstr(sCIA)
      + '       and RQSID=' + quotedstr(sRQS)
      + '       and LOCID=' + quotedstr(sLOC)
      + '     order by CIAID, RQSID';
   DMLOG.cdsReqs.Close;
   DMLOG.cdsReqs.MasterSource := Nil;
   DMLOG.cdsReqs.MasterFields := '';
   DMLOG.cdsReqs.IndexFieldNames := '';
   DMLOG.cdsReqs.DataRequest(sSQL);
   DMLOG.cdsReqs.Open;

   sSQL := ' Select * '
      + '      from LOG309 '
      + '     where CIAID=' + quotedstr(sCIA)
      + '       and RQSID=' + quotedstr(sRQS)
      + '       and LOCID=' + quotedstr(sLOC)
      + '     order by CIAID, RQSID, DRQSID';
   DMLOG.cdsDReqs.Close;
   DMLOG.cdsDReqs.MasterSource := Nil;
   DMLOG.cdsDReqs.MasterFields := '';
   DMLOG.cdsDReqs.IndexFieldNames := '';
   DMLOG.cdsDReqs.DataRequest(sSQL);
   DMLOG.cdsDReqs.Open;

   DMLOG.wModo := 'M';
   FRegReqs := TFRegReqs.create(self);

   If DMLOG.cdsReqs.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', 'No existen registros a editar');
      exit;
   End;

   FRegReqs.xValorX := 'X';
   FRegReqs.xReqLec := 'S';
   FRegReqs.dblcCIA.Enabled := False;
   FRegReqs.dbeNumRqs.Enabled := False;
   FRegReqs.dblcLOC.Enabled := False;

   FRegReqs.ActiveMDIChild;
End;
}

{
Procedure TFToolPedUsu.sbRequisicionesClick(Sender: TObject);
Var
   UsuCCos: String;
Begin
   Screen.Cursor := crHourGlass;

   Mtx2 := TMant.Create(Self);
   Try
      Mtx2.Admin := DMLOG.wAdmin;
      Mtx2.User := DMLOG.wUsuario;
      Mtx2.Module := DMLOG.wModulo;
      Mtx2.TableName := 'LOG308';
      Mtx2.Titulo := 'Requisiciones';
      Mtx2.ClientDataSet := DMLOG.cdsReqs;
      Mtx2.OnCreateMant := Nil;
      Mtx2.DComC := DMLOG.DCOM1;
      Mtx2.OnEdit := OnEditRequis;
      Mtx2.OnInsert := Nil; //OnInsertRequis;
      Mtx2.OnDelete := Nil; //OnDeleteRequis;
      Mtx2.OnShow := Nil; //OnShowRequis;
      Mtx2.SectionName := 'LOGRqsPedUsu';
      Mtx2.FileNameIni := '\oaLog.ini';
      Mtx2.NoVisible.Clear;

      If DMLOG.DisplayDescrip('prvTGE', 'TGE171', 'FPU', 'USERID=' + quotedstr(DMLOG.wUsuario), 'FPU') = 'S' Then
         Mtx2.Filter := ''
      Else
      Begin
         UsuCCos := DMLOG.DisplayDescrip('prvTGE', 'LOG107', 'CCOSID', 'USR=' + quotedstr(DMLOG.wUsuario), 'CCOSID');
         Mtx2.Filter := 'LOG308.CCOSID=''' + UsuCCos + '''';
      End;

      Screen.Cursor := crDefault;
      Mtx2.Execute;
   Finally
   End;
End;
}

Procedure TFToolPedUsu.sbNotaSalidaClick(Sender: TObject);
Var
   UsuCCos: String;
Begin
   Mtx2 := TMant.Create(Self);
   Try
      Mtx2.Admin := DMLOG.wAdmin;
      Mtx2.DComC := DMLOG.DCOM1;
      Mtx2.Module := DMLOG.wModulo;
      Mtx2.User := DMLOG.wUsuario;
      Mtx2.TableName := 'LOG314';
      Mtx2.Titulo := 'Notas de Salida';
      Mtx2.ClientDataSet := DMLOG.cdsNIS;
      Mtx2.OnEdit := OnEditNIS;
      Mtx2.OnInsert := Nil; //OnInsertNIS;
      Mtx2.OnDelete := Nil; //OnDeleteNIS;
      Mtx2.OnShow := Nil; //OnShowNIS;
      Mtx2.OnCreateMant := Nil;
      Mtx2.NoVisible.Clear;
      If DMLOG.DisplayDescrip('prvTGE', 'TGE171', 'FPU', 'USERID=' + quotedstr(DMLOG.wUsuario), 'FPU') = 'S' Then
         Mtx2.Filter := 'LOG314.NISATIP=''SALIDA'''
      Else
      Begin
         UsuCCos := DMLOG.DisplayDescrip('prvTGE', 'LOG107', 'CCOSID', 'USR=' + quotedstr(DMLOG.wUsuario), 'CCOSID');
         Mtx2.Filter := 'LOG314.NISATIP=''SALIDA'' AND LOG314.CCOSID=''' + UsuCCos + '''';
      End;

      Mtx2.SectionName := 'LOGNSPedUsu';
      Mtx2.FileNameIni := '\oaLOG.INI';
      Mtx2.Execute;
   Finally
   End;

End;

Procedure TFToolPedUsu.spdAnulaClick(Sender: TObject);
Var
   sCIAID, sURQID, sLOCID, sCCOID, sSQL: String;
Begin
   xSQL := 'Select * from LOG306 '
      + '    where CIAID=' + quotedstr(Mtx3000.FMant.cds2.fieldbyname('CIAID').AsString)
      + '      and LOCID=' + quotedStr(Mtx3000.FMant.cds2.fieldbyname('LOCID').AsString)
      + '      and CCOSID=' + quotedstr(Mtx3000.FMant.cds2.fieldbyname('CCOSID').AsString)
      + '      and URQID=' + quotedstr(Mtx3000.FMant.cds2.fieldbyname('URQID').AsString);
   DMLOG.cdsPedUsu.Close;
   DMLOG.cdsPedUsu.IndexFieldNames := '';
   DMLOG.cdsPedUsu.Filter := '';
   DMLOG.cdsPedUsu.Filtered := False;
   DMLOG.cdsPedUsu.DataRequest(xSQL);
   DMLOG.cdsPedUsu.Open;

   If DMLOG.cdsPedUsu.FieldByName('URQEST').AsString <> 'ACEPTADO' Then
   Begin
      ErrorMsg('Adquisiciones', 'Este Requerimiento No puede Ser Anulado');
      Exit;
   End;

   If Question('Confirmar', ' Esta seguro de Anular el Requerimiento Seleccionado ' + #13 + #13 +
      DMLOG.cdsPedUsu.FieldByName('URQID').AsString + '  -  ' + DMLOG.cdsPedUsu.FieldByName('CCOSDES').AsString + #13 + #13 +
      'Confirme para Continuar ' + #13 + #13) Then
   Begin
      Begin
         Screen.Cursor := crHourGlass;

         sCIAID := DMLOG.cdsPedUsu.FieldByName('CIAID').AsString;
         sLOCID := DMLOG.cdsPedUsu.FieldByName('LOCID').AsString;
         sCCOID := DMLOG.cdsPedUsu.FieldByName('CCOSID').AsString;
         sURQID := DMLOG.cdsPedUsu.FieldByName('URQID').AsString;

         sSQL := ' Update LOG307 '
            + '       set DURQEST=''ANULADO'' '
            + '     where CIAID=' + quotedstr(sCIAID)
            + '       and LOCID=' + quotedstr(sLOCID)
            + '       and CCOSID=' + quotedstr(sCCOID)
            + '       and URQID=' + quotedstr(sURQID);
         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
         Except
         End;

         xSQL := 'Select ' + wRepFuncChar + DMLOG.wRepFecServi + ', ' + QuotedStr(DMLOG.wFormatFecha) + ') "FECHA", ' + DMLOG.wRepFecServi + ' HORA FROM DUAL';

         DMLOG.cdsReporte.Close;
         DMLOG.cdsReporte.DataRequest(xSQL);
         DMLOG.cdsReporte.Open;
         xFec_Sis := DMLOG.cdsReporte.FieldByName('FECHA').AsString;
         xHor_Sis := DMLOG.cdsReporte.FieldByName('HORA').AsString;

         DMLOG.cdsPedUsu.Edit;
         DMLOG.cdsPedUsu.FieldByName('URQESTUSR').AsString := 'ANULADO';
         DMLOG.cdsPedUsu.FieldByName('URQANUUSR').AsString := DMLOG.wUsuario;
         DMLOG.cdsPedUsu.FieldByName('URQANUFREG').AsString := xFec_Sis;

         DMLOG.cdsPedUsu.FieldByName('URQANUHREG').AsString := xHor_Sis;

         DMLOG.cdsPost(DMLOG.cdsPedUsu);
         DMLOG.cdsPedUsu.Post;
         DMLOG.ControlTran(9, DMLOG.cdsPedUsu, 'PEDUSU');
         Screen.Cursor := crDefault;

         sSQL := ' Update LOG306 '
            + '       set URQEST=''ANULADO'', '
            + '           URQESTUSR  = ''ANULADO'', '
            + '           URQANUUSR  = ' + quotedstr(DMLOG.wUsuario) + ','
            + '           URQANUFREG = trunc(sysdate), '
            + '           URQANUHREG = sysdate '
            + '     where CIAID=' + quotedstr(sCIAID)
            + '       and LOCID=' + quotedstr(sLOCID)
            + '       and CCOSID=' + quotedstr(sCCOID)
            + '       and URQID=' + quotedstr(sURQID);
         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
         Except
         End;
      End;
      Mtx3000.RefreshDisplay;
   End;

End;

Procedure TFToolPedUsu.FormCreate(Sender: TObject);
Begin
   If DMLOG.DisplayDescrip('prvTGE', 'TGE171', 'FPU', 'USERID=' + quotedstr(DMLOG.wUsuario), 'FPU') = 'S' Then
      spdAnula.Visible := True
   Else
   Begin
      spdAnula.Visible := False;
   End;
End;

Procedure TFToolPedUsu.Timer1Timer(Sender: TObject);
Begin
   If (DMLOG.wAdmin = 'G') Or (DMLOG.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMLOG.AccesosUsuariosR(DMLOG.wModulo, DMLOG.wUsuario, '2', FToolPedUsu);
      xAccesoBotones := True;
   End;
   Timer1.Destroy;
End;

Procedure TFToolPedUsu.dblcdCCExit(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'CCOSID=' + quotedStr(dblcdCC.text) + ' AND CCOSACT=''S''';
   DMLOG.DisplayDescrip('prvSQL', 'TGE203', 'CCOSDES, CCOSMOV, CCOSLOCS', sSQL, 'CCOSDES');
   edtCCostoSoli.Text := DMLOG.cdsQry.FieldByName('CCOSDES').ASString;
   If edtCCostoSoli.Text = '' Then
   Begin
      ShowMessage('Centro de Costo no Existe');
      Exit;
   End;

   Mtx3000.SetFilter('LOG306.CCOSID=''' + dblcdCC.Text + '''');
   Mtx3000.RefreshFilter;
End;

Procedure TFToolPedUsu.btnReporteRequerimientosClick(Sender: TObject);
Var
   xSQL, xsFiltro: String;
   xsFiltroTexto1, xsFiltroTexto2, xsFiltroTexto3, xsFiltroTexto4: String;
   xsFiltroTexto5, xsFiltroTexto6, xsFiltroTexto7, xsFiltroTexto8: String;
   xsFiltroUsuario: String;
   xnContador: integer;
Begin
   xsFiltroUsuario := '';
   xsFiltroTexto1 := ' ';
   xsFiltroTexto2 := ' ';
   xsFiltroTexto3 := ' ';
   xsFiltroTexto4 := ' ';
   xsFiltroTexto5 := ' ';
   xsFiltroTexto6 := ' ';
   xsFiltroTexto7 := ' ';
   xsFiltroTexto8 := ' ';
   xsFiltro := '';
   For xnContador := 0 To Mtx3000.FMant.lbFiltroReal.Count - 1 Do
   Begin
      If length(trim(xsFiltro)) = 0 Then
      Begin
         xsFiltro := Mtx3000.FMant.lbFiltroReal.items[xnContador];
      End
      Else
      Begin
         xsFiltro := xsFiltro + ' AND ' + Mtx3000.FMant.lbFiltroReal.items[xnContador];
      End;
      If xnContador = 0 Then
         xsFiltroTexto1 := Mtx3000.FMant.lbFiltro.items[xnContador]
      Else
         If xnContador = 1 Then
            xsFiltroTexto2 := Mtx3000.FMant.lbFiltro.items[xnContador]
         Else
            If xnContador = 2 Then
               xsFiltroTexto3 := Mtx3000.FMant.lbFiltro.items[xnContador]
            Else
               If xnContador = 3 Then
                  xsFiltroTexto4 := Mtx3000.FMant.lbFiltro.items[xnContador]
               Else
                  If xnContador = 4 Then
                     xsFiltroTexto5 := Mtx3000.FMant.lbFiltro.items[xnContador]
                  Else
                     If xnContador = 5 Then
                        xsFiltroTexto6 := Mtx3000.FMant.lbFiltro.items[xnContador]
                     Else
                        If xnContador = 6 Then
                           xsFiltroTexto7 := Mtx3000.FMant.lbFiltro.items[xnContador]
                        Else
                           If xnContador = 7 Then xsFiltroTexto8 := Mtx3000.FMant.lbFiltro.items[xnContador];
   End;
   If Length(Mtx3000.Filter) > 0 Then
   Begin
      xsFiltroUsuario := ' AND ' + Mtx3000.Filter;
   End;
   If length(trim(xsFiltro)) > 0 Then
   Begin
      xsFiltro := ' AND ' + xsFiltro;
   End;
   xSQL := ' Select LOG306.CIAID COMPANIA, '
      + '           LOG306.LOCID LOCALIDAD, '
      + '           (Select TGE126.LOCDES '
      + '              from TGE126 '
      + '             where TGE126.CIAID = LOG306.CIAID '
      + '               and TGE126.LOCID =  LOG306.LOCID  ) LOCALIDADDES, '
      + '           LOG306.CCOSID CCUSUARIO, '
      + '           LOG306.CCOSDES CCUSUARIODES,'
      + '           LOG306.URQID NUMERO,'
      + '           LOG306.URQFREG FECHA,'
      + '           LOG306.URQEST ESTADO,'
      + '           LOG306.TIPOADQ TIPREQ,'
      + '           (Select TGE173.TIPADQDES '
      + '              from TGE173 '
      + '             where TGE173.TIPOADQ = LOG306.TIPOADQ ) TIPREQDES,'
      + '           LOG306.URQOBS OBSERVACION,'
      + '           LOG306.OBRAID TIPSERVICIO,'
      + '           (Select TGE213.OBRADES '
      + '              from TGE213 '
      + '             where TGE213.OBRAID = LOG306.OBRAID ) TIPSERVICIODES,'
      + '           LOG306.URQSOLIC CCDESTINO,'
      + '           LOG306.URQSOLICDES CCDESTINODES,'
      + '           LOG306.URQUSR USUARIO,'
      + '           LOG306.URQANUUSR USUARIOANULA, '
      + '           LOG306.GENOC, '
      +             QuotedStr(DMLOG.wUsuario) + ' USUARIO_IMPRIME, '
      +             QuotedStr(xsFiltroTexto1) + ' FILTRO1, '
      +             QuotedStr(xsFiltroTexto2) + ' FILTRO2, '
      +             QuotedStr(xsFiltroTexto3) + ' FILTRO3, '
      +             QuotedStr(xsFiltroTexto4) + ' FILTRO4, '
      +             QuotedStr(xsFiltroTexto5) + ' FILTRO5, '
      +             QuotedStr(xsFiltroTexto6) + ' FILTRO6, '
      +             QuotedStr(xsFiltroTexto7) + ' FILTRO7, '
      +             QuotedStr(xsFiltroTexto8) + ' FILTRO8 '
      + '      from LOG306 '
      + '     where 1 = 1 ' + xsFiltroUsuario + xsFiltro
      + '     order by LOG306.CIAID , LOG306.URQID  ';
   DMLOG.cdsReporte.Close;
   DMLOG.cdsReporte.DataRequest(xSQL);
   DMLOG.cdsReporte.Open;

   If DMLOG.cdsReporte.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppdbRequerimientoUsuario.DataSource := DMLOG.dsReporte;
   pprRequerimientoUsuario.DataPipeline := ppdbRequerimientoUsuario;

   pprRequerimientoUsuario.Template.FileName := wRutaRpt + '\RptRequerimientoUsuario.rtm';
   pprRequerimientoUsuario.Template.LoadFromFile;
   pprRequerimientoUsuario.Print;
End;

End.


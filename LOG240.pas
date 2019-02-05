Unit LOG240;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,
   wwdbdatetimepicker, DBCtrls, db, wwSpeedButton, wwDBNavigator, Grids,
   Wwdbigrd, Wwdbgrid, dbclient, Wwdbspin, ppBands, ppCtrls, ppVar,
   ppStrtch, ppMemo, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
   ppCache, ppDB, ppDBPipe, ppViewr, wwClient, Variants, ppTypes, MsgDlgs;

Type
   TFRegNtaS = Class(TForm)
      pnlCabecera: TPanel;
      dblcCIA: TwwDBLookupCombo;
      lblCIA: TLabel;
      Z2bbtnOK: TBitBtn;
      Z2bbtnBorrar: TBitBtn;
      dbeNumNISA: TwwDBEdit;
      lblNumNS: TLabel;
      dbmObs: TDBMemo;
      lblObs: TLabel;
      pnlDetalleG: TPanel;
      dbgDReqs: TwwDBGrid;
      pnlDetalleA: TPanel;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;
      dbeItem: TwwDBEdit;
      dbeArti: TwwDBEdit;
      dbcldArti: TwwDBLookupComboDlg;
      dbeCantidadG: TwwDBEdit;
      lblItem: TLabel;
      lblArti: TLabel;
      lblCntS: TLabel;
      bvlDetalle: TBevel;
      Bevel1: TBevel;
      Z2dbgDReqsIButton: TwwIButton;
      dblcTALM: TwwDBLookupCombo;
      Label2: TLabel;
      dbdtpFNS: TwwDBDateTimePicker;
      lblFReg: TLabel;
      lblTDocumento: TLabel;
      lblNDoc: TLabel;
      dbeNDoc: TwwDBEdit;
      lblFDoc: TLabel;
      dbdtpFDoc: TwwDBDateTimePicker;
      dbeSolic: TwwDBEdit;
      lblSolic: TLabel;
      dblcdTDOC: TwwDBLookupComboDlg;
      Label1: TLabel;
      dbePedidoG: TwwDBEdit;
      lblTransacc: TLabel;
      dblcTransac: TwwDBLookupCombo;
      dbeTransac: TwwDBEdit;
      lblCC: TLabel;
      dblcdCC: TwwDBLookupComboDlg;
      dbeCC: TwwDBEdit;
      dblcdProv: TwwDBLookupComboDlg;
      lblProv: TLabel;
      dbeProv: TwwDBEdit;
      Label7: TLabel;
      dblcTDA: TwwDBLookupCombo;
      dbeTDNISA: TwwDBEdit;
      Bevel2: TBevel;
      Label3: TLabel;
      dblcLOC: TwwDBLookupCombo;
      stxTitulo2: TPanel;
      stxTitulo1: TPanel;
      lblSerie: TLabel;
      dbeSerie: TwwDBEdit;
      Label6: TLabel;
      deObra: TwwDBEdit;
      Label8: TLabel;
      dbeLote: TwwDBEdit;
      Label9: TLabel;
      dbePO: TwwDBEdit;
      Label10: TLabel;
      dbeNP: TwwDBEdit;
      Label11: TLabel;
      dblcLOCOri: TwwDBLookupCombo;
      Label12: TLabel;
      dblcTALMOri: TwwDBLookupCombo;
      lblMedGnrl: TLabel;
      lblMedUni: TLabel;
      dbePedidoU: TwwDBEdit;
      dbeCantidadU: TwwDBEdit;
      Z2bbtnAceptar: TBitBtn;
      Z2bbtnRegresa: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      Z2bbtnGraba: TBitBtn;
      Z2bbtnNuevo: TBitBtn;
      lblEstado: TLabel;
      pnlActuali: TPanel;
      lblActuali: TLabel;
      dbeDOCS: TEdit;
      Z2bbtnSalir: TBitBtn;
      Label4: TLabel;
      dblcTInv: TwwDBLookupCombo;
      dbeCIA: TEdit;
      dbeLOC: TEdit;
      dbeTinv: TEdit;
      dbeALM: TEdit;
      Label5: TLabel;
      dblcTINOri: TwwDBLookupCombo;
      dbeALMOri: TEdit;
      dbeTINOri: TEdit;
      dbeLOCOri: TEdit;
      chkBxAtendido: TCheckBox;
      Z2bbtnPrint: TBitBtn;
      ppDBCab: TppDBPipeline;
      ppdbOC: TppDBPipeline;
      pprNisSal: TppReport;
      lblTipPre: TLabel;
      dblcTipPre: TwwDBLookupCombo;
      dbeTipPre: TwwDBEdit;
      lblPresu: TLabel;
      dblcdPresup: TwwDBLookupComboDlg;
      edtPresup: TEdit;
      pnlActualizando: TPanel;
      lblActualizando: TLabel;
      ppHeaderBand4: TppHeaderBand;
      ppShape7: TppShape;
      ppDBText49: TppDBText;
      ppDBText57: TppDBText;
      ppDBText58: TppDBText;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel42: TppLabel;
      ppLabel44: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppLabel1: TppLabel;
      ppDBMemo3: TppDBMemo;
      ppLabel2: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel7: TppLabel;
      ppDBText7: TppDBText;
      ppDBText1: TppDBText;
      ppLabel6: TppLabel;
      ppDBText3: TppDBText;
      ppDetailBand4: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppDBText2: TppDBText;
      ppLabel5: TppLabel;
      ppSummaryBand4: TppSummaryBand;
      ppDBText4: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      Procedure Z2bbtnOKClick(Sender: TObject);
      Procedure Z2bbtnBorrarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure Z2bbtnRegresaClick(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure Z2dbgDReqsIButtonClick(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure dbgDReqsKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
      Procedure dbgDReqsDblClick(Sender: TObject);
      Procedure dbeNumNISAExit(Sender: TObject);
      Procedure dbmObsKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dbeCantidadGExit(Sender: TObject);
      Procedure dblcdCCChange(Sender: TObject);
      Procedure Z2bbtnAceptarClick(Sender: TObject);
      Procedure dblcdCCExit(Sender: TObject);
      Procedure dblcdTDOCExit(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure dblcTDAExit(Sender: TObject);
      Procedure dblcTransacExit(Sender: TObject);
      Procedure dblcLOCOriExit(Sender: TObject);
      Procedure dblcTALMOriExit(Sender: TObject);
      Procedure Z2bbtnSalirClick(Sender: TObject);
      Procedure dbcldArtiExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcLOCEnter(Sender: TObject);
      Procedure dblcTALMEnter(Sender: TObject);
      Procedure dblcTransacEnter(Sender: TObject);
      Procedure dblcTInvEnter(Sender: TObject);
      Procedure dblcTInvExit(Sender: TObject);
      Procedure dblcTINOriExit(Sender: TObject);
      Procedure dblcTINOriEnter(Sender: TObject);
      Procedure dblcTALMOriEnter(Sender: TObject);
      Procedure Z2bbtnPrintClick(Sender: TObject);
      Procedure pprNisSalPreviewFormCreate(Sender: TObject);
      Procedure dbdtpFNSExit(Sender: TObject);
      Procedure dblcTipPreExit(Sender: TObject);
      Procedure dblcdPresupExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
      xCrea: bool;
      iEstado: Integer;
      vvalida: bool; {false = dentro del rango; true = fuera del rango }
      wCuenta: String;
      wTricvtas: String;
      wTritdodes: String;
      wtritrdes: String;
      xPresu: String; //'S' = si tiene presupuesto, N = no tiene presupuesto
      xYear: Word;
      xMoneda: String;
      Procedure AsigDat;
      Procedure dcCIA;
      Procedure dcALM;
      Procedure dcTDA;
      Procedure dcLOC;
      Procedure OnOffDetalle(Value: Boolean);
      Procedure OnOffCabecera(Value: Boolean);
      Procedure btnDetalle;
      Function EHandlerError(Ex: Exception): Boolean;
      Procedure Init(Sender: TObject);
      Procedure GeneraIngresoTrans();
      Procedure ActivaBotones(pnl: TPanel; xFlag: Boolean);
      Procedure validafecha;
      Procedure nuevafecha;

      Procedure CalculoNivel;
      Procedure CreaSuperior;
      Procedure inicializoCero(xCds: TwwClientDataSet);
      Procedure CalculoNivelSupe;

   Public
  { Public declarations }
      xCCosto: Integer; // Para ver si Activa los Botones Cuando se Entra por CCosto
      wOperacion: String; //'ADD' or 'MOD'
      wGenTraAlm: Boolean;
      xAlmLec: String;
      Procedure Edita;
      Procedure Adiciona;

   End;

Var
   FRegNtaS: TFRegNtaS;
   SQLFiltro: String;
   sOK: Integer;

Implementation

Uses LOGDM1;

{$R *.DFM}

Procedure TFRegNtaS.Z2bbtnOKClick(Sender: TObject);
Var
   sSQL, xSQL: String;
   sNUM, sCIA, sALM, sTIN, sTDA, sLOC, sTIP: String;
Begin
   sSQL := 'TRIID=''' + dblcTransac.Text + '''' + ' AND TRISGT=''S''';
   If Length(Trim(dblcTInv.Text)) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', ' El campo Almacén no puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dblcTALM.Text)) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', ' El campo Almacén no puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dblcTDA.Text)) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', ' El campo Tipo de Documento no puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dblcTransac.Text)) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', ' El campo Transacción no puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dbdtpFNS.Text)) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', ' El campo Fecha de Nota de Salida no puede estar en Blanco  ');
      exit
   End;
   If Trim(DMLOG.DisplayDescrip('prvTGE', 'TGE208', 'TRICC', sSQL, 'TRICC')) = 'S' Then
   Begin
      If Length(Trim(dblcdCC.Text)) = 0 Then
      Begin
         ErrorMsg('Adquisiciones', ' El campo Centro de Costo no puede estar en Blanco  ');
         exit;
      End;
   End;
   If Length(Trim(dblcdTDOC.Text)) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', ' El campo Documento de Referencia no puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dbeNDoc.Text)) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', ' El campo Nº de Documento no puede estar en Blanco  ');
      exit
   End;
   If Length(Trim(dbdtpFDoc.Text)) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', ' El campo Fecha de Documento no puede estar en Blanco  ');
      exit
   End;

   vValida := False;
   If wOperacion = 'ADD' Then
   Begin
      ValidaFecha;
      If vValida = True Then
      Begin
         ErrorMsg('Adquisiciones', ' No puede Continuar Registrando este Documento con esta fecha de Documento  ');
         Exit;
      End;
   End;

   If wOperacion = 'ADD' Then
   Begin
      Screen.Cursor := crHourGlass;
      sCIA := DMLOG.cdsNIS.FieldByName('CIAID').AsString;
      sALM := DMLOG.cdsNIS.FieldByName('ALMID').AsString;
      sTDA := DMLOG.cdsNIS.FieldByName('TDAID').AsString;
      sLOC := DMLOG.cdsNIS.FieldByName('LOCID').AsString;
      sTIN := DMLOG.cdsNIS.FieldByName('TINID').AsString;
      sNUM := DMLOG.cdsNIS.FieldByName('NISAID').AsString;
      sTIP := 'SALIDA';
      Screen.Cursor := crDefault;
   End;

   If vValida = False Then
   Begin
      If DMLOG.cdsNIS.State In [dsInsert, dsEdit] Then
      Try
         Screen.Cursor := crHourGlass;
         AsigDat; // asignar los datos predeterminados
         DMLOG.cdsNIS.Post;

         If wOperacion = 'ADD' Then
         Begin
            SQLFiltro := 'Select * '
               + '          from LOG314 '
               + '         where CIAID='+quotedstr(sCIA)
               + '           and LOCID='+quotedstr(sLOC)
               + '           and TINID='+quotedstr(sTIN)
               + '           and ALMID='+quotedstr(sALM)
               + '           and NISAID='+quotedstr(dbeNumNISA.Text)
               + '           and NISATIP =''SALIDA'' ';
            DMLOG.cdsNIS.DataRequest(SQLFiltro);
         End;
         OnOffCabecera(False); //Desactivar el panel de Cabecera
         OnOffDetalle(True); //Activar el panel de detalle
         pnlDetalleG.SetFocus;
         Z2bbtnCanc2.Enabled := True;
         Z2bbtnRegresa.Enabled := true;
         If Z2bbtnNuevo.Visible Then
            Z2bbtnCanc2.Enabled := False
         Else
            Z2bbtnCanc2.Enabled := True;
         Z2bbtnGraba.Enabled := true;
         Z2bbtnAceptar.Enabled := false;
         Z2bbtnNuevo.Enabled := false;

         xSQL := ' Select * '
            + '      from LOG315 '
            + '     where NISATIP='+quotedstr('SALIDA')
            + '       and NISAID='+quotedstr(DMLOG.cdsNIS.FieldByName('NISAID').AsString)
            + '       and CIAID ='+quotedstr(DMLOG.cdsNIS.FieldByName('CIAID').AsString)
            + '       and ALMID ='+quotedstr(DMLOG.cdsNIS.FieldByName('ALMID').AsString)
            + '       and LOCID ='+quotedstr(DMLOG.cdsNIS.FieldByName('LOCID').AsString)
            + '       and TINID ='+quotedstr(DMLOG.cdsNIS.FieldByName('TINID').AsString)
            + '       and TDAID ='+quotedstr(DMLOG.cdsNIS.FieldByName('TDAID').AsString)
            + '     Order by KDXID ';
         DMLOG.cdsKDX.Close;
         DMLOG.cdsKDX.DataRequest(xSQL);
         DMLOG.cdsKDX.Open;
         Screen.Cursor := crDefault;
         If wOperacion = 'ADD' Then
            Z2dbgDReqsIButtonClick(sender);
      Except
         On E: Exception Do
            If Not EHandlerError(E) Then Raise;
      End;
   End;
End;

Procedure TFRegNtaS.Z2bbtnBorrarClick(Sender: TObject);
Begin
 //REVISAR
   Exit;
   If DMLOG.cdsNIS.State In [dsInsert, dsEdit] Then
   Begin
      Z2bbtnOK.Enabled := False;
      DMLOG.cdsNIS.Cancel;
      OnOffCabecera(False); //Desactivar el panel de Cabecera
      DMLOG.cdsNIS.Insert;
      Init(Nil);
   End;
End;

Procedure TFRegNtaS.AsigDat;
Var
   D, M, Y: Word;
Begin
   DecodeDate(dbdtpFNS.DateTime, Y, M, D);
   If wOperacion = 'ADD' Then
   Begin
      If DMLOG.cdsNIS.FieldbyName('NISAFREG').IsNull Then
         DMLOG.cdsNIS.FieldbyName('NISAFREG').AsDateTime := Date;
      DMLOG.cdsNIS.FieldbyName('NISAUSER').AsString := DMLOG.wUsuario;
      DMLOG.cdsNIS.FieldbyName('NISATIP').AsString := 'SALIDA';
      DMLOG.cdsNIS.fieldbyname('NISSIT').AsString := 'INICIAL';
      If length(trim(DMLOG.cdsNIS.FieldbyName('NISAOBS').AsString)) = 0 Then
         DMLOG.cdsNIS.FieldbyName('NISAOBS').AsString := '.';
      DMLOG.cdsNIS.FieldbyName('NISANOMM').AsString := FloatToStr(Y) + DMLOG.StrZero(FloatToStr(M), 2);
   End;

   If wOperacion = 'MOD' Then
   Begin
      If length(trim(DMLOG.cdsNIS.FieldbyName('NISAOBS').AsString)) = 0 Then
         DMLOG.cdsNIS.FieldbyName('NISAOBS').AsString := '.';
   End;
End;

Procedure TFRegNtaS.FormCreate(Sender: TObject);
Begin
   dbcldArti.OnNotInList := dblcNotInList;
   dblcdCC.OnNotInList := dblcNotInList;
   dblcdTDOC.OnNotInList := dblcNotInList;
   dblcdProv.OnNotInList := dblcNotInList;
   pnlDetalleA.Left := 100;
   pnlDetalleA.Top := 347;
End;

Procedure TFRegNtaS.Z2bbtnRegresaClick(Sender: TObject);
Begin
   DMLOG.cdsNIS.Edit;
   OnOffCabecera(True);
   OnOffDetalle(False);
   ActivaBotones(pnlDetalleG, False);
End;

Procedure TFRegNtaS.Z2bbtnGrabaClick(Sender: TObject);
Var
   sCIA, sALM, sLOC, sTIN: String;
   sConta: Integer;
Begin
   Screen.Cursor := crHourGlass;
   sCIA := DMLOG.cdsNIS.FieldByName('CIAID').AsString;
   sALM := DMLOG.cdsNIS.FieldByName('ALMID').AsString;
   sLOC := DMLOG.cdsNIS.FieldByName('LOCID').AsString;
   sTIN := DMLOG.cdsNIS.FieldByName('TINID').AsString;

   If wOperacion = 'ADD' Then
   Begin
      SQLFiltro := 'Select * '
         + '          from LOG314 '
         + '         where CIAID='+quotedstr(sCIA)
         + '           and LOCID='+quotedstr(sLOC)
         + '           and TINID='+quotedstr(sTIN)
         + '           and ALMID='+quotedstr(sALM)
         + '           and NISAID='+quotedstr(dbeNumNISA.Text)
         + '           and NISATIP=''SALIDA'' ';
      DMLOG.cdsNIS.DataRequest(SQLFiltro);
   End;

 // Actualiza las tablas log314, log315, log318
   sConta := 0;
   DMLOG.cdsKDX.DisableControls;
   DMLOG.cdsKDX.First;
   While Not DMLOG.cdsKDX.Eof Do
   Begin
      If DMLOG.cdsKDX.FieldByName('SITUACION').AsString = 'PENDIENTE' Then
         sConta := sConta + 1;
      DMLOG.cdsKDX.Next;
   End;
   DMLOG.cdsNIS.Edit;
   If sConta > 0 Then
   Begin
      DMLOG.cdsNIS.FieldByName('SITUACION').AsString := 'PENDIENTE';
      DMLOG.cdsNIS.FieldbyName('SITFREG').AsDateTime := Date;
      DMLOG.cdsNIS.FieldbyName('SITHREG').AsDateTime := SysUtils.Time;
   End
   Else
   Begin
      DMLOG.cdsNIS.FieldByName('SITUACION').AsString := 'ATENDIDO';
      DMLOG.cdsNIS.FieldbyName('SITFREG').AsDateTime := Date;
      DMLOG.cdsNIS.FieldbyName('SITHREG').AsDateTime := SysUtils.Time;
   End;
   DMLOG.cdsNIS.Post;
   DMLOG.cdsKDX.EnableControls;

// Genera una nota de Ingreso por concepto de Transferencia
   If wOperacion = 'ADD' Then
      If wGenTraAlm Then
         GeneraIngresoTrans();
   btnDetalle;

   lblEstado.Caption := 'INICIAL';
   Z2bbtnRegresa.Enabled := true;
   Z2bbtnCanc2.Enabled := False;
   Z2bbtnGraba.Enabled := False;
   Z2bbtnAceptar.Enabled := True;
   Z2bbtnNuevo.Enabled := True;
   Screen.Cursor := crDefault;
  { Aqui se deben actualizar los saldos corespondientes a los artículos
  ---------------------------------------------------------------------------
  Si no existen registros en stock sobre el articulo se debe insertar el
  articulo con su saldo  año anterior 0  y el mes corespondiente procesado
  en la cantidad de ingreso
  sería bueno saber, para no perder tiempo quien registra la nota de salida,
  si es un usuario común o el almacenero para no perder tiempo en la
  actualización del stock al momento de guardar. Lo mas sencillo sería
  pasarle un identificador a la forma para saber si es un REQUERIMIENTO oZ2bbtnAceptar
  --------------------------------------------------------------------------- }
  {DecodeDate(dFEC,Y, M, D);
  sLART := '';
  sANO := IntToStr(Y);
  cdsKDX.First;
  while not cdsKDX.Eof do
  begin
    DecodeDate( cdsKDX.FieldByName('NISAFREG').AsDateTime, Y, M, D);
    if (sANO = IntToStr(Y)) and
       (cdsKDX.FieldByName('KDXSALIDA').AsFloat > 0) then
    begin
      sART  := cdsKDX.FieldByName('ARTID').AsString;
      sLART := sLART + ' (ARTID = '''+sART+''') OR';
    end;
    cdsKDX.Next;
  end;

  //  Actualizar si existen articulos atendidos
  if sLART <> '' then
  begin
    sLART := copy (sLART, 1,length(sLART)-3); // quitar el último OR
    SaldosArt(sCIA, sALM, sANO, sLOC, sLART);       // actualizar saldos
  end;}
End;

Procedure TFRegNtaS.GeneraIngresoTrans();
Var
   sCIA, sALM, sTDA, sTIN, sLOC, sNIS: String;
   sALMs, sTDAs, sLOCs, sNISs, sTINs: String;
   sSQL: String;
Begin
   If DMLOG.cdsNIA.Active = False Then
      DMLOG.cdsNIA.Open;
   If DMLOG.cdsNIA.State In [dsInsert, dsEdit] Then DMLOG.cdsNIA.Cancel;

   DMLOG.cdsNIA.Insert;
   sCIA := DMLOG.cdsNIS.FieldByName('CIAID').AsString;
   sLOC := dblcLOCOri.Text;
   sALM := dblcTALMOri.Text;
   sTIN := dblcTINOri.Text;
   sTDA := wTRITDODES;
   DMLOG.cdsNIS.FieldByName('TDAID').AsString;
   DMLOG.cdsNIA.FieldByName('NISAID').AsString := sNIS;
   DMLOG.cdsNIA.FieldByName('CIAID').AsString := sCIA;
   DMLOG.cdsNIA.FieldByName('ALMID').AsString := sALM;
   DMLOG.cdsNIA.FieldByName('TINID').AsString := sTIN;
   DMLOG.cdsNIA.FieldByName('TDAID').AsString := sTDA;
   DMLOG.cdsNIA.FieldByName('LOCID').AsString := sLOC;

   DMLOG.cdsNIA.FieldByName('TRIID').AsString := wTRITRDES;
   DMLOG.cdsNIA.FieldByName('LOCORIID').AsString := DMLOG.cdsNIS.FieldByName('LOCID').AsString;
   DMLOG.cdsNIA.FieldByName('ALMORIID').AsString := DMLOG.cdsNIS.FieldByName('ALMID').AsString;
   DMLOG.cdsNIA.FieldByName('NISAORIID').AsString := DMLOG.cdsNIS.FieldByName('NISAID').AsString;
   DMLOG.cdsNIA.FieldbyName('NISATIP').AsString := 'INGRESO';

   DMLOG.cdsNIA.FieldByName('NISAFREG').AsString := DMLOG.cdsNIS.FieldByName('NISAFREG').AsString;
   DMLOG.cdsNIA.FieldByName('prov').required := False;
   DMLOG.cdsNIA.FieldByName('CCOSID').required := False;
   sALMs := DMLOG.cdsKDX.FieldByName('ALMID').AsString;
   sTDAs := DMLOG.cdsKDX.FieldByName('TDAID').AsString;
   sLOCs := DMLOG.cdsKDX.FieldByName('LOCID').AsString;
   sTINs := DMLOG.cdsKDX.FieldByName('TINID').AsString;
   sNISs := DMLOG.cdsKDX.FieldByName('NISAID').AsString;

   sSQL :=
      ' insert into log315' +
      '(CIAID, LOCID, ALMID, TINID, TDAID, NISAID,' +
      'KDXID, NISATIP,ARTID , GRARID, ARTCONT, UNMIDG,' +
      'UNMIDU, FABID, ARTSPRO, ARTSCA, ARTPARA, ARTSNA,' +
      'ARTPCU, ARTPCG, ARTPVU, ARTPVG, ARTFUC, TMONID, ARTCRGO, ARTACTIVO,' +
      'CUENTAID, TINID,' +
      'NISAFREG,KDXPEDIDOG,KDXPEDIDOU, KDXCNTG, KDXCNTU,KDXSALDOG,KDXSALDOU,' +
      'KDXUSER, KDXFREG, KDXHREG, KDXANO, KDXMM,' +
      'KDXDD,KDXTRI,KDXSEM,KDXSS,KDXANOMM,KDXAATRI,KDXAASEM,KDXAASS,' +
      'FLAGVAR,CALID)' +
      ' select ' +
      '''' + sCIA + ''',''' + sLOC + ''',''' + sALM + ''',''' + sTIN + ''',''' + sTDA + ''',''' + sNIS + ''',' +
      'KDXID, ''INGRESO'', ARTID , GRARID, ARTCONT, UNMIDG,' +
      'UNMIDU, FABID, ARTSPRO, ARTSCA, ARTPARA, ARTSNA,' +
      'ARTPCU, ARTPCG, ARTPVU, ARTPVG, ARTFUC, TMONID, ARTCRGO, ARTACTIVO,' +
      'CUENTAID, TINID,' +
      'NISAFREG, 0, 0, KDXCNTG, KDXCNTU, 0,0,' +
      '''' + DMLOG.wUsuario + '''' + ', KDXFREG, KDXHREG, KDXANO, KDXMM,' +
      'KDXDD,KDXTRI,KDXSEM,KDXSS,KDXANOMM,KDXAATRI,KDXAASEM,KDXAASS,' +
      'FLAGVAR,CALID' +
      ' from LOG315' +
      ' where' +
      ' CIAID = ''' + sCIA + '''' +
      ' and LOCID = ''' + sLOCs + '''' +
      ' and ALMID = ''' + sALMs + '''' +
      ' and TDAID = ''' + sTDAs + '''' +
      ' and TINID = ''' + sTINs + '''' +
      ' and NISAID= ''' + sNISs + '''';
   DMLOG.ExecSQL(sSQL);
End;

Procedure TFRegNtaS.Z2bbtnCanc2Click(Sender: TObject);
Begin
   DMLOG.cdsNIS.CancelUpdates;
   DMLOG.cdsKDX.CancelUpdates;
   Z2bbtnNuevoClick(Nil);
End;

Procedure TFRegNtaS.Z2dbgDReqsIButtonClick(Sender: TObject);
Begin
   iEstado := 0;
   dbcldArti.Clear;
   dbeArti.Clear;
   dbePedidoG.text := '0';
   dbePedidoU.text := '0';
   dbeCantidadG.text := '0';
   dbeCantidadU.text := '0';
   dbeItem.Text := DMLOG.StrZero(DMLOG.MaxValue('KDXID', DMLOG.cdsKDX), 3);
   chkBxAtendido.Checked := false;
   dbcldArti.Enabled := True;
   pnlDetalleA.Visible := True;
   dbcldArti.SetFocus;
   pnlDetalleA.BringToFront;
   OnOffDetalle(False); // Desactivar el panel de detalle
   btnDetalle;
End;

Procedure TFRegNtaS.Z2bbtnRegOkClick(Sender: TObject);
Var
   sSit, sSQL, sCIA, sART, sALM, sNISA, sTDA, sLOC, sfecha: String;
   dFECHAR: TDateTime;
   bExiste: Boolean;
   D, M, Y: Word;
   PedidoG, PedidoU, CantidadG, CantidadU, Contenido: Double;
Begin
   If sOK <> 1 Then
   Begin
      ErrorMSg('Error', ' La Cantidad Atendida Esta con Errores ');
      Exit;
   End;
   sART := dbcldArti.Text;
   If sART = '' Then
   Begin
      ErrorMSg('Error', 'El Código del Artículo es Obligatorio');
      dbcldArti.SetFocus;
      Exit;
   End;
   If dbePedidoG.Text = '' Then dbePedidoG.Text := '0';
   If dbePedidoU.Text = '' Then dbePedidoU.Text := '0';
   If dbeCantidadG.Text = '' Then dbeCantidadG.Text := '0';
   If dbeCantidadU.Text = '' Then dbeCantidadU.Text := '0';

   CantidadG := StrToFloat(dbeCantidadG.Text);
   CantidadU := StrToFloat(dbeCantidadU.Text);
   PedidoG := StrToFloat(dbePedidoG.Text);
   PedidoU := StrToFloat(dbePedidoU.Text);

   sSQL := 'ARTID=''' + sART + ''' AND CIAID= ''' + DMLOG.cdsNIS.FieldByName('CIAID').AsString + '''';
   DMLOG.DisplayDescrip('prvTGE', 'TGE205', 'ARTID,ARTDES,FAMID,SFAMID,TINID,GRARID,ARTCONT,UNMIDG,UNMIDU,FABID,ARTSPRO,ARTSCA,ARTPARA,ARTSNA,ARTCPROU,ARTCPROG,ARTPVU,ARTPVG,ARTFUC,TMONID,ARTCRGO,ARTACTIVO,CUENTAID', sSQL, 'ARTID'); // Para tomar los datos del M. de Articulos
   Contenido := DMLOG.cdsQry.FieldByName('ARTCONT').AsFloat;
   If CantidadG * Contenido + CantidadU > PedidoG * Contenido + PedidoU Then
   Begin
      ErrorMsg('Error', ' La Cantidad atendida no puede ser mayor a la Pedida');
      Exit;
   End;
   If (PedidoG = 0) And (PedidoU = 0) Then
   Begin
      ErrorMsg('Error', ' La Cantidad Pedida No Puede Ser CERO ');
      Exit;
   End;
   If (CantidadG = 0) And (CantidadU = 0) Or
      (CantidadG < 0) And (CantidadU < 0) Then
   Begin
      ErrorMsg('Error', ' La Cantidad Atendida No Puede Ser CERO !!!!! ');
      Exit;
   End;

   sCIA := DMLOG.cdsNIS.FieldByName('CIAID').AsString;
   sALM := DMLOG.cdsNIS.FieldByName('ALMID').AsString;
   dFECHAR := DMLOG.cdsNIS.FieldByName('NISAFREG').AsDateTime;
   sNISA := DMLOG.cdsNIS.FieldByName('NISAID').AsString;
   sTDA := DMLOG.cdsNIS.FieldByName('TDAID').AsString;
   sLOC := DMLOG.cdsNIS.FieldByName('LOCID').AsString;
   If iEstado = 0 Then
   Begin
      bExiste := DMLOG.cdsKDX.Locate('CIAID;ALMID;ARTID;NISAID;TDAID;LOCID', VarArrayOf([sCIA, sALM, sART, sNISA, sTDA, sLOC]), [])
   End
   Else
      bExiste := False;
   If bExiste Then // localizar el valor....
   Begin
      ErrorMsg('Error', 'No pueden existir artículos duplicados...');
      Exit; // salir del procedimiento
   End;
   Screen.Cursor := crHourGlass;
   DecodeDate(dFECHAR, Y, M, D);
   If (PedidoG = CantidadG) And
      (PedidoU = CantidadU) Then
      sSit := 'ATENDIDO'
   Else
      sSit := 'PENDIENTE';
 {Guardar los datos del detalle }
   If iEstado = 0 Then
      DMLOG.cdsKDX.Insert
   Else
      DMLOG.cdsKDX.Edit;
 {+----------------------------------------------------------------------------+
 |                     GENERANDO MOVIMIENTO DEL ARTICULO                       |
 |     1. Insertar o adicionar registros del movimiento de los artículos       |
 +----------------------------------------------------------------------------+}
   If DMLOG.cdsKDX.State In [dsInsert, dsEdit] Then
   Begin
      Try
         DMLOG.cdsKDX.FieldByName('KDXID').AsString := dbeItem.Text;
         DMLOG.cdsKDX.FieldByName('CIAID').AsString := sCIA;
         DMLOG.cdsKDX.FieldByName('ALMID').AsString := sALM;
         DMLOG.cdsKDX.FieldByName('ARTID').AsString := sART;
         DMLOG.cdsKDX.FieldByName('TDAID').AsString := sTDA;
         DMLOG.cdsKDX.FieldByName('LOCID').AsString := sLOC;
         DMLOG.cdsKDX.FieldByName('KDXFREG').AsDateTime := dFECHAR;
         DMLOG.cdsKDX.FieldByName('KDXPEDIDOG').AsString := FloatToStr(PedidoG);
         DMLOG.cdsKDX.FieldByName('KDXPEDIDOU').AsString := FloatToStr(PedidoU);
         DMLOG.cdsKDX.FieldByName('KDXCNTG').AsString := FloatToStr(CantidadG);
         DMLOG.cdsKDX.FieldByName('KDXCNTU').AsString := FloatToStr(CantidadU);
         DMLOG.cdsKDX.FieldByName('SITUACION').AsString := sSit;
         If chkBxAtendido.Checked Then
            DMLOG.cdsKDX.FieldByName('NISAATERQS').AsString := 'S'
         Else
            DMLOG.cdsKDX.FieldByName('NISAATERQS').Clear;

         DMLOG.cdsKDX.FieldByName('KDXSALDOG').AsString := FloatToStr(PedidoG - CantidadG);
         DMLOG.cdsKDX.FieldByName('KDXSALDOU').AsString := FloatToStr(PedidoU - CantidadU);

         DMLOG.cdsKDX.FieldByName('ARTDES').AsString := DMLOG.cdsQry.FieldByName('ARTDES').AsString;
         DMLOG.cdsKDX.FieldByName('FAMID').AsString := DMLOG.cdsQry.FieldByName('FAMID').AsString;
         DMLOG.cdsKDX.FieldByName('SFAMID').AsString := DMLOG.cdsQry.FieldByName('SFAMID').AsString;
         DMLOG.cdsKDX.FieldByName('TINID').AsString := DMLOG.cdsQry.FieldByName('TINID').AsString;
         DMLOG.cdsKDX.FieldByName('GRARID').AsString := DMLOG.cdsQry.FieldByName('GRARID').AsString;
         DMLOG.cdsKDX.FieldByName('ARTCONT').AsString := DMLOG.cdsQry.FieldByName('ARTCONT').AsString;
         DMLOG.cdsKDX.FieldByName('UNMIDG').AsString := DMLOG.cdsQry.FieldByName('UNMIDG').AsString;
         DMLOG.cdsKDX.FieldByName('UNMIDU').AsString := DMLOG.cdsQry.FieldByName('UNMIDU').AsString;
         DMLOG.cdsKDX.FieldByName('FABID').AsString := DMLOG.cdsQry.FieldByName('FABID').AsString;
         DMLOG.cdsKDX.FieldByName('ARTSPRO').AsString := DMLOG.cdsQry.FieldByName('ARTSPRO').AsString;
         DMLOG.cdsKDX.FieldByName('ARTSCA').AsString := DMLOG.cdsQry.FieldByName('ARTSCA').AsString;
         DMLOG.cdsKDX.FieldByName('ARTPARA').AsString := DMLOG.cdsQry.FieldByName('ARTPARA').AsString;
         DMLOG.cdsKDX.FieldByName('ARTSNA').AsString := DMLOG.cdsQry.FieldByName('ARTSNA').AsString;
      // El costo de la salida toma el costo promedio actual
      // Eso me sirve para el caso de transferencia
      // En realidad, el costo de salida real, lo determina recien en el momento de
      // aceptar la nota de salida
         DMLOG.cdsKDX.FieldByName('ARTPCU').AsString := DMLOG.cdsQry.FieldByName('ARTCPROU').AsString;
         DMLOG.cdsKDX.FieldByName('ARTPCG').AsString := DMLOG.cdsQry.FieldByName('ARTCPROG').AsString;
         DMLOG.cdsKDX.FieldByName('ARTPVU').AsString := DMLOG.cdsQry.FieldByName('ARTPVU').AsString;
         DMLOG.cdsKDX.FieldByName('ARTPVG').AsString := DMLOG.cdsQry.FieldByName('ARTPVG').AsString;
         DMLOG.cdsKDX.FieldByName('ARTFUC').AsDateTime := DMLOG.cdsQry.FieldByName('ARTFUC').AsDateTime;
         DMLOG.cdsKDX.FieldByName('TMONID').AsString := DMLOG.cdsQry.FieldByName('TMONID').AsString;
         DMLOG.cdsKDX.FieldByName('ARTCRGO').AsString := DMLOG.cdsQry.FieldByName('ARTCRGO').AsString;
         DMLOG.cdsKDX.FieldByName('ARTACTIVO').AsString := DMLOG.cdsQry.FieldByName('ARTACTIVO').AsString;
         DMLOG.cdsKDX.FieldByName('CUENTAID').AsString := DMLOG.cdsQry.FieldByName('CUENTAID').AsString;

         DMLOG.cdsKDX.FieldByName('PROV').AsString := DMLOG.cdsNIS.FieldByName('PROV').AsString;
         DMLOG.cdsKDX.FieldByName('DOCID').AsString := DMLOG.cdsNIS.FieldByName('DOCID').AsString;

         DMLOG.cdsKDX.FieldByName('TRIID').AsString := DMLOG.cdsNIS.FieldByName('TRIID').AsString;

         DMLOG.cdsKDX.FieldByName('CCOSID').AsString := DMLOG.cdsNIS.FieldByName('CCOSID').AsString;
         DMLOG.cdsKDX.FieldByName('ODCID').AsString := DMLOG.cdsNIS.FieldByName('ODCID').AsString;
         DMLOG.cdsKDX.FieldByName('NISAID').AsString := DMLOG.cdsNIS.FieldByName('NISAID').AsString;
         DMLOG.cdsKDX.FieldByName('NISATIP').AsString := DMLOG.cdsNIS.FieldByName('NISATIP').AsString;
         DMLOG.cdsKDX.FieldByName('NISASOLIC').AsString := DMLOG.cdsNIS.FieldByName('NISASOLIC').AsString;
         DMLOG.cdsKDX.FieldByName('NISAFREG').AsDateTime := DMLOG.cdsNIS.FieldByName('NISAFREG').AsDateTime;
         DMLOG.cdsKDX.FieldByName('NISANDOC').AsString := DMLOG.cdsNIS.FieldByName('NISANDOC').AsString;
         DMLOG.cdsKDX.FieldByName('NISAFDOC').AsDateTime := DMLOG.cdsNIS.FieldByName('NISAFDOC').AsDateTime;
         DecodeDate(DMLOG.cdsNIS.FieldByName('NISAFREG').AsDateTime, Y, M, D);
         DMLOG.cdsKDX.FieldbyName('KDXUSER').AsString := DMLOG.wUsuario; // por el momento nada no se sabe nada del usuario
         DMLOG.cdsKDX.FieldbyName('KDXANO').AsString := IntToStr(Y);
         DMLOG.cdsKDX.FieldbyName('KDXMM').AsString := DMLOG.strzero(IntToStr(M), 2);
         DMLOG.cdsKDX.FieldbyName('KDXDD').AsString := DMLOG.strzero(IntToStr(D), 2);

         sFecha := formatdatetime(DMLOG.wFormatFecha, dbdtpFNS.DateTime);
         sSQL := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(sFecha);
         DMLOG.FiltraCDS(DMLOG.cdsPeriodo, sSQL);

         DMLOG.cdsKDX.FieldbyName('KDXAnoMM').AsString := IntToStr(Y) + DMLOG.strzero(IntToStr(M), 2);
         DMLOG.cdsKDX.FieldbyName('KDXTri').AsString := DMLOG.cdsPeriodo.fieldbyName('FECTRIM').asString;
         DMLOG.cdsKDX.FieldbyName('KDXSem').AsString := DMLOG.cdsPeriodo.fieldbyName('FECSEM').asString;
         DMLOG.cdsKDX.FieldbyName('KDXSS').AsString := DMLOG.cdsPeriodo.fieldbyName('FECSS').asString;
         DMLOG.cdsKDX.FieldbyName('KDXAATri').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAATRI').asString;
         DMLOG.cdsKDX.FieldbyName('KDXAASem').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAASEM').asString;
         DMLOG.cdsKDX.FieldbyName('KDXAASS').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAASS').asString;
         DMLOG.cdsKDX.FieldbyName('KDXFReg').AsDateTime := Date;
         DMLOG.cdsKDX.FieldbyName('KDXHReg').AsDateTime := SysUtils.Time;

         DMLOG.cdsKDX.FieldbyName('CUENTA2ID').AsString := wCUENTA;
         DMLOG.cdsKDX.FieldbyName('KDXCVTAS').AsString := wTRICVTAS;
         DMLOG.cdsKDX.Post;
         OnOffDetalle(True); // Activar Detalle
         pnlDetalleA.Visible := False;
         btnDetalle;
         If Z2bbtnNuevo.Visible Then
            Z2bbtnCanc2.Enabled := False
         Else
            Z2bbtnCanc2.Enabled := True;
         Z2bbtnGraba.Enabled := true;
         Z2bbtnAceptar.Enabled := false;
         Z2bbtnNuevo.Enabled := false;
      Except
         On E: Exception Do EHandlerError(E);
      End;
   End;

   Screen.Cursor := crDefault;
   Z2dbgDReqsIButton.Click;
End;

Procedure TFRegNtaS.Z2bbtnRegCancClick(Sender: TObject);
Begin
   If DMLOG.cdsKDX.State In [dsInsert, dsEdit] Then
      DMLOG.cdsKDX.Cancel;
   OnOffDetalle(True); // activar detalle
   pnlDetalleA.Visible := False;
End;

Procedure TFRegNtaS.OnOffCabecera(Value: Boolean);
Begin
  // ....................... activar cabecera de requisición ...................
   pnlCabecera.Enabled := Value;
   Z2bbtnBorrar.Enabled := Value;
   Z2bbtnOK.Enabled := Value;
End;

Procedure TFRegNtaS.OnOffDetalle(Value: Boolean);
Begin
  // ....................... activar detalle de requisición ....................
   If Value Then
      stxTitulo1.Color := clHighlight
   Else
      stxTitulo1.Color := clGray;

   pnlDetalleG.Enabled := Value;
   Z2bbtnCanc2.Enabled := Value;
   Z2bbtnGraba.Enabled := Value;
   Z2bbtnNuevo.Enabled := Value;

   btnDetalle;
End;

Procedure TFRegNtaS.btnDetalle;
Var
   bDummy1: Boolean;
Begin
   bDummy1 := (DMLOG.cdsKDX.RecordCount > 0) And
      ((DMLOG.cdsNIS.ChangeCount > 0) Or
      (DMLOG.cdsKDX.ChangeCount > 0) Or
      (DMLOG.cdsNIS.Modified) Or
      (DMLOG.cdsKDX.Modified));
   Z2bbtnGraba.Enabled := bDummy1;
   Z2bbtnCanc2.Enabled := bDummy1;
   Z2bbtnNuevo.Enabled := (DMLOG.cdsKDX.ChangeCount = 0) And (DMLOG.cdsNIS.ChangeCount = 0);
End;

Procedure TFRegNtaS.Z2bbtnNuevoClick(Sender: TObject);
Var
   sNUM, sCIA, sALM, sTDA, sTIN, sLOC, xSQL: String;
Begin
   xCrea := True;
   OnOffCabecera(True);
   OnOffDetalle(False);
   dblcCIA.Enabled := True;
   dbeNumNISA.Enabled := True;
   dblcTALM.Enabled := True;
   dblcLOC.Enabled := True;
   dblcTInv.Enabled := True;
   dblcTransac.Enabled := True;
   dblcdCC.Enabled := True;
   dblcTDA.Enabled := True;
   dbeCIA.Text := '';
   dbeLOC.Text := '';
   dblcTInv.Text := '';
   dbeTinv.Text := '';
   dbeALM.Text := '';
   dbeTDNISA.Text := '';
   dbeTransac.Text := '';
   dbeLOCOri.Text := '';
   dbeALMOri.Text := '';
   dbeCC.Text := '';
   dbeProv.Text := '';
   dbeDOCS.Text := '';
   dbeSerie.Text := '';
   dbeNDoc.Text := '';
   dbeSolic.Text := '';
   deObra.Text := '';
   dbeLote.Text := '';
   dbePO.Text := '';
   dbeNP.Text := '';
   dbmObs.Text := '';
   DMLOG.cdsNIS.Insert;
   If DMLOG.cdsNIS.State In [dsInsert] Then
   Begin
      dcCIA;
      dcTDA;
      dcLOC;
      sCIA := DMLOG.cdsNIS.FieldByName('CIAID').AsString;
      sALM := DMLOG.cdsNIS.FieldByName('ALMID').AsString;
      sTDA := DMLOG.cdsNIS.FieldByName('TDAID').AsString;
      sLOC := DMLOG.cdsNIS.FieldByName('LOCID').AsString;
      sTIN := DMLOG.cdsNIS.FieldByName('TINID').AsString;
      dblcTDAExit(Nil);
      DMLOG.cdsNIS.FieldByName('NISAID').AsString := sNUM; //marks
   End;
   wOperacion := 'ADD';
   btnDetalle;
   xSQL := ' Select * '
      + '      from LOG315 '
      + '     where NISATIP=''NINGUNO'' ';
   Init(Sender);
   DMLOG.cdsKDX.Close;
   DMLOG.cdsKDX.DataRequest(xSQL);
   DMLOG.cdsKDX.Open;
   lblEstado.Caption := 'INICIAL';
   DMLOG.cdsNIS.FieldByName('NISSIT').AsString := 'INICIAL';
   DMLOG.cdsNIS.FieldByName('NISATIP').AsString := 'SALIDA';
   xCrea := False;
End;

Procedure TFRegNtaS.dbgDReqsKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
{var
  dFECHAR   : TDateTime;
  Y, M, D   : Word;
  Contenido : Double;
 xSQL, Ano, Mes, sCIA, sART, sALM, sTIN, sLOC : String;}
Begin
   If (Key = $4D) And (ssCtrl In Shift) Then
   Begin
      dbgDReqsDblClick(Nil);
   End;

   If (Key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      DMLOG.cdsKDX.Delete;
   End;
   btnDetalle;
   Z2bbtnGraba.Enabled := True;
End;

Procedure TFRegNtaS.dbgDReqsDblClick(Sender: TObject);
Var
   sWhere, sTmp: String;
   Uni: Boolean;
Begin
   If (DMLOG.cdsNis.FieldByName('NISSIT').AsString = 'ACEPTADO') Then
   Begin
      ErrorMsg('Observación', ' La Nota ya ha sido Aceptado ');
      exit;
   End;
   If DMLOG.cdsKDX.recordcount = 0 Then
      exit;
   OnOffDetalle(False); // Desactivar el panel de detalle
   dbeItem.Clear;
   dbcldArti.Clear;
   dbeArti.Clear;
   dbeItem.Text := DMLOG.cdsKDX.FieldByName('KDXID').AsString;
   dbcldArti.Text := DMLOG.cdsKDX.FieldByName('ARTID').AsString;
   dbeCantidadG.Text := DMLOG.cdsKDX.FieldByName('KDXCNTG').AsString;
   dbeCantidadU.Text := DMLOG.cdsKDX.FieldByName('KDXCNTU').AsString;
   dbePedidoG.Text := DMLOG.cdsKDX.FieldByName('KDXPEDIDOG').AsString;
   dbePedidoU.Text := DMLOG.cdsKDX.FieldByName('KDXPEDIDOU').AsString;
   If DMLOG.cdsKDX.FieldByName('NISAATERQS').AsString = 'S' Then
      chkBxAtendido.Checked := true
   Else
      chkBxAtendido.Checked := false;

   sWhere := 'ARTID=' + quotedstr(dbcldArti.Text) + ' AND CIAID=' + quotedstr(dblcCIA.Text);
   dbeArti.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE205', 'ARTDES', sWhere, 'ARTDES');
   pnlDetalleA.Visible := True; // Activar el panel de Mantenimiento
   dbcldArti.Enabled := False;

   Uni := (DMLOG.DisplayDescrip('prvTGE', 'TGE205', 'ARTCONT', 'ARTID=' + quotedstr(dbcldArti.Text), 'ARTCONT') <> '1');
   sTmp := 'UNMID=' + quotedstr(DMLOG.DisplayDescrip('prvTGE', 'TGE205', 'UNMIDG', sWhere, 'UNMIDG'));
   lblMedGnrl.Caption := 'Med. Gnrl. ' + DMLOG.DisplayDescrip('prvTGE', 'TGE130', 'UNMABR', sTmp, 'UNMABR');
   If Uni = True Then
   Begin
      sTmp := 'UNMID=' + quotedstr(DMLOG.DisplayDescrip('prvTGE', 'TGE205', 'UNMIDU', sWhere, 'UNMIDU'));
      lblMedUni.Caption := 'Med. Uni. ' + DMLOG.DisplayDescrip('prvTGE', 'TGE130', 'UNMABR', sTmp, 'UNMABR');
   End;
   dbePedidoU.Enabled := Uni;
   dbeCantidadU.Enabled := Uni;

   pnlDetalleA.BringToFront;
   iEstado := 1;
   sOK := 1;
   btnDetalle;
End;

Procedure TFRegNtaS.dbeNumNISAExit(Sender: TObject);
Var
   iVal, iCod: Integer;
   sNUM, sCIA, sALM, sTDA, sTIN, sLOC, sTIP: String;
Begin
   Val(dbeNumNISA.Text, iVal, iCod);
   sCIA := dblcCIA.Text; //FieldByName('CIAID').AsString;
   sALM := dblcTALM.Text; //FieldByName('ALMID').AsString;
   sTDA := dblcTALM.Text; //FieldByName('TDAID').AsString;
   sLOC := dblcLOC.Text; //FieldByName('LOCID').AsString;
   sTIN := dblcTInv.Text; //FieldByName('LOCID').AsString;
   sTIP := 'SALIDA';

   sNUM := dbeNumNISA.Text; //FieldByName('NISAID').AsString;
End;

Procedure TFRegNtaS.dbmObsKeyPress(Sender: TObject; Var Key: Char);
Var
   sC: String;
Begin
   sC := Key;
   sC := Uppercase(sC);
   Key := sC[1];
End;

Procedure TFRegNtaS.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMLOG.cdsTDOC.Filtered := False;
   DMLOG.cdsTDOC.Filter := '';
   DMLOG.cdsTDOC.Filtered := True;

   If (DMLOG.cdsNIS.ChangeCount > 0) Or (DMLOG.cdsNIS.Modified) Then
      DMLOG.cdsNIS.CancelUpdates;
   btnDetalle;

   If pnlDetallea.Visible Then
      Z2bbtnRegCanc.OnClick(Nil);
   DMLOG.cdsTRAN.Close;
   xCrea := true;
End;

Function TFRegNtaS.EHandlerError(Ex: Exception): Boolean;
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

Procedure TFRegNtaS.dblcdCCExit(Sender: TObject);
Var
   xSql, xWhere, xParPres, xTipPres: String;
Begin
   xPresu := 'N';
   dbeCC.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE203', 'CCOSDES', 'CCOSID=' + quotedStr(dblcdCC.text), 'CCOSDES');
   If (DMLOG.cdsNIS.State = dsInsert) And
      (Length(Trim(dbeSolic.text)) = 0) Then
      DMLOG.cdsNIS.FieldByName('NISASOLIC').AsString := dbeCC.text;
   If dblcdCC.Text = '' Then Exit;
   If wActuaPresu Then
   Begin
      Try
         If False Then // no hay control de Presupuestos correctamente definido
         Begin
            Screen.Cursor := crHourGlass;
            DMLOG.FiltraTabla(DMLOG.cdsTipPre, 'PRES101', 'TIPRESID', '');
            DMLOG.FiltraTabla(DMLOG.cdsParPre, 'PRES201', 'PARPRESID', '');
            DMLOG.cdsParPre.Open;
            pnlActualizando.Visible := True;
            pnlActualizando.Refresh;
            lblActualizando.Caption := 'Buscando Partidas Presupuestales...';
            lblActualizando.Refresh;
            xWhere := 'CCOSID=' + quotedstr(dblcdCC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
            If Length(DMLOG.DisplayDescrip('prvTGE', 'PPRES301', 'CCOSID', xWhere, 'CCOSID')) > 0 Then
            Begin
               xPresu := 'S';
               xSql := 'SELECT CIAID,CCOSID,PARPRESID,TIPPRESID FROM PPRES301 WHERE CCOSID=' + quotedstr(dblcdCC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
               DMLOG.cdsSQL.Close;
               DMLOG.cdsSQL.DataRequest(xSql);
               DMLOG.cdsSQL.open;
               DMLOG.cdsSQL.First;
               xParPres := 'SELECT * FROM PPRES201 WHERE CIAID=' + quotedstr(dblcCIA.text);
               xTipPres := 'SELECT * FROM PPRES101 WHERE';
               DMLOG.cdsParPre.IndexFieldNames := 'CIAID;PARPRESID;PARPRESMOV';
               DMLOG.cdsTipPre.IndexFieldNames := 'TIPPRESID';
               While Not DMLOG.cdsSQL.Eof Do
               Begin
                  DMLOG.cdsParPre.SetKey;
                  DMLOG.cdsParPre.FieldByName('CIAID').AsString := DMLOG.cdsSQL.fieldbyname('CIAID').Asstring;
                  DMLOG.cdsParPre.FieldByName('PARPRESID').AsString := DMLOG.cdsSQL.fieldbyname('PARPRESID').Asstring;
                  DMLOG.cdsParPre.FieldByName('PARPRESMOV').AsString := 'S';
                  If DMLOG.cdsParPre.GotoKey Then
                     xParPres := xParPres + ' AND PARPRESID =' + quotedstr(DMLOG.cdsSQL.fieldbyname('PARPRESID').Asstring);
                  DMLOG.cdsTipPre.SetKey;
                  DMLOG.cdsTipPre.FieldByName('TIPPRESID').AsString := DMLOG.cdsSQL.fieldbyname('TIPPRESID').Asstring;
                  If DMLOG.cdsTipPre.GotoKey Then
                     If Length(xTipPres) > 28 Then
                        xTipPres := xTipPres + ' AND TIPPRESID =' + quotedstr(DMLOG.cdsSQL.fieldbyname('TIPPRESID').Asstring)
                     Else
                        xTipPres := xTipPres + ' TIPPRESID =' + quotedstr(DMLOG.cdsSQL.fieldbyname('TIPPRESID').Asstring);
                  DMLOG.cdsSQL.Next;
               End;
               DMLOG.cdsParPre.Close;
               DMLOG.cdsParPre.DataRequest(xParPres);
               DMLOG.cdsParPre.Open;
               DMLOG.cdsTipPre.Close;
               DMLOG.cdsTipPre.DataRequest(xTipPres);
               DMLOG.cdsTipPre.Open;
               dblcTipPre.enabled := wActuaPresu;
               dblcdPresup.enabled := wActuaPresu;
            End
            Else
            Begin
               showmessage('Centro de Costo No tiene Partida Presupuestal');
               xPresu := 'N';
            End;
         End;
      Finally
         pnlActualizando.Visible := False;
         Screen.Cursor := crDefault;
      End;
   End;
End;

Procedure TFRegNtaS.dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;

   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRegNtaS.Init(Sender: TObject);
Var
   sNUM, sCIA, sALM, sTDA, sLOC, sTIN: String;
Begin
   OnOffCabecera(True); //Activar la cabecera
   OnOffDetalle(False); //Desactivar el panel de detalle
   btnDetalle;

   DMLOG.cdsTDOC.Filtered := False;
   DMLOG.cdsTDOC.Filter := '';
   DMLOG.cdsTDOC.Filter := 'REFALM=''S''';
   DMLOG.cdsTDOC.Filtered := True;

   If DMLOG.cdsNIS.State In [dsInsert] Then
   Begin
      dcCIA;
      dcLOC;
      dcTDA;
      sCIA := DMLOG.cdsNIS.FieldByName('CIAID').AsString;
      sALM := DMLOG.cdsNIS.FieldByName('ALMID').AsString;
      sTDA := DMLOG.cdsNIS.FieldByName('TDAID').AsString;
      sLOC := DMLOG.cdsNIS.FieldByName('LOCID').AsString;
      sTIN := DMLOG.cdsNIS.FieldByName('TINID').AsString;

      dblcTDAExit(Nil);
      DMLOG.cdsNIS.FieldByName('TDAID').AsString := sTDA;
      DMLOG.cdsNIS.FieldByName('NISAID').AsString := sNUM;
      lblEstado.Caption := 'INICIAL';
      DMLOG.cdsNIS.FieldByName('NISSIT').AsString := 'INICIAL';
   End
   Else
   Begin
      If showing Then
      Begin
         dblcTransacExit(Nil);
      End;
   End;
End;

Procedure TFRegNtaS.dbeCantidadGExit(Sender: TObject);
Var
   sSQL, sTIN, sCIA, sALM, sART, sLOC: String;
   Y, M, D: Word;
   fSTK, Contenido: Double;
Begin
 // verificar si existe suficientes articulos en STOCK para poder atender el requerimiento
 // tomar el articulo, compañía, almacén y verificar si se halla en stock en el mes anterior correspondiente
   sOK := 0;
   If (Z2bbtnRegCanc.Focused) Or
      (Z2bbtnSalir.Focused) Then
      exit;

   If (strtofloat(dbeCantidadG.Text) > strtofloat(dbePedidoG.Text)) Or
      (strtofloat(dbeCantidadU.Text) > strtofloat(dbePedidoU.Text)) Then
   Begin
      ErrorMsg('Adquisiciones', 'La Cantidad Atendida no Puede ser Mayor a la Pedida');
      Exit;
   End;
   sCIA := DMLOG.cdsNIS.FieldByName('CIAID').AsString;
   sALM := DMLOG.cdsNIS.FieldByName('ALMID').AsString;
   sART := dbcldArti.Text;
   sLOC := DMLOG.cdsNIS.FieldByName('LOCID').AsString;
   sTIN := DMLOG.cdsNIS.FieldByName('TINID').AsString;

   DecodeDate(DMLOG.cdsNIS.FieldByName('NISAFREG').AsDateTime, Y, M, D);
   sART := dbcldArti.Text;
   sSQL := 'ARTID=''' + sART + ''' AND CIAID= ''' + sCIA + '''';
   DMLOG.DisplayDescrip('prvTGE', 'TGE205', 'ARTCONT', sSQL, 'ARTCONT');
   Contenido := DMLOG.cdsQry.FieldByName('ARTCONT').AsFloat;
   sSQL := 'ARTID=''' + sART + ''' AND CIAID= ''' + sCIA + ''' AND ALMID=''' + sALM + ''' AND STKANO=''' + IntToStr(Y) + ''' AND LOCID=''' + sLOC + ''' AND TINID=''' + sTIN + '''';
   DMLOG.DisplayDescrip('prvTGE', 'LOG316', 'ARTID,STKSACTG,STKSACTU', sSQL, 'ARTID'); // Para tomar los datos de Saldos de Articulos
   If DMLOG.cdsQry.RecordCount = 0 Then
   Begin
      ErrorMsg('Error', ' No Existe El producto para dar Salida !!!');
      Exit;
   End;
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      fSTK := DMLOG.cdsQry.FieldByName('STKSACTG').AsFloat * Contenido + DMLOG.cdsQry.FieldByName('STKSACTU').AsFloat;
      If fSTK <= 0 Then
      Begin
         ErrorMsg('Error', ' El Stock del Producto se Halla en CERO !!!');
         Exit;
      End;
      If StrToFloat(dbeCantidadG.Text) * Contenido + StrToFloat(dbeCantidadU.Text) > fSTK Then
      Begin
         If (Sender = dbeCantidadG) And (StrToFloat(dbeCantidadG.Text) > 0) Then
         Begin
            ErrorMsg('Error', ' La Cantidad a dar Salida excede a la cantidad en stock que es de ' + Format('%8.2f', [fSTK / Contenido]) + '  !!!');
            Exit;
         End
         Else
            If (Sender = dbeCantidadU) And (StrToFloat(dbeCantidadU.Text) > 0) Then
            Begin
               ErrorMsg('Error', ' La Cantidad a dar Salida excede a la cantidad en stock que es de  ' + FloattoStr(fSTK) + '  !!!');
               Exit;
            End;
      End;
   End;
   sOK := 1;
End;

Procedure TFRegNtaS.dblcdCCChange(Sender: TObject);
Begin
   dbeCC.Text := DMLOG.cdsCCost.FieldByName('CIADES').AsString;
End;

Procedure TFRegNtaS.dcCIA;
Var
   sCIA, xSQL: String;
   sState: TDataSetState;
Begin
   sState := DMLOG.cdsNIS.State;
   DMLOG.cdsCIA.First;
   sCIA := trim(DMLOG.cdsCIA.FieldByName('CIAID').AsString);
   If (sState = dsInsert) And Not (DMLOG.cdsNIS.State In [dsInsert]) Then DMLOG.cdsNIS.Insert;
   If (sState = dsEdit) And Not (DMLOG.cdsNIS.State In [dsEdit]) Then DMLOG.cdsNIS.Edit;

   dblcCIA.Enabled := (DMLOG.cdsCIA.RecordCount > 1);
   DMLOG.cdsNIS.FieldByName('CIAID').AsString := sCIA;
   dbeCIA.Text := DMLOG.cdsCIA.FieldByName('CIADES').AsString;
   xSQL := 'Select * from TGE126 Where CIAID=' + quotedstr(sCIA);
   DMLOG.cdsLOC.Close;
   DMLOG.cdsLOC.DataRequest(xSQL);
   DMLOG.cdsLOC.open;
End;

Procedure TFRegNtaS.dcALM;
Var
   sALM: String;
   sState: TDataSetState;
Begin
   sState := DMLOG.cdsNIS.State;
   If DMLOG.cdsALM.Active Then
   Begin
      DMLOG.cdsALM.First;
      sALM := trim(DMLOG.cdsALM.FieldByName('ALMID').AsString);

      If (sState = dsInsert) And Not (DMLOG.cdsNIS.State In [dsInsert]) Then DMLOG.cdsNIS.Insert;
      If (sState = dsEdit) And Not (DMLOG.cdsNIS.State In [dsEdit]) Then DMLOG.cdsNIS.Edit;

      dblcTALM.Enabled := (DMLOG.cdsALM.RecordCount > 1);
      If DMLOG.cdsALM.RecordCount = 1 Then
      Begin
         DMLOG.cdsNIS.FieldByName('ALMID').AsString := sALM;
         dbeALM.Text := DMLOG.cdsALM.FieldByName('ALMDES').AsString;
      End;
   End;
End;

Procedure TFRegNtaS.dcLOC;
Var
   sLOC: String;
   sState: TDataSetState;
Begin
   sState := DMLOG.cdsNIS.State;
   If DMLOG.cdsLOC.Active Then
   Begin
      DMLOG.cdsLOC.First;
      sLOC := trim(DMLOG.cdsLOC.FieldByName('LOCID').AsString);
      If (sState = dsInsert) And Not (DMLOG.cdsNIS.State In [dsInsert]) Then DMLOG.cdsNIS.Insert;
      If (sState = dsEdit) And Not (DMLOG.cdsNIS.State In [dsEdit]) Then DMLOG.cdsNIS.Edit;

      If DMLOG.cdsLOC.RecordCount = 1 Then
      Begin
         DMLOG.cdsNIS.FieldByName('LOCID').AsString := sLOC;
         dblcLOCExit(Nil);
      End;
      If DMLOG.cdsCIA.RecordCount > 1 Then
         Exit;
      dblcLOC.Enabled := (DMLOG.cdsLOC.RecordCount > 1);
   End;
End;

Procedure TFRegNtaS.dcTDA;
Var
   sTDA: String;
   sState: TDataSetState;
Begin
   sState := DMLOG.cdsNIS.State;
   DMLOG.cdsTDNISA.First;
   sTDA := trim(DMLOG.cdsTDNISA.FieldByName('TDAID').AsString);
   If (sState = dsInsert) And Not (DMLOG.cdsNIS.State In [dsInsert]) Then
      DMLOG.cdsNIS.Insert;
   If (sState = dsEdit) And Not (DMLOG.cdsNIS.State In [dsEdit]) Then
      DMLOG.cdsNIS.Edit;
   dblcTDA.Enabled := True;
   If DMLOG.cdsTDNISA.RecordCount = 1 Then
   Begin
      DMLOG.cdsNIS.fieldbyname('TDAID').AsString := DMLOG.cdsTDNISA.fieldbyname('TDAID').AsString;
      DMLOG.cdsNIS.FieldByName('TDAID').AsString := sTDA;
      dbeTDNISA.Text := DMLOG.cdsTDNISA.FieldByName('TDADES').AsString
   End;
End;

Procedure TFRegNtaS.Z2bbtnAceptarClick(Sender: TObject);
Var
   dFECHAR: TDateTime;
   Y, M, D: Word;
   xSQL, Ano, Mes, sCIA, sART, sALM, sTIN, sLOC: String;
Begin
   If (DMLOG.cdsNis.FieldByName('NISSIT').AsString = 'ACEPTADO') Then
   Begin
      ErrorMsg('Observación', ' La Nota ya ha sido Aceptado ');
      exit;
   End;
   If (DMLOG.cdsKDX.RecordCount = 0) Then
   Begin
      ErrorMsg('Adquisiciones', ' No se Puede Aceptar este Documento ');
      exit;
   End;
   If Not Question('Adquisiciones', 'Este Proceso: ' + #13 + #13 +
      'Acepta la Nota de Salida ' + #13 + #13 + #13 + 'Desea Continuar ') Then
   Begin
      Exit;
   End;
   Screen.Cursor := crHourGlass;
   pnlActuali.Visible := true;
   pnlActuali.Refresh;
   dFECHAR := DMLOG.cdsNIS.FieldByName('NISAFREG').AsDateTime;
   sCIA := DMLOG.cdsNIS.FieldByName('CIAID').AsString;
   sALM := DMLOG.cdsNIS.FieldByName('ALMID').AsString;
   sLOC := DMLOG.cdsNIS.FieldByName('LOCID').AsString;
   sTIN := DMLOG.cdsNIS.FieldByName('TINID').AsString;

   DecodeDate(dFECHAR, Y, M, D);
   Ano := IntToStr(Y);
   Mes := DMLOG.StrZero(IntToStr(M), 2);
   Try
      DMLOG.cdsKDX.DisableControls;
      DMLOG.cdsKDX.first;
      While Not DMLOG.cdsKDX.Eof Do
      Begin
         If DMLOG.cdsKDX.FieldByName('SITUACION').AsString <> 'DEPURADO' Then
         Begin
            sArt := DMLOG.cdsKDX.FieldByName('ARTID').AsString;
            xSQL := 'Select ARTID, ARTCONT, ARTMNTG, ARTMNTU, ARTFUPRC, ARTCNTG, ARTCNTU, ARTCPROG, '
               + '          ARTCPROU, ARTPCU, ARTPCG, ARTFUMV, ARTFUC '
               + '     from TGE205 '
               + '    where CIAID=' + quotedstr(sCIA)
               + '      and ARTID=' + quotedstr(sART);
         End;
         DMLOG.cdsKDX.next;
      End;
      DMLOG.cdsKDX.EnableControls;

      ActivaBotones(pnlDetalleG, False);
      Z2bbtnNuevo.Enabled := True;
      lblEstado.Caption := 'ACEPTADO';
      pnlActuali.Visible := false;
      Screen.Cursor := crDefault;
   Except
      pnlActuali.Visible := false;
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFRegNtaS.Adiciona;
Begin
   Z2bbtnNuevo.Visible := True;
   dblcTransac.Clear;
   dbeTransac.Clear;
   dblcdCC.Clear;
   dbeCC.Clear;
   dblcdProv.Clear;
   dbeProv.Clear;
End;

Procedure TFRegNtaS.Edita;
Begin
   If DMLOG.cdsNIS.FieldByName('NISSIT').AsString = 'ACEPTADO' Then
   Begin
      OnOffCabecera(False);
      OnOffDetalle(False); //Desactivar el panel de detalle
      lblEstado.Caption := 'ACEPTADO';
      ActivaBotones(pnlDetalleG, False);
   End
   Else
   Begin
      OnOffCabecera(True); //Activar la cabecera
      ActivaBotones(pnlDetalleG, false);
      OnOffDetalle(False); //Desactivar el panel de detalle
      lblEstado.Caption := 'INICIAL';
   End;
End;

Procedure TFRegNtaS.ActivaBotones(pnl: TPanel; xFlag: Boolean);
Var
   i: Integer;
Begin
   For i := 0 To pnl.ControlCount - 1 Do
   Begin
      If pnl.controls[i] Is tbitbtn Then
         TBitBtn(pnl.controls[i]).enabled := xFlag;
   End;
End;

Procedure TFRegNtaS.validafecha;
Begin
End;

Procedure TFRegNtaS.Nuevafecha;
Begin
End;

Procedure TFRegNtaS.dblcdTDOCExit(Sender: TObject);
Var
   bValue: Boolean;
   xSQL: String;
Begin
   bValue := Not (dblcdTDOC.Text = '');
   lblFDoc.Enabled := bValue;
   lblNDoc.Enabled := bValue;
   lblSerie.Enabled := bValue;
   dbeNDoc.Enabled := bValue;
   If DMLOG.cdsKDX.Active = true Then
      If DMLOG.cdsKDX.RecordCount = 0 Then
         dbdtpFDoc.Enabled := bValue;
   dbeSerie.Enabled := bValue;
   xSQL := 'DOCID=' + quotedstr(dblcdTDOC.Text);
   If (dblcdTDOC.text <> '') Then
      dbeDOCS.text := DMLOG.DisplayDescrip('prvTGE', 'TGE110', 'DOCDES', xSQL, 'DOCDES');
   If bValue Then
      dbeSerie.SetFocus;
End;

Procedure TFRegNtaS.dblcCIAExit(Sender: TObject);
Var
   xSQL, sNUM, sCIA, sALM, sTIN, sTDA, sLOC: String;
Begin
   xSQL := 'CIAID=' + quotedstr(dblcCIA.text);
   If DMLOG.cdsNIS.fieldbyname('CIAID').AsString <> '' Then
      dbeCIA.text := DMLOG.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', xSQL, 'CIADES');

   xSQL := 'SELECT * FROM TGE126 WHERE ' + xSQL;
   DMLOG.cdsLOC.Close;
   DMLOG.cdsLOC.DataRequest(xSQL);
   DMLOG.cdsLOC.open;

   If Not showing Then Exit;
   If Not (DMLOG.cdsNIS.State In [dsInsert, dsEdit]) Then exit;
   sCIA := dblcCIA.Text;
   sALM := dblcTALM.Text;
   sLOC := dblcLOC.Text;
   sTDA := dblcTDA.Text;
   sTIN := dblcTInv.Text;
   If (sCIA = '') Or (sALM = '') Or (sTDA = '') Or (sLOC = '') Then
      Exit;

   If DMLOG.cdsNIS.State In [dsInsert] Then
   Begin
      dbeNumNISA.Text := sNUM;
   End
   Else
   Begin
      snum := DMLOG.cdsNIS.fieldbyname('NISAID').AsString;
      dbeNumNISA.Text := sNUM;
   End;
End;

Procedure TFRegNtaS.dblcLOCExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeLoc.Text := DMLOG.DisplayDescrip('prvTGE', 'tge126', 'LOCDES', xSQL, 'LOCDES');
   xSQL := 'CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'SELECT * FROM TGE152 WHERE ' + xSQL;
   DMLOG.cdsTINID.Close;
   DMLOG.cdsTINID.DataRequest(xSQL);
   DMLOG.cdsTINID.open;
End;

Procedure TFRegNtaS.dblcTALMExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTInv.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALM.text);
   dbeALM.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');
End;

Procedure TFRegNtaS.dblcTDAExit(Sender: TObject);
Var
   sNUM, sCIA, sALM, sTIN, sLOC, sTDA, sSQL: String;
Begin
   If Not showing Then exit;

   If Not (DMLOG.cdsNIS.State In [dsInsert, dsEdit]) Then exit;
   If Not DMLOG.cdsNIS.Modified Then Exit;

   sCIA := dblcCIA.Text; //DMLOG.cdsNIS.FieldByName('CIAID').AsString;
   sALM := dblcTALM.Text; //DMLOG.cdsNIS.FieldByName('ALMID').AsString;
   sTDA := dblcTDA.Text; //DMLOG.cdsNIS.FieldByName('TDAID').AsString;
   sLOC := dblcLOC.Text; //DMLOG.cdsNIS.FieldByName('TDAID').AsString;
   sTIN := dblcTInv.Text; //DMLOG.cdsNIS.FieldByName('TDAID').AsString;

   If (sCIA = '') Or (sALM = '') Or (sTDA = '') Or (sLOC = '') Then
   Begin
      DMLOG.cdsNIS.FieldByName('TDAID').Clear;
      If xCrea Then
         Exit;
      dblcTALM.SetFocus;
      Exit;
   End;

   DMLOG.cdsTRAN.Close;
   sSQL := 'SELECT * FROM TGE208 WHERE TRISGT=''S''';
   DMLOG.cdsTRAN.DataRequest(sSQL);
   DMLOG.cdsTRAN.Open;

   If DMLOG.cdsNIS.State In [dsInsert, dsEdit] Then
   Begin
      DMLOG.cdsNIS.FieldByName('TRIID').Clear;
      DMLOG.cdsNIS.FieldByName('CCOSID').Clear;
      DMLOG.cdsNIS.FieldByName('PROV').Clear;
   End;
   dblcTransac.Clear;
   dbeTransac.Clear;
   dblcdCC.Clear;
   dbeCC.Clear;
   dblcdProv.Clear;
   dbeProv.Clear;
   If DMLOG.cdsNIS.State In [dsInsert] Then
   Begin
      dbeNumNISA.Text := sNUM;
   End
   Else
   Begin
      snum := DMLOG.cdsNIS.fieldbyname('NISAID').AsString;
      dbeNumNISA.Text := sNUM;
   End;
   If DMLOG.cdsNIS.fieldbyname('TDAID').AsString <> '' Then
      dbeTDNISA.text := DMLOG.cdsTDNISA.fieldbyname('TDADES').AsString;
End;

Procedure TFRegNtaS.dblcTransacExit(Sender: TObject);
Var
   xSQL, sSQL: String;
   P, C, T: Boolean;
Begin
   If Not showing Then
      Exit;
   xSQL := 'CIAID=' + quotedstr(dblcCIA.text);
   If DMLOG.cdsNIS.State = dsInsert Then
   Begin
      DMLOG.cdsNIS.fieldbyname('CCOSID').Clear;
      DMLOG.cdsNIS.fieldbyname('PROV').Clear;
      DMLOG.cdsNIS.fieldbyname('DOCID').Clear;
      DMLOG.cdsNIS.fieldbyname('LOCORIID').Clear;
      DMLOG.cdsNIS.fieldbyname('ALMORIID').Clear;
      dbeCC.Text := '';
      dbeProv.Text := '';
      dbeDOCS.Text := '';
      dbeLOCOri.Text := '';
      dbeTINOri.Text := '';
      dbeALMOri.Text := '';
   End;
   sSQL := 'TRIID=''' + dblcTransac.Text + '''' + ' AND TRISGT=''S''';
   C := (Trim(DMLOG.DisplayDescrip('prvTGE', 'TGE208', 'TRICC', sSQL, 'TRICC')) = 'S');
   P := (Trim(DMLOG.DisplayDescrip('prvTGE', 'TGE208', 'TRIPV', sSQL, 'TRIPV')) = 'S');
   T := (Trim(DMLOG.DisplayDescrip('prvTGE', 'TGE208', 'TRITMOV', sSQL, 'TRITMOV')) = 'T');

   wCuenta := DMLOG.DisplayDescrip('prvTGE', 'TGE208', 'CUENTAID', sSQL, 'CUENTAID');
   wTricvtas := DMLOG.DisplayDescrip('prvTGE', 'TGE208', 'TRICVTAS', sSQL, 'TRICVTAS');
   wTritdodes := DMLOG.DisplayDescrip('prvTGE', 'TGE208', 'TRITDODES', sSQL, 'TRITDODES');
   wtritrdes := DMLOG.DisplayDescrip('prvTGE', 'TGE208', 'TRITRDES', sSQL, 'TRITRDES');

   wGenTraAlm := (Trim(DMLOG.DisplayDescrip('prvTGE', 'TGE208', 'TRITMOV', sSQL, 'TRITMOV')) = 'T');

   DMLOG.cdsNIS.FieldByName('CCOSID').Required := C;
   DMLOG.cdsNIS.FieldByName('PROV').Required := P;

   dblcdCC.Enabled := C;
   lblCC.Enabled := C;

   dblcdProv.Enabled := P;
   lblProv.Enabled := P;

   If T Then
   Begin
      xSQL := 'SELECT * FROM TGE126 WHERE ' + xSQL + ' AND LOCID<>' + quotedstr(dblcLOC.text);
   End
   Else
   Begin
      dblcLOCOri.Text := '';
      dbeLOCOri.Text := '';
      dblcTINOri.Text := '';
      dbeTINOri.Text := '';
      dblcTALMOri.Text := '';
      dbeALMOri.Text := '';
      dblcTINOri.Text := '';
      dbeTINOri.Text := '';
   End;
   dblcLOCOri.Enabled := T;
   dblcTALMOri.Enabled := T;
   dblcTINOri.Enabled := T;

   xSQL := 'TRIID=' + quotedstr(dblcTransac.Text) + ' AND TRISGT=''S''';
   If DMLOG.cdsNIS.fieldbyname('TRIID').AsString <> '' Then
      dbeTransac.text := DMLOG.DisplayDescrip('prvTGE', 'TGE208', 'TRIDES', xSQL, 'TRIDES');
End;

Procedure TFRegNtaS.dblcLOCOriExit(Sender: TObject);
Var
   xSQL, sWhere: String;
Begin
   sWhere := 'CIAID=' + quotedstr(dblcCIA.Text) + ' AND LOCID=' + quotedstr(dblcLOCOri.Text);
   If DMLOG.cdsNIS.fieldbyname('LOCORIID').AsString <> '' Then
      dbeLOCOri.text := DMLOG.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', sWhere, 'LOCDES'); //DMLOG.cdsLKLOC.fieldbyname('LOCDES').AsSt2ring;

   xSQL := 'SELECT * FROM TGE152 WHERE CIAID=' + quotedstr(dblcCIA.text);
End;

Procedure TFRegNtaS.dblcTALMOriExit(Sender: TObject);
Var
   sWhere: String;
Begin
   sWhere := 'LOCID=' + quotedstr(dblcLOCOri.text) + ' AND TINID=' + quotedstr(dblcTINOri.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALMOri.text);
   If DMLOG.cdsNIS.fieldbyname('ALMORIID').AsString <> '' Then
      dbeALMOri.text := DMLOG.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', sWhere, 'ALMDES'); //DMLOG.cdsLKLOC.fieldbyname('LOCDES').AsSt2ring;
End;

Procedure TFRegNtaS.Z2bbtnSalirClick(Sender: TObject);
Begin
   DMLOG.cdsNIS.CancelUpdates;
   If DMLOG.cdsKDX.Active Then DMLOG.cdsKDX.CancelUpdates;
   Close;
End;

Procedure TFRegNtaS.dbcldArtiExit(Sender: TObject);
Var
   sWhere, sTmp: String;
   ConUnitaria: Boolean;
Begin
   If Z2bbtnRegCanc.Focused Then Exit;
   If DMLOG.wAnchoArt > 0 Then
   Begin
      If Length(dbcldArti.Text) < DMLOG.wAnchoArt Then
      Begin
         dbcldArti.Text := DMLOG.StrZero(dbcldArti.Text, DMLOG.wAnchoArt);
      End;
   End;
   sWhere := 'ARTID=' + quotedstr(dbcldArti.Text) + ' AND CIAID=' + quotedstr(dblcCIA.Text);
   dbeArti.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE205', 'ARTDES', sWhere, 'ARTDES');
   If Length(Trim(dbeArti.Text)) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', ' Articulo No Existe ');
      dbcldArti.SetFocus;
      Exit;
   End;
   ConUnitaria := (DMLOG.DisplayDescrip('prvTGE', 'TGE205', 'ARTCONT', sWhere, 'ARTCONT') <> '1');
   sTmp := 'UNMID=' + quotedstr(DMLOG.DisplayDescrip('prvTGE', 'TGE205', 'UNMIDG', sWhere, 'UNMIDG'));
   lblMedGnrl.Caption := 'Med. Gnrl. ' + DMLOG.DisplayDescrip('prvTGE', 'TGE130', 'UNMABR', sTmp, 'UNMABR');

   If ConUnitaria = True Then
   Begin
      sTmp := 'UNMID=' + quotedstr(DMLOG.DisplayDescrip('prvTGE', 'TGE205', 'UNMIDU', sWhere, 'UNMIDU'));
      lblMedUni.Caption := 'Med. Uni. ' + DMLOG.DisplayDescrip('prvTGE', 'TGE130', 'UNMABR', sTmp, 'UNMABR');
   End;

   dbePedidoU.Enabled := ConUnitaria;
   dbeCantidadU.Enabled := ConUnitaria;
   If ConUnitaria = False Then
   Begin
      dbePedidoU.Text := '0';
      dbeCantidadU.Text := '0';
   End;
End;

Procedure TFRegNtaS.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TDBMemo Then Exit;
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFRegNtaS.dblcLOCEnter(Sender: TObject);
Begin
   If dblcCIA.Text = '' Then
   Begin
      If dblcCIA.Enabled Then
         dblcCIA.SetFocus
      Else
      Begin
         ShowMessage('Error Falta Compañía');
      End;
   End;
End;

Procedure TFRegNtaS.dblcTALMEnter(Sender: TObject);
Begin
   If dblcTInv.Text = '' Then
   Begin
      If dblcTInv.Enabled Then
         dblcTInv.SetFocus
      Else
      Begin
         ShowMessage('Error Falta Tipo de Inventario ');
      End;
   End;
End;

Procedure TFRegNtaS.dblcTransacEnter(Sender: TObject);
Var
   xSQL: String;
Begin
   If dblcTDA.Text = '' Then
   Begin
      dblcTDA.SetFocus;
      Exit;
   End;

   If Not DMLOG.cdsTRAN.Active Then
   Begin
      xSQL := 'SELECT * FROM TGE208 WHERE TRISGT=''S''';
      DMLOG.cdsTRAN.Close;
      DMLOG.cdsTRAN.DataRequest(xSQL);
      DMLOG.cdsTRAN.Open;
   End;
End;

Procedure TFRegNtaS.dblcTInvEnter(Sender: TObject);
Begin
   If dblcLOC.Text = '' Then
   Begin
      If dblcLOC.Enabled Then
         dblcLOC.SetFocus
      Else
      Begin
         ShowMessage('Error Falta Localidad');
      End;
   End;
End;

Procedure TFRegNtaS.dblcTInvExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'TINID=' + quotedstr(dblcTInv.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   dbeTinv.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xSQL, 'TINDES');
   xSQL := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND TINID=' + quotedstr(dblcTInv.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   xSQL := 'SELECT * FROM TGE151 WHERE ' + xSQL;
   DMLOG.cdsALM.Close;
   DMLOG.cdsALM.DataRequest(xSQL);
   DMLOG.cdsALM.open;
End;

Procedure TFRegNtaS.dblcTINOriExit(Sender: TObject);
Var
   xSQL, sWhere: String;
Begin
   sWhere := 'TINID=' + quotedstr(dblcTINOri.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   If DMLOG.cdsNIS.fieldbyname('TINORIID').AsString <> '' Then
      dbeTINOri.text := DMLOG.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', sWhere, 'TINDES');
   xSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND LOCID=' + quotedstr(dblcLOCOri.text) + ' AND TINID=' + quotedstr(dblcTINOri.text);
   xSQL := 'SELECT * FROM TGE151 WHERE ' + xSQL;
End;

Procedure TFRegNtaS.dblcTINOriEnter(Sender: TObject);
Begin
   If dblcLOCOri.Text = '' Then
   Begin
      If dblcLOCOri.Enabled Then
         dblcLOCOri.SetFocus
      Else
      Begin
         ShowMessage('Error Falta Localidad de Destino');
         dblcLOCOri.SetFocus;
      End;
   End;
End;

Procedure TFRegNtaS.dblcTALMOriEnter(Sender: TObject);
Begin
   If dblcTINOri.Text = '' Then
   Begin
      If dblcTINOri.Enabled Then
         dblcTINOri.SetFocus
      Else
      Begin
         ShowMessage('Error Falta Tipo de Inventario de Destino');
         dblcTINOri.SetFocus;
      End;
   End;
End;

Procedure TFRegNtaS.Z2bbtnPrintClick(Sender: TObject);
Var
   sSQL, sCIA, sLOC, sTIN, sALM, sTDO, sNIN, sTip: String;
Begin
   Screen.Cursor := crHourGlass;
   sCIA := DMLOG.cdsNIS.FieldByName('CIAID').AsString;
   sLOC := DMLOG.cdsNIS.FieldByName('LOCID').AsString;
   sTIN := DMLOG.cdsNIS.FieldByName('TINID').AsString;
   sALM := DMLOG.cdsNIS.FieldByName('ALMID').AsString;
   sTDO := DMLOG.cdsNIS.FieldByName('TDAID').AsString;
   sNIN := DMLOG.cdsNIS.FieldByName('NISAID').AsString;
   sTIP := 'SALIDA';
   DMLOG.ppRptNotaSE(sSQL, sCIA, sLOC, sTIN, sALM, sTDO, sNIN, sTip);
   ppDBCab.DataSource := DMLOG.dsQry;
   ppdbOC.DataSource := DMLOG.dsSQL;
   pprNisSal.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\NisaSal.rtm';
   pprNisSal.Template.LoadFromFile;
   Screen.Cursor := crDefault;
   pprNisSal.Print;
   pprNisSal.Stop;
End;

Procedure TFRegNtaS.pprNisSalPreviewFormCreate(Sender: TObject);
Begin
   pprNisSal.PreviewForm.ClientHeight := 500;
   pprNisSal.PreviewForm.ClientWidth := 650;
   TppViewer(pprNisSal.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFRegNtaS.dbdtpFNSExit(Sender: TObject);
Begin
   If dbdtpFNS.DateTime = 0 Then
      dbdtpFNS.DateTime := Date;
   If xCrea <> true Then
      validafecha;
End;

Procedure TFRegNtaS.dblcTipPreExit(Sender: TObject);
Begin
   If xPresu = 'S' Then
   Begin
      If Length(dblcTipPre.Text) = 0 Then
      Begin
         Raise exception.Create('Falta Tipo de Presupuesto');
         Exit;
      End;
      dbeTipPre.text := DMLOG.DisplayDescrip('prvTGE', 'PPRES101', 'TIPPRESDES', 'TIPPRESID=' + quotedstr(dblcTipPre.text), 'TIPPRESDES');
   End;
End;

Procedure TFRegNtaS.dblcdPresupExit(Sender: TObject);
Begin
   edtPresup.Text := DMLOG.DisplayDescrip('PPRES201', 'PPRES201', 'PARPRESDES', 'PARPRESID=' + quotedstr(dblcdPresup.Text), 'PARPRESDES');
   If Length(edtPresup.text) = 0 Then
   Begin
      Raise exception.Create('Falta Partida Presupuestal');
      dblcdPresup.SetFocus;
   End;

End;

Procedure TFRegNtaS.CalculoNivel;
Begin
End;

Procedure TFRegNtaS.CreaSuperior;
Var
   xppcomun, ssql, xcc: String;
   xmaxdigitosup, xmaxnivelsup, xmaxnivelinf: String;
   xpp, xmaxdigitoint, xmaxnivelint, xmaxdigitoinf: String;
   xcontador: Integer;
   xcia, xccosid, xtippresid, xano: String;
Begin
   // tabla de niveles
   ssql := '';
   ssql := 'SELECT * FROM PPRES103 ORDER BY PARPRESNIV';
   DMLOG.cdsNivelPresu.close;
   DMLOG.cdsNivelPresu.DataRequest(ssql);
   DMLOG.cdsNivelPresu.Open;
   // se recorre el client del detalle, por lo que en este se encuentran
   //  las P.P. a actualizar
   DMLOG.cdsKDX.First;
   While Not DMLOG.cdsKDX.eof Do
   Begin
      If xcc <> DMLOG.cdsKDX.fieldbyname('CCOSID').AsString Then
      Begin
      // tabla de detalle del presupuesto
         ssql := '';
         ssql := 'SELECT * FROM PPRES301' +
            ' WHERE CIAID=' + quotedstr(DMLOG.cdsKDX.fieldbyname('CIAID').AsString) +
            ' AND CCOSID=' + quotedstr(DMLOG.cdsKDX.fieldbyname('CCOSID').AsString) +
            ' AND RQPARTANO=' + quotedstr(FloatToStr(xYear));
         DMLOG.cdsDetPre.Close;
         DMLOG.cdsDetPre.DataRequest(ssql);
         DMLOG.cdsDetPre.open;
         xcc := DMLOG.cdsKDX.fieldbyname('CCOSID').AsString;
      End;
      ssql := '';
      ssql := 'SELECT * FROM PPRES201';
      DMLOG.cdsParPre.Close;
      DMLOG.cdsParPre.DataRequest(ssql);
      DMLOG.cdsParPre.open;
          // se toma 01 por defecto para el nivel máximo superior
      xmaxnivelsup := '01';
      DMLOG.cdsNivelPresu.First;
          // se jala el máximo digito superior
      xmaxdigitosup := DMLOG.cdsNivelPresu.fieldbyname('DIGITOS').AsString;
          // se carga a partir de la P.P. digitada el digito en común
          //  ejmp. si se digito 10101 --> el digito comuún es 1
          //        si se digito 20501 --> el digito común es 2
      xppcomun := copy(DMLOG.cdsKDX.fieldbyname('PARPRESID').AsString, 1, StrToInt(xmaxdigitosup));
      DMLOG.cdsNivelPresu.Last;
          // jalo el máximo nivel inferior de la tabla de niveles
      xmaxnivelinf := DMLOG.cdsNivelPresu.fieldbyname('PARPRESNIV').AsString;
          // se jala el máximo digito inferior
      xmaxdigitoinf := DMLOG.cdsNivelPresu.fieldbyname('DIGITOS').AsString;
          // este proceso se repite hasta que la variable xmaxnivelint se iguale
          //  a la xmaxnivelsup. Esto me permite generar los niveles superiores
          //  que cuyo primer digito sea igual a la variable xppcomun
      xcontador := 0;
      Repeat
           // ejemp. si el xmaxnivelinf = 03 ==>  xmaxnivelint = 02.
         xmaxnivelint := DMLOG.StrZero(IntToStr(StrToInt(xmaxnivelinf) - xcontador), 2);
         xcontador := 1;
         ssql := '';
         ssql := 'PARPRESNIV=' + quotedstr(xmaxnivelint);
         xcia := Trim(dblcCia.Text);
         xccosid := Trim(DMLOG.cdsKDX.fieldbyname('CCOSID').AsString);
         xtippresid := Trim(DMLOG.cdsKDX.fieldbyname('TIPPRESID').AsString);
         xano := FloatToStr(xYear); //Trim(xtano);
         xmaxdigitoint := DMLOG.DisplayDescrip('prvNivelPresu', 'PPRES103', '*', ssql, 'DIGITOS');
         xpp := Trim(copy(DMLOG.cdsKDX.fieldbyname('PARPRESID').AsString, 1, StrToInt(xmaxdigitoint)));
         If DMLOG.cdsParPre.Locate('PARPRESID', VarArrayOf([xpp]), [loCaseInsensitive]) Then
            If Not DMLOG.cdsDetPre.Locate('CIAID;CCOSID;TIPPRESID;PARPRESID;RQPARTANO', VarArrayOf([xcia, xccosid, xtippresid, xpp, xano]), [loCaseInsensitive]) Then
               DMLOG.cdsDetPre.insert;
         If DMLOG.cdsDetPre.State = dsInsert Then
         Begin
            DMLOG.cdsDetPre.fieldbyname('CIAID').AsString := dblcCia.Text;
            DMLOG.cdsDetPre.fieldbyname('CCOSID').AsString := DMLOG.cdsKDX.fieldbyname('CCOSID').AsString;
            DMLOG.cdsDetPre.fieldbyname('TIPPRESID').AsString := DMLOG.cdsKDX.fieldbyname('TIPPRESID').AsString;
            DMLOG.cdsDetPre.fieldbyname('RQPARTANO').AsString := FloatToStr(xYear);
            DMLOG.cdsDetPre.FieldByName('PARPRESID').AsString := DMLOG.cdsParPre.fieldbyname('PARPRESID').AsString;
            DMLOG.cdsDetPre.FieldByName('PARPREDES').AsString := DMLOG.cdsParPre.fieldbyname('PARPRESDES').AsString;
            DMLOG.cdsDetPre.FieldByName('TMONID').AsString := xMoneda; //dblcTMon.Text;
            DMLOG.cdsDetPre.FieldByName('RQPARTUSER').AsString := DMLOG.wusuario;
            DMLOG.cdsDetPre.FieldByName('RQPARTFREG').AsString := DateToStr(Date());
            DMLOG.cdsDetPre.FieldByName('RQPARTHREG').AsString := TimeToStr(Time());
            DMLOG.cdsDetPre.FieldByName('RQPARTIS').AsString := DMLOG.cdsParPre.fieldbyname('PARPRES_IS').AsString;
            DMLOG.cdsDetPre.FieldByName('PARPRESNIV').AsString := DMLOG.cdsParPre.fieldbyname('PARPRESNIV').AsString;
               // inicializo en cero todos los montos
            inicializoCero(DMLOG.cdsDetPre);
            DMLOG.cdsDetPre.Post;
            DMLOG.cdsDetPre.ApplyUpdates(0);
         End;
         xmaxnivelinf := xmaxnivelint;
      Until xmaxnivelsup = xmaxnivelint;
     // end;
      DMLOG.cdsKDX.Next;
   End;
End;

Procedure TFRegNtaS.inicializoCero(xCds: TwwClientDataSet);
Var
   iX: integer;
   xmes: String;
Begin
    // inicializo los demás campos en cero
   For iX := 1 To 12 Do
   Begin
      xmes := DMLOG.StrZero(IntToStr(iX), 2);
      xcds.FieldByName('DPRERQMN' + xmes).AsString := '0';
      xcds.FieldByName('DPRERQME' + xmes).AsString := '0';
      xcds.FieldByName('DPRERMME' + xmes).AsString := '0';
      xcds.FieldByName('DPRERMMN' + xmes).AsString := '0';
      xcds.FieldByName('DPREASMN' + xmes).AsString := '0';
      xcds.FieldByName('DPREASME' + xmes).AsString := '0';
      xcds.FieldByName('DPREMOMN' + xmes).AsString := '0';
      xcds.FieldByName('DPREMOME' + xmes).AsString := '0';
      xcds.FieldByName('DPREEJMN' + xmes).AsString := '0';
      xcds.FieldByName('DPREEJME' + xmes).AsString := '0';
      xcds.FieldByName('DPREVMMN' + xmes).AsString := '0';
      xcds.FieldByName('DPREVMME' + xmes).AsString := '0';
      xcds.FieldByName('DPREVPMN' + xmes).AsString := '0';
      xcds.FieldByName('DPREVPME' + xmes).AsString := '0';
      xcds.FieldByName('DPREMCMN' + xmes).AsString := '0';
      xcds.FieldByName('DPREMCME' + xmes).AsString := '0';
      xcds.FieldByName('DPRECAMN' + xmes).AsString := '0';
      xcds.FieldByName('DPRECAME' + xmes).AsString := '0';
   End;
   xcds.FieldByName('DPRETORQMN').AsString := '0';
   xcds.FieldByName('DPRETORQME').AsString := '0';
   xcds.FieldByName('DPRETORMMN').AsString := '0';
   xcds.FieldByName('DPRETORMME').AsString := '0';
   xcds.FieldByName('DPRETOASMN').AsString := '0';
   xcds.FieldByName('DPRETOASME').AsString := '0';
   xcds.FieldByName('DPRETOMOMN').AsString := '0';
   xcds.FieldByName('DPRETOMOME').AsString := '0';
   xcds.FieldByName('DPRETOEJMN').AsString := '0';
   xcds.FieldByName('DPRETOEJME').AsString := '0';
   xcds.FieldByName('DPRETOVMMN').AsString := '0';
   xcds.FieldByName('DPRETOVMME').AsString := '0';
   xcds.FieldByName('DPRETOVPMN').AsString := '0';
   xcds.FieldByName('DPRETOVPME').AsString := '0';
   xcds.FieldByName('DPRETOMCMN').AsString := '0';
   xcds.FieldByName('DPRETOMCME').AsString := '0';
   xcds.FieldByName('DPRETOCAMN').AsString := '0';
   xcds.FieldByName('DPRETOCAME').AsString := '0';

End;

Procedure TFRegNtaS.CalculoNivelSupe;
Var
   xppcomun, xmaxdigitosup, xmaxnivelsup, xmaxnivelinf, ssql: String;
   xcc, xmes, xmaxdigitoint, xmaxnivelint, xmaxdigitoinf: String;
   ix: integer;
   xestado, xestado1: bool;
  // para los EJMN y EJME del mes 01 al mes 12
   xmontos: Array[1..24] Of Real;
  // para los ASMN y ASME del mes 01 al mes 12
   xmontosas: Array[1..24] Of Real;
  // para los MOMN y MOME del mes 01 al mes 12
   xmontosmo: Array[1..24] Of Real;
   xtotvmmn, xtotvmme, xtotejmn, xtotejme: real;
Begin
   xestado := False;
   xestado1 := False;
   // tabla de niveles, se ordena por el nivel
   ssql := '';
   ssql := 'SELECT * FROM PPRES103 ORDER BY PARPRESNIV';
   DMLOG.cdsNivelPresu.close;
   DMLOG.cdsNivelPresu.DataRequest(ssql);
   DMLOG.cdsNivelPresu.open;
   DMLOG.cdsNivelPresu.First;
   DMLOG.cdsKDX.First;
   While Not DMLOG.cdsKDX.eof Do
   Begin
      If xcc <> DMLOG.cdsKDX.fieldbyname('CCOSID').AsString Then
      Begin
          // tabla de detalle del presupuesto
         ssql := '';
         ssql := 'SELECT * FROM PPRES301' +
            ' WHERE CIAID=' + quotedstr(DMLOG.cdsKDX.fieldbyname('CIAID').AsString) +
            ' AND CCOSID=' + quotedstr(DMLOG.cdsKDX.fieldbyname('CCOSID').AsString) +
            ' AND RQPARTANO=' + quotedstr(FloatToStr(xYear));
         DMLOG.cdsDetPre.Close;
         DMLOG.cdsDetPre.DataRequest(ssql);
         DMLOG.cdsDetPre.open;
          // se carga la variable
         xcc := DMLOG.cdsKDX.fieldbyname('CCOSID').AsString;
      End;
      If xppcomun <> copy(DMLOG.cdsKDX.fieldbyname('PARPRESID').AsString, 1, 1) Then
      Begin
         ssql := '';
         ssql := 'SELECT * FROM PPRES201';
         DMLOG.cdsParPre.Close;
         DMLOG.cdsParPre.DataRequest(ssql);
         DMLOG.cdsParPre.open;
          // se toma 01 por defecto para el nivel máximo superior
         xmaxnivelsup := '01';
         DMLOG.cdsNivelPresu.First;
          // se jala el máximo digito superior
         xmaxdigitosup := DMLOG.cdsNivelPresu.fieldbyname('DIGITOS').AsString;
          // se carga a partir de la P.P. digitada el digito en común
          //  ejmp. si se digito 10101 --> el digito comuún es 1
          //        si se digito 20501 --> el digito común es 2
         xppcomun := copy(DMLOG.cdsKDX.fieldbyname('PARPRESID').AsString, 1, StrToInt(xmaxdigitosup));
         DMLOG.cdsNivelPresu.Last;
          // jalo el máximo nivel inferior de la tabla de niveles
         xmaxnivelinf := DMLOG.cdsNivelPresu.fieldbyname('PARPRESNIV').AsString;
          // se jala el máximo digito inferior
         xmaxdigitoinf := DMLOG.cdsNivelPresu.fieldbyname('DIGITOS').AsString;

          // se filtra la tabla por CIA, TIPPRESID RQPARTANO y PARPRESID cuyo digito
          //  sustraido se igual al xppcomun
         ssql := '';
         ssql := 'SELECT PARPRESID,PARPREDES,RQPARTIS,TMONID,' +
            'DPREEJMN01,DPREEJMN02,DPREEJMN03,DPREEJMN04,DPREEJMN05,DPREEJMN06,' +
            'DPREEJMN07,DPREEJMN08,DPREEJMN09,DPREEJMN10,DPREEJMN11,DPREEJMN12,' +
            'DPREEJME01,DPREEJME02,DPREEJME03,DPREEJME04,DPREEJME05,DPREEJME06,' +
            'DPREEJME07,DPREEJME08,DPREEJME09,DPREEJME10,DPREEJME11,DPREEJME12,' +

         'DPREVMMN01,DPREVMMN02,DPREVMMN03,DPREVMMN04,DPREVMMN05,DPREVMMN06,' +
            'DPREVMMN07,DPREVMMN08,DPREVMMN09,DPREVMMN10,DPREVMMN11,DPREVMMN12,' +
            'DPREVMME01,DPREVMME02,DPREVMME03,DPREVMME04,DPREVMME05,DPREVMME06,' +
            'DPREVMME07,DPREVMME08,DPREVMME09,DPREVMME10,DPREVMME11,DPREVMME12,' +

         'DPREVPMN01,DPREVPMN02,DPREVPMN03,DPREVPMN04,DPREVPMN05,DPREVPMN06,' +
            'DPREVPMN07,DPREVPMN08,DPREVPMN09,DPREVPMN10,DPREVPMN11,DPREVPMN12,' +
            'DPREVPME01,DPREVPME02,DPREVPME03,DPREVPME04,DPREVPME05,DPREVPME06,' +
            'DPREVPME07,DPREVPME08,DPREVPME09,DPREVPME10,DPREVPME11,DPREVPME12,' +

         'DPREASMN01,DPREASMN02,DPREASMN03,DPREASMN04,DPREASMN05,DPREASMN06,' +
            'DPREASMN07,DPREASMN08,DPREASMN09,DPREASMN10,DPREASMN11,DPREASMN12,' +
            'DPREASME01,DPREASME02,DPREASME03,DPREASME04,DPREASME05,DPREASME06,' +
            'DPREASME07,DPREASME08,DPREASME09,DPREASME10,DPREASME11,DPREASME12,' +

         'DPREMOMN01,DPREMOMN02,DPREMOMN03,DPREMOMN04,DPREMOMN05,DPREMOMN06,' +
            'DPREMOMN07,DPREMOMN08,DPREMOMN09,DPREMOMN10,DPREMOMN11,DPREMOMN12,' +
            'DPREMOME01,DPREMOME02,DPREMOME03,DPREMOME04,DPREMOME05,DPREMOME06,' +
            'DPREMOME07,DPREMOME08,DPREMOME09,DPREMOME10,DPREMOME11,DPREMOME12' +

         ' FROM PPRES301 WHERE CIAID=' + quotedstr(dblcCia.Text) +
            ' AND CCOSID=' + quotedstr(DMLOG.cdsKDX.fieldbyname('CCOSID').AsString) +
            ' AND TIPPRESID=' + quotedstr(DMLOG.cdsKDX.fieldbyname('TIPPRESID').AsString) +
            ' AND SUBSTR(PARPRESID,1,' + xmaxdigitosup + ')=' + quotedstr(xppcomun) +
            ' AND RQPARTANO=' + quotedstr(FloatToSTr(xYear));
         DMLOG.cdsSQL.Close;
         DMLOG.cdsSQL.DataRequest(ssql);
         DMLOG.cdsSQL.Open;
         DMLOG.cdsSQL.first;
          // este proceso se repite hasta que la variable xmaxnivelint se iguale
          //  a la xmaxnivelsup. Esto me permite generar los niveles superiores
          //  que cuyo primer digito sea igual a la variable xppcomun
         Repeat
            // ejemp. si el xmaxnivelinf = 03 ==>  xmaxnivelint = 02.
            xmaxnivelint := DMLOG.StrZero(IntToStr(StrToInt(xmaxnivelinf) - 1), 2);
            ssql := '';
            ssql := 'PARPRESNIV=' + quotedstr(xmaxnivelint);
            xmaxdigitoint := DMLOG.displaydescrip('dspNivelPresu', 'PPRES103', '*', ssql, 'DIGITOS');
            // filtra la tabla de P.P.P. por todas aquellas cuyo digito sean igual al del
            //  xmaxdigitoint
            ssql := '';
            ssql := 'SELECT * FROM PPRES201 WHERE LENGTH(PARPRESID)=' + xmaxdigitoint +
               ' ORDER BY PARPRESID';
            DMLOG.cdsParPre.Close;
            DMLOG.cdsParPre.DataRequest(ssql);
            DMLOG.cdsParPre.Open;
            // se recorre la tabla
            While Not DMLOG.cdsParPre.Eof Do
            Begin
               DMLOG.cdsSQL.First;
               // se blanquea
               For iX := 1 To 24 Do
               Begin
                  xmontos[iX] := 0;
                  xmontosas[iX] := 0;
                  xmontosmo[iX] := 0;
               End;
                // se recorre el clon del detalle
               While Not DMLOG.cdsSQL.Eof Do
               Begin
                  // si el # de digitos es = al # maximo de digitos inferior
                  If length(DMLOG.cdsSQL.fieldbyname('PARPRESID').AsString) = StrToInt(xmaxdigitoinf) Then
                   // si la sustracción es = al nivel de la P.P..
                     If copy(DMLOG.cdsSQL.fieldbyname('PARPRESID').AsString, 1, StrToInt(xmaxdigitoint)) =
                        DMLOG.cdsParPre.fieldbyname('PARPRESID').AsString Then
                        For iX := 1 To 12 Do
                        Begin
                           xmes := DMLOG.StrZero(IntToStr(iX), 2);
                           xmontos[iX] := xmontos[iX] + DMLOG.cdsSQL.fieldbyname('DPREEJMN' + xmes).value;
                           xmontos[iX + 12] := xmontos[iX + 12] + DMLOG.cdsSQL.fieldbyname('DPREEJME' + xmes).value;
                           xmontosas[iX] := xmontosas[iX] + DMLOG.cdsSQL.fieldbyname('DPREASMN' + xmes).value;
                           xmontosas[iX + 12] := xmontosas[iX + 12] + DMLOG.cdsSQL.fieldbyname('DPREASME' + xmes).value;
                           xmontosmo[iX] := xmontosmo[iX] + DMLOG.cdsSQL.fieldbyname('DPREMOMN' + xmes).value;
                           xmontosmo[iX + 12] := xmontosmo[iX + 12] + DMLOG.cdsSQL.fieldbyname('DPREMOME' + xmes).value;
                        End;
                  DMLOG.cdsSQL.next;
               End;
               For iX := 1 To 12 Do
                  If xmontos[iX] <> 0 Then
                  Begin
                     xestado := true;
                     break;
                  End;
               If xestado = true Then
               Begin
                  xtotejmn := 0;
                  xtotejme := 0;
                   // para posicionarme sobre el nivel en el clon
                  If DMLOG.cdsSQL.Locate('PARPRESID', DMLOG.cdsParPre.fieldbyname('PARPRESID').AsString, [loCaseInsensitive]) Then
                     DMLOG.cdsSQL.Edit;
                   // para posicionarme sobre el nivel en el detalle
                  If DMLOG.cdsDetPre.Locate('PARPRESID', DMLOG.cdsParPre.fieldbyname('PARPRESID').AsString, [loCaseInsensitive]) Then
                     DMLOG.cdsDetPre.Edit;
                  For iX := 1 To 12 Do
                  Begin
                     xmes := DMLOG.StrZero(IntToStr(iX), 2);
                      // para el cdsSQL
                     DMLOG.cdsSQL.fieldbyname('DPREEJMN' + xmes).AsString := FloatToStr(xmontos[iX]);
                     DMLOG.cdsSQL.fieldbyname('DPREEJME' + xmes).AsString := FloatToStr(xmontos[iX + 12]);
                      // para el detalle
                     DMLOG.cdsDetPre.fieldbyname('DPREEJMN' + xmes).AsString := FloatToStr(xmontos[iX]);
                     DMLOG.cdsDetPre.fieldbyname('DPREEJME' + xmes).AsString := FloatToStr(xmontos[iX + 12]);
                      //** 06/11/2000
                     If xmontos[iX] > 0 Then
                     Begin
                        DMLOG.cdsDetPre.fieldbyname('DPREVMMN' + xmes).AsString := FloatToStr((xmontosas[iX] + xmontosmo[iX]) - xmontos[iX]);
                        DMLOG.cdsDetPre.fieldbyname('DPREVMME' + xmes).AsString := FloatToStr((xmontosas[iX + 12] + xmontosmo[iX + 12]) - xmontos[iX + 12]);
                     End;
                      //**
                     If xmontos[iX] <> 0 Then
                        If (xmontosas[iX] <> 0) Or (xmontosmo[iX] <> 0) Then
                           DMLOG.cdsDetPre.fieldbyname('DPREVPMN' + xmes).AsString :=
                              FloatToStr((xmontos[iX] / (xmontosas[iX] + xmontosmo[iX])) * 100)
                        Else
                           DMLOG.cdsDetPre.fieldbyname('DPREVPMN' + xmes).value := 200;
                     If xmontos[iX + 12] <> 0 Then
                        If (xmontosas[iX + 12] <> 0) Or (xmontosmo[iX + 12] <> 0) Then
                           DMLOG.cdsDetPre.fieldbyname('DPREVPME' + xmes).AsString :=
                              FloatToStr((xmontos[iX + 12] / (xmontosas[iX + 12] + xmontosmo[iX + 12])) * 100)
                        Else
                           DMLOG.cdsDetPre.fieldbyname('DPREVPME' + xmes).value := 200;
                  End;
                  xtotvmmn := (xmontosas[1] + xmontosas[2] + xmontosas[3] + xmontosas[4] + xmontosas[5] + xmontosas[6] +
                     xmontosas[7] + xmontosas[8] + xmontosas[9] + xmontosas[10] + xmontosas[11] + xmontosas[12] +
                     xmontosmo[1] + xmontosmo[2] + xmontosmo[3] + xmontosmo[4] + xmontosmo[5] + xmontosmo[6] +
                     xmontosmo[7] + xmontosmo[8] + xmontosmo[9] + xmontosmo[10] + xmontosmo[11] + xmontosmo[12]) -
                     (xmontos[1] + xmontos[2] + xmontos[3] + xmontos[4] + xmontos[5] + xmontos[6] +
                     xmontos[7] + xmontos[8] + xmontos[9] + xmontos[10] + xmontos[11] + xmontos[12]);
                  xtotvmme := (xmontosas[13] + xmontosas[14] + xmontosas[15] + xmontosas[16] + xmontosas[17] + xmontosas[18] +
                     xmontosas[19] + xmontosas[20] + xmontosas[21] + xmontosas[22] + xmontosas[23] + xmontosas[24] +
                     xmontosmo[13] + xmontosmo[14] + xmontosmo[15] + xmontosmo[16] + xmontosmo[17] + xmontosmo[18] +
                     xmontosmo[19] + xmontosmo[20] + xmontosmo[21] + xmontosmo[22] + xmontosmo[23] + xmontosmo[24]) -
                     (xmontos[13] + xmontos[14] + xmontos[15] + xmontos[16] + xmontos[17] + xmontos[18] +
                     xmontos[19] + xmontos[20] + xmontos[21] + xmontos[22] + xmontos[23] + xmontos[24]);
                  For iX := 1 To 12 Do
                  Begin
                     xtotejmn := xtotejmn + xmontos[iX];
                     xtotejme := xtotejme + xmontos[iX + 12];
                  End;
                  DMLOG.cdsDetPre.fieldbyname('DPRETOEJMN').AsString := FloatToStr(xtotejmn);
                  DMLOG.cdsDetPre.fieldbyname('DPRETOEJME').AsString := FloatToStr(xtotejme);
                  DMLOG.cdsDetPre.fieldbyname('DPRETOVMMN').AsString := FloatToStr(xtotvmmn);
                  DMLOG.cdsDetPre.fieldbyname('DPRETOVMME').AsString := FloatToStr(xtotvmme);
                  For iX := 1 To 12 Do
                     If (xmontosas[iX] <> 0) Or (xmontosmo[iX] <> 0) Then
                     Begin
                        xestado1 := true;
                        break;
                     End;
                     // me indica que hay que actualizar los VP
                  If xEstado1 = true Then
                  Begin
                     DMLOG.cdsDetPre.fieldbyname('DPRETOVPMN').AsString :=
                        FloatToStr(((xmontos[1] + xmontos[2] + xmontos[3] + xmontos[4] + xmontos[5] + xmontos[6] +
                        xmontos[7] + xmontos[8] + xmontos[9] + xmontos[10] + xmontos[11] + xmontos[12]) /
                        (xmontosas[1] + xmontosas[2] + xmontosas[3] + xmontosas[4] + xmontosas[5] + xmontosas[6] +
                        xmontosas[7] + xmontosas[8] + xmontosas[9] + xmontosas[10] + xmontosas[11] + xmontosas[12] +
                        xmontosmo[1] + xmontosmo[2] + xmontosmo[3] + xmontosmo[4] + xmontosmo[5] + xmontosmo[6] +
                        xmontosmo[7] + xmontosmo[8] + xmontosmo[9] + xmontosmo[10] + xmontosmo[11] + xmontosmo[12])) * 100);
                     DMLOG.cdsDetPre.fieldbyname('DPRETOVPME').AsString :=
                        FloatToStr(((xmontos[13] + xmontos[14] + xmontos[15] + xmontos[16] + xmontos[17] + xmontos[18] +
                        xmontos[19] + xmontos[20] + xmontos[21] + xmontos[22] + xmontos[23] + xmontos[24]) /
                        (xmontosas[13] + xmontosas[14] + xmontosas[15] + xmontosas[16] + xmontosas[17] + xmontosas[18] +
                        xmontosas[19] + xmontosas[20] + xmontosas[21] + xmontosas[22] + xmontosas[23] + xmontosas[24] +
                        xmontosmo[13] + xmontosmo[14] + xmontosmo[15] + xmontosmo[16] + xmontosmo[17] + xmontosmo[18] +
                        xmontosmo[19] + xmontosmo[20] + xmontosmo[21] + xmontosmo[22] + xmontosmo[23] + xmontosmo[24])) * 100);
                     xestado1 := false;
                  End
                  Else
                  Begin
                     DMLOG.cdsDetPre.fieldbyname('DPRETOVPMN').AsString := FloatToStr(200);
                     DMLOG.cdsDetPre.fieldbyname('DPRETOVPME').AsString := FloatToStr(200);
                  End;
                  DMLOG.cdsSQL.Post;
                  DMLOG.cdsDetPre.Post;
                  DMLOG.cdsDetPre.ApplyUpdates(0);
                  xEstado := false;
               End;
               DMLOG.cdsParPre.next;
            End;
                 // se igualan variables
            xmaxnivelinf := xmaxnivelint;
            xmaxdigitoinf := xmaxdigitoint;
         Until xmaxnivelsup = xmaxnivelint;
      End;
      DMLOG.cdsKDX.Next;
   End;
End;

Procedure TFRegNtaS.FormShow(Sender: TObject);
Var
   xsql, ssql: String;
Begin
   DMLOG.AccesosUsuarios(DMLOG.wModulo, DMLOG.wUsuario, '2', Screen.ActiveForm.Name);
   xCrea := true;
   dblcTipPre.Enabled := wActuaPresu;
   dblcdPresup.Enabled := wActuaPresu;
   xsql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
   DMLOG.cdsCCost.Close;
   DMLOG.cdsCCost.DataRequest(xsql);
   DMLOG.cdsCCost.open;
   dbeCIA.Text := '';
   dbeLOC.Text := '';
   dbeTinv.Text := '';
   dbeALM.Text := '';
   dbeTDNISA.Text := '';
   dbeTransac.Text := '';
   dbeLOCOri.Text := '';
   dbeALMOri.Text := '';
   dbeCC.Text := '';
   dbeProv.Text := '';
   dbeDOCS.Text := '';
   wCuenta := '';
   wTricvtas := '';
   wTritdodes := '';
   wtritrdes := '';

   If wOperacion = 'ADD' Then
   Begin
      lblEstado.Caption := 'INICIAL';
      DMLOG.cdsNIS.FieldByName('NISSIT').AsString := 'INICIAL';
      DMLOG.cdsNIS.FieldByName('NISATIP').AsString := 'SALIDA';
   End;

   If (DMLOG.cdsNis.FieldByName('NISSIT').AsString = 'ACEPTADO') Then
   Begin
      OnOffCabecera(False); //Activar la cabecera
      OnOffDetalle(True); //Desactivar el panel de detalle
      Z2dbgDReqsIButton.Enabled := False;
      ssql := 'TRIID=' + quotedstr(dblcTransac.text) + ' AND TRISGT=' + QuotedStr('S');
      dbeTransac.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE208', 'TRIDES', ssql, 'TRIDES');
   End
   Else
   Begin
      Init(Sender);
      Z2dbgDReqsIButton.Enabled := True;
   End;
   vvalida := false; {por defecto}
   If DMLOG.cdsNIA.State In [dsEdit] Then
      If (dbdtpFNS.Enabled = true) And (pnlCabecera.Enabled = true) Then
         dbdtpFNS.SetFocus;
   ssql := 'CIAID=' + quotedstr(dblcCIA.text);
   dbecia.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', ssql, 'CIADES');
   ssql := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
   ;
   dbeLOC.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', ssql, 'LOCDES');
   If DMLOG.cdsNIS.State = dsEdit Then
   Begin
      ssql := 'TINID=' + quotedstr(dblcTInv.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
      dbeTinv.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', ssql, 'TINDES');
      ssql := 'LOCID=' + quotedstr(dblcLOC.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALM.text) + ' AND TINID=' + quotedstr(dblcTInv.text);
      dbeALM.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', ssql, 'ALMDES');
      ssql := 'TDAID=' + quotedstr(dblcTDA.text);
      dbeTDNISA.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE157', 'TDADES', ssql, 'TDADES');
      dblcTransac.Enabled := False;
     // Transferencia
      ssql := 'TINID=' + quotedstr(dblcTINOri.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
      dbeTINOri.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', ssql, 'TINDES');
      ssql := 'LOCID=' + quotedstr(dblcLOCOri.text) + ' AND CIAID=' + quotedstr(dblcCIA.text);
      dbeLOCOri.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', ssql, 'LOCDES');
      ssql := 'LOCID=' + quotedstr(dblcLOCOri.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALMOri.text) + ' AND TINID=' + quotedstr(dblcTINOri.text);
      dbeALMOri.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', ssql, 'ALMDES');
      ssql := 'CCOSID=' + quotedstr(DMLOG.cdsNIS.fieldbyname('CCOSID').AsString);
      dbeCC.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE203', 'CCOSDES', ssql, 'CCOSDES');
      ssql := 'CLIEID=' + quotedstr(dblcdProv.text);
      dbeProv.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE204', 'CLIEDES', ssql, 'CLIEDES');
      ssql := 'DOCID=' + quotedstr(dblcdTDOC.text);
      dbeDOCS.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE110', 'DOCDES', ssql, 'DOCDES');
      dblcTipPre.text := DMLOG.cdsNIS.fieldbyname('TIPPRESID').AsString;
      dblcTipPre.OnExit(dblcTipPre);
      dblcdPresup.text := DMLOG.cdsNIS.fieldbyname('PARPRESID').AsString;
      edtPresup.Text := DMLOG.DisplayDescrip('PPRES201', 'PPRES201', 'PARPRESDES', 'PARPRESID=' + quotedstr(dblcdPresup.Text), 'PARPRESDES');
   End
   Else
      If DMLOG.cdsNIS.State = dsInsert Then
      Begin
         dblcTransac.Enabled := True;
         If dblcCIA.Enabled = false Then
            If dblcLOC.Enabled = false Then
            Begin
               dblcLOCExit(Nil);
               dblcTALM.SetFocus;
            End
            Else
            Begin
               dblcCIAExit(Nil);
               dblcLOC.SetFocus;
            End
         Else
            dblcCIA.SetFocus;
      End;
   xCrea := false;
   If xCCosto = 1 Then
   Begin
      Z2bbtnOK.Enabled := False;
      Z2bbtnGraba.Enabled := False;
      Z2bbtnAceptar.Enabled := False;
      Z2bbtnNuevo.Enabled := False;
      Z2bbtnCanc2.Enabled := False;
   End;
   If xAlmLec = 'S' Then
   Begin
      OnOffCabecera(False); //Activar la cabecera
      OnOffDetalle(False); //Desactivar el panel de detalle
   End;
End;

End.


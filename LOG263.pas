Unit LOG263;

// Actualizaciones
// HPC_201405_LOG          : 14/10/2014 Se lleva Lista de Precios de Adquisiciones Ventas a Adquisiciones SSGG
//                           14/10/2014 Reordenamiento de Sangría

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Mask, wwdbedit, StdCtrls, Buttons, Wwdbdlg, wwdblook, ExtCtrls, dbCtrls,
   wwdbdatetimepicker, db, ComCtrls;

Type
   TFLPrecioA = Class(TForm)
      pnlCabecera: TPanel;
      Panel1: TPanel;
      Label7: TLabel;
      Label8: TLabel;
      Z2bbtnOK: TBitBtn;
      Z2bbtnCancel: TBitBtn;
      Z2bbtnNuevo: TBitBtn;
      Bevel1: TBevel;
      gbUmg: TGroupBox;
      Label12: TLabel;
      dbeUmg: TwwDBEdit;
      gbUmu: TGroupBox;
      dbeUmu: TwwDBEdit;
      dbePrecioU: TwwDBEdit;
      Label15: TLabel;
      Label16: TLabel;
      Label17: TLabel;
      Label18: TLabel;
      Label19: TLabel;
      Label24: TLabel;
      Label25: TLabel;
      Label26: TLabel;
      Label27: TLabel;
      Label29: TLabel;
      Label30: TLabel;
      pnl1: TPanel;
      Label14: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      pnl3: TPanel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label13: TLabel;
      dblcdArticulo: TwwDBLookupComboDlg;
      dtpFIni: TwwDBDateTimePicker;
      dbeVigencia: TwwDBEdit;
      edtArticulo: TEdit;
      dbeTcam: TwwDBEdit;
      pnl2: TPanel;
      dblcLinea: TwwDBLookupCombo;
      dblcFamilia: TwwDBLookupCombo;
      Label9: TLabel;
      Label10: TLabel;
      edtLinea: TEdit;
      edtFamilia: TEdit;
      grpTope: TGroupBox;
      dbePorcG: TwwDBEdit;
      dbePorcU: TwwDBEdit;
      lblGnrl: TLabel;
      lnlUnitaria: TLabel;
      dbgTope: TDBRadioGroup;
      grpCantVta: TGroupBox;
      Label11: TLabel;
      Label20: TLabel;
      dbeMinG: TwwDBEdit;
      dbeMinU: TwwDBEdit;
      Label6: TLabel;
      dblcTinid: TwwDBLookupCombo;
      edtTinid: TEdit;
      lblSUBFAM: TLabel;
      dblcSUBFAM: TwwDBLookupCombo;
      dbeSFAM: TwwDBEdit;
      dbePrecioG: TDBEdit;
      Label1: TLabel;
      dblcLPrecio: TwwDBLookupCombo;
      edtLPrecio: TEdit;
      Label21: TLabel;
      edtALM: TEdit;
      BitBtn1: TBitBtn;
      Label5: TLabel;
      dblcTMon: TwwDBLookupCombo;
      edtTMon: TEdit;
      dblcTALM: TwwDBLookupCombo;
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcLPrecioExit(Sender: TObject);
      Procedure dblcTMonExit(Sender: TObject);
      Procedure dblcdArticuloExit(Sender: TObject);
      Procedure Z2bbtnOKClick(Sender: TObject);
      Procedure Z2bbtnCancelClick(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure dtpFIniExit(Sender: TObject);
      Procedure dbeDsctoGExit(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbeDsctoUExit(Sender: TObject);
      Procedure dbeTcamExit(Sender: TObject);
      Procedure dbePrecioGExit(Sender: TObject);
      Procedure dbeVigenciaExit(Sender: TObject);
      Procedure dblcTinidExit(Sender: TObject);
      Procedure dblcLineaExit(Sender: TObject);
      Procedure dblcFamiliaExit(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcTVtaNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dbgTopeClick(Sender: TObject);
      Procedure dblcSUBFAMExit(Sender: TObject);
      Procedure dbeMinGExit(Sender: TObject);
      Procedure NotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcTALMExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
      wModif: String;
      Procedure InicializaCampos;
      Procedure RegistroNuevo;
      Function Consistencia: Boolean;

   Public
    { Public declarations }
      wContenido: boolean;
   End;

Var
   FLPrecioA: TFLPrecioA;
   xCrea: boolean;
   xSQL: String;
 //wCia, wLPe : String;

Implementation

Uses
   LOGDM1, oaAD1000, LOG260;

{$R *.DFM}

Procedure TFLPrecioA.dblcLPrecioExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If Not Z2bbtnCancel.focused Then
   Begin
      If length(dblcLPrecio.text) = 0 Then
         Raise exception.create('Seleccione una Lista de Precios');

      xWhere := 'TLISTAID =' + quotedstr(dblcLPrecio.Text) + ' AND CIAID=' + QuotedStr(dblcCia.Text);
      edtLPrecio.Text := DMLOG.BuscaQry('dspUltTGE', 'FAC101', 'TLISTADES', xWhere, 'TLISTADES');

      If Length(dblcLPrecio.Text) = 0 Then
      Begin
         ShowMessage('Lista de Precios no existe');
         dblcLPrecio.Text := '';
         dblcLPrecio.SetFocus;
      End;
   End;
End;

Procedure TFLPrecioA.dblcTMonExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Not Z2bbtnCancel.Focused Then
   Begin
      If xCrea Then Exit;
      xWhere := 'TMONID=' + quotedstr(dblcTMon.Text)
         + ' AND (TMON_LOC=' + '''' + 'L' + '''' + ' OR TMON_LOC=' + '''' + 'E' + '''' + ')';
      edtTMon.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');

      If length(edtTMon.Text) = 0 Then
      Begin
         ShowMessage('Falta Tipo de Moneda');
         exit;
      End;
   End;
End;

Procedure TFLPrecioA.dblcdArticuloExit(Sender: TObject);
Var
   xContenido: integer;
Begin
   If xCrea Then Exit;
   If Not Z2bbtnCancel.Focused Then
   Begin
      If (DMLOG.wModo = 'A') Then
      Begin
         If DMLOG.BuscaRegPrecio(dblcCia.text, dblcLPrecio.Text, dblcdArticulo.Text) Then
         Begin
            InicializaCampos;
            pnl3.Enabled := false;
            Raise Exception.Create('Registro Duplicado');
         End
      End;
      DMLOG.cdsArti.IndexFieldNames := 'CIAID;TINID;ARTID';
      DMLOG.cdsArti.SetKey;
      DMLOG.cdsArti.FieldByName('CIAID').AsString := wCia;
      DMLOG.cdsArti.FieldByName('TINID').AsString := dblcTinid.text;
  //DMLOG.cdsArti.FieldByName('GRARID').AsString := dblcLinea.text;
      DMLOG.cdsArti.FieldByName('ARTID').AsString := dblcdArticulo.text;
      If DMLOG.cdsArti.GotoKey Then
      Begin
         edtArticulo.Text := DMLOG.cdsArti.fieldbyname('ARTDES').AsString;
         xContenido := DMLOG.cdsArti.fieldbyname('ARTCONT').AsInteger;
         wContenido := (xcontenido > 1); //para um unitaria

         If DMLOG.wModo = 'A' Then
         Begin
            If DMLOG.cdsLPrecio.FieldByName('GRARID').AsString = '' Then
            Begin
               DMLOG.cdsLPrecio.FieldByName('GRARID').AsString := DMLOG.cdsArti.FieldByName('GRARID').AsString;
               edtLinea.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE131', 'GRARDES', 'GRARID=' + quotedstr(dblcLinea.Text), 'GRARDES');
            End;

            If DMLOG.cdsLPrecio.FieldByName('FAMID').AsString = '' Then
            Begin
               DMLOG.cdsLPrecio.FieldByName('FAMID').AsString := DMLOG.cdsArti.FieldByName('FAMID').AsString;
               sSQL := 'GRARID=' + quotedstr(dblcLinea.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFamilia.text);
               edtFamilia.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE169', 'FAMDES', sSQL, 'FAMDES');
            End;

            If DMLOG.cdsLPrecio.FieldByName('SFAMID').AsString = '' Then
            Begin
               DMLOG.cdsLPrecio.FieldByName('SFAMID').AsString := DMLOG.cdsArti.FieldByName('SFAMID').AsString;
               sSQL := 'GRARID=' + quotedstr(dblcLinea.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFamilia.text) + ' AND SFAMID=' + quotedstr(dblcSUBFAM.text);
               dbeSFAM.text := DMLOG.DisplayDescrip('prvTGE', 'TGE170', 'SFAMDES', sSQL, 'SFAMDES');
            End;
         End;

         DMLOG.cdsLPrecio.fieldbyname('UNMIDG').AsString := DMLOG.cdsArti.fieldbyname('UNMIDG').AsString;
         DMLOG.cdsLPrecio.fieldbyname('LPREBASGMO').AsFloat := DMLOG.cdsArti.fieldbyname('ARTPCG').Asfloat;
         DMLOG.cdsLPrecio.fieldbyname('LPREPREGMO').AsFloat := DMLOG.cdsArti.fieldbyname('ARTPCG').Asfloat;
         DMLOG.cdsLPrecio.fieldbyname('ARTCONT').AsFloat := xContenido;
         dbePrecioG.Enabled := True;

         If wContenido Then // Si es Mayor
         Begin
            DMLOG.cdsLPrecio.fieldbyname('UNMIDU').AsString := DMLOG.cdsArti.fieldbyname('UNMIDU').AsString;
            dbeMinU.Enabled := True;
            dbePrecioU.Enabled := True;
         End
         Else
         Begin
            DMLOG.cdsLPrecio.fieldbyname('LPREPREUMO').AsFloat := 0;
            DMLOG.cdsLPrecio.fieldbyname('CANTMINU').AsFloat := 0;
            dbeMinU.Enabled := False;
            dbePrecioU.Enabled := False;
         End;
      End
      Else
      Begin
         If Z2bbtnCancel.Focused Then Exit;
         If dblcLinea.Focused Then Exit;
         If dblcFamilia.Focused Then Exit;
         If dblcSUBFAM.Focused Then Exit;
         Showmessage('Articulo Errado');
         exit;
      End;
      gbUmg.enabled := true;
      gbUmu.enabled := wContenido;
   End;
End;

Procedure TFLPrecioA.InicializaCampos;
Begin
 //dblcCia.text := '';
 //edtCia.text := '';
 //dblcLPrecio.text := '';
 //edtLPrecio.text := '';
   dblcdArticulo.text := '';
   edtArticulo.text := '';
   dtpFIni.date := date;
   dbeVigencia.text := '';
   dblcTMon.text := '';
   edtTMon.text := '';
   dblcTinid.text := '';
   edtTinid.Text := '';
   dblcLinea.text := '';
   edtLinea.text := '';
   dblcFamilia.text := '';
   edtFamilia.text := '';
   dbeTCam.text := '';
   dbePrecioG.text := '';
   dblcSUBFAM.text := '';
   dbeSFAM.text := '';
End;

Procedure TFLPrecioA.Z2bbtnOKClick(Sender: TObject);
Begin
   If Not Consistencia Then Exit;
   If (DMLOG.wModo = 'A') Then
   Begin
      If DMLOG.BuscaRegPrecio(dblcCia.text, dblcLPrecio.Text, dblcdArticulo.Text) Then
      Begin
         InicializaCampos;
         Raise Exception.Create('Registro Duplicado');
      End
   End;

   If wContenido Then
   Begin
      If length(Trim(dbePrecioU.Text)) = 0 Then
         dbePrecioU.Text := '0'
   End;

   Screen.Cursor := crHourGlass;
   DMLOG.cdsLPrecio.edit;
   DMLOG.cdsLPrecio.fieldbyname('GRARID').AsString := dblcLinea.text; // Linea
   DMLOG.cdsLPrecio.fieldbyname('FAMID').AsString := dblcFamilia.text; // Familia
   DMLOG.cdsLPrecio.fieldbyname('UNMIDG').AsString := dbeUmg.text; // Unidad de MedidaG
   DMLOG.cdsLPrecio.fieldbyname('UNMIDU').AsString := dbeUmu.text; // Unidad de MedidaU

//	DMLOG.cdsLPrecio.fieldbyname('ARTDES').AsString     := edtArticulo.Text;
   DMLOG.cdsLPrecio.fieldbyname('ARTDES').AsString := DMLOG.DisplayDescrip('prvTGE', 'TGE205', 'ARTDES',
      'CIAID=' + QuotedStr(dblcCia.text) + ' AND TINID=' + QuotedStr(dblcTinid.text) + ' AND ARTID=' + QuotedStr(dblcdArticulo.text), 'ARTDES');
   DMLOG.cdsLPrecio.fieldbyname('LPREUSER').AsString := DMLOG.wUsuario; // usuario que registra
   DMLOG.cdsLPrecio.fieldbyname('LPREFREG').AsDateTime := Date; // fecha que registra Usuario

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      DMLOG.cdsLPrecio.fieldbyname('LPREHREG').AsDateTime := Time // Hora de Registro de Usuario
   Else
      If SRV_D = 'ORACLE' Then
         DMLOG.cdsLPrecio.fieldbyname('LPREHREG').AsDateTime := Date + Time; // Hora de Registro de Usuario

   DMLOG.cdsLPrecio.fieldbyname('LPREPREGMO').AsFloat := FRound(StrToFloat(StringReplace(dbePrecioG.text, ',', '', [rfReplaceAll])), 15, 4);
   If wContenido Then
      DMLOG.cdsLPrecio.fieldbyname('LPREPREUMO').AsFloat := FRound(StrToFloat(StringReplace(dbePrecioU.text, ',', '', [rfReplaceAll])), 15, 4);

   If DMLOG.cdsLPrecio.fieldbyname('LPRETMONID').AsString = DMLOG.wTMonLoc Then
   Begin
      DMLOG.cdsLPrecio.fieldbyname('LPREPREGMN').AsFloat := FRound(StrToFloat(StringReplace(dbePrecioG.text, ',', '', [rfReplaceAll])), 15, 4);
      DMLOG.cdsLPrecio.fieldbyname('LPREPREGME').AsFloat := 0;
      If wContenido Then
         DMLOG.cdsLPrecio.fieldbyname('LPREPREUMN').AsFloat := FRound(StrToFloat(StringReplace(dbePrecioU.text, ',', '', [rfReplaceAll])), 15, 4);
   End
   Else
      If DMLOG.cdsLPrecio.fieldbyname('LPRETMONID').AsString = DMLOG.wTMonExt Then
      Begin
         DMLOG.cdsLPrecio.fieldbyname('LPREPREGMN').AsFloat := 0;
         DMLOG.cdsLPrecio.fieldbyname('LPREPREGME').AsFloat := FRound(StrToFloat(StringReplace(dbePrecioG.text, ',', '', [rfReplaceAll])), 15, 4);
         If wContenido Then
            DMLOG.cdsLPrecio.fieldbyname('LPREPREUME').AsFloat := FRound(StrToFloat(StringReplace(dbePrecioU.text, ',', '', [rfReplaceAll])), 15, 4);
      End;

   DMLOG.cdsPost(DMLOG.cdsLPrecio);
   DMLOG.cdsLPrecio.Post;
   xSQL := 'SELECT * FROM FAC201 ' +
      'WHERE CIAID=' + quotedStr(dblcCia.Text) + ' ' +
      'AND TINID=' + quotedStr(dblcTinid.Text) + ' ' +
      'AND ARTID=' + quotedStr(dblcdArticulo.Text) + ' ' +
      'AND TLISTAID=' + quotedStr(dblcLPrecio.Text);
   DMLOG.cdsLPrecio.DataRequest(xSQL);
   DMLOG.AplicaDatos(DMLOG.cdsLPrecio, 'LPRECIO');

   Screen.Cursor := crDefault;
   ShowMessage('Grabación Exitosa');

   If DMLOG.wModo = 'A' Then
   Begin
      Z2bbtnNuevo.Enabled := True;
      Z2bbtnNuevo.Setfocus;
   End
End;

Procedure TFLPrecioA.Z2bbtnCancelClick(Sender: TObject);
Begin
   If DMLOG.cdsLPrecio.State = dsInsert Then
      DMLOG.cdsLPrecio.Delete;
   close
End;

Procedure TFLPrecioA.Z2bbtnNuevoClick(Sender: TObject);
Begin
   RegistroNuevo;
   Z2bbtnNuevo.Enabled := False;
End;

Procedure TFLPrecioA.RegistroNuevo;
Begin
   edtLPrecio.text := '';
 //edtCia.text      := '';
   edtArticulo.text := '';
   edtTMon.text := '';
   dbeVigencia.Text := '';
   dbePrecioG.Text := '';
   dbePrecioU.Text := '';
   dtpFini.text := '';
   dblcTinid.text := '';
   edtTinid.text := '';
   dblcLinea.text := '';
   edtLinea.text := '';
   dblcFamilia.text := '';
   edtFamilia.text := '';
   dbeSFAM.text := '';
   DMLOG.cdsLPrecio.Insert;
   pnl2.Enabled := false;
   pnl3.Enabled := false;
   gbUmg.Enabled := false;
   gbUmu.Enabled := false;

   wModif := 'N';

   dblcCia.Text := wCia;
   DMLOG.cdsLPrecio.FieldByName('CIAID').AsString := wCia;
   dblcCiaExit(dblcCia);

   dblcLPrecio.Text := wLPe;
   DMLOG.cdsLPrecio.FieldByName('TLISTAID').AsString := wLPe;
   dblcLPrecioExit(dblcLPrecio);

 //dblcCia.Enabled:=True;
 //dblcLPrecio.Enabled := true;
   pnl1.Enabled := true;
   DMLOG.cdsLPrecio.fieldbyname('LPREFLAGD').AsString := 'N';
   dblcTinid.SetFocus;
End;

Procedure TFLPrecioA.FormActivate(Sender: TObject);
Var
   xWhere: String;
Begin
   xCrea := false;
   wModif := 'S';
   dblcCiaExit(Sender);
   dblcLPrecioExit(Sender);
End;

Procedure TFLPrecioA.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_Dialogkey, VK_TAB, 0);
   End;
End;

Procedure TFLPrecioA.dtpFIniExit(Sender: TObject);
Begin
{   if not Z2bbtnCancel.focused then begin
   if xCrea then Exit;
   if dtpFIni.Date=0 then begin
     ShowMessage('Falta Fecha de Campaña');
     dtpFIni.SetFocus;
     exit;
   end;
   xFiltro := 'TLISTAID='   +''''+dblcLPrecio.Text    +'''';
   Filtracds( DMLOG.cdsUltTGE,  'Select * from FAC101 Where '+xFiltro );
   DMLOG.cdsLPrecio.fieldbyname('LPreVig').value :=  DMLOG.cdsUltTGE.FieldByName('TLISTAVIG').AsInteger;
   xWhere := 'TMonId='+''''+'02'            +''''+' and '
        + 'Fecha='+DMLOG.wRepFuncDate+''''+ FORMATDATETIME(DMLOG.wFormatFecha ,dtpFIni.Date)+''''+')';
   if length(DMLOG.BuscaQry('dspUltTGE','TGE107','*',xWhere,'TMONID'))>0 then
   begin
    xxTCambio:=DMLOG.cdsQry.fieldbyname('TCamvbc').Value;
    DMLOG.cdsLPrecio.fieldbyname('LpreTcam').value := xxTCambio;
   end;
  end;}
End;

Procedure TFLPrecioA.dbeDsctoGExit(Sender: TObject);
Var
   xWhere, xBase: String;
   xPinc, xPdsc, xPrecio: double;
   xPBaseG, xIncG, xDsctoG: double;
Begin
   If Not Z2bbtnCancel.focused Then
   Begin
      If xCrea Then Exit;
      xPinc := 0;
      xPDsc := 0;
      xWhere := 'TLISTAID=''' + dblcLPrecio.Text + '''';
      xBase := DMLOG.BuscaQry('dspTLista', 'FAC101', '*', xWhere, 'TLISTABASE');
      If xBase = 'S' Then
      Begin
         xPinc := xPBaseG * xIncG;
         xPDsc := xPBaseG * xDsctoG;
         xPrecio := (xPBaseG + xPinc) - xPDsc;
         DMLOG.cdsLPrecio.fieldbyname('LPREPREGMO').value := FRound(xPrecio, 15, 2);
      End
      Else
         If xBase = '' Then
         Begin
            dbePrecioG.enabled := true;
            dbePrecioG.setfocus;
         End;
      If wcontenido Then
         dbeUmU.setfocus
      Else
         Z2bbtnOK.setfocus;
   End;
End;

Procedure TFLPrecioA.dblcCiaExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If Not Z2bbtnCancel.focused Then
   Begin
      edtCia.Text := DMLOG.DisplayDescrip('PRVSQL', 'TGE101', 'CIADES', 'CIAID=' + quotedStr(dblcCia.Text), 'CIADES');
      If length(edtCia.Text) = 0 Then
      Begin
         ShowMessage('Compañía no existe');
         dblcCia.Text := '';
   //dblcCia.SetFocus;
      End;

  //DMLOG.cdsLOC.Close;
  //DMLOG.cdsLOC.DataRequest('SELECT * FROM TGE126 WHERE CIAID='+quotedStr(dblcCia.Text));
  //DMLOG.cdsLOC.Open;

      DMLOG.cdsTINID.Close;
      DMLOG.cdsTINID.DataRequest('SELECT * FROM TGE152 WHERE CIAID=' + quotedStr(dblcCia.Text) + ' AND TINVENTAS=''S''');
      DMLOG.cdsTINID.Open;
      {IF DMLOG.cdsTINID.RecordCount=1 then
      begin
        dblcTinid.enabled:=False;
        dblcTinid.text:=DMLOG.cdsTINID.FieldByname('TINID').AsString;
        edtTinid.Text:= DMLOG.BuscaQry('dspUltTGE','TGE152','TINDES','TINID='+quotedstr(dblcTinid.text),'TINDES');
      end;}
   End;
End;

Function TFLPrecioA.Consistencia: Boolean;
Begin
 // consistencia Para los Topes
   If length(Trim(dbePorcG.Text)) = 0 Then
   Begin
      DMLOG.cdsLPrecio.fieldbyname('LPREPDCTOG').AsFloat := 0;
      dbePorcG.Text := '0'
   End;

   If length(Trim(dbePorcU.Text)) = 0 Then
   Begin
      DMLOG.cdsLPrecio.fieldbyname('LPREPDCTOU').AsFloat := 0;
      dbePorcU.Text := '0';
   End;
   If dbgTope.ItemIndex = 0 Then
 //if chkFlag.Checked then
   Begin
      If (StrtoFloat(dbePorcG.Text) < 0) Or (StrtoFloat(dbePorcG.Text) > 100) Then
         Raise exception.Create('Porcentaje No Valido');
      If wContenido Then
      Begin
         If (StrtoFloat(dbePorcU.Text) < 0) Or (StrtoFloat(dbePorcU.Text) > 100) Then
            Raise exception.Create('Porcentaje No Valido');
      End;
   End;

 // consistencia Compañia
   If length(dblcCia.Text) = 0 Then
      Raise exception.Create('Falta Código de Compañia');
   If length(edtCia.Text) = 0 Then
      Raise exception.Create('Código de Compañia Errado');

 // consistencia Código de Lista de Precios
   If length(dblcLPrecio.Text) = 0 Then
      Raise exception.Create('Falta Lista de Precios');
   If length(edtLPrecio.Text) = 0 Then
      Raise exception.Create('Código de Lista Errado');

 // consistencia Código de Línea de Articulo
   If length(dblcLinea.Text) = 0 Then
      Raise exception.Create('Falta Línea de Artículo');
   If length(edtLinea.Text) = 0 Then
      Raise exception.Create('Código de Línea de Artículo Errado');

 // consistencia Código de Tipo de Inventario
   If length(dblcTinid.Text) = 0 Then
      Raise exception.Create('Falta Tipo de Inventario');
   If length(edtLinea.Text) = 0 Then
      Raise exception.Create('Código de Tipo de Inventario Errado');

 // consistencia Codigo de Articulo
   If length(dblcdArticulo.Text) = 0 Then
      Raise exception.Create('Falta Articulo');
   If length(edtArticulo.Text) = 0 Then
      Raise exception.Create('Código de Articulo Errado');

 // consistencia ingreso de Fecha de Campaña
{   if dtpFIni.Date=0 then
   raise exception.Create('Falta Fecha Inicio de Campaña');}

 // consistencia Codigo Moneda
   If length(dblcTmon.Text) = 0 Then
      Raise exception.Create('Falta Código de Moneda');
   If length(edtTmon.Text) = 0 Then
      Raise exception.Create('Código de Moneda Errado');

 // consistencia ingreso de Vigencia de Campaña
{	 if length(dbeVigencia.Text)=0 then
   raise exception.Create('Falta Vigencia de Campaña');}

 // consistencia ingreso de Precio Base

   Result := True;
End;

Procedure TFLPrecioA.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMLOG.CdsLPrecio.CancelUpdates;
   DMLOG.cdsArti.Filtered := False;
End;

Procedure TFLPrecioA.dbeDsctoUExit(Sender: TObject);
Var
   xWhere, xBase: String;
   xPinc, xPdsc, xPrecio: real;
   xPBaseU, xIncU, xDsctoU: double;
Begin
   xPinc := 0;
   xPDsc := 0;
   xWhere := 'TLISTAID=''' + dblcLPrecio.Text + '''';
   xBase := DMLOG.BuscaQry('dspTLista', 'FAC101', '*', xWhere, 'TLISTABASE');
   If xBase = 'S' Then
   Begin
      xPinc := xPBaseU * xIncU;
      xPDsc := xPBaseU * xDsctoU;
      xPrecio := xPBaseU + xPinc - xPDsc;
      DMLOG.cdsLPrecio.fieldbyname('LPREPREUMO').value := FRound(xPrecio, 15, 2);
   End
   Else
      If xBase = '' Then
      Begin
         dbePrecioU.enabled := true;
         dbePrecioU.setfocus;
      End;
End;

Procedure TFLPrecioA.dbeTcamExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   dbePrecioG.Enabled := true;
   dbePrecioG.SetFocus;
End;

Procedure TFLPrecioA.dbePrecioGExit(Sender: TObject);
Begin
   If wcontenido Then
      dbePrecioU.setfocus
   Else
      dbeMinG.setfocus;
End;

Procedure TFLPrecioA.dbeVigenciaExit(Sender: TObject);
Begin
   If xCrea Then Exit;
End;

Procedure TFLPrecioA.dblcTinidExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If xCrea Then Exit;
   edtTinid.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE152', 'TINDES', 'TINID=' + quotedstr(dblcTinid.text), 'TINDES');
   If length(dblcTinid.text) = 0 Then
   Begin
      Showmessage('Ingrese Tipo de Inventario');
      dblcTinid.SetFocus;
      exit;
   End;
   If length(edtTinid.text) = 0 Then
   Begin
      Showmessage('Código de Tipo de Inventario Errado');
  //dblcTinid.SetFocus;
      exit;
   End;
   DMLOG.FiltraTabla(DMLOG.cdsALM, 'TGE151', 'ALMID', 'ALMID', 'CIAID=' + QuotedStr(dblcCia.text) + ' AND TINID=' + QuotedStr(dblcTinid.text));
End;

Procedure TFLPrecioA.dblcLineaExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If xCrea Then exit;
   edtLinea.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE131', 'GRARDES', 'GRARID=' + quotedstr(dblcLinea.Text), 'GRARDES');
 {if length(dblcLinea.text)=0 then
 begin
  Showmessage('Ingrese Línea de Artículo');
  exit;
 end;
 if length(edtLinea.text)=0 then
 begin
  Showmessage('Código de  Línea de Artículo Errado');
  //dblcLinea.SetFocus;
  exit;
 end;}
   xSQL := 'SELECT * FROM TGE169 WHERE CIAID=' + quotedStr(dblcCia.Text)
      + ' AND TINID=' + quotedStr(dblcTinid.Text)
      + ' AND GRARID=' + quotedStr(dblcLinea.Text);
   DMLOG.cdsFAM.Close;
   DMLOG.cdsFAM.DataRequest('SELECT * FROM TGE169 WHERE CIAID=' + QuotedStr(dblcCia.Text) + ' AND TINID=' + quotedStr(dblcTinid.Text) + ' AND GRARID=' + quotedStr(dblcLinea.Text));
   DMLOG.cdsFAM.Open;

   DMLOG.cdsArti.Filtered := false;
   If Length(edtLinea.text) > 0 Then
      DMLOG.cdsArti.Filter := 'CIAID=' + quotedstr(dblcCia.text) + ' AND TINID=' + quotedstr(dblcTinid.text) + ' AND GRARID=' + quotedstr(dblcLinea.text)
   Else
      DMLOG.cdsArti.Filter := 'CIAID=' + quotedstr(dblcCia.text) + ' AND TINID=' + quotedstr(dblcTinid.text);

   DMLOG.cdsArti.Filtered := True;
   If DMLOG.cdsArti.recordcount = 0 Then
   Begin
      Showmessage('La Línea seleccionada No tiene Artículos');
  //dblcLinea.SetFocus;
      exit;
   End;

End;

Procedure TFLPrecioA.dblcFamiliaExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If xCrea Then exit;
   sSQL := 'CIAID=' + QuotedsTr(dblcCia.text) + ' AND GRARID=' + quotedstr(dblcLinea.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFamilia.text);
   edtFamilia.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE169', 'FAMDES', sSQL, 'FAMDES');

   sSQL := 'SELECT * FROM TGE170 WHERE ' +
      ' TGE170.CIAID=' + QuotedStr(dblcCia.text) +
      ' AND TGE170.GRARID=' + QuotedStr(dblcLinea.text) +
      ' AND TGE170.TINID=' + QuotedStr(dblcTINID.text) +
      ' AND TGE170.FAMID=' + QuotedStr(dblcFamilia.text);
   DMLOG.cdsSUBFAM.Close;
   DMLOG.cdsSUBFAM.DataRequest(sSQL);
   DMLOG.cdsSUBFAM.Open;

   pnl3.Enabled := true;
   dblcdArticulo.Enabled := true;
  //dblcdArticulo.SetFocus;
End;

Procedure TFLPrecioA.FormCreate(Sender: TObject);
Begin
   DMLOG.cdsTINID.Close;
   DMLOG.cdsTINID.Open;
   DMLOG.cdsGArti.Close;
   DMLOG.cdsGArti.Open;
   DMLOG.cdsFAM.Close;
   DMLOG.cdsFAM.Open;
End;

Procedure TFLPrecioA.dblcTVtaNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFLPrecioA.dbgTopeClick(Sender: TObject);
Begin
   If dbgTope.ItemIndex = 0 Then
 //if chkFlag.Checked then
   Begin
      dbePorcG.Enabled := True;
      If wContenido Then
         dbePorcU.Enabled := True
      Else
         dbePorcU.Enabled := False;
   End
   Else
   Begin
      If DMLOG.cdsLPrecio.State <> dsEdit Then
         DMLOG.cdsLPrecio.Edit;
      DMLOG.cdsLPrecio.fieldbyname('LPREPDCTOG').AsFloat := 0;
      DMLOG.cdsLPrecio.fieldbyname('LPREPDCTOU').AsFloat := 0;
      dbePorcG.Text := '0';
      dbePorcU.Text := '0';
      dbePorcG.Enabled := False;
      dbePorcU.Enabled := False;
   End;
End;

Procedure TFLPrecioA.dblcSUBFAMExit(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'GRARID=' + quotedstr(dblcLinea.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFamilia.text) + ' AND SFAMID=' + quotedstr(dblcSUBFAM.text);
   dbeSFAM.text := DMLOG.DisplayDescrip('prvTGE', 'TGE170', 'SFAMDES', sSQL, 'SFAMDES');

   If DMLOG.wModo = 'A' Then
   Begin
      xSQL := 'SELECT ARTID, ARTDES, ARTABR, ARTCONT, CIAID, TINID, GRARID, FAMID, SFAMID, UNMIDG, ARTPCG, UNMIDU ' +
         'FROM TGE205 ' +
         'WHERE CIAID=' + QuotedStr(dblcCia.Text) + ' ' +
         'AND TINID=' + QuotedStr(dblcTinid.Text);
      If Length(Trim(dblcLinea.Text)) > 0 Then
         xSQL := xSQL + ' AND GRARID=' + QuotedStr(dblcLinea.Text) + ' ';
      If Length(Trim(dblcFamilia.Text)) > 0 Then
         xSQL := xSQL + 'AND FAMID=' + QuotedStr(dblcFamilia.Text) + ' ';
      If Length(Trim(dblcSUBFAM.Text)) > 0 Then
         xSQL := xSQL + 'AND SFAMID=' + QuotedStr(dblcSUBFAM.Text) + ' ';
      xSQL := xSQL + 'ORDER BY CIAID,TINID,ARTID';

      DMLOG.cdsArti.IndexFieldNames := '';
      DMLOG.cdsArti.close;
      DMLOG.cdsArti.DataRequest(xSQL);
      DMLOG.cdsArti.IndexFieldNames := 'CIAID;TINID;ARTID';
      DMLOG.cdsArti.open;
      dblcdArticulo.Selected.Clear;
      dblcdArticulo.Selected.Add('ARTID'#9'9'#9'Código');
      dblcdArticulo.Selected.Add('ARTDES'#9'30'#9'Artículo');
      dblcdArticulo.Selected.Add('GRARID'#9'5'#9'Línea');
      dblcdArticulo.Selected.Add('FAMID'#9'5'#9'Fam.');
      dblcdArticulo.Selected.Add('SFAMID'#9'5'#9'Sub Fam.');
      dblcdArticulo.Selected.Add('UNMIDG'#9'3'#9'U.M');
      dblcdArticulo.Selected.Add('LPREPREGMO'#9'9'#9'Precio Vta.');

   End;
End;

Procedure TFLPrecioA.dbeMinGExit(Sender: TObject);
Begin
   If Length(Trim(dbeMinG.Text)) = 0 Then
      DMLOG.cdsLPrecio.fieldbyname('CANTMING').AsString := '0';
End;

Procedure TFLPrecioA.NotInList(Sender: TObject; LookupTable: TDataSet;
   NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFLPrecioA.dblcTALMExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'TINID=' + quotedstr(dblcTinid.text) + ' AND CIAID=' + quotedstr(dblcCIA.text) + ' AND ALMID=' + quotedstr(dblcTALM.text);
   edtALM.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xSQL, 'ALMDES');
End;

Procedure TFLPrecioA.FormShow(Sender: TObject);
Begin
   DMLOG.AccesosUsuarios(DMLOG.wModulo, DMLOG.wUsuario, '2', Screen.ActiveForm.Name);
End;

End.


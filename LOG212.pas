//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG213
//Formulario               : FPedUsu
//Fecha de Creación        :
//Autor                    :
//Objetivo                 : Esta ventana se encarga de crear y dar
//                           martenimiento a los códigos de artículos
// HPC_201301_LOG          : 19/04/2013 rmedina Cuando se va a insertar un artículo y el tipo de inventario a escoger está
//                           marcado como deshabilitado (en el maestro de Tipo de Inventario)  debe  mostrar
//                           un mensaje "Tipo de inventario deshabilitado"  y no permitir que continúe la operación
//                           Cuando se va a modificar un artículo donde el tipo de inventario está marcado
//                           como deshabilitado (en el maestro de Tipo de Inventario) solo podrá modificar las
//                           descripciones y no el tipo de inventario, en este caso deberá mostrar un mensaje "tipo de inventario está deshabilitado".

Unit LOG212;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,
   wwdbdatetimepicker, DBCtrls, db, wwSpeedButton, wwDBNavigator, Grids,
   Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, Wwdbspin, ComCtrls, wwclient, Variants, MsgDlgs;

Type
   TFRegArti = Class(TForm)
      Z2bbtnRegresa: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      Z2bbtnGraba: TBitBtn;
      Z2bbtnNuevo: TBitBtn;
      pgArti: TPageControl;
      tsGeneral: TTabSheet;
      tsComponent: TTabSheet;
      tsEquals: TTabSheet;
      pnlCabecera: TPanel;
      lblCIA: TLabel;
      dblcCIA: TwwDBLookupCombo;
      lblNSolCot: TLabel;
      dbeCodArti: TwwDBEdit;
      lblDescrip: TLabel;
      dbeDsc: TwwDBEdit;
      dbeAbrev: TwwDBEdit;
      lblAbre: TLabel;
      bvlBox1: TBevel;
      Z2bbtnCOk: TBitBtn;
      Z2bbtnBorrar: TBitBtn;
      spbDiaVig: TwwDBSpinEdit;
      dblcUMedG: TwwDBLookupCombo;
      dbeUMedG: TwwDBEdit;
      dblcUMedU: TwwDBLookupCombo;
      dbeUMedU: TwwDBEdit;
      dbrdProcede: TDBRadioGroup;
      dbgDArti: TwwDBGrid;
      Z2dbgDReqsIButton: TwwIButton;
      bvlCAJA0: TBevel;
      dbgEQ: TwwDBGrid;
      Z2dbgDEQIButton: TwwIButton;
      bvlCAJA1: TBevel;
      lblGRUPO: TLabel;
      dblcTINID: TwwDBLookupCombo;
      lblTMON: TLabel;
      lblGrArtID: TLabel;
      dblcGrpArti: TwwDBLookupCombo;
      dbeGrpArti: TwwDBEdit;
      lblFAM: TLabel;
      dblcFAM: TwwDBLookupCombo;
      dblcSUBFAM: TwwDBLookupCombo;
      lblSUBFAM: TLabel;
      bvlCAJA2: TBevel;
      lblUMG: TLabel;
      lblCONTENIDO: TLabel;
      lblGENERAL: TLabel;
      lblTMONEDA: TLabel;
      dblcTMoneda: TwwDBLookupCombo;
      dbeTMoneda: TwwDBEdit;
      bvlCAJA4: TBevel;
      lblFAB: TLabel;
      dblcFAB: TwwDBLookupCombo;
      lblPArancel: TLabel;
      dbePArancel: TwwDBEdit;
      lblPRESEN: TLabel;
      dbePRESEN: TwwDBEdit;
      lblFECADQ: TLabel;
      dbdtpFECADQ: TwwDBDateTimePicker;
      lblFECVEN: TLabel;
      dbdtpFECVEN: TwwDBDateTimePicker;
      lblLOTE: TLabel;
      dbeLOTE: TwwDBEdit;
      lblNSERIE: TLabel;
      dbeNSERIE: TwwDBEdit;
      lblCTACON: TLabel;
      dbeTINID: TwwDBEdit;
      dbeFAM: TwwDBEdit;
      dbeSFAM: TwwDBEdit;
      dbcbAFijo: TDBCheckBox;
      tsParRep: TTabSheet;
      wwDBGrid1: TwwDBGrid;
      Bevel4: TBevel;
      lblFCOMPRA: TLabel;
      dbeFCompra: TwwDBEdit;
      lblFULTPRE: TLabel;
      dbeFUMov: TwwDBEdit;
      Label1: TLabel;
      dbeFUPrecio: TwwDBEdit;
      lblVALORI: TLabel;
      lblSOCKACT: TLabel;
      lblSAG: TLabel;
      dbeSAG: TwwDBEdit;
      lblSAU: TLabel;
      dbeSAU: TwwDBEdit;
      dbeVALG: TwwDBEdit;
      dbeVALU: TwwDBEdit;
      lblCPROMEDIO: TLabel;
      dbeCPROMG: TwwDBEdit;
      dbeCPROMU: TwwDBEdit;
      lblUSUARIO: TLabel;
      dbeUsuario: TwwDBEdit;
      lblFUSUARIO: TLabel;
      dbeFRegistro: TwwDBEdit;
      lblHUSUARIO: TLabel;
      dbeHRegistro: TwwDBEdit;
      Bevel3: TBevel;
      lblCodBar: TLabel;
      dbeCodBar: TwwDBEdit;
      TabSheet1: TTabSheet;
      lblPCOSTOG: TLabel;
      dbePCOSTOG: TwwDBEdit;
      dbePCOSTOU: TwwDBEdit;
      lblPVENTAG: TLabel;
      dbePVENTAG: TwwDBEdit;
      dbePVENTAU: TwwDBEdit;
      Label2: TLabel;
      Label3: TLabel;
      dbcbDCTG: TDBCheckBox;
      dbcbDCTU: TDBCheckBox;
      dbcbIGV: TDBCheckBox;
      dbcbIsc: TDBCheckBox;
      lblCRGO: TLabel;
      dbeCRGO: TwwDBEdit;
      dbeCtaCon: TwwDBEdit;
      Label4: TLabel;
      dbeFUVenta: TwwDBEdit;
      dbeCIA: TEdit;
      dbeFAB: TEdit;
      pnlDetalleA: TPanel;
      bvlCAJA6: TBevel;
      lblArti: TLabel;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;
      stxTitulo2: TStaticText;
      dbeArti: TwwDBEdit;
      dbcldArti: TwwDBLookupComboDlg;
      Bevel1: TBevel;
      Bevel2: TBevel;
      dbeSMaxG: TwwDBEdit;
      dbeSMinG: TwwDBEdit;
      dbeSCRep: TwwDBEdit;
      Label5: TLabel;
      Label6: TLabel;
      lblStkMax: TLabel;
      lblStkMin: TLabel;
      lblStkRep: TLabel;
      dbeSRepG: TwwDBEdit;
      Bevel5: TBevel;
      Label7: TLabel;
      Label8: TLabel;
      edtNow: TEdit;
      edtDiasSMov: TEdit;
      Bevel6: TBevel;
      lblCiVida: TLabel;
      dbeCExis: TwwDBEdit;
      dbcbNSerie: TDBCheckBox;
      Z2bbtnOK: TBitBtn;
      Label9: TLabel;
      dbcbEst: TDBCheckBox;
      dbcbInc: TDBCheckBox;
      Label10: TLabel;
      dbeComision: TwwDBEdit;
      Procedure dblcNotInListOr(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dblcNotInListDe(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dbeCodArtiExit(Sender: TObject);
      Procedure Z2bbtnCOkClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure spbDiaVigChange(Sender: TObject);
      Procedure dblcFAMChange(Sender: TObject);
      Procedure Z2bbtnBorrarClick(Sender: TObject);
      Procedure Z2bbtnOKClick(Sender: TObject);
      Procedure Z2bbtnRegresaClick(Sender: TObject);
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure Z2dbgDReqsIButtonClick(Sender: TObject);
      Procedure dbgDArtiDblClick(Sender: TObject);
      Procedure dbgDArtiKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
      Procedure Z2dbgDEQIButtonClick(Sender: TObject);
      Procedure dblcTINIDExit(Sender: TObject);
      Procedure dblcGrpArtiExit(Sender: TObject);
      Procedure dbcldArtiExit(Sender: TObject);
      Procedure dblcCIAExit(Sender: TObject);
      Procedure dblcFABExit(Sender: TObject);
      Procedure dblcUMedGExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcFAMExit(Sender: TObject);
      Procedure dblcSUBFAMExit(Sender: TObject);
      Procedure dblcUMedUExit(Sender: TObject);
      Procedure dblcTMonedaExit(Sender: TObject);
      Procedure dblcTINIDEnter(Sender: TObject);
      Procedure dbgEQKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
      Procedure dbeSMaxGExit(Sender: TObject);
      Procedure dbeSMinGExit(Sender: TObject);
      Procedure dbeSRepGExit(Sender: TObject);
      Procedure dbeCExisExit(Sender: TObject);
      Procedure dbeSCRepExit(Sender: TObject);
      Procedure dblcGrpArtiEnter(Sender: TObject);
      Procedure dblcFAMEnter(Sender: TObject);
      Procedure dblcSUBFAMEnter(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
  { Private declarations }
      iEstado: Integer;
      pgEstado: Boolean;
      xCrea: bool;
      wTINID, wGRARID, wFAMID, wSFAMID, wUNMIDG, wUNMIDU, wTMONID, wARTSPRO: String;
      wARTCONT: real;
      Procedure OnOffCabecera(Value: Boolean);
      Procedure OnOffDetalle(Value: Boolean);
      Procedure btnDetalle;
      Function EHandlerError(Ex: Exception): Boolean;
      Procedure CargaUsuario; { carga usuario, fecha y hora}
      Procedure CancelaNuevo;
      Procedure CapturarValores;
      Function VerificaCambios: boolean;

   Public
  { Public declarations }

   End;

Var
   FRegArti: TFRegArti;
   xTinven, xDesArt, xIdFam, xIdSfam, sSQL: String;

Implementation

Uses LOGDM1, oaAD2000;

{$R *.DFM}

Procedure TFRegArti.dblcNotInListOr(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRegArti.dblcNotInListDe(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRegArti.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMLOG.cdsArti.CancelUpdates;
   Action := CAFree;
End;

{ al salir del código del articulo }

Procedure TFRegArti.dbeCodArtiExit(Sender: TObject);
Begin
   If length(Trim(dbeCodArti.Text)) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', ' Falta Código de Articulo ');
      dbeCodArti.SetFocus;
      Exit;
   End;
   If DMLOG.cdsARTI.State In [dsInsert] Then
   Begin
      If DMLOG.wAnchoArt > 0 Then
         DMLOG.cdsArti.fieldbyname('ARTID').AsString := DMLOG.StrZero(dbeCodArti.Text, DMLOG.wAnchoArt);
      If DMLOG.IsExistART(DMLOG.cdsARTI.FieldByName('CIAID').AsString,
         DMLOG.cdsARTI.FieldByName('ARTID').AsString) Then
      Begin
         ErrorMsg('Error', 'Ya existe un Artículo con el mismo ' + #13 +
            'código ... ' + DMLOG.cdsARTI.FieldByName('ARTID').AsString);
         If DMLOG.wAnchoArt > 0 Then
            DMLOG.cdsArti.fieldbyname('ARTID').AsString := DMLOG.StrZero(DMLOG.MaxArt(dblcCIA.Text), DMLOG.wAnchoArt);
         dbeCodArti.SetFocus;
      End
      Else
         If DMLOG.wAnchoArt > 0 Then
            DMLOG.cdsArti.fieldbyname('ARTID').AsString := DMLOG.StrZero(dbeCodArti.Text, DMLOG.wAnchoArt);
   End;

End;

{ al aceptar la cabera }

Procedure TFRegArti.Z2bbtnCOkClick(Sender: TObject);
Var
   sSQL, xCIA, xART: String;
Begin
   If length(dbeCia.text) = 0 Then
   Begin
      ShowMessage('Registre Código de Compañía');
      dblcCia.SetFocus;
      exit;
   End;
   If length(dbeCodArti.Text) = 0 Then
   Begin
      ShowMessage('Registre Código de Artículo');
      dbeCodArti.SetFocus;
      exit;
   End;
   If length(dbeDsc.text) = 0 Then
   Begin
      ShowMessage('Registre la Descripción del Artículo');
      dbeDsc.SetFocus;
      exit;
   End;
   If length(dbeAbrev.text) = 0 Then
   Begin
      ShowMessage('Registre la Descripción Abreviada del Artículo');
      dbeAbrev.SetFocus;
      exit;
   End;

   Screen.Cursor := crhourGlass;
   OnOffCabecera(False);
   OnOffDetalle(True);
   xCIA := dblcCIA.Text;
   xART := dbeCODARTI.Text;
  // Componentes
   sSQL := 'SELECT * FROM TGE206 WHERE CIAID=' + quotedstr(xCIA)
      + ' AND ARTID=' + quotedstr(xART);
   DMLOG.cdsEARTI.Close;
   DMLOG.cdsEARTI.DataRequest(sSQL);
   DMLOG.cdsEARTI.Open;

  // Equivalentes
   sSQL := 'SELECT * FROM TGE207 WHERE CIAID=' + quotedstr(xCIA)
      + ' AND ARTID=' + quotedstr(xART);
   DMLOG.cdsQARTI.Close;
   DMLOG.cdsQARTI.DataRequest(sSQL);
   DMLOG.cdsQARTI.Open;

   pgArti.ActivePage := tsGeneral;
   tsGeneral.Enabled := True;
   pgEstado := False;

   dblcTINID.SetFocus;
   If DMLOG.wModo = 'M' Then
   Begin
      If DMLOG.cdsArti.FieldByName('ARTSPRO').AsString = 'NACIONAL' Then
         dbrdProcede.ItemIndex := 0
      Else
      Begin
         dbrdProcede.ItemIndex := 1;
      End;
      If DMLOG.cdsArti.FieldByName('ARTCONT').AsFloat = 1 Then
         spbDiaVig.Value := 1
      Else
      Begin
         spbDiaVig.Value := DMLOG.cdsArti.FieldByName('ARTCONT').AsFloat;
      End;
   End;

   Screen.Cursor := crDefault;
End;

{ al cambiar tipo de inventario}

Procedure TFRegArti.dblcTINIDExit(Sender: TObject);
Begin
   If xCrea Then exit;
   If (Length(dblcTINID.text) <= 0) And (DMLOG.cdsTINID.RecordCount > 0) Then
   Begin
      ErrorMsg('Error', 'Debe de escoger un Tipo' + #13 + ' de Inventario');
   End;

  //INICIO HPC_201301_LOG
  //Se restringe la modificación e inserción  del tipo de  inventario
   If ((Length(trim(wTINID)) = 0) And (Length(trim(dblcTINID.Text)) > 0) And (Not DMLOG.VerificaTipInventario(dblcCIA.Text, dblcTINID.Text))) Or
      ((Length(trim(wTINID)) > 0) And (trim(wTINID) <> trim(dblcTINID.Text)) And (Not DMLOG.VerificaTipInventario(dblcCIA.Text, wTINID))) Or
      ((Length(trim(wTINID)) > 0) And (trim(wTINID) <> trim(dblcTINID.Text)) And (DMLOG.VerificaTipInventario(dblcCIA.Text, wTINID)) And
      (Not DMLOG.VerificaTipInventario(dblcCIA.Text, dblcTINID.Text))) Then

   Begin

      If ((Length(trim(wTINID)) = 0) And (Length(trim(dblcTINID.Text)) > 0) And (Not DMLOG.VerificaTipInventario(dblcCIA.Text, dblcTINID.Text))) Then
         ErrorMsg('Inventarios', 'El Tipo de Inventario ' + trim(wTINID) + ' está DESHABILITADO..');
      If ((Length(trim(wTINID)) > 0) And (trim(wTINID) <> trim(dblcTINID.Text)) And (Not DMLOG.VerificaTipInventario(dblcCIA.Text, wTINID))) Then
         ErrorMsg('Inventarios', 'El Tipo de Inventario ' + trim(wTINID) + ' está DESHABILITADO..');
      If ((Length(trim(wTINID)) > 0) And (trim(wTINID) <> trim(dblcTINID.Text)) And (DMLOG.VerificaTipInventario(dblcCIA.Text, wTINID)) And
         (Not DMLOG.VerificaTipInventario(dblcCIA.Text, dblcTINID.Text))) Then
         ErrorMsg('Inventarios', 'El Tipo de Inventario ' + trim(dblcTINID.Text) + ' está DESHABILITADO..');

      dblcTINID.Text := wTINID;
      If (Length(trim(wTINID)) = 0) Then dbeTINID.Text := '';
      dblcTINID.SetFocus;
      exit;
   End;
  //FINAL HPC_201301_LOG

// Lineas o Grupos
   sSQL := 'select * from TGE131 '
      + 'where CIAID=' + quotedstr(dblcCia.text)
      + '  and TINID=' + quotedstr(dblcTINID.text);
   DMLOG.cdsGArti.Close;
   DMLOG.cdsGARTI.DataRequest(sSQL);
   DMLOG.cdsGArti.Open;
   DMLOG.cdsGArti.IndexFieldNames := 'GRARID';
   dblcGrpArti.LookupTable := DMLOG.cdsGArti;
   dblcGrpArti.LookupField := 'GRARID';

   If DMLOG.cdsArti.FieldByName('TINID').AsString <> xTinven Then
   Begin
      dbeTINID.Text := DMLOG.cdsTINID.fieldbyname('TINDES').AsString;
      dblcGrpArti.Text := '';
      dbeGrpArti.Clear;
      dblcFAM.Clear;
      dbeFAM.Clear;
      dblcSUBFAM.Clear;
      dbeSFAM.Clear;
      dbeCtaCon.Text := DMLOG.cdsTINID.fieldbyname('CUENTAID').AsString;
   End;
End;

{ al cambiar la linea o grupo }

Procedure TFRegArti.dblcGrpArtiExit(Sender: TObject);
Begin
   If xCrea Then exit;
   If (Length(dblcGrpArti.text) <= 0) And (DMLOG.cdsGArti.RecordCount > 0) Then
   Begin
      ErrorMsg('Error', 'Debe de escoger un ' + #13 + 'Grupo o Línea');
      //INICIO HPC_201301_LOG
      dblcGrpArti.SetFocus;
      Exit;
      //FINAL  HPC_201301_LOG
   End;

   If dblcGrpArti.Text <> '' Then
   Begin
      sSQL := 'CIAID=' + quotedstr(dblcCIA.text) + ' AND GRARID=' + quotedstr(dblcGrpArti.text)
         + ' AND TINID =''' + dblcTINID.text + '''';
      dbeGrpArti.text := DMLOG.DisplayDescrip('prvTGE', 'TGE131', 'GRARDES', sSQL, 'GRARDES');
      If length(Trim(DMLOG.DisplayDescrip('prvTGE', 'TGE131', 'CUENTAID', sSQL, 'CUENTAID'))) > 0 Then
         dbeCtaCon.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE131', 'CUENTAID', sSQL, 'CUENTAID'); //DMLOG.cdsGArti.fieldbyname('CUENTAID').AsString;
   // Familias
      sSQL := 'select * from TGE169 '
         + 'where CIAID=' + quotedstr(dblcCia.text)
         + '  and TINID=' + quotedstr(dblcTINID.text)
         + '  and GRARID=' + quotedstr(dblcGrpArti.text);
      DMLOG.cdsFAM.Close;
      DMLOG.cdsFAM.DataRequest(sSQL);
      DMLOG.cdsFAM.Open;
      DMLOG.cdsFAM.IndexFieldNames := 'FAMID';
      dblcFAM.LookupTable := DMLOG.cdsFAM;
      dblcFAM.LookupField := 'FAMID';
   End;
End;

Procedure TFRegArti.dblcFAMChange(Sender: TObject);
Begin
End;

{ cuando varia el valor del contenido }

Procedure TFRegArti.spbDiaVigChange(Sender: TObject);
Var
   VBool: Bool; { true = cuando es mayor que 1}
Begin
   If spbDiaVig.Value > 1 Then
      VBool := true
   Else
   Begin
      VBool := false;
      dbePCOSTOU.Text := '0.00';
      dbePVENTAU.Text := '0.00';
      dblcUMedU.Text := '';
      dbeUMedU.Text := '';
      dbcbDCTU.State := cbUnchecked;
   End;
   dbcbDCTU.Enabled := VBool;
   dblcUMedU.Enabled := VBool;
   dbePCOSTOU.Enabled := VBool;
   dbePVENTAU.Enabled := VBool;
End;

{ activa o desactiva componentes de la cabecera }

Procedure TFRegArti.OnOffCabecera(Value: Boolean);
Begin
  // ....................... activar cabecera de requisición ...................
   pnlCabecera.Enabled := Value;
   tsGeneral.Enabled := Value;
   Z2bbtnCOk.Enabled := Value;

   If value Then
   Begin
      pgArti.Enabled := False;
   End
   Else
      pgArti.Enabled := Value;
End;

{ activa o desactiva componentes del detalle  }

Procedure TFRegArti.OnOffDetalle(Value: Boolean);
Begin
  // ....................... activar detalle de requisición ....................

   If value Then
   Begin
      pgArti.Enabled := True;
   End
   Else
      pgArti.Enabled := Value;

   Z2bbtnBorrar.Enabled := Value;
   Z2bbtnOK.Enabled := Value;
   Z2bbtnRegresa.Enabled := value;
   Z2bbtnCanc2.Enabled := value;
   If (Z2bbtnOK.Enabled = true) Or (Z2bbtnCOk.Enabled = true) Then
      Z2bbtnGraba.Enabled := false;
   If (Z2bbtnOK.Enabled = false) And (Z2bbtnCOk.Enabled = false) Then
      Z2bbtnGraba.Enabled := true;
   If (Z2bbtnGraba.Enabled = true) Or (Z2bbtnCOk.Enabled = true) Then
      Z2bbtnNuevo.Enabled := false;
   If (Z2bbtnGraba.Enabled = false) And (Z2bbtnCOk.Enabled = false) Then
      Z2bbtnNuevo.Enabled := true;

End;

Procedure TFRegArti.btnDetalle;
Var
   bDummy1: Boolean;
Begin

   bDummy1 := (DMLOG.cdsEArti.RecordCount > 0) Or
      (DMLOG.cdsArti.ChangeCount > 0) Or
      (DMLOG.cdsArti.Modified) Or
      (DMLOG.cdsEArti.ChangeCount > 0) Or
      (DMLOG.cdsEArti.Modified) Or
      (DMLOG.cdsQArti.ChangeCount > 0) Or
      (DMLOG.cdsQArti.Modified);

   Z2bbtnGraba.Enabled := bDummy1;
   Z2bbtnCanc2.Enabled := bDummy1;
   Z2bbtnRegresa.Enabled := bDummy1;
End;

Procedure TFRegArti.Z2bbtnBorrarClick(Sender: TObject);
Begin
   If DMLOG.cdsArti.State In [dsInsert, dsEdit] Then
   Begin
      DMLOG.cdsArti.FieldByName('TINID').AsString := '';
      DMLOG.cdsArti.FieldByName('GRARID').AsString := '';
      DMLOG.cdsArti.FieldByName('FAMID').AsString := '';
      DMLOG.cdsArti.FieldByName('SFAMID').AsString := '';
      DMLOG.cdsArti.FieldByName('UNMIDG').AsString := '';
      DMLOG.cdsArti.FieldByName('ARTDCTG').AsString := 'N';
      dbcbDCTG.Checked := False;
      DMLOG.cdsArti.FieldByName('ARTPCG').Value := null;
      DMLOG.cdsArti.FieldByName('ARTPVG').Value := null;
      DMLOG.cdsArti.FieldByName('ARTCONT').AsFloat := 1;
      DMLOG.cdsArti.FieldByName('TMONID').AsString := '';
      DMLOG.cdsArti.FieldByName('ARTCRGO').Value := null;
      DMLOG.cdsArti.FieldByName('UNMIDU').AsString := '';
      DMLOG.cdsArti.FieldByName('ARTDCTU').AsString := 'N';
      dbcbDCTU.Checked := False;
      DMLOG.cdsArti.FieldByName('ARTPCU').AsFloat := 0.00;
      DMLOG.cdsArti.FieldByName('ARTPVU').AsFloat := 0.00;
      DMLOG.cdsArti.FieldByName('ARTSPRO').AsString := 'NACIONAL';
      dbrdProcede.ItemIndex := 0;
      DMLOG.cdsArti.FieldByName('FABID').asString := '';
      DMLOG.cdsArti.FieldByName('ARTPRE').asString := '';
      DMLOG.cdsArti.FieldByName('ARTACTIVO').AsString := 'STOCK';
      DMLOG.cdsArti.FieldByName('ARTEST').AsString := 'H';
      DMLOG.cdsArti.FieldByName('ARTFLAGINC').AsString := 'N';
      DMLOG.cdsArti.FieldByName('FNSERIE').AsString := 'N';
      dbcbAFijo.Checked := False;
      dbcbNSerie.Checked := False;
      dbcbInc.Checked := False;
      DMLOG.cdsArti.FieldByName('ARTIGV').AsString := 'N';
      dbcbIGV.Checked := false;
      DMLOG.cdsArti.FieldByName('ARTPARA').asString := '';
      DMLOG.cdsArti.FieldByName('ARTLOTE').asString := '';
      DMLOG.cdsArti.FieldByName('ARTNSER').asString := '';
      DMLOG.cdsArti.FieldByName('ARTFUC').Value := null;
      DMLOG.cdsArti.FieldByName('ARTFUC').Value := null;
      DMLOG.cdsArti.FieldByName('CUENTAID').Value := null;
      DMLOG.cdsArti.FieldByName('ARTFUC').Value := null;
      DMLOG.cdsArti.FieldByName('ARTFUMV').Value := null;
      DMLOG.cdsArti.FieldByName('ARTFUPRC').Value := null;
      DMLOG.cdsArti.FieldByName('ARTCNTG').Value := null;
      DMLOG.cdsArti.FieldByName('ARTCNTU').Value := null;
      DMLOG.cdsArti.FieldByName('ARTMNTG').Value := null;
      DMLOG.cdsArti.FieldByName('ARTCPROG').Value := null;
      DMLOG.cdsArti.FieldByName('ARTCPROU').Value := null;
      DMLOG.cdsArti.FieldByName('STKSMAXG').AsFloat := 0.00;
      DMLOG.cdsArti.FieldByName('STKSMAXU').AsFloat := 0.00;
      DMLOG.cdsArti.FieldByName('STKSMING').AsFloat := 0.00;
      DMLOG.cdsArti.FieldByName('STKSMINU').AsFloat := 0.00;
      DMLOG.cdsArti.FieldByName('STKSPREG').AsFloat := 0.00;
      DMLOG.cdsArti.FieldByName('STKSPREU').AsFloat := 0.00;
      dbeCodBar.text := '';
   End;
End;

Procedure TFRegArti.Z2bbtnOKClick(Sender: TObject);
Var
   sSQL: String;
   bMovimiento: Boolean;
Begin
   If Length(Trim(DMLOG.cdsArti.FieldByName('TINID').AsString)) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', 'Falta Tipo de Inventario');
      Exit;
   End;

   If Length(Trim(DMLOG.cdsArti.FieldByName('GRARID').AsString)) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', 'Falta Linea de Producto');
      Exit;
   End;

   If wUrqCia = 'S' Then
      If Length(Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString)) = 0 Then
      Begin
         ErrorMsg('Adquisiciones', 'Falta Familia');
         Exit;
      End;

   If wUrqCia = 'S' Then
      If Length(Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString)) = 0 Then
      Begin
         ErrorMsg('Adquisiciones', 'Falta Sub - Familia');
         Exit;
      End;

   If DMLOG.cdsArti.State In [dsInsert, dsEdit] Then
   Try
      Screen.Cursor := crHourGlass;

      If (DMLOG.WModo = 'M') And (VerificaCambios) Then
      Begin
         sSQL := '';
         sSQL := 'SELECT STKANO, ARTID, SUM(' + DMLOG.wReplacCeros + '(STKISG01,0)+' + DMLOG.wReplacCeros + '(STKSSG01,0)+' + DMLOG.wReplacCeros + '(STKISG02,0)+' +
            '' + DMLOG.wReplacCeros + '(STKSSG02,0)+' + DMLOG.wReplacCeros + '(STKISG03,0)+' + DMLOG.wReplacCeros + '(STKSSG03,0)+' + DMLOG.wReplacCeros + '(STKISG04,0)+' +
            '' + DMLOG.wReplacCeros + '(STKSSG04,0)+' + DMLOG.wReplacCeros + '(STKISG05,0)+' + DMLOG.wReplacCeros + '(STKSSG05,0)+' + DMLOG.wReplacCeros + '(STKISG06,0)+' +
            '' + DMLOG.wReplacCeros + '(STKSSG06,0)+' + DMLOG.wReplacCeros + '(STKISG07,0)+' + DMLOG.wReplacCeros + '(STKSSG07,0)+' + DMLOG.wReplacCeros + '(STKISG08,0)+' +
            '' + DMLOG.wReplacCeros + '(STKSSG08,0)+' + DMLOG.wReplacCeros + '(STKISG09,0)+' + DMLOG.wReplacCeros + '(STKSSG09,0)+' + DMLOG.wReplacCeros + '(STKISG10,0)+' +
            '' + DMLOG.wReplacCeros + '(STKSSG10,0)+' + DMLOG.wReplacCeros + '(STKISG11,0)+' + DMLOG.wReplacCeros + '(STKSSG11,0)+' + DMLOG.wReplacCeros + '(STKISG12,0)+' +
            '' + DMLOG.wReplacCeros + '(STKSSG12,0)+' + DMLOG.wReplacCeros + '(STKISU01,0)+' + DMLOG.wReplacCeros + '(STKSSU01,0)+' +
            '' + DMLOG.wReplacCeros + '(STKISU02,0)+' + DMLOG.wReplacCeros + '(STKSSU02,0)+' + DMLOG.wReplacCeros + '(STKISU03,0)+' + DMLOG.wReplacCeros + '(STKSSU03,0)+' +
            '' + DMLOG.wReplacCeros + '(STKISU04,0)+' + DMLOG.wReplacCeros + '(STKSSU04,0)+' + DMLOG.wReplacCeros + '(STKISU05,0)+' + DMLOG.wReplacCeros + '(STKSSU05,0)+' +
            '' + DMLOG.wReplacCeros + '(STKISU06,0)+' + DMLOG.wReplacCeros + '(STKSSU06,0)+' + DMLOG.wReplacCeros + '(STKISU07,0)+' + DMLOG.wReplacCeros + '(STKSSU07,0)+' +
            '' + DMLOG.wReplacCeros + '(STKISU08,0)+' + DMLOG.wReplacCeros + '(STKSSU08,0)+' + DMLOG.wReplacCeros + '(STKISU09,0)+' + DMLOG.wReplacCeros + '(STKSSU09,0)+' +
            '' + DMLOG.wReplacCeros + '(STKISU10,0)+' + DMLOG.wReplacCeros + '(STKSSU10,0)+' + DMLOG.wReplacCeros + '(STKISU11,0)+' + DMLOG.wReplacCeros + '(STKSSU11,0)+' +
            '' + DMLOG.wReplacCeros + '(STKISU12,0)+' + DMLOG.wReplacCeros + '(STKSSU12,0)) MOVI ' +
            'FROM LOG316 ' +
            'WHERE ARTID=' + QuotedStr(DMLOG.cdsArti.FieldByName('ARTID').AsString) + ' ' +
            'GROUP BY STKANO, ARTID ORDER BY STKANO DESC';
         DMLOG.cdsSQL.Close;
         DMLOG.cdsSQL.DataRequest(sSQL);
         DMLOG.cdsSQL.Open;
         DMLOG.cdsSQL.First;
         bMovimiento := (DMLOG.cdsSQL.FieldByName('MOVI').AsFloat > 0);
         If (Not bMovimiento) And (DMLOG.cdsSQL.recordcount > 1) Then
         Begin
            DMLOG.cdsSQL.Next;
            bMovimiento := (DMLOG.cdsSQL.FieldByName('MOVI').AsFloat > 0);
         End;
         If bMovimiento Then
         Begin
            screen.Cursor := crdefault;
            Raise Exception.Create('No se puede modificar el artículo, por tener movimientos');
         End;
      End;

      If dbcbDCTU.Checked = false Then
         DMLOG.cdsArti.FieldByName('ARTDCTU').AsString := 'N';
      If DMLOG.cdsArti.FieldByName('ARTACTIVO').IsNull Then
         DMLOG.cdsArti.FieldByName('ARTACTIVO').AsString := 'STOCK';

      If DMLOG.cdsArti.FieldByName('ARTEST').IsNull Then
         DMLOG.cdsArti.FieldByName('ARTEST').AsString := 'H';

      If DMLOG.cdsArti.FieldByName('ARTFLAGINC').IsNull Then
         DMLOG.cdsArti.FieldByName('ARTFLAGINC').AsString := 'N';

      If DMLOG.cdsArti.FieldByName('FNSERIE').IsNull Then
         DMLOG.cdsArti.FieldByName('FNSERIE').AsString := 'N';

      If DMLOG.cdsArti.FieldByName('ARTDCTG').IsNull Then
         DMLOG.cdsArti.FieldByName('ARTDCTG').AsString := 'N';
      If DMLOG.cdsArti.FieldByName('ARTDCTU').IsNull Then
         DMLOG.cdsArti.FieldByName('ARTDCTU').AsString := 'N';
      If DMLOG.cdsArti.FieldByName('ARTIGV').IsNull Then
         DMLOG.cdsArti.FieldByName('ARTIGV').AsString := 'N';
      pgEstado := True; // puede cambiar de pagina
      DMLOG.cdsPost(DMLOG.cdsArti);
      DMLOG.cdsArti.Post;
      OnOffDetalle(False); //Desactivar el panel de detalle
      btnDetalle;
      pgArti.Enabled := True;
      If (DMLOG.cdsArti.ChangeCount = 0) And (Not DMLOG.cdsArti.Modified) Then
      Begin
         Z2bbtnCanc2.Enabled := True;
         Z2bbtnCOk.Enabled := true;
         pnlCabecera.Enabled := True;
      End;
      Screen.Cursor := CrDefault;
   Except
      On E: Exception Do
         If Not EHandlerError(E) Then Raise;
   End;
End;

Procedure TFRegArti.Z2bbtnRegresaClick(Sender: TObject);
Begin
   DMLOG.cdsArti.Edit;
   OnOffCabecera(True);
   OnOffDetalle(False);

   If DMLOG.cdsCIA.RecordCount > 1 Then
      If dblcCIA.Enabled = true Then
         dblcCIA.SetFocus
      Else
         If dbeCodArti.Enabled Then
            dbeCodArti.SetFocus
         Else
            dbeDsc.SetFocus;

   pgArti.ActivePage := tsGeneral;
End;

Procedure TFRegArti.Z2bbtnCanc2Click(Sender: TObject);
Begin
   CancelaNuevo;
   Close;
End;

Procedure TFRegArti.Z2bbtnGrabaClick(Sender: TObject);
Var
   sSQL, xArt, xWhere: String;
   bFlag: boolean;
Begin
   bFlag := false;

   Try
      Screen.Cursor := CrHourGlass;
      sSQL := 'SELECT * FROM TGE205 WHERE ARTID=''' + dbeCodArti.Text + '''';
      DMLOG.cdsArti.DataRequest(sSQl);

      DMLOG.ControlTran(9, DMLOG.cdsArti, 'ARTI');
      DMLOG.ControlTran(9, DMLOG.cdsEArti, 'EARTI');
      DMLOG.ControlTran(9, DMLOG.cdsQArti, 'QARTI');

      If DMLOG.wTipoAdicion = 'xFiltro' Then
      Begin
         DMLOG.ActualizaFiltro(Mtx2000, DMLOG.cdsArti, DMLOG.wModo);
      End;

      If DMLOG.wModo = 'M' Then
      Begin
         If (xDesArt <> Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) Or
            (xIdFam <> Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString)) Or
            (xIdSfam <> Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString)) Then
         Begin
            sSQL := 'UPDATE FAC201 SET '
               + 'ARTDES = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) + ', '
               + 'FAMID  = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString)) + ', '
               + 'SFAMID = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString)) + ' '
               + ' WHERE CIAID=' + quotedstr(dblcCIA.Text)
               + '   and TINID=' + quotedstr(dblcTINID.Text)
               + '   and ARTID=' + quotedstr(dbeCodArti.Text);
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
               xWhere := ' CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
               xArt := DMLOG.DisplayDescrip('prvTGE', 'FAC201', 'ARTID', xWhere, 'ARTID');
               If length(Trim(xArt)) > 0 Then
                  Information('Adquisiciones', 'Es necesario que vuelva a Grabar' + #13'No se Actualizaron los Datos en la Lista Precios');
            End;

            sSQL := 'UPDATE FAC302 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) + ', ' +
               'FAMID  = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString)) + ', ' +
               'SFAMID = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE FAC304 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) + ', ' +
               'FAMID  = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString)) + ', ' +
               'SFAMID = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE FAC306 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) + ', ' +
               'FAMID  = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString)) + ', ' +
               'SFAMID = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE FAC310 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE FAC312 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) + ', ' +
               'FAMID  = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString)) + ', ' +
               'SFAMID = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE LOG303 SET ' +
               'FAMID  = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString)) + ', ' +
               'SFAMID = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE LOG305 SET ' +
               'FAMID  = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString)) + ', ' +
               'SFAMID = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE LOG307 SET ' +
               'FAMID  = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString)) + ', ' +
               'SFAMID = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString)) + ', ' +
               'SFAMDES= ' + QuotedStr(Trim(dbeSFAM.Text)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE LOG309 SET ' +
               'FAMID  = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString)) + ', ' +
               'SFAMID = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE LOG313 SET ' +
               'FAMID  = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString)) + ', ' +
               'SFAMID = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE LOG315 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) + ', ' +
               'FAMID  = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString)) + ', ' +
               'SFAMID = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE LOG316 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
               xWhere := ' CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
               xArt := DMLOG.DisplayDescrip('prvTGE', 'LOG316', 'ARTID', xWhere, 'ARTID');
               If length(Trim(xArt)) > 0 Then
                  Information(Caption, 'Es necesario que vuelva a Grabar' + #13'No se Actualizaron los Datos en el Kardex');
            End;

            sSQL := 'UPDATE LOG320 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE LOG323 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE LOG326 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE LOG327 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) + ', ' +
               'FAMID  = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString)) + ', ' +
               'SFAMID = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except

            End;
            sSQL := 'UPDATE LOG328 SET ' +
               'ARTDES = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) + ', ' +
               'FAMID  = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString)) + ', ' +
               'SFAMID = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND ARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE TGE206 SET ' +
               'EARTDES = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND EARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;

            sSQL := 'UPDATE TGE207 SET ' +
               'QARTDES = ' + QuotedStr(Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString)) + ' ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' AND TINID=''' + dblcTINID.Text + ''' AND QARTID=''' + dbeCodArti.Text + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;
         End;
      End;
      xDesArt := Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString);
      xIdFam := Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString);
      xIdSfam := Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString);
      pgEstado := True;
      pgArti.ActivePage := tsGeneral;
      onoffdetalle(False);
      btnDetalle;
      Z2bbtnNuevo.Enabled := true;
      Z2bbtnCOk.Enabled := true;
      Z2bbtnGraba.Enabled := false;
      pnlCabecera.Enabled := True;
   Finally
      Screen.Cursor := CrDefault;
   End;
End;

Procedure TFRegArti.Z2bbtnNuevoClick(Sender: TObject);
Begin
   DMLOG.wModo := 'A';
   dbrdProcede.ItemIndex := 0; { inicializo el Radio a Nacional}
   spbDiaVig.Value := 1; { inicializo el contenido, cuando es > 2, habilita controles de Unidad}
   dbeTINID.Text := '';
   dbeFAM.Text := '';
   dbeSFAM.Text := '';
   dbeUMedG.Text := '';
   dbeUMedU.Text := '';
   dbeGrpArti.Text := '';
   dbeCIA.Text := '';
   dbeTMoneda.Text := '';
   dbeFAB.Text := '';
   edtDiasSMov.Text := '';
   xDesArt := '';
   xIdFam := '';
   xIdSfam := '';

   OnOffCabecera(True);
   OnOffDetalle(False);

   dblcCIA.Enabled := True;
   dbeCodArti.Enabled := True;
   If DMLOG.cdsArti.State <> dsInsert Then
      DMLOG.cdsArti.Insert;
   DMLOG.cdsArti.FieldByName('ARTCONT').Value := spbDiaVig.Value;
   DMLOG.cdsArti.FieldByName('ARTSPRO').AsString := 'NACIONAL';
   DMLOG.cdsArti.FieldByName('ARTFADQ').AsDateTime := Now;
   {inicializo a 0.00 los datos de parametro de reposición}
   DMLOG.cdsArti.FieldByName('ARTCNTG').value := 0.00;
   DMLOG.cdsArti.FieldByName('ARTCNTU').value := 0.00;
   DMLOG.cdsArti.FieldByName('ARTMNTG').value := 0.00;
   DMLOG.cdsArti.FieldByName('ARTMNTU').value := 0.00;
   DMLOG.cdsArti.FieldByName('ARTCPROG').value := 0.00;
   DMLOG.cdsArti.FieldByName('ARTCPROU').value := 0.00;
   DMLOG.cdsArti.FieldByName('ARTPCG').value := 0.00;
   DMLOG.cdsArti.FieldByName('ARTPCU').value := 0.00;
   DMLOG.cdsArti.FieldByName('ARTPVG').value := 0.00;
   DMLOG.cdsArti.FieldByName('ARTPVU').value := 0.00;

   DMLOG.cdsArti.FieldByName('ARTACTIVO').AsString := 'STOCK';
   DMLOG.cdsArti.FieldByName('FNSERIE').AsString := 'N';
   DMLOG.cdsArti.FieldByName('ARTEST').AsString := 'H';
   DMLOG.cdsArti.FieldByName('ARTFLAGINC').AsString := 'N';
   DMLOG.cdsArti.FieldByName('UNMIDG').AsString := DMLOG.DisplayDescrip('prvSQL', 'TGE130', 'UNMID', 'UNMSERV=''S''', 'UNMID');
   dblcUMedGExit(dblcUMedG);

   dbcbAFijo.Checked := False;
   dbcbNSerie.Checked := False;
   dbcbInc.Checked := False;

   DMLOG.cdsArti.FieldByName('STKSMAX').AsFloat := 0.00;
   DMLOG.cdsArti.FieldByName('STKSMIN').AsFloat := 0.00;
   DMLOG.cdsArti.FieldByName('STKSPRE').AsFloat := 0.00;
   DMLOG.cdsArti.FieldByName('STKSCPE').AsFloat := 0.00;

   pgEstado := False;
   CargaUsuario;
   If DMLOG.cdsCIA.RecordCount > 1 Then
      dblcCIA.SetFocus
   Else
   Begin
      DMLOG.cdsArti.fieldbyname('CIAID').AsString := DMLOG.cdsCIA.fieldbyname('CIAID').AsString;
      dblcCiaExit(Nil);
      dbeCodArti.SetFocus;
      If DMLOG.wAnchoArt > 0 Then
         DMLOG.cdsArti.fieldbyname('ARTID').AsString := DMLOG.StrZero(DMLOG.MaxArt(dblcCIA.Text), DMLOG.wAnchoArt);
   End;
End;

Procedure TFRegArti.dbcldArtiExit(Sender: TObject);
Var
   wSQL: String;
Begin
   wSQL := 'CIAID=' + QuotedStr(dblcCIA.Text) + ' AND ARTID=' + QuotedStr(dbcldArti.Text);
   dbeArti.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE205', 'ARTDES', wSQL, 'ARTDES');
End;

{ procesos de componetes de articulos }

Procedure TFRegArti.Z2bbtnRegOkClick(Sender: TObject);
Var
   sCIAID, sARTID, sXARTID, sXTINID, sARTDES, sARTABR, xF: String;
   bExiste: Boolean;
   cds: TwwClientDataSet;
Begin
   If Length(Trim(dbeArti.Text)) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', 'Articulo no Existe');
      Exit;
   End;

   If Length(Trim(dbeArti.Text)) > 0 Then
   Begin
      sCIAID := DMLOG.cdsArti.FieldByName('CIAID').AsString;
      sARTID := DMLOG.cdsArti.FieldByName('ARTID').AsString;
      sXTINID := DMLOG.cdsKDXTemp.FieldByName('TINID').AsString;
      sARTDES := DMLOG.cdsKDXTemp.FieldByName('ARTDES').AsString;
      sARTABR := DMLOG.cdsKDXTemp.FieldByName('ARTABR').AsString;
      sXARTID := dbcldArti.Text;
      cds := Nil;
      If pgArti.ActivePage = tsComponent Then
      Begin
         xF := 'E';
         cds := DMLOG.cdsEArti;
      End
      Else
         If pgArti.ActivePage = tsEquals Then
         Begin
            xF := 'Q';
            cds := DMLOG.cdsQArti;
         End;
      If iEstado = 0 Then
         bExiste := cds.Locate('CIAID;TINID;ARTID;' + xF + 'ARTID', VarArrayOf([sCIAID, sXTINID, sARTID, sXARTID]), [])
      Else
      Begin
         bExiste := False;
      End;
      If bExiste Then
      Begin
         ErrorMsg('Error', 'No pueden existir Artículos Duplicados');
         Exit;
      End;
      If iEstado = 0 Then
         cds.Insert
      Else
         cds.Edit;
      If cds.State In [dsInsert, dsEdit] Then
      Begin
         Try
            cds.FieldByName('CIAID').AsString := sCIAID;
            cds.FieldByName('ARTID').AsString := sARTID;
            cds.FieldByName('TINID').AsString := sXTINID;
            cds.FieldByName(xF + 'ARTID').AsString := dbcldArti.Text;
            cds.FieldByName(xF + 'ARTDES').AsString := sARTDES;
            cds.FieldByName(xF + 'ARTABR').AsString := sARTABR;
            cds.Post;
            OnOffDetalle(True);
            pnlDetalleA.Visible := False;
            btnDetalle;
            pgArti.Enabled := True;
         Except
            On E: Exception Do EHandlerError(E);
         End;
      End;
      pnlDetalleA.Visible := False;
    //cds := nil;
   End;
End;

Procedure TFRegArti.Z2bbtnRegCancClick(Sender: TObject);
Begin
   If DMLOG.cdsEARTI.State In [dsInsert, dsEdit] Then
      DMLOG.cdsEARTI.Cancel;
   OnOffDetalle(True); // activar detalle
   pnlDetalleA.Visible := False;
End;

Function TFRegArti.EHandlerError(Ex: Exception): Boolean;
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

{ procesos de Componentes }

Procedure TFRegArti.Z2dbgDReqsIButtonClick(Sender: TObject);
Begin
   iEstado := 0;
   dbcldArti.Text := '';
   dbeArti.Text := '';
   pnlDetalleA.Left := 181;
   pnlDetalleA.Top := 284;
   pnlDetalleA.Visible := True; // Activar el panel de Mantenimiento
   pnlDetalleA.BringToFront;
   pgArti.Enabled := False;
   btnDetalle;
End;

Procedure TFRegArti.dbgDArtiDblClick(Sender: TObject);
Var
   cds: TwwClientDataSet;
   xF: String;
Begin
   cds := Nil;
   If pgArti.ActivePage = tsComponent Then
   Begin
      xF := 'E';
      cds := DMLOG.cdsEArti;
   End
   Else
      If pgArti.ActivePage = tsEquals Then
      Begin
         xF := 'Q';
         cds := DMLOG.cdsQArti;
      End;

   If cds.RecordCount = 0 Then Exit;

   OnOffDetalle(False); // Desactivar el panel de detalle
   pnlDetalleA.Visible := True; // Activar el panel de Mantenimiento
   pnlDetalleA.BringToFront;
   DMLOG.cdsArti.Edit;

   dbcldArti.Text := cds.FieldByName('EARTID').AsString;
   dbeArti.Text := cds.FieldByName('EARTDES').AsString;
   iEstado := 1;
   btnDetalle;
End;

Procedure TFRegArti.dbgDArtiKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (Key = $4D) And (ssCtrl In Shift) Then
   Begin
      dbgDArtiDblClick(Nil);
   End;

   If (Key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If pgArti.ActivePage = tsComponent Then
         If DMLOG.cdsEArti.RecordCount > 0 Then DMLOG.cdsEArti.Delete;

      If pgArti.ActivePage = tsEquals Then
         If DMLOG.cdsQArti.RecordCount > 0 Then DMLOG.cdsQArti.Delete;
   End;
   btnDetalle;
End;

{ procesos de Equivalentes }

Procedure TFRegArti.Z2dbgDEQIButtonClick(Sender: TObject);
Begin
   iEstado := 0;
   dbcldArti.Text := '';
   dbeArti.Text := '';
   pnlDetalleA.Left := 181;
   pnlDetalleA.Top := 284;
   pnlDetalleA.BringToFront;
   pnlDetalleA.Visible := True; // Activar el panel de Mantenimiento
   pgArti.Enabled := False;
   btnDetalle;
End;

Procedure TFRegArti.CargaUsuario;
Begin
   DMLOG.cdsArti.FieldByName('CCUSER').AsString := DMLOG.wUsuario;
   DMLOG.cdsarti.FieldByName('CCFREG').AsDateTime := Now;
   DMLOG.cdsArti.FieldByName('CCHREG').AsDateTime := Now;
End;

Procedure TFRegArti.CancelaNuevo;
Begin
   If (DMLOG.cdsArti.Modified) Or (DMLOG.cdsArti.ChangeCount > 0) Then
      DMLOG.cdsArti.CancelUpdates;

   If (DMLOG.cdsEArti.Modified) Or (DMLOG.cdsEArti.ChangeCount > 0) Then
      DMLOG.cdsEArti.CancelUpdates;

   If (DMLOG.cdsQArti.Modified) Or (DMLOG.cdsQArti.ChangeCount > 0) Then
      DMLOG.cdsQArti.CancelUpdates;
End;

Procedure TFRegArti.dblcCIAExit(Sender: TObject);
Var
   sSQL: String;
Begin
   dbeCia.text := DMLOG.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCIA.text), 'CIADES');
   If length(dbeCia.text) = 0 Then
   Begin
      ShowMessage('Registre Código de Compañía');
      dblcCia.SetFocus;
      exit;
   End;
   sSQL := 'SELECT * FROM TGE152 WHERE CIAID=' + QuotedStr(dblcCia.text);
   DMLOG.cdsTINID.Close;
   DMLOG.cdsTINID.DataRequest(sSQL);
   DMLOG.cdsTINID.Open;

   If DMLOG.wModo = 'A' Then
   Begin
      If DMLOG.wAnchoArt > 0 Then
         DMLOG.cdsArti.fieldbyname('ARTID').AsString := DMLOG.StrZero(DMLOG.MaxArt(dblcCIA.Text), DMLOG.wAnchoArt);
   End;
End;

Procedure TFRegArti.dblcFABExit(Sender: TObject);
Begin
   dbeFab.text := DMLOG.DisplayDescrip('prvTGE', 'TGE150', 'FABDES', 'FABID=' + quotedstr(dblcFAB.text), 'FABDES');
End;

Procedure TFRegArti.dblcUMedGExit(Sender: TObject);
Begin
   dbeUMedG.text := DMLOG.DisplayDescrip('prvTGE', 'TGE130', 'UNMDES', 'UNMID=' + quotedstr(dblcUMedG.text), 'UNMDES');
   If DMLOG.wModo = 'M' Then
      If length(dbeUMedG.text) = 0 Then
      Begin
         ShowMessage('Registre Unidad de Medida');
         dblcUMedG.SetFocus;
         exit;
      End;
End;

Procedure TFRegArti.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFRegArti.dblcFAMExit(Sender: TObject);
Begin
   If (dblcGrpArti.text = '') Then
   Begin
      DMLOG.cdsFAM.Close;
      ErrorMsg('Error', 'Debe de Escoger un Grupo o Línea');
      dblcGrpArti.SetFocus;
      exit;
   End;

   If dblcFAM.Text <> '' Then
   Begin
      sSQL := 'GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text);
      dbeFAM.text := DMLOG.DisplayDescrip('prvTGE', 'TGE169', 'FAMDES', sSQL, 'FAMDES');
      If length(Trim(DMLOG.DisplayDescrip('prvTGE', 'TGE169', 'CUENTAID', sSQL, 'CUENTAID'))) > 0 Then
         dbeCtaCon.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE169', 'CUENTAID', sSQL, 'CUENTAID'); //DMLOG.cdsFAM.fieldbyname('CUENTAID').AsString;
   // Sub-Familias
      sSQL := 'select * from TGE170 '
         + 'where CIAID=' + quotedstr(dblcCia.text)
         + '  and TINID=' + quotedstr(dblcTINID.text)
         + '  and GRARID=' + quotedstr(dblcGrpArti.text)
         + '  and FAMID=' + quotedstr(dblcGrpArti.text);
      DMLOG.cdsSUBFAM.Close;
      DMLOG.cdsSUBFAM.DataRequest(sSQL);
      DMLOG.cdsSUBFAM.Open;
      DMLOG.cdsSUBFAM.IndexFieldNames := 'SFAMID';
      dblcSUBFAM.LookupTable := DMLOG.cdsSUBFAM;
      dblcSUBFAM.LookupField := 'SFAMID';
   End;
End;

Procedure TFRegArti.dblcSUBFAMExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If (dblcGrpArti.text = '') Then
   Begin
      DMLOG.cdsSUBFAM.Close;
      ErrorMsg('Error', 'Debe de Escoger un Grupo o Linea ');
      exit;
   End;

   If (dblcFAM.text = '') Then
   Begin
      If wUrqCia = 'S' Then
      Begin
         DMLOG.cdsSUBFAM.Close;
         ErrorMsg('Error', 'Debe de Escoger un Familia');
         exit;
      End;
   End;

   sSQL := 'GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text) + ' AND SFAMID=' + quotedstr(dblcSUBFAM.text);
   dbeSFAM.text := DMLOG.DisplayDescrip('prvTGE', 'TGE170', 'SFAMDES', sSQL, 'SFAMDES');
   If length(Trim(DMLOG.DisplayDescrip('prvTGE', 'TGE170', 'CUENTAID', sSQL, 'CUENTAID'))) > 0 Then
      dbeCtaCon.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE170', 'CUENTAID', sSQL, 'CUENTAID');
End;

Procedure TFRegArti.dblcUMedUExit(Sender: TObject);
Begin
   dbeUMedU.text := DMLOG.DisplayDescrip('prvTGE', 'TGE130', 'UNMDES', 'UNMID=' + quotedstr(dblcUMedU.text), 'UNMDES');
End;

Procedure TFRegArti.dblcTMonedaExit(Sender: TObject);
Begin
   dbeTMoneda.text := DMLOG.DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', 'TMONID=' + quotedStr(dblcTMoneda.text), 'TMONDES');
End;

Procedure TFRegArti.dblcTINIDEnter(Sender: TObject);
Begin
   xTinven := dblcTINID.text;
End;

Procedure TFRegArti.CapturarValores;
Begin
   wTINID := DMLOG.cdsArti.FieldByName('TINID').Asstring;
   wGRARID := DMLOG.cdsArti.FieldByName('GRARID').Asstring;
   wFAMID := DMLOG.cdsArti.FieldByName('FAMID').Asstring;
   wSFAMID := DMLOG.cdsArti.FieldByName('SFAMID').Asstring;
   wARTCONT := DMLOG.cdsArti.FieldByName('ARTCONT').AsFloat;
   wUNMIDG := DMLOG.cdsArti.FieldByName('UNMIDG').Asstring;
   wUNMIDU := DMLOG.cdsArti.FieldByName('UNMIDU').Asstring;
   wTMONID := DMLOG.cdsArti.FieldByName('TMONID').Asstring;
   wARTSPRO := DMLOG.cdsArti.FieldByName('ARTSPRO').Asstring;
End;

Function TFRegArti.VerificaCambios: boolean;
Begin
   If (DMLOG.cdsArti.FieldByName('TINID').Asstring <> wTINID) Or
      (DMLOG.cdsArti.FieldByName('GRARID').Asstring <> wGRARID) Or
      (DMLOG.cdsArti.FieldByName('ARTCONT').AsFloat <> wARTCONT) Or
      (DMLOG.cdsArti.FieldByName('UNMIDG').Asstring <> wUNMIDG) Or
      (DMLOG.cdsArti.FieldByName('UNMIDU').Asstring <> wUNMIDU) Or
      (DMLOG.cdsArti.FieldByName('TMONID').Asstring <> wTMONID) Or
      (DMLOG.cdsArti.FieldByName('ARTSPRO').Asstring <> wARTSPRO) Then
   Begin
      result := True;
   End
   Else
   Begin
      result := False;
   End;
End;

Procedure TFRegArti.dbgEQKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (Key = $4D) And (ssCtrl In Shift) Then
   Begin
      dbgDArtiDblClick(Nil);
   End;

   If (Key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If pgArti.ActivePage = tsComponent Then
         If DMLOG.cdsEArti.RecordCount > 0 Then DMLOG.cdsEArti.Delete;

      If pgArti.ActivePage = tsEquals Then
         If DMLOG.cdsQArti.RecordCount > 0 Then DMLOG.cdsQArti.Delete;
   End;
   btnDetalle;
End;

Procedure TFRegArti.dbeSMaxGExit(Sender: TObject);
Begin
   DMLOG.cdsArti.Edit;
   If Length(Trim(dbeSMinG.Text)) = 0 Then
      DMLOG.cdsArti.FieldByName('STKSMIN').AsFloat := 0;

   If Length(Trim(dbeSMaxG.Text)) = 0 Then
      DMLOG.cdsArti.FieldByName('STKSMAX').AsFloat := 0;

   If StrToFloat(StringReplace(dbeSMaxG.Text, ',', '', [rfReplaceAll])) < 0 Then
   Begin
      ErrorMsg('Adquisiciones', 'Cantidad no Puede Ser Negativa');
      dbeSMaxG.SetFocus;
      Exit;
   End;

   If StrToFloat(StringReplace(dbeSMaxG.Text, ',', '', [rfReplaceAll])) < StrToFloat(StringReplace(dbeSMinG.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg('Adquisiciones', 'Stock Maximo no Puede ser Menor al Stock Minimo');
      dbeSMaxG.SetFocus;
      Exit;
   End;
End;

Procedure TFRegArti.dbeSMinGExit(Sender: TObject);
Begin
   If Length(Trim(dbeSMinG.Text)) = 0 Then
      DMLOG.cdsArti.FieldByName('STKSMIN').AsFloat := 0;

   If StrToFloat(StringReplace(dbeSMinG.Text, ',', '', [rfReplaceAll])) < 0 Then
   Begin
      ErrorMsg('Adquisiciones', 'Cantidad no Puede Ser Negativa');
      dbeSMinG.SetFocus;
      Exit;
   End;

   If StrToFloat(StringReplace(dbeSMinG.Text, ',', '', [rfReplaceAll])) > StrToFloat(StringReplace(dbeSMaxG.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg('Adquisiciones', 'Stock Minimo no Puede ser Mayor al Stock Maximo');
      dbeSMinG.SetFocus;
      Exit;
   End;
End;

Procedure TFRegArti.dbeSRepGExit(Sender: TObject);
Begin
   If Length(Trim(dbeSRepG.Text)) = 0 Then
      DMLOG.cdsArti.FieldByName('STKSPRE').AsFloat := 0;

   If StrToFloat(StringReplace(dbeSRepG.Text, ',', '', [rfReplaceAll])) < 0 Then
   Begin
      ErrorMsg('Adquisiciones', 'Cantidad no Puede Ser Negativa');
      dbeSRepG.SetFocus;
      Exit;
   End;

   If (strtofloat(StringReplace(dbeSRepG.Text, ',', '', [rfReplaceAll])) >= strtofloat(StringReplace(dbeSMinG.Text, ',', '', [rfReplaceAll]))) And
      (strtofloat(StringReplace(dbeSRepG.Text, ',', '', [rfReplaceAll])) <= strtofloat(StringReplace(dbeSMaxG.Text, ',', '', [rfReplaceAll]))) Then
   Begin
   End
   Else
   Begin
      ErrorMsg('Adquisiciones', 'El Punto de Reposición no puede ser Mayor a la Cant. Max. y Menor a la Cant. Min. ');
      dbeSRepG.SetFocus;
   End
End;

Procedure TFRegArti.dbeSCRepExit(Sender: TObject);
Var
   xCant: Double;
Begin
   If Length(Trim(dbeSCRep.Text)) = 0 Then
      DMLOG.cdsArti.FieldByName('STKSCPE').AsFloat := 0;

   If StrToFloat(StringReplace(dbeSCRep.Text, ',', '', [rfReplaceAll])) < 0 Then
   Begin
      ErrorMsg('Adquisiciones', 'Cantidad no Puede Ser Negativa');
      dbeSCRep.SetFocus;
      Exit;
   End;

   If StrToFloat(StringReplace(dbeSCRep.Text, ',', '', [rfReplaceAll])) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', 'Cantidad debe ser Mayor a Cero');
      dbeSCRep.SetFocus;
      Exit;
   End;

   xCant := StrToFloat(StringReplace(dbeSMaxG.Text, ',', '', [rfReplaceAll])) - StrToFloat(StringReplace(dbeSMinG.Text, ',', '', [rfReplaceAll]));

   If xCant < StrToFloat(StringReplace(dbeSCRep.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ErrorMsg('Adquisiciones', 'La Cantidad a Reponer no Puede ser Mayor a ' + FloattoStr(xCant));
      dbeSCRep.SetFocus;
      Exit;
   End;

End;

Procedure TFRegArti.dbeCExisExit(Sender: TObject);
Begin
   If Length(Trim(dbeCExis.Text)) = 0 Then
      DMLOG.cdsArti.FieldByName('ARTCVIDA').AsFloat := 0;

   If StrToFloat(dbeCExis.Text) < 0 Then
   Begin
      ErrorMsg('Adquisiciones', 'Cantidad no Puede Ser Negativa');
      dbeCExis.SetFocus;
      Exit;
   End;
End;

Procedure TFRegArti.dblcGrpArtiEnter(Sender: TObject);
Begin
   sSQL := 'SELECT * FROM TGE131 WHERE ' +
      'CIAID=' + quotedstr(dblcCIA.text) + ' ' +
      'AND TINID =' + quotedstr(dblcTINID.text) + ' ' +
      'ORDER BY CIAID, TINID, GRARID';
   DMLOG.cdsGArti.Close;
   DMLOG.cdsGArti.DataRequest(sSQL);
   DMLOG.cdsGArti.Open;
End;

Procedure TFRegArti.dblcFAMEnter(Sender: TObject);
Begin
   sSQL := 'SELECT * FROM TGE169 WHERE ' +
      'CIAID=' + quotedstr(dblcCIA.text) + ' ' +
      'AND TINID=' + quotedstr(dblcTINID.text) + ' ' +
      'AND GRARID=' + QuotedStr(dblcGrpArti.text);
   DMLOG.cdsFAM.Close;
   DMLOG.cdsFAM.DataRequest(sSQL);
   DMLOG.cdsFAM.Open;
End;

Procedure TFRegArti.dblcSUBFAMEnter(Sender: TObject);
Begin
   sSQL := 'SELECT * FROM TGE170 WHERE ' +
      ' CIAID=' + QuotedStr(dblcCIA.text) +
      ' AND GRARID=' + QuotedStr(dblcGrpArti.text) +
      ' AND TINID=' + QuotedStr(dblcTINID.text) +
      ' AND FAMID=' + QuotedStr(dblcFAM.text);
   DMLOG.cdsSUBFAM.Close;
   DMLOG.cdsSUBFAM.DataRequest(sSQL);
   DMLOG.cdsSUBFAM.Open;
End;

Procedure TFRegArti.FormCreate(Sender: TObject);
Begin

// Compañía
   DMLOG.FiltraTabla(DMLOG.cdsCIA, 'TGE101', 'CIAID', 'CIAID');
   dblcCIA.LookupTable := DMLOG.cdsCIA;
   dblcCIA.LookupField := 'CIAID';

// Unidades de Medida
   DMLOG.FiltraTabla(DMLOG.cdsUMed, 'TGE130', 'UNMID', 'UNMID');
   dblcUMedG.LookupTable := DMLOG.cdsUMed;
   dblcUMedG.LookupField := 'UNMID';
   dblcUMedU.LookupTable := DMLOG.cdsUMed;
   dblcUMedU.LookupField := 'UNMID';

// Moneda
   DMLOG.FiltraTabla(DMLOG.cdsTMoneda, 'TGE103', 'TMONID', 'TMONID');
   dblcTMoneda.LookupTable := DMLOG.cdsTMoneda;
   dblcTMoneda.LookupField := 'TMONID';

// Fabricantes
   DMLOG.FiltraTabla(DMLOG.cdsFAB, 'TGE150', 'FABID', 'FABID');
   dblcFAB.LookupTable := DMLOG.cdsFAB;
   dblcFAB.LookupField := 'FABID';

   DMLOG.cdsSobrino.Close;
   DMLOG.cdsSobrino.DataRequest('SELECT ARTID, ARTDES, ARTPCG FROM TGE205');
   DMLOG.cdsSobrino.FetchOnDemand := False;
   DMLOG.cdsSobrino.PacketRecords := 20;
   DMLOG.cdsSobrino.FetchOnDemand := True;
   DMLOG.cdsSobrino.IndexFieldNames := 'ARTID';
   DMLOG.cdsSobrino.Open;

   DMLOG.cdsArti.FetchOnDemand := False;
   DMLOG.cdsArti.PacketRecords := -1;
   DMLOG.cdsArti.FetchOnDemand := True;
   DMLOG.cdsArti.Open;
   DMLOG.cdsClnArti.CloneCursor(DMLOG.cdsArti, True);

   DMLOG.cdsKDXTemp.Close;
   DMLOG.cdsKDXTemp.DataRequest('select CIAID, TINID, ARTID, ARTDES, ARTABR from TGE205');
   DMLOG.cdsKDXTemp.Open;
   dbcldArti.LookupTable := DMLOG.cdsKDXTemp;
   dbcldArti.LookupField := 'ARTID';

End;

Procedure TFRegArti.FormShow(Sender: TObject);
Var
   sSQL: String;
   Ano, Mes, Dia: Integer;
Begin
   DMLOG.AccesosUsuarios(DMLOG.wModulo, DMLOG.wUsuario, '2', Screen.ActiveForm.Name);
   xcrea := True;
   xcrea := false;
   xDesArt := '';
   xIdFam := '';
   xIdSfam := '';

   edtNow.Text := DatetoStr(Now);
   If DMLOG.cdsArti.FieldByName('ARTFUMV').AsDateTime > 0 Then
   Begin
      DMLOG.Tiempo(DMLOG.cdsArti.FieldByName('ARTFUMV').AsDateTime, Now, Ano, Mes, Dia);
      edtDiasSMov.Text := InttoStr(Ano) + ' Años ' + InttoStr(Mes) + ' Meses ' + InttoStr(Dia) + ' Dias';
   End
   Else
      edtDiasSMov.Text := ' Sin Movimiento ';

   If DMLOG.wModo = 'M' Then
      CapturarValores;

   OnOffCabecera(True);
   OnOffDetalle(False);
   pgArti.ActivePage := tsGeneral;

   If DMLOG.wModo = 'A' Then
      Z2bbtnNuevo.Click;

   If DMLOG.wModo = 'M' Then
   Begin
      DMLOG.cdsArti.Edit;
      xDesArt := Trim(DMLOG.cdsArti.FieldByName('ARTDES').AsString);
      xIdFam := Trim(DMLOG.cdsArti.FieldByName('FAMID').AsString);
      xIdSfam := Trim(DMLOG.cdsArti.FieldByName('SFAMID').AsString);
      dblcCiaExit(Nil);
      dbeTINID.text := DMLOG.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', 'TINID=' + quotedstr(dblcTINID.text), 'TINDES');
      sSQL := 'GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + '''';
      dbeGrpArti.text := DMLOG.DisplayDescrip('prvTGE', 'TGE131', 'GRARDES', sSQL, 'GRARDES');
      sSQL := 'GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text);
      dbeFAM.text := DMLOG.DisplayDescrip('prvTGE', 'TGE169', 'FAMDES', sSQL, 'FAMDES');
      sSQL := 'GRARID=' + quotedstr(dblcGrpArti.text) + ' AND TINID =''' + dblcTINID.text + ''' AND FAMID=' + quotedstr(dblcFAM.text) + ' AND SFAMID=' + quotedstr(dblcSUBFAM.text);
      dbeSFAM.text := DMLOG.DisplayDescrip('prvTGE', 'TGE170', 'SFAMDES', sSQL, 'SFAMDES');

      dblcFABExit(Nil);
      dblcUMedGExit(Nil);
      dblcUMedUExit(Nil);
      dblcTMonedaExit(Nil);
      dblcCIA.Enabled := false;
      dbeCodArti.Enabled := False;
      OnOffCabecera(True);
      dbeDsc.SetFocus;
   End;
End;

End.


Unit LOG261;

// Actualizaciones
// HPC_201405_LOG          : 14/10/2014 Se lleva Lista de Precios de Adquisiciones Ventas a Adquisiciones SSGG
//                           14/10/2014 Reordenamiento de Sangría

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, wwdblook, ExtCtrls, Buttons, Mant, db, oaVariables, msgdlgs;

Type
   TFLisPre1 = Class(TForm)
      pnl1: TPanel;
      Label14: TLabel;
      Label1: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      dblcLPrecio: TwwDBLookupCombo;
      edtLPrecio: TEdit;
      Z2bbtnAcepta: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      Label2: TLabel;
      dblcLPrecio1: TwwDBLookupCombo;
      edtLPrecio1: TEdit;
      Procedure Z2bbtnAceptaClick(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcLPrecioExit(Sender: TObject);
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcLPrecio1Exit(Sender: TObject);
      Procedure NotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure FormShow(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
  { Private declarations }
      Procedure PegaPnlToolLPrecio(Sender: TObject);
   Public
  { Public declarations }
      Procedure LPrecioInsert(Sender: TObject);
      Procedure LPrecioEdita(Sender: TObject; MantFields: TFields);
      Procedure LPrecioDelete(Sender: TObject; MantFields: TFields);
   End;

Var
   FLisPre1: TFLisPre1;
   wCia, wLPe, exCia, sSQL: String;

Implementation

Uses LOGDM1, oaAD1000, LOG600, LOG262; // MsgDlgs,
// LOG262  Forma de Lista de Precios

{$R *.DFM}

Procedure TFLisPre1.Z2bbtnAceptaClick(Sender: TObject);
Var
   xSQL, XfILTRO: String;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      Information('Módulo de Compras', 'Compañia no Valida');
      Exit;
   End;

   If Length(Trim(edtLPrecio.Text)) = 0 Then
   Begin
      Information('Módulo de Compras', 'Lista de Precio Origen no Valida  ');
      Exit;
   End;

   If Length(Trim(edtLPrecio1.Text)) = 0 Then
   Begin
      Information('Módulo de Compras', 'Lista de Precio Destino no Valida');
      Exit;
   End;

   If Question('Confirmar', '¿Está seguro de Generar o Regenerar la Lista de Precios Destino? ') Then
   Begin
      sSQL := 'Delete from FAC201 where CIAID=' + QuotedStr(dblcCia.text) + ' and TLISTAID=' + QuotedStr(dblcLPrecio1.text);
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except

      End;
      sSQL := 'INSERT INTO FAC201(CIAID,LOCID,TINID,ALMID,TLISTAID,ARTID,ARTCONT,GRARID,FAMID,SFAMID,UNMIDG, '
         + '                      UNMIDU,UNMABR,LPRETMONID,LPRETCAM,LPREFINI,LPREVIG,LPREBASGMO,LPREBASGMN, '
         + '                      LPREBASGME,LPREBASUMO,LPREBASUMN,LPREBASUME,LPREPINCG,LPREPINCU,LPREVOLMG, '
         + '                      LPREVOLMU,LPREPDCTOG,LPREPDCTOU,LPREPREGMO,LPREPREGMN,LPREPREGME,LPREPREUMO, '
         + '                      LPREPREUMN,LPREPREUME,LPREDCTO2G,LPREDCTO3G,LPREDCTO4G,LPREDCTO2U,LPREDCTO3U, '
         + '                      LPREDCTO4U,CANTMING,CANTMINU,LPREIGV,LPREISC,LPREFLAGD,LPREFREG,LPREHREG, '
         + '                      LPREUSER,ARTDES,PREVEN,PREVENPRO,ACTIVO) '
         + ' SELECT CIAID,LOCID,TINID,ALMID,' + QuotedStr(dblcLPrecio1.text) + ' TLISTAID,ARTID,ARTCONT,GRARID,FAMID,SFAMID,UNMIDG, '
         + '        UNMIDU,UNMABR,LPRETMONID,LPRETCAM,LPREFINI,LPREVIG,LPREBASGMO,LPREBASGMN, '
         + '        LPREBASGME,LPREBASUMO,LPREBASUMN,LPREBASUME,LPREPINCG,LPREPINCU,LPREVOLMG, '
         + '        LPREVOLMU,LPREPDCTOG,LPREPDCTOU,LPREPREGMO,LPREPREGMN,LPREPREGME,LPREPREUMO, '
         + '        LPREPREUMN,LPREPREUME,LPREDCTO2G,LPREDCTO3G,LPREDCTO4G,LPREDCTO2U,LPREDCTO3U, '
         + '        LPREDCTO4U,CANTMING,CANTMINU,LPREIGV,LPREISC,LPREFLAGD,' + DMLOG.wRepFecServi + ' LPREFREG, '
         +          DMLOG.wRepHorServi + ' LPREHREG, ' + QuotedStr(DMLOG.wUsuario) + ' LPREUSER, ARTDES, '
         + '        PREVEN, PREVENPRO, ACTIVO '
         + '   FROM FAC201 '
         + '  WHERE CIAID=' + QuotedStr(dblcCia.text) + ' AND TLISTAID=' + QuotedStr(dblcLPrecio.text);
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
      ShowMessage('Se realizó el Proceso');
      Close;
   End;
End;

Procedure TFLisPre1.PegaPnlToolLPrecio(Sender: TObject);
Var
   pg: TPanel;
   pl: TPanel;
Begin
   pg := FToolLPrecio.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pl.AutoSize := True;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pg.Align := alClient;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFLisPre1.LPrecioEdita(Sender: TObject; MantFields: TFields);
Begin
//   DMLOG.wModo := 'M';
//   FLPrecio.ShowModal;
End;

Procedure TFLisPre1.LPrecioInsert(Sender: TObject);
Begin
//   DMLOG.wModo := 'A';
//   FLPrecio.ShowModal;
End;

Procedure TFLisPre1.LPrecioDelete(Sender: TObject; MantFields: TFields);
Begin
{
   sSQL := 'CIAID=''' + DMLOG.cdsLPrecio.FieldByName('CIAID').AsString + ''' ' +
      'AND ARTID=''' + DMLOG.cdsLPrecio.FieldByName('ARTID').AsString + '''';

 //--------------------------------------- Facturación ----------------------------------------------
   DMLOG.DisplayDescrip('prvTGE', 'FAC306', 'ARTID', sSQL, 'ARTID');

   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      Information('Adquisiciones', ' Este Articulo Tiene Movimiento en la Facturación');
      Exit;
   End;

 //--------------------------------------- Proforma de Venta  ---------------------------------------
   DMLOG.DisplayDescrip('prvTGE', 'FAC312', 'ARTID', sSQL, 'ARTID');

   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      Information('Adquisiciones', ' Este Articulo Tiene Movimiento en la Proforma de Venta');
      Exit;
   End;

   If Question('Confirmar', '¿Está Seguro de Eliminar El Artículo ' + #13 + #13 +
      DMLOG.cdsLPrecio.FieldByName('ARTID').AsString + '  -  ' +
      DMLOG.cdsLPrecio.FieldByName('ARTDES').AsString + '?') Then
   Begin
      Screen.Cursor := crHourGlass;
      xBorrar := '1';
      DMLOG.cdsLPrecio.Delete;
      DMLOG.ControlTran(9, DMLOG.cdsLPrecio, 'LPRECIO');
      xBorrar := '0';
      Screen.Cursor := crDefault;
   End;
 }
End;

Procedure TFLisPre1.dblcCiaExit(Sender: TObject);
Begin
   If Z2bbtnCanc2.Focused Then Exit;
   If exCia = dblcCia.Text Then Exit;
   edtCia.Text := DMLOG.DisplayDescrip('PRVSQL', 'TGE101', 'CIADES', 'CIAID=''' + dblcCia.Text + '''', 'CIADES');
   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Compañía no Existe');
      dblcCia.Text := '';
   End;
   DMLOG.cdsTLista.Close;
   DMLOG.cdsTLista.DataRequest('SELECT * FROM FAC101 WHERE CIAID=' + quotedStr(dblcCia.Text));
   DMLOG.cdsTLista.Open;

   DMLOG.cdsQry3.Close;
   DMLOG.cdsQry3.DataRequest('SELECT * FROM FAC101 WHERE CIAID=' + quotedStr(dblcCia.Text));
   DMLOG.cdsQry3.Open;

   edtLPrecio.text := '';
   exCia := dblcCia.Text;
End;

Procedure TFLisPre1.dblcLPrecioExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Z2bbtnCanc2.Focused Or dblcCia.Focused Then Exit;
   If DMLOG.cdsTLista.RecordCount = 0 Then Exit;
   If length(dblcLPrecio.text) = 0 Then
      Raise exception.create('Seleccione una Lista de Precios');

   xWhere := 'TLISTAID=' + quotedstr(dblcLPrecio.Text) + ' AND CIAID=' + QuotedStr(dblcCia.Text);
   edtLPrecio.Text := DMLOG.Buscaqry('dspUltTGE', 'FAC101', 'TLISTADES', xWhere, 'TLISTADES');
   DMLOG.cdsQry3.Filter := 'TLISTAID<>' + QuotedStr(dblcLPrecio.text);
   DMLOG.cdsQry3.Filtered := True;

End;

Procedure TFLisPre1.Z2bbtnCanc2Click(Sender: TObject);
Begin
   DMLOG.cdsQry3.Filter := '';
   DMLOG.cdsQry3.Filtered := False;
   Close;
End;

Procedure TFLisPre1.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFLisPre1.dblcLPrecio1Exit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Z2bbtnCanc2.Focused Or dblcCia.Focused Then Exit;
   If DMLOG.cdsQry3.RecordCount = 0 Then Exit;
   If length(dblcLPrecio1.text) = 0 Then
      Raise exception.create('Seleccione una Lista de Precios');

   xWhere := 'TLISTAID=' + quotedstr(dblcLPrecio1.Text) + ' AND CIAID=' + QuotedStr(dblcCia.Text);
   edtLPrecio1.Text := DMLOG.Buscaqry('dspUltTGE', 'FAC101', 'TLISTADES', xWhere, 'TLISTADES');

End;

Procedure TFLisPre1.NotInList(Sender: TObject; LookupTable: TDataSet;
   NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFLisPre1.FormShow(Sender: TObject);
Begin
   DMLOG.AccesosUsuarios(DMLOG.wModulo, DMLOG.wUsuario, '2', Screen.ActiveForm.Name);
   edtCia.Text := '';
   edtLPrecio.Text := '';
   exCia := '';

   dblcCia.LookUpField := '';
   dblcCia.LookUpTable := DMLOG.cdsCIA;
   dblcCia.LookUpField := 'CIAID';

   dblcLPrecio.LookUpField := '';
   dblcLPrecio.LookUpTable := DMLOG.cdsTLista;
   dblcLPrecio.LookUpField := 'TLISTAID';

   dblcLPrecio1.LookUpField := '';
   dblcLPrecio1.LookUpTable := DMLOG.cdsQry3;
   dblcLPrecio1.LookUpField := 'TLISTAID';
End;

Procedure TFLisPre1.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin

   FVariables.w_AD_Registro := False;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;

   Action := CAFree;
End;

End.


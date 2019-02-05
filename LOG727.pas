Unit LOG727;
//*********************************************************
// CREADO POR            : Abelardo Sulca Palomino
// Nº HPP                : HPP_201105_LOG
// FECHA DE CREACION     : 22/06/2011
// DESCRIPCION           : En esta ventana se visualiza los pagos que se han
//                         realizado a los documentos provisionados
//*********************************************************
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, DBCtrls, wwdbdatetimepicker, Wwdbdlg, Mask, wwdbedit,
   wwdblook, Buttons, Wwdbigrd, Grids, Wwdbgrid;

Type
   TFPagosDocumentos = Class(TForm)
      dbgDetallePagos: TwwDBGrid;
      btnAdiccionaDocumento: TwwIButton;
      dblcDocumento: TwwDBLookupCombo;
      dblcDocumento_des: TwwDBEdit;
      dbeSerie: TwwDBEdit;
      dbeNumero: TwwDBEdit;
      Label9: TLabel;
      Label8: TLabel;
      Label5: TLabel;
      dblcdProveedor: TwwDBLookupComboDlg;
      dblcdProveedor_des: TwwDBEdit;
      lblProv: TLabel;
      dblcmoneda: TwwDBLookupCombo;
      dblcmoneda_des: TwwDBEdit;
      Label11: TLabel;
      Label10: TLabel;
      dbdtpEmision: TwwDBDateTimePicker;
      dbeTotal: TwwDBEdit;
      Label2: TLabel;
      dblcCompania: TwwDBLookupCombo;
      dblcCompania_des: TwwDBEdit;
      Label4: TLabel;
      dbePagado: TwwDBEdit;
      Label1: TLabel;
      dbeSaldo: TwwDBEdit;
      Label3: TLabel;
      lbl_EstadoOP: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Label12: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      Label15: TLabel;
      Procedure FormShow(Sender: TObject);
      Procedure dblcCompaniaExit(Sender: TObject);
      Procedure dblcdProveedorExit(Sender: TObject);
      Procedure dblcDocumentoExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcmonedaExit(Sender: TObject);
   Private
    { Private declarations }
      Procedure Asignalookup;
      Procedure RecuperaDocumento(ps_compania, ps_proveedor, ps_documento, ps_serie, ps_numero: String);
      Procedure AsignaDataSource;
      Procedure RecuperaPagos;
   Public
    { Public declarations }
      xs_compania, xs_proveedor, xs_documento, xs_serie, xs_numero: String;
   End;

Var
   FPagosDocumentos: TFPagosDocumentos;

Implementation
Uses oaAD3100, LOGDM1;
{$R *.dfm}

Procedure TFPagosDocumentos.FormShow(Sender: TObject);
Var
   ls_compania, ls_proveedor, ls_documento, ls_serie, ls_numero: String;
Begin
     (*ls_compania := Mtx3100.FMant.cds2.FieldbyName('CPCIAID').AsString ;
     ls_proveedor := Mtx3100.FMant.cds2.FieldbyName('PROV').AsString ;
     ls_documento := Mtx3100.FMant.cds2.FieldbyName('DOCID').AsString ;
     ls_serie := Mtx3100.FMant.cds2.FieldbyName('CPSERIE').AsString ;
     ls_numero := Mtx3100.FMant.cds2.FieldbyName('CPNODOC').AsString ; *)

   AsignaLookup;
   AsignaDataSource;
     //RecuperaDocumento(ls_compania, ls_proveedor, ls_documento, ls_serie, ls_numero);
   RecuperaDocumento(xs_compania, xs_proveedor, xs_documento, xs_serie, xs_numero);
   RecuperaPagos;

End;

Procedure TFPagosDocumentos.AsignaDataSource;
Begin

   dblcCompania.DataField := 'CPCIAID';
   dblcCompania.DataSource := DMLOG.dsQry5;
   dblcdProveedor.DataField := 'PROV';
   dblcdProveedor.DataSource := DMLOG.dsQry5;
   dblcDocumento.DataField := 'DOCID';
   dblcDocumento.DataSource := DMLOG.dsQry5;
   dbeSerie.DataField := 'CPSERIE';
   dbeSerie.DataSource := DMLOG.dsQry5;
   dbeNumero.DataField := 'CPNODOC';
   dbeNumero.DataSource := DMLOG.dsQry5;
   dblcmoneda.DataField := 'TMONID';
   dblcmoneda.DataSource := DMLOG.dsQry5;
   //DBMemo_observacion.DataField := 'CPOBS';
   //DBMemo_observacion.DataSource := DMLOG.dsQry5;
   dbdtpEmision.DataField := 'CPFEMIS';
   dbdtpEmision.DataSource := DMLOG.dsQry5;
   //dbdtpRecepcion.DataField := 'CPFRECEP';
   //dbdtpRecepcion.DataSource := DMLOG.dsQry5;
   dbeTotal.DataField := 'TOTAL';
   dbeTotal.DataSource := DMLOG.dsQry5;

   dbePagado.DataField := 'CPPAGORI';
   dbePagado.DataSource := DMLOG.dsQry5;
   dbeSaldo.DataField := 'CPSALORI';
   dbeSaldo.DataSource := DMLOG.dsQry5;

   dbgDetallePagos.DataSource := DMLOG.dsQry11;

End;

Procedure TFPagosDocumentos.AsignaLookup;
Begin
  //Compañia
   dblcCompania.Selected.Clear;
   dblcCompania.Selected.Add('CIAID'#9'2'#9'CIA'#9'F');
   dblcCompania.Selected.Add('CIADES'#9'25'#9'Descripci'#243'n'#9'F');
   dblcCompania.LookupField := 'CIAID';
   dblcCompania.LookupTable := DMLOG.cdsCIA;
   //Proveedor
   If DMLOG.cdsProv.Active = False Then
      DMLOG.FiltraTabla(DMLOG.cdsProv, 'TGE201', 'PROV', 'PROV');
   dblcdProveedor.Selected.Clear;
   dblcdProveedor.Selected.Add('PROV'#9'8'#9'Prov'#9'F');
   dblcdProveedor.Selected.Add('PROVDES'#9'50'#9'Descripci'#243'n'#9'F');
   dblcdProveedor.LookupField := 'PROV';
   dblcdProveedor.LookupTable := DMLOG.cdsProv;

   DMLOG.FiltraTabla(DMLOG.cdsTDoc, 'TGE110', 'DOCID', 'DOCID', 'DOCMOD = ' + QuotedStr('CXP'));
   dblcDocumento.Selected.Clear;
   dblcDocumento.Selected.Add('DOCID'#9'2'#9'ID'#9'F');
   dblcDocumento.Selected.Add('DOCDES'#9'25'#9'Documento'#9'F');
   dblcDocumento.LookupTable := DMLOG.cdsTDoc;
   dblcDocumento.LookupField := 'DOCID';

   //Detalle de pagos
   //Detalle de Orden de Pago
   dbgDetallePagos.Selected.Clear;
   dbgDetallePagos.Selected.Add('TIPO_PAGO'#9'20'#9'Forma~de Pago'#9'F');
   dbgDetallePagos.Selected.Add('NUMERO'#9'7'#9'Número'#9'F');
   dbgDetallePagos.Selected.Add('MONEDA'#9'3'#9'M'#9'F');
   dbgDetallePagos.Selected.Add('BANCO'#9'6'#9'Código~Banco'#9'F');
   dbgDetallePagos.Selected.Add('BANCO_DES'#9'15'#9'Banco'#9'F');
   dbgDetallePagos.Selected.Add('MONTO'#9'8'#9'Monto'#9'F');
   dbgDetallePagos.Selected.Add('FECHA_EMISION'#9'9'#9'Fecha~Emisión'#9'F');
   dbgDetallePagos.Selected.Add('FECHA_PAGO'#9'9'#9'Fecha~Pago'#9'F');
   //dbgDetallePagos.Selected.Add('CHEQUE_EMITIDO'#9'3'#9'Cheq~Emi?'#9'F');

End;

Procedure TFPagosDocumentos.RecuperaDocumento(ps_compania, ps_proveedor, ps_documento, ps_serie, ps_numero: String);
Begin

   xSQL := 'SELECT LOG130.*, CXP301.CPPAGORI, CXP301.CPSALORI ' +
      ' FROM LOG130, CXP301 ' +
      ' WHERE LOG130.CPCIAID = CXP301.CIAID(+) ' +
      ' AND LOG130.PROV = CXP301.PROV(+) ' +
      ' AND LOG130.DOCID = CXP301.DOCID(+) ' +
      ' AND LOG130.CPSERIE = CXP301.CPSERIE(+) ' +
      ' AND LOG130.CPNODOC = CXP301.CPNODOC(+) ' +
      ' AND LOG130.CPCIAID = ' + QuotedStr(ps_compania) +
      ' AND LOG130.PROV = ' + QuotedStr(ps_proveedor) +
      ' AND LOG130.DOCID  = ' + QuotedStr(ps_documento) +
      ' AND LOG130.CPSERIE  = ' + QuotedStr(ps_serie) +
      ' AND LOG130.CPNODOC  = ' + QuotedStr(ps_numero);

   DMLOG.cdsQry5.Close;
   DMLOG.cdsQry5.DataRequest(xSQL);
   DMLOG.cdsQry5.Open;

   dblcCompaniaExit(dblcCompania);
   dblcdProveedorExit(dblcdProveedor);
   dblcDocumentoExit(dblcDocumento);
   dblcmonedaExit(dblcmoneda);
   lbl_EstadoOP.Caption := DMLOG.cdsQry5.FieldbyName('CPESTTRA').AsString;
   If DMLOG.cdsQry5.FieldbyName('CPESTTRA').AsString = 'PROVISIONADO' Then
   Begin
      lbl_EstadoOP.Font.Color := clGreen;
   End
   Else
      If DMLOG.cdsQry5.FieldbyName('CPESTTRA').AsString = 'REGISTRADO' Then
      Begin
         lbl_EstadoOP.Font.Color := clBlue;
      End;

End;

Procedure TFPagosDocumentos.RecuperaPagos;
Begin

   xSQL := ' SELECT ' + QuotedStr('ABONO EN CUENTA') + ' TIPO_PAGO, ' +
      ' CXP_ORD_PAG_CAB.NUMPLA NUMERO, ' +
      ' CXP_ORD_PAG_CAB.TMONID MONEDA, ' +
      ' CXP_ORD_PAG_CAB.BANCOID BANCO, ' +
      ' (SELECT TGE105.BANCONOM FROM TGE105 WHERE TGE105.BANCOID = CXP_ORD_PAG_CAB.BANCOID) BANCO_DES, ' +
      ' CXP_ORD_PAG_DET.CPMTOORI MONTO, ' +
      ' CXP_ORD_PAG_CAB.FECACEPTA FECHA_EMISION, ' +
      ' CXP_ORD_PAG_CAB.FECCONTA FECHA_PAGO, ' +
      ' ' + QuotedStr(' ') + ' CHEQUE_EMITIDO ' +
      ' FROM CXP_ORD_PAG_CAB, CXP_ORD_PAG_DET ' +
      ' WHERE CXP_ORD_PAG_CAB.CIAID = CXP_ORD_PAG_DET.CIAID ' +
      ' AND CXP_ORD_PAG_CAB.NUMERO =  CXP_ORD_PAG_DET.NUMERO  ' +
      ' AND CXP_ORD_PAG_CAB.ESTADO = ' + QuotedStr('P') +
      ' AND CXP_ORD_PAG_DET.CLAUXID = ' + QuotedStr('P') +
      ' AND CXP_ORD_PAG_DET.AUXID = ' + QuotedStr(dblcdProveedor.Text) +
      ' AND CXP_ORD_PAG_DET.DOCID = ' + QuotedStr(dblcDocumento.Text) +
      ' AND CXP_ORD_PAG_DET.CPSERIE = ' + QuotedStr(dbeSerie.Text) +
      ' AND CXP_ORD_PAG_DET.CPNODOC = ' + QuotedStr(dbeNumero.Text) +
      ' UNION ALL ' +
      ' SELECT (SELECT TGE112.FPAGODES FROM TGE112 WHERE CAJA302.FPAGOID = TGE112.FPAGOID )  TIPO_PAGO,  ' +
      ' CAJA302.ECNOCHQ NUMERO_CHEQUE, ' +
      ' CAJA302.TMONID MONEDA, ' +
      ' CAJA302.BANCOID BANCO, ' +
      ' (SELECT TGE105.BANCONOM FROM TGE105 WHERE TGE105.BANCOID = CAJA302.BANCOID) BANCO_DES, ' +
      ' CAJA302.ECMTOORI MONTO,  ' +
      ' CAJA302.ECFEMICH FECHA_EMISION, ' +
      ' CAJA302.ECFPAGOP FECHA_PAGO, ' +
      ' CAJA302.ECCHQEMI CHEQUE_EMITIDO ' +
      ' FROM CAJA302 , CAJA303   ' +
      ' WHERE CAJA302.CIAID = CAJA303.CIAID ' +
      ' AND CAJA302.TDIARID = CAJA303.TDIARID ' +
      ' AND CAJA302.ECANOMM = CAJA303.ECANOMM ' +
      ' AND CAJA302.ECNOCOMP = CAJA303.ECNOCOMP  ' +
      ' AND CAJA302.ECCHQEMI = ' + QuotedStr('S') +
      ' AND CAJA303.PROV =  ' + QuotedStr(dblcdProveedor.Text) +
      ' AND CAJA303.DOCID2 = ' + QuotedStr(dblcDocumento.Text) +
      ' AND CAJA303.CPSERIE = ' + QuotedStr(dbeSerie.Text) +
      ' AND CAJA303.CPNODOC = ' + QuotedStr(dbeNumero.Text);

   DMLOG.cdsQry11.Close;
   DMLOG.cdsQry11.DataRequest(xSQL);
   DMLOG.cdsQry11.Open;

End;

Procedure TFPagosDocumentos.dblcCompaniaExit(Sender: TObject);
Begin
   xSQL := 'CIAID=' + quotedstr(dblcCompania.Text);
   If dblcCompania.Text = '' Then
   Begin
      dblcCompania_des.Text := '';
      exit;
   End;
   If dblcCompania.text <> '' Then
   Begin
      dblcCompania_des.text := DMLOG.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', xSQL, 'CIADES');
      If dblcCompania_des.text = '' Then
      Begin
         showmessage('Ingrese una Compañía válida');
         dblcCompania.SetFocus;
         exit;
      End;
   End;
End;

Procedure TFPagosDocumentos.dblcdProveedorExit(Sender: TObject);
Begin
   xSQL := 'PROV= ' + quotedstr(dblcdProveedor.Text);
   If dblcdProveedor.Text = '' Then
   Begin
      dblcdProveedor_des.Text := '';
      exit;
   End;
   If dblcdProveedor.text <> '' Then
   Begin
      dblcdProveedor_des.text := DMLOG.DisplayDescrip('prvTGE', 'TGE201', 'PROVDES', xSQL, 'PROVDES');
      If dblcdProveedor_des.text = '' Then
      Begin
         showmessage('Ingrese una proveedor válido');
         dblcdProveedor.SetFocus;
         exit;
      End;

   End;
End;

Procedure TFPagosDocumentos.dblcDocumentoExit(Sender: TObject);
Begin
   xSQL := 'DOCID=' + quotedstr(dblcDocumento.Text);
   If (dblcDocumento.text <> '') Then
   Begin
      dblcDocumento_des.text := DMLOG.DisplayDescrip('prvTGE', 'TGE110', 'DOCDES', xSQL, 'DOCDES');
   End;
End;

Procedure TFPagosDocumentos.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMLOG.cdsQry11.Close;
   DMLOG.cdsQry5.Close;
   //DMLOG.cdsQry.Close;
   //FPagosDocumentos.Free;
End;

Procedure TFPagosDocumentos.dblcmonedaExit(Sender: TObject);
Begin
   If dblcmoneda.Text = '' Then
   Begin
      dblcmoneda_des.Text := '';
      Exit;
   End;
   If dblcmoneda.Text <> '' Then
   Begin
      dblcmoneda_des.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE103', 'TMONDES', 'TMONID=' + quotedStr(dblcmoneda.text), 'TMONDES');
   End;
End;

End.


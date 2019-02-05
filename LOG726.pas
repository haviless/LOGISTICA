Unit LOG726;
//*********************************************************
// CREADO POR            : Abelardo Sulca Palomino
// Nº HPP                : HPP_201105_LOG
// FECHA DE CREACION     : 23/06/2011
// DESCRIPCION           : Esta ventana permite visualizar el reporte de Ordenes de Pago
//                         registradas en el sistema
//*********************************************************
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, wwdbdatetimepicker, wwdblook, Buttons, ppEndUsr,
   ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands,
   ppCache;

Type
   TFRptOrdenPago = Class(TForm)
      Z2bbtnImprime: TBitBtn;
      dblcCompania: TwwDBLookupCombo;
      dblcCompania_des: TEdit;
      edtNumeroOC: TEdit;
      dbdtpDesdeOC: TwwDBDateTimePicker;
      dbdtpHastaOC: TwwDBDateTimePicker;
      dblcCompaniaOP: TwwDBLookupCombo;
      dblcCompaniaOP_des: TEdit;
      dbdtpDesdeOP: TwwDBDateTimePicker;
      dbdtpHastaOP: TwwDBDateTimePicker;
      GroupBox1: TGroupBox;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label7: TLabel;
      GroupBox2: TGroupBox;
      Label5: TLabel;
      Label8: TLabel;
      Label6: TLabel;
      Label9: TLabel;
      ppDBPipeline_OrdenPago: TppDBPipeline;
      ppReport_OrdenPago: TppReport;
      ppDesigner_OrdenPago: TppDesigner;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      Procedure FormShow(Sender: TObject);
      Procedure Z2bbtnImprimeClick(Sender: TObject);
      Procedure dblcCompaniaExit(Sender: TObject);
      Procedure dblcCompaniaOPExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FRptOrdenPago: TFRptOrdenPago;

Implementation
Uses LOGDM1;
{$R *.dfm}

Procedure TFRptOrdenPago.FormShow(Sender: TObject);
Begin
   dblcCompania.Selected.Clear;
   dblcCompania.Selected.Add('CIAID'#9'2'#9'CIA'#9'F');
   dblcCompania.Selected.Add('CIADES'#9'25'#9'Descripci'#243'n'#9'F');
   dblcCompania.LookupField := 'CIAID';
   dblcCompania.LookupTable := DMLOG.cdsCIA;

   dblcCompaniaOP.Selected.Clear;
   dblcCompaniaOP.Selected.Add('CIAID'#9'2'#9'CIA'#9'F');
   dblcCompaniaOP.Selected.Add('CIADES'#9'25'#9'Descripci'#243'n'#9'F');
   dblcCompaniaOP.LookupField := 'CIAID';
   dblcCompaniaOP.LookupTable := DMLOG.cdsCIA;

End;

Procedure TFRptOrdenPago.Z2bbtnImprimeClick(Sender: TObject);
Var
   ls_companiaOC, ls_numeroOC, ls_fechasOC: String;
   ls_companiaOP, ls_fechasOP: String;
Begin
   If dblcCompania.Text = '' Then
   Begin
      ShowMessage('Debe ingresar la Compañía de la Orden de Compra');
      Exit;
   End;
   ls_companiaOC := dblcCompania.Text + '-' + dblcCompania_des.Text;
   ;

   If edtNumeroOC.Text <> '' Then
   Begin
      ls_numeroOC := edtNumeroOC.Text;
   End
   Else
   Begin
      ls_numeroOC := 'Todas las O/C';
   End;
   ls_fechasOC := 'Desde: ' + datetostr(dbdtpDesdeOC.date) + ' Hasta: ' + datetostr(dbdtpHastaOC.date);

   If dblcCompaniaOP.Text <> '' Then
   Begin
      ls_companiaOP := dblcCompaniaOP.Text + '-' + dblcCompaniaOP_des.Text;
   End
   Else
   Begin
      ls_companiaOP := 'Todas'
   End;
   ls_fechasOP := 'Desde: ' + datetostr(dbdtpDesdeOP.date) + ' Hasta: ' + datetostr(dbdtpHastaOP.date);

   xSQL := ' SELECT LOG304.CIAID OC_COMPANIA , ' +
      ' (SELECT TGE101.CIADES FROM TGE101 ' +
      ' WHERE TGE101.CIAID = LOG304.CIAID) OC_COMPANIA_DES, ' +
      ' LOG304.ODCID OC_NUMERO, ' +
      ' LOG304.ODCTOTALG OC_TOTAL, ' +
      ' LOG304.ODCTOTALG - LOG304.ORDPAGTOT OC_PENDIENTE_ORDPAGO, ' +
      ' LOG304.ORDPAGEST OC_ESTADO_ORDPAGO, ' +
      ' LOG304.PROV PROVEEDOR, ' +
      ' LOG304.PROVDES PROVEEDOR_DES, ' +
      ' LOG130.NUMORDPAG OP_NUMERO,  ' +
      ' LOG130.CPCIAID OP_COMPANIA,  ' +
      ' (SELECT TGE101.CIADES FROM TGE101 ' +
      ' WHERE TGE101.CIAID = LOG130.CPCIAID) OP_COMPANIA_DES, ' +
      ' LOG130.DOCID OP_DOCUMENTO,  ' +
      ' (SELECT TGE110.DOCDES FROM TGE110 ' +
      ' WHERE TGE110.DOCID = LOG130.DOCID ' +
      ' AND TGE110.DOCMOD IN (' + QuotedStr('CXP') + ',' + QuotedStr('LOG') + ')) OP_DOCUMENTO_DES , ' +
      ' LOG130.CPSERIE OP_SERIE, ' +
      ' LOG130.CPNODOC OP_NUMERO_DOC, ' +
      ' LOG130.TMONID OP_MONEDA, ' +
      ' LOG130.CPFEMIS OP_EMISION, ' +
      ' LOG130.CPFRECEP OP_RECEPCION, ' +
      ' LOG130.TOTAL OP_TOTAL, ' +
      ' LOG130.CPESTTRA OP_ESTADO, ' +
      ' CXP301.CPMTOORI CXP_MONTO, ' +
      ' CXP301.CPPAGORI CXP_PAGADO, ' +
      ' CXP301.CPSALORI CXP_SALDO , ' +
      QuotedStr(DMLOG.wUsuario) + ' USUARIO_IMPRIME, ' +
      QuotedStr(ls_companiaOC) + ' FILTRO_COMPANIA_OC, ' +
      QuotedStr(ls_numeroOC) + ' FILTRO_NUMERO_OC, ' +
      QuotedStr(ls_fechasOC) + ' FILTRO_FECHAS_OC, ' +
      QuotedStr(ls_companiaOP) + ' FILTRO_COMPANIA_OP, ' +
      QuotedStr(ls_fechasOP) + ' FILTRO_FECHAS_OP ' +
      ' FROM LOG130, LOG304 ,CXP301  ' +
      ' WHERE LOG130.ODCCIAID = LOG304.CIAID ' +
      ' AND LOG130.ODCID = LOG304.ODCID  ' +
      ' AND LOG130.CPCIAID = CXP301.CIAID(+) ' +
      ' AND LOG130.PROV = CXP301.PROV(+) ' +
      ' AND LOG130.DOCID = CXP301.DOCID(+) ' +
      ' AND LOG130.CPSERIE = CXP301.CPSERIE(+) ' +
      ' AND LOG130.CPNODOC = CXP301.CPNODOC(+)  ' +
      ' AND (LOG304.ODCFEMI >= TO_DATE(' + quotedStr(datetostr(dbdtpDesdeOC.date)) + ', ' + quotedStr('DD/MM/YYYY')
      + ') AND LOG304.ODCFEMI <= TO_DATE(' + quotedStr(datetostr(dbdtpHastaOC.date)) + ', ' + quotedStr('DD/MM/YYYY') + ') ) ' +
      ' AND (LOG130.CPFEMIS >= TO_DATE(' + quotedStr(datetostr(dbdtpDesdeOP.date)) + ', ' + quotedStr('DD/MM/YYYY')
      + ') AND LOG130.CPFEMIS <= TO_DATE(' + quotedStr(datetostr(dbdtpHastaOP.date)) + ', ' + quotedStr('DD/MM/YYYY') + ') ) ';

   If edtNumeroOC.text <> '' Then
   Begin
      xSQL := xSQL + ' AND LOG304.ODCID = ' + quotedStr(edtNumeroOC.text);
   End;
   If dblcCompaniaOP.text <> '' Then
   Begin
      xSQL := xSQL + ' AND LOG130.CIAID = ' + quotedStr(dblcCompaniaOP.text);
   End;

   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   If DMLOG.cdsQry.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppDBPipeline_OrdenPago.DataSource := DMLOG.dsQry;
   ppReport_OrdenPago.DataPipeline := ppDBPipeline_OrdenPago;

   ppReport_OrdenPago.Template.FileName := wRutaRpt + '\RptOrdenPago.rtm';

   ppReport_OrdenPago.Template.LoadFromFile;
   //para mostrar el diseñador del reporte
   //ppDesigner_OrdenPago.Report := ppReport_OrdenPago ;
   //ppDesigner_OrdenPago.ShowModal() ;
   ppReport_OrdenPago.Print;

End;

Procedure TFRptOrdenPago.dblcCompaniaExit(Sender: TObject);
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

Procedure TFRptOrdenPago.dblcCompaniaOPExit(Sender: TObject);
Begin
   xSQL := 'CIAID=' + quotedstr(dblcCompaniaOP.Text);
   If dblcCompaniaOP.Text = '' Then
   Begin
      dblcCompaniaOP_des.Text := '';
      exit;
   End;
   If dblcCompaniaOP.text <> '' Then
   Begin
      dblcCompaniaOP_des.text := DMLOG.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', xSQL, 'CIADES');
      If dblcCompaniaOP_des.text = '' Then
      Begin
         showmessage('Ingrese una Compañía válida');
         dblcCompaniaOP.SetFocus;
         exit;
      End;
   End;
End;

Procedure TFRptOrdenPago.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMLOG.cdsQry.Close;
   //FRptOrdenPago.Free;
End;

End.


Unit LOG130;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG130
//Formulario               : FOrdenPago                          
//Fecha de Creación        : 22/06/2011
//Autor                    : Abelardo Sulca Palomino
//Objetivo                 : Esta ventana se encarga de registrar las Ordenes de
//                           pago para las Ordenes de Compra.
//                           Debido al registro de las Ordenesd de Pago la Orden de Compra
//                           puede tener los siguientes estado:
//                           INICIAL    :Cuando se está registrando Ordenes de Pago en la OC
//                           COMPLETADO :Cuando se terminó de registrar las Ordenes de Pago y
//                                       el saldo pendiente es cero
//                           CERRADO    :Cuando el registro de las Ordenes de Pago no
//                                       es por el total de la OC y ya no se desea seguir
//                                       registrando.
//                           las Ordenes de Pago a su vez tienen los siguientes estados
//                           INICIAL    :Cuando la Orden de pago ha sido registrado y
//                                       puede ser modificado
//                           ACEPTADO   :Cuando ya no se puede registrar mas documentos en la Orden de Pago
//                                       y se envía a GAdm para su visto
//                           ANULADO    :Cuando se anula la Orden de Pago y los documentos que contiene

//Actualizaciones:
// HPC_201106_LOG 08/11/2011: Cambios implementados que permite que la Orden de Pago
//                           pueda tener más de un documento(Factura, boleta, etc)
//                           La moneda de los documentos que contiene la Orden de Pago
//                           debe ser la misma que la orden de Compra
//                           No se podrá tener más de una Orden de pago en estado
//                           INICIAL
// HPC_201201_LOG 02/02/2012: Se modifica los criterios de consulta para considerar
//                           a la llave de la Orden de Pago y la llave de la Orden de Compra
//                           para la sección  WHERE de las consultas y actualizaciones
// HPC_201305_LOG 21/11/2013 Se amplia la posibilidad de documentos por Pagar
//                           se considera a los Tipos de Documentos que acepta Cuentas por Pagar y Logística
// HPC_201701_LOG            : Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
// HPC_201803_LOG            : Se incluye el componente para utilizarlo en la solicitud de Orden de Pago

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Buttons, Wwdbigrd, Grids, Wwdbgrid, wwdbdatetimepicker,
   StdCtrls, Wwdbdlg, Mask, wwdbedit, wwdblook, DBCtrls, ExtCtrls, ppEndUsr,
   ppParameter, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
   ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ComCtrls;
// Fin HPC_201701_LOG
Type
   TFOrdenPago = Class(TForm)
      dbgDetalleOrdPago: TwwDBGrid;
      btnAdiccionaOrdenPago: TwwIButton;
      dblcdProv: TwwDBLookupComboDlg;
      dblcdProv_des: TwwDBEdit;
      dblcTMoneda: TwwDBLookupCombo;
      dblcTMoneda_des: TEdit;
      dblcFPago: TwwDBLookupCombo;
      lblNro: TLabel;
      lblProv: TLabel;
      lblTMon: TLabel;
      lblConCom: TLabel;
      dbdtpFEmi: TwwDBDateTimePicker;
      lblFEmi: TLabel;
      dblcdOrdenCompra: TwwDBLookupComboDlg;
      pnlDocumento: TPanel;
      Label12: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      dblcFPago_des: TEdit;
      dbeTotalOC: TwwDBEdit;
      dbeTotalOrdPago: TwwDBEdit;
      dbeEstadoOrdPago: TwwDBEdit;
      Z2bbtnImprime: TBitBtn;
      ppDBPipeline_OrdenPago: TppDBPipeline;
      ppReport_OrdenPago: TppReport;
      ppDesigner_OrdenPago: TppDesigner;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      dbePendiente: TwwDBEdit;
      Label18: TLabel;
      Z2bbtn_Pagos: TBitBtn;
      btnImprimeOrdenPago: TBitBtn;
      pprFormatoOrdenPago: TppReport;
      ppParameterList1: TppParameterList;
      ppHeaderBand2: TppHeaderBand;
      ppSystemVariable1: TppSystemVariable;
      ppLabel57: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel58: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel60: TppLabel;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppSystemVariable10: TppSystemVariable;
      ppDBText13: TppDBText;
      ppLabel18: TppLabel;
      ppLabel17: TppLabel;
      ppLabel16: TppLabel;
      ppLabel4: TppLabel;
      ppLabel3: TppLabel;
      ppLabel2: TppLabel;
      ppLabel1: TppLabel;
      ppLabel19: TppLabel;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppLabel20: TppLabel;
      ppDBText27: TppDBText;
      ppLabel21: TppLabel;
      ppLabel23: TppLabel;
      ppDBText29: TppDBText;
      ppLabel24: TppLabel;
      ppLabel26: TppLabel;
      ppLabel5: TppLabel;
      ppDBText14: TppDBText;
      ppLabel6: TppLabel;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppLabel7: TppLabel;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText22: TppDBText;
      ppDBText26: TppDBText;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppDBText32: TppDBText;
      ppLabel12: TppLabel;
      ppLabel14: TppLabel;
      ppDBText10: TppDBText;
      ppDetailBand2: TppDetailBand;
      ppFooterBand2: TppFooterBand;
      ppDBText15: TppDBText;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLabel13: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppdFormatoOrdenPago: TppDesigner;
      ppdbFormatoOrdenPago: TppDBPipeline;
      Label20: TLabel;
      pnlOrdenPago: TPanel;
      dbgDocumentos: TwwDBGrid;
      btnAdiccionaDocumentoPago: TwwIButton;
      stxTitulo2: TStaticText;
      StaticText1: TStaticText;
      edtOrdenPago: TwwDBEdit;
      Label21: TLabel;
      edtTotalOrdenPago: TwwDBEdit;
      Label22: TLabel;
      Label23: TLabel;
      dtpFecha: TwwDBDateTimePicker;
      btnAnulaOrdenPago: TBitBtn;
      edtEstadoOrdenPago: TwwDBEdit;
      Label25: TLabel;
      btnAceptaOrdenPago: TBitBtn;
      btnCerrarOrdenPago: TBitBtn;
      Label15: TLabel;
      edtEstado: TwwDBEdit;
      Z2bbtnCierraOP: TBitBtn;
      Label16: TLabel;
      edtSaldoOC: TwwDBEdit;
      bbtnRecalSaldOPago: TBitBtn;
      Label5: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      Label2: TLabel;
      dblcDocumento: TwwDBLookupCombo;
      dblcDocumento_des: TwwDBEdit;
      dbeSerie: TwwDBEdit;
      dbeNumero: TwwDBEdit;
      dbdtpEmision: TwwDBDateTimePicker;
      dbeTotal: TwwDBEdit;
      bbtnAdicionaDocumento: TBitBtn;
      btnCerrarDocumento: TBitBtn;
      Label68: TLabel;
      dblcBanco: TwwDBLookupCombo;
      dbeBanco: TEdit;
      Label66: TLabel;
      dblcTMon: TwwDBLookupCombo;
      edtTMon: TEdit;
      Label69: TLabel;
      Label6: TLabel;
      dbeCtaCte: TwwDBEdit;
      dbeCodCtaInt: TwwDBEdit;
      btnBuscarCta: TBitBtn;
      Label1: TLabel;
      dblcTipoAuxiliar: TwwDBLookupCombo;
// Inicio HPC_201803_LOG
// Se implementa debido a la solicitud de Orden de Pago
    lblCCosto: TLabel;
    dblcdCCosto: TwwDBLookupComboDlg;
    edtCCosto: TEdit;
    lblCia: TLabel;
    dblcCIA: TwwDBLookupCombo;
    edtCIA: TEdit;
// Fin HPC_201803_LOG    
// Fin HPC_201701_LOG
      Procedure FormShow(Sender: TObject);
      Procedure dblcdProvExit(Sender: TObject);
      Procedure dblcdOrdenCompraExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure btnAdiccionaOrdenPagoClick(Sender: TObject);
      Procedure dblcTMonedaExit(Sender: TObject);
      Procedure dblcFPagoExit(Sender: TObject);
      Procedure dblcDocumentoExit(Sender: TObject);
      Procedure bbtnRetiraCodBarraClick(Sender: TObject);
      Procedure bbtnAdicionaDocumentoClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbeTotalExit(Sender: TObject);
      Procedure dbeSerieExit(Sender: TObject);
      Procedure dbeNumeroExit(Sender: TObject);
      Procedure Z2bbtnImprimeClick(Sender: TObject);
      Procedure dbgDetalleOrdPagoDblClick(Sender: TObject);
      Procedure btnAceptaOrdenPagoClick(Sender: TObject);
      Procedure Z2bbtnCierraOPClick(Sender: TObject);
      Procedure Z2bbtn_PagosClick(Sender: TObject);
      Procedure dbdtpEmisionExit(Sender: TObject);
      Procedure btnImprimeOrdenPagoClick(Sender: TObject);
      Procedure btnAnulaOrdenPagoClick(Sender: TObject);
      Procedure btnAdiccionaDocumentoPagoClick(Sender: TObject);
      Procedure btnCerrarOrdenPagoClick(Sender: TObject);
      Procedure btnCerrarDocumentoClick(Sender: TObject);
      Procedure dbgDocumentosDblClick(Sender: TObject);
      Procedure dbgDocumentosKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure bbtnRecalSaldOPagoClick(Sender: TObject);
// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
      Procedure btnBuscarCtaClick(Sender: TObject);
      Procedure dblcBancoExit(Sender: TObject);
      Procedure dblcTMonExit(Sender: TObject);
      Procedure btnGrabarCtaCteClick(Sender: TObject);
// Inicio HPC_201803_LOG
// Se implementa debido a la Solicitud de Orden de Pago
      procedure dblcdCCostoExit(Sender: TObject);
    procedure dblcCIAExit(Sender: TObject);
// Fin HPC_201803_LOG
// Fin HPC_201701_LOG
   Private
 // Inicio : HPC_201305_LOG
      xgDocResta: String; // identifica si el documento seleccionado debe restar o sumar
      xgClaseAux: String; // clase de auxiliar del Proveedor Seleccionado
 // Fin :
// Inicio HPC_201803_LOG
// Se implementa debido a la Solicitud de Orden de Pago
      xCta_Ccos: String;
// Fin HPC_201803_LOG
    { Private declarations }
      Procedure Asignalookup;
      Procedure AsignaDataSource;
      Procedure BloqueaCabecera;
      Procedure RecuperarDetalle(ps_OCCiaId, ps_NumOC: String);
      Procedure RecuperaOrdenPago(wgCiaId, wgNumOrdPago: String);
      Procedure LimpiaPanelDocumento;
      Procedure GrabaDocumento(wgAccionDoc: String);
      Procedure GrabaOrdenPago(wgAccionOP: String);
      Procedure ActualizaSaldoOC(ps_OCCiaId, ps_NumOC: String);
      Procedure ActualizaTotalOrdenPago(wgCiaId, wgNumOrdPago: String);

      Procedure RecuperaCabecera(ps_OCCiaId, ps_NumOC: String);
      Procedure DescripcionCabecera;
      Function ValidaPanel: Boolean;
      Function fg_ExisteDocProvisionado: Boolean;
      Function fg_ExisteCabecera(wgCiaid, wgNumordenPago, wgCiaIdOC, wgNumeroOC: String): Boolean;
      Procedure RecuperaDocumento(wgCiaid, wgNumOrdPago: String; wgItem: Integer);
      Procedure BloqueaPanelOP(wgBooleano: Boolean);
      Procedure BloqueaPanelDocumento(wgBooleano: Boolean);
// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
      Procedure BloqueaPanelCtaBancaria(wgBooleano: Boolean);
// Fin HPC_201701_LOG
      Procedure AnulaOrdenPago(wgCiaid_op, wgNumOrdPago: String);
      Procedure PanelOrdenPagoDefault;

   Public
    { Public declarations }
      xCia, xNumOrdenCompra: String;
      xsAccionDoc, xsAccionOrdenPago: String;
   End;

Var
   FOrdenPago: TFOrdenPago;
   xsOrdenPagoAccion: String; //AGREGAR, MODIFICAR, CONSULTAR
   xTipoProvee: String; // Tipo de Proveedor

Implementation

{$R *.dfm}
// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
Uses LOGDM1, LOG131, LOG727, LOG228, LOG130A;
// Fin HPC_201701_LOG

Procedure TFOrdenPago.Asignalookup;
Begin
// Clase de Auxiliar
   dblcTipoAuxiliar.Text := DMLOG.cdsOrdComp.FieldbyName('CLAUXID').AsString;

// Proveedor
   If DMLOG.cdsProv.Active = False Then
      DMLOG.FiltraTabla(DMLOG.cdsProv, 'TGE201', 'PROV', 'PROV');
   dblcdProv.Selected.Clear;
   dblcdProv.Selected.Add('PROV'#9'8'#9'Prov'#9'F');
   dblcdProv.Selected.Add('PROVDES'#9'50'#9'Descripci'#243'n'#9'F');
   dblcdProv.LookupField := 'PROV';
   dblcdProv.LookupTable := DMLOG.cdsProv;

// Orden de Compra
   xSQL := 'SELECT * FROM  LOG304 WHERE 1 = 2';
   DMLOG.cdsQry7.Close;
   DMLOG.cdsQry7.DataRequest(xSQL);
   DMLOG.cdsQry7.Open;
   dblcdOrdenCompra.Selected.Clear;
   dblcdOrdenCompra.Selected.Add('ODCID'#9'8'#9'O/C'#9'F');
   dblcdOrdenCompra.Selected.Add('ODCFEMI'#9'8'#9'Fecha'#9'F');
   dblcdOrdenCompra.Selected.Add('TMONID'#9'5'#9'M'#9'F');
   dblcdOrdenCompra.Selected.Add('ODCOBS'#9'40'#9'Observacion'#9'F');
   dblcdOrdenCompra.Selected.Add('ODCTOTALG'#9'8'#9'Total'#9'F');
   dblcdOrdenCompra.LookupField := 'ODCID';
   dblcdOrdenCompra.LookupTable := DMLOG.cdsQry7;

// Detalle de Orden de Pago
   dbgDetalleOrdPago.Selected.Clear;
   dbgDetalleOrdPago.Selected.Add('NUMORDPAG'#9'8'#9'Nº~Ord Pago'#9'F');
   dbgDetalleOrdPago.Selected.Add('ESTADO'#9'8'#9'Estado~Ord Pago'#9'F');
   dbgDetalleOrdPago.Selected.Add('DOCID'#9'3'#9'Doc~Id'#9'F');
   dbgDetalleOrdPago.Selected.Add('DOCID_DES'#9'13'#9'Documento'#9'F');
   dbgDetalleOrdPago.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
   dbgDetalleOrdPago.Selected.Add('CPNODOC'#9'7'#9'Número'#9'F');
   dbgDetalleOrdPago.Selected.Add('TMONID'#9'2'#9'M'#9'F');
   dbgDetalleOrdPago.Selected.Add('TOTAL'#9'8'#9'Total'#9'F');
   dbgDetalleOrdPago.Selected.Add('CPFEMIS'#9'9'#9'Fec~Emisión'#9'F');
   dbgDetalleOrdPago.Selected.Add('CPESTTRA'#9'8'#9'Estado~Documento'#9'F');
   dbgDetalleOrdPago.Selected.Add('CPFECTRA'#9'8'#9'Fecha~Provisión'#9'F');
   dbgDetalleOrdPago.Selected.Add('CPUSUTRA'#9'8'#9'Usuario~Provisión'#9'F');
   dbgDetalleOrdPago.Selected.Add('CPOBS'#9'50'#9'Observación'#9'F');
   dbgDetalleOrdPago.ApplySelected;

// Inicio: HPC_201305_LOG
   DMLOG.FiltraTabla(DMLOG.cdsTDoc, 'TGE110', 'DOCID', 'DOCID', 'DOCMOD IN (' + QuotedStr('CXP') + ', ' + QuotedStr('LOG') + ')');
// Fin: HPC_201305_LOG
// Inicio HPC_201803_LOG
// Se implementa debido a la solicitud de Orden de Pago
// If DMLOG.cdsCiaOP.Active = False Then
   DMLOG.FiltraTabla(DMLOG.cdsCiaOP, 'TGE101', 'CIAID', 'CIAID');

   dblcCIA.Selected.Clear;
   dblcCIA.Selected.Add('CIAID'#9'2'#9'ID'#9'F');
   dblcCIA.Selected.Add('CIADES'#9'25'#9'Descripción'#9'F');
   dblcCIA.LookupTable := DMLOG.cdsCIAOP;
   dblcCIA.LookupField := 'CIAID';

// Fin HPC_201803_LOG
   DMLOG.FiltraTabla(DMLOG.cdsTMoneda, 'TGE103', 'TMONID', 'TMONID');

   dblcDocumento.Selected.Clear;
   dblcDocumento.Selected.Add('DOCID'#9'2'#9'ID'#9'F');
   dblcDocumento.Selected.Add('DOCDES'#9'25'#9'Documento'#9'F');
   dblcDocumento.LookupTable := DMLOG.cdsTDoc;
   dblcDocumento.LookupField := 'DOCID';

   dbgDocumentos.Selected.Clear;
   dbgDocumentos.Selected.Add('DOCID'#9'5'#9'Cod~Doc'#9'F');
   dbgDocumentos.Selected.Add('DOCID_DES'#9'8'#9'Tipo~Documento'#9'F');
   dbgDocumentos.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
   dbgDocumentos.Selected.Add('CPNODOC'#9'7'#9'Número'#9'F');
   dbgDocumentos.Selected.Add('TOTAL'#9'7'#9'Total'#9'F');
   dbgDocumentos.Selected.Add('CPFEMIS'#9'10'#9'Fecha'#9'F');
   dbgDocumentos.Selected.Add('CPESTTRA'#9'8'#9'Estado'#9'F');
   dbgDocumentos.ApplySelected;
End;

Procedure TFOrdenPago.AsignaDataSource;
Begin
   dblcdProv.DataSource := DMLOG.dsOrdComp;
   dblcdProv.DataField := 'PROV';
   dblcdProv_des.DataSource := DMLOG.dsOrdComp;
   dblcdProv_des.DataField := 'PROVDES';

   dblcdOrdenCompra.DataSource := DMLOG.dsOrdComp;
   dblcdOrdenCompra.DataField := 'ODCID';

   dblcTMoneda.DataSource := DMLOG.dsOrdComp;
   dblcTMoneda.DataField := 'TMONID';
   dblcFPago.DataSource := DMLOG.dsOrdComp;
   dblcFPago.DataField := 'CCOMERID';
   dbdtpFEmi.DataSource := DMLOG.dsOrdComp;
   dbdtpFEmi.DataField := 'ODCFEMI';

   dbeTotalOC.DataSource := DMLOG.dsOrdComp;
   dbeTotalOC.DataField := 'ODCTOTALG';
   dbeTotalOrdPago.DataSource := DMLOG.dsOrdComp;
   dbeTotalOrdPago.DataField := 'ORDPAGTOT';
   dbeEstadoOrdPago.DataSource := DMLOG.dsOrdComp;
   dbeEstadoOrdPago.DataField := 'ORDPAGEST';

   dbgDetalleOrdPago.DataSource := DMLOG.dsQry12;

   //DataSource en el Panel
   xSQL := 'SELECT * FROM  LOG130 WHERE  1=2';
   DMLOG.cdsQry4.Close;
   DMLOG.cdsQry4.DataRequest(xSQL);
   DMLOG.cdsQry4.Open;
   DMLOG.cdsQry4.Insert;
   dblcDocumento.DataField := 'DOCID';
   dblcDocumento.DataSource := DMLOG.dsQry4;
   dbeSerie.DataField := 'CPSERIE';
   dbeSerie.DataSource := DMLOG.dsQry4;
   dbeNumero.DataField := 'CPNODOC';
   dbeNumero.DataSource := DMLOG.dsQry4;
   dbdtpEmision.DataField := 'CPFEMIS';
   dbdtpEmision.DataSource := DMLOG.dsQry4;
   dbeTotal.DataField := 'TOTAL';
   dbeTotal.DataSource := DMLOG.dsQry4;
// Inicio HPC_201803_LOG
// Se incluye el componente para utilizarlo en la solicitud de Orden de Pago
   dblcCIA.datafield := 'CIAID';
   dblcCIA.datasource := DMLOG.dsQry4;
//   dblcCIA.LookUpField := 'CIAID';
   dblcCIA.LookUpTable := DMLOG.cdsCIAOP;
   dblcdCCosto.DataSource := DMLOG.dsQry4;
   dblcdCCosto.LookupTable := DMLOG.cdsCCost;
// Fin HPC_201803_LOG
   xSQL := ' SELECT LOG130.DOCID, '
      + '       (SELECT TGE110.DOCDES '
      + '          FROM TGE110 '
      + '         WHERE TGE110.DOCID = LOG130.DOCID  '
      + '           AND TGE110.DOCMOD IN (' + QuotedStr('CXP') + ',' + QuotedStr('LOG') + ')) DOCID_DES, '
      + '        LOG130.CPSERIE, '
      + '        LOG130.CPNODOC, '
      + '        LOG130.TOTAL, '
      + '        LOG130.CPFEMIS, '
      + '        LOG130.CPESTTRA, '
      + '        LOG130.ITEM, '
      + '        LOG130.CIAID, '
      + '        LOG130.NUMORDPAG, '
// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
   + '        LOG130.BANCOID, '
      + '        LOG130.BANCOTMONID, '
      + '        LOG130.BANCONUMCTA, '
      + '        LOG130.BANCOCCI '

// Fin HPC_201701_LOG
   + '   FROM LOG130'
      + ' WHERE 1 = 2 ';
   DMLOG.cdsQry3.Close;
   DMLOG.cdsQry3.DataRequest(xSQL);
   DMLOG.cdsQry3.Open;
   dbgDocumentos.DataSource := DMLOG.dsQry3;
End;

Procedure TFOrdenPago.BloqueaCabecera;
Begin
   dblcdProv.Enabled := False;
   dblcdOrdenCompra.Enabled := False;
End;

Procedure TFOrdenPago.PanelOrdenPagoDefault;
Begin
   edtEstado.Text := 'INICIAL';
   edtTotalOrdenPago.Text := '0.00';
   dtpFecha.Date := now();
   edtOrdenPago.Text := '00000000';
   edtSaldoOC.Text := DMLOG.cdsOrdComp.FieldbyName('ORDPAGPEN').AsString;
   btnAnulaOrdenPago.Enabled := True;
   btnAceptaOrdenPago.Enabled := True;
   btnCerrarOrdenPago.Enabled := True;
   btnAdiccionaDocumentoPago.Enabled := True;
End;

Procedure TFOrdenPago.BloqueaPanelOP(wgBooleano: Boolean);
Begin
   btnAnulaOrdenPago.Enabled := wgBooleano;
   btnAdiccionaDocumentoPago.Enabled := wgBooleano;
   btnAceptaOrdenPago.Enabled := wgBooleano;
   btnCerrarOrdenPago.Enabled := wgBooleano;
   dbgDocumentos.Enabled := wgBooleano;

   If xsAccionOrdenPago = 'CONSULTAR' Then
   Begin
      btnAdiccionaDocumentoPago.Enabled := False;
      btnAceptaOrdenPago.Enabled := False;
      btnAnulaOrdenPago.Enabled := False;
   End;
End;

Procedure TFOrdenPago.BloqueaPanelDocumento(wgBooleano: Boolean);
Begin
   dblcDocumento.Enabled := wgBooleano;
   dbeSerie.Enabled := wgBooleano;
   dbeNumero.Enabled := wgBooleano;
   dbdtpEmision.Enabled := wgBooleano;
   dbeTotal.Enabled := wgBooleano;
   bbtnAdicionaDocumento.Enabled := wgBooleano;
   If xsAccionDoc = 'CONSULTAR' Then
   Begin
      bbtnAdicionaDocumento.Enabled := False;
      dblcDocumento.Enabled := False;
      dbeSerie.Enabled := False;
      dbeNumero.Enabled := False;
      dbdtpEmision.Enabled := False;
      dbeTotal.Enabled := False;
   End;
// Inicio HPC_201803_LOG
// Se ha implementado debido a la solicitud de Orden de Pago
   If xsAccionDoc = 'AGREGAR' Then
   Begin
      if (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'I') or (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'S') then
      begin
         dblcCIA.Text := '';
         edtCIA.Text := '';
         dblcdCCosto.Text :='';
         edtCCosto.Text :='';
         dblcCIA.Enabled := True;
         dblcdCCosto.Enabled := True;
      end
      else
      begin
         dblcCIA.Text := '';
         edtCIA.Text := '';
         dblcdCCosto.Text :='';
         edtCCosto.Text :='';
         dblcCIA.Enabled := False;
         dblcdCCosto.Enabled := False;
      end;
   end
   else if xsAccionDoc = 'EDITAR' Then
   begin
      if (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'I') or (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'S') then
      begin
         dblcCIA.Enabled := True;
         dblcdCCosto.Enabled := True;
      end
      else
      begin
         dblcCIA.Text := '';
         edtCIA.Text := '';
         dblcdCCosto.Text :='';
         edtCCosto.Text :='';
         dblcCIA.Enabled := False;
         dblcdCCosto.Enabled := False;
      end;
   end;
// Fin HPC_201803_LOG
End;

// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.

Procedure TFOrdenPago.BloqueaPanelCtaBancaria(wgBooleano: Boolean);
Begin
   dblcBanco.Enabled := wgBooleano;
   dbeBanco.Enabled := wgBooleano;
   dblcTMon.Enabled := wgBooleano;
   edtTMon.Enabled := wgBooleano;
   dbeCtaCte.Enabled := wgBooleano;
   dbeCodCtaInt.Enabled := wgBooleano;
   If ((xsAccionDoc = 'CONSULTAR') Or (xsAccionDoc = 'EDITAR')) Then
   Begin
      dblcBanco.Enabled := False;
      dbeBanco.Enabled := False;
      dblcTMon.Enabled := False;
      edtTMon.Enabled := False;
      dbeCtaCte.Enabled := False;
      dbeCodCtaInt.Enabled := False;
   End;
End;
// Fin HPC_201701_LOG

Procedure TFOrdenPago.LimpiaPanelDocumento;
Begin
   dblcDocumento.Text := '';
   dblcDocumento_des.Text := '';
   dbeSerie.Text := '';
   dbeNumero.Text := '';
   dbdtpEmision.Text := '';
   dbeTotal.Text := '';
   DMLOG.cdsQry4.ClearFields;
   BloqueaPanelDocumento(True);
// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
   BloqueaPanelCtaBancaria(True);
// Fin HPC_201701_LOG
End;

Procedure TFOrdenPago.GrabaOrdenPago(wgAccionOP: String);
Var
   xsNumeroOrdenPago, xsAnio: String;
Begin
   If wgAccionOP = 'AGREGAR' Then
   Begin
      xsAnio := Copy(datetoStr(dtpFecha.Date), 7, 4);
// Inicio HPC_201803_LOG
// Se implementa para la solicitud de Orden de Pago
      if (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'I') or (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'S') then
      begin
          xSQL := 'Select max(NUMORDPAG) NUMORDPAG '
             + '     from (Select nvl(cast(to_number(max(NUMORDPAG)+1) as varchar2(8)),' + QuotedStr(xsAnio + '0001') + ') NUMORDPAG '
             + '             from LOG130 '
             + '            where CIAID=' + QuotedStr(dblcCIA.Text)
             + '              and substr(NUMORDPAG,1,4)=' + QuotedStr(xsAnio)
             + '              and length(NUMORDPAG)=8 '
             + '            union all '
             + '           Select nvl(cast(to_number(max(NUMORDPAG)+1) as varchar2(8)),' + QuotedStr(xsAnio + '0001') + ') NUMORDPAG '
             + '             from LOG131 '
             + '            where CIAID=' + QuotedStr(dblcCIA.Text)
             + '              and substr(NUMORDPAG,1,4)=' + QuotedStr(xsAnio)
             + '              and length(NUMORDPAG)=8 '
             + '          ) ';
      end
      else
      begin
          xSQL := 'Select max(NUMORDPAG) NUMORDPAG '
             + '     from (Select nvl(cast(to_number(max(NUMORDPAG)+1) as varchar2(8)),' + QuotedStr(xsAnio + '0001') + ') NUMORDPAG '
             + '             from LOG130 '
             + '            where CIAID=' + QuotedStr(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString)
             + '              and substr(NUMORDPAG,1,4)=' + QuotedStr(xsAnio)
             + '              and length(NUMORDPAG)=8 '
             + '            union all '
             + '           Select nvl(cast(to_number(max(NUMORDPAG)+1) as varchar2(8)),' + QuotedStr(xsAnio + '0001') + ') NUMORDPAG '
             + '             from LOG131 '
             + '            where CIAID=' + QuotedStr(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString)
             + '              and substr(NUMORDPAG,1,4)=' + QuotedStr(xsAnio)
             + '              and length(NUMORDPAG)=8 '
             + '          ) ';
      end;
      DMLOG.cdsQry.Close;
      DMLOG.cdsQry.DataRequest(xSQL);
      DMLOG.cdsQry.Open;
      xsNumeroOrdenPago := DMLOG.cdsQry.FieldByName('NUMORDPAG').AsString;

      edtOrdenPago.Text := xsNumeroOrdenPago;
      //agregar cabecera orden de pago

      if (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'I') or (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'S') then
      begin
          xSQL := ' INSERT INTO LOG131 (CIAID,NUMORDPAG,ODCCIAID,ODCID,TMONID, '
             + '                     BASEIMP,IGV,TOTAL,OBSERVACION,FECHA, '
             + '                     ESTADO,USUREG,FECREG,USUMOD,FECMOD) '
             + ' VALUES (' + QuotedStr(dblcCIA.Text) + ', '
             + QuotedStr(xsNumeroOrdenPago) + ', '
             + QuotedStr(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString) + ', '
             + Quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString) + ', '
             + Quotedstr(DMLOG.cdsOrdComp.FieldbyName('TMONID').AsString) + ', '
             + 'null, ' //BASEIMP,
             + 'null, ' //IGV,
             + 'null, ' //TOTAL,
             + 'NULL, '
             + ' TO_DATE( ' + QuotedStr(DateToStr(dbdtpEmision.date)) + ',' + QuotedStr('DD/MM/YYYY') + '), '
             + Quotedstr('INICIAL') + ', '
             + 'USER, '
             + 'SYSDATE, '
             + 'NULL, '
             + 'NULL )';
      end
      else
      begin
          xSQL := ' INSERT INTO LOG131 (CIAID,NUMORDPAG,ODCCIAID,ODCID,TMONID, '
             + '                     BASEIMP,IGV,TOTAL,OBSERVACION,FECHA, '
             + '                     ESTADO,USUREG,FECREG,USUMOD,FECMOD) '
             + ' VALUES (' + QuotedStr(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString) + ', '
             + QuotedStr(xsNumeroOrdenPago) + ', '
             + QuotedStr(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString) + ', '
             + Quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString) + ', '
             + Quotedstr(DMLOG.cdsOrdComp.FieldbyName('TMONID').AsString) + ', '
             + 'null, ' //BASEIMP,
             + 'null, ' //IGV,
             + 'null, ' //TOTAL,
             + 'NULL, '
             + ' TO_DATE( ' + QuotedStr(DateToStr(dbdtpEmision.date)) + ',' + QuotedStr('DD/MM/YYYY') + '), '
             + Quotedstr('INICIAL') + ', '
             + 'USER, '
             + 'SYSDATE, '
             + 'NULL, '
             + 'NULL )';
      end;
// Fin HPC_201803_LOG
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('error');
      End;
      wgAccionOP := 'EDITAR';
      xsAccionOrdenPago := 'EDITAR';
   End
   //Se actualiza el estado de la Orden de Pago a INICIAL
   Else
      If wgAccionOP = 'EDITAR' Then
      Begin
      //agregar cabecera orden de pago
// Inicio HPC_201803_LOG
// Se implementa para la solicitud de Orden de Pago
         if (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'I') or (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'S') then
         begin
             xSQL := ' UPDATE LOG131 '
                + '    SET CIAID = ' + Quotedstr(dblcCIA.Text) + ','
                + '        ESTADO = ' + Quotedstr('INICIAL') + ','
                + '        USUMOD = USER , FECMOD = SYSDATE '
                + '  WHERE CIAID =  ' + QuotedStr(DMLOG.cdsQry3.FieldbyName('CIAID').AsString)
                + '    AND NUMORDPAG = ' + QuotedStr(DMLOG.cdsQry3.FieldbyName('NUMORDPAG').AsString)
                + '    AND ODCCIAID = ' + QuotedStr(xCia)
                + '    AND ODCID = ' + QuotedStr(xNumOrdenCompra);
         end
         else
         begin
             xSQL := ' UPDATE LOG131 '
                + '    SET CIAID = ' + QuotedStr(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString) + ','
                + '        ESTADO = ' + Quotedstr('INICIAL') + ','
                + '        USUMOD = USER , FECMOD = SYSDATE '
                + '  WHERE CIAID =  ' + QuotedStr(DMLOG.cdsQry3.FieldbyName('CIAID').AsString)
                + '    AND NUMORDPAG = ' + QuotedStr(DMLOG.cdsQry3.FieldbyName('NUMORDPAG').AsString)
                + '    AND ODCCIAID = ' + QuotedStr(xCia)
                + '    AND ODCID = ' + QuotedStr(xNumOrdenCompra);
         end;
// Fin HPC_201803_LOG
         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error al Actualizar la Orden de pago');
         End;
      End;
// Inicio HPC_201803_LOG
// Se implementa debido a la solicitud de Orden de Pago
   ActualizaSaldoOC(xCia, dblcdOrdenCompra.Text);
// Fin HPC_201803_LOG
End;

Procedure TFOrdenPago.GrabaDocumento(wgAccionDoc: String);
Var
   xsanio, xsNumeroDoc: String;
   xnItem: Integer;
   xnTasaIgv: Double;
// Inicio HPC_201803_LOG
// Se implementa para la solicitud de Orden de Pago
   xSQL1: String;
Begin
   If wgAccionDoc = 'CONSULTAR' Then
   Begin
      ShowMessage('El documento está en modo consulta, no se puede actualizar');
      Exit;
   End;
// Validando que exista la cabecera
   if (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'I') or (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'S') then
   begin
     If fg_ExisteCabecera(dblcCIA.Text,
        edtOrdenPago.Text, xCia, xNumOrdenCompra) = False Then
     Begin
        ShowMessage('Error, No se ha grabado correctamente la Cabecera de la Orden de Pago');
        Exit;
     End;
   end
   else
   begin
     If fg_ExisteCabecera(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString,
        edtOrdenPago.Text, xCia, xNumOrdenCompra) = False Then
     Begin
        ShowMessage('Error, No se ha grabado correctamente la Cabecera de la Orden de Pago');
        Exit;
     End;
   end;
   if (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'I') or (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'S') then
   begin
      DMLOG.cdsQry4.FieldbyName('CIAID').AsString := dblcCIA.Text;
   end
   else
   begin
      DMLOG.cdsQry4.FieldbyName('CIAID').AsString := DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString;
   end;
   DMLOG.cdsQry4.FieldbyName('NUMORDPAG').AsString := edtOrdenPago.Text;
   DMLOG.cdsQry4.FieldbyName('ODCCIAID').AsString := DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString;
   DMLOG.cdsQry4.FieldbyName('ODCID').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString;
   DMLOG.cdsQry4.FieldbyName('PROV').AsString := DMLOG.cdsOrdComp.FieldbyName('PROV').AsString;
   if (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'I') or (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'S') then
   begin
      DMLOG.cdsQry4.FieldbyName('CPCIAID').AsString := dblcCIA.Text;
   end
   else
   begin
      DMLOG.cdsQry4.FieldbyName('CPCIAID').AsString := DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString;
   end;
   DMLOG.cdsQry4.FieldbyName('USUREG').AsString := DMLOG.wUsuario;
   DMLOG.cdsQry4.FieldbyName('TMONID').AsString := DMLOG.cdsOrdComp.FieldbyName('TMONID').AsString;
   DMLOG.cdsQry4.FieldbyName('CPNODOC').AsString := dbeNumero.Text;
   If wgAccionDoc = 'AGREGAR' Then
   Begin
      if (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'I') or (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'S') then
      begin
        xSQL := ' CIAID = ' + QuotedStr(DMLOG.cdsQry4.FieldbyName('CIAID').AsString)
              + ' AND NUMORDPAG = ' + QuotedStr(edtOrdenPago.Text)
              + ' AND ODCCIAID = ' + QuotedStr(xCia)
              + ' AND ODCID = ' + QuotedStr(xNumOrdenCompra);
      end
      else
      begin
        xSQL := ' CIAID = ' + QuotedStr(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString)
         + ' AND NUMORDPAG = ' + QuotedStr(edtOrdenPago.Text)
         + ' AND ODCCIAID = ' + QuotedStr(xCia)
         + ' AND ODCID = ' + QuotedStr(xNumOrdenCompra);
      end;
      xnItem := StrToInt(DMLOG.DisplayDescrip('prvTGE', 'LOG130', 'TO_CHAR(NVL(MAX(ITEM)+1,1)) as F', xSQL, 'F'));

      xSQL := ' INSERT INTO LOG130 (CIAID,NUMORDPAG,ITEM,ODCCIAID,ODCID,PROV, '
         + '                        CPCIAID,DOCID,CPSERIE,CPNODOC,CPFRECEP,CPFEMIS,CPFVCMTO,TMONID, '
         + '                        CPTCAMPR,BASIMP,IGV,TOTAL,CCOSID,USUREG,FECREG,USUMOD,FECMOD,CPESTTRA,CPOBS)  '
         + '    VALUES(' + QuotedStr(DMLOG.cdsQry4.FieldbyName('CIAID').AsString) + ' , '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('NUMORDPAG').AsString) + ' , '
         + IntToStr(xnItem) + ', '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('ODCCIAID').AsString) + ', '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('ODCID').AsString) + ', '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('PROV').AsString) + ', '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('CPCIAID').AsString) + ', '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('DOCID').AsString) + ', '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('CPSERIE').AsString) + ', '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('CPNODOC').AsString) + ', '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('CPFEMIS').AsString) + ', '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('CPFEMIS').AsString) + ', '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('CPFVCMTO').AsString) + ', '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('TMONID').AsString) + ', '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('CPTCAMPR').AsString) + ', '
         + DMLOG.cdsQry4.FieldbyName('BASIMP').AsString + ', '
         + DMLOG.cdsQry4.FieldbyName('IGV').AsString + ', '
         + DMLOG.cdsQry4.FieldbyName('TOTAL').AsString + ', '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('CCOSID').AsString) + ', '
         + 'user ,'
         + 'sysdate ,'
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('USUMOD').AsString) + ', '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('FECMOD').AsString) + ', '
         + QuotedStr('REGISTRADO') + ', '
         + QuotedStr(DMLOG.cdsQry4.FieldbyName('CPOBS').AsString) + ')';
      xsAccionDoc := 'EDITAR';
   End
   Else
      If wgAccionDoc = 'EDITAR' Then
      Begin
         if (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'I') or (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'S') then
         begin
             xSQL := ' update LOG130 '
                + '       set CIAID = ' + QuotedStr(DMLOG.cdsQry4.FieldbyName('CIAID').AsString) + ', '
                + '           DOCID = ' + QuotedStr(dblcDocumento.Text) + ', '
                + '           CPSERIE = ' + QuotedStr(dbeSerie.Text) + ', '
                + '           CPNODOC = ' + QuotedStr(dbeNumero.Text) + ', '
                + '           CPFEMIS = ' + QuotedStr(dbdtpEmision.Text) + ', '
                + '           BASIMP = ' + DMLOG.cdsQry4.FieldbyName('BASIMP').AsString + ', '
                + '           IGV = ' + DMLOG.cdsQry4.FieldbyName('IGV').AsString + ', '
                + '           TOTAL = ' + DMLOG.cdsQry4.FieldbyName('TOTAL').AsString + ', '
                + '           CCOSID = ' + QuotedStr(DMLOG.cdsQry4.FieldbyName('CCOSID').AsString) + ', '
                + '           CPESTTRA = ' + QuotedStr('REGISTRADO') + ', '
                + '           USUMOD = USER ' + ', '
                + '           FECMOD = sysdate '
                + '     where CIAID = ' + QuotedStr(DMLOG.cdsQry3.FieldbyName('CIAID').AsString)
                + '       and NUMORDPAG = ' + QuotedStr(DMLOG.cdsQry4.FieldbyName('NUMORDPAG').AsString)
                + '       and ODCCIAID = ' + QuotedStr(xCia)
                + '       and ODCID = ' + QuotedStr(xNumOrdenCompra)
                + '       and ITEM = ' + DMLOG.cdsQry4.FieldbyName('ITEM').AsString;
         end
         else
         begin
             xSQL := ' update LOG130 '
                + '       set CIAID = ' + QuotedStr(DMLOG.cdsQry4.FieldbyName('CIAID').AsString) + ', '
                + '           DOCID = ' + QuotedStr(dblcDocumento.Text) + ', '
                + '           CPSERIE = ' + QuotedStr(dbeSerie.Text) + ', '
                + '           CPNODOC = ' + QuotedStr(dbeNumero.Text) + ', '
                + '           CPFEMIS = ' + QuotedStr(dbdtpEmision.Text) + ', '
                + '           BASIMP = ' + DMLOG.cdsQry4.FieldbyName('BASIMP').AsString + ', '
                + '           IGV = ' + DMLOG.cdsQry4.FieldbyName('IGV').AsString + ', '
                + '           TOTAL = ' + DMLOG.cdsQry4.FieldbyName('TOTAL').AsString + ', '
                + '           CCOSID = ' + QuotedStr(DMLOG.cdsQry4.FieldbyName('CCOSID').AsString) + ', '
                + '           CPESTTRA = ' + QuotedStr('REGISTRADO') + ', '
                + '           USUMOD = USER ' + ', '
                + '           FECMOD = sysdate '
                + '     where CIAID = ' + QuotedStr(DMLOG.cdsQry4.FieldbyName('CIAID').AsString)
                + '       and NUMORDPAG = ' + QuotedStr(DMLOG.cdsQry4.FieldbyName('NUMORDPAG').AsString)
                + '       and ODCCIAID = ' + QuotedStr(xCia)
                + '       and ODCID = ' + QuotedStr(xNumOrdenCompra)
                + '       and ITEM = ' + DMLOG.cdsQry4.FieldbyName('ITEM').AsString;
         end;
      End;

   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('error');
   End;
      // Inicio HPC_201701_LOG
      // Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.

/////////////////////////////////////////////////////////////////////////////////////////////////////////
     {
      If ((length(dblcDocumento.Text) = 0) Or (length(dbeSerie.Text) = 0)
         Or (length(dbeNumero.Text) = 0) Or (length(dbdtpEmision.Text) = 0)
         Or (length(dbeTotal.Text) = 0)) Then
      Begin
         ShowMessage('Faltan Ingresar datos de Solicitud');
         dblcDocumento.setFocus;
         exit;
      End;
      }
   If wgAccionDoc = 'AGREGAR' Then
   Begin
     If ((length(dblcBanco.Text) > 0) Or (length(dblcTMon.Text) > 0)
        Or ((length(dbeCtaCte.Text) > 0) And (length(dbeCodCtaInt.Text) > 0))) Then
     Begin
        xSQL1 := ' update LOG130 '
           + '       set BANCOID = ' + QuotedStr(dblcBanco.Text) + ', '
           + '           BANCOTMONID = ' + QuotedStr(dblcTMon.Text) + ', '
           + '           BANCONUMCTA = ' + QuotedStr(dbeCtaCte.Text) + ', '
           + '           BANCOCCI = ' + QuotedStr(dbeCodCtaInt.Text) + ', '
           + '           USUMOD = ' + QuotedStr(DMLOG.wUsuario) + ', '
           + '           FECMOD = sysdate '
           + '     where CIAID = ' + QuotedStr(DMLOG.cdsQry4.FieldbyName('CIAID').AsString)
           + '       and NUMORDPAG = ' + QuotedStr(DMLOG.cdsQry4.FieldbyName('NUMORDPAG').AsString)
           + '       and ODCCIAID = ' + QuotedStr(xCia)
           + '       and ODCID = ' + QuotedStr(xNumOrdenCompra)
           + '       and ITEM = ' + IntToStr(xnItem);
        Try
           DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL1);
        Except
           ShowMessage('Error al Actualizar Datos de la Cuenta Bancaria');
        End;
     End;
   end
   else
   begin
     If ((length(dblcBanco.Text) > 0) Or (length(dblcTMon.Text) > 0)
        Or ((length(dbeCtaCte.Text) > 0) And (length(dbeCodCtaInt.Text) > 0))) Then
     Begin
        xSQL1 := ' update LOG130 '
           + '       set BANCOID = ' + QuotedStr(dblcBanco.Text) + ', '
           + '           BANCOTMONID = ' + QuotedStr(dblcTMon.Text) + ', '
           + '           BANCONUMCTA = ' + QuotedStr(dbeCtaCte.Text) + ', '
           + '           BANCOCCI = ' + QuotedStr(dbeCodCtaInt.Text) + ', '
           + '           USUMOD = ' + QuotedStr(DMLOG.wUsuario) + ', '
           + '           FECMOD = sysdate '
           + '     where CIAID = ' + QuotedStr(DMLOG.cdsQry4.FieldbyName('CIAID').AsString)
           + '       and NUMORDPAG = ' + QuotedStr(DMLOG.cdsQry4.FieldbyName('NUMORDPAG').AsString)
           + '       and ODCCIAID = ' + QuotedStr(xCia)
           + '       and ODCID = ' + QuotedStr(xNumOrdenCompra)
           + '       and ITEM = ' + DMLOG.cdsQry4.FieldbyName('ITEM').AsString;
        Try
           DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL1);
        Except
           ShowMessage('Error al Actualizar Datos de la Cuenta Bancaria');
        End;
     End;
   end;
/////////////////////////////////////////////////////////////////////////////////////////////////////////

   If wgAccionDoc = 'AGREGAR' Then
   Begin
      ShowMessage('Grabación realizada con éxito');
   End;
   If wgAccionDoc = 'EDITAR' Then
   Begin
      ShowMessage('Actualización realizada con éxito');
   End;
      // Fin HPC_201701_LOG
// Fin HPC_201803_LOG
End;

Procedure TFOrdenPago.ActualizaSaldoOC(ps_OCCiaId, ps_NumOC: String);
Begin
   xSQL := ' Update LOG304 '
      + '       set LOG304.ORDPAGTOT = (Select SUM(LOG130.TOTAL) FROM LOG130, LOG131 '
      + '                                where LOG130.CIAID = LOG131.CIAID '
      + '                                  and LOG130.NUMORDPAG = LOG131.NUMORDPAG '
      + '                                  and LOG130.ODCCIAID = LOG131.ODCCIAID '
      + '                                  and LOG130.ODCID = LOG131.ODCID '
      + '                                  and LOG130.ODCCIAID = LOG304.CIAID '
      + '                                  and LOG130.ODCID =  LOG304.ODCID '
      + '                                  and LOG130.CPESTTRA <>' + QuotedStr('ANULADO') + ' ), '
      + '           LOG304.ORDPAGEST  = ' + QuotedStr('INICIAL')
      + '     where LOG304.CIAID = ' + QuotedStr(ps_OCCiaId)
      + '       and LOG304.ODCID = ' + QuotedStr(ps_NumOC);
   DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);

   xSQL := ' Update LOG304 '
      + '       set LOG304.ORDPAGPEN = LOG304.ODCTOTALG - LOG304.ORDPAGTOT '
      + '     where LOG304.CIAID = ' + QuotedStr(ps_OCCiaId)
      + '       and LOG304.ODCID = ' + QuotedStr(ps_NumOC);
   DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
End;

Procedure TFOrdenPago.ActualizaTotalOrdenPago(wgCiaId, wgNumOrdPago: String);
Begin
   xSQL := ' Update LOG131 '
      + '       set (LOG131.BASEIMP ,LOG131.IGV, LOG131.TOTAL ) = '
      + '               (select sum(LOG130.BASIMP), sum(LOG130.IGV), sum(LOG130.TOTAL) '
      + '                  from LOG130 '
      + '                 where LOG131.CIAID = LOG130.CIAID '
      + '                   and LOG131.NUMORDPAG = LOG130.NUMORDPAG '
      + '                   and LOG131.ODCCIAID = LOG130.ODCCIAID '
      + '                   and LOG131.ODCID = LOG131.ODCID) '
      + '     where LOG131.CIAID = ' + QuotedStr(wgCiaId)
      + '       and LOG131.NUMORDPAG = ' + Quotedstr(wgNumOrdPago)
      + '       and LOG131.ODCCIAID = ' + QuotedStr(xCia)
      + '       and LOG131.ODCID = ' + QuotedStr(xNumOrdenCompra);
   DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
End;

Procedure TFOrdenPago.RecuperaCabecera(ps_OCCiaId, ps_NumOC: String);
Begin

   xSQL := 'Select * '
      + '     from LOG304 '
      + '    where CIAID = ' + QuotedStr(ps_OCCiaId)
      + '      and ODCID = ' + QuotedStr(ps_NumOC);
   DMLOG.cdsOrdComp.Close;
   DMLOG.cdsOrdComp.DataRequest(xSQL);
   DMLOG.cdsOrdComp.Open;

   dbePendiente.Text := '';
   If (DMLOG.cdsOrdComp.RecordCount = 0) And (ps_NumOC <> '') Then
   Begin
      ShowMessage('No existe la Orden de Compra para el proveedor seleccionado');
      Exit;
   End;
   DescripcionCabecera;
// verificando si la Orden de Compra está Completada
   If DMLOG.cdsOrdComp.FieldbyName('ORDPAGEST').AsString = 'COMPLETADO' Then
   Begin
      btnAdiccionaOrdenPago.Enabled := False;
      Z2bbtnCierraOP.Enabled := False;
   End;
End;

Procedure TFOrdenPago.DescripcionCabecera;
Begin
   If DMLOG.cdsOrdComp.FieldbyName('ORDPAGEST').AsString = 'INICIAL' Then
   Begin
      btnAceptaOrdenPago.Enabled := True;
      btnCerrarOrdenPago.Enabled := True;
   End
   Else
   Begin
      btnAceptaOrdenPago.Enabled := False;
      btnCerrarOrdenPago.Enabled := False;
   End;

   dblcTMonedaExit(dblcTMoneda);
   dblcFPagoExit(dblcFPago);
   If DMLOG.cdsOrdComp.FieldbyName('ORDPAGTOT').AsString <> '' Then
   Begin
      dbePendiente.Text := FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').Value - DMLOG.cdsOrdComp.FieldbyName('ORDPAGTOT').Value);
   End
   Else
   Begin
      dbePendiente.Text := FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').Value);
   End;
End;

Procedure TFOrdenPago.RecuperaDocumento(wgCiaid, wgNumOrdPago: String; wgItem: Integer);
Begin
   xSQL := 'Select * '
      + '     from LOG130 '
      + '    where LOG130.CIAID = ' + QuotedStr(wgCiaid)
      + '      and LOG130.NUMORDPAG = ' + QuotedStr(wgNumOrdPago)
      + '      and LOG130.ITEM = ' + IntToStr(wgItem)
      + '      and LOG130.ODCCIAID = ' + QuotedStr(xCia)
      + '      and LOG130.ODCID = ' + QuotedStr(xNumOrdenCompra);
   DMLOG.cdsQry4.Close;
   DMLOG.cdsQry4.DataRequest(xSQL);
   DMLOG.cdsQry4.Open;
   DMLOG.cdsQry4.Edit;
// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
   dblcDocumentoExit(dblcDocumento);

   dblcBanco.Text := DMLOG.cdsQry4.FieldbyName('BANCOID').AsString;
   dblcBancoExit(Self);
   dblcTMon.Text := DMLOG.cdsQry4.FieldbyName('BANCOTMONID').AsString;
   dblcTMonExit(Self);
   dbeCtaCte.Text := DMLOG.cdsQry4.FieldbyName('BANCONUMCTA').AsString;
   dbeCodCtaInt.Text := DMLOG.cdsQry4.FieldbyName('BANCOCCI').AsString;
// Inicio HPC_201803_LOG
// Se incluye el componente para utilizarlo en la solicitud de Orden de Pago
   if (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'I') or (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'S') then
   begin
       dblcCIA.text := DMLOG.cdsQry4.FieldbyName('CIAID').AsString;
       dblcCIAExit(Self);
       dblcdCCosto.Text := DMLOG.cdsQry4.FieldbyName('CCOSID').AsString;
       dblcdCCostoExit(Self);
   end;
// Fin HPC_201803_LOG
   dblcBanco.Enabled := false;
   dbeBanco.Enabled := false;
   dblcTMon.Enabled := false;
   edtTMon.Enabled := false;
   dbeCtaCte.Enabled := false;
   dbeCodCtaInt.Enabled := false;
   pnlDocumento.Visible := True;
// Fin HPC_201701_LOG

End;

Procedure TFOrdenPago.RecuperaOrdenPago(wgCiaId, wgNumOrdPago: String);
Begin
   xSQL := ' CIAID = ' + QuotedStr(wgCiaId) + ' AND NUMORDPAG = ' + QuotedStr(wgNumOrdPago);
   edtOrdenPago.Text := DMLOG.DisplayDescrip('prvTGE', 'LOG131', 'NUMORDPAG,FECHA,ESTADO,TOTAL ', xSQL, 'NUMORDPAG');
   dtpFecha.Date := DMLOG.cdsQry.FieldbyName('FECHA').AsDateTime;
   edtEstado.Text := DMLOG.cdsQry.FieldbyName('ESTADO').AsString;
   edtTotalOrdenPago.Text := DMLOG.cdsQry.FieldbyName('TOTAL').AsString;
   edtSaldoOC.Text := DMLOG.cdsOrdComp.FieldbyName('ORDPAGPEN').AsString;
// mostrando el estado de la Orden de Pago
   edtEstadoOrdenPago.Text := DMLOG.cdsQry.FieldbyName('ESTADO').AsString;

   If DMLOG.cdsQry.FieldbyName('ESTADO').AsString = 'ACEPTADO' Then
   Begin
      edtEstadoOrdenPago.Font.Color := clBlue;
   End
   Else
      If DMLOG.cdsQry.FieldbyName('ESTADO').AsString = 'ANULADO' Then
      Begin
         edtEstadoOrdenPago.Font.Color := clRed;
      End
      Else
      Begin
         edtEstadoOrdenPago.Font.Color := clGreen;
      End;

   xSQL := ' Select LOG130.DOCID, '
      + '          (Select TGE110.DOCDES '
      + '             from TGE110 '
      + '            where TGE110.DOCID = LOG130.DOCID  '
      + '              and TGE110.DOCMOD IN (' + QuotedStr('CXP') + ',' + QuotedStr('LOG') + ')) DOCID_DES, '
      + '           LOG130.CPSERIE, '
      + '           LOG130.CPNODOC,  '
      + '           LOG130.TOTAL,  '
      + '           LOG130.CPFEMIS,  '
      + '           LOG130.CPESTTRA,  '
      + '           LOG130.ITEM, '
      + '           LOG130.CIAID, '
      + '           LOG130.NUMORDPAG, '
// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
   + '           LOG130.BANCOID, '
      + '           LOG130.BANCOTMONID, '
      + '           LOG130.BANCONUMCTA, '
      + '           LOG130.BANCOCCI '
// Fin HPC_201701_LOG
   + '      from LOG130'
      + '     where LOG130.CIAID =  ' + QuotedStr(wgCiaId)
      + '       and LOG130.NUMORDPAG =  ' + QuotedStr(wgNumOrdPago)
      + '       and LOG130.ODCCIAID =  ' + QuotedStr(xCia)
      + '       and LOG130.ODCID =  ' + QuotedStr(xNumOrdenCompra)
      + '     order by LOG130.NUMORDPAG, LOG130.CPFEMIS ';
   DMLOG.cdsQry3.Close;
   DMLOG.cdsQry3.DataRequest(xSQL);
   DMLOG.cdsQry3.Open;

End;

Procedure TFOrdenPago.RecuperarDetalle(ps_OCCiaId, ps_NumOC: String);
Begin
   xSQL := ' Select LOG130.NUMORDPAG, LOG131.ESTADO , '
      + '           LOG130.CPCIAID, '
      + '           LOG130.DOCID, '
      + '           (Select TGE110.DOCDES '
      + '              from TGE110 '
      + '             where TGE110.DOCID = LOG130.DOCID  '
      + '               and TGE110.DOCMOD IN (' + QuotedStr('CXP') + ',' + QuotedStr('LOG') + ')) DOCID_DES, '
      + '           LOG130.CPSERIE, '
      + '           LOG130.CPNODOC,  '
      + '           LOG130.PROV,  '
      + '           LOG130.TMONID,  '
      + '           LOG130.BASIMP,  '
      + '           LOG130.IGV,  '
      + '           LOG130.TOTAL,  '
      + '           LOG130.CPFEMIS,  '
      + '           LOG130.CPOBS, '
      + '           LOG130.CPFRECEP,  '
      + '           LOG130.CPESTTRA,  '
      + '           LOG130.CPFECTRA,  '
      + '           LOG130.CPUSUTRA,  '
      + '           LOG130.CIAID, '
      + '           LOG130.ITEM, '
// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
   + '           LOG130.BANCOID, '
      + '           LOG130.BANCOTMONID, '
      + '           LOG130.BANCONUMCTA, '
      + '           LOG130.BANCOCCI '
// Fin HPC_201701_LOG
   + '      from LOG130, LOG131  '
      + '     where LOG130.CIAID = LOG131.CIAID '
      + '       and LOG130.NUMORDPAG = LOG131.NUMORDPAG '
      + '       and LOG130.ODCCIAID = LOG131.ODCCIAID '
      + '       and LOG130.ODCID = LOG131.ODCID '
      + '       and LOG130.ODCCIAID =  ' + QuotedStr(ps_OCCiaId)
      + '       and LOG130.ODCID =  ' + QuotedStr(ps_NumOC)
      + '     Order by LOG130.NUMORDPAG, LOG130.CPFEMIS ';
   DMLOG.cdsQry12.Close;
   DMLOG.cdsQry12.DataRequest(xSQL);
   DMLOG.cdsQry12.Open;
End;

Function TFOrdenPago.ValidaPanel: Boolean;
Var
   ls_mensaje, xsNumeroDoc: String;
   xsItem: String;
Begin
   If dblcDocumento.Text = '' Then
   Begin
      ShowMessage('Debe Ingresar el Tipo de Documento');
      Result := False;
      Exit;
   End;
   If dbeSerie.Text = '' Then
   Begin
      ShowMessage('Debe Ingresar el Número de Serie del Documento');
      Result := False;
      Exit;
   End;

// quitando ceros al número de documento
   xsNumeroDoc := dbeNumero.Text;
   While (length(xsNumeroDoc) > 1) And (Copy(xsNumeroDoc, 1, 1) = '0') Do
      delete(xsNumeroDoc, 1, 1);
   dbeNumero.Text := xsNumeroDoc;

   If dbeNumero.Text = '' Then
   Begin
      ShowMessage('Debe Ingresar el Número del Documento');
      Result := False;
      Exit;
   End;

   If dbdtpEmision.Text = '' Then
   Begin
      ShowMessage('Debe Ingresar la Fecha de Emisión del Documento');
      Result := False;
      Exit;
   End;

   If DMLOG.cdsQry4.FieldbyName('CPFEMIS').Value > date Then
   Begin
      ShowMessage('La fecha del documento no puede ser superior a Hoy');
      Result := False;
      Exit;
   End;

   If (dbeTotal.text = '') Then
   Begin
      ShowMessage('Debe Ingresar el Total del documento');
      Result := False;
      Exit;
   End;
// Inicio HPC_201803_LOG
// Se implementa debido a la solicitud de Orden de Pago
   if (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'I') or (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'S') then
   begin
     If dblcCIA.Text = '' Then
     Begin
        ShowMessage('Debe Ingresar la Compañia');
        Result := False;
        Exit;
     End;

     If dblcdCCosto.Text = '' Then
     Begin
        ShowMessage('Debe Ingresar el Centro de Costo');
        Result := False;
        Exit;
     End;
   end;
// Fin HPC_201803_LOG
   Try
   // Inicio : HPC_201305_LOG
      If xgDocResta = 'S' Then
      Begin
         If strToFloat(dbeTotal.text) >= 0 Then
         Begin
            ShowMessage('El documento ' + dblcDocumento_des.text + ' debe ser ingresado con un valor negativo');
            Result := False;
            Exit;
         End;
      End
      Else
      Begin
         If strToFloat(dbeTotal.text) <= 0 Then
         Begin
            ShowMessage('El Monto debe ser mayor a Cero');
            Result := False;
            Exit;
         End;
      End;
   // Fin : HPC_201305_LOG
   Except
      ShowMessage('Ingrese un valor válido como total del documento');
      Result := False;
      Exit;
   End;

   //validando el documento
   If DMLOG.cdsQry4.Recordcount > 0 Then
      xsItem := DMLOG.cdsQry4.FieldbyName('ITEM').AsString
   Else
      xsItem := '0';

   xSQL := ' Select LOG130.NUMORDPAG, LOG130.ODCID '
      + '      from LOG130  '
      + '     where LOG130.PROV = ' + QuotedStr(dblcdProv.Text)
      + '       and LOG130.DOCID = ' + QuotedStr(dblcDocumento.Text)
      + '       and LOG130.CPSERIE = ' + QuotedStr(dbeSerie.Text)
      + '       and LOG130.CPNODOC = ' + QuotedStr(dbeNumero.Text)
      + '       and LOG130.CPESTTRA <> ' + QuotedStr('ANULADO')
      + '       and LOG130.NUMORDPAG||TO_CHAR(LOG130.ITEM) <> ' + QuotedStr(edtOrdenPago.Text + xsItem);
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      ls_mensaje := 'El Documento : ' + dblcDocumento_des.Text + #13
         + 'Número: ' + dbeSerie.Text + '-' + dbeNumero.Text + #13
         + 'ya fue registrado en la Orden de Compra :' + DMLOG.cdsQry.FieldbyName('ODCID').AsString + #13
         + 'y tiene el Nº de Orden de Pago: ' + DMLOG.cdsQry.FieldbyName('NUMORDPAG').AsString;
      ShowMessage(ls_mensaje);
      Result := False;
      Exit;
   End;

// valida si el documento ya fue provisionado
   xSQL := ' select CXP301.CIAID ||' + QuotedStr('-') + '|| CXP301.CPANOMES ||' + QuotedStr('-') + ' ||CXP301.CPNOREG  NUMERO_CXP'
      + '      from CXP301 '
      + '     where CXP301.PROV = ' + QuotedStr(dblcdProv.Text)
      + '       and CXP301.DOCID = ' + QuotedStr(dblcDocumento.Text)
      + '       and CXP301.CPSERIE = ' + QuotedStr(dbeSerie.Text)
      + '       and CXP301.CPNODOC = ' + QuotedStr(dbeNumero.Text)
      + '       and CXP301.CPESTADO <> ' + QuotedStr('E');
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      ls_mensaje := 'El Documento : ' + dblcDocumento_des.Text + #13
         + 'Número: ' + dbeSerie.Text + '-' + dbeNumero.Text + #13
         + 'ya fue provisionado :' + DMLOG.cdsQry.FieldbyName('NUMERO_CXP').AsString;
      ShowMessage(ls_mensaje);
      Result := False;
      Exit;
   End;

// Validando el saldo de la Orden de Compra
   xsItem := DMLOG.cdsQry4.FieldbyName('ITEM').AsString;
   xSQL := ' select LOG304.ODCTOTALG '
      + '         - NVL((select SUM(LOG130.TOTAL) '
      + '                  from LOG130 '
      + '                 where LOG130.ODCCIAID = LOG304.CIAID  '
      + '                   and LOG130.ODCID =  LOG304.ODCID '
      + '                   and LOG130.CPESTTRA <> ' + QuotedStr('ANULADO')
      + '                   and LOG130.NUMORDPAG||LOG130.ITEM <> '
      + '                             NVL(' + QuotedStr(edtOrdenPago.Text + xsItem) + ',' + QuotedStr('X') + ') ),0) SALDO '
      + '      from LOG304 '
      + '     where LOG304.CIAID = ' + QuotedStr(xCia)
      + '       and LOG304.ODCID = ' + QuotedStr(xNumOrdenCompra);
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;

// como máximo el total de documentos puede superar en 1 sol a la Orden de Compra
   If StrToFloat(DMLOG.cdsQry.FieldbyName('SALDO').AsString) - StrToFloat(dbeTotal.Text) < -1.00 Then
   Begin
      ls_mensaje := 'El Total de las Ordenes de Pago no puede ' + #13
         + 'superar al total de la Orden de Compra';
      ShowMessage(ls_mensaje);
      Result := False;
      Exit;
   End;

// Verifica si desea cambiar el estado ACEPTADO  a INICIAL
   If DMLOG.cdsQry3.FieldbyName('CPESTTRA').AsString = 'ACEPTADO' Then
   Begin
      ls_mensaje := 'La Orden de Pago pasará a estado INICIAL ' + #13
         + 'Desea continuar?';
      If MessageDlg(ls_mensaje, mtconfirmation, [mbYes, mbNo], 0) = mrNo Then
      Begin
         Result := False;
         Exit;
      End;
   End;
   Result := True;
End;

Procedure TFOrdenPago.FormShow(Sender: TObject);
Begin
   Asignalookup;
   AsignaDataSource;

   pnlDocumento.Visible := False;
   pnlOrdenPago.Visible := False;

   If DMLOG.wModo = 'A' Then
   Begin
      RecuperaCabecera('', '');
      RecuperarDetalle('', '');
      DMLOG.cdsOrdComp.Edit;
      DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString := '02';
   End
   Else
      If DMLOG.wModo = 'M' Then
      Begin
         xCia := DMLOG.cdsQry10.FieldbyName('OC_COMPANIA').AsString;
         xNumOrdenCompra := DMLOG.cdsQry10.FieldbyName('ODCID').AsString;
         RecuperaCabecera(xCia, xNumOrdenCompra);
         RecuperarDetalle(xCia, xNumOrdenCompra);
         BloqueaCabecera;
      End
      Else
         If DMLOG.wModo = 'OC' Then // está siendo invocado desde Orden de Compra
         Begin
            xCia := DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString;
            xNumOrdenCompra := DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString;
            RecuperaCabecera(xCia, xNumOrdenCompra);
            DescripcionCabecera;
            RecuperarDetalle(xCia, xNumOrdenCompra);
            BloqueaCabecera;
         End;
   Asignalookup;
End;

Procedure TFOrdenPago.dblcdProvExit(Sender: TObject);
Begin
   xSQL := 'PROV=' + quotedstr(dblcdProv.Text);
   If dblcdProv.Text = '' Then
   Begin
      dblcdProv_des.Text := '';
      exit;
   End;

   If dblcdProv.text <> '' Then
   Begin
      dblcdProv_des.text := DMLOG.DisplayDescrip('prvTGE', 'TGE201', 'PROVDES, CLAUXID', xSQL, 'PROVDES');
      If dblcdProv_des.text = '' Then
      Begin
         showmessage('Ingrese una Proveedor válido');
         dblcdProv.SetFocus;
         exit;
      End;
      xgClaseAux := DMLOG.cdsQry.FieldByName('CLAUXID').AsString;

      xSQL := 'Select * '
         + '     from LOG304 '
         + '    where CIAID = ' + QuotedStr(xCia)
         + '      and NVL(ORDPAGEST,' + QuotedStr('X') + ') NOT IN (' + QuotedStr('COMPLETADO') + ',' + QuotedStr('CERRADO') + ')'
         + '      and ODCEST IN (' + QuotedStr('ATENDIDO') + ',' + QuotedStr('ACEPTADO') + ',' + QuotedStr('PARCIAL') + ')'
         + '      and PROV = ' + QuotedStr(dblcdProv.Text);
      DMLOG.cdsQry7.Close;
      DMLOG.cdsQry7.DataRequest(xSQL);
      DMLOG.cdsQry7.Open;
      If DMLOG.cdsQry7.RecordCount = 0 Then
      Begin
         ShowMessage('No se encontraró Ordenes de Compra para el Proveedor Seleccionado');
         Exit;
      End;
   End;
End;

Procedure TFOrdenPago.dblcdOrdenCompraExit(Sender: TObject);
Begin
   If dblcdOrdenCompra.Text = '' Then
   Begin
      Exit;
   End;
   RecuperaCabecera(xCia, dblcdOrdenCompra.Text);
   RecuperarDetalle(xCia, dblcdOrdenCompra.Text);

End;

Procedure TFOrdenPago.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMLOG.cdsQry7.Close;
   DMLOG.cdsQry4.Close;
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry3.Close;
   FOrdenPago.Free;
End;

Procedure TFOrdenPago.btnAdiccionaOrdenPagoClick(Sender: TObject);
Var
   xsMensaje: String;
Begin
// verificar que no exista una orden de pago en estado inicial
   xSQL := ' Select LOG131.NUMORDPAG'
      + '      from LOG131 '
      + '     where LOG131.ODCCIAID = ' + QuotedStr(xCia)
      + '       and LOG131.ODCID = ' + QuotedStr(xNumOrdenCompra)
      + '       and LOG131.ESTADO = ' + QuotedStr('INICIAL');
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      xsMensaje := 'Para poder registrar una nueva Orden de Pago' + #13
         + 'La Orden de Compra no debe tener Ordenes de Pago en estado INICIAL';
      ShowMessage(xsMensaje);
      Exit;
   End;

   xsAccionOrdenPago := 'AGREGAR';
   If pnlOrdenPago.Visible = True Then
   Begin
      Exit;
   End;
   pnlOrdenPago.Visible := True;

   PanelOrdenPagoDefault;
   Exit;
End;

Procedure TFOrdenPago.dblcTMonedaExit(Sender: TObject);
Begin
   If dblcTMoneda.Text = '' Then
   Begin
      dblcTMoneda_des.Text := '';
      Exit;
   End;
   If dblcTMoneda.Text <> '' Then
   Begin
      dblcTMoneda_des.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE103', 'TMONDES', 'TMONID=' + quotedStr(dblcTMoneda.text), 'TMONDES');
   End;
End;

Procedure TFOrdenPago.dblcFPagoExit(Sender: TObject);
Begin
   If dblcFPago.Text = '' Then
   Begin
      dblcFPago_des.Text := '';
      Exit;
   End;
   If dblcFPago.Text <> '' Then
   Begin
      dblcFPago_des.Text := DMLOG.DisplayDescrip('prvSQL', 'CXC101', 'CCOMERDES', 'CIAID=''' + xCIA + ''' AND CCOMERID=' + quotedStr(dblcFPago.Text), 'CCOMERDES');
   End;
End;

Procedure TFOrdenPago.dblcDocumentoExit(Sender: TObject);
Begin
// Inicio HPC_201803_LOG
// Se implementa para la solicitud de Orden de Pago
   xSQL := 'DOCID=' + quotedstr(dblcDocumento.Text);
   If (dblcDocumento.text <> '') Then
   Begin
      dblcDocumento_des.text := DMLOG.DisplayDescrip('prvTGE', 'TGE110', 'DOCDES, DOCRESTA,DTRAFECTO', xSQL, 'DOCDES');
   End;
// xgDocResta := DMLOG.cdsQry.FieldByName('DOCRESTA').AsString;
// Fin HPC_201803_LOG
End;

Procedure TFOrdenPago.bbtnRetiraCodBarraClick(Sender: TObject);
Begin
   LimpiaPanelDocumento;
   pnlDocumento.Visible := False;
End;

Procedure TFOrdenPago.bbtnAdicionaDocumentoClick(Sender: TObject);
Begin
   If ValidaPanel = False Then
   Begin
      Exit;
   End;

// graba orden de pago
   GrabaOrdenPago(xsAccionOrdenPago);

// graba documento
   GrabaDocumento(xsAccionDoc);
// Inicio HPC_201803_LOG
// Se implementa debido a la solicitud de Orden de Pago
   if (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'I') or (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'S') then
   begin
       ActualizaTotalOrdenPago(dblcCIA.Text, edtOrdenPago.Text);
       ActualizaSaldoOC(xCia, dblcdOrdenCompra.Text);

       RecuperaCabecera(xCia, xNumOrdenCompra);
       RecuperarDetalle(xCia, xNumOrdenCompra);
       RecuperaOrdenPago(dblcCIA.Text, edtOrdenPago.Text);
    // Inicio HPC_201701_LOG
    // Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
       RecuperaDocumento(dblcCIA.Text, DMLOG.cdsQry3.FieldbyName('NUMORDPAG').AsString, DMLOG.cdsQry3.FieldbyName('ITEM').AsInteger);
   end
   else
   begin
       ActualizaTotalOrdenPago(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString, edtOrdenPago.Text);
       ActualizaSaldoOC(xCia, dblcdOrdenCompra.Text);
       RecuperaCabecera(xCia, xNumOrdenCompra);
       RecuperarDetalle(xCia, xNumOrdenCompra);
       RecuperaOrdenPago(xCia, edtOrdenPago.Text);
       RecuperaDocumento(DMLOG.cdsQry3.FieldbyName('CIAID').AsString, DMLOG.cdsQry3.FieldbyName('NUMORDPAG').AsString, DMLOG.cdsQry3.FieldbyName('ITEM').AsInteger);
   end;
   //LimpiaPanelDocumento;

// Fin HPC_201701_LOG
   BloqueaPanelOP(True);
   pnlDocumento.Visible := False;
// Fin HPC_201803_LOG   
End;

Procedure TFOrdenPago.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFOrdenPago.dbeTotalExit(Sender: TObject);
Var
   ld_tasaIgv, ld_Igv, ld_BaseImponible, ld_total: double;
   ld_temp: Double;
Begin
   If dbeTotal.Text = '' Then
   Begin
      Exit;
   End;
   Try
      If dbeTotal.Text <> '' Then
      Begin
         ld_temp := StrToFloat(dbeTotal.Text);
      End;
   Except
      ShowMessage('Ingrese valor Válido para el Total del Documento');
      dbeTotal.SetFocus;
   End;

   ld_tasaIgv := StrToFloat(DMLOG.DisplayDescrip('prvTGE', 'TGE108', 'TASACAN', 'TASAFLG=' + QuotedStr('I'), 'TASACAN'));
   ld_total := FRound(StrToFloat(dbeTotal.Text), 15, 4);
   ld_BaseImponible := FRound(ld_total / (1 + (ld_tasaIgv / 100)), 15, 4);
   ld_Igv := ld_total - ld_BaseImponible;
   DMLOG.cdsQry4.FieldbyName('BASIMP').AsString := FloatToStr(ld_BaseImponible);
   DMLOG.cdsQry4.FieldbyName('IGV').AsString := FloatToStr(ld_Igv);
   DMLOG.cdsQry4.FieldbyName('TOTAL').AsString := FloatToStr(ld_total);
End;

Procedure TFOrdenPago.dbeSerieExit(Sender: TObject);
Var
   ld_temp: Double;
Begin
End;

Procedure TFOrdenPago.dbeNumeroExit(Sender: TObject);
Var
   ld_temp: Double;
Begin
End;

Procedure TFOrdenPago.Z2bbtnImprimeClick(Sender: TObject);
Var
   ls_labelCerrado, ls_observacionCerrado, ls_where: String;
Begin
   If dblcdOrdenCompra.Text = '' Then
   Begin
      exit;
   End;

// Obteniendo Observación en el caso de OC cerradas
   If DMLOG.cdsOrdComp.FieldbyName('ORDPAGEST').AsString = 'CERRADO' Then
   Begin
      ls_where := ' ODCCIAID = ' + QuotedStr(xCia)
         + ' AND ODCID = ' + QuotedStr(dblcdOrdenCompra.Text)
         + ' AND DOCID = ' + QuotedStr('73');
      ls_labelCerrado := 'OBSERVACION DE CIERRE:';
      ls_observacionCerrado := DMLOG.DisplayDescrip('prvTGE', 'LOG130', 'CPOBS', ls_where, 'CPOBS');

   End
   Else
   Begin
      ls_labelCerrado := ' ';
      ls_observacionCerrado := ' ';
   End;

// Inicio HPC_201305_LOG
// Se incluye Clase de Auxiliar en la búsqueda el RUC del Proveedor
   xSQL := ' Select LOG304.CIAID COMPANIA, '
      + '          (Select TGE101.CIADES from TGE101 where TGE101.CIAID = LOG304.CIAID) COMPANIA_DES, '
      + '           LOG304.PROV PROVEEDOR, '
      + '          (Select TGE201.PROVRUC from TGE201 where TGE201.CLAUXID=' + quotedstr(xgClaseAux) + ' and TGE201.PROV = LOG304.PROV) PROVEEDOR_RUC, '
      + '           LOG304.PROVDES PROVEEDOR_DES, '
      + '           LOG304.TMONID MONEDA, '
      + '          (Select TGE103.TMONDES from TGE103 where LOG304.TMONID = TGE103.TMONID) MONEDA_DES, '
      + '           LOG304.ODCID OC_NUMERO, '
      + '           LOG304.ODCFEMI OC_FECHAEMI, '
      + '           LOG304.ODCOBS OC_OBSERVACION, '
      + '           LOG304.ODCTOTALG OC_TOTAL, '
      + '           LOG304.ORDPAGEST OC_ESTADOORDENPAGO, '
      + '           LOG304.ORDPAGTOT OC_TOTALORDENPAGO, '
      + '           LOG304.TIPOADQ OC_TIPOADQUISICION, '
      + '          (Select TGE173.TIPADQDES from TGE173 where TGE173.TIPOADQ = LOG304.TIPOADQ) OC_TIPOADQUISICION_DES, '
      + '           LOG304.CCOMERID OC_COMERCIAL, '
      + '          (Select CXC101.CCOMERDES from CXC101 where CXC101.CIAID = LOG304.CIAID AND CXC101.CCOMERID = LOG304.CCOMERID) OC_COMERCIAL_DES, '
      + '           LOG130.NUMORDPAG ORDENPAGO, '
      + '           LOG130.CPCIAID CXP_COMPANIA, '
      + '           LOG130.DOCID CXP_DOCUMENTO, '
      + '          (Select TGE110.DOCDES FROM TGE110 WHERE LOG130.DOCID = TGE110.DOCID) CXP_DOCUMENTO_DES, '
      + '           LOG130.CPOBS OBSERVACION, '
      + '           LOG130.CPSERIE CXP_SERIE, '
      + '           LOG130.CPNODOC CXP_NUMERO, '
      + '           LOG130.CPFRECEP CXP_RECEPCION, '
      + '           LOG130.CPFEMIS CXP_EMISION, '
      + '           LOG130.BASIMP CXP_BIMPONIBLE, '
      + '           LOG130.IGV CXP_IGV, '
      + '           LOG130.TOTAL CXP_TOTAL, '
      + '           LOG130.CPESTTRA CXP_ESTADOTRANSF, '
      + QuotedStr(DMLOG.wUsuario) + ' USUARIO_IMPRIME, '
      + QuotedStr(ls_labelCerrado) + ' OBSCERRADO_LABEL, '
      + QuotedStr(ls_observacionCerrado) + 'OBSCERRADO '
      + '      from LOG304, LOG130 '
      + '     where LOG304.CIAID = LOG130.ODCCIAID '
      + '       and LOG304.ODCID = LOG130.ODCID '
      + '       and LOG304.CIAID = ' + QuotedStr(xCia)
      + '       and LOG304.ODCID = ' + QuotedStr(dblcdOrdenCompra.Text)
      + '     order by LOG130.CPCIAID, LOG130.NUMORDPAG';
   DMLOG.cdsSql.Close;
   DMLOG.cdsSql.DataRequest(xSQL);
   DMLOG.cdsSql.Open;
   If DMLOG.cdsSql.RecordCount = 0 Then
   Begin
      showmessage('No se recuperó ningún registro');
      exit;
   End;
   ppDBPipeline_OrdenPago.DataSource := DMLOG.dsSql;
   ppReport_OrdenPago.DataPipeline := ppDBPipeline_OrdenPago;
   ppReport_OrdenPago.Template.FileName := wRutaRpt + '\OrdenPago.rtm';
   ppReport_OrdenPago.Template.LoadFromFile;
   ppReport_OrdenPago.Print;
End;

Procedure TFOrdenPago.dbgDetalleOrdPagoDblClick(Sender: TObject);
Begin
   If DMLOG.cdsQry12.RecordCount = 0 Then
   Begin
      ShowMessage('No se seleccionó ningún registro');
      Exit;
   End;
   pnlOrdenPago.Visible := True;
   If DMLOG.cdsQry12.FieldbyName('ESTADO').AsString = 'INICIAL' Then
   Begin
      xsAccionOrdenPago := 'EDITAR';
   End
   Else
   Begin
      xsAccionOrdenPago := 'CONSULTAR';
   End;
   RecuperaOrdenPago(DMLOG.cdsQry12.FieldbyName('CIAID').AsString, DMLOG.cdsQry12.FieldbyName('NUMORDPAG').AsString);
   BloqueaPanelOP(True);
End;

Procedure TFOrdenPago.btnAceptaOrdenPagoClick(Sender: TObject);
Begin
   If (edtOrdenPago.Text = '00000000') Or (DMLOG.cdsQry3.RecordCount = 0) Then
   Begin
      ShowMessage('No se seleccionó ninguna Orden de Pago a ACEPTAR');
      Exit;
   End;

   If edtEstado.Text <> 'INICIAL' Then
   Begin
      ShowMessage('El estado de Registro de Ordenes de Pago debe estar en estado INICIAL');
      Exit;
   End;

   If MessageDlg('Se cambiará el estado a ACEPTADO,' + #13 + ' ¿Desea Continuar?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
   Begin
      xSQL := ' Update LOG130 '
         + '       set LOG130.CPESTTRA  = ' + QuotedStr('ACEPTADO') + ', '
         + '           LOG130.USUMOD = ' + QuotedStr(DMLOG.wUsuario) + ', '
         + '           LOG130.FECMOD = SYSDATE '
         + '     where LOG130.CIAID = ' + QuotedStr(DMLOG.cdsQry3.FieldbyName('CIAID').AsString)
         + '       and LOG130.NUMORDPAG = ' + QuotedStr(DMLOG.cdsQry3.FieldbyName('NUMORDPAG').AsString)
         + '       and LOG130.ODCCIAID = ' + QuotedStr(xCia)
         + '       and LOG130.ODCID = ' + QuotedStr(xNumOrdenCompra);
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);

      xSQL := ' Update LOG131 '
         + '       set LOG131.ESTADO  = ' + QuotedStr('ACEPTADO') + ', '
         + '           LOG131.USUMOD = ' + QuotedStr(DMLOG.wUsuario) + ', '
         + '           LOG131.FECMOD = SYSDATE '
         + '     where LOG131.CIAID = ' + QuotedStr(DMLOG.cdsQry3.FieldbyName('CIAID').AsString)
         + '       and LOG131.NUMORDPAG = ' + QuotedStr(DMLOG.cdsQry3.FieldbyName('NUMORDPAG').AsString)
         + '       and LOG131.ODCCIAID = ' + QuotedStr(xCia)
         + '       and LOG131.ODCID = ' + QuotedStr(xNumOrdenCompra);
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);

      //si está completamente emitido entonces el estado de registro
      //de ordenes de pago en la Orden de Compra pasa a Completado
      If Abs(DMLOG.cdsOrdComp.FieldbyName('ORDPAGPEN').AsFloat) <= 1.0 Then
      Begin
         xSQL := ' Update LOG304 '
            + '       set LOG304.ORDPAGEST  = ' + QuotedStr('COMPLETADO')
            + '     where LOG304.CIAID = ' + QuotedStr(xCia)
            + '       and LOG304.ODCID = ' + QuotedStr(dblcdOrdenCompra.Text);
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      End;

      dblcdOrdenCompraExit(dblcdOrdenCompra);
      btnCerrarOrdenPagoClick(btnCerrarOrdenPago);
   End;

End;

Procedure TFOrdenPago.Z2bbtnCierraOPClick(Sender: TObject);
Var
   xsMensaje: String;
Begin
   Try
     //verificar que no exista una orden de pago en estado inicial
      xSQL := ' Select LOG131.NUMORDPAG'
         + '      from LOG131 '
         + '     where LOG131.ODCCIAID = ' + QuotedStr(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString)
         + '       and LOG131.ODCID = ' + QuotedStr(DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString)
         + '       and LOG131.ESTADO = ' + QuotedStr('INICIAL');
      DMLOG.cdsQry.Close;
      DMLOG.cdsQry.DataRequest(xSQL);
      DMLOG.cdsQry.Open;
      If DMLOG.cdsQry.RecordCount > 0 Then
      Begin
         xsMensaje := 'Para poder CERRAR la Orden de Compra' + #13
            + 'no debe existir Ordenes de Pago en estado INICIAL';
         ShowMessage(xsMensaje);
         Exit;
      End;
      If DMLOG.cdsOrdComp.FieldbyName('ORDPAGEST').AsString <> 'INICIAL' Then
      Begin
         ShowMessage('El estado de registro de Ordenes de Pago en la Orden de Compra es distinto a INICIAL');
         Exit;
      End;
      If Abs(StrToFloat(dbePendiente.Text)) <= 0.1 Then
      Begin
         ShowMessage('La orden de Compra no tiene Pendiente por Registrar');
         Exit;
      End;
      FOrdenPago_CerrarOC := TFOrdenPago_CerrarOC.Create(Application); // LOG131
      FOrdenPago_CerrarOC.xCia := DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString;
      FOrdenPago_CerrarOC.xNumOrdenCompra := DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString;
      FOrdenPago_CerrarOC.ShowModal;
      RecuperaCabecera(xCia, xNumOrdenCompra);
      RecuperarDetalle(xCia, xNumOrdenCompra);
   Finally

   End;
End;

Procedure TFOrdenPago.Z2bbtn_PagosClick(Sender: TObject);
Begin
   Try
      FPagosDocumentos := TFPagosDocumentos.Create(Application); // LOG727
      FPagosDocumentos.xs_compania := DMLOG.cdsQry12.FieldbyName('CPCIAID').AsString;
      FPagosDocumentos.xs_proveedor := DMLOG.cdsQry12.FieldbyName('PROV').AsString;
      FPagosDocumentos.xs_documento := DMLOG.cdsQry12.FieldbyName('DOCID').AsString;
      FPagosDocumentos.xs_serie := DMLOG.cdsQry12.FieldbyName('CPSERIE').AsString;
      FPagosDocumentos.xs_numero := DMLOG.cdsQry12.FieldbyName('CPNODOC').AsString;
      FPagosDocumentos.ShowModal;
   Finally
      FPagosDocumentos.Free;
   End;
End;

Procedure TFOrdenPago.dbdtpEmisionExit(Sender: TObject);
Begin
   If dbdtpEmision.Date > date Then
   Begin
      ShowMessage('La fecha del documento no puede ser superior a Hoy');
      DMLOG.cdsQry4.FieldbyName('CPFEMIS').AsString := '';
      dbdtpEmision.Text := '';
      Exit;
   End;
   DMLOG.cdsQry4.FieldbyName('CPFVCMTO').AsString := DMLOG.cdsQry4.FieldbyName('CPFEMIS').AsString;
End;

Procedure TFOrdenPago.btnImprimeOrdenPagoClick(Sender: TObject);
Var
   xsNumOrdenPago: String;
Begin
   If dblcdOrdenCompra.Text = '' Then
   Begin
      exit;
   End;
   xsNumOrdenPago := DMLOG.cdsQry12.FieldbyName('NUMORDPAG').AsString;
   If xsNumOrdenPago = '' Then
   Begin
      MessageDlg('No se seleccionó ninguna Orden de Pago', mtInformation, [mbOk], 0);
      Exit;
   End;
   If (DMLOG.cdsQry12.FieldbyName('CPESTTRA').AsString = 'INICIAL')
      Or (DMLOG.cdsQry12.FieldbyName('CPESTTRA').AsString = 'ANULADO') Then
   Begin
      MessageDlg('No se puede imprimir el Formato de Ordenes' + #13 +
         'de Pago en estado ' + DMLOG.cdsQry12.FieldbyName('CPESTTRA').AsString, mtInformation, [mbOk], 0);
      Exit;
   End;
   If DMLOG.cdsQry12.FieldbyName('DOCID').AsString = '73' Then
   Begin
      MessageDlg('El documento de Cierre no es una Orden de Pago' + #13 +
         'no se puede imprimir el formato ', mtInformation, [mbOk], 0);
      Exit;
   End;

// Inicio HPC_201305_LOG
// Se incluye Clase de Auxiliar en la búsqueda el RUC del Proveedor
   xSQL := ' Select LOG304.CIAID COMPANIA, '
      + '           (SELECT TGE101.CIADES FROM TGE101 WHERE TGE101.CIAID = LOG304.CIAID ) COMPANIA_DES, '
      + '           LOG304.PROV PROVEEDOR, '
      + '           (SELECT TGE201.PROVRUC FROM TGE201 WHERE TGE201.CLAUXID=' + quotedstr(xgClaseAux) + ' and TGE201.PROV = LOG304.PROV) PROVEEDOR_RUC, '
      + '           LOG304.PROVDES PROVEEDOR_DES,  '
      + '           LOG304.TMONID MONEDA, '
      + '           (SELECT TGE103.TMONDES FROM TGE103 WHERE LOG304.TMONID = TGE103.TMONID) MONEDA_DES, '
      + '           LOG304.ODCID OC_NUMERO, '
      + '           LOG304.ODCFEMI OC_FECHAEMI,  '
      + '           LOG304.ODCOBS OC_OBSERVACION,  '
      + '           LOG304.ODCTOTALG OC_TOTAL,  '
      + '           LOG304.ORDPAGEST OC_ESTADOORDENPAGO, '
      + '           LOG304.ORDPAGTOT OC_TOTALORDENPAGO, '
      + '           LOG304.ORDPAGPEN OC_PENDIENTEORDENPAGO, '
      + '           LOG304.TIPOADQ OC_TIPOADQUISICION, '
      + '           (SELECT TGE173.TIPADQDES FROM TGE173 WHERE TGE173.TIPOADQ = LOG304.TIPOADQ) OC_TIPOADQUISICION_DES, '
      + '           LOG304.CCOMERID OC_COMERCIAL, '
      + '           (SELECT CXC101.CCOMERDES FROM CXC101 WHERE CXC101.CIAID = LOG304.CIAID AND CXC101.CCOMERID = LOG304.CCOMERID) OC_COMERCIAL_DES, '
      + '           LOG130.NUMORDPAG ORDENPAGO, '
      + '           LOG130.CPCIAID CXP_COMPANIA,  '
      + '           LOG130.DOCID CXP_DOCUMENTO, '
      + '           (SELECT TGE110.DOCDES FROM TGE110 WHERE LOG130.DOCID = TGE110.DOCID) CXP_DOCUMENTO_DES, '
      + '           LOG130.CPOBS OBSERVACION, '
      + '           LOG130.CPSERIE CXP_SERIE,  '
      + '           LOG130.CPNODOC CXP_NUMERO,  '
      + '           LOG130.CPFRECEP CXP_RECEPCION, '
      + '           LOG130.CPFEMIS CXP_EMISION,  '
      + '           LOG130.BASIMP CXP_BIMPONIBLE, '
      + '           LOG130.IGV CXP_IGV,   '
      + '           LOG130.TOTAL CXP_TOTAL,  '
      + '           LOG130.CPESTTRA CXP_ESTADOTRANSF,  '
      + QuotedStr(DMLOG.wUsuario) + ' USUARIO_IMPRIME, '
      + QuotedStr(' ') + ' OBSCERRADO_LABEL, '
      + QuotedStr(' ') + 'OBSCERRADO, '
      + '           (SELECT TGE006.USERNOM FROM TGE006 WHERE TGE006.USERID = LOG130.USUREG ) USUARIO_REGISTRA '
      + '      from LOG304, LOG130  '
      + '     where LOG304.CIAID = LOG130.ODCCIAID  '
      + '       and LOG304.ODCID = LOG130.ODCID  '
      + '       and LOG304.CIAID = ' + QuotedStr(xCia)
      + '       and LOG304.ODCID = ' + QuotedStr(dblcdOrdenCompra.Text)
      + '       and LOG130.NUMORDPAG = ' + QuotedStr(xsNumOrdenPago)
      + '     order by LOG130.CPCIAID, LOG130.NUMORDPAG ';
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
// Fin HPC_201305_LOG

   If DMLOG.cdsQry.RecordCount = 0 Then
   Begin
      MessageDlg('No se recuperó ningún registro', mtInformation, [mbOk], 0);
      exit;
   End;
   ppdbFormatoOrdenPago.DataSource := DMLOG.dsQry;
   pprFormatoOrdenPago.DataPipeline := ppdbFormatoOrdenPago;
   pprFormatoOrdenPago.Template.FileName := wRutaRpt + '\OrdenPagoFormato.rtm';
   pprFormatoOrdenPago.Template.LoadFromFile;
   //para mostrar el diseñador del reporte
   //ppdFormatoOrdenPago.Report := pprFormatoOrdenPago ;
   //ppdFormatoOrdenPago.ShowModal() ;
   pprFormatoOrdenPago.Print;
End;

Procedure TFOrdenPago.AnulaOrdenPago(wgCiaid_op, wgNumOrdPago: String);
Begin
   xSQL := ' update LOG130 '
      + '       set LOG130.CPESTTRA  = ' + QuotedStr('ANULADO') + ', '
      + '           LOG130.USUANU = ' + QuotedStr(DMLOG.wUsuario) + ', '
      + '           LOG130.FECANU = SYSDATE '
      + '     where LOG130.CIAID = ' + QuotedStr(wgCiaid_op)
      + '       and LOG130.NUMORDPAG = ' + QuotedStr(wgNumOrdPago)
      + '       and LOG130.ODCCIAID = ' + QuotedStr(xCia)
      + '       and LOG130.ODCID = ' + QuotedStr(xNumOrdenCompra);
   DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);

   xSQL := ' Update LOG131 '
      + '       set LOG131.ESTADO  = ' + QuotedStr('ANULADO') + ', '
      + '           LOG131.USUMOD = ' + QuotedStr(DMLOG.wUsuario) + ', '
      + '           LOG131.FECMOD = SYSDATE '
      + '     where LOG131.CIAID = ' + QuotedStr(wgCiaid_op)
      + '       and LOG131.NUMORDPAG = ' + QuotedStr(wgNumOrdPago)
      + '       and LOG131.ODCCIAID = ' + QuotedStr(xCia)
      + '       and LOG131.ODCID = ' + QuotedStr(xNumOrdenCompra);
   DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
End;

Procedure TFOrdenPago.btnAnulaOrdenPagoClick(Sender: TObject);
Var
   xsMensaje: String;
Begin

   If (edtOrdenPago.Text = '00000000') Or (DMLOG.cdsQry3.RecordCount = 0) Then
   Begin
      xsMensaje := 'No se ha seleccionado ninguna Orden de Pago';
      MessageDlg(xsMensaje, mtInformation, [mbOk], 0);
      Exit;
   End;
   If (edtEstado.Text <> 'INICIAL') And (edtEstado.Text <> 'ANULADO') Then
   Begin
      xsMensaje := 'El Estado de la Orden de Pago no permite Anular';
      MessageDlg(xsMensaje, mtInformation, [mbOk], 0);
      Exit;
   End;

   xsMensaje := 'Se anulará la Orden de Pago Nº:' + edtOrdenPago.Text + #13 +
      'Desea continuar?';
   If MessageDlg(xsMensaje, mtconfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      AnulaOrdenPago(DMLOG.cdsQry3.FieldbyName('CIAID').AsString, DMLOG.cdsQry3.FieldbyName('NUMORDPAG').AsString);
      ActualizaSaldoOC(xCia, xNumOrdenCompra);
      RecuperaCabecera(xCia, xNumOrdenCompra);
      RecuperarDetalle(xCia, xNumOrdenCompra);
      RecuperaOrdenPago(DMLOG.cdsQry3.FieldbyName('CIAID').AsString, DMLOG.cdsQry3.FieldbyName('NUMORDPAG').AsString);
      btnCerrarOrdenPagoClick(btnCerrarOrdenPago);
   End;

End;

Procedure TFOrdenPago.btnAdiccionaDocumentoPagoClick(Sender: TObject);
Begin
   xsAccionDoc := 'AGREGAR';
   If pnlDocumento.Visible = True Then
   Begin
      Exit;
   End;
   pnlDocumento.Visible := True;
   BloqueaPanelOP(False);
   // Inicio HPC_201701_LOG
   // Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
   dblcBanco.Enabled := true;
   dbeBanco.Enabled := true;
   dblcTMon.Enabled := true;
   edtTMon.Enabled := true;
   dbeCtaCte.Enabled := true;
   dbeCodCtaInt.Enabled := true;

   dblcBanco.Text := '';
   dbeBanco.Text := '';
   dblcTMon.Text := '';
   edtTMon.Text := '';
   dbeCtaCte.Text := '';
   dbeCodCtaInt.Text := '';

   dblcBanco.Enabled := false;
   dbeBanco.Enabled := false;
   dblcTMon.Enabled := false;
   edtTMon.Enabled := false;
   dbeCtaCte.Enabled := false;
   dbeCodCtaInt.Enabled := false;
// Inicio HPC_201803_LOG
// Se implementa debido a la solicitud de Orden de Pago
   if (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'I') or (DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString = 'S') then
   begin
      dblcCIA.Text := '';
      edtCIA.Text := '';
      dblcdCCosto.Text :='';
      edtCCosto.Text :='';
      dblcCIA.Enabled := True;
      dblcdCCosto.Enabled := True;
   end
   else
   begin
      dblcCIA.Text := '';
      edtCIA.Text := '';
      dblcdCCosto.Text :='';
      edtCCosto.Text :='';
      dblcCIA.Enabled := False;
      dblcdCCosto.Enabled := False;
   end;
// Fin HPC_201803_LOG
   // Fin HPC_201701_LOG
End;

Procedure TFOrdenPago.btnCerrarOrdenPagoClick(Sender: TObject);
Begin
   LimpiaPanelDocumento;
   RecuperaOrdenPago('x', 'x');
   pnlOrdenPago.Visible := False;

End;

Procedure TFOrdenPago.btnCerrarDocumentoClick(Sender: TObject);
Begin
   pnlDocumento.Visible := False;
   LimpiaPanelDocumento;
   BloqueaPanelOP(True);
End;

Procedure TFOrdenPago.dbgDocumentosDblClick(Sender: TObject);
Begin
   If DMLOG.cdsQry3.RecordCount = 0 Then
   Begin
      ShowMessage('No se seleccionó ningún registro');
      Exit;
   End;
   If (DMLOG.cdsQry3.FieldbyName('CPESTTRA').AsString = 'REGISTRADO') And (xsAccionOrdenPago <> 'CONSULTAR') Then
   Begin
      xsAccionDoc := 'EDITAR';
   End
   Else
   Begin
      xsAccionDoc := 'CONSULTAR';
   End;

   //Si está ACEPTADO se modificará sólo si no existe ningún doc PROVISIONADO
   If (DMLOG.cdsQry3.FieldbyName('CPESTTRA').AsString = 'ACEPTADO') And (fg_ExisteDocProvisionado = False) Then
   Begin
      xsAccionDoc := 'EDITAR';
      xsAccionOrdenPago := 'EDITAR';
   End;

   //Recuperar documento
   RecuperaDocumento(DMLOG.cdsQry3.FieldbyName('CIAID').AsString, DMLOG.cdsQry3.FieldbyName('NUMORDPAG').AsString, DMLOG.cdsQry3.FieldbyName('ITEM').AsInteger);
   BloqueaPanelOP(False);
   BloqueaPanelDocumento(True);
// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
   BloqueaPanelCtaBancaria(True);
// Fin HPC_201701_LOG
End;

Procedure TFOrdenPago.dbgDocumentosKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Var
   xsCiaOrdenpago, xsNumOrdenPago, xsDescripcionDoc: String;
   xsSerieDoc, xsNumeroDoc, xsTotalDoc, xsMensaje: String;

Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If (DMLOG.cdsOrdComp.FieldbyName('ORDPAGEST').AsString = 'CERRADO') Or
         (DMLOG.cdsOrdComp.FieldbyName('ORDPAGEST').AsString = 'COMPLETADO') Then
      Begin
         Exit;
      End;
      If DMLOG.cdsQry3.RecordCount = 0 Then
      Begin
         ShowMessage('No se seleccionó ningún registro');
         Exit;
      End;
      If (DMLOG.cdsQry3.FieldbyName('CPESTTRA').AsString = 'PROVISIONADO') Then
      Begin
         ShowMessage('El documento ya fue provisionado en Cuentas por Pagar');
         Exit;
      End;
      If (DMLOG.cdsQry3.FieldbyName('CPESTTRA').AsString = 'ACEPTADO') Then
      Begin
         ShowMessage('La Orden de Pago ya fue Aceptada, no se puede eliminar el documento');
         Exit;
      End;
      xsCiaOrdenpago := DMLOG.cdsQry3.FieldbyName('CIAID').AsString;
      xsNumOrdenPago := DMLOG.cdsQry3.FieldbyName('NUMORDPAG').AsString;
      xsDescripcionDoc := DMLOG.cdsQry3.FieldbyName('DOCID_DES').AsString;
      xsSerieDoc := DMLOG.cdsQry3.FieldbyName('CPSERIE').AsString;
      xsNumeroDoc := DMLOG.cdsQry3.FieldbyName('CPNODOC').AsString;
      xsTotalDoc := DMLOG.cdsQry3.FieldbyName('TOTAL').AsString;

      xsMensaje := 'El documento : ' + xsDescripcionDoc + #13
         + 'Número : ' + xsSerieDoc + '-' + xsNumeroDoc + #13
         + 'Será eliminado de la Orden de Pago : ' + xsNumOrdenPago + #13
         + '¿Desea Continuar?';

      If MessageDlg(xsMensaje, mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
      Begin
         xSQL := ' Delete LOG130 '
            + '     where LOG130.CIAID = ' + QuotedStr(xsCiaOrdenpago)
            + '       and LOG130.NUMORDPAG = ' + QuotedStr(xsNumOrdenPago)
            + '       and LOG130.ITEM = ' + QuotedStr(DMLOG.cdsQry3.FieldbyName('ITEM').AsString)
            + '       and LOG130.ODCCIAID = ' + QuotedStr(xCia)
            + '       and LOG130.ODCID = ' + QuotedStr(xNumOrdenCompra);
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
         ActualizaSaldoOC(xCia, dblcdOrdenCompra.Text);
         ActualizaTotalOrdenPago(xsCiaOrdenpago, xsNumOrdenPago);
         RecuperaCabecera(xCia, dblcdOrdenCompra.Text);
         RecuperarDetalle(xCia, dblcdOrdenCompra.Text);
         RecuperaOrdenPago(xCia, xsNumOrdenPago);
// Inicio HPC_201803_LOG
// Se implementa debido a la solicitud de Orden de Pago
         if DMLOG.cdsQry3.recordcount =0 then
         begin
            xSQL := ' DELETE LOG131 '
            + '     where LOG131.CIAID = ' + QuotedStr(xsCiaOrdenpago)
            + '       and LOG131.NUMORDPAG = ' + QuotedStr(xsNumOrdenPago);
            DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
         end;
// Fin HPC_201803_LOG
      End;

   End;
End;

Function TFOrdenPago.fg_ExisteDocProvisionado: Boolean;
Var
   xsSql: String;
Begin
   xsSql := ' Select LOG130.* '
      + '      from LOG130 '
      + '     where LOG130.CIAID  = ' + QuotedStr(DMLOG.cdsQry3.FieldbyName('CIAID').AsString)
      + '       and LOG130.NUMORDPAG = ' + QuotedStr(DMLOG.cdsQry3.FieldbyName('NUMORDPAG').AsString)
      + '       and LOG130.CPESTTRA = ' + QuotedStr('PROVISIONADO')
      + '       and LOG130.ODCCIAID = ' + QuotedStr(xCia)
      + '       and LOG130.ODCID = ' + QuotedStr(xNumOrdenCompra);
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xsSql);
   DMLOG.cdsQry.Open;
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      Result := True;
      Exit;
   End;
   Result := False;
   Exit;
End;

Function TFOrdenPago.fg_ExisteCabecera(wgCiaid, wgNumordenPago, wgCiaIdOC, wgNumeroOC: String): Boolean;
Var
   xsSql: String;
Begin
   xsSql := ' Select LOG131.* '
      + '       from LOG131 '
      + '      where LOG131.CIAID=' + QuotedStr(wgCiaid)
      + '        and LOG131.NUMORDPAG = ' + QuotedStr(wgNumordenPago)
      + '        and LOG131.ODCCIAID = ' + QuotedStr(wgCiaIdOC)
      + '        and LOG131.ODCID = ' + QuotedStr(wgNumeroOC);
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xsSql);
   DMLOG.cdsQry.Open;
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      Result := True;
      Exit;
   End;
   Result := False;
   Exit;
End;

Procedure TFOrdenPago.bbtnRecalSaldOPagoClick(Sender: TObject);
Begin
   ActualizaSaldoOC(FRegOrdCD.dblcCIA.Text, dblcdOrdenCompra.Text);
   ShowMessage('Ok');
End;

// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.

Procedure TFOrdenPago.btnBuscarCtaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select distinct A.CCBCOID,A.BANCOID,B.BANCONOM,A.CODBCOCCI,A.TMONID '
      + '     from CAJA102  A,TGE105 B'
      + '    where A.CLAUXID=' + quotedstr(dblcTipoAuxiliar.Text)
      + '      and A.PROV=' + QuotedStr(dblcdProv.Text)
      + '      and A.TMONID=' + QuotedStr(dblcTMoneda.Text)
      + '      and A.BANCOID= B.BANCOID';
   DMLOG.cdsCtaBancaria.Close;
   DMLOG.cdsCtaBancaria.DataRequest(xSQL);
   DMLOG.cdsCtaBancaria.Open;
   If DMLOG.cdsCtaBancaria.RecordCount > 0 Then
   Begin
      fLstCtaBancaria := TfLstCtaBancaria.Create(Self);
      fLstCtaBancaria.dbgCtaBancaria.DataSource := DMLOG.dsCtaBancaria;
      fLstCtaBancaria.ShowModal;
      fLstCtaBancaria.Free;
   End
   Else
   Begin
      ShowMessage('El Proveedor no cuenta con Cuentas Bancarias Registras en OASIS');
      Exit;
   End;
End;
// Fin HPC_201701_LOG

// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.

Procedure TFOrdenPago.dblcBancoExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'BANCOID=' + '''' + dblcBanco.text + '''';
   dbeBanco.Text := DMLOG.BuscaQry('PrvTGE', 'TGE105', 'BANCONOM', xWhere, 'BANCONOM');
End;
// Fin HPC_201701_LOG

// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.

Procedure TFOrdenPago.dblcTMonExit(Sender: TObject);
Var
   xWhere, xTipo: String;
Begin
   xWhere := 'TMONID=' + '''' + dblcTMon.Text + '''';
   edtTMon.Text := DMLOG.BuscaQry('PrvTGE', 'TGE103', 'TMONDES, TMON_LOC', xWhere, 'TMONDES');
End;
// Fin HPC_201701_LOG

// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.

Procedure TFOrdenPago.btnGrabarCtaCteClick(Sender: TObject);
Var
   xSQL: String;
Begin

End;
// Fin HPC_201701_LOG
// Inicio HPC_201803_LOG
// Se implementa debido a la solicitud de Orden de Pago
procedure TFOrdenPago.dblcdCCostoExit(Sender: TObject);
Var
   xWhere: String;
Begin

   xWhere := 'CCOSID=''' + dblcdCCosto.Text + ''' and CCOSMOV=''S'' AND CCOSACT=''S'' '
      + ' and CCOSCIAS LIKE (' + quotedstr('%' + DMLOG.cdsQry4.FieldbyName('CIAID').AsString + '%') + ' )';
   edtCCosto.Text := DMLOG.BuscaQry('prvTGE', 'TGE203', 'CCOSDES', xWhere, 'CCOSDES');

   If length(edtCCosto.Text) = 0 Then
   Begin
      edtCCosto.Text := '';

      Exit;
   End;
end;
// Fin HPC_201803_LOG
// Inicio HPC_201803_LOG
// Se implementa debido a la solicitud de Orden de Pago
procedure TFOrdenPago.dblcCIAExit(Sender: TObject);
var
  xSQL : String;
begin
      If length(Trim(dblcCIA.Text)) = 0 Then
      Begin
         If length(dblcCIA.text) = 0 Then
         Begin
            ShowMessage('Debe indicar primero la Compañía');
            dblcCIA.SetFocus;
            exit;
         End;
      End;

      edtCIA.text := DMLOG.DisplayDescrip('prvSQL', 'TGE101', 'CIADES', 'CIAID=' + quotedStr(dblcCIA.text), 'CIADES');

      xSQL := 'Select CCOSID, CCOSDES, CCOSABR, CCOSNIV, CUENTAID, CCOSMOV, CCOSCIAS, CCOSLOCS, '
         + '          CCOSACT, CIADEST, GRUCENCOS, BAZCIA, BAZCTA, TRABIDRESP '
         + '     from TGE203 '
         + '    where CCOSACT<>''N'' '
         + '      and CCOSCIAS LIKE ''%' + dblcCIA.Text + '%'' ORDER BY CCOSID';
      DMLOG.FiltraCDS(DMLOG.cdsCCost, xSQL);

      dblcdCCosto.Text := '';
      edtCCosto.Text := '';
      
end;
// Fin HPC_201803_LOG

End.


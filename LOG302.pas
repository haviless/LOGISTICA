Unit LOG302;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG302
//Formulario               : FRegSolCotizacion
//Fecha de Creación        : 03/07/2012
//Autor                    : Abelardo Sulca Palomino
//Objetivo                 : Registro de las Solicitudes de Cotización y el ingreso
//                           de las proformas

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, Mask, wwdbedit, Wwdbdlg, wwdbdatetimepicker, StdCtrls,
   wwdblook, DBCtrls, ComCtrls, Buttons, Wwdbigrd, Grids, Wwdbgrid, db,
   Wwdbspin, ppBands, ppCache, ppClass, ppEndUsr, ppProd, ppReport, ppComm,
   ppRelatv, ppDB, ppDBPipe, ppStrtch, ppMemo, ppVar, ppCtrls, ppPrnabl,
   ppParameter, ppCTMain, daDataView, daQueryDataView, daDBBDE, ppModule,
   daDataModule, jpeg;

Type
   TFRegSolCotizacion = Class(TForm)
      lblCIA: TLabel;
      lblFReg: TLabel;
      Label13: TLabel;
      Label6: TLabel;
      lblObserv: TLabel;
      memObservacion: TDBMemo;
      dblcCompania: TwwDBLookupCombo;
      edtCompania: TEdit;
      dtpFechaCotizacion: TwwDBDateTimePicker;
      dblcTipoCotizacion: TwwDBLookupCombo;
      edtTipoCotizacion: TEdit;
      edtNumCotizacion: TwwDBEdit;
      pnlInventario: TPanel;
      Label4: TLabel;
      Label2: TLabel;
      dblcTipoInventario: TwwDBLookupCombo;
      edtTipoInventario: TEdit;
      dblcAlmacen: TwwDBLookupCombo;
      edtAlmacen: TEdit;
      pnlTipoServicio: TPanel;
      lblObra: TLabel;
      dblcTipoServicio: TwwDBLookupCombo;
      edtTipoServicio: TEdit;
      pcTabDetalle: TPageControl;
      tsCotizacion: TTabSheet;
      tsProforma: TTabSheet;
      dbgDetalleCotizacion: TwwDBGrid;
      btnAdicionaDetCotizacion: TwwIButton;
      btnEditarCabecera: TBitBtn;
      btnGrabar: TBitBtn;
      btnAceptar: TBitBtn;
      btnAnular: TBitBtn;
      btnSalir: TBitBtn;
      lblLEntrega: TLabel;
      dblcLEntrega: TwwDBLookupCombo;
      edtLEntrega: TwwDBEdit;
      lblFEntre: TLabel;
      dtpFechaEntrega: TwwDBDateTimePicker;
      lblComprador: TLabel;
      dblcComprador: TwwDBLookupCombo;
      edtComprador: TwwDBEdit;
      lblTMon: TLabel;
      dblcTMoneda: TwwDBLookupCombo;
      edtTMoneda: TwwDBEdit;
      btnAceptaCabecera: TBitBtn;
      pnlDetalleCotizacion: TPanel;
      stxTitulo2: TStaticText;
      btnAdicionarDetalle: TBitBtn;
      btnCancelarDetalle: TBitBtn;
      lblItem: TLabel;
      edtItemServicio: TwwDBEdit;
      memObservacionServicio: TDBMemo;
      edtCantidadPedidaServicio: TwwDBEdit;
      lblCntPed: TLabel;
      lblUnMed: TLabel;
      dblcUnidadMedidaServicio: TwwDBLookupCombo;
      edtUnidadMedServicio: TEdit;
      lblTexto: TLabel;
      Label3: TLabel;
      dblcLocalidad: TwwDBLookupCombo;
      edtLocalidad: TEdit;
      pnlProformaProveedor: TPanel;
      stTituloProforma: TStaticText;
      dbgDetalleProforma: TwwDBGrid;
      dblcTipoAuxiliar: TwwDBLookupCombo;
      dblcdProveedor: TwwDBLookupComboDlg;
      edtProveedor: TwwDBEdit;
      lblProv: TLabel;
      Label1: TLabel;
      dblcFormaDePago: TwwDBLookupCombo;
      edtFormaDePago: TEdit;
      Label7: TLabel;
      edtTipoAuxiliar: TEdit;
      Label8: TLabel;
      dblcTipoGarantia: TwwDBLookupCombo;
      edtTipoGarantia: TEdit;
      Label9: TLabel;
      Label10: TLabel;
      seDiasVigencia: TwwDBSpinEdit;
      seTiempoEntrega: TwwDBSpinEdit;
      btnAceptaCabProforma: TBitBtn;
      dbgProformas: TwwDBGrid;
      btnAdicionaProforma: TwwIButton;
      btnCancelaProforma: TBitBtn;
      dtpFechaProforma: TwwDBDateTimePicker;
      Label11: TLabel;
      edtNumProforma: TwwDBEdit;
      Label12: TLabel;
      memObservacionProforma: TDBMemo;
      Label14: TLabel;
      pnlProformaDetalle: TPanel;
      StaticText2: TStaticText;
      btnAceptaDetProforma: TBitBtn;
      btnCancelaDetProforma: TBitBtn;
      Label15: TLabel;
      edtProfDetItem: TwwDBEdit;
      Label16: TLabel;
      dblcProfDetUnidMedida: TwwDBLookupCombo;
      edtProfDetUnidMedida: TEdit;
      Label17: TLabel;
      edtProfDetCantidad: TwwDBEdit;
      Label19: TLabel;
      edtProfDetPrecioUnit: TwwDBEdit;
      Label20: TLabel;
      edtProfDetTotal: TwwDBEdit;
      edtProfDetArticuloID: TwwDBEdit;
      Label21: TLabel;
      edtProfDetArticuloDes: TwwDBEdit;
      btnImprimeSolCotizacion: TBitBtn;
      GroupBox1: TGroupBox;
      edtEstado: TDBText;
      Label5: TLabel;
      ppdbSolCotizacion: TppDBPipeline;
      pprSolCotizacion: TppReport;
      ppdSolCotizacion: TppDesigner;
      ppHeaderBand2: TppHeaderBand;
      ppDetailBand2: TppDetailBand;
      ppFooterBand2: TppFooterBand;
      cbdlgArticulo: TwwDBLookupComboDlg;
      Label22: TLabel;
      btnCComparativo: TBitBtn;
      GroupBox2: TGroupBox;
      edtCuadroComparativo: TwwDBEdit;
      edtProfDetArticuloDesM: TDBMemo;
      Procedure FormShow(Sender: TObject);
      Procedure dblcCompaniaExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcLocalidadExit(Sender: TObject);
      Procedure dblcTipoServicioExit(Sender: TObject);
      Procedure dblcTipoInventarioExit(Sender: TObject);
      Procedure dblcAlmacenExit(Sender: TObject);
      Procedure dblcTMonedaExit(Sender: TObject);
      Procedure dblcTipoCotizacionExit(Sender: TObject);
      Procedure dblcLEntregaExit(Sender: TObject);
      Procedure dblcCompradorExit(Sender: TObject);
      Procedure btnAceptaCabeceraClick(Sender: TObject);
      Procedure btnAdicionaDetCotizacionClick(Sender: TObject);
      Procedure btnEditarCabeceraClick(Sender: TObject);
      Procedure btnCancelarDetalleClick(Sender: TObject);
      Procedure btnAdicionarDetalleClick(Sender: TObject);
      Procedure dblcUnidadMedidaServicioExit(Sender: TObject);
      Procedure btnGrabarClick(Sender: TObject);
      Procedure dbgDetalleCotizacionDblClick(Sender: TObject);
      Procedure dbgDetalleCotizacionKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure btnAceptarClick(Sender: TObject);
      Procedure btnSalirClick(Sender: TObject);
      Procedure btnAdicionaProformaClick(Sender: TObject);
      Procedure btnCancelaProformaClick(Sender: TObject);
      Procedure dblcTipoAuxiliarExit(Sender: TObject);
      Procedure dblcdProveedorExit(Sender: TObject);
      Procedure dblcFormaDePagoExit(Sender: TObject);
      Procedure btnAceptaCabProformaClick(Sender: TObject);
      Procedure dbgProformasDblClick(Sender: TObject);
      Procedure btnAdicionaDetProformaClick(Sender: TObject);
      Procedure dbgDetalleProformaDblClick(Sender: TObject);
      Procedure btnCancelaDetProformaClick(Sender: TObject);
      Procedure btnAceptaDetProformaClick(Sender: TObject);
      Procedure edtProfDetPrecioUnitExit(Sender: TObject);
      Procedure edtProfDetTotalExit(Sender: TObject);
      Procedure dbgProformasKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure pcTabDetalleDrawTab(Control: TCustomTabControl;
         TabIndex: Integer; Const Rect: TRect; Active: Boolean);
      Procedure dblcTipoGarantiaExit(Sender: TObject);
      Procedure btnImprimeSolCotizacionClick(Sender: TObject);
      Procedure cbdlgArticuloExit(Sender: TObject);
      Procedure btnAnularClick(Sender: TObject);
      Procedure btnCComparativoClick(Sender: TObject);
   Private
    { Private declarations }
      Procedure fg_AsignaDataSource;
      Procedure fg_AsignaLookup;
      Procedure fg_CotizacionRecupera(wgCompania, wgNumCotizacion: String);
      Function fg_ValidaCabecera(Var wgMensaje: String): Boolean;
      Procedure fg_HabilitaPorTipoCotizacion(wgTipoCotizacion: String);
      Procedure fg_DefaultCotizacion;
      Procedure fg_HabilitaCabecera(wgBoolean: Boolean);
      Procedure fg_HabilitaDetalle(wgBoolean: Boolean; wgEdicion: String);
      Function fg_NumSolCotizacion(wgFecha: Tdate): String;
      Procedure fg_CompletaCabecera;
      Function fg_ValidaPanelDetSolCotizacion(Var wgMensaje: String): Boolean;
      Procedure fg_CompletaDetalle;
      Procedure fg_DefaultDetCotizacion;
      Procedure fg_ProformaRecupera(wgCompania, wgNumCotizacion: String);
      Procedure fg_DefaultProforma;
      Function fg_ProformaValida(Var wgMensaje: String): Boolean;
      Procedure fg_InicializaDetProforma(wgCompania, wgSolCotizacion: String);
      Procedure fg_ProformaCompletar;
      Function fg_NumProforma(wgFecha: Tdate): String;
      Procedure fg_ProformaHabilitaCab(wgBoolean: Boolean);
      Procedure fg_ProformaHabilitaDet(wgBoolean: Boolean);
      Procedure fg_ProformaRecuperaDet(wgCompania, wgNumProforma: String);
      Procedure fg_ProformaCompletarDet;
      Procedure fg_UbicacionPanelProforma;
      Procedure fg_ProformaCompletaPanel;
      Procedure fg_ProformaLimpiaPanel;
      Procedure fg_ProformaActualizaTotales(wgCompania, wgSCotizacion, wgProforma: String);
      Procedure fg_CotizacionRecuperaDet(wgCompania, wgNumCotizacion: String);
      Procedure fg_HabilitaPestania;
      Procedure fg_ProformaHabilitaBotones(wgBoolean: Boolean);
      Procedure fg_CComparativoActualizaEstado(wgEstado: String);
      Function fg_ProformaValidaPrecio(wgCompania,
         wgNumCotizacion: String; Var wgMensaje: String): Boolean;
      Procedure fg_ProformaHabilitaConsulta;
      Function fg_ValidaGeneraCC(Var wgMensaje: String): Boolean;
      Procedure fg_GrabaSolCotizacionSQL;
      Procedure fg_GrabaSolCotizacionDetSQL;
      Procedure fg_ProformaGrabarSQL;
      Procedure fg_ProformaGrabarDetSQL;
   Public
    { Public declarations }
      xsCompania: String;
      xsNumCotizacion: String;
      xsModo: String;
      xsModoCotizacionDet: String;
      xsModoProforma: String;
      xnTasaIgv: Double;
   End;

Var
   FRegSolCotizacion: TFRegSolCotizacion;

Implementation

Uses LOGDM1, oaAD3000, LOG341;
{$R *.dfm}

Procedure TFRegSolCotizacion.fg_AsignaDataSource;
Begin

   dblcCompania.DataSource := DMLOG.dsSolCot;
   dblcCompania.DataField := 'CIAID';
   dblcLocalidad.DataSource := DMLOG.dsSolCot;
   dblcLocalidad.DataField := 'LOCID';
   dtpFechaCotizacion.DataSource := DMLOG.dsSolCot;
   dtpFechaCotizacion.DataField := 'SCCFSOL';
   edtNumCotizacion.DataSource := DMLOG.dsSolCot;
   edtNumCotizacion.DataField := 'SCCID';
   dblcTMoneda.DataSource := DMLOG.dsSolCot;
   dblcTMoneda.DataField := 'TMONID';
   dblcTipoCotizacion.DataSource := DMLOG.dsSolCot;
   dblcTipoCotizacion.DataField := 'TSCID';
   dblcLEntrega.DataSource := DMLOG.dsSolCot;
   dblcLEntrega.DataField := 'LGECID';
   dtpFechaEntrega.DataSource := DMLOG.dsSolCot;
   dtpFechaEntrega.DataField := 'SCCFENT';
   dblcComprador.DataSource := DMLOG.dsSolCot;
   dblcComprador.DataField := 'COMPID';
   dblcTipoServicio.DataSource := DMLOG.dsSolCot;
   dblcTipoServicio.DataField := 'OBRAID';
   dblcTipoInventario.DataSource := DMLOG.dsSolCot;
   dblcTipoInventario.DataField := 'TINID';
   dblcAlmacen.DataSource := DMLOG.dsSolCot;
   dblcAlmacen.DataField := 'ALMID';
   memObservacion.DataSource := DMLOG.dsSolCot;
   memObservacion.DataField := 'SCCOBS';
   edtEstado.DataSource := DMLOG.dsSolCot;
   edtEstado.DataField := 'SCCEST';

   edtCuadroComparativo.DataSource := DMLOG.dsSolCot;
   edtCuadroComparativo.DataField := 'NUMCC';

   //Detalle
   dbgDetalleCotizacion.DataSource := DMLOG.dsDSolCot;
   edtItemServicio.DataSource := DMLOG.dsDSolCot;
   edtItemServicio.DataField := 'DSCCID';
   dblcUnidadMedidaServicio.DataSource := DMLOG.dsDSolCot;
   dblcUnidadMedidaServicio.DataField := 'UNMIDG';
   edtCantidadPedidaServicio.DataSource := DMLOG.dsDSolCot;
   edtCantidadPedidaServicio.DataField := 'DSCCCNTG';
   memObservacionServicio.DataSource := DMLOG.dsDSolCot;
   memObservacionServicio.DataField := 'DSCOBS';
   cbdlgArticulo.DataSource := DMLOG.dsDSolCot;
   cbdlgArticulo.DataField := 'ARTID';

   //panel de proforma
   dblcTipoAuxiliar.DataSource := DMLOG.dsProforma;
   dblcTipoAuxiliar.DataField := 'CLAUXID';
   dblcdProveedor.DataSource := DMLOG.dsProforma;
   dblcdProveedor.DataField := 'PROV';
   dblcFormaDePago.DataSource := DMLOG.dsProforma;
   edtProveedor.DataSource := DMLOG.dsProforma;
   edtProveedor.DataField := 'PROVDES';
   dblcFormaDePago.DataField := 'FPAGOID';
   dtpFechaProforma.DataSource := DMLOG.dsProforma;
   dtpFechaProforma.DataField := 'PROFFEMI';
   edtNumProforma.DataSource := DMLOG.dsProforma;
   edtNumProforma.DataField := 'PROFID';
   dblcTipoGarantia.DataSource := DMLOG.dsProforma;
   dblcTipoGarantia.DataField := 'GARANTIAID';
   seDiasVigencia.DataSource := DMLOG.dsProforma;
   seDiasVigencia.DataField := 'PROFVALID';
   seTiempoEntrega.DataSource := DMLOG.dsProforma;
   seTiempoEntrega.DataField := 'PROFTEN';
   memObservacionProforma.DataSource := DMLOG.dsProforma;
   memObservacionProforma.DataField := 'PROFOBS';
   //panel detalle proforma
   dbgProformas.DataSource := DMLOG.dsProforma;
   dbgDetalleProforma.DataSource := DMLOG.dsDProforma;
   edtProfDetItem.DataSource := DMLOG.dsDProforma;
   edtProfDetItem.DataField := 'DPROFID';
   edtProfDetArticuloID.DataSource := DMLOG.dsDProforma;
   edtProfDetArticuloID.DataField := 'ARTID';

   edtProfDetArticuloDesM.DataSource := DMLOG.dsDProforma;
   edtProfDetArticuloDesM.DataField := 'DPROFOBS';

   dblcProfDetUnidMedida.DataSource := DMLOG.dsDProforma;
   dblcProfDetUnidMedida.DataField := 'UNMIDG';
   edtProfDetCantidad.DataSource := DMLOG.dsDProforma;
   edtProfDetCantidad.DataField := 'DPROFCNTG';
   edtProfDetPrecioUnit.DataSource := DMLOG.dsDProforma;
   edtProfDetPrecioUnit.DataField := 'DPROFPUNG';
   edtProfDetTotal.DataSource := DMLOG.dsDProforma;
   edtProfDetTotal.DataField := 'DPROFIMP';

End;

Procedure TFRegSolCotizacion.fg_AsignaLookup;
Var
   xsSql: String;
Begin
   dblcCompania.Selected.Clear;
   dblcCompania.Selected.Add('CIAID'#9'8'#9'ID'#9'F');
   dblcCompania.Selected.Add('CIADES'#9'30'#9'Compañía'#9'F');

   dblcTipoCotizacion.Selected.Clear;
   dblcTipoCotizacion.Selected.Add('TSCID'#9'8'#9'ID'#9'F');
   dblcTipoCotizacion.Selected.Add('TSCDES'#9'30'#9'Tipo Cotización'#9'F');

   DMLOG.FiltraTabla(DMLOG.cdsCia, 'TGE101', 'CIAID', 'CIAID');
   DMLOG.FiltraTabla(DMLOG.cdsLoc, 'TGE126', 'LOCID', 'LOCID');
   DMLOG.FiltraTabla(DMLOG.cdsTSolCot, 'TGE137', 'TSCID', 'TSCID');
   DMLOG.FiltraTabla(DMLOG.cdsTipSol, 'TGE173', 'TIPOADQ', 'TIPOADQ');
   DMLOG.FiltraTabla(DMLOG.cdsLEntrega, 'TGE136', 'LGECID', 'LGECID');
   DMLOG.FiltraTabla(DMLOG.cdsComprador, 'TGE135', 'COMPCID', 'COMPCID');
   DMLOG.FiltraTabla(DMLOG.cdsUMed, 'TGE130', 'UNMID', 'UNMID');
   DMLOG.FiltraTabla(DMLOG.cdsTMoneda, 'TGE103', 'TMONID', 'TMONID');
   DMLOG.FiltraTabla(DMLOG.cdsTINID, 'TGE152', 'TINID', 'TINID');
   DMLOG.FiltraTabla(DMLOG.cdsObra, 'TGE213', 'OBRAID', 'OBRAID');
   DMLOG.FiltraTabla(DMLOG.cdsClAux, 'TGE102', '*', 'CLAUXID');
   DMLOG.FiltraTabla(DMLOG.cdsFPago, 'CXC101', 'CCOMERID', 'CCOMERID', 'CIAID =' + QuotedStr('02'));
   DMLOG.FiltraTabla(DMLOG.cdsTipoGarantia, 'TGE194', '*', 'GARANTIAID');

   dblcCompania.LookupTable := DMLOG.cdsCIA;
   dblcCompania.LookupField := 'CIAID';

   dblcCompania.LookupTable := DMLOG.cdsCia;
   dblcCompania.LookupField := 'CIAID';
   dblcLocalidad.LookupTable := DMLOG.cdsLOC;

   dblcLocalidad.LookupField := 'LOCID';
   dblcTMoneda.LookupTable := DMLOG.cdsTMoneda;
   dblcTMoneda.LookupField := 'TMONID';

   dblcTipoCotizacion.LookupTable := DMLOG.cdsTSolCot;
   dblcTipoCotizacion.LookupField := 'TSCID';
   dblcLEntrega.LookupTable := DMLOG.cdsLEntrega;
   dblcLEntrega.LookupField := 'LGECID';
   dblcComprador.LookupTable := DMLOG.cdsComprador;
   dblcComprador.LookupField := 'COMPCID';
   dblcTipoServicio.LookupTable := DMLOG.cdsObra;

   dblcTipoServicio.LookupField := 'OBRAID';
   dblcTipoInventario.LookupTable := DMLOG.cdsTINID;

   dblcTipoInventario.LookupField := 'TINID';
   dblcAlmacen.LookupTable := DMLOG.cdsALM;
   dblcAlmacen.LookupField := 'ALMID';
   dblcUnidadMedidaServicio.LookupTable := DMLOG.cdsUMed;
   dblcUnidadMedidaServicio.LookupField := 'UNMID';

   cbdlgArticulo.LookupTable := DMLOG.cdsArti;
   cbdlgArticulo.LookupField := 'ARTID';

   /////////////////////////DETALLE///////////////////////////
   dbgDetalleCotizacion.Selected.Clear;
   dbgDetalleCotizacion.Selected.Add('DSCCID'#9'6'#9'Item'#9'F');
   dbgDetalleCotizacion.Selected.Add('ARTID'#9'10'#9'Artículo'#9'F');
   dbgDetalleCotizacion.Selected.Add('DSCOBS'#9'50'#9'Observación'#9'F');
   dbgDetalleCotizacion.Selected.Add('UNMIDG'#9'8'#9'Unid~Medida'#9'F');
   dbgDetalleCotizacion.Selected.Add('DSCCCNTG'#9'8'#9'Cantidad'#9'F');

   //panel de proforma
   dblcTipoAuxiliar.Selected.Clear;
   dblcTipoAuxiliar.Selected.Add('CLAUXID'#9'6'#9'ID'#9'F');
   dblcTipoAuxiliar.Selected.Add('CLAUXDES'#9'20'#9'AuxiliarD'#9'F');

   dblcTipoAuxiliar.LookupTable := DMLOG.cdsClAux;
   dblcTipoAuxiliar.LookupField := 'CLAUXID';

   dblcdProveedor.Selected.Clear;
   dblcdProveedor.Selected.Add('PROV'#9'9'#9'Código'#9'F');
   dblcdProveedor.Selected.Add('PROVRUC'#9'12'#9'Nº RUC'#9'F');
   dblcdProveedor.Selected.Add('PROVDES'#9'30'#9'Razón Social'#9'F');
   dblcdProveedor.Selected.Add('CLAUXID'#9'4'#9'Aux Id'#9'F');
   dblcdProveedor.LookupTable := DMLOG.cdsProv;
   dblcdProveedor.LookupField := 'PROV';

   dblcFormaDePago.Selected.Clear;
   dblcFormaDePago.Selected.Add('CCOMERID'#9'6'#9'ID'#9'F');
   dblcFormaDePago.Selected.Add('CCOMERDES'#9'20'#9'Forma de pago'#9'F');
   dblcFormaDePago.LookupTable := DMLOG.cdsFPago;
   dblcFormaDePago.LookupField := 'CCOMERID';

   dblcTipoGarantia.Selected.Clear;
   dblcTipoGarantia.Selected.Add('GARANTIAID'#9'6'#9'ID'#9'F');
   dblcTipoGarantia.Selected.Add('GARANTIADES'#9'30'#9'Tipo de Garantía'#9'F');
   dblcTipoGarantia.LookupTable := DMLOG.cdsTipoGarantia;
   dblcTipoGarantia.LookupField := 'GARANTIAID';

   //listado de proformas
   dbgProformas.Selected.Clear;
   dbgProformas.Selected.Add('PROFID'#9'8'#9'Proforma'#9'F');
   dbgProformas.Selected.Add('CLAUXID'#9'4'#9'Tipo~Aux'#9'F');
   dbgProformas.Selected.Add('PROV'#9'6'#9'Código~Prov'#9'F');
   dbgProformas.Selected.Add('PROVDES'#9'20'#9'Razón~Social'#9'F');
   dbgProformas.Selected.Add('FPAGOID'#9'4'#9'Forma~Pago'#9'F');
   dbgProformas.Selected.Add('PROFFEMI'#9'10'#9'Fecha~Emisión'#9'F');
   dbgProformas.Selected.Add('PROFTEN'#9'8'#9'Tiempo~Entrega'#9'F');
   dbgProformas.Selected.Add('PROFIXTCC'#9'11'#9'Total'#9'F');
   dbgProformas.Selected.Add('PROFOBS'#9'30'#9'Observación'#9'F');

   //Detalle de la proforma
   dbgDetalleProforma.Selected.Clear;
   dbgDetalleProforma.Selected.Add('DPROFID'#9'6'#9'Item'#9'F');
   dbgDetalleProforma.Selected.Add('ARTID'#9'10'#9'Artículo'#9'F');
   dbgDetalleProforma.Selected.Add('DPROFOBS'#9'20'#9'Observación'#9'F');
   dbgDetalleProforma.Selected.Add('UNMIDG'#9'10'#9'Unid~Medida'#9'F');
   dbgDetalleProforma.Selected.Add('DPROFCNTG'#9'8'#9'Cantidad'#9'F');
   dbgDetalleProforma.Selected.Add('DPROFPUNG'#9'8'#9'Precio~Unit'#9'F');
   dbgDetalleProforma.Selected.Add('DPROFIMP'#9'10'#9'Total'#9'F');

   dblcProfDetUnidMedida.LookupTable := DMLOG.cdsUMed;
   dblcProfDetUnidMedida.LookupField := 'UNMID';
End;

Procedure TFRegSolCotizacion.fg_CotizacionRecupera(wgCompania, wgNumCotizacion: String);
Var
   xsSql: String;
Begin
   xsSql := 'SELECT * FROM LOG302 WHERE CIAID = ' + QuotedStr(wgCompania) + ' AND SCCID = ' + QuotedStr(wgNumCotizacion);
   DMLOG.cdsSolCot.Close;
   DMLOG.cdsSolCot.IndexFieldNames := '';
   DMLOG.cdsSolCot.Filter := '';
   DMLOG.cdsSolCot.Filtered := False;
   DMLOG.cdsSolCot.DataRequest(xsSql);
   DMLOG.cdsSolCot.Open;

   fg_CotizacionRecuperaDet(wgCompania, wgNumCotizacion);

   If DMLOG.cdsSolCot.RecordCount > 0 Then
   Begin
      xsSql := ' CIAID=' + Quotedstr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString);
      edtCompania.Text := DMLOG.DisplayDescrip('prvLOG', 'TGE101', '*', xsSql, 'CIADES');

      xsSql := ' LOCID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('LOCID').AsString) +
         ' AND CIAID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString);
      edtLocalidad.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', xsSql, 'LOCDES');

      xsSql := ' TMONID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('TMONID').AsString);
      edtTMoneda.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE103', 'TMONDES', xsSql, 'TMONDES');

      xsSql := ' TSCID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('TSCID').AsString);
      edtTipoCotizacion.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE137', 'TSCDES', xsSql, 'TSCDES');

      xsSql := ' LGECID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('LGECID').AsString);
      edtLEntrega.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE136', 'LGECDES', xsSql, 'LGECDES');

      xsSql := ' COMPCID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('COMPID').AsString);
      edtComprador.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE135', 'COMPDES', xsSql, 'COMPDES');

      xsSql := ' OBRAID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('OBRAID').AsString);
      edtTipoServicio.text := DMLOG.DisplayDescrip('prvSQL', 'TGE213', 'OBRADES', xsSql, 'OBRADES');

      xsSql := ' TINID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('TINID').AsString) + ' AND CIAID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString);
      edtTipoInventario.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xsSql, 'TINDES');

      xsSql := ' LOCID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('LOCID').AsString) +
         ' AND TINID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('TINID').AsString) +
         ' AND CIAID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString) +
         ' AND ALMID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('ALMID').AsString);
      edtAlmacen.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xsSql, 'ALMDES');
   End;

End;

Procedure TFRegSolCotizacion.FormShow(Sender: TObject);
Begin
   xnTasaIgv := (StrToFloat(DMLOG.DisplayDescrip('prvTGE', 'TGE108', 'TASACAN', 'TASAFLG=' + QuotedStr('I'), 'TASACAN')) / 100);
   fg_AsignaLookup;
   fg_AsignaDataSource;

   If DMLOG.wModo = 'A' Then
   Begin
      fg_DefaultCotizacion;
      fg_HabilitaCabecera(True);
      fg_HabilitaDetalle(False, 'NO');
      fg_ProformaRecupera('', '');
      fg_HabilitaPestania;
      fg_ProformaHabilitaDet(False);
   End
   Else
      If DMLOG.wModo = 'M' Then
      Begin
         fg_CotizacionRecupera(xsCompania, xsNumCotizacion);
         fg_HabilitaPorTipoCotizacion(DMLOG.cdsSolCot.FieldByName('TSCID').AsString);
         fg_ProformaRecupera(xsCompania, xsNumCotizacion);
         fg_HabilitaCabecera(True);
         fg_HabilitaDetalle(False, 'SI');
         DMLOG.cdsSolCot.Edit;
         fg_HabilitaPestania;
         fg_ProformaHabilitaDet(False);

      End
      Else
         If DMLOG.wModo = 'C' Then
         Begin
            fg_CotizacionRecupera(xsCompania, xsNumCotizacion);
            fg_HabilitaPorTipoCotizacion(DMLOG.cdsSolCot.FieldByName('TSCID').AsString);
            fg_ProformaRecupera(xsCompania, xsNumCotizacion);
            fg_HabilitaCabecera(False);
            fg_HabilitaDetalle(False, 'NO');
            fg_HabilitaPestania;
            If DMLOG.cdsSolCot.FieldByName('SCCEST').AsString = 'ANULADO' Then
            Begin
               fg_ProformaHabilitaDet(False);
            End
            Else
            Begin
               fg_ProformaHabilitaDet(True);
            End;

         End;
End;

Procedure TFRegSolCotizacion.dblcCompaniaExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := ' CIAID=' + Quotedstr(dblcCompania.Text);
   edtCompania.Text := DMLOG.DisplayDescrip('prvLOG', 'TGE101', '*', xsSql, 'CIADES');

   DMLOG.FiltraTabla(DMLOG.cdsLoc, 'TGE126', 'LOCID', 'LOCID', ' CIAID = ' + QuotedStr(dblcCompania.Text));
   DMLOG.FiltraTabla(DMLOG.cdsTINID, 'TGE152', 'TINID', 'TINID', ' CIAID = ' + QuotedStr(dblcCompania.Text));
End;

Procedure TFRegSolCotizacion.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TMemo Then Exit;
      If self.ActiveControl Is TDBMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFRegSolCotizacion.dblcLocalidadExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := ' LOCID = ' + QuotedStr(dblcLocalidad.Text) +
      ' AND CIAID = ' + QuotedStr(dblcCompania.Text);
   edtLocalidad.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', xsSql, 'LOCDES');
End;

Procedure TFRegSolCotizacion.dblcTipoServicioExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := ' OBRAID = ' + QuotedStr(dblcTipoServicio.Text);
   edtTipoServicio.text := DMLOG.DisplayDescrip('prvSQL', 'TGE213', 'OBRADES', xsSql, 'OBRADES');

End;

Procedure TFRegSolCotizacion.dblcTipoInventarioExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := ' TINID = ' + QuotedStr(dblcTipoInventario.Text) + ' AND CIAID = ' + QuotedStr(dblcCompania.Text);
   edtTipoInventario.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xsSql, 'TINDES');

   DMLOG.FiltraTabla(DMLOG.cdsALM, 'TGE151', 'ALMID', 'ALMID', 'CIAID=' + QuotedStr(dblcCompania.Text) + ' AND TINID=' + QuotedStr(dblcTipoInventario.Text));
   xsSql := ' CIAID = ' + QuotedStr(dblcCompania.Text) + ' AND TINID = ' + QuotedStr(dblcTipoInventario.Text);
   DMLOG.FiltraTabla(DMLOG.cdsArti, 'TGE205', '*', 'ARTID', xsSql);
End;

Procedure TFRegSolCotizacion.dblcAlmacenExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := ' LOCID = ' + QuotedStr(dblcLocalidad.Text) +
      ' AND TINID = ' + QuotedStr(dblcTipoInventario.Text) +
      ' AND CIAID = ' + QuotedStr(dblcCompania.Text) +
      ' AND ALMID = ' + QuotedStr(dblcAlmacen.Text);
   edtAlmacen.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xsSql, 'ALMDES');
End;

Procedure TFRegSolCotizacion.dblcTMonedaExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := ' TMONID = ' + QuotedStr(dblcTMoneda.Text);
   edtTMoneda.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', xsSql, 'TMONDES');
End;

Procedure TFRegSolCotizacion.dblcTipoCotizacionExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := ' TSCID = ' + QuotedStr(dblcTipoCotizacion.Text);
   edtTipoCotizacion.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE137', 'TSCDES', xsSql, 'TSCDES');

   If DMLOG.cdsSolCot.FieldByName('TSCID').AsString = '01' Then
   Begin
      DMLOG.cdsSolCot.FieldByName('TINID').AsString := '';
      DMLOG.cdsSolCot.FieldByName('ALMID').AsString := '';
      edtTipoInventario.Text := '';
      edtAlmacen.Text := '';
   End
   Else
      If DMLOG.cdsSolCot.FieldByName('TSCID').AsString = '02' Then
      Begin
         DMLOG.cdsSolCot.FieldByName('OBRAID').AsString := '';
         edtTipoServicio.Text := '';
         DMLOG.cdsSolCot.FieldByName('TINID').AsString := '26';
         DMLOG.cdsSolCot.FieldByName('ALMID').AsString := '01';
         dblcTipoInventarioExit(dblcTipoInventario);
         dblcAlmacenExit(dblcAlmacen);
      End;

   fg_HabilitaPorTipoCotizacion(dblcTipoCotizacion.Text);
End;

Procedure TFRegSolCotizacion.dblcLEntregaExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := ' LGECID = ' + QuotedStr(dblcLEntrega.Text);
   edtLEntrega.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE136', 'LGECDES', xsSql, 'LGECDES');
End;

Procedure TFRegSolCotizacion.dblcCompradorExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := ' COMPCID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('COMPID').AsString);
   edtComprador.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE135', 'COMPDES', xsSql, 'COMPDES');
End;

Function TFRegSolCotizacion.fg_ValidaCabecera(Var wgMensaje: String): Boolean;
Begin
   If Length(Trim(edtCompania.Text)) = 0 Then
   Begin
      wgMensaje := 'Debe ingresar la Compañía...';
      Result := False;
      Exit;
   End;
   If Length(Trim(edtLocalidad.Text)) = 0 Then
   Begin
      wgMensaje := 'Debe ingresar la localidad...';
      Result := False;
      Exit;
   End;
   If Length(Trim(dtpFechaCotizacion.Text)) = 0 Then
   Begin
      wgMensaje := 'Debe ingresar la fecha de la Solicitud de Cotización...';
      Result := False;
      Exit;
   End;
   If Length(Trim(edtNumCotizacion.Text)) = 0 Then
   Begin
      wgMensaje := 'Debe ingresar el Número de la Solicitud de Cotización...';
      Result := False;
      Exit;
   End;
   If Length(Trim(edtTMoneda.Text)) = 0 Then
   Begin
      wgMensaje := 'Debe ingresar la Moneda...';
      Result := False;
      Exit;
   End;
   If Length(Trim(edtTipoCotizacion.Text)) = 0 Then
   Begin
      wgMensaje := 'Debe ingresar el Tipo de Cotización...';
      Result := False;
      Exit;
   End;
   If Length(Trim(edtLEntrega.Text)) = 0 Then
   Begin
      wgMensaje := 'Debe ingresar el Lugar de Entrega...';
      Result := False;
      Exit;
   End;
   If Length(Trim(dtpFechaEntrega.Text)) = 0 Then
   Begin
      wgMensaje := 'Debe ingresar la Fecha de Entrega...';
      Result := False;
      Exit;
   End;
   If Length(Trim(edtComprador.Text)) = 0 Then
   Begin
      wgMensaje := 'Debe ingresar el Comprador...';
      Result := False;
      Exit;
   End;
   If Trim(dblcTipoCotizacion.Text) = '01' Then //si cotización de servicios
   Begin
      If Length(Trim(edtTipoServicio.Text)) = 0 Then
      Begin
         wgMensaje := 'Debe ingresar el Tipo de Servicio...';
         Result := False;
         Exit;
      End;
   End;
   If Trim(dblcTipoCotizacion.Text) = '02' Then //si cotización de compra
   Begin
      If Length(Trim(edtTipoInventario.Text)) = 0 Then
      Begin
         wgMensaje := 'Debe ingresar el Tipo de Inventario...';
         Result := False;
         Exit;
      End;
      If Length(Trim(edtAlmacen.Text)) = 0 Then
      Begin
         wgMensaje := 'Debe ingresar el Tipo de Almacén...';
         Result := False;
         Exit;
      End;
   End;

   If Length(Trim(memObservacion.Text)) = 0 Then
   Begin
      wgMensaje := 'Debe ingresar una Observación...';
      Result := False;
      Exit;
   End;
   Result := True;
End;

Procedure TFRegSolCotizacion.btnAceptaCabeceraClick(Sender: TObject);
Var
   xsMensaje: String;
Begin
   If DMLOG.cdsSolCot.FieldByName('SCCEST').AsString <> 'INICIAL' Then
   Begin
      ShowMessage('El Estado de la Solicitud de Cotización no permite su Modificación');
      Exit;
   End;
   If Not (DMLOG.cdsSolCot.State In [dsEdit]) Then
   Begin
      DMLOG.cdsSolCot.Edit;
   End;
   fg_CompletaCabecera;
   If fg_ValidaCabecera(xsMensaje) = False Then
   Begin
      ShowMessage(xsMensaje);
      Exit;
   End;

   fg_HabilitaCabecera(False);
   fg_HabilitaDetalle(True, 'NO');

   fg_GrabaSolCotizacionSQL;
   If DMLOG.wModo = 'A' Then
   Begin
      xsCompania := DMLOG.cdsSolCot.FieldByName('CIAID').AsString;
      xsNumCotizacion := DMLOG.cdsSolCot.FieldByName('SCCID').AsString;
      DMLOG.wModo := 'M';
   End;
   fg_CotizacionRecupera(xsCompania, xsNumCotizacion);
   pcTabDetalle.ActivePage := tsCotizacion;
End;

Procedure TFRegSolCotizacion.fg_HabilitaPorTipoCotizacion(wgTipoCotizacion: String);
Begin
   If Trim(wgTipoCotizacion) = '01' Then //si cotización de servicios
   Begin
      pnlTipoServicio.Enabled := True;
      dblcTipoServicio.Enabled := True;
      dblcTipoServicio.Color := clWindow;
      edtTipoServicio.Color := clWindow;

      pnlInventario.Enabled := False;
      dblcTipoInventario.Enabled := False;
      dblcAlmacen.Enabled := False;
      dblcTipoInventario.Color := $00E2E2E2;
      edtTipoInventario.Color := $00E2E2E2;
      dblcAlmacen.Color := $00E2E2E2;
      edtAlmacen.Color := $00E2E2E2;

   End;
   If Trim(wgTipoCotizacion) = '02' Then //si cotización de compra
   Begin
      pnlTipoServicio.Enabled := False;
      dblcTipoServicio.Enabled := False;
      dblcTipoServicio.Color := $00E2E2E2;
      edtTipoServicio.Color := $00E2E2E2;

      pnlInventario.Enabled := True;
      dblcTipoInventario.Enabled := False;
      dblcAlmacen.Enabled := False;
      dblcTipoInventario.Color := clWindow;
      edtTipoInventario.Color := clWindow;
      dblcAlmacen.Color := clWindow;
      edtAlmacen.Color := clWindow;

   End;
End;

Procedure TFRegSolCotizacion.fg_DefaultCotizacion;
Var
   xsSql: String;
Begin
   DMLOG.cdsSolCot.Edit;
   DMLOG.cdsSolCot.FieldByName('CIAID').AsString := '02';
   DMLOG.cdsSolCot.FieldByName('LOCID').AsString := '01';
   DMLOG.cdsSolCot.FieldByName('SCCFSOL').AsDateTime := Dates;
   DMLOG.cdsSolCot.FieldByName('TSCID').AsString := '02';
   DMLOG.cdsSolCot.FieldByName('TINID').AsString := '26';
   DMLOG.cdsSolCot.FieldByName('ALMID').AsString := '01';

   DMLOG.cdsSolCot.FieldByName('SCCEST').AsString := 'INICIAL';
   xsSql := ' USERID = ' + Quotedstr(DMLOG.wUsuario);
   DMLOG.cdsSolCot.FieldByName('COMPID').AsString := DMLOG.BuscaQry('dspUltTGE', 'TGE135', '*', xsSql, 'COMPCID');

   dblcCompaniaExit(dblcCompania);
   dblcLocalidadExit(dblcLocalidad);
   dblcTMonedaExit(dblcTMoneda);
   dblcTipoCotizacionExit(dblcTipoCotizacion);
   dblcTipoInventarioExit(dblcTipoInventario);
   dblcAlmacenExit(dblcAlmacen);

   dblcCompradorExit(dblcComprador);
   dblcComprador.Enabled := False;

   pcTabDetalle.ActivePage := tsCotizacion;
   dbgProformas.Enabled := False;

   tsProforma.Enabled := False;
   pcTabDetalle.Repaint;
End;

Procedure TFRegSolCotizacion.btnAdicionaDetCotizacionClick(Sender: TObject);
Begin
   If DMLOG.cdsSolCot.FieldByName('SCCEST').AsString <> 'INICIAL' Then
   Begin
      ShowMessage('El Estado de la Solicitud de Cotización no permite adicionar registros');
      Exit;
   End;
   pnlDetalleCotizacion.Visible := True;
   fg_HabilitaDetalle(False, 'SI');
   fg_DefaultDetCotizacion;
   xsModoCotizacionDet := 'A';
End;

Procedure TFRegSolCotizacion.fg_HabilitaCabecera(wgBoolean: Boolean);
Begin
   dblcCompania.Enabled := False;
   dblcLocalidad.Enabled := wgBoolean;
   dtpFechaCotizacion.Enabled := False;
   edtNumCotizacion.Enabled := False;
   dblcTMoneda.Enabled := wgBoolean;
   dblcTipoCotizacion.Enabled := wgBoolean;
   dblcLEntrega.Enabled := wgBoolean;
   dtpFechaEntrega.Enabled := wgBoolean;
   dblcComprador.Enabled := False;
   dblcTipoServicio.Enabled := wgBoolean;
   dblcTipoInventario.Enabled := False;
   dblcAlmacen.Enabled := False;
   btnAceptaCabecera.Enabled := wgBoolean;
   memObservacion.Enabled := wgBoolean;
   btnAceptaCabecera.Enabled := wgBoolean;
End;

Procedure TFRegSolCotizacion.fg_HabilitaDetalle(wgBoolean: Boolean; wgEdicion: String);
Begin
   btnAceptar.Enabled := wgBoolean;
   btnGrabar.Enabled := wgBoolean;
   btnEditarCabecera.Enabled := wgBoolean;
   btnAdicionaDetCotizacion.Enabled := wgBoolean;
   btnImprimeSolCotizacion.Enabled := wgBoolean;
   dbgDetalleCotizacion.Enabled := wgBoolean;
   btnAnular.Enabled := wgBoolean;
   btnImprimeSolCotizacion.Enabled := wgBoolean;

   If wgEdicion = 'NO' Then
   Begin
      btnAnular.Enabled := True;
      btnImprimeSolCotizacion.Enabled := True;
   End;
   If DMLOG.cdsSolCot.FieldByName('SCCEST').AsString = 'ANULADO' Then
   Begin
      btnAnular.Enabled := False;
   End;
End;

Procedure TFRegSolCotizacion.btnEditarCabeceraClick(Sender: TObject);
Begin
   fg_HabilitaCabecera(True);
   fg_HabilitaDetalle(False, 'SI');
   If DMLOG.cdsSolCot.State <> DSEdit Then
   Begin
      DMLOG.cdsSolCot.Edit;
   End;
End;

Function TFRegSolCotizacion.fg_NumSolCotizacion(wgFecha: Tdate): String;
Var
   xsSql: String;
   xsNumSolCotizacion: String;
   xsFecha: String;
Begin
   xsFecha := DateToStr(wgFecha);
   xsSql := ' CIAID = ' + QuotedStr(dblcCompania.Text);

   xsNumSolCotizacion := DMLOG.MaxSQL('LOG302', 'SCCID', xsSql);

   If copy(xsNumSolCotizacion, 1, 4) = Copy(xsFecha, 7, 4) Then
      Result := xsNumSolCotizacion
   Else
      Result := Copy(xsFecha, 7, 4) + '0001';

End;

Procedure TFRegSolCotizacion.fg_CompletaCabecera;
Var
   xsFecha: String;
   xsSql: String;
Begin

   xsFecha := FormatDateTime(DMLOG.wFormatFecha, dtpFechaCotizacion.Date);
   xsSql := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(xsFecha);
   DMLOG.FiltraCDS(DMLOG.cdsPeriodo, xsSql);

   If DMLOG.wModo = 'A' Then
   Begin
      DMLOG.cdsSolCot.FieldByName('SCCID').AsString := fg_NumSolCotizacion(dtpFechaCotizacion.Date);
   End;
   DMLOG.cdsSolCot.FieldByName('SCCUSER').AsString := DMLOG.wUsuario;
   DMLOG.cdsSolCot.FieldByName('SCCFREG').AsDateTime := Dates;
   DMLOG.cdsSolCot.FieldByName('SCCHREG').AsDateTime := Dates;
   DMLOG.cdsSolCot.FieldByName('SCCANO').AsString := Copy(xsFecha, 7, 4);
   DMLOG.cdsSolCot.FieldByName('SCCMM').AsString := DMLOG.strzero(Copy(xsFecha, 4, 2), 2);
   DMLOG.cdsSolCot.FieldByName('SCCDD').AsString := DMLOG.strzero(Copy(xsFecha, 1, 2), 2);
   DMLOG.cdsSolCot.FieldByName('SCCTRI').AsString := DMLOG.cdsPeriodo.fieldbyName('FECTRIM').asString;
   DMLOG.cdsSolCot.FieldByName('SCCSEM').AsString := DMLOG.cdsPeriodo.fieldbyName('FECSEM').asString;
   DMLOG.cdsSolCot.FieldByName('SCCSS').AsString := DMLOG.cdsPeriodo.fieldbyName('FECSS').asString;
   DMLOG.cdsSolCot.FieldByName('SCCANOMM').AsString := Copy(xsFecha, 7, 4) + DMLOG.strzero(Copy(xsFecha, 4, 2), 2);
   DMLOG.cdsSolCot.FieldByName('SCCAATRI').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAATRI').asString;
   DMLOG.cdsSolCot.FieldByName('SCCAASEM').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAASEM').asString;
   DMLOG.cdsSolCot.FieldByName('SCCAASS').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAASS').asString;

End;

Procedure TFRegSolCotizacion.btnCancelarDetalleClick(Sender: TObject);
Begin
   If DMLOG.cdsDSolCot.State In [dsInsert, dsEdit] Then
   Begin
      DMLOG.cdsDSolCot.Cancel;
   End;
   //fg_LimpiarPanel;
   pnlDetalleCotizacion.Visible := False;
   fg_habilitaDetalle(True, 'NO');
   fg_CotizacionRecuperaDet(dblcCompania.Text, edtNumCotizacion.Text);
End;

Procedure TFRegSolCotizacion.btnAdicionarDetalleClick(Sender: TObject);
Var
   xsMensaje: String;
Begin
   Try
      fg_CompletaDetalle;
      If fg_ValidaPanelDetSolCotizacion(xsMensaje) = False Then
      Begin
         ShowMessage(xsMensaje);
         Exit;
      End;

      fg_GrabaSolCotizacionDetSQL;
      fg_CotizacionRecuperaDet(dblcCompania.Text, edtNumCotizacion.Text);
      If xsModoCotizacionDet = 'A' Then
      Begin
         btnAdicionaDetCotizacionClick(btnAdicionaDetCotizacion);
      End
      Else
         If xsModoCotizacionDet = 'M' Then
         Begin
            btnCancelarDetalleClick(btnCancelarDetalle);
         End;
      Exit;
   Except
      ShowMessage('Error al actualizar el detalle de la cotización');
      Exit;
   End;
End;

Function TFRegSolCotizacion.fg_ValidaPanelDetSolCotizacion(Var wgMensaje: String): Boolean;
Begin
   If Length(Trim(edtItemServicio.Text)) = 0 Then
   Begin
      wgMensaje := 'Debe ingresar el Item...';
      Result := False;
      Exit;
   End;
   If Length(Trim(cbdlgArticulo.Text)) = 0 Then
   Begin
      wgMensaje := 'Debe ingresar el código del artículo...';
      Result := False;
      Exit;
   End;
   If Length(Trim(dblcUnidadMedidaServicio.Text)) = 0 Then
   Begin
      wgMensaje := 'Debe ingresar la Unidad de Medida...';
      Result := False;
      Exit;
   End;
   If Length(Trim(edtCantidadPedidaServicio.Text)) = 0 Then
   Begin
      wgMensaje := 'Debe ingresar la Cantidad...';
      Result := False;
      Exit;
   End;
   If Length(Trim(memObservacionServicio.Text)) = 0 Then
   Begin
      wgMensaje := 'Debe ingresar la Observación...';
      Result := False;
      Exit;
   End;
   Result := True;

End;

Procedure TFRegSolCotizacion.fg_CompletaDetalle;
Var
   xsSql: String;
Begin

   DMLOG.cdsDSolCot.FieldByName('CIAID').AsString := DMLOG.cdsSolCot.FieldByName('CIAID').AsString; //Compañia
   DMLOG.cdsDSolCot.FieldByName('SCCID').AsString := DMLOG.cdsSolCot.FieldByName('SCCID').AsString; //SolicitudDeCotización

   xsSql := ' CIAID = ' + QuotedStr(dblcCompania.Text) +
      ' AND TINID = ' + QuotedStr(dblcTipoInventario.Text) +
      ' AND ARTID = ' + QuotedStr(cbdlgArticulo.Text);
   If DMLOG.DisplayDescrip('prvLOG', 'TGE205', '*', xsSql, 'ARTDES') = '' Then
   Begin
      DMLOG.cdsDSolCot.FieldByName('ARTID').AsString := DMLOG.cdsDSolCot.FieldByName('DSCCID').AsString; //Código del artículo
   End;
   DMLOG.cdsDSolCot.FieldByName('SCCTIP').AsString := DMLOG.cdsSolCot.FieldByName('SCCTIP').AsString; //Tipo de Solicitud Cotizacion
   DMLOG.cdsDSolCot.FieldByName('SCCUSER').AsString := DMLOG.wUsuario; //Código del Usuario
   DMLOG.cdsDSolCot.FieldByName('COMPID').AsString := DMLOG.cdsSolCot.FieldByName('COMPID').AsString; //Código del comprador
   DMLOG.cdsDSolCot.FieldByName('TINID').AsString := DMLOG.cdsSolCot.FieldByName('TINID').AsString; //Tipo de Inventario
   DMLOG.cdsDSolCot.FieldByName('SCCANO').AsString := DMLOG.cdsSolCot.FieldByName('SCCANO').AsString; //Año
   DMLOG.cdsDSolCot.FieldByName('SCCMES').AsString := DMLOG.cdsSolCot.FieldByName('SCCMM').AsString; //Mes
   DMLOG.cdsDSolCot.FieldByName('SCCDIA').AsString := DMLOG.cdsSolCot.FieldByName('SCCDD').AsString; //Dia
   DMLOG.cdsDSolCot.FieldByName('SCCTRIM').AsString := DMLOG.cdsSolCot.FieldByName('SCCTRI').AsString; //Trimestre
   DMLOG.cdsDSolCot.FieldByName('SCCSEM').AsString := DMLOG.cdsSolCot.FieldByName('SCCSEM').AsString; //SemanaDelMes
   DMLOG.cdsDSolCot.FieldByName('SCCANOMES').AsString := DMLOG.cdsSolCot.FieldByName('SCCANOMM').AsString; //AñoMes
   DMLOG.cdsDSolCot.FieldByName('SCCSS').AsString := DMLOG.cdsSolCot.FieldByName('SCCSS').AsString; //Semana
   DMLOG.cdsDSolCot.FieldByName('SCCAATRI').AsString := DMLOG.cdsSolCot.FieldByName('SCCAATRI').AsString; //AñoTrimestre
   DMLOG.cdsDSolCot.FieldByName('SCCAASEM').AsString := DMLOG.cdsSolCot.FieldByName('SCCAASEM').AsString; //AñoSemanaDelMes
   DMLOG.cdsDSolCot.FieldByName('SCCAASS').AsString := DMLOG.cdsSolCot.FieldByName('SCCAASS').AsString; //AñoSemana

End;

Procedure TFRegSolCotizacion.fg_DefaultDetCotizacion;
Var
   xsItemMax, xsSql: String;
Begin
   DMLOG.cdsDSolCot.Append;

   xsItemMax := DMLOG.StrZero(DMLOG.MaxValue('DSCCID', DMLOG.cdsDSolCot), 3);
   DMLOG.cdsDSolCot.FieldByName('DSCCID').AsString := xsItemMax;
   DMLOG.cdsDSolCot.FieldByName('ARTID').AsString := xsItemMax;

   DMLOG.cdsDSolCot.FieldByName('UNMIDG').AsString := 'UND';
   dblcUnidadMedidaServicioExit(dblcUnidadMedidaServicio);

   xsSql := ' CIAID = ' + QuotedStr(dblcCompania.Text) + ' AND TINID = ' + QuotedStr(dblcTipoInventario.Text);
   DMLOG.FiltraTabla(DMLOG.cdsArti, 'TGE205', '*', 'ARTID', xsSql);

   cbdlgArticulo.SetFocus;
End;

Procedure TFRegSolCotizacion.dblcUnidadMedidaServicioExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := 'UNMID=' + QuotedStr(dblcUnidadMedidaServicio.text);
   edtUnidadMedServicio.Text := DMLOG.displaydescrip('prvSQL', 'TGE130', 'UNMDES', xsSql, 'UNMDES');
End;

Procedure TFRegSolCotizacion.btnGrabarClick(Sender: TObject);
Begin
   Try
      fg_GrabaSolCotizacionSQL;

      fg_GrabaSolCotizacionDetSQL;
      fg_CotizacionRecupera(xsCompania, xsNumCotizacion);
      fg_HabilitaCabecera(False);
      Showmessage('Datos Grabados correctamente');
      Exit;
   Except
      Raise Exception.Create('Error al momento de Grabar Solicitud de Cotización');
   End;

End;

Procedure TFRegSolCotizacion.dbgDetalleCotizacionDblClick(Sender: TObject);
Var
   xsSql: String;
Begin
   If DMLOG.cdsDSolCot.RecordCount = 0 Then
   Begin
      ShowMessage(' No existe registros a modificar ');
      Exit;
   End;
   pnlDetalleCotizacion.Visible := True;
   dblcUnidadMedidaServicioExit(dblcUnidadMedidaServicio);
   fg_HabilitaDetalle(False, 'SI');
   If DMLOG.cdsDSolCot.State <> DsEdit Then
   Begin
      DMLOG.cdsDSolCot.Edit;
   End;
   xsModoCotizacionDet := 'M';

   xsSql := ' CIAID = ' + QuotedStr(dblcCompania.Text) + ' AND TINID = ' + QuotedStr(dblcTipoInventario.Text);
   DMLOG.FiltraTabla(DMLOG.cdsArti, 'TGE205', '*', 'ARTID', xsSql);
End;

Procedure TFRegSolCotizacion.dbgDetalleCotizacionKeyDown(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Var
   xsSql: String;
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg(' ¿ Eliminar Registro ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         xsSql := 'Delete LOG303 '
            + '     where CIAID = ' + QuotedStr(DMLOG.cdsDSolCot.FieldByName('CIAID').AsString)
            + '       and SCCID = ' + QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCID').AsString)
            + '       and DSCCID = ' + QuotedStr(DMLOG.cdsDSolCot.FieldByName('DSCCID').AsString);
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xsSql);
         fg_CotizacionRecuperaDet(dblcCompania.Text, edtNumCotizacion.Text);
      Except
         ShowMessage('Error al eliminar el detalle de la Solicitud de Cotización');
         Exit;
      End;
   End;
End;

Procedure TFRegSolCotizacion.btnAceptarClick(Sender: TObject);
Begin
   If DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString <> 'INICIAL' Then
   Begin
      ShowMessage('La Solicitud de Cotización no está en estado INICIAL' + #13 + 'No puede pasar a estado ACEPTADO');
      Exit;
   End;
   If DMLOG.cdsDSolCot.RecordCount = 0 Then
   Begin
      ShowMessage('La Solicitud de Cotiazación no tiene Detalle ' + #13 + 'No puede pasar a estado ACEPTADO');
      Exit;
   End;

   If MessageDlg('Se pasará a estado ACEPTADO la Solicitud de Cotización,' + #13 + ' ¿Desea Continuar?', mtconfirmation, [mbYes, MbNo], 0) = mrNo Then
   Begin
      Exit;
   End;
   Try
      Screen.Cursor := crHourGlass;

      If DMLOG.cdsSolCot.State In [dsBrowse] Then
      Begin
         DMLOG.cdsSolCot.Edit;
         DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString := 'ACEPTADO';
         fg_GrabaSolCotizacionSQL;

         If DMLOG.wTipoAdicion = 'xFiltro' Then
         Begin
            DMLOG.ActualizaFiltro(Mtx3000, DMLOG.cdsSolCot, 'M');
         End;
         fg_CotizacionRecupera(xsCompania, xsNumCotizacion);
         fg_HabilitaCabecera(False);
         fg_HabilitaDetalle(False, 'NO');
         DMLOG.wModo := 'C';
         fg_HabilitaPestania;
      End
      Else
      Begin
         ShowMessage('No se pudo pasar a estado ACEPTADO la Solicitud de Cotización');
      End;
   Except
      ShowMessage('Error al momento de Actualizar la Solicitud de Cotización');
   End;
   Screen.Cursor := crDefault
End;

Procedure TFRegSolCotizacion.btnSalirClick(Sender: TObject);
Begin
   If (DMLOG.cdsSolCot.Modified) Or (DMLOG.cdsSolCot.changeCount > 0) Or
      (DMLOG.cdsDSolCot.Modified) Or (DMLOG.cdsDSolCot.changeCount > 0) Then
   Begin
      If MessageDlg(' Existe Registros sin Grabar ' + #13 +
         ' Desea Salir sin Grabar los cambios? ', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
      Begin
         Close;
      End
      Else
      Begin
         Exit;
      End;
   End;
   Close;
End;

Procedure TFRegSolCotizacion.btnAdicionaProformaClick(Sender: TObject);
Begin

   If DMLOG.cdsDSolCot.RecordCount = 0 Then
   Begin
      ShowMessage('La Solicitud de Cotización no tiene Detalle');
      Exit;
   End;
   If DMLOG.cdsSolCot.FieldByName('SCCEST').AsString <> 'ACEPTADO' Then
   Begin
      ShowMessage('El Estado de la Solicitud de Cotización no permite ingresar Proformas');
      Exit;
   End;
   xsModoProforma := 'A';
   fg_ProformaRecuperaDet('', '');
   fg_UbicacionPanelProforma;
   pnlProformaProveedor.Visible := True;
   fg_HabilitaDetalle(False, 'SI');
   fg_ProformaHabilitaCab(True);
   fg_ProformaHabilitaDet(False);
   fg_DefaultProforma;
   fg_ProformaHabilitaBotones(False);

End;

Procedure TFRegSolCotizacion.btnCancelaProformaClick(Sender: TObject);
Begin
   If DMLOG.cdsProforma.State In [dsInsert, dsEdit] Then
   Begin
      DMLOG.cdsProforma.Cancel;
   End;
   fg_ProformaRecupera(dblcCompania.Text, edtNumCotizacion.Text);
   pnlProformaProveedor.Visible := False;
   fg_HabilitaDetalle(False, 'NO');
   fg_ProformaHabilitaDet(True);
   fg_ProformaHabilitaBotones(True);
   fg_ProformaLimpiaPanel;
End;

Procedure TFRegSolCotizacion.fg_ProformaRecupera(wgCompania, wgNumCotizacion: String);
Var
   xsSql: String;
Begin
   xsSql := ' Select * '
      + '       from LOG312 '
      + '      where CIAID=' + QuotedStr(wgCompania)
      + '        and SCCID = ' + QuotedStr(wgNumCotizacion);
   DMLOG.cdsProforma.Close;
   DMLOG.cdsProforma.DataRequest(xsSql);
   DMLOG.cdsProforma.Open;

End;

Procedure TFRegSolCotizacion.fg_DefaultProforma;
Begin
   DMLOG.cdsProforma.Append;
   DMLOG.cdsProforma.FieldByName('CIAID').AsString := DMLOG.cdsSolCot.FieldByName('CIAID').AsString;
   DMLOG.cdsProforma.FieldByName('SCCID').AsString := DMLOG.cdsSolCot.FieldByName('SCCID').AsString;
   DMLOG.cdsProforma.FieldByName('CLAUXID').AsString := 'P';
   DMLOG.cdsProforma.FieldByName('PROFFEMI').AsDateTime := Dates;
   dblcTipoAuxiliarExit(dblcTipoAuxiliar);
End;

Procedure TFRegSolCotizacion.dblcTipoAuxiliarExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := 'CLAUXID = ' + QuotedStr(dblcTipoAuxiliar.Text);

   edtTipoAuxiliar.text := DMLOG.DisplayDescrip('prvSQL', 'TGE102', 'CLAUXDES', xsSql, 'CLAUXDES');

   If edtTipoAuxiliar.Text = '' Then
   Begin
      ShowMessage('Tipo de Auxiliar del Proveedor no válido');
      dblcTipoAuxiliar.SetFocus;
      Exit;
   End;
   DMLOG.FiltraTabla(DMLOG.cdsProv, 'TGE201', 'PROV', 'PROV', 'ACTIVO = ' + QuotedStr('S') + ' AND CLAUXID = ' + QuotedStr(dblcTipoAuxiliar.Text));
   DMLOG.cdsProforma.fieldbyName('PROV').asString := '';
   edtProveedor.Text := '';

End;

Procedure TFRegSolCotizacion.dblcdProveedorExit(Sender: TObject);
Var
   xsSql, xsMensaje: String;
Begin
   If dblcdProveedor.Text = '' Then Exit;
   If DMLOG.fg_ValidaDatosProveedor(dblcTipoAuxiliar.Text, dblcdProveedor.Text, xsMensaje) = False Then
   Begin
      ShowMessage(xsMensaje);
      DMLOG.cdsProforma.FieldByName('PROV').AsString := '';
      dblcdProveedor.SetFocus;
      Exit;
   End;
   xsSql := ' PROV = ' + QuotedStr(dblcdProveedor.Text) + ' AND CLAUXID = ' + QuotedStr(dblcTipoAuxiliar.Text);
   edtProveedor.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE201', 'PROVDES', xsSql, 'PROVDES');
   DMLOG.cdsProforma.FieldByName('PROVDES').AsString := edtProveedor.Text;
   DMLOG.cdsProforma.FieldByName('PROVRUC').AsString := DMLOG.cdsProv.FieldByName('PROVRUC').AsString
End;

Procedure TFRegSolCotizacion.dblcFormaDePagoExit(Sender: TObject);
Begin
   edtFormaDePago.Text := DMLOG.DisplayDescrip('prvSQL', 'CXC101', 'CCOMERDES', 'CCOMERID=' + QuotedStr(dblcFormaDePago.text), 'CCOMERDES');
End;

Function TFRegSolCotizacion.fg_ProformaValida(
   Var wgMensaje: String): Boolean;
Begin
   If edtTipoAuxiliar.Text = '' Then
   Begin
      wgMensaje := 'Debe ingresar un Tipo de Auxiliar Válido';
      Result := False;
      Exit;
   End;
   If edtProveedor.Text = '' Then
   Begin
      wgMensaje := 'Debe ingresar un Proveedor válido';
      Result := False;
      Exit;
   End;
   If edtFormaDePago.Text = '' Then
   Begin
      wgMensaje := 'Debe ingresar una forma de pago Válida';
      Result := False;
      Exit;
   End;
   If dblcTipoGarantia.Text = '' Then
   Begin
      wgMensaje := 'Debe ingresar el Tipo de Garantía';
      Result := False;
      Exit;
   End;
   If seDiasVigencia.Value = 0 Then
   Begin
      wgMensaje := 'Debe ingresar el Tiempo de Vigencia de la Proforma';
      Result := False;
      Exit;
   End;
   If seTiempoEntrega.Value = 0 Then
   Begin
      wgMensaje := 'Debe ingresar el Tiempo de Entrega ';
      Result := False;
      Exit;
   End;
   Result := True;
End;

Procedure TFRegSolCotizacion.fg_InicializaDetProforma(wgCompania, wgSolCotizacion: String);
Var
   xsSql: String;
Begin
   xsSql := 'Insert into LOG313 (CIAID, ' //Compañía
      + '                        PROFID,  ' //Código de la Proforma
      + '                        ARTID,  '  //Código del artículo
      + '                        UNMIDG,  '  //Unidad de medida general
      + '                        DPROFID,  '  //numero de item del detalle de la proforma
      + '                        DPROFCNTG,  '  //cantidad general
      + '                        CLAUXID, '  //Tipo Auxliar
      + '                        DPROFPROV,  '  //codigo proveedor
      + '                        DPROFPRVD,  '  //nombre del proveedor
      + '                        DPROFOBS,  '  //observacion
      + '                        DPROFFREG,  '  //fecha de registro
      + '                        PROFUSER,  '  //Usuario
      + '                        TINID,  '  //tipo de inventario
      + '                        GRARID,  '  //linea
      + '                        FAMID,  '  //famlia
      + '                        SFAMID, '  //subfamilia
      + '                        SCCID )'
      + '    Select LOG303.CIAID, '  //CIAID
      +             QuotedStr(edtNumProforma.Text) + ',' //PROFID
      + '           LOG303.ARTID, ' //ARTID
      + '           LOG303.UNMIDG, ' //UNMIDG
      + '           LOG303.DSCCID, ' //DPROFID
      + '           LOG303.DSCCCNTG, ' //DPROFCNTG
      +             QuotedStr(dblcTipoAuxiliar.Text) + ','
      +             QuotedStr(dblcdProveedor.Text) + ',' //DPROFPROV
      +             QuotedStr(edtProveedor.Text) + ',' //DPROFPRVD
      + '           LOG303.DSCOBS, ' //DPROFOBS
      + '           sysdate, ' //DPROFFREG
      + '           USER,' //PROFUSER
      + '           LOG303.TINID,' //TINID
      + '           LOG303.GRARID,' //GRARID
      + '           LOG303.FAMID,' //FAMID
      + '           LOG303.SFAMID, ' //SFAMID
      + '           LOG303.SCCID'
      + '      from LOG303 '
      + '     where LOG303.CIAID = ' + QuotedStr(wgCompania)
      + '       and LOG303.SCCID = ' + QuotedStr(wgSolCotizacion);
   DMLOG.DCOM1.AppServer.EjecutaSQL(xsSql);
End;

Procedure TFRegSolCotizacion.btnAceptaCabProformaClick(Sender: TObject);
Var
   xsMensaje: String;
Begin
   Try
      If DMLOG.cdsSolCot.FieldByName('SCCEST').AsString <> 'ACEPTADO' Then
      Begin
         ShowMessage('El Estado de la Solicitud de Cotización el registro de la Proformas');
         Exit;
      End;
      fg_ProformaCompletar;
      If fg_ProformaValida(xsMensaje) = False Then
      Begin
         ShowMessage(xsMensaje);
         Exit;
      End;
      fg_ProformaGrabarSQL;
      //copia los items de la solicitud de cotización hacia la proforma
      fg_ProformaRecuperaDet(DMLOG.cdsProforma.FieldByName('CIAID').AsString, DMLOG.cdsProforma.FieldByName('PROFID').AsString);
      If DMLOG.cdsDProforma.RecordCount = 0 Then
      Begin
         fg_InicializaDetProforma(dblcCompania.Text, edtNumCotizacion.Text);
         fg_ProformaRecuperaDet(DMLOG.cdsProforma.FieldByName('CIAID').AsString, DMLOG.cdsProforma.FieldByName('PROFID').AsString);
      End;
      fg_ProformaHabilitaCab(False);
      dbgDetalleProforma.Enabled := True;
      fg_CComparativoActualizaEstado('INICIAL');

      Exit;
   Except
      ShowMessage('Error al actualizar la Proforma');
      Exit;
   End;
End;

Procedure TFRegSolCotizacion.fg_ProformaCompletar;
Var
   xsFecha, xsSql: String;
Begin

   xsFecha := FormatDateTime(DMLOG.wFormatFecha, dtpFechaProforma.Date);
   xsSql := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(xsFecha);
   DMLOG.FiltraCDS(DMLOG.cdsPeriodo, xsSql);

   If xsModoProforma = 'A' Then
   Begin
      DMLOG.cdsProforma.FieldByName('PROFID').AsString := fg_NumProforma(dtpFechaProforma.Date);
   End;

   DMLOG.cdsProforma.FieldByName('TMONID').AsString := DMLOG.cdsSolCot.FieldByName('TMONID').AsString;
   DMLOG.cdsProforma.FieldByName('PROFUSER').AsString := DMLOG.wUsuario;

   DMLOG.cdsProforma.FieldByName('PROFFREG').AsDateTime := Dates;
   DMLOG.cdsProforma.FieldByName('PROFHREG').AsDateTime := Dates;
   DMLOG.cdsProforma.FieldByName('PROFANO').AsString := Copy(xsFecha, 7, 4);
   DMLOG.cdsProforma.FieldByName('PROFMM').AsString := DMLOG.strzero(Copy(xsFecha, 4, 2), 2);
   DMLOG.cdsProforma.FieldByName('PROFDD').AsString := DMLOG.strzero(Copy(xsFecha, 1, 2), 2);
   DMLOG.cdsProforma.FieldByName('PROFTRI').AsString := DMLOG.cdsPeriodo.fieldbyName('FECTRIM').asString;
   DMLOG.cdsProforma.FieldByName('PROFSEM').AsString := DMLOG.cdsPeriodo.fieldbyName('FECSEM').asString;
   DMLOG.cdsProforma.FieldByName('PROFSS').AsString := DMLOG.cdsPeriodo.fieldbyName('FECSS').asString;
   DMLOG.cdsProforma.FieldByName('PROFANOMM').AsString := Copy(xsFecha, 7, 4) + DMLOG.strzero(Copy(xsFecha, 4, 2), 2);
   DMLOG.cdsProforma.FieldByName('PROFAATRI').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAATRI').asString;
   DMLOG.cdsProforma.FieldByName('PROFAASEM').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAASEM').asString;
   DMLOG.cdsProforma.FieldByName('PROFAASS').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAASS').asString;

End;

Procedure TFRegSolCotizacion.dbgProformasDblClick(Sender: TObject);
Begin
   If DMLOG.cdsProforma.RecordCount = 0 Then
   Begin
      ShowMessage('No seleccionó ninguna Proforma');
      Exit;
   End;
   If Not DMLOG.cdsProforma.Locate('CIAID;PROFID',
      VarArrayOf([DMLOG.cdsProforma.FieldByName('CIAID').AsString,
      DMLOG.cdsProforma.FieldByName('PROFID').AsString]), []) Then
   Begin
      ShowMessage('No se seleccionó ninguna Proforma');
      Exit;
   End;
   If DMLOG.cdsSolCot.FieldByName('SCCEST').AsString <> 'ACEPTADO' Then
   Begin
      ShowMessage('El estado de la Solicitud de Cotización' + #13 +
         'no permite modificar las Proformas');
      Exit;
   End;

   xsModoProforma := 'M';
   DMLOG.cdsProforma.Edit;
   fg_ProformaCompletaPanel;
   fg_UbicacionPanelProforma;
   pnlProformaProveedor.Visible := True;
   fg_HabilitaDetalle(False, 'SI');
   fg_ProformaHabilitaCab(True);
   fg_ProformaHabilitaDet(False);
   fg_ProformaRecuperaDet(DMLOG.cdsProforma.FieldByName('CIAID').AsString,
      DMLOG.cdsProforma.FieldByName('PROFID').AsString);
   fg_ProformaHabilitaBotones(False);
End;

Function TFRegSolCotizacion.fg_NumProforma(wgFecha: Tdate): String;
Var
   xsSql: String;
   xsNumProforma: String;
   xsFecha: String;
Begin
   xsFecha := DateToStr(wgFecha);
   xsSql := ' CIAID = ' + QuotedStr(dblcCompania.Text);

   xsNumProforma := DMLOG.MaxSQL('LOG312', 'PROFID', xsSql);

   If copy(xsNumProforma, 1, 4) = Copy(xsFecha, 7, 4) Then
      Result := xsNumProforma
   Else
      Result := Copy(xsFecha, 7, 4) + '0001';
End;

Procedure TFRegSolCotizacion.btnAdicionaDetProformaClick(Sender: TObject);
Begin
   pnlProformaDetalle.Visible := True;
   fg_HabilitaDetalle(False, 'SI');
   fg_DefaultDetCotizacion;
End;

Procedure TFRegSolCotizacion.fg_ProformaHabilitaCab(wgBoolean: Boolean);
Begin
   dblcTipoAuxiliar.Enabled := wgBoolean;
   dblcdProveedor.Enabled := wgBoolean;
   dblcFormaDePago.Enabled := wgBoolean;
   dblcTipoGarantia.Enabled := wgBoolean;
   seDiasVigencia.Enabled := wgBoolean;
   seTiempoEntrega.Enabled := wgBoolean;
   btnAceptaCabProforma.Enabled := wgBoolean;
   memObservacionProforma.Enabled := wgBoolean;

   If xsModoProforma = 'M' Then
   Begin
      dblcTipoAuxiliar.Enabled := False;
      dblcdProveedor.Enabled := False;
   End;
End;

Procedure TFRegSolCotizacion.fg_ProformaHabilitaDet(wgBoolean: Boolean);
Begin
   dbgDetalleProforma.Enabled := wgBoolean;
   btnAdicionaProforma.Enabled := wgBoolean;
   dbgProformas.Enabled := wgBoolean;
End;

Procedure TFRegSolCotizacion.dbgDetalleProformaDblClick(Sender: TObject);
Var
   xsSql: String;
Begin
   pnlProformaDetalle.Visible := True;
   DMLOG.cdsDProforma.Edit;
   stTituloProforma.Color := clInactiveCaption;
   btnCancelaProforma.Enabled := False;
   xsSql := 'UNMID=' + QuotedStr(dblcProfDetUnidMedida.text);
   edtProfDetUnidMedida.Text := DMLOG.displaydescrip('prvSQL', 'TGE130', 'UNMDES', xsSql, 'UNMDES');
   dbgDetalleProforma.Enabled := False;
End;

Procedure TFRegSolCotizacion.fg_ProformaRecuperaDet(wgCompania,
   wgNumProforma: String);
Var
   xsSql: String;
Begin
   xsSql := ' Select * '
      + '       from LOG313 '
      + '      where CIAID=' + QuotedStr(wgCompania)
      + '        and PROFID = ' + QuotedStr(wgNumProforma);
   DMLOG.cdsDProforma.Close;
   DMLOG.cdsDProforma.DataRequest(xsSql);
   DMLOG.cdsDProforma.Open;

   xsSql := ' CIAID=' + QuotedStr(wgCompania) + 'AND PROFID = ' + QuotedStr(wgNumProforma);

   dbgDetalleProforma.ColumnByName('DPROFPUNG').FooterValue := 'Total:';
   dbgDetalleProforma.ColumnByName('DPROFIMP').FooterValue := DMLOG.BuscaQry('dspUltTGE', 'LOG313', 'SUM(DPROFIMP) TOTAL', xsSql, 'TOTAL');
End;

Procedure TFRegSolCotizacion.btnCancelaDetProformaClick(Sender: TObject);
Begin
   If DMLOG.cdsDProforma.State In [dsInsert, dsEdit] Then
   Begin
      DMLOG.cdsDProforma.Cancel;
   End;
   stTituloProforma.Color := clHighlight;
   pnlProformaDetalle.Visible := False;
   dbgDetalleProforma.Enabled := True;
   btnCancelaProforma.Enabled := True;
End;

Procedure TFRegSolCotizacion.btnAceptaDetProformaClick(Sender: TObject);
Begin

   If edtProfDetPrecioUnit.Text = '' Then
   Begin
      ShowMessage('Debe ingresar el Precio Unitario ');
      Exit;
   End;
   If edtProfDetTotal.Text = '' Then
   Begin
      ShowMessage('Debe ingresar el Total');
      Exit;
   End;

   stTituloProforma.Color := clHighlight;
   pnlProformaDetalle.Visible := False;
   fg_ProformaHabilitaDet(True);
   btnCancelaProforma.Enabled := True;
   fg_ProformaCompletarDet;
   Try
      fg_ProformaGrabarDetSQL;
      fg_ProformaActualizaTotales(dblcCompania.Text, edtNumCotizacion.Text, edtNumProforma.Text);
      fg_ProformaRecuperaDet(dblcCompania.Text, edtNumProforma.Text);
   Except
      ShowMessage('Error al actualizar el detalle de la cotización');
      Exit;
   End;

End;

Procedure TFRegSolCotizacion.fg_ProformaCompletarDet;
Var
   xsFecha, xsSql: String;
Begin
   xsFecha := FormatDateTime(DMLOG.wFormatFecha, dtpFechaProforma.Date);
   xsSql := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(xsFecha);
   DMLOG.FiltraCDS(DMLOG.cdsPeriodo, xsSql);

   DMLOG.cdsDProforma.FieldByName('DPROFIMPU').AsFloat := xnTasaIgv;
   DMLOG.cdsDProforma.FieldByName('DPROFFREG').AsDateTime := Dates;
   DMLOG.cdsDProforma.FieldByName('PROFANO').AsString := Copy(xsFecha, 7, 4);
   DMLOG.cdsDProforma.FieldByName('PROFMES').AsString := DMLOG.strzero(Copy(xsFecha, 4, 2), 2);
   DMLOG.cdsDProforma.FieldByName('PROFDIA').AsString := DMLOG.strzero(Copy(xsFecha, 1, 2), 2);
   DMLOG.cdsDProforma.FieldByName('PROFTRIM').AsString := DMLOG.cdsPeriodo.fieldbyName('FECTRIM').asString;
   DMLOG.cdsDProforma.FieldByName('PROFSEM').AsString := DMLOG.cdsPeriodo.fieldbyName('FECSEM').asString;

   DMLOG.cdsDProforma.FieldByName('PROFANOMES').AsString := Copy(xsFecha, 7, 4) + DMLOG.strzero(Copy(xsFecha, 4, 2), 2);
   DMLOG.cdsDProforma.FieldByName('PROFSS').AsString := DMLOG.cdsPeriodo.fieldbyName('FECSS').asString;
   DMLOG.cdsDProforma.FieldByName('PROFAATRI').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAATRI').asString;
   DMLOG.cdsDProforma.FieldByName('PROFAASEM').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAASEM').asString;
   DMLOG.cdsDProforma.FieldByName('PROFAASS').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAASS').asString;
End;

Procedure TFRegSolCotizacion.fg_UbicacionPanelProforma;
Begin
   pnlProformaProveedor.Top := 96;
   pnlProformaProveedor.Left := 120;
End;

Procedure TFRegSolCotizacion.fg_ProformaCompletaPanel;
Var
   xsSql: String;
Begin
   xsSql := 'CLAUXID = ' + QuotedStr(dblcTipoAuxiliar.Text);
   edtTipoAuxiliar.text := DMLOG.DisplayDescrip('prvSQL', 'TGE102', 'CLAUXDES', xsSql, 'CLAUXDES');

   edtFormaDePago.Text := DMLOG.DisplayDescrip('prvSQL', 'CXC101', 'CCOMERDES', 'CCOMERID=' + QuotedStr(dblcFormaDePago.text), 'CCOMERDES');

   edtTipoGarantia.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE194', 'GARANTIADES', 'GARANTIAID=' + QuotedStr(dblcTipoGarantia.text), 'GARANTIADES');
End;

Procedure TFRegSolCotizacion.fg_ProformaLimpiaPanel;
Begin
   dblcTipoAuxiliar.Text := '';
   edtTipoAuxiliar.Text := '';
   dblcdProveedor.Text := '';
   edtProveedor.Text := '';
   dtpFechaProforma.Text := '';
   edtNumProforma.Text := '';
   dblcFormaDePago.Text := '';
   edtFormaDePago.Text := '';
   dblcTipoGarantia.Text := '';
   edtTipoGarantia.Text := '';
   memObservacionProforma.Text := '';
End;

Procedure TFRegSolCotizacion.edtProfDetPrecioUnitExit(Sender: TObject);
Begin
   If btnCancelaDetProforma.Focused Then Exit;
   If edtProfDetPrecioUnit.Text = '' Then Exit;
   DMLOG.cdsDProforma.FieldByName('DPROFIMP').AsFloat := FRound(StrToFloat(edtProfDetPrecioUnit.Text) * DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsFloat, 15, 2);

End;

Procedure TFRegSolCotizacion.edtProfDetTotalExit(Sender: TObject);
Begin
   If btnCancelaDetProforma.Focused Then Exit;
   If edtProfDetTotal.Text = '' Then Exit;
   DMLOG.cdsDProforma.FieldByName('DPROFPUNG').AsFloat := FRound(StrToFloat(edtProfDetTotal.Text) / DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsFloat, 15, 4);
End;

Procedure TFRegSolCotizacion.fg_ProformaActualizaTotales(wgCompania, wgSCotizacion, wgProforma: String);
Var
   xsSql: String;
Begin
   xsSql := ' Update LOG312 '
      + '        set (PROFIXTCC,PROFTTIMPU,PROFTOTALG) = (Select Round(SUM( LOG313.DPROFIMP), 2), '
      + '                                                        Round( SUM( LOG313.DPROFIMP)* ' + FloatToStr(xnTasaIgv) + ',2 ),'
      + '                                                        Round( SUM( LOG313.DPROFIMP)* ( 1 +' + FloatToStr(xnTasaIgv) + '),2) '
      + '                                                   from LOG313 '
      + '                                                  where LOG313.CIAID = LOG312.CIAID '
      + '                                                    and LOG313.SCCID = LOG312.SCCID '
      + '                                                    and LOG313.PROFID = LOG312.PROFID) '
      + '      where LOG312.CIAID = ' + QuotedStr(wgCompania)
      + '        and LOG312.SCCID = ' + QuotedStr(wgSCotizacion)
      + '        and LOG312.PROFID = ' + QuotedStr(wgProforma);
   DMLOG.DCOM1.AppServer.EjecutaSQL(xsSql);
End;

Procedure TFRegSolCotizacion.dbgProformasKeyDown(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Var
   xsSql: String;
   xsCuadroComparativo: String;
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      //Verifica si ya tiene un Cuadro Comparativo ACEPTADO
      xsSql := ' CIAID = ' + QuotedStr(dblcCompania.Text) +
         ' AND SCCID = ' + QuotedStr(edtNumCotizacion.Text) +
         ' AND ESTCC = ' + Quotedstr('ACEPTADO');
      xsCuadroComparativo := DMLOG.BuscaQry('dspUltTGE', 'LOG341', '*', xsSql, 'SCCID');
      If Length(xsCuadroComparativo) > 0 Then
      Begin
         ShowMessage('La Actual Solicitud de Cotización ya tiene generado' + #13 +
            'el Cuadro Comparativo Nº ' + xsCuadroComparativo + ' en estado ACEPTADO');
         Exit;
      End;

      If MessageDlg(' ¿ Eliminar Registro ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         Try
            xsSql := ' Delete LOG313 '
               + '      where LOG313.CIAID =  ' + QuotedStr(DMLOG.cdsProforma.FieldByName('CIAID').AsString)
               + '        and LOG313.PROFID = ' + QuotedStr(DMLOG.cdsProforma.FieldByName('PROFID').AsString);
            DMLOG.DCOM1.AppServer.EjecutaSQL(xsSql);

            xsSql := ' Delete LOG312 '
               + '      where LOG312.CIAID = ' + QuotedStr(DMLOG.cdsProforma.FieldByName('CIAID').AsString)
               + '        and LOG312.PROFID = ' + QuotedStr(DMLOG.cdsProforma.FieldByName('PROFID').AsString);
            DMLOG.DCOM1.AppServer.EjecutaSQL(xsSql);

            fg_ProformaRecupera(dblcCompania.Text, edtNumCotizacion.Text);
         Except
            ShowMessage('Error al actualizar el detalle de la cotización');

            Exit;
         End;
      End;
   End;
End;

Procedure TFRegSolCotizacion.pcTabDetalleDrawTab(
   Control: TCustomTabControl; TabIndex: Integer; Const Rect: TRect;
   Active: Boolean);
Var
   xrR: TRect;
   xsTexto: String;

Begin
   If Not (pcTabDetalle.Pages[TabIndex].Enabled) Then
      Control.Canvas.Font.Color := clGrayText;

   xsTexto := pcTabDetalle.Pages[TabIndex].Caption;

   xrR := Rect;
   Control.Canvas.FillRect(xrR);

   If Not Active Then
      InflateRect(xrR, 0, -3);

   DrawText(Control.Canvas.Handle, PChar(xsTexto), -1,
      xrR, DT_SINGLELINE Or DT_CENTER Or DT_VCENTER);
End;

Procedure TFRegSolCotizacion.fg_CotizacionRecuperaDet(wgCompania, wgNumCotizacion: String);
Var
   xsSql: String;
Begin
   xsSql := 'SELECT * FROM LOG303 WHERE CIAID = ' + QuotedStr(wgCompania) + ' AND SCCID = ' + QuotedStr(wgNumCotizacion);
   DMLOG.cdsDSolCot.Close;
   DMLOG.cdsDSolCot.DataRequest(xsSql);
   DMLOG.cdsDSolCot.Open;
End;

Procedure TFRegSolCotizacion.fg_HabilitaPestania;
Begin
   If DMLOG.cdsSolCot.FieldByName('SCCEST').AsString = 'ACEPTADO' Then
   Begin
      tsCotizacion.Enabled := False;
      tsProforma.Enabled := True;
      dbgProformas.Enabled := True;
      btnAdicionaProforma.Enabled := True;
      pcTabDetalle.ActivePage := tsProforma;
      btnCComparativo.Enabled := True;
   End
   Else
   Begin
      tsCotizacion.Enabled := True;
      tsProforma.Enabled := False;
      dbgProformas.Enabled := False;
      btnAdicionaProforma.Enabled := False;
      pcTabDetalle.ActivePage := tsCotizacion;
      btnCComparativo.Enabled := False;
   End;
   pcTabDetalle.Repaint;
End;

Procedure TFRegSolCotizacion.dblcTipoGarantiaExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := 'GARANTIAID = ' + QuotedStr(dblcTipoGarantia.text);
   edtTipoGarantia.Text := DMLOG.displaydescrip('prvSQL', 'TGE194', 'GARANTIADES', xsSql, 'GARANTIADES');
End;

Procedure TFRegSolCotizacion.fg_ProformaHabilitaBotones(
   wgBoolean: Boolean);
Begin
   btnAnular.Enabled := wgBoolean;
   btnImprimeSolCotizacion.Enabled := wgBoolean;
   If DMLOG.cdsSolCot.FieldByName('SCCEST').AsString = 'ACEPTADO' Then
   Begin
      btnCComparativo.Enabled := wgBoolean;
   End
   Else
   Begin
      btnCComparativo.Enabled := False;
   End;

End;

Procedure TFRegSolCotizacion.btnImprimeSolCotizacionClick(Sender: TObject);
Var
   xsSql: String;
Begin
   Screen.Cursor := crHourGlass;

   If DMLOG.cdsDSolCot.RecordCount = 0 Then
   Begin
      ShowMessage('La Solicitud de Cotización no tiene Detalle');
      Exit;
   End;
   If DMLOG.cdsSolCot.FieldByName('SCCEST').AsString = 'ANULADO' Then
   Begin
      ShowMessage('La Solicitud de Cotización está en estado ANULADO');
      Exit;
   End;
   xsSql := ' Select LOG302.CIAID CAB_COMPANIA, '
      + '            TGE101.CIADES CAB_COMPANIADES, '
      + '            LOG302.SCCID CAB_SOLCOTIZACION,'
      + '            LOG302.LOCID CAB_LOCALIDAD, '
      + '            TGE126.LOCDES CAB_LOCALIDADDES,'
      + '            LOG302.SCCFSOL CAB_FECHA,'
      + '            LOG302.TMONID CAB_MONEDA, '
      + '            TGE103.TMONDES CAB_MONEDADES, '
      + '            LOG302.TSCID CAB_TIPOSOLICITUD, '
      + '            TGE137.TSCDES CAB_TIPOSOLICITUDDES,'
      + '            LOG302.LGECID CAB_LUGARENTREGA, '
      + '            TGE136.LGECDES CAB_LUGARENTREGADES,'
      + '            LOG302.SCCFENT CAB_FECHAENTREGA,'
      + '            LOG302.COMPID CAB_COMPRADOR, '
      + '            TGE135.COMPDES CAB_COMPRADORDES,'
      + '            LOG302.SCCOBS CAB_OBSERVACION,'
      + '            LOG302.SCCUSER CAB_USUARIO, '
      + '            LOG303.DSCCID DET_ITEM,'
      + '            LOG303.ARTID DET_ARTICULO, '
      + '            LOG303.DSCOBS DET_ARTICULODES, '
      + '            LOG303.UNMIDG DET_UNIDADMEDIDA, '
      + '            TGE130.UNMDES DET_UNIDADMEDIDADES,'
      + '            LOG303.DSCCCNTG DET_CANTIDAD, '
      +              QuotedStr(DMLOG.wUsuario) + ' USUARIO_IMPRIME '
      + '       from LOG302, LOG303, TGE101,TGE126,TGE103,TGE137,TGE136, TGE135,TGE130 '
      + '      where LOG302.CIAID = TGE101.CIAID '
      + '        and LOG302.CIAID = TGE126.CIAID '
      + '        and LOG302.LOCID = TGE126.LOCID '
      + '        and LOG302.TMONID = TGE103.TMONID '
      + '        and LOG302.TSCID = TGE137.TSCID '
      + '        and LOG302.LGECID = TGE136.LGECID '
      + '        and LOG302.COMPID = TGE135.COMPCID '
      + '        and LOG303.UNMIDG = TGE130.UNMID '
      + '        and LOG302.CIAID = LOG303.CIAID '
      + '        and LOG302.SCCID = LOG303.SCCID '
      + '        and LOG302.CIAID = ' + QuotedStr(dblcCompania.Text)
      + '        and LOG302.SCCID = ' + QuotedStr(edtNumCotizacion.Text);
   DMLOG.cdsReporte.Close;
   DMLOG.cdsReporte.DataRequest(xsSql);
   DMLOG.cdsReporte.Open;

   Screen.Cursor := crDefault;

   If DMLOG.cdsReporte.RecordCount = 0 Then
   Begin
      ShowMessage('No Existe Información a Mostrar');
      Exit;
   End;
   ppdbSolCotizacion.DataSource := DMLOG.dsReporte;
   pprSolCotizacion.DataPipeline := ppdbSolCotizacion;
   pprSolCotizacion.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\SolCotizacion.rtm';
   pprSolCotizacion.Template.LoadFromFile;
   pprSolCotizacion.Print;
   pprSolCotizacion.Stop;
End;

Procedure TFRegSolCotizacion.fg_CComparativoActualizaEstado(
   wgEstado: String);
Begin
   If DMLOG.cdsSolCot.State <> dsEdit Then
   Begin
      DMLOG.cdsSolCot.Edit;
   End;
   If wgEstado = 'ACEPTADO' Then
   Begin
      DMLOG.cdsSolCot.FieldbyName('FECACPCC').AsDateTime := Dates;
      DMLOG.cdsSolCot.FieldbyName('USUACPCC').AsString := DMLOG.wUsuario;
   End;
   fg_GrabaSolCotizacionSQL;
   fg_CotizacionRecupera(dblcCompania.Text, edtNumCotizacion.Text);
End;

Function TFRegSolCotizacion.fg_ProformaValidaPrecio(wgCompania,
   wgNumCotizacion: String; Var wgMensaje: String): Boolean;
Var
   xsSql: String;
Begin
   If DMLOG.cdsProforma.RecordCount = 0 Then
   Begin
      wgMensaje := 'No tiene Proformas registradas';
      Result := False;
      Exit;
   End;

   xsSql := ' Select * '
      + '       from LOG312 '
      + '      where LOG312.CIAID = ' + QuotedStr(wgCompania)
      + '        and LOG312.SCCID = ' + QuotedStr(wgNumCotizacion)
      + '        and not exists(Select 1 '
      + '                         from LOG313 '
      + '                        where LOG312.CIAID = LOG313.CIAID '
      + '                          and LOG312.PROFID = LOG313.PROFID) ';
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xsSql);
   DMLOG.cdsQry.Open;
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      wgMensaje := 'La Proforma Nº' + DMLOG.cdsQry.FieldbyName('PROFID').AsString + #13 +
         ' No tiene detalle ';
      Result := False;
      Exit;
   End;
   xsSql := ' Select LOG313.* '
      + '       from LOG312, LOG313 '
      + '      where LOG312.CIAID = LOG313.CIAID '
      + '        and LOG312.PROFID = LOG313.PROFID '
      + '        and NVL(LOG313.DPROFIMP,0) = 0 '
      + '        and LOG312.CIAID = ' + QuotedStr(wgCompania)
      + '        and LOG312.SCCID = ' + QuotedStr(wgNumCotizacion);
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xsSql);
   DMLOG.cdsQry.Open;
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      wgMensaje := 'El Artículo ' + DMLOG.cdsQry.FieldbyName('DPROFID').AsString + ' de la ' +
         'Proforma Nº' + DMLOG.cdsQry.FieldbyName('PROFID').AsString + #13 + ' NO tiene Precio Unitario ';
      Result := False;
      Exit;
   End;
   Result := True;
End;

Procedure TFRegSolCotizacion.fg_ProformaHabilitaConsulta;
Begin
   btnAdicionaProforma.Enabled := False;
   dbgProformas.Enabled := False;
   btnAnular.Enabled := False;
End;

Procedure TFRegSolCotizacion.cbdlgArticuloExit(Sender: TObject);
Var
   xsSql: String;
Begin

   If (DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString = 'ACEPTADO') Or
      (memObservacionServicio.Text <> '') Then
   Begin
      Exit;
   End;
   xsSql := ' CIAID = ' + QuotedStr(dblcCompania.Text) +
      ' AND TINID = ' + QuotedStr(dblcTipoInventario.Text) +
      ' AND ARTID = ' + QuotedStr(cbdlgArticulo.Text);
   DMLOG.cdsDSolCot.FieldbyName('DSCOBS').AsString := DMLOG.DisplayDescrip('prvLOG', 'TGE205', '*', xsSql, 'ARTDES');

End;

Procedure TFRegSolCotizacion.btnAnularClick(Sender: TObject);
Var
   xsSql: String;
   xsExisteCuadroComparativo: String;
Begin
   //Verifica si ya tiene un Cuadro Comparativo ACEPTADO
   xsSql := ' CIAID = ' + QuotedStr(dblcCompania.Text) +
      ' AND SCCID = ' + QuotedStr(edtNumCotizacion.Text) +
      ' AND ESTCC = ' + Quotedstr('ACEPTADO');
   xsExisteCuadroComparativo := DMLOG.BuscaQry('dspUltTGE', 'LOG341', '*', xsSql, 'SCCID');
   If Length(xsExisteCuadroComparativo) > 0 Then
   Begin
      ShowMessage('La Actual Solicitud de Cotización ya tiene generado' + #13 +
         'un Cuadro Comparativo Nº' + xsExisteCuadroComparativo + ' en estado ACEPTADO');
      Exit;
   End;
   If MessageDlg(' Se anulará la Solicitud de Cotización Nº ' + edtNumCotizacion.Text + #13 +
      '¿Desea continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      Try
         xsSql := ' Update LOG302 '
            + '        set LOG302.SCCEST = ' + QuotedStr('ANULADO')
            + '      where CIAID = ' + QuotedStr(dblcCompania.Text)
            + '        and SCCID = ' + QuotedStr(edtNumCotizacion.Text);
         DMLOG.DCOM1.AppServer.EjecutaSQL(xsSql);

         fg_CotizacionRecupera(dblcCompania.Text, edtNumCotizacion.Text);
         fg_HabilitaCabecera(False);
         fg_HabilitaDetalle(False, 'NO');
         DMLOG.wModo := 'C';
         ShowMessage('La Solicitud de Cotización Nº ' + edtNumCotizacion.Text + #13 +
            'pasó a estado ANULADO');
      Except
         ShowMessage('Error al Anular la Solicitud de Cotización');
         Exit;
      End;
   End;
End;

Procedure TFRegSolCotizacion.btnCComparativoClick(Sender: TObject);
Var
   xsSql: String;
   xsMensaje: String;
   xsModoAuxiliar: String;
Begin
   If fg_ValidaGeneraCC(xsMensaje) = False Then
   Begin
      ShowMessage(xsMensaje);
      Exit;
   End;

   xsSql := 'Select * '
      + '      from LOG341 '
      + '     where CIAID = ' + QuotedStr(dblcCompania.Text)
      + '       and SCCID=' + QuotedStr(edtNumCotizacion.Text)
      + '       and ESTCC <> ' + Quotedstr('ANULADO');
   DMLOG.cdsCuadroComparativo.Close;
   DMLOG.cdsCuadroComparativo.IndexFieldNames := '';
   DMLOG.cdsCuadroComparativo.Filter := '';
   DMLOG.cdsCuadroComparativo.Filtered := False;
   DMLOG.cdsCuadroComparativo.DataRequest(xsSql);
   DMLOG.cdsCuadroComparativo.Open;
   xsModoAuxiliar := DMLOG.wModo;
   If (DMLOG.cdsCuadroComparativo.RecordCount = 0) Then
   Begin
      DMLOG.wModo := 'A';
   End
   Else
      If DMLOG.cdsCuadroComparativo.FieldByName('ESTCC').AsString = 'INICIAL' Then
      Begin
         DMLOG.wModo := 'M';
      End
      Else
      Begin
         DMLOG.wModo := 'C';
      End;

   FCuadroComparativo := TFCuadroComparativo.Create(Application);
   FCuadroComparativo.xsCompania := dblcCompania.Text;
   FCuadroComparativo.xsNumSolCotizacion := edtNumCotizacion.Text;
   FCuadroComparativo.xsNumCComparativo := edtCuadroComparativo.Text;
   Try
      FCuadroComparativo.ShowModal;
   Finally
      fg_CotizacionRecupera(dblcCompania.Text, edtNumCotizacion.Text);
      DMLOG.wModo := xsModoAuxiliar;
      FCuadroComparativo.Free;
   End;
End;

Function TFRegSolCotizacion.fg_ValidaGeneraCC(
   Var wgMensaje: String): Boolean;
Var
   xsMensaje: String;
Begin
   If fg_ProformaValidaPrecio(dblcCompania.Text, edtNumCotizacion.Text, xsMensaje) = False Then
   Begin
      wgMensaje := xsMensaje;
      Result := False;
      Exit;
   End;
   If DMLOG.cdsSolCot.FieldByName('SCCEST').AsString <> 'ACEPTADO' Then
   Begin
      wgMensaje := 'Sólo se puede Generar Cuadros Comparativos de' + #13 +
         'Solicitudes de Cotización en estado ACEPTADO';
      Result := False;
      Exit;
   End;
   If DMLOG.cdsProforma.RecordCount = 0 Then
   Begin
      wgMensaje := 'No se ha registrado ninguna Proforma';
      Result := False;
      Exit;
   End;

   Result := True;
   Exit;
End;

Procedure TFRegSolCotizacion.fg_GrabaSolCotizacionSQL;
Var
   xsSql: String;
   xsSCCFENT: String;
Begin

   If DMLOG.cdsSolCot.FieldByName('SCCFENT').value = null Then
   Begin
      xsSCCFENT := 'NULL';
   End
   Else
   Begin
      xsSCCFENT := QuotedStr(FormatDateTime(DMLOG.wFormatFecha, DMLOG.cdsSolCot.FieldByName('SCCFENT').value));
   End;

   //Verifica si ya existe el registro
   xsSql := ' CIAID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString) +
      ' AND SCCID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString);
   If Length(DMLOG.BuscaQry('dspUltTGE', 'LOG302', '*', xsSql, 'SCCID')) = 0 Then
   Begin
      xsSql := ' INSERT INTO LOG302 (CIAID,SCCID,SCCFSOL,FPAGOID,TMONID,TSCID,SCCFLICOT,SCCDIVIG, ' +
         ' COMPID,LGECID,SCCFENT,SCCEST,SCCOBS,SCCUSER,SCCFREG,SCCHREG, ' +
         ' SCCANO,SCCMM,SCCDD,SCCTRI,SCCSEM,SCCSS,SCCANOMM,SCCAATRI, ' +
         ' SCCAASEM,SCCAASS,FLAGVAR,PRIOID,SCCTIP,TIPOADQ,PROFEVAL, ' +
         ' OBRAID,TINID,ALMID,LOCID,NUMCC) ' +
         ' VALUES (' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString) + ',' +
         QuotedStr(FormatDateTime(DMLOG.wFormatFecha, DMLOG.cdsSolCot.FieldByName('SCCFSOL').value)) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('FPAGOID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('TMONID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('TSCID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCFLICOT').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCDIVIG').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('COMPID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('LGECID').AsString) + ',' +
         xsSCCFENT + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCEST').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCOBS').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCUSER').AsString) + ',' +
         'SYSDATE,' +
         'SYSDATE,' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCANO').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCMM').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCDD').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCTRI').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCSEM').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCSS').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCANOMM').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCAATRI').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCAASEM').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCAASS').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('FLAGVAR').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('PRIOID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCTIP').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('PROFEVAL').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('OBRAID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('TINID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('ALMID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('LOCID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('NUMCC').AsString) + ')';

   End
   Else
   Begin
      xsSql := ' UPDATE LOG302 SET (CIAID,SCCID,SCCFSOL,FPAGOID,TMONID,TSCID,SCCFLICOT,SCCDIVIG, ' +
         ' COMPID,LGECID,SCCFENT,SCCEST,SCCOBS,SCCUSER,' + //SCCFREG,SCCHREG, '+
         ' SCCANO,SCCMM,SCCDD,SCCTRI,SCCSEM,SCCSS,SCCANOMM,SCCAATRI, ' +
         ' SCCAASEM,SCCAASS,FLAGVAR,PRIOID,SCCTIP,TIPOADQ,PROFEVAL, ' +
         ' OBRAID,TINID,ALMID,LOCID,NUMCC)= (SELECT  ' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString) + ',' +
         QuotedStr(FormatDateTime(DMLOG.wFormatFecha, DMLOG.cdsSolCot.FieldByName('SCCFSOL').value)) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('FPAGOID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('TMONID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('TSCID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCFLICOT').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCDIVIG').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('COMPID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('LGECID').AsString) + ',' +
         xsSCCFENT + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCEST').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCOBS').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCUSER').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCANO').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCMM').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCDD').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCTRI').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCSEM').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCSS').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCANOMM').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCAATRI').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCAASEM').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCAASS').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('FLAGVAR').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('PRIOID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCTIP').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('PROFEVAL').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('OBRAID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('TINID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('ALMID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('LOCID').AsString) + ',' +
         QuotedStr(DMLOG.cdsSolCot.FieldByName('NUMCC').AsString) + ' FROM DUAL )' +
         ' WHERE CIAID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString) +
         ' AND SCCID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString);
   End;
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      ShowMessage('Error al Actualizar la Solicitud de Cotización');
      Exit;
   End;

End;

Procedure TFRegSolCotizacion.fg_GrabaSolCotizacionDetSQL;
Var
   xsSql: String;
Begin

   //Verifica si ya existe el registro
   xsSql := ' CIAID = ' + QuotedStr(DMLOG.cdsDSolCot.FieldByName('CIAID').AsString) +
      ' AND SCCID = ' + QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCID').AsString) +
      ' AND DSCCID = ' + QuotedStr(DMLOG.cdsDSolCot.FieldByName('DSCCID').AsString);
   If Length(DMLOG.BuscaQry('dspUltTGE', 'LOG303', '*', xsSql, 'SCCID')) = 0 Then
   Begin
      xsSql := ' INSERT INTO LOG303 (CIAID,SCCID,DSCCID,ARTID,DSCCCNTG,DSCCCNTU,UNMIDG, ' +
         ' UNMIDU,RQSID,SCCFLAGUM,SCCTIP,DSCOBS,TIPOADQ,SCCUSER, ' +
         ' FPAGOID,COMPID,TINID,GRARID,FAMID,SFAMID,SCCANO,SCCMES, ' +
         ' SCCDIA,SCCTRIM,SCCSEM,SCCANOMES,SCCSS,SCCAATRI,SCCAASEM,SCCAASS ) ' +
         ' VALUES (' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('CIAID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('DSCCID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('ARTID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('DSCCCNTG').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('DSCCCNTU').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('UNMIDG').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('UNMIDU').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('RQSID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCFLAGUM').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCTIP').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('DSCOBS').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('TIPOADQ').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCUSER').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('FPAGOID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('COMPID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('TINID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('GRARID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('FAMID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SFAMID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCANO').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCMES').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCDIA').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCTRIM').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCSEM').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCANOMES').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCSS').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCAATRI').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCAASEM').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCAASS').AsString) + ')';

   End
   Else
   Begin
      xsSql := ' UPDATE LOG303 SET (CIAID,SCCID,DSCCID,ARTID,DSCCCNTG,DSCCCNTU,UNMIDG, ' +
         ' UNMIDU,RQSID,SCCFLAGUM,SCCTIP,DSCOBS,TIPOADQ,SCCUSER, ' +
         ' FPAGOID,COMPID,TINID,GRARID,FAMID,SFAMID,SCCANO,SCCMES, ' +
         ' SCCDIA,SCCTRIM,SCCSEM,SCCANOMES,SCCSS,SCCAATRI,SCCAASEM,SCCAASS )= (SELECT  ' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('CIAID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('DSCCID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('ARTID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('DSCCCNTG').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('DSCCCNTU').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('UNMIDG').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('UNMIDU').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('RQSID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCFLAGUM').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCTIP').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('DSCOBS').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('TIPOADQ').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCUSER').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('FPAGOID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('COMPID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('TINID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('GRARID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('FAMID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SFAMID').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCANO').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCMES').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCDIA').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCTRIM').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCSEM').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCANOMES').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCSS').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCAATRI').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCAASEM').AsString) + ',' +
         QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCAASS').AsString) + ' FROM DUAL )' +
         ' WHERE CIAID = ' + QuotedStr(DMLOG.cdsDSolCot.FieldByName('CIAID').AsString) +
         ' AND SCCID = ' + QuotedStr(DMLOG.cdsDSolCot.FieldByName('SCCID').AsString) +
         ' AND DSCCID = ' + QuotedStr(DMLOG.cdsDSolCot.FieldByName('DSCCID').AsString);

   End;
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      ShowMessage('Error al Actualizar el detalle de la Solicitud de Cotización');
      Exit;
   End;
End;

Procedure TFRegSolCotizacion.fg_ProformaGrabarSQL;
Var
   xsSql: String;
   xsPROFFATE: String;
   xsPROFENTR: String;
Begin
   If DMLOG.cdsProforma.FieldByName('PROFFATE').value = null Then
   Begin
      xsPROFFATE := 'NULL';
   End
   Else
   Begin
      xsPROFFATE := QuotedStr(FormatDateTime(DMLOG.wFormatFecha, DMLOG.cdsProforma.FieldByName('PROFFATE').value));
   End;

   If DMLOG.cdsProforma.FieldByName('PROFENTR').value = null Then
   Begin
      xsPROFENTR := 'NULL';
   End
   Else
   Begin
      xsPROFENTR := QuotedStr(FormatDateTime(DMLOG.wFormatFecha, DMLOG.cdsProforma.FieldByName('PROFENTR').value));
   End;
   //Verifica si ya existe el registro
   xsSql := ' CIAID = ' + QuotedStr(DMLOG.cdsProforma.FieldByName('CIAID').AsString) +
      ' AND SCCID = ' + QuotedStr(DMLOG.cdsProforma.FieldByName('SCCID').AsString) +
      ' AND PROFID = ' + QuotedStr(DMLOG.cdsProforma.FieldByName('PROFID').AsString);

   If Length(DMLOG.BuscaQry('dspUltTGE', 'LOG312', '*', xsSql, 'PROFID')) = 0 Then
   Begin

      xsSql := ' INSERT INTO LOG312 (CIAID,SCCID,PROV,FPAGOID,TMONID,PROFID,PROFFEMI,PROFTEN, ' +
         ' PROFVALID,PROFTCAMB,PROFIXFLE,PROFIXTCC,PROFIXTD,PROFIXTI, ' +
         ' PROFEST,PROFFATE,PROFOBS,PROFUSER,PROFFREG,PROFHREG,PROFANO,' +
         ' PROFMM,PROFDD,PROFTRI,PROFSEM,PROFSS,PROFANOMM,PROFAATRI, ' +
         ' PROFAASEM,PROFAASS,FLAGVAR,PROFNPROV,PROFTOTALG,PROFTIMP, ' +
         ' PROFTTIMPU,PROFEVAL,PROFCONCOM,PROFGARAN,PROFFARDMA,PROFISC, ' +
         ' FAUTOGEN,TRQSID,TIPOADQ,ODCID,PROFGENER,PROVDES,PROVRUC,PROFENTR, ' +
         ' CLAUXID,GARANTIAID,FLAGCCOM ) ' +
         ' VALUES (' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('CIAID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('SCCID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROV').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('FPAGOID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('TMONID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFID').AsString) + ',' +
         QuotedStr(FormatDateTime(DMLOG.wFormatFecha, DMLOG.cdsProforma.FieldByName('PROFFEMI').value)) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFTEN').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFVALID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFTCAMB').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFIXFLE').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFIXTCC').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFIXTD').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFIXTI').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFEST').AsString) + ',' +
         xsPROFFATE + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFOBS').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFUSER').AsString) + ',' +
         ' SYSDATE, ' +
         ' SYSDATE, ' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFANO').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFMM').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFDD').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFTRI').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFSEM').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFSS').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFANOMM').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFAATRI').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFAASEM').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFAASS').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('FLAGVAR').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFNPROV').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFTOTALG').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFTIMP').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFTTIMPU').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFEVAL').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFCONCOM').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFGARAN').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFFARDMA').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFISC').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('FAUTOGEN').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('TRQSID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('TIPOADQ').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('ODCID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFGENER').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROVDES').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROVRUC').AsString) + ',' +
         xsPROFENTR + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('CLAUXID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('GARANTIAID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('FLAGCCOM').AsString) + ')';

   End
   Else
   Begin
      xsSql := ' UPDATE LOG312 SET (CIAID,SCCID,PROV,FPAGOID,TMONID,PROFID,PROFFEMI,PROFTEN, ' +
         ' PROFVALID,PROFTCAMB,PROFIXFLE,PROFIXTCC,PROFIXTD,PROFIXTI, ' +
         ' PROFEST,PROFFATE,PROFOBS,PROFUSER,' (*+'PROFFREG,PROFHREG,'*) + 'PROFANO,' +
         ' PROFMM,PROFDD,PROFTRI,PROFSEM,PROFSS,PROFANOMM,PROFAATRI, ' +
         ' PROFAASEM,PROFAASS,FLAGVAR,PROFNPROV,PROFTOTALG,PROFTIMP, ' +
         ' PROFTTIMPU,PROFEVAL,PROFCONCOM,PROFGARAN,PROFFARDMA,PROFISC, ' +
         ' FAUTOGEN,TRQSID,TIPOADQ,ODCID,PROFGENER,PROVDES,PROVRUC,PROFENTR, ' +
         ' CLAUXID,GARANTIAID,FLAGCCOM )= (SELECT  ' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('CIAID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('SCCID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROV').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('FPAGOID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('TMONID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFID').AsString) + ',' +
         QuotedStr(FormatDateTime(DMLOG.wFormatFecha, DMLOG.cdsProforma.FieldByName('PROFFEMI').value)) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFTEN').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFVALID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFTCAMB').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFIXFLE').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFIXTCC').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFIXTD').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFIXTI').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFEST').AsString) + ',' +
         xsPROFFATE + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFOBS').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFUSER').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFANO').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFMM').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFDD').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFTRI').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFSEM').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFSS').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFANOMM').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFAATRI').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFAASEM').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFAASS').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('FLAGVAR').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFNPROV').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFTOTALG').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFTIMP').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFTTIMPU').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFEVAL').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFCONCOM').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFGARAN').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFFARDMA').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFISC').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('FAUTOGEN').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('TRQSID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('TIPOADQ').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('ODCID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROFGENER').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROVDES').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('PROVRUC').AsString) + ',' +
         xsPROFENTR + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('CLAUXID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('GARANTIAID').AsString) + ',' +
         QuotedStr(DMLOG.cdsProforma.FieldByName('FLAGCCOM').AsString) + ' FROM DUAL )' +
         ' WHERE  CIAID = ' + QuotedStr(DMLOG.cdsProforma.FieldByName('CIAID').AsString) +
         ' AND SCCID = ' + QuotedStr(DMLOG.cdsProforma.FieldByName('SCCID').AsString) +
         ' AND PROFID = ' + QuotedStr(DMLOG.cdsProforma.FieldByName('PROFID').AsString);
   End;
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      ShowMessage('Error al Actualizar la Proforma');
      Exit;
   End;
End;

Procedure TFRegSolCotizacion.fg_ProformaGrabarDetSQL;
Var
   xsSql: String;
Begin
   xsSql := ' UPDATE LOG313 SET (CIAID,PROFID,ARTID,UNMIDG,UNMIDU,DPROFID,DPROFCNTG,DPROFCNTU,DPROFPUNG, ' +
      ' DPROFPUNU,DPROFDSCTO,DPROFIMP,DPROFIMPU,DPROFMARK,DPROFEVAL,DPROFCONCOM, ' +
      ' DPROFGARAN,DPROFGARDMA,DFPAGOID,DPROFTEN,DPROFVALID,DPROFLAGUM,DPROFISC, ' +
      ' ODCID,DPROFPROV,DPROFPRVD,DPROFARTD,TRQSID,TIPOADQ,DPROFOBS,' + //DPROFFREG, '+
      ' PROFUSER,TINID,GRARID,FAMID,SFAMID,PROFANO,PROFMES,PROFDIA,PROFTRIM,PROFSEM, ' +
      ' PROFANOMES,PROFSS,PROFAATRI,PROFAASEM,PROFAASS,SCCID,DPROFTIPCCOM,CLAUXID )= (SELECT  ' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('CIAID').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('PROFID').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('ARTID').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('UNMIDG').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('UNMIDU').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFID').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFCNTU').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFPUNG').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFPUNU').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFDSCTO').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFIMP').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFIMPU').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFMARK').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFEVAL').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFCONCOM').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFGARAN').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFGARDMA').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DFPAGOID').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFTEN').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFVALID').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFLAGUM').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFISC').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('ODCID').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFPROV').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFPRVD').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFARTD').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('TRQSID').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('TIPOADQ').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFOBS').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('PROFUSER').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('TINID').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('GRARID').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('FAMID').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('SFAMID').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('PROFANO').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('PROFMES').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('PROFDIA').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('PROFTRIM').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('PROFSEM').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('PROFANOMES').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('PROFSS').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('PROFAATRI').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('PROFAASEM').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('PROFAASS').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('SCCID').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFTIPCCOM').AsString) + ',' +
      QuotedStr(DMLOG.cdsDProforma.FieldByName('CLAUXID').AsString) + ' FROM DUAL )' +
      ' WHERE  CIAID = ' + QuotedStr(DMLOG.cdsDProforma.FieldByName('CIAID').AsString) +
      ' AND PROFID = ' + QuotedStr(DMLOG.cdsDProforma.FieldByName('PROFID').AsString) +
      ' AND DPROFID = ' + QuotedStr(DMLOG.cdsDProforma.FieldByName('DPROFID').AsString);

   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      ShowMessage('Error al Actualizar la Proforma');
      Exit;
   End;

End;

End.


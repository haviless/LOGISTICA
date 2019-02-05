Unit LOG228;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG228
//Formulario               : FRegOrdCD
//Fecha de Creación        :
//Autor                    : Equipo de desarrollo
//Objetivo                 : Ventana de mantenimiento de las Ordenes de Compras directas

// Actualizaciones:
// HPP_201102_LOG 17/02/2011: Se incrementa a 5 los decimales que debe
//                            grabar los Ordenes de compra. Por ese motivo
//                            se modifica la asignación y el redondeo de los campos de montos
// HPP_201103_LOG 19/04/2011: Se implementa la funcionalidad que permite visar la Orden de Compra
//                            al mismo usuario que registró. sólo se habilitará
//                            el botón de visado si el usuario tiene el acceso a visar la OC
// HPC_201202_LOG 13/04/2012: Invocar la funcionalidad DMLOG.fg_ValidaDatosProveedor que valida
//                            si el proveedor está con los datos completos o no
// HPC_201301_LOG 19/04/2013  Al ingresar un nuevo ítem en el detalle de registro de orden de compra solo deberá
//                            mostrar los artículos que su tipo de inventario están habilitados
// HPC_201303_LOG 0505/2013   Al ingresar un nuevo ítem en el detalle de Registro de Orden de Compra, solo deberá
//                            mostrar los artículos que estén marcados como ACTIVOS en el maestro de artículos
// HPC_201304_LOG 0505/2013   Se adiciona la posibilidad de ingresar Orcenes de compra por servicios institucionales
// HPC_201306_LOG 31/11/2013  Se modifica para selecionar las Cotizaciones selecionadas y automaticamente ponga en el Detalle de
//                            La Orden de Trabajo  el Detalle de la Cotización, los articulos no matriculados se mostraran en una
//                            alerta y podra selecionar el atículo del maestro si ya existiera
// HPC_201402_LOG 01/06/2014  Se adiciona el numero de Requerimiento como dato referencial
// HPC_201403_LOG 06/06/2014  En O.Compra Directa, se habilita Número de Requerimiento
//                            reordenamiento de la Sangría
// HPC_201405_LOG  25/09/2014  1.	Se adicionó Control Transaccional en los puntos donde se actualizan las tablas.
//                             2.	Se retira los ApplyUpdates y  se adiciono UPDATE, INSERT Y DELETE con AppServer.EjecutaSQL(sSQL), se le incluye también su Control Transaccional.
// HPC_201504_LOG  28/08/2015 Ajustes por Servicios Institucionales
// HPC_201505_LOG  09/09/2015 Ajustes por Servicios Institucionales.
// HPC_201701_LOG  06/07/2017 DAF_2017000856 14-15-16 Ajustes en el grabado de la Orden de Compra
//                            retiro de comentarios anteriores
// HPC_201701_LOG           : Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
// HPC_201804_LOG  20/06/2018 Se cambia los select a Procedimientos almacenados


Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
   wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg, wwdbdatetimepicker, DBCtrls, db,
   wwSpeedButton, wwDBNavigator, Grids, Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, Wwdbspin,
   ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppModule, daDatMod,
   ppBands, ppPrnabl, ppCtrls, ppViewr, ppArchiv, wwclient, GridControl,
   ppStrtch, ppMemo, ppRichTx, ppVar, ppEndUsr, IniFiles, ppTypes, Variants,
   math,
   ppParameter, ppSubRpt, daDataModule, MsgDlgs;

Type
   TFRegOrdCD = Class(TForm)
      pnlCabecera: TPanel;
      dblcCIA: TwwDBLookupCombo;
      Z2bbtnOK: TBitBtn;
      dbmObs: TDBMemo;
      pnlDetalleG: TPanel;
      stxTitulo1: TStaticText;
      dbgDReqs: TwwDBGrid;
      pnlDetalleA: TPanel;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;
      stxTitulo2: TStaticText;
      dblcUMed: TwwDBLookupCombo;
      pnlEstado: TPanel;
      bvlDetalle: TBevel;
      Bevel1: TBevel;
      Z2dbgDReqsIButton: TwwIButton;
      dblcTMoneda: TwwDBLookupCombo;
      dbdtpFEmi: TwwDBDateTimePicker;
      dblcFPago: TwwDBLookupCombo;
      dedNProforma: TwwDBEdit;
      dbdtpFAtt: TwwDBDateTimePicker;
      dbdtpFReg: TwwDBDateTimePicker;
      dbseEnt: TwwDBSpinEdit;
      dbsbVal: TwwDBSpinEdit;
      dbeTCambio: TwwDBEdit;
      dblcdProv: TwwDBLookupComboDlg;
      dbeFlete: TwwDBEdit;
      Bevel2: TBevel;
      dbeTotal: TwwDBEdit;
      dbeNReg: TwwDBEdit;
      bvlT: TBevel;
      dbeImpuesto: TwwDBEdit;
      dbrgTImpue: TDBRadioGroup;
      dbeTCompra: TwwDBEdit;
      dbeTFlete: TwwDBEdit;
      dbeTimpues: TwwDBEdit;
      dblcLEntrega: TwwDBLookupCombo;
      pnlRRA: TPanel;
      pnlTitle5: TPanel;
      Bevel5: TBevel;
      BitBtn1: TBitBtn;
      dbgReqxArt: TwwDBGrid;
      ppArchiveReader1: TppArchiveReader;
      Z2bbtnBorrar: TBitBtn;
      Z2btnDesc: TButton;
      dbeDesc: TwwDBEdit;
      dbeTotISC: TwwDBEdit;
      Z2bbtnRegresa: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      Z2bbtnGraba: TBitBtn;
      Z2bbtnAcepta: TBitBtn;
      Z2bbtnAnula: TBitBtn;
      Z2bbtnSalir: TBitBtn;
      gbxProv: TGroupBox;
      dbeDescProv: TwwDBEdit;
      dblcUMEquiv: TwwDBLookupCombo;
      dbeUMEquiv: TwwDBEdit;
      dbePUEquiv: TwwDBEdit;
      Z2bbtnMasMenos: TBitBtn;
      cds1: TwwClientDataSet;
      dbeCantEquiv: TwwDBEdit;
      dbeCodProv: TwwDBEdit;
      edtCIA: TEdit;
      edtTMoneda: TEdit;
      edtFPago: TEdit;
      edtLEntrega: TEdit;
      edtUMed: TEdit;
      dbcldArti2: TwwDBEdit;
      dbeCnt: TEdit;
      dbeDscto: TEdit;
      dbeImpInd: TEdit;
      dbeISC: TEdit;
      dbeImporte: TEdit;
      memDetalle: TMemo;
      dbeItem: TEdit;
      dbePUnit: TEdit;
      edtAdq: TEdit;
      Label1: TLabel;
      ppdbOC: TppDBPipeline;
      ppDBCab: TppDBPipeline;
      pprOCP: TppReport;
      pprOCPE: TppReport;
      dbeValVen: TEdit;
      dblcTipoCompra: TwwDBLookupCombo;
      edtTipoCompra: TEdit;
      edtProv: TwwDBEdit;
      pnlCant: TPanel;
      StaticText1: TStaticText;
      Panel2: TPanel;
      bbtnAceptar: TBitBtn;
      bbtnCerrar: TBitBtn;
      dbgDOCxDrqs: TwwDBGrid;
      Z2bbtnColocac: TBitBtn;
      pnlColoca: TPanel;
      wwDBEdit1: TwwDBEdit;
      wwDBEdit2: TwwDBEdit;
      lblUsu: TLabel;
      lblFec: TLabel;
      lblCol: TLabel;
      btxtEstado: TDBText;
      ppHeaderBand3: TppHeaderBand;
      ppDBText21: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
      ppDBText33: TppDBText;
      ppDBText34: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppLabel8: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppDBText37: TppDBText;
      ppDBText39: TppDBText;
      ppDBText40: TppDBText;
      ppDBText41: TppDBText;
      ppDBText42: TppDBText;
      ppDBText43: TppDBText;
      ppDBMemo1: TppDBMemo;
      ppvLin: TppVariable;
      ppLabel9: TppLabel;
      ppLabel7: TppLabel;
      ppSummaryBand3: TppSummaryBand;
      ppDBText44: TppDBText;
      ppDBText45: TppDBText;
      ppDBText46: TppDBText;
      ppdbmObse: TppDBMemo;
      ppDBText4: TppDBText;
      lblCia: TLabel;
      lblNro: TLabel;
      lblProf: TLabel;
      lblFReg: TLabel;
      lblProv: TLabel;
      lblFEmi: TLabel;
      lblFEnt: TLabel;
      lblDEnt: TLabel;
      lblDVal: TLabel;
      lblTMon: TLabel;
      lblTCam: TLabel;
      lblConCom: TLabel;
      lblLEnt: TLabel;
      lblFle: TLabel;
      lblTCom: TLabel;
      lblObs: TLabel;
      lblNItem: TLabel;
      lblUMed: TLabel;
      lblDesc: TLabel;
      Z2bbtnPrint: TBitBtn;
      Diseno: TppDesigner;
      pnlObsAnula: TPanel;
      bbtnAceObsAnu: TBitBtn;
      bbtnCerObsAnu: TBitBtn;
      StaticText2: TStaticText;
      memObsAnu: TMemo;
      Z2bbtnDepuraOC: TBitBtn;
      dbcldArti: TwwDBLookupComboDlg;
      edtUltCompra: TEdit;
      ppParameterList1: TppParameterList;
      Panel1: TPanel;
      Label5: TLabel;
      DBText1: TDBText;
      Label3: TLabel;
      wwDBDateTimePicker1: TwwDBDateTimePicker;
      Label2: TLabel;
      Z2bbtnVisado: TBitBtn;
      Z2bbtnOrdenpago: TBitBtn;
      ppdbOrdenPagoPorOC: TppDBPipeline;
      ppHeaderBand4: TppHeaderBand;
      ppShape10: TppShape;
      ppShape7: TppShape;
      ppShape8: TppShape;
      ppShape9: TppShape;
      ppShape11: TppShape;
      ppDBText49: TppDBText;
      ppDBText50: TppDBText;
      ppDBText51: TppDBText;
      ppDBText52: TppDBText;
      ppDBText54: TppDBText;
      ppDBText55: TppDBText;
      ppDBText57: TppDBText;
      ppDBText58: TppDBText;
      ppDBText59: TppDBText;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLine9: TppLine;
      ppLine10: TppLine;
      ppLine11: TppLine;
      ppLine12: TppLine;
      ppLine13: TppLine;
      ppLine14: TppLine;
      ppLine15: TppLine;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      pplReq: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppLine16: TppLine;
      ppLabel42: TppLabel;
      pplCia: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppLabel50: TppLabel;
      ppLabel51: TppLabel;
      ppLabel52: TppLabel;
      ppLabel53: TppLabel;
      ppLabel54: TppLabel;
      ppDBText70: TppDBText;
      ppDBText71: TppDBText;
      ppDBText1: TppDBText;
      ppLblciatlf: TppLabel;
      ppDBTCiatlf: TppDBText;
      ppLblciafax: TppLabel;
      ppDBTciafax: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppLabel1: TppLabel;
      ppDBText7: TppDBText;
      ppLine4: TppLine;
      ppLabel12: TppLabel;
      ppLine5: TppLine;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      pplReq1: TppLabel;
      ppLabel13: TppLabel;
      ppLabel20: TppLabel;
      ppDBText10: TppDBText;
      pplReq2: TppLabel;
      pplReq3: TppLabel;
      pplReq4: TppLabel;
      pplDerrama: TppLabel;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppLabel14: TppLabel;
      ppLabel27: TppLabel;
      ppDetailBand4: TppDetailBand;
      ppDBText60: TppDBText;
      ppDBText62: TppDBText;
      ppDBText63: TppDBText;
      ppDBText64: TppDBText;
      ppDBText65: TppDBText;
      ppDBText66: TppDBText;
      ppDBMemo2: TppDBMemo;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppFooterBand4: TppFooterBand;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppSystemVariable1: TppSystemVariable;
      ppSummaryBand1: TppSummaryBand;
      ppShape12: TppShape;
      ppDBText67: TppDBText;
      ppDBText68: TppDBText;
      ppLabel55: TppLabel;
      ppLabel56: TppLabel;
      ppLabel57: TppLabel;
      ppLabel58: TppLabel;
      ppDBText69: TppDBText;
      ppDBCalc2: TppDBCalc;
      ppLabel3: TppLabel;
      ppDBMemo3: TppDBMemo;
      ppDBCalc1: TppDBCalc;
      ppLabel2: TppLabel;
      ppSubReport1: TppSubReport;
      ppChildReport1: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText20: TppDBText;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBCalc3: TppDBCalc;
      ppLabel19: TppLabel;
      ppLine6: TppLine;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBCalc4: TppDBCalc;
      ppLabel28: TppLabel;
      daDataModule1: TdaDataModule;
      dblcTipoAuxiliar: TwwDBLookupCombo;
      Label6: TLabel;
      gbPagoServ: TGroupBox;
      dblcLOC: TwwDBLookupCombo;
      Label7: TLabel;
      dbServicio: TwwDBLookupComboDlg;
      edtServicio: TEdit;
      edtImporte: TEdit;
      GroupBox1: TGroupBox;
      edtNumReferencia: TEdit;
      lblReferencia: TLabel;
      EdtDescripReferencia: TEdit;
      CbTipOrdCompra: TComboBox;
      pnlAdvertencias: TPanel;
      Shape15: TShape;
      Label48: TLabel;
      Shape16: TShape;
      wwDBGrid2: TwwDBGrid;
      BitBtn5: TBitBtn;
      CDSFALTINFO: TClientDataSet;
      DSFALTINFO: TDataSource;
      BitBtn2: TBitBtn;
      edtnumRequerimiento: TEdit;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
      ppLabel29: TppLabel;
      ppLabel38: TppLabel;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
      ppDBText30: TppDBText;
      ppDBText38: TppDBText;
      ppDBText47: TppDBText;
      ppDBText48: TppDBText;
// Fin HPC_201701_LOG
      Procedure Z2bbtnOKClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure Z2bbtnRegresaClick(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure Z2bbtnAceptaClick(Sender: TObject);
      Procedure Z2bbtnAnulaClick(Sender: TObject);
      Procedure Z2dbgDReqsIButtonClick(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
      Procedure Z2bbtnRegCancClick(Sender: TObject);
      Procedure Z2bbtnSalirClick(Sender: TObject);
      Procedure dbgDReqsKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
      Procedure dbgDReqsDblClick(Sender: TObject);
      Procedure dbmObsKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dbeDsctoExit(Sender: TObject);
      Procedure dbrgTImpueChange(Sender: TObject);
      Procedure dblcdExits(Sender: TObject);
      Procedure Z2btnDescClick(Sender: TObject);
      Procedure dbeDescExit(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure Z2bbtnPrintClick(Sender: TObject);
      Procedure dblcdProvEnter(Sender: TObject);
      Procedure dblcdProvExit(Sender: TObject);
      Procedure Z2bbtnBorrarClick(Sender: TObject);
      Procedure dbeCntEnter(Sender: TObject);
      Procedure dbeCntExit(Sender: TObject);
      Procedure Z2bbtnMasMenosClick(Sender: TObject);
      Procedure dblcUMEquivExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure pprOCPEPreviewFormCreate(Sender: TObject);
      Procedure pprOCPAfterPrint(Sender: TObject);
      Procedure pprOCPBeforePrint(Sender: TObject);
      Procedure pprOCPPreviewFormCreate(Sender: TObject);
      Procedure dblcUMedExit(Sender: TObject);
      Procedure dbeNRegExit(Sender: TObject);
      Procedure bbtnCerrarClick(Sender: TObject);
      Procedure bbtnAceptarClick(Sender: TObject);
      Procedure dbgDOCxDrqsCellChanged(Sender: TObject);
      Procedure dbgDOCxDrqsExit(Sender: TObject);
      Procedure Z2bbtnColocacClick(Sender: TObject);
      Procedure ppDetailBand3BeforePrint(Sender: TObject);
      Procedure pprOCPStartPage(Sender: TObject);
      Procedure ppDetailBand4BeforePrint(Sender: TObject);
      Procedure Z2bbtnDepuraOCClick(Sender: TObject);
      Procedure dbcldArtiExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure ppHeaderBand4BeforePrint(Sender: TObject);
      Procedure Z2bbtnVisadoClick(Sender: TObject);
      Procedure Z2bbtnOrdenpagoClick(Sender: TObject);
      Procedure dblcTipoAuxiliarExit(Sender: TObject);
      Procedure dblcLOCExit(Sender: TObject);
      Procedure dbServicioExit(Sender: TObject);
      Procedure CbTipOrdCompraExit(Sender: TObject);
      Procedure BitBtn5Click(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
      Procedure bbtnAceObsAnuClick(Sender: TObject);
      Procedure bbtnCerObsAnuClick(Sender: TObject);
      Procedure pprOCPEStartPage(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
   Private
    { Private declarations }
      xVan: Integer;
      iEstado: Integer; // 0 En Insercion, 1 Edicion
      iEst: Integer; // 0 En Insercion, 1 Edicion
      strTMP: String;
      sNumORD: String;
      xflag: Boolean;
      xMtoCnt: Double;
      xCrea: Boolean;
      xMontoVisar: double;
      xYear, xMes, xDia: Word;

      xOk: Boolean;

      Procedure AsigDat;
      Procedure OnOffDetalle(Value: Boolean);
      Procedure OnOffCabecera(Value: Boolean);
      Procedure OnOffVisar(Value: Boolean);
      Procedure btnDetalle;
      Function EHandlerError(Ex: Exception): Boolean;
      Procedure cdsDOrdCompBeforePost(DataSet: TDataSet);
      Procedure ppReportOC;
      Procedure ValidaCab;
      Procedure ValidaTot;
      Procedure ValidaDet;
      Procedure ImporteDetalle;
      Procedure ProXReq;
      Procedure ProXReqTot;
      Procedure CalCant;
      Procedure GenerProfOCompra;
      Function RoundD(x: Double; D: Integer): Double;
      Procedure fg_RecuperaSubReporte;
      Function fg_ExisteOrdenPago(wgCiaid, wgNumOrdenCompra: String): Boolean;
      Procedure ActualizaGrid(vCiaid, vNumref: String);
      Procedure ActualizaLOG305;
      Procedure ActualizaLOG304;
      Procedure ActAnulacion;
      Procedure DeletTodoLOG305;
      Procedure DeletTodoLOG304;
      Procedure fg_ListaReqPendientes;
      Procedure fg_PorRequerimiento;

   Public
    { Public declarations }
      xValorX: String;
      VSCCID: String;
      Procedure CalcTotal(Sender: TObject);
      Procedure error();

   End;

Var
   FRegOrdCD: TFRegOrdCD;
   xTAutoNum, xTAno, xTMes: String;
   xOrdElim: String;
   wIGV: String;
   xPriInser: String;
   SQLFiltro: String;
   xCant, wSQL: String;
   xDesac: Integer;
   xProv: String;
   xsTipoAuxiliar: String;
   xSigueGrab: Boolean;
   xSQL: String;

Implementation
{
Uses LOGDM1, LOG221, LOG220, LOG222, LOG601, LOG210, oaAD3100, LOG130,
   LOG275, LOG276, LOG232;
Uses LOGDM1, LOG221, LOG222, LOG601, LOG210, oaAD3100, LOG130,
   LOG275, LOG276, LOG232;
}
Uses LOGDM1, LOG601, oaAD3100, LOG130, LOG275, LOG276, LOG232;

{$R *.DFM}

Procedure TFRegOrdCD.Z2bbtnOKClick(Sender: TObject);
Var
   xPasa: Integer;
   scad, sFilter: String;
   st: TDataSetState;
   nst: Integer;
Begin
// Valida Datos de la Cabecera
   ValidaCab;

// Inicio HPC_201701_LOG
// 06/07/2017 retira Validación de Número de Compra ya que se está creando desde el principio
{
   xPasa := 0;
   If xPriInser = 'A' Then
   Begin
      If Length(Trim(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)) > 0 Then
      Begin
         If DMLOG.IsExistORD(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString,
            DMLOG.cdsOrdComp.FieldByName('ODCID').AsString) Then
         Begin
            xPasa := 1;
         End
         Else
            xPasa := 0;
      End
      Else
      Begin
         ErrorMsg('Error', 'Ingrese la Compañia ..... ');
         Exit;
      End;
   End;

   If xPasa = 1 Then
   Begin
      If Question('Confirmar', 'Ya existe Una Orden de Compra con el Nº  ' +
         dbeNReg.Text + #13 + #13 +
         'Desea volver a generar el nuevo Nº de Order de Compra y Continuar ' + #13 + #13) Then
      Begin
         sNumORD := DMLOG.MaxORDAnio(dblccia.Text, Copy(dbdtpFReg.Text, 7, 4));

         DMLOG.cdsOrdComp.fieldbyName('ODCID').asString := sNumOrd;
         xPasa := 0;
      End;
   End;

   If xPasa = 1 Then
   Begin
      Exit;
   End;
}
// Fin HPC_201701_LOG

   Screen.Cursor := crHourGlass;

// Actualiza Cabecera
   xSigueGrab := True;
   ActualizaLOG304;
   If Not xSigueGrab Then
      exit;

   st := DMLOG.cdsOrdComp.State;

   AsigDat; // asignar los datos predeterminados
   If Length(trim(dbmObs.text)) = 0 Then
      DMLOG.cdsOrdComp.fieldbyname('ODCOBS').AsString := '.';

   DMLOG.cdsOrdComp.Post;

   xPriInser := '';

   xSQL := 'Select CIAID, ODCID, ARTID, UNMID, DODCID, DODCCNTU, DODCCNT, DODCPUNU, '
      + '          DODCPUN, DODCDSCTO, DODCIMP, DODCIMPU, PROFID, ODCEST, DODCCATEU,  '
      + '          DODCCATE, DODCCSLDU, DODCCSLD, DODCISC, DODCISCU, ARTIDPROV, ARTDESPROV,  '
      + '          UNMIDEQUIV, PUNTEQUIV, CNTEQUIV, DODCFTUM, TIPOADQ, CCOMERID, ACFREG,  '
      + '          DODCOBS, IMPTOT, IMPUNI, ODCUSER, PROV, TINID, GRARID, FAMID, SFAMID,  '
      + '          ODCANO, ODCMES, ODCDIA, ODCTRIM, ODCSEM, ODCANOMES, ODCSS, ODCAATRI,  '
      + '          ODCAASEM, ODCAASS, ODCFREG, ODCMMSS, PROVRUC, CLAUXID '
      + '     from LOG305 '
      + '    where CIAID = ' + quotedstr(dblcCIA.text)
      + '      and ODCID = ' + quotedstr(dbeNReg.Text);
   DMLOG.cdsDOrdComp.Close;
   DMLOG.cdsDOrdComp.dataRequest(xSQL);
   DMLOG.cdsDOrdComp.Open;

// Inicio HPC_201701_LOG
// 06/07/2017 Apertura siempre el archivo de Observaciones de Detalle de la orden de Compra
//   If DMLOG.wModo = 'A' Then
//   Begin
   xSQL := 'Select CIAID, ODCID, DODCID, RQSID, DRQSID, ARTID, '
      + '          DODCCNT, TIPOADQ, DODCOBS, FLAGUM, LOCID '
      + '     from LOG324 '
      + '    where CIAID='+quotedstr(dblcCIA.Text)
      + '      and ODCID='+quotedstr(dbeNReg.Text);
   DMLOG.cdsDODCxDRQS.Close;
   DMLOG.cdsDODCxDRQS.DataRequest(xSQL);
   DMLOG.cdsDODCxDRQS.Open;
   xOrdElim := DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString; // Si graba podre borrar
//   End;
// Fin HPC_201701_LOG

   OnOffCabecera(False); //Desactivar el panel de Cabecera
   OnOffDetalle(True); //Activar el panel de detalle
   If (FOrdendeCompra.wTipoOC = 'xProforma') Or
      (dblcTipoCompra.Text = 'I') Then
      Z2dbgDReqsIButton.Enabled := False
   Else
      Z2dbgDReqsIButton.Enabled := True;

 //Habilitamiento de Botones inferior
   Z2bbtnRegresa.Enabled := True;
   Z2bbtnCanc2.Enabled := True;
   Z2bbtnGraba.Enabled := true;
   Z2bbtnAcepta.Enabled := True;
   z2bbtnSalir.Enabled := True;
   pnlDetalleG.SetFocus;

   If FOrdendeCompra.wTipoOC = 'xRequisicion' Then
   Begin
      ProXReq;
   End;

   If FOrdendeCompra.wTipoOC = 'xRequisicionTotal' Then
   Begin
      ProXReqTot;
   End;

   If FOrdendeCompra.wTipoOC = 'xRequerimiento' Then
   Begin
      fg_ListaReqPendientes;
   End;

   If FOrdendeCompra.wTipoOC = 'xOCDirecta' Then
   Begin
      dbcldArti.Clear;
      dbcldArti.Selected.Add('ARTID' + #9 + '9' + #9 + 'Código');
      dbcldArti.Selected.Add('ARTDES' + #9 + '35' + #9 + 'Articulo');
      dbcldArti.Selected.Add('UNMIDG' + #9 + '6' + #9 + 'U.M');
      dbcldArti.Selected.Add('ARTPCG' + #9 + '9' + #9 + 'Precio~Compra Gral.');

      xSQL := ' Select CLAUXID, CLAUXDES, PROV, PROVDES, GRARID, GRARDES, CIAID, TINID '
         + '      from LOG202 '
         + '     where CIAID=' + QuotedStr(dblcCIA.text)
         + '       and PROV =' + QuotedStr(dblcdProv.text);
      DMLOG.cdsQry.Close;
      DMLOG.cdsQry.DataRequest(xSQL);
      DMLOG.cdsQry.Open;
      sCad := '';
      If DMLOG.cdsQry.RecordCount > 0 Then
      Begin
         If DMLOG.cdsQry.RecordCount = 1 Then //SOLO UN REGISTRO
         Begin
            sCad := 'GRARID=' + QuotedStr(DMLOG.cdsQry.FieldByName('GRARID').AsString);
         End
         Else // MAS DE DOS REGISTROS
         Begin
            DMLOG.cdsQry.First;
            While Not DMLOG.cdsQry.EOF Do
            Begin
               If DMLOG.cdsQry.RecordCount = DMLOG.cdsQry.RecNo Then // SI ES EL ULTIMO YA NO LE PONE OR
               Begin
                  sCad := sCad + ' GRARID=' + QuotedStr(DMLOG.cdsQry.FieldByName('GRARID').AsString)
               End
               Else
               Begin
                  sCad := sCad + ' GRARID=' + QuotedStr(DMLOG.cdsQry.FieldByName('GRARID').AsString) + ' OR ';
               End;
               DMLOG.cdsQry.Next;
            End;
         End;
         sFilter := ' ( ' + sCad + ' )';
      End
      Else
      Begin
         sFilter := '';
      End;
      If Length(sFilter) > 0 Then
         DMLOG.cdsArti.Filter := ' CIAID=' + QuotedStr(dblcCIA.text) + ' AND ' + sFilter
      Else
      Begin
         DMLOG.cdsArti.Filter := ' CIAID=' + QuotedStr(dblcCIA.text);
      End;
      DMLOG.cdsArti.Filtered := True;
   End;

   If FOrdendeCompra.wTipoOC = 'xCotizacion' Then
   Begin
      Z2dbgDReqsIButton.Enabled := False;
      Screen.Cursor := crDefault;
      ActualizaGrid(dblcCIA.Text, Trim(edtNumReferencia.Text));
   End;

   Screen.Cursor := crDefault;
// Inicio HPC_201701_LOG
// 06/07/2017 Cambia Modalidad de Ingreso por Número de Registros
//   If DMLOG.wModo = 'A' Then
   If DMLOG.cdsDOrdComp.RecordCount = 0 Then
// Fin HPC_201701_LOG
   Begin
      xDesac := 1;
      Z2dbgDReqsIButton.Click;
   End;
End;

Procedure TFRegOrdCD.AsigDat;
Var
   D, M, Y: Word;
   sFecha: String;
   xTipoOC: String;
Begin
   DecodeDate(dbdtpFReg.Date, Y, M, D);

   DMLOG.cdsOrdComp.Edit;
   If Length(Trim(DMLOG.cdsOrdComp.FieldbyName('ODCOBS').AsString)) = 0 Then
      DMLOG.cdsOrdComp.FieldbyName('ODCOBS').AsString := '.';

   If DMLOG.wModo = 'M' Then
   Begin
      DMLOG.cdsOrdComp.FieldByName('DOCREF').AsString := edtnumRequerimiento.Text
   End;

// Inicio HPC_201701_LOG
// 06/07/2017 Cambia Modalidad de Ingreso por Número de Registros
//   If DMLOG.wModo = 'A' Then
   If DMLOG.cdsDOrdComp.RecordCount = 0 Then
   Begin
// Fin HPC_201701_LOG
      DMLOG.cdsOrdComp.FieldbyName('CLAUXID').AsString := xProv;
      DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString := 'INICIAL';
      DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').AsFloat := 0.0;
      DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat := 0.0;
      DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat := 0.0;
      DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat := 0.0;
      If DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat < 0 Then
         DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat := 0.0;
      DMLOG.cdsOrdComp.FieldbyName('ODCUSER').AsString := DMLOG.wUsuario;

      If FOrdendeCompra.wTipoOC = 'xOCDirecta' Then
         xTipoOC := 'D'
      Else
         If FOrdendeCompra.wTipoOC = 'xCotizacion' Then
            xTipoOC := 'C'
         Else
            If FOrdendeCompra.wTipoOC = 'xProforma' Then
               xTipoOC := 'P'
            Else
               If FOrdendeCompra.wTipoOC = 'xRequerimiento' Then
                  xTipoOC := 'R'
               Else
                  If length(trim(DMLOG.cdsOrdComp.FieldByName('PROFID').AsString)) = 0 Then
                     xTipoOC := 'R'
                  Else
                     xTipoOC := 'P';
      DMLOG.cdsOrdComp.FieldbyName('OCTIP').AsString := xTipoOC;

      sFecha := FormatDateTime(DMLOG.wFormatFecha, dbdtpFReg.Date);
      xSQL := 'Select FECHA, FECANO, FECMES, FECDIA, FECDIASS, FECTRIM, FECSEM, FECSS, '
         + '          FECAATRI, FECAASEM, FECAASS, FECMMSS, FECLAB '
         + '     from TGE114 '
         + '    where FECHA=' + QuotedStr(sFecha);
      DMLOG.FiltraCDS(DMLOG.cdsPeriodo, xSQL);

      DMLOG.cdsOrdComp.FieldbyName('ODCANO').AsString := IntToStr(Y);
      DMLOG.cdsOrdComp.FieldbyName('ODCMM').AsString := DMLOG.strzero(IntToStr(M), 2);
      DMLOG.cdsOrdComp.FieldbyName('ODCDD').AsString := DMLOG.strzero(IntToStr(D), 2);
      DMLOG.cdsOrdComp.FieldbyName('ODCANOMM').AsString := IntToStr(Y) + DMLOG.strzero(IntToStr(M), 2);
      DMLOG.cdsOrdComp.FieldbyName('ODCTRI').AsString := DMLOG.cdsPeriodo.fieldbyName('FECTRIM').asString;
      DMLOG.cdsOrdComp.FieldbyName('ODCSEM').AsString := DMLOG.cdsPeriodo.fieldbyName('FECSEM').asString;
      DMLOG.cdsOrdComp.FieldbyName('ODCSS').AsString := DMLOG.cdsPeriodo.fieldbyName('FECSS').asString;
      DMLOG.cdsOrdComp.FieldbyName('ODCAATRI').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAATRI').asString;
      DMLOG.cdsOrdComp.FieldbyName('ODCAASEM').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAASEM').asString;
      DMLOG.cdsOrdComp.FieldbyName('ODCAASS').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAASS').asString;

      DMLOG.cdsOrdComp.FieldbyName('ODCFREG').AsDateTime := dbdtpFReg.Date;
      DMLOG.cdsOrdComp.FieldbyName('ODCHREG').AsDateTime := SysUtils.Time;
      DMLOG.cdsOrdComp.FieldbyName('PROFID').AsString := edtNumReferencia.Text;

      DMLOG.cdsOrdComp.FieldByName('DOCREF').AsString := edtnumRequerimiento.Text
   End;
End;

Procedure TFRegOrdCD.FormCreate(Sender: TObject);
Begin
   If (Not dedNProforma.Enabled) And (CbTipOrdCompra.Text = 'O.C. DIRECTA') Then
   Begin
      dedNProforma.Visible := False;
      edtNumRequerimiento.Enabled := True;
   End
   Else
   Begin
      dedNProforma.Visible := True;
      edtNumRequerimiento.Enabled := False;
   End;

   If DMLOG.cdsCia.Active = False Then
      DMLOG.FiltraTabla(DMLOG.cdsCia, 'TGE101', 'CIAID', 'CIAID');

   dblcCIA.datafield := 'CIAID';
   dblcCIA.datasource := DMLOG.dsOrdComp;
   dblcCIA.LookUpField := 'CIAID';
   dblcCIA.LookUpTable := DMLOG.cdsCIA;

   If DMLOG.cdsProv.Active = False Then
      DMLOG.FiltraTabla(DMLOG.cdsProv, 'TGE201', 'PROV', 'PROV');
   dblcdProv.datafield := 'PROV';
   dblcdProv.datasource := DMLOG.dsOrdComp;
   dblcdProv.LookUpField := 'PROV';
   dblcdProv.LookUpTable := DMLOG.cdsProv;

   If DMLOG.cdsTMoneda.Active = False Then
      DMLOG.FiltraTabla(DMLOG.cdsTMoneda, 'TGE103', 'TMONID', 'TMONID');
   dblcTMoneda.datafield := 'TMONID';
   dblcTMoneda.datasource := DMLOG.dsOrdComp;
   dblcTMoneda.LookUpField := 'TMONID';
   dblcTMoneda.LookUpTable := DMLOG.cdsTMoneda;

   dbdtpFEmi.datafield := 'ODCFEMI';
   dbdtpFEmi.datasource := DMLOG.dsOrdComp;

   dblcFPago.datafield := 'CCOMERID';
   dblcFPago.datasource := DMLOG.dsOrdComp;
   dblcFPago.LookUpField := 'CCOMERID';
   dblcFPago.LookUpTable := DMLOG.cdsFPago;

   dblcLEntrega.datafield := 'LGECID';
   dblcLEntrega.datasource := DMLOG.dsOrdComp;
   dblcLEntrega.LookUpField := 'LGECID';
   dblcLEntrega.LookUpTable := DMLOG.cdsLEntrega;

   dblcTipoCompra.datafield := 'TIPOADQ';
   dblcTipoCompra.datasource := DMLOG.dsOrdComp;
   dblcTipoCompra.LookUpField := 'TIPOADQ';
   dblcTipoCompra.LookUpTable := DMLOG.cdsTipSol;

   dblcdProv.OnNotInList := dblcNotInList;
   dblcTMoneda.OnNotInList := dblcNotInList;
   dblcFPago.OnNotInList := dblcNotInList;
   DMLOG.cdsDOrdComp.BeforePost := cdsDOrdCompBeforePost;
   cds1.RemoteServer := DMLOG.DCOM1;
   cds1.ProviderName := 'prvLOG';
   dblcUMEquiv.LookupTable := cds1;

   DMLOG.FiltraTabla(DMLOG.cdsClAux, 'TGE102', '*', 'CLAUXID');
   dblcTipoAuxiliar.LookUpTable := DMLOG.cdsClAux;
   dblcTipoAuxiliar.LookUpField := 'CLAUXID';
   dblcTipoAuxiliar.DataSource := DMLOG.dsOrdComp;
   dblcTipoAuxiliar.DataField := 'CLAUXID';
   dblcTipoAuxiliar.Selected.Clear;
   dblcTipoAuxiliar.Selected.Add('CLAUXID' + #9 + '4' + #9 + 'Id');
   dblcTipoAuxiliar.Selected.Add('CLAUXDES' + #9 + '9' + #9 + 'Tipo Auxiliar');

   dblcdProv.Selected.Clear;
   dblcdProv.Selected.Add('PROV'#9'9'#9'Código'#9'F');
   dblcdProv.Selected.Add('PROVRUC'#9'12'#9'Nº RUC'#9'F');
   dblcdProv.Selected.Add('PROVDES'#9'30'#9'Razón Social'#9'F');
   dblcdProv.Selected.Add('PROVNOMCOM'#9'30'#9'Nombre Comercial'#9'F');
   dblcdProv.Selected.Add('CLAUXID'#9'4'#9'Aux Id'#9'F');
   VSCCID := '';
End;

Procedure TFRegOrdCD.Z2bbtnRegresaClick(Sender: TObject);
Begin
   If Length(Trim(DMLOG.cdsOrdComp.fieldbyname('ODCVISADOR').AsString)) > 0 Then
   Begin
      OnOffCabecera(False); //Activar la cabecera
      OnOffDetalle(True); //Desactivar el panel de detalle
   End
   Else
   Begin
      DMLOG.cdsOrdComp.Edit;
      OnOffCabecera(True); //Activar la cabecera
      OnOffDetalle(False); //Desactivar el panel de detalle
      If DMLOG.cdsDOrdComp.RecordCount = 0 Then
      Begin
         dblcTipoCompra.Enabled := True;
      End
      Else
      Begin
         dblcTipoCompra.Enabled := False;
      End;
   End;

   If dblcTipoCompra.Text = 'I' Then
      gbPagoServ.Enabled := False
   Else
      gbPagoServ.Enabled := gbPagoServ.Enabled;

End;

Procedure TFRegOrdCD.Z2bbtnCanc2Click(Sender: TObject);
Begin
   If FRegOrdCD = Nil Then
      Exit;

   If Length(Trim(xOrdElim)) <= 0 Then
   Begin
      ShowMessage('Sólo se puede Eliminar Órdenes de Compras grabadas');
      exit;
   End;

// Inicio HPC_201701_LOG
// 06/07/2017 Cambia Modalidad de Ingreso por Número de Registros
//   If DMLOG.wModo = 'A' Then
   If DMLOG.cdsDOrdComp.RecordCount = 0 Then
// Fin HPC_201701_LOG
   Begin
      ShowMessage('Sólo se puede Eliminar Órdenes de Compras nuevas');
      exit;
   End;

   If (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) <> 'INICIAL') Then
   Begin
      ShowMessage('Sólo se puede Eliminar Órdenes de Compras en estado INICIAL');
      exit;
   End;

   If Not DMLOG.cdsOrdComp.FieldbyName('ODCVISADOR').IsNull Then
   Begin
      ShowMessage('No se puede Eliminar Órdenes de Compra VISADAS');
      exit;
   End;

   If MessageDlg('Se Eliminará la Orden de Compra' + #13
      + '¿Desea Continuar?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
   Begin
// Inicio HPC_201804_LOG
// Se cambia el orden de la lógica de la programación, Instrucción luego limpia los CDS
(*
      DMLOG.cdsOrdComp.CancelUpdates;
      DMLOG.cdsDOrdComp.CancelUpdates;

      DMLOG.cdsDOrdComp.First;
      While Not DMLOG.cdsDOrdComp.Eof Do
         DMLOG.cdsDOrdComp.Delete;

      DMLOG.cdsOrdComp.Delete;
*)
      DMLOG.DCOM1.AppServer.IniciaTransaccion;

      xSigueGrab := True;

      DeletTodoLOG304;
      If Not xSigueGrab Then
      Begin
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;

      DeletTodoLOG305;
      If Not xSigueGrab Then
      Begin
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;
      DMLOG.DCOM1.AppServer.GrabaTransaccion;

      DMLOG.cdsOrdComp.CancelUpdates;
      DMLOG.cdsDOrdComp.CancelUpdates;

      DMLOG.cdsDOrdComp.First;
      While Not DMLOG.cdsDOrdComp.Eof Do
         DMLOG.cdsDOrdComp.Delete;

      DMLOG.cdsOrdComp.Delete;

      DMLOG.wModo := '';
      DMLOG.cdsOrdComp.edit;
      Close;
// Fin HPC_201804_LOG
   End;
End;

Procedure TFRegOrdCD.Z2bbtnGrabaClick(Sender: TObject);
Var
   xCIAID, xODCID, xImp: String;
   xFle: Double;
   xsMensaje: String;
Begin
   If dblcTipoCompra.Text = 'I' Then
   Begin
      If DMLOG.Valores(dbeImporte.Text) <> DMLOG.Valores(edtImporte.Text) Then
      Begin
         ShowMessage('El importe es diferente al RECIBO DEL PROVEEDOR....');
         EXIT;
      End;
   End;

   DMLOG.DCOM1.AppServer.IniciaTransaccion;
   While Not xOk Do
   Begin
      xODCID := DMLOG.MaxORDAnio(dblccia.Text, Copy(dbdtpFReg.Text, 7, 4));
      DMLOG.cdsOrdComp.Edit;
      DMLOG.cdsOrdComp.fieldbyName('ODCID').asString := xODCID;
      xOk := True;
   End;

   If DMLOG.cdsOrdComp.State In [dsEdit] Then
      DMLOG.cdsOrdComp.post;

   If DMLOG.cdsDOrdComp.RecordCount > 0 Then
   Begin
      ValidaTot;
      Screen.Cursor := crHourGlass;
      If DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat > 0 Then
      Begin
         xCIAID := DMLOG.cdsOrdComp.FieldByName('CIAID').AsString;
         xODCID := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;

         If Not DMLOG.cdsDOrdComp.Locate('CIAID;ODCID;DODCID', VarArrayOf([xCIAID, xODCID, '999']), []) Then
            DMLOG.cdsDOrdComp.Insert
         Else
            DMLOG.cdsDOrdComp.Edit;

         If DMLOG.cdsDOrdComp.State In [dsInsert, dsEdit] Then
         Begin
            DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString := xCIAID;
            DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString := xODCID;
            DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString := '999';
            DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString := '999';
            DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString := DMLOG.DisplayDescrip('prvSQL', 'TGE130', 'UNMID', 'UNMSERV=''S''', 'UNMID');
            DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString := '1';
            DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsString := DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsString;
            DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsString := '0.00';
            DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsString := DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsString;
            If DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsFloat = 0 Then
               DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString := wIGV;

            xFle := StrtoFloat(DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsString);
            xImp := FloattoStr(xFle + (xFle * StrtoFloat(DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString) / 100));
            DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsString := xImp;
            DMLOG.cdsDOrdComp.FieldByName('IMPUNI').AsString := xImp;
            DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsString := '0.00';
            DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString := 'FLETE';
            DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString := DMLOG.cdsOrdComp.FieldByName('TIPOADQ').AsString;
            DMLOG.cdsDOrdComp.Post;
            CalcTotal(Nil);
            OnOffDetalle(True); // activar detalle
         End;
      End
      Else
      Begin
         CalcTotal(Nil);
      End;

      If dblcTipoCompra.Text = 'I' Then
      Begin
         xSQL := ' Update LOG304 '
            + '       set KEYRECIBO=' + quotedstr(DMLOG.cdsSerPend.FieldByname('KEYRECIBO').AsString)
            + '     Where CIAID=' + quotedstr(dblcCIA.Text)
            + '       and ODCID=' + quotedstr(xODCID);
         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            Screen.Cursor := crDefault;
            ShowMessage('Error al actualizar Nro.de Recibo en Cabecera O.Compra (LOG304 - KEYRECIBO) ');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      End;

      DMLOG.cdsDODCxDRQS.First;
      While Not DMLOG.cdsDODCxDRQS.Eof Do
      Begin
         DMLOG.cdsDODCxDRQS.Edit;
         DMLOG.cdsDODCxDRQS.FieldByName('ODCID').AsString := DMLOG.cdsOrdComp.fieldbyName('ODCID').asString;
         DMLOG.cdsDODCxDRQS.Next;
      End;
      DMLOG.cdsDOrdComp.First;
      While Not DMLOG.cdsDOrdComp.Eof Do
      Begin
         DMLOG.cdsDOrdComp.Edit;
         DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString := DMLOG.cdsOrdComp.fieldbyName('ODCID').asString;
         DMLOG.cdsDOrdComp.Next;
      End;

      OnOffVisar(True);
   End;

   Screen.Cursor := crHourGlass;
   dbeDescExit(Nil);
   xOrdElim := '';

   DMLOG.cdsDODCxDRQS.First;
   While Not DMLOG.cdsDODCxDRQS.Eof Do
   Begin
      xSQL := 'Update LOG324 '
         + '      Set RQSID=' + quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('RQSID').AsString)
         + '          DRQSID=' + quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('DRQSID').AsString)
         + '          ARTID=' + quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('ARTID').AsString)
         + '          DODCCNT=' + quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('DODCCNT').AsString)
         + '          TIPOADQ=' + quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('TIPOADQ').AsString)
         + '          DODCOBS=' + quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('DODCOBS').AsString)
         + '          FLAGUM=' + quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('FLAGUM').AsString)
         + '          LOCID=' + quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('LOCID').AsString)
         + '    where CIAID=' + quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('CIAID').AsString)
         + '      and ODCID' + quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('ODCID').AsString)
         + '      and DODCID' + quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('DODCID').AsString);
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al actualizar archivo de Relación Requisición vs Orden de Compra LOG324 ');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;
      DMLOG.cdsDODCxDRQS.Next;
   End;

// Actualiza Detalle
   xSigueGrab := True;
   DMLOG.cdsDOrdComp.First;
   While Not DMLOG.cdsDOrdComp.Eof Do
   Begin
      ActualizaLOG305;
      If Not xSigueGrab Then
      Begin
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;
      DMLOG.cdsDOrdComp.Next;
   End;
     //Actualiza Cabecera
   ActualizaLOG304;
   If Not xSigueGrab Then
   Begin
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      exit;
   End;

   If dblcTipoCompra.Text = 'I' Then
   Begin
      xSQL := 'Update LOG_MOV_SERVICIOS '
         + '      set UBICACION=''OC'', '
         + '          FECOC=SYSDATE,ESTADO=''P'', '
         + '          NUMREF='+quotedstr(xODCID)
         + '    Where KEYRECIBO='+quotedstr(DMLOG.cdsSerPend.FieldByname('KEYRECIBO').AsString);
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al realizar Movimiento de Servicios (LOG_MOV_SERVICIOS)');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;
   End;

 // Actualiza el numero de Orden de Compra en el Cuadro Comparativo
   If Length(Trim(VSCCID)) > 0 Then
   Begin
      xSQL := ' Update LOG341 '
         + '       Set ODCID=' + quotedstr(Trim(dbeNReg.text))
         + '     Where CIAID=' + quotedstr(dblcCIA.Text)
         + '       And SCCID=' + quotedstr(Trim(VSCCID));
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al actualizar el número de Orden de Compra en el Cuadro Comparativo (LOG341)');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;
   End;

   dbeNReg.Enabled := False;
   dbeDesc.Enabled := False;
   btnDetalle;
   Screen.Cursor := crDefault;
   If DMLOG.fg_ValidaDatosProveedor(DMLOG.cdsOrdComp.FieldByName('CLAUXID').AsString, DMLOG.cdsOrdComp.FieldByName('PROV').AsString, xsMensaje) = False Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage(xsMensaje);
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      exit;
   End;

   DMLOG.DCOM1.AppServer.GrabaTransaccion;

   If DMLOG.wTipoAdicion = 'xFiltro' Then
   Begin
      Try
         DMLOG.ActualizaFiltro(Mtx3100, DMLOG.cdsOrdComp, DMLOG.wModo);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Grabación correcta, No se ha refrescado el Filtro');
      End;
   End;
   DMLOG.wModo := 'M';
End;

Procedure TFRegOrdCD.Z2bbtnAceptaClick(Sender: TObject);
Var
   Monto: Double;
   xPaso, xSalVis: Integer;
   nArtSol, nArtAte: Double;
   xProv, sEstado, xCLOCID, xCRQSID, xDRQSID, xFUM: String;
   lCompleto: boolean; //usado para las proformas
   xsMensaje: String;
Begin
   Screen.Cursor := crDefault;

   If dblcTipoCompra.Text = 'I' Then
   Begin
      If DMLOG.Valores(dbeImporte.Text) <> DMLOG.Valores(edtImporte.Text) Then
      Begin
         ShowMessage('El importe es diferente al RECIBO DEL PROVEEDOR....');
         Exit;
      End;
   End;

   If DMLOG.fg_ValidaDatosProveedor(DMLOG.cdsOrdComp.FieldByName('CLAUXID').AsString, DMLOG.cdsOrdComp.FieldByName('PROV').AsString, xsMensaje) = False Then
   Begin
      ShowMessage(xsMensaje + #13 + 'No podrá ACEPTAR la Orden de Compra');
      Exit;
   End;

   If xsMensaje <> '' Then
   Begin
      If MessageDlg(xsMensaje + #13 + 'Está seguro de Aceptar la OC?', mtConfirmation, [mbOK, mbCancel], 0) <> mrok Then
      Begin
         Exit;
      End;
   End;
   xSalVis := 0;

   If (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) <> 'VISADO') Or
      (DMLOG.cdsDOrdComp.RecordCount = 0) Then // inicial...
   Begin
      Z2bbtnRegresa.Enabled := False;
      Z2bbtnCanc2.Enabled := False;
      Z2bbtnGraba.Enabled := False;
      Z2bbtnAcepta.Enabled := False;
      z2bbtnSalir.Enabled := True;
      Raise exception.Create(' Esta Orden de Compra no está VISADA ');
   End;

   If Not Question('Confirmar', 'Esta Seguro de Aceptar La Orden de Compra ' + #13 + #13 +
      DMLOG.cdsOrdComp.FieldByName('ODCID').AsString + '  -  Prov.  ' +
      DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString + #13 +
      #13 + ' Desea Continuar ') Then
   Begin
      Exit;
   End;

   DMLOG.DCOM1.AppServer.IniciaTransaccion;
   Screen.Cursor := crHourGlass;
   xProv := dblcTipoAuxiliar.Text;

// Consultar que lo solicitado de la requisicion por la orden de compra sea todo el pedido
// si es asi, significa que el estado de la rqs es 'atendido' sino es 'parcial'

   If (FOrdendeCompra.wTipoOC = 'xRequisicion') Or
      (FOrdendeCompra.wTipoOC = 'xRequisicionTotal') Then
   Begin
      DMLOG.cdsDOrdComp.first;
      While Not DMLOG.cdsDOrdComp.eof Do
      Begin
         DMLOG.cdsDODCxDRQS.First;
         While Not DMLOG.cdsDODCxDRQS.Eof Do
         Begin
            nArtSol := DMLOG.cdsDODCxDRQS.fieldbyName('DODCCNT').asFloat;
            xCLOCID := DMLOG.cdsDODCxDRQS.fieldbyName('LOCID').asString;
            xCRQSID := DMLOG.cdsDODCxDRQS.fieldbyName('RQSID').asString;
            xDRQSID := DMLOG.cdsDODCxDRQS.fieldbyName('DRQSID').asString;
            xSQL := 'Select DRQSCNSG, DRQSCNAG, DRQSCNSU, DRQSCNAU '
               + '     from LOG309 '
               + '    where CIAID='+quotedstr(dblcCIA.Text)
               + '      and LOCID='+quotedstr(xCLOCID)
               + '      and RQSID='+quotedstr(xCRQSID)
               + '      and DRQSID='+quotedstr(xDRQSID);
            DMLOG.cdsLOG.Close;
            DMLOG.cdsLOG.DataRequest(xSQL);
            DMLOG.cdsLOG.Open;
            If DMLOG.cdsDODCxDRQS.fieldbyName('FLAGUM').AsString = 'G' Then
               xFUM := 'G'
            Else
               If DMLOG.cdsDODCxDRQS.fieldbyName('FLAGUM').AsString = 'U' Then
                  xFUM := 'U';
            If (nArtSol <> 0) And (Length(Trim(xFUM)) <> 0) Then
            Begin
               nArtAte := DMLOG.cdsLOG.FieldByName('DRQSCNA' + xFUM).AsFloat + nArtSol;
               If nArtAte >= DMLOG.cdsLOG.FieldByName('DRQSCNS' + xFUM).AsFloat Then
                  sEstado := 'ATENDIDO'
               Else
                  sEstado := 'PARCIAL';
               xSQL := 'Update LOG309 '
                  + '      set RQSEST=' + quotedStr(sEstado) + ', '
                  + '          DRQSCNA' + xFUM + '=' + FloatToStr(nArtAte) + ', '
                  + '          RQSFATE=' + DMLOG.wRepFuncDate + quotedStr(formatdatetime(DMLOG.wFormatFecha, Date)) + ') '
                  + '    where CIAID='+quotedstr(dblcCIA.Text)
                  + '      and LOCID='+quotedstr(xCLOCID)
                  + '      and RQSID='+quotedstr(xCRQSID)
                  + '      and DRQSID='+quotedstr(xDRQSID);
               Try
                  DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  Screen.Cursor := crDefault;
                  ShowMessage('Error al actualizar Detalle de Requisición (LOG309)');
                  DMLOG.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
            End;
            DMLOG.cdsDODCxDRQS.Next;
         End;
         DMLOG.cdsDOrdComp.next;
      End;
      xPaso := 0;

      xSQL := 'Select DISTINCT CIAID, LOCID, RQSID '
         + '     from LOG324 '
         + '    where CIAID=' + quotedstr(dblcCIA.Text)
         + '      and ODCID=' + quotedstr(DMLOG.cdsOrdComp.fieldbyName('ODCID').asString)
         + '      and DODCCNT > 0 '
         + '    order by RQSID';
      DMLOG.cdsLOG.Close;
      DMLOG.cdsLOG.DataRequest(xSQL);
      DMLOG.cdsLOG.Open;
      DMLOG.cdsLOG.First;
      While Not DMLOG.cdsLOG.Eof Do
      Begin
         If xPaso = 0 Then
         Begin
            xSQL := 'Select distinct RQSEST '
               + '     from LOG309 '
               + '    where CIAID=' + quotedstr(dblcCIA.Text)
               + '      and LOCID=' + quotedstr(DMLOG.cdsLOG.FieldByName('LOCID').AsString)
               + '      and RQSID=' + quotedstr(DMLOG.cdsLOG.FieldByName('RQSID').AsString)
               + '      and RQSEST = ''PARCIAL'' ';
            DMLOG.cdsQry.Close;
            DMLOG.cdsQry.DataRequest(xSQL);
            DMLOG.cdsQry.Open;
            If DMLOG.cdsQry.RecordCount > 0 Then
            Begin
               xSQL := 'Update LOG308 '
                  + '      set RQSEST=' + quotedStr('PARCIAL') + ' '
                  + '    where CIAID=' + quotedstr(DMLOG.cdsLOG.FieldByName('CIAID').AsString)
                  + '      and LOCID=' + quotedstr(DMLOG.cdsLOG.FieldByName('LOCID').AsString)
                  + '      and RQSID=' + quotedstr(DMLOG.cdsLOG.FieldByName('RQSID').AsString);
               Try
                  DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  Screen.Cursor := crDefault;
                  ShowMessage('Error al actualizar estado PARCIAL a Cabecera de Requisición (LOG308)');
                  DMLOG.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
               xPaso := 1;
            End;
         End;
         If xPaso = 0 Then
         Begin
            xSQL := 'Select distinct RQSEST '
               + '     from LOG309 '
               + '    where CIAID=' + quotedstr(DMLOG.cdsLOG.FieldByName('CIAID').AsString)
               + '      and LOCID=' + quotedstr(DMLOG.cdsLOG.FieldByName('LOCID').AsString)
               + '      and RQSID=' + quotedstr(DMLOG.cdsLOG.FieldByName('RQSID').AsString)
               + '      and RQSEST=''ACEPTADO'' ';
            DMLOG.cdsQry.Close;
            DMLOG.cdsQry.DataRequest(xSQL);
            DMLOG.cdsQry.Open;
            If DMLOG.cdsQry.RecordCount > 0 Then
               xPaso := 1
         End;
         If xPaso = 0 Then
         Begin
            xSQL := 'Select distinct RQSEST '
               + '     from LOG309 '
               + '    where CIAID=' + quotedstr(DMLOG.cdsLOG.FieldByName('CIAID').AsString)
               + '      and LOCID=' + quotedstr(DMLOG.cdsLOG.FieldByName('LOCID').AsString)
               + '      and RQSID=' + quotedstr(DMLOG.cdsLOG.FieldByName('RQSID').AsString)
               + '      and RQSEST=''ATENDIDO'' ';
            DMLOG.cdsQry.Close;
            DMLOG.cdsQry.DataRequest(xSQL);
            DMLOG.cdsQry.Open;
            If DMLOG.cdsQry.RecordCount > 0 Then
            Begin
               xSQL := 'Update LOG308 '
                  + '      set RQSEST=' + quotedStr('ATENDIDO') + ' '
                  + '    where CIAID=' + quotedstr(DMLOG.cdsLOG.FieldByName('CIAID').AsString)
                  + '      and LOCID=' + quotedstr(DMLOG.cdsLOG.FieldByName('LOCID').AsString)
                  + '      and RQSID=' + quotedstr(DMLOG.cdsLOG.FieldByName('RQSID').AsString);
               Try
                  DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  Screen.Cursor := crDefault;
                  ShowMessage('Error al actualizar estado ATENDIDO a Cabecera de Requisición (LOG308)');
                  DMLOG.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
            End;
         End;
         xPaso := 0;
         DMLOG.cdsLOG.Next;
      End;
   End;

  //Consultar que lo solicitado de la proforma por la orden de compra sea todo el pedido
  //si es asi, significa que el estado de la rqs es 'atendido' sino es 'parcial'
   If FOrdendeCompra.wTipoOC = 'xProforma' Then
   Begin
      xSQL := 'Select substr(DPROF.DPROFOBS,1,50) DPROFOBS, '
         + '          (case when DPROF.DPROFLAGUM=''G'' then DPROF.UNMIDG else DPROF.UNMIDU end) UNMIDP, '
         + '          (case when DPROF.DPROFLAGUM=''G'' then DPROF.DPROFCNTG else DPROF.DPROFCNTU end) CNT, '
         + '          DOC.CIAID, DOC.UNMID UNMIDO, DOC.DODCCNT, SUBSTR(DOC.DODCOBS,1,50) DODCOBS '
         + '     from LOG313 DPROF, LOG305 DOC '
         + '    where DPROF.CIAID=' + quotedstr(dblcCIA.Text)
         + '      and DPROF.PROFID=' + quotedstr(dedNProforma.text)
         + '      and DOC.CIAID=DPROF.CIAID '
         + '      and DOC.PROFID=DPROF.PROFID '
         + '      and SUBSTR(DPROF.DPROFOBS,1,50) = SUBSTR(DOC.DODCOBS,1,50) ';
      DMLOG.cdsSQL.close;
      DMLOG.cdsSQL.datarequest(xSQL);
      DMLOG.cdsSQL.open;
      DMLOG.cdsSQL.first;
      lCompleto := true;
      While Not DMLOG.cdsSQL.eof And lCompleto Do
      Begin
         If DMLOG.cdsSQL.fieldbyName('UNMIDP').AsString <> DMLOG.cdsSQL.fieldbyName('UNMIDO').AsString Then
            lCompleto := false;
         DMLOG.cdsSQL.next;
      End;
      If lCompleto Then
         sEstado := 'PARCIAL'
      Else
         sEstado := 'ATENDIDO';
      xSQL := 'Update LOG312 '
         + '      set PROFEST=' + quotedStr(sEstado)
         + '    where CIAID=' + quotedstr(dblcCIA.Text)
         + '      and PROFID=' + quotedstr(dedNProforma.text);
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al actualizar el Estado en la cabecera de Proformas (LOG312)');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;
   End;

   If DMLOG.cdsDOrdComp.State In [dsEdit, dsInsert] Then
      DMLOG.cdsDOrdComp.Post;

   DMLOG.cdsOrdComp.Edit;
   DMLOG.cdsOrdComp.FieldbyName('ORDPAGPEN').Value := DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').Value;
   DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString := 'ACEPTADO';
   DMLOG.cdsOrdComp.FieldbyName('ODCACEPFREG').AsDateTime := Date;
   DMLOG.cdsOrdComp.FieldbyName('ODCACEPHREG').AsDateTime := SysUtils.Time;
   DMLOG.cdsOrdComp.Post;

// ORDPAGPEN - Monto Pendiente en Orden de Pago
// ODCEST - Estado de la Orden de Pago
// ODCACEPFREG - Fecha de Registro de Aceptación
// ODCACEPHREG - Hora de Registro de Aceptación

   xSQL := 'Update LOG304 '
      + '      set ORDPAGPEN=' + FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').AsFloat) + ','
      + '          ODCEST=''ACEPTADO'', ODCACEPFREG=trunc(sysdate), ODCACEPHREG=sysdate '
      + '    where CIAID=' + quotedstr(dblcCIA.Text)
      + '      And ODCID=' + quotedstr(DMLOG.cdsOrdComp.FieldByname('ODCID').AsString);
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      Screen.Cursor := crDefault;
      ShowMessage('Error al Actualizar Monto Pendiente de Orden de Pago y Estado de Cabecera de Orden de Compra (LOG304)');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      exit;
   End;

   xSQL := 'Update TGE201 '
      + '      set PROVUFMOV=' + DMLOG.wRepFecServi + ', '
      + '          ACTXOC=''S'' '
      + '    where CLAUXID=' + QuotedStr(xProv)
      + '      and PROV=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('PROV').AsString);
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      Screen.Cursor := crDefault;
      ShowMessage('Error al actualizar Fecha de último movimiento en Maestro de Proveedores (TGE201)');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      exit;
   End;

   xSigueGrab := True;
   If (FOrdendeCompra.wTipoOC <> 'xProforma') Or (FOrdendeCompra.wTipoOC = 'xOCDirecta') Then
   Begin
      GenerProfOCompra;
      If Not xSigueGrab Then
      Begin
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;
   End;

   DMLOG.DCOM1.AppServer.GrabaTransaccion;

   If DMLOG.wTipoAdicion = 'xFiltro' Then
   Begin
      Try
         DMLOG.ActualizaFiltro(Mtx3100, DMLOG.cdsOrdComp, 'M');
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Cambio a ACEPTADO correcto, Error al realizar la Actualización de Filtro');
         exit;
      End;
   End;

   Screen.Cursor := crDefault;
   Z2bbtnRegresa.Enabled := False;
   Z2bbtnCanc2.Enabled := False;
   Z2bbtnGraba.Enabled := False;
   Z2bbtnAcepta.Enabled := False;
   z2bbtnSalir.Enabled := True;
End;

Procedure TFRegOrdCD.Z2bbtnAnulaClick(Sender: TObject);
Begin
   If Length(Trim(DMLOG.cdsOrdComp.FieldbyName('ODCOBSANU').AsString)) > 0 Then
   Begin
      memObsAnu.Text := DMLOG.cdsOrdComp.FieldbyName('ODCOBSANU').AsString;
      bbtnAceObsAnu.Enabled := False;
      pnlObsAnula.Visible := True;
      Exit;
   End;

   If (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) <> 'ACEPTADO') Then
   Begin
      Information('Adquisiciones', 'Este Documento no Puede ser Anulado');
      Exit;
   End;

   If fg_ExisteOrdenPago(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString, DMLOG.cdsOrdComp.FieldByName('ODCID').AsString) = True Then
   Begin
      Exit;
   End;

   If Not Question('Confirmar', 'Esta Seguro de Anular La Orden de Compra ' + #13 + #13 +
      DMLOG.cdsOrdComp.FieldByName('ODCID').AsString + '  -  Prov.  ' +
      DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString + #13 +
      #13 + ' Este Proceso no se podra Revertir ' + #13 + #13 +
      #13 + ' Desea Continuar ') Then
   Begin
      Exit;
   End;
   bbtnAceObsAnu.Enabled := True;
   memObsAnu.Text := '';
   pnlObsAnula.Left := 24;
   pnlObsAnula.Top := 366;
   pnlObsAnula.BringToFront;
   pnlObsAnula.Visible := True;
   memObsAnu.SetFocus;
End;

Procedure TFRegOrdCD.Z2dbgDReqsIButtonClick(Sender: TObject);
Var
   sCIAID, sODCID, sARTID: String;
   bExiste: Boolean;
Begin
   If DMLOG.cdsOrdComp.State In [dsInsert, dsEdit] Then
   Begin
      Exit
   End;

   xCant := '';
   sCIAID := DMLOG.cdsOrdComp.FieldByName('CIAID').AsString;
   sODCID := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;

// OC Directa
   If FOrdendeCompra.wTipoOC = 'xOCDirecta' Then
   Begin
      iEstado := 0; ///insercion

   // Inicio HPC_201701_LOG
   // Determina Nro de Item en base a tabla LOG305 (Detalle de Orden de Compra)
      xSQL := ' Select cast(max(nvl(DODCID,''0''))+1 as varchar2(3)) DODCID '
         + '      From LOG305 '
         + '     Where CIAID=' + quotedstr(sCIAID)
         + '       And ODCID=' + quotedstr(sODCID);
      DMLOG.cdsQry10.Close;
      DMLOG.cdsQry10.DataRequest(xSQL);
      DMLOG.cdsQry10.Open;
      If DMLOG.cdsQry10.RecordCount = 0 Then
         dbeItem.Text := DMLOG.StrZero('1', 3)
      Else
         If length(DMLOG.cdsQry10.FieldByName('DODCID').AsString) = 0 Then
            dbeItem.Text := DMLOG.StrZero('1', 3)
         Else
//      dbeItem.Text := DMLOG.StrZero(DMLOG.MaxValue('DODCID', DMLOG.cdsDOrdComp), 3);
            dbeItem.Text := DMLOG.StrZero(DMLOG.cdsQry10.FieldByName('DODCID').AsString, 3);
   // Fin HPC_201701_LOG
      memDetalle.lines.Clear;
      dblcUMed.Clear;
      edtUMed.Clear;
      edtAdq.Clear;
      dbeCnt.text := '0.00';
      dbePUnit.text := '0.00';
      dbeDscto.text := '0.00';
      dbeImpInd.text := wIGV;
      dbeISC.text := '0.00';
      dbeValVen.text := '0.00';
      dbeImporte.text := '0.00';

      sODCID := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;
      sARTID := dbcldArti.Text;

      DMLOG.cdsDOrdComp.Insert;
   // Inicio HPC_201701_LOG
   // Determina Nro de Item en base a tabla LOG305 (Detalle de Orden de Compra)
      //DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString := DMLOG.StrZero(DMLOG.MaxValue('DODCID', DMLOG.cdsDOrdComp), 3);
      DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString := dbeItem.Text;
   // Fin HPC_201701_LOG
      DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString := sCIAID;
      DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString := SODCID;
      DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString := dblcTipoCompra.text;
      DMLOG.cdsDOrdComp.FieldByName('CCOMERID').asString := dblcFPago.Text;
      DMLOG.cdsDOrdComp.FieldbyName('CLAUXID').AsString := xProv;
      DMLOG.cdsDOrdComp.FieldByName('PROV').asString := dblcdProv.Text;
      DMLOG.cdsDOrdComp.FieldByName('ODCEST').AsString := DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString;
      DMLOG.cdsDOrdComp.FieldByName('DODCCATE').AsString := '0.00';
      DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsString := '0.00';
      DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsString := '0.00';
      DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsString := '0.00';
      DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString := wIGV;
      DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsString := '0.00';
      DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsString := '0.00';
      DMLOG.cdsDOrdComp.FieldByName('IMPUNI').AsString := '0.00';
      DMLOG.cdsDOrdComp.FieldByName('ODCANO').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCANO').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCMES').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCMM').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCDIA').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCDD').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCANOMES').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCANOMM').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCTRIM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCTRI').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCSEM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCSEM').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCSS').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCSS').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCAATRI').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAATRI').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCAASEM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAASEM').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCAASS').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAASS').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCUSER').AsString := DMLOG.wUsuario;

      If (dblcTipoCompra.text = 'S') Or
         (dblcTipoCompra.text = 'I') Then
      Begin
         dbcldArti.Enabled := False;
         dbcldArti.text := DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString;
         If dblcTipoCompra.text = 'I' Then
         Begin
            memDetalle.Lines.Text := DMLOG.cdsSerPend.FieldByname('DESCRIPCION').AsString;
            dbeCnt.Text := '1';
            dbePUnit.Text := DMLOG.cdsSerPend.FieldByname('NETO').AsString;
         End;
      End
      Else
      Begin
         dbcldArti.Enabled := True;
      End;

      DMLOG.cdsDOrdComp.Post;

      pnlDetalleA.BringToFront;
      pnlDetalleA.visible := true;
      If dblcTipoCompra.text = 'I' Then
      Begin
         dbeCntExit(dbePUnit);
         Z2bbtnRegOkClick(Self);
         dbeImporte.Text := FloatToStr(RoundD(DMLOG.Valores(dbeImporte.Text), 2));
         If DMLOG.Valores(dbeImporte.Text) <> DMLOG.Valores(edtImporte.Text) Then
         Begin
            Screen.Cursor := crDefault;
            ShowMessage('El importe es diferente al RECIBO DEL PROVEEDOR....');
            Exit;
         End;
      End;
      If dblcTipoCompra.text = 'C' Then
      Begin
         dbcldArti.Clear;
         dbcldArti.SetFocus;
      End;
   End;

(*
// Por Requisición Total
   If FOrdendeCompra.wTipoOC = 'xRequisicionTotal' Then
   Begin
      If FArtOCxReqsTot.showModal = mrCancel Then
      Begin
         Screen.Cursor := crDefault;
         exit;
      End;
      iEstado := 0;
      DMLOG.cdsRqsArtXTot.First;
      While Not DMLOG.cdsRqsArtXTot.Eof Do
      Begin
         DMLOG.cdsDOrdComp.Insert;
         DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString := DMLOG.StrZero(DMLOG.MaxValue('DODCID', DMLOG.cdsDOrdComp), 3);
         DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString := sCIAID;
         DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString := SODCID;
         DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString := DMLOG.cdsRqsArtXTot.fieldbyname('ARTID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString := Trim(DMLOG.cdsRqsArtXTot.fieldbyname('ARTDES').AsString);
         DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString := DMLOG.cdsRqsArtXTot.fieldbyname('TIPOADQ').AsString;
         DMLOG.cdsDOrdComp.FieldByName('CCOMERID').asString := dblcFPago.Text;
         DMLOG.cdsDOrdComp.FieldByName('PROV').asString := dblcdProv.Text;

         If DMLOG.cdsRqsArtXTot.fieldbyName('RQSFLAGUM').asString = 'G' Then
         Begin
            DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString := DMLOG.cdsRqsArtXTot.fieldbyName('RXACNTSG').asString;
            DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString := DMLOG.cdsRqsArtXTot.fieldbyName('UNMIDG').asString;
            DMLOG.cdsDOrdComp.FieldByName('DODCCSLD').AsString := DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString;
         End
         Else
         Begin
            DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString := DMLOG.cdsRqsArtXTot.fieldbyName('RXACNTSU').asString;
            DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString := DMLOG.cdsRqsArtXTot.fieldbyName('UNMIDU').asString;
            DMLOG.cdsDOrdComp.FieldByName('DODCCSLDU').AsString := DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString;
         End;

         DMLOG.cdsDOrdComp.FieldByName('ODCEST').AsString := DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString;

         DMLOG.cdsDOrdComp.FieldByName('DODCCATE').AsString := '0.00';

         DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsString := '0.00';
         DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsString := '0.00';
         DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsString := '0.00';
         DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString := wIGV;
         DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsString := '0.00';

         DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsString := '0.00';
         DMLOG.cdsDOrdComp.FieldByName('IMPUNI').AsString := '0.00';

         wSQL := 'CIAID=' + QuotedStr(sCIAID) + ' AND ARTID=' + QuotedStr(DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString);
         DMLOG.DisplayDescrip('prvSQL', 'TGE205', 'ARTID, TINID, GRARID, FAMID, SFAMID', wSQL, 'ARTID');

         DMLOG.cdsDOrdComp.FieldByName('TINID').AsString := DMLOG.cdsQry.FieldByName('TINID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('GRARID').AsString := DMLOG.cdsQry.FieldByName('GRARID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('FAMID').AsString := DMLOG.cdsQry.FieldByName('FAMID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('SFAMID').AsString := DMLOG.cdsQry.FieldByName('SFAMID').AsString;

         DMLOG.cdsDOrdComp.FieldByName('ODCANO').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCANO').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCMES').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCMM').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCDIA').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCDD').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCANOMES').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCANOMM').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCTRIM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCTRI').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCSEM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCSEM').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCSS').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCSS').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCAATRI').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAATRI').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCAASEM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAASEM').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCAASS').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAASS').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCUSER').AsString := DMLOG.wUsuario;
         DMLOG.cdsDOrdComp.Post;
   {.......................................................................................
   | Aqui debe copiar a la tabla de RELACION ENTRE LA ORDEN DE COMPRA Y LA REQUISION      |
   .......................................................................................}
         DMLOG.cdsDODCxDRQS.Insert;
         DMLOG.cdsDODCxDRQS.FieldByName('CIAID').AsString := sCIAID;
         DMLOG.cdsDODCxDRQS.FieldByName('ODCID').AsString := SODCID;
         DMLOG.cdsDODCxDRQS.FieldByName('DODCID').AsString := DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('RQSID').AsString := DMLOG.cdsRqsArtXTot.FieldByName('RQSID').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('DRQSID').AsString := DMLOG.cdsRqsArtXTot.FieldByName('DRQSID').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('ARTID').AsString := DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('DODCCNT').AsString := DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('TIPOADQ').AsString := DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString;
         DMLOG.cdsDODCxDRQS.FieldByName('DODCOBS').AsString := '.';
         DMLOG.cdsDODCxDRQS.FieldByName('FLAGUM').AsString := DMLOG.cdsRqsArtXTot.FieldByName('RQSFLAGUM').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('LOCID').AsString := DMLOG.cdsRqsArtXTot.FieldByName('LOCID').AsString;
         DMLOG.cdsDODCxDRQS.Post;

         xSQL := 'Insert into LOG324(CIAID, ODCID, DODCID, RQSID, DRQSID, ARTID, DODCCNT, '
            + '                      TIPOADQ, DODCOBS, FLAGUM, LOCID) '
            + '   values (' + quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('CIAID').AsString) + ','
            +                 quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('ODCID').AsString) + ','
            +                 quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('DODCID').AsString) + ','
            +                 quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('RQSID').AsString) + ','
            +                 quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('DRQSID').AsString) + ','
            +                 quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('ARTID').AsString) + ','
            +                 quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('DODCCNT').AsString) + ','
            +                 quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('TIPOADQ').AsString) + ','
            +                 quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('DODCOBS').AsString) + ','
            +                 quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('FLAGUM').AsString) + ','
            +                 quotedstr(DMLOG.cdsDODCxDRQS.FieldByName('LOCID').AsString) + ')';
         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            Screen.Cursor := crDefault;
            ShowMessage('Error al actualiza archivo de relación Detalle de O.Compra - con Detalle de Requisición (LOG324)');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
         DMLOG.cdsRqsArtXTot.Next;
      End;

      xSigueGrab := True;
   // Actualiza Detalle
      DMLOG.cdsDOrdComp.First;
      While Not DMLOG.cdsDOrdComp.Eof Do
      Begin
         ActualizaLOG305;
         If Not xSigueGrab Then
         Begin
            Screen.Cursor := crDefault;
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
         DMLOG.cdsDOrdComp.Next;
      End;
   // Actualiza Cabecera
      ActualizaLOG304;
      If Not xSigueGrab Then
      Begin
         Screen.Cursor := crDefault;
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;

      OnOffDetalle(True); // activar detalle
      pnlDetalleA.Visible := False;
      CalcTotal(Nil);

      dbePUnit.text := '0';
      dbeDscto.Text := '0';
      dbeImpInd.Text := '0';
      dbeISC.Text := '0';
      dbeImporte.Text := '0';
      dbeValVen.Text := '0';

      dbeCnt.Enabled := True;
      dbePUnit.Enabled := True;
      dbeDscto.Enabled := True;
      dbeImpInd.Enabled := True;
      dbeImporte.Enabled := True;
   End;
*)

(*
// xRequisicion - Por Servicio, Compras, Activo Fijo
   If FOrdendeCompra.wTipoOC = 'xRequisicion' Then
   Begin
      If FArtOCxReqs.showModal = mrCancel Then
      Begin
         Screen.Cursor := crDefault;
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;
      iEstado := 1; // Estaba en 0 se cambio ppor la joda de la rel. req - ocompra
      iEst := 0;

      edtAdq.Text := DMLOG.cdsArtPendX.fieldbyname('TIPOADQ').AsString;
      dbcldArti.Text := DMLOG.cdsArtPendX.fieldbyname('ARTID').AsString;
      memDetalle.Text := Trim(DMLOG.cdsArtPendX.fieldbyname('ARTDES').AsString);
      dbeItem.Text := DMLOG.StrZero(DMLOG.MaxValue('DODCID', DMLOG.cdsDOrdComp), 3);
      sODCID := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;
      sARTID := dbcldArti.Text;

      If DMLOG.cdsArtPendX.fieldbyname('TIPOADQ').AsString = 'C' Then
      Begin
         If DMLOG.cdsDOrdComp.State In [dsBrowse] Then
            bExiste := DMLOG.cdsDOrdComp.Locate('CIAID;ODCID;ARTID', VarArrayOf([sCIAID, sODCID, sARTID]), [])
         Else
            bExiste := False;
         If bExiste Then
         Begin
            Screen.Cursor := crDefault;
            ErrorMsg('Error', 'No pueden existir artículos duplicados' + #13 +
               'en un detalle de Orden de Compra....... ');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            Exit;
         End;
      End;

      DMLOG.cdsDOrdComp.Append;
      DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString := dbeItem.Text;
      DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString := sCIAID;
      DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString := dbeNReg.Text;
      DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString := dbcldArti.Text;
      DMLOG.cdsDOrdComp.FieldByName('CCOMERID').asString := dblcFPago.Text;
      DMLOG.cdsDOrdComp.FieldByName('PROV').asString := dblcdProv.Text;
      DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString := wIGV;

      If DMLOG.cdsArtPendX.fieldbyName('RQSFLAGUM').asString = 'G' Then
      Begin
         dbeCnt.text := DMLOG.cdsArtPendX.fieldbyName('RXASALDOG').asString;
         dblcUMed.value := DMLOG.cdsArtPendX.fieldbyName('UNMIDG').asString;
      End
      Else
      Begin
         dbeCnt.text := DMLOG.cdsArtPendX.fieldbyName('RXASALDOU').asString;
         dblcUMed.value := DMLOG.cdsArtPendX.fieldbyName('UNMIDU').asString;
      End;
      edtUMed.text := DMLOG.DisplayDescrip('prvSQL', 'TGE130', 'UNMDES', 'UNMID=' + quotedStr(dblcUMed.value), 'UNMDES');
{.......................................................................................
| Aqui debe copiar a la tabla de RELACION ENTRE LA ORDEN DE COMPRA Y LA REQUISION      |
.......................................................................................}
      DMLOG.cdsRqsArtX.First;
      While Not DMLOG.cdsRqsArtX.Eof Do
      Begin
         DMLOG.cdsDODCxDRQS.Insert;
         DMLOG.cdsDODCxDRQS.FieldByName('CIAID').AsString := sCIAID;
         DMLOG.cdsDODCxDRQS.FieldByName('ODCID').AsString := dbeNReg.Text;
         DMLOG.cdsDODCxDRQS.FieldByName('DODCID').AsString := dbeItem.Text;
         DMLOG.cdsDODCxDRQS.FieldByName('LOCID').AsString := DMLOG.cdsRqsArtX.FieldByName('LOCID').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('RQSID').AsString := DMLOG.cdsRqsArtX.FieldByName('RQSID').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('DRQSID').AsString := DMLOG.cdsRqsArtX.FieldByName('DRQSID').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('FLAGUM').AsString := DMLOG.cdsArtPendX.fieldbyName('RQSFLAGUM').asString;
         DMLOG.cdsDODCxDRQS.FieldByName('ARTID').AsString := dbcldArti.Text;
         DMLOG.cdsDODCxDRQS.FieldByName('TIPOADQ').AsString := edtAdq.Text;
         If DMLOG.cdsArtPendX.fieldbyName('RQSFLAGUM').asString = 'G' Then
            DMLOG.cdsDODCxDRQS.FieldByName('DODCCNT').AsString := DMLOG.cdsRqsArtX.FieldByName('DRQSSLDG').AsString
         Else
            DMLOG.cdsDODCxDRQS.FieldByName('DODCCNT').AsString := DMLOG.cdsRqsArtX.FieldByName('DRQSSLDU').AsString;

         DMLOG.cdsDOrdComp.FieldByName('DODCCSLD').AsString := DMLOG.cdsDODCxDRQS.FieldByName('DODCCNT').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCEST').AsString := DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString;
         DMLOG.cdsDOrdComp.FieldByName('DODCCATE').AsString := '0.00';
         DMLOG.cdsDODCxDRQS.FieldByName('DODCOBS').AsString := '.';

         wSQL := 'CIAID=' + QuotedStr(sCIAID) + ' AND ARTID=' + QuotedStr(DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString);
         DMLOG.DisplayDescrip('prvSQL', 'TGE205', 'ARTID, TINID, GRARID, FAMID, SFAMID', wSQL, 'ARTID');

         DMLOG.cdsDOrdComp.FieldByName('TINID').AsString := DMLOG.cdsQry.FieldByName('TINID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('GRARID').AsString := DMLOG.cdsQry.FieldByName('GRARID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('FAMID').AsString := DMLOG.cdsQry.FieldByName('FAMID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('SFAMID').AsString := DMLOG.cdsQry.FieldByName('SFAMID').AsString;

         DMLOG.cdsDOrdComp.FieldByName('ODCANO').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCANO').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCMES').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCMM').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCDIA').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCDD').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCANOMES').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCANOMM').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCTRIM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCTRI').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCSEM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCSEM').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCSS').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCSS').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCAATRI').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAATRI').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCAASEM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAASEM').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCAASS').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAASS').AsString;
         DMLOG.cdsDOrdComp.FieldByName('ODCUSER').AsString := DMLOG.wUsuario;

         DMLOG.cdsDODCxDRQS.Post;

         DMLOG.cdsRqsArtX.Next;
      End;
      dbePUnit.text := '0';
      dbeDscto.Text := '0';
      dbeImpInd.Text := wIGV;
      dbeISC.Text := '0';
      dbeImporte.Text := '0';
      dbeValVen.Text := '0';

      dbeCnt.Enabled := True;
      dbePUnit.Enabled := True;
      dbeDscto.Enabled := True;
      dbeImpInd.Enabled := True;
      dbeImporte.Enabled := True;

      pnlDetalleA.Enabled := true;

      pnlDetalleA.Visible := True;
      OnOffDetalle(False); // Desactivar el panel de detalle
      Z2btnDesc.Enabled := False;
      dbeDesc.Enabled := False;
      dbeCnt.SetFocus;
   End;
*)

(*
// Por Proforma
   If FOrdendeCompra.wTipoOC = 'xProforma' Then
   Begin
      iEstado := 0;
      dblcUMed.Clear;
      dbeCnt.Clear;
      edtUMed.Clear;
      dbeCnt.Clear;
      dbePUnit.Clear;
      dbeDscto.Clear;
      dbeImporte.Clear;
      dbeValVen.Clear;
      dbeItem.Text := DMLOG.StrZero(DMLOG.MaxValue('DODCID', DMLOG.cdsDOrdComp), 3);
      pnlDetalleA.Visible := True;
      OnOffDetalle(False); // Desactivar el panel de detalle
      Z2btnDesc.Enabled := False;
      dbeDesc.Enabled := False;
      btnDetalle;
   End;
*)

// Por Requerimiento de Usuario
   If FOrdendeCompra.wTipoOC = 'xRequerimiento' Then
   Begin
      fg_PorRequerimiento;
   End;

   xCant := dbeCnt.Text;
End;

Procedure TFRegOrdCD.Z2bbtnRegOkClick(Sender: TObject);
Var
   sCIAID, sODCID, sARTID, wUndID, wUndDE: String;
   bExiste: Boolean;
   xBook: TBookMark;
Begin
   dbgDReqs.Enabled := true;

   If Length(Trim(DMLOG.cdsOrdComp.fieldbyname('ODCVISADOR').AsString)) > 0 Then
   Begin
      OnOffDetalle(True); // activar detalle
      pnlDetalleA.Visible := False;
      Exit;
   End;
   If (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'ACEPTADO') Or
      (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'ATENDIDO') Or
      (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'PARCIAL') Or
      (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'ANULADO') Or
      (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'DEPURADO') Or
      (Length(Trim(DMLOG.cdsOrdComp.fieldbyname('ODCVISADOR').AsString)) > 0) Then
   Begin
      OnOffDetalle(True); // activar detalle
      pnlDetalleA.Visible := False;
      Exit;
   End;

   ValidaDet;
   sCIAID := DMLOG.cdsOrdComp.FieldByName('CIAID').AsString;
   sODCID := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;
   sARTID := dbcldArti.Text;
   DMLOG.cdsDOrdComp.DisableControls;
   xBook := DMLOG.cdsDOrdComp.GetBookmark;
   If iEstado = 0 Then
      bExiste := DMLOG.cdsDOrdComp.Locate('CIAID;ODCID;ARTID', VarArrayOf([sCIAID, sODCID, sARTID]), [])
   Else
      bExiste := False;
   If bExiste Then // localizar el valor....
   Begin
      DMLOG.cdsDOrdComp.GotoBookmark(xBook);
      DMLOG.cdsDOrdComp.EnableControls;
      ErrorMsg('Error', 'No pueden existir artículos duplicados' + #13 +
         'en un detalle de Registro de Orden de Compra ');
      Exit;
   End;
   DMLOG.cdsDOrdComp.EnableControls;
 { Si la Cantidad que trae a sido cambiada tendra que modificar la requisicion }
   If xCant <> dbeCnt.Text Then
   Begin
   End;
   wUndID := dblcUMed.value;
   wUndDE := edtUMed.text;

   DMLOG.cdsDOrdComp.Edit;

   Try
      DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString := sCIAID;
      DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString := SODCID;
      DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString := dbeItem.Text;
      DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString := dbcldArti.Text;

      wSQL := 'CIAID=' + QuotedStr(sCIAID) + ' AND ARTID=' + QuotedStr(dbcldArti.Text);
      DMLOG.DisplayDescrip('prvSQL', 'TGE205', 'ARTID, ARTDES, TINID, GRARID, FAMID, SFAMID', wSQL, 'ARTID');

      DMLOG.cdsDOrdComp.FieldByName('TINID').AsString := DMLOG.cdsQry.FieldByName('TINID').AsString;
      DMLOG.cdsDOrdComp.FieldByName('GRARID').AsString := DMLOG.cdsQry.FieldByName('GRARID').AsString;
      DMLOG.cdsDOrdComp.FieldByName('FAMID').AsString := DMLOG.cdsQry.FieldByName('FAMID').AsString;
      DMLOG.cdsDOrdComp.FieldByName('SFAMID').AsString := DMLOG.cdsQry.FieldByName('SFAMID').AsString;

      DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString := wUndID;
      DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString := dbeCnt.Text;
      DMLOG.cdsDOrdComp.FieldByName('DODCCSLD').AsString := dbeCnt.Text;
      DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsString := dbePUnit.Text;
      DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsString := dbeDscto.Text;
      DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsString := dbeValVen.Text;
      DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString := dbeImpInd.Text;
      DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsString := dbeImporte.Text;
      DMLOG.cdsDOrdComp.FieldByName('IMPUNI').AsString := '10';
      DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsString := dbeISC.Text;
      DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString := memDetalle.Text;
      DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString := edtAdq.Text;
      DMLOG.cdsDOrdComp.FieldByName('CCOMERID').asString := dblcFPago.Text;
      DMLOG.cdsDOrdComp.FieldByName('PROV').asString := dblcdProv.Text;
      If trim(dbecodprov.Text) <> '' Then
         DMLOG.cdsDOrdComp.FieldByName('ARTIDPROV').AsString := trim(dbeCodProv.Text)
      Else
         DMLOG.cdsDOrdComp.FieldByName('ARTIDPROV').Clear;

      If trim(dbeDescProv.Text) <> '' Then
         DMLOG.cdsDOrdComp.FieldByName('ARTDESPROV').AsString := trim(dbeDescProv.Text)
      Else
         DMLOG.cdsDOrdComp.FieldByName('ARTDESPROV').Clear;
      If trim(dblcUMEquiv.Text) <> '' Then
      Begin
         DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').AsString := trim(dblcUMEquiv.Text);
         DMLOG.cdsDOrdComp.FieldByName('PUNTEQUIV').AsString := trim(dbePUEquiv.Text);
         DMLOG.cdsDOrdComp.FieldByName('CNTEQUIV').AsString := trim(dbeCantEquiv.Text);
      End
      Else
      Begin
         DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').Clear;
         DMLOG.cdsDOrdComp.FieldByName('PUNTEQUIV').Clear;
         DMLOG.cdsDOrdComp.FieldByName('CNTEQUIV').Clear;
      End;

      DMLOG.cdsDOrdComp.Post;

   // Actualiza Detalle de O/C
      xSigueGrab := True;
      ActualizaLOG305;
      If Not xSigueGrab Then
         exit;
      OnOffDetalle(True); // activar detalle
      pnlDetalleA.Visible := False;

      CalcTotal(Nil);

   // Actualiza Cabecera
      xSigueGrab := True;
      ActualizaLOG304;
      If Not xSigueGrab Then
         exit;
   Except
      On E: Exception Do EHandlerError(E);
   End;
   Z2btnDesc.Enabled := True;
End;

Procedure TFRegOrdCD.Z2bbtnRegCancClick(Sender: TObject);
Begin
   dbgDReqs.Enabled := true;
   If iEstado = 0 Then // inserción
      DMLOG.cdsDOrdComp.Delete;
   pnlDetalleA.Visible := False;
   OnOffDetalle(True);
End;

Procedure TFRegOrdCD.OnOffCabecera(Value: Boolean);
Begin
   pnlCabecera.Enabled := Value;
   Z2bbtnBorrar.Enabled := Value;
   Z2bbtnOK.Enabled := Value;
End;

Procedure TFRegOrdCD.OnOffDetalle(Value: Boolean);
Begin
   If Value Then
      stxTitulo1.Color := clHighlight
   Else
      stxTitulo1.Color := clGray;

   pnlDetalleG.Enabled := Value;
   Z2bbtnCanc2.Enabled := Value;
   Z2bbtnGraba.Enabled := Value;
   Z2bbtnVisado.Enabled := Value;
   Z2bbtnAcepta.Enabled := Value;
   btnDetalle;
   If Length(Trim(DMLOG.cdsOrdComp.FieldbyName('OCCOLOCAC').AsString)) = 0 Then
   Begin
      If (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'ACEPTADO') Then
         If xValorX <> 'X' Then
            Z2bbtnColocac.Enabled := True
         Else
            Z2bbtnColocac.Enabled := False;
   End
   Else
      Z2bbtnColocac.Enabled := False;
End;

Procedure TFRegOrdCD.btnDetalle;
Var
   bDummy1, bDummy2: Boolean;
Begin
   If DMLOG.cdsDOrdComp.Active = False Then
   Begin
      DMLOG.cdsDOrdComp.Close;
      xSQL := 'Select CIAID, ODCID, ARTID, UNMID, DODCID, DODCCNTU, DODCCNT, DODCPUNU, '
         + '          DODCPUN, DODCDSCTO, DODCIMP, DODCIMPU, PROFID, ODCEST, DODCCATEU,  '
         + '          DODCCATE, DODCCSLDU, DODCCSLD, DODCISC, DODCISCU, ARTIDPROV, ARTDESPROV,  '
         + '          UNMIDEQUIV, PUNTEQUIV, CNTEQUIV, DODCFTUM, TIPOADQ, CCOMERID, ACFREG,  '
         + '          DODCOBS, IMPTOT, IMPUNI, ODCUSER, PROV, TINID, GRARID, FAMID, SFAMID,  '
         + '          ODCANO, ODCMES, ODCDIA, ODCTRIM, ODCSEM, ODCANOMES, ODCSS, ODCAATRI,  '
         + '          ODCAASEM, ODCAASS, ODCFREG, ODCMMSS, PROVRUC, CLAUXID '
         + '     from LOG305 '
         + '    Where CIAID=' + quotedstr(dblcCIA.text)
         + '      and ODCID=' + quotedstr(dbeNReg.Text);
      DMLOG.cdsDOrdComp.Datarequest(xSQL);
      DMLOG.cdsDOrdComp.Open;
   End;
   bDummy1 := (DMLOG.cdsDOrdComp.RecordCount > 0) And ((DMLOG.cdsOrdComp.ChangeCount > 0) Or (DMLOG.cdsDOrdComp.ChangeCount > 0));
   bDummy2 := (DMLOG.cdsDOrdComp.RecordCount > 0) And (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'VISADO');

   Z2bbtnGraba.Enabled := bDummy1;
   Z2bbtnCanc2.Enabled := bDummy1;
   Z2bbtnVisado.Enabled := bDummy1;
   Z2bbtnAcepta.Enabled := bDummy2;
End;

Procedure TFRegOrdCD.Z2bbtnSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFRegOrdCD.dbgDReqsKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Var
   sODC, sCIA, sART: String;
Begin
   If CbTipOrdCompra.Text = 'O.C. COTIZACION' Then
   Begin
      Exit;
   End;

   If (Key = $4D) And (ssCtrl In Shift) Then
   Begin
      dbgDReqsDblClick(Nil);
      btnDetalle;
   End;

   If (Key = VK_F5) Then
      With DMLOG Do
      Begin
         sODC := cdsOrdComp.FieldByName('ODCID').AsString;
         sCIA := cdsOrdComp.FieldByName('CIAID').AsString;
         sART := cdsDOrdComp.FieldByName('ARTID').AsString;
         xSQL := 'Select CIAID, LOCID, RQSID, DRQSID, ALMID, ARTID, DRQSCNSG, DRQSCNSU, '
            + '          DRQSCNAG, DRQSCNAU, UNMIDG, UNMIDU, RQSFREG, RQSEST, RQSFATE, '
            + '          TRQSID, ODCID, RQSMARK, PRIOID, SCCID, RQSFLAGUM, DRQSOBS, TIPOADQ, '
            + '          TIPPRESID, PARPRESID, RQSUSER, CCOSID, TINID, GRARID, FAMID, SFAMID, '
            + '          RQSANO, RQSMES, RQSDIA, RQSTRIM, RQSSEM, RQSANOMES, RQSSS, RQSAATRI, '
            + '          RQSAASEM, RQSAASS, RQSAASSS, TRQSTIPO, CANREQORI '
            + '     from LOG309 '
            + '    where ODCID='+quotedstr(sODC)
            + '      and CIAID='+quotedstr(sCIA)
            + '      and ARTID='+quotedstr(sART);
         cdsDReqs.Close;
         cdsDReqs.DataRequest(xSQL);
         cdsDReqs.Open;
         pnlRRA.Visible := True;
         pnlRRA.BringToFront;
         pnlCabecera.Enabled := False;
         OnOffDetalle(False);
         Z2bbtnGraba.Enabled := False;
         Z2bbtnCanc2.Enabled := False;
         Z2bbtnAnula.Enabled := False;
         Z2bbtnAcepta.Enabled := False;
         Z2dbgDReqsIButton.Enabled := False;
         Z2bbtnRegresa.Enabled := False;
      End;

   If (Key = VK_DELETE) And (ssCtrl In Shift) Then //^Del
   Begin
      If trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'INICIAL' Then
      Begin
         If MessageDlg('Se Eliminará el item del Detalle de la O.C.' + #13
            + '¿Desea Continuar?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
         Begin
            DMLOG.cdsDODCxDRQS.First;
            While Not DMLOG.cdsDODCxDRQS.Eof Do
               DMLOG.cdsDODCxDRQS.Delete;
(*
            xSQL := 'Delete from LOG305 '
               + '    where CIAID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString)
               + '      and ODCID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString)
               + '      and DODCID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString);
*)
            xSQL := 'CALL SP_LOG_DEL_OCOMPRA_DET_ITEM('
                  +quotedstr(DMLOG.cdsDOrdComp.FieldbyName('CIAID').AsString)+','
                  +quotedstr(DMLOG.cdsDOrdComp.FieldbyName('ODCID').AsString)+','
                  +quotedstr(DMLOG.cdsDOrdComp.FieldbyName('DODCID').AsString)
                  +')' ;
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al borrar Detalle de la Orden de Compra ');
               exit;
            End;
            DMLOG.cdsDOrdComp.Delete;
            CalcTotal(Nil);
         End;
      End
      Else
         ErrorMsg('Error', 'Situación de la Orden de Compra no permite borrar, no es INICIAL');
      btnDetalle;
      Z2bbtnGraba.Enabled := True;
   End;
End;

Procedure TFRegOrdCD.dbgDReqsDblClick(Sender: TObject);
Var
   xWhere: String;
Begin
   If CbTipOrdCompra.Text = 'O.C. COTIZACION' Then
   Begin
      Exit;
   End;

   If DMLOG.cdsDOrdComp.RecordCount = 0 Then
   Begin
      Information('Módulo de Compras', ' No Existen Registros a Editar ');
      Exit;
   End;

   If (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'ACEPTADO') Or
      (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'ATENDIDO') Then
   Begin
      Information('Módulo de Compras', 'Esta Orden de Compra está Aceptada' + #13 + 'No se puede Modificar');
      Exit;
   End
   Else
   Begin
      If Length(Trim(DMLOG.cdsOrdComp.fieldbyname('ODCVISADOR').AsString)) > 0 Then
      Begin
         Information('Módulo de Compras', 'Esta Orden de Compra ya ha sido Visada ' + #13 + 'No se puede Modificar');
         Exit;
      End;
   End;

   Try
      Screen.Cursor := crHourGlass;
      OnOffDetalle(False); // Desactivar el panel de detalle
      dbeItem.Text := DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString;
      dbcldArti.Text := DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString;
      xWhere := 'CIAID=' + QuotedStr(DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString)
         + ' AND ARTID = ' + QuotedStr(DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString);
      If DMLOG.RecuperarDatos('TGE205', '*', xWhere) Then
      Begin
         If DMLOG.cdsQry.FieldByName('ARTISC').AsString = 'S' Then
            dbeISC.Enabled := True
         Else
            dbeISC.Enabled := False;
      End;
      dblcUMed.Text := DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString;
      dbeCnt.Text := Format('%0.3f', [DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsFloat]);
      dbePUnit.Text := Format('%0.5f', [DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsFloat]);
      dbeValVen.Text := Format('%0.5f', [DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat]);
      dbeDscto.Text := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsFloat]);
      dbeImporte.Text := Format('%0.5f', [DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat + (DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat * DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsFloat / 100)]);
      dbeImpInd.Text := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsCurrency]);
      dbeISC.Text := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsCurrency]);
      edtAdq.Text := DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').AsString;
      memDetalle.Text := DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString;

      dbeCodProv.Text := trim(DMLOG.cdsDOrdComp.FieldByName('ARTIDPROV').AsString);
      dbeDescProv.Text := trim(DMLOG.cdsDOrdComp.FieldByName('ARTDESPROV').AsString);
      dblcUMEquiv.Text := trim(DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').AsString);
      dbePUEquiv.Text := trim(DMLOG.cdsDOrdComp.FieldByName('PUNTEQUIV').AsString);
      dbeCantEquiv.Text := trim(DMLOG.cdsDOrdComp.FieldByName('CNTEQUIV').AsString);
      edtUltCompra.text := FloatToStrF(DMLOG.cdsQry.FieldByName('ARTPCG').AsFloat, ffNumber, 15, 5);
      If trim(dblcUMEquiv.Text) <> '' Then
      Begin
         If cds1.locate('UNMID', Vararrayof([dblcUMEquiv.Text]), []) Then
            dbeUMEquiv.Text := cds1.fieldbyname('UNMDES').AsString
         Else
            dbeUMEquiv.Text := '';
      End
      Else
         dbeUMEquiv.Text := '';
    //Datos del Panel de Detalle
      dblcUMed.onExit(sender);
      dbeCnt.Enabled := true;
      If DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString = '999' Then
         dbePUnit.Enabled := false
      Else
         dbePUnit.Enabled := true;
      pnlDetalleA.Visible := True; // Activar el panel de Mantenimiento
      pnlDetallea.BringToFront;
      memDetalle.SetFocus;
      iEstado := 1;
      dbgDReqs.Enabled := false;
      btnDetalle;
      xCant := dbeCnt.Text;
   Finally
      dbgDReqs.Enabled := False;
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFRegOrdCD.dbmObsKeyPress(Sender: TObject; Var Key: Char);
Var
   sC: String;
Begin
   sC := Key;
   sC := Uppercase(sC);
   Key := sC[1];
End;

Procedure TFRegOrdCD.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMLOG.cdsQry10.CLose;
// Inicio HPC_201804_LOG
// se adiciona un condicional debido a que no se debe ejecutar una doble eliminación
// con el botón X
   If (length(dblcCIA.Text) > 0) and (length(dbeNReg.Text) >0) Then
   Begin
     If length(DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString) = 0 Then
     Begin
        If MessageDlg('Se Eliminará la Orden de Compra' + #13
           + '¿Desea Continuar con la Eliminación?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
        Begin
        (*
           xSQL := 'Delete from LOG304 '
              + '    where CIAID=' + quotedstr(dblcCIA.Text)
              + '      and ODCID=' + quotedstr(dbeNReg.Text);
        *)
           xSQL := 'CALL SP_LOG_DEL_OCOMPRA_CAB('
          +quotedstr(dblcCIA.Text)+','
          +quotedstr(dbeNReg.Text)
          +')' ;
           Try
              DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
           Except
              Screen.Cursor := crDefault;
              ShowMessage('Error al intentar borrar la cabecera Temporal');
              exit;
           End;
        End;
     End;
   End;
// Fin HPC_201804_LOG
   DMLOG.cdsOrdComp.CancelUpdates;
   DMLOG.cdsDOrdComp.CancelUpdates;

   DMLOG.cdsDOrdComp.BeforePost := Nil;
   dblcTMoneda.OnNotInList := Nil;
   dblcFPago.OnNotInList := Nil;

   xValorX := '';

   If DMLOG.cdsOrdComp.State In [dsEdit, dsInsert] Then DMLOG.cdsOrdComp.Cancel;
   If DMLOG.cdsDOrdComp.State In [dsEdit, dsInsert] Then DMLOG.cdsDOrdComp.Cancel;
   If DMLOG.cdsDODCxDRQS.State In [dsEdit, dsInsert] Then DMLOG.cdsDODCxDRQS.Cancel;

   If DMLOG.cdsOrdComp.ChangeCount > 0 Then DMLOG.cdsOrdComp.CancelUpdates;
   If DMLOG.cdsDOrdComp.ChangeCount > 0 Then DMLOG.cdsDOrdComp.CancelUpdates;
   If DMLOG.cdsDODCxDRQS.ChangeCount > 0 Then DMLOG.cdsDODCxDRQS.CancelUpdates;

   DMLOG.cdsArti.Filter := '';
   DMLOG.cdsArti.Filtered := False;

   FOrdendeCompra.wTipoOC := '';
   DMLOG.wModo := '';
// Inicio HPC_201804_LOG
// Refresca el filtro principal de busqueda
   Mtx3100.RefreshFilter;
// Fin HPC_201804_LOG
   Action := CAFree;
End;

Function TFRegOrdCD.EHandlerError(Ex: Exception): Boolean;
Var
   a, b: Integer;
   s1, s2: String;
Begin
   Result := true;
   If Ex.Message = 'Key violation.' Then
   Begin
      Information('Error', 'No pueden existir registros duplicados.. ');
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
         Information('Error', 'El campo ' + s2 + ' es obligatorio...  ');
      End
      Else
         Result := false;
   End;
End;

Procedure TFRegOrdCD.dblcNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRegOrdCD.dbeDsctoExit(Sender: TObject);
Var
   xTmp: String;
   xNumero: Double;
Begin
   If trim(TCustomEdit(Sender).Text) <> strTMP Then
   Begin
      Try
         xnumero := StrToFloat(TCustomEdit(Sender).Text);
         If xnumero < 0 Then
         Begin
            xTmp := strTMP;
            Showmessage('Ingrese Dato Mayor que cero');
            strTMP := xTmp;
            TCustomEdit(Sender).SetFocus;
         End
         Else
         Begin
        //Aqui va el codigo delos calculos
            TCustomEdit(Sender).Text := DMLOG.LogDec(TCustomEdit(Sender).Text, 5);
            ImporteDetalle;
         End;
      Except
         If (TCustomEdit(Sender).Text = '') Or (TCustomEdit(Sender).Text = '.') Then
         Begin
            TCustomEdit(Sender).Text := DMLOG.LogDec('', 5);
        //Aqui Tambien va el codigo de los calculos
            ImporteDetalle;
            Exit;
         End
         Else
            xTmp := strTMP;
         Showmessage('Ingrese Número');
         strTMP := xTmp;
         TCustomEdit(Sender).SetFocus;
      End;
   End
   Else
      If strTmp = '' Then
      Begin
         TCustomEdit(Sender).Text := DMLOG.LogDec(TCustomEdit(Sender).Text, 5);

      End;
End;

{+.............................................................................+
 |   Calulo de los totales de la orden de compra                               |
 +.............................................................................+}

Procedure TFRegOrdCD.CalcTotal(Sender: TObject);
Var
   rTC, rTot, rTD, rTi, rTf, rTp, rI, rX, rTTi, rIsc, rTisc, rTTisc: Double;
   bTotal: Boolean;
Begin
   rTC := 0; // Total Compra
   rTot := 0; //
   rTD := 0; // Total Descuento
   rI := 0; // Impuesto General a las Ventas
   rIsc := 0; // Impuesto Selectivo Al Consumo
   bTotal := False;
   rTTisc := 0;
   rTisc := 0;

   DMLOG.cdsDOrdComp.First;
   While Not DMLOG.cdsDOrdComp.Eof Do
   Begin
      If bTotal Then // Total Importe Articulo
      Begin
         rTC := DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat + rTC
      End
      Else
      Begin
         rTC := (DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat + rTC);
         rI := (DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat * (DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsFloat / 100)) + rI;
         rIsc := (DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat * (DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsFloat / 100)) + rIsc;
      End;
      rTp := (DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsFloat * DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsFloat);
      rTD := rTD + (rTp * (DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsFloat / 100));
      DMLOG.cdsDOrdComp.Next;
   End;
   rTot := rTot + (rTC);
   If bTotal Then
      rTi := DMLOG.cdsOrdComp.FieldByName('ODCIXTI').AsFloat
   Else
   Begin
      rTi := rI;
      rTisc := rIsc;
   End;
   rTf := 0;
   DMLOG.cdsOrdComp.Edit;
   DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsString := floatToStr(RoundD(rTC, 5));
   DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsString := floatToStr(RoundD(rTi, 5));
   DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsString := floatToStr(RoundD(rTD, 5));
   If bTotal Then
   Begin
      rTot := rTot + rTf;
      rTTi := (rTot * rTi / 100);
      rX := rTot + rTTi;
   End
   Else
   Begin
      rTTi := rTi;
      rTTisc := rTisc;
      rX := rTot + rTi + rTf + rTisc;
   End;

   DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsString := floatToStr(RoundD(rTTi, 5));
   DMLOG.cdsOrdComp.FieldByName('ODCTOTALISC').AsString := floatToStr(RoundD(rTTisc, 5));
   If dblcTipoCompra.Text <> 'I' Then
      DMLOG.cdsOrdComp.FieldByName('ODCTOTALG').AsString := floatToStr(RoundD(rX, 5))
   Else
      DMLOG.cdsOrdComp.FieldByName('ODCTOTALG').AsString := floatToStr(RoundD(rX, 2));
   DMLOG.cdsOrdComp.post;
End;

Procedure TFRegOrdCD.dbrgTImpueChange(Sender: TObject);
Begin
   If DMLOG.cdsOrdComp.State In [dsEdit, dsInsert] Then
      If dbrgTImpue.ItemIndex = 0 Then
      Begin
         dbeImpuesto.Text := '0';
         dbeImpuesto.Enabled := False;
      End
      Else
      Begin
         dbeImpuesto.Text := '';
         dbeImpuesto.Enabled := Enabled;
      End
End;

Procedure TFRegOrdCD.dblcdExits(Sender: TObject);
Begin

   If sender = dblcCIA Then
   Begin
      If Z2bbtnSalir.Focused Then exit;

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

      xSQL := 'Select CIAID, CCOMERID, CCOMERDES, CCOMERABR, CREDITO, '
         + '          CCOMERCTDO, PESOEVALLOG '
         + '     from CXC101 '
         + '    where CIAID=' + quotedStr(dblcCIA.text)
         + '    order by CCOMERID';
      DMLOG.cdsFPago.close;
      DMLOG.cdsFPago.datarequest(xSQL);
      DMLOG.cdsFPago.open;

      If DMLOG.wModo = 'M' Then
         Exit;


      dblcTipoAuxiliar.Text := 'P';
      DMLOG.cdsOrdComp.fieldbyName('CLAUXID').asString := 'P';
      dblcTipoAuxiliarExit(dblcTipoAuxiliar);

   // Inicio HPC_201701_LOG
   // 06/07/2017 graba directamente la Orden de Compra
      sNumORD := DMLOG.MaxORDAnio(dblccia.Text, Copy(dbdtpFReg.Text, 7, 4));
// Inicio HPC_201804_LOG
// Se cambia los codigos Insert LOG304 a Procedimiento almacenado
(*    xSQL := 'Insert into LOG304(CIAID, ODCID) '
         + '   Values(' + quotedstr(dblccia.Text) + ','
         + quotedstr(sNumORD) + ')';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al intenter añadir la nueva Orden de Compra, reintente');
         dblccia.SetFocus;
         exit;
      End;
*)
      try
          xSQL := 'CALL SP_LOG_ING_OCOMPRA_CAB('
          +quotedstr(dblccia.Text)+','
          +quotedstr(sNumORD)+','
          +quotedstr(DMLOG.wUsuario)
          +')' ;
          DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
            Screen.Cursor := crDefault;
            ShowMessage('Error al intenter añadir la nueva Orden de Compra, reintente');
            dblccia.SetFocus;
            exit;
      Raise;
      End;
// Fin HPC_201804_LOG
      DMLOG.wModo := 'M';
   // Fin HPC_201701_LOG

      DMLOG.cdsOrdComp.fieldbyName('ODCID').asString := sNumOrd;

      If dblcCIA.Text = '04' Then
         dedNProforma.Enabled := True;

      exit;
   End;

   If sender = dblcdProv Then
   Begin
      edtProv.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE201', 'PROVDES', 'PROV=' + quotedStr(dblcdProv.text) + 'AND CLAUXID = ' + QuotedStr(xsTipoAuxiliar), 'PROVDES');
      exit;
   End;

   If sender = dblcTMoneda Then
   Begin
      edtTMoneda.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE103', 'TMONDES', 'TMONID=' + quotedStr(dblcTMoneda.text), 'TMONDES');
//      If (DMLOG.wModo = 'A') Or (FOrdendeCompra.wTipoOC = 'xRequisicion') Or (FOrdendeCompra.wTipoOC = 'xRequisicionTotal') Then
      If Length(Trim(DMLOG.cdsOrdComp.fieldbyName('ODCTCAMB').asString)) = 0 Then
         DMLOG.cdsOrdComp.fieldbyName('ODCTCAMB').asString := DMLOG.CalcTipoCambio(dblcTMoneda.text, dbdtpFEmi.DateTime, DMLOG.wTipoCambio);
      exit;
   End;
   If sender = dbdtpFEmi Then
   Begin
      If dbdtpFEmi.Date = 0 Then
      Begin
         Showmessage('Ingrese fecha de Emisión');
         dbdtpFEmi.SetFocus;
      End
      Else
      Begin
         If Length(trim(DMLOG.cdsOrdComp.fieldbyName('ODCTCAMB').asString)) = 0 Then
            DMLOG.cdsOrdComp.fieldbyName('ODCTCAMB').asString := DMLOG.CalcTipoCambio(dblcTMoneda.text, dbdtpFEmi.DateTime, DMLOG.wTipoCambio);
      End;
      exit;
   End;
   If sender = dblcFPago Then
   Begin
      edtFPago.Text := DMLOG.DisplayDescrip('prvSQL', 'CXC101', 'CCOMERDES', 'CIAID='+quotedstr(dblcCIA.text) + ' AND CCOMERID=' + quotedStr(dblcFPago.Text), 'CCOMERDES');
      exit;
   End;
   If sender = dblcLEntrega Then
   Begin
      edtLEntrega.text := DMLOG.DisplayDescrip('prvSQL', 'TGE136', 'LGECDES', 'LGECID=' + quotedStr(dblcLEntrega.text), 'LGECDES');
      exit;
   End;

   If sender = dblcTipoCompra Then
   Begin
      If DMLOG.wModo = 'A' Then
      Begin
         dblcLOC.Text := '';
         dbServicio.Text := '';
         edtImporte.Text := '';
         edtServicio.Text := '';
      End;
      If dblcTipoCompra.Text = '' Then
      Begin
         Information('Módulo de Compras', 'Tiene que seleccionar un tipo de Solicitud');
         Exit;
      End;
      edtTipoCompra.text := DMLOG.DisplayDescrip('prvSQL', 'TGE173', 'TIPADQDES', 'TIPOADQ=' + quotedStr(dblcTipoCompra.text), 'TIPADQDES');
      dbmObs.Width := 736;
      If dblcTipoCompra.Text = 'I' Then
      Begin
      //Tabla de Locales
         xSQL := 'Select A.*,B.PROVDES PROPIETARIO From ACF120 A, TGE201 B WHERE A.CODPRO=B.PROV(+)';
         DMLOG.cdsLOC.Close;
         DMLOG.cdsLOC.DataRequest(xSQL);
         DMLOG.cdsLOC.Open;
         If DMLOG.wModo = 'A' Then gbPagoServ.Enabled := True;
         gbPagoServ.Visible := True;
         dbmObs.Width := 488;
      End
      Else
         gbPagoServ.Visible := False;

      exit;
   End;

End;

Procedure TFRegOrdCD.Z2btnDescClick(Sender: TObject);
Begin
  // cambiar el total de descuento
   If DMLOG.cdsDOrdComp.RecordCount > 0 Then
      If Not (dbeDesc.DataSource.Dataset.State In [dsEdit, dsInsert]) Then
      Begin
         dbeDesc.Enabled := true;
         dbeDesc.DataSource.Dataset.Edit;
         btnDetalle;
      End;
End;

Procedure TFRegOrdCD.dbeDescExit(Sender: TObject);
Var
   rTD, rTC, rTf, rTo, rTi: Extended;
Begin
   If dbeDesc.DataSource.Dataset.State In [dsEdit, dsInsert] Then
   Begin
      rTC := DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat;
      rTD := DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat;
      rTf := 0;
      rTi := DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat;
      rTo := (rTC - rTD) + rTf + rTi;

      DMLOG.cdsOrdComp.FieldByName('ODCTOTALG').AsString := floatToStr(RoundD(rTo, 5));
      DMLOG.cdsOrdComp.post;

      btnDetalle;
      dbeDesc.Enabled := False;
   End;
End;

Procedure TFRegOrdCD.cdsDOrdCompBeforePost(DataSet: TDataSet);
Begin
End;

Procedure TFRegOrdCD.BitBtn1Click(Sender: TObject);
Begin
   pnlRRA.Visible := False;
   pnlCabecera.Enabled := True;
   OnOffDetalle(True);
   Z2bbtnRegresa.Enabled := True;
End;

Procedure TFRegOrdCD.Z2bbtnPrintClick(Sender: TObject);
Var
   EstImp: String;
Begin
   Screen.Cursor := crHourGlass;
   EstImp := DMLOG.DisplayDescrip('prvTGE', 'LOG106', 'FLAG', 'ESTDES='+quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString), 'FLAG');
   xVan := 0;
   ppReportOC;
   ppDBCab.DataSource := DMLOG.dsQry;
   ppdbOC.DataSource := DMLOG.dsSQL;
   Screen.Cursor := crDefault;

   DMLOG.cdscia.Locate('CIAID', VarArrayOf([dblcCIA.Text]), []);

   fg_RecuperaSubReporte;
   If DMLOG.cdscia.FieldByName('CIASUGOC').AsString = 'S' Then
   Begin

      If dblcCIA.text = '04' Then
         pprOCPE.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\OrdComp_04.rtm'
      Else
         pprOCPE.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\OrdComp.rtm';

      pprOCPE.Template.LoadFromFile;
      Try
         ppLabel20.Caption := UpperCase(edtTipoCompra.Text);
         If EstImp = 'IE' Then
            ppDBText10.Visible := True;

         If dblcCIA.text = '02' Then
            pplCia.Caption := 'Servicios Generales';
         If (dblcCIA.text <> '02') Then
            pplCia.Caption := edtCIA.Text;

      Except
      End;

      Try
         pplReq.Caption := 'REQUISICION';

         If dblcCIA.text = '04' Then
         Begin
            pplReq.Caption := 'REQUERIMIENTO';
         End;
      Except
      End;

      Diseno.Report := pprOCPE;

      If cbDisenoRep.Checked Then
         Diseno.ShowModal
      Else
      Begin
         pprOCPE.Print;
         pprOCPE.Stop;
      End;
   End
   Else
   Begin
      pprOCP.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\OrdCompCia.rtm';
      pprOCP.Template.LoadFromFile;
      pprOCP.Print;
      pprOCP.Stop;
   End;
   ppDBCab.DataSource := Nil;
   ppdbOC.DataSource := Nil;
End;

Procedure TFRegOrdCD.ppReportOC;
Var
   xProv, sCIA, sOC: String;
Begin
   xProv := DMLOG.cdsOrdComp.FieldByName('CLAUXID').AsString;

   sOC := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;
   sCIA := DMLOG.cdsOrdComp.FieldByName('CIAID').AsString;
   xSQL := 'Select TGE101.CIADES, TGE101.CIARUC, TGE101.CIATLF, TGE101.CIAFAX, TGE101.CIADIRE, '
      + '          TGE201.PROV, TGE201.PROVDES, TGE201.PROVDIR, TGE201.PROVTELF, TGE201.PROVREPR,'
      + '          TGE201.PROVRUC, TGE201.PROVFAX, LOG304.ODCFATE,LOG304.ODCOBS,TGE136.LGECDES,'
      + '          TGE136.LGECABR,TGE103.TMONABR,CXC101.CCOMERDES, LOG304.ODCID, LOG304.ODCFEMI,'
      + '          LOG304.ODCIXTCC, LOG304.ODCTCAMB, LOG304.ODCEST, LOG304.ODCTTIMPU, '
      + '          LOG304.ODCTOTALISC, LOG304.ODCTOTALG,TGE006.USERNOM USUARIO,A.USERNOM VISADO,'
      + '          LOG304.ODCUSER, LOG304.PROFID, LOG304.NUMREQUSU, LOG304.FECPAG, LOG304.DOCREF '
      + '     from LOG304, TGE101, TGE201, TGE136, TGE103, CXC101, TGE006, TGE006 A '
      + '    where LOG304.CIAID = '+quotedstr(sCIA)
      + '      and LOG304.ODCID = '+quotedstr(sOC)
      + '      and LOG304.CIAID = TGE101.CIAID(+) '
      + '      and LOG304.PROV  = TGE201.PROV(+) '
      + '      and LOG304.CLAUXID = TGE201.CLAUXID(+) '
      + '      and LOG304.LGECID = TGE136.LGECID(+) '
      + '      and LOG304.TMONID = TGE103.TMONID(+) '
      + '      and LOG304.CCOMERID = CXC101.CCOMERID(+) '
      + '      and LOG304.CIAID = CXC101.CIAID(+) '
      + '      and LOG304.ODCUSER  = TGE006.USERID(+) '
      + '      and LOG304.ODCVISADOR = A.USERID(+) ';
   DMLOG.cdsQry.DisableControls;
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.ProviderName := 'prvLOG';
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   DMLOG.cdsQry.EnableControls;

   xSQL := 'Select DECODE(ARTIDPROV, NULL, LOG305.ARTID, ARTIDPROV) ARTID, '
      + '          DODCOBS ARTDES, UM1.UNMABR, '
      + '          DECODE(UNMIDEQUIV, NULL, DODCCNT, CNTEQUIV) AS DODCCNT, '
      + '          DECODE(UNMIDEQUIV, NULL, DODCPUN, PUNTEQUIV) AS DODCPUN, '
      + '          DECODE(UNMIDEQUIV, NULL, DODCCNT * DODCPUN - ( DODCCNT * DODCPUN )*NVL( DODCDSCTO ,0 ) /100, '
      + '          CNTEQUIV * PUNTEQUIV - ( CNTEQUIV * PUNTEQUIV )*NVL( DODCDSCTO ,0 ) /100) '
      + '          DODCIMP, DODCDSCTO, DODCCSLD, DODCCSLDU, DODCCATE, DODCCATEU '
      + '     from LOG305, TGE130 UM2, TGE130 UM1, TGE205 '
      + '    where LOG305.CIAID = '+quotedstr(sCIA)
      + '      and LOG305.ODCID = '+quotedstr(sOC)
      + '      and LOG305.UNMIDEQUIV = UM2.UNMID(+) '
      + '      and LOG305.UNMID = UM1.UNMID(+) '
      + '      and TGE205.ARTID(+) = LOG305.ARTID '
      + '      and TGE205.CIAID(+) = LOG305.CIAID '
      + '      and TGE205.TINID(+) = LOG305.TINID';
   DMLOG.cdsSQL.DisableControls;
   DMLOG.cdsSQL.Close;
   DMLOG.cdsSQL.DataRequest(xSQL);
   DMLOG.cdsSQL.Open;
   DMLOG.cdsSQL.EnableControls;
End;

Procedure TFRegOrdCD.dblcdProvEnter(Sender: TObject);
Begin
   strTMP := trim(TCustomEdit(Sender).Text);
End;

Procedure TFRegOrdCD.dblcdProvExit(Sender: TObject);
Var
   xTmp: String;
   xsMensaje: String;
Begin
   If xCrea Then Exit;
   xSQL := ' CLAUXID = ' + QuotedStr(dblcTipoAuxiliar.Text) + ' AND PROV = ' + QuotedStr(dblcdProv.text);
   DMLOG.cdsOrdComp.fieldbyName('PROVDES').AsString := DMLOG.DisplayDescrip('prvSQL', 'TGE201', 'PROVDES', xSQL, 'PROVDES');
   If DMLOG.cdsOrdComp.fieldbyName('PROVDES').AsString = '' Then
   Begin
      ShowMessage('Proveedor no Existe');
      DMLOG.cdsOrdComp.fieldbyName('CLAUXID').AsString := '';
      DMLOG.cdsOrdComp.fieldbyName('PROV').AsString := '';
      dblcTipoAuxiliar.SetFocus;
      Exit;
   End;

   xsTipoAuxiliar := DMLOG.cdsOrdComp.fieldbyName('CLAUXID').AsString;
   If DMLOG.fg_ValidaDatosProveedor(DMLOG.cdsOrdComp.fieldbyName('CLAUXID').AsString, DMLOG.cdsOrdComp.FieldByName('PROV').AsString, xsMensaje) = False Then
   Begin
      ShowMessage(xsMensaje);
      dblcdProv.SetFocus;
      Exit;
   End;
   If xsMensaje <> '' Then
   Begin
      If MessageDlg(xsMensaje + #13 + #13 + 'Está seguro de Continuar?', mtConfirmation, [mbOK, mbCancel], 0) <> mrok Then
      Begin
         dblcdProv.SetFocus;
         Exit;
      End;
   End;
End;

Procedure TFRegOrdCD.Z2bbtnBorrarClick(Sender: TObject);
Begin
   If FRegOrdCD = Nil Then
      Exit;
   DMLOG.cdsOrdComp.CancelUpdates;
   DMLOG.cdsDOrdComp.CancelUpdates;
   DMLOG.cdsOrdComp.edit;
End;

Procedure TFRegOrdCD.ValidaCab;
Begin
   If dblcTipoCompra.Text = 'I' Then
   Begin
      If dblcdProv.Text <> DMLOG.cdsSerPend.FieldByName('CODPROV').AsString Then
      Begin
         dblcdProv.SetFocus;
         Raise Exception.create('El Proveedor asignado a la OC es diferente a la del Recibo del Servicio[' + DMLOG.cdsSerPend.FieldByName('CODPROV').AsString + '], Corriga.');
      End;
   End;

   If trim(dblcCIA.Text) = '' Then
   Begin
      dblcCIA.SetFocus;
      Raise Exception.create(' Ingrese Compañia ');
   End;

   If trim(dbeNReg.Text) = '' Then
   Begin
      dbeNReg.SetFocus;
      Raise Exception.create(' Ingrese Nº O. Compra ');
   End;
   If Trim(dblcTipoAuxiliar.Text) = '' Then
   Begin
      dblcTipoAuxiliar.SetFocus;
      Raise Exception.create(' Ingrese el Tipo de Auxiliar del Proveedor ');
   End;
   If trim(dblcdProv.Text) = '' Then
   Begin
      dblcdProv.SetFocus;
      Raise Exception.create('Ingrese Proveedor');
   End;
   If dbdtpfemi.Date = 0 Then
   Begin
      dbdtpfemi.SetFocus;
      Raise Exception.create('Ingrese Fecha de Emisión');
   End;
   If trim(dblcTMoneda.Text) = '' Then
   Begin
      dblcTMoneda.SetFocus;
      Raise Exception.create('Ingrese Moneda');
   End;
   If trim(dbeTCambio.Text) = '' Then
   Begin
      dbeTCambio.SetFocus;
      Raise Exception.create('Ingrese Tipo de Cambio');
   End;
   If trim(dblcFPago.Text) = '' Then
   Begin
      dblcFPago.SetFocus;
      Raise Exception.create('Ingrese Condición Comercial');
   End;
   If trim(dblcTipoCompra.Text) = '' Then
   Begin
      dblcTipoCompra.SetFocus;
      Raise Exception.create(' Ingrese Tipo de Compra ');
   End;
End;

Procedure TFRegOrdCD.ValidaTot;
Begin
   If (DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').AsCurrency = 0) Or
      (DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').IsNull) Then
      Raise Exception.create('Ingrese Importes');
End;

Procedure TFRegOrdCD.ValidaDet;
Begin
   If Length(trim(dbePUnit.Text)) = 0 Then
   Begin
      dbePUnit.text := '0';
      dbePUnit.SetFocus;
      Raise Exception.Create('El Campo Precio Unitario no puede estar en Blanco');
   End;
   If strtofloat(dbePUnit.Text) = 0 Then
   Begin
      dbePUnit.SetFocus;
      Raise Exception.Create(' El Campo Precio Unitario debe ser Mayor a Cero ');
   End;
   If (strtocurr(dbeCnt.Text) = 0) Then
   Begin
      dbeCnt.SetFocus;
      Raise Exception.Create('Ingrese Cantidad');
   End;
   If (strtocurr(dbePUnit.Text) = 0) Then
   Begin
      dbePUnit.SetFocus;
      Raise Exception.Create('Ingrese Precio Unitario');
   End;
End;

Procedure TFRegOrdCD.dbeCntEnter(Sender: TObject);
Begin
   strTmp := TCustomEdit(Sender).Text;
End;

Procedure TFRegOrdCD.dbeCntExit(Sender: TObject);
Var
   xTmp: String;
   xNumero: Double;
Begin
   If trim(TCustomEdit(Sender).Text) <> strTMP Then
   Begin
      Try
         xnumero := StrToFloat(TCustomEdit(Sender).Text);
         If xnumero <= 0 Then
         Begin
            xTmp := strTMP;
            Showmessage('Ingrese Dato Mayor que cero');
            strTMP := xTmp;
            TCustomEdit(Sender).SetFocus;
         End
         Else
         Begin
         //Aqui va el codigo delos calculos
            TCustomEdit(Sender).Text := DMLOG.LogDec(TCustomEdit(Sender).Text, 3);
            ImporteDetalle;
         End;
      Except
         xTmp := strTMP;
         Showmessage('Ingrese Dato');
         strTMP := xTmp;
         TCustomEdit(Sender).SetFocus;
      End;
   End
   Else
   Begin
      If strTmp = '' Then
      Begin
         TCustomEdit(Sender).SetFocus;
         xTmp := strTMP;
         ShowMessage(' Ingrese Dato ');
         strTMP := xTmp;
      End;
   End;
   If xCant <> dbeCnt.Text Then
   Begin
      If Length(Trim(DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString)) > 0 Then
         dbgDOCxDrqs.ReadOnly := true
      Else
         dbgDOCxDrqs.ReadOnly := False;

      DMLOG.cdsDODCxDRQS.Filtered := False;
      DMLOG.cdsDODCxDRQS.Filter := 'ARTID='+quotedstr(dbcldArti.Text);
      DMLOG.cdsDODCxDRQS.Filtered := True;

   End;
End;

Procedure TFRegOrdCD.ImporteDetalle;
Var
   rD, rC, rU, rI, rTIMP, rVVen, rISC: Double;
Begin
   rC := StrToFloat(dbeCnt.Text);
   rU := StrToFloat(dbePUnit.Text);
   If (rc = 0) Or (ru = 0) Then
   Begin
      dbeImporte.Text := DMLOG.LogDec('', 2);
      Exit;
   End;
   If trim(dbeDscto.Text) = '' Then dbeDscto.Text := '0.00';
   If trim(dbeImpInd.Text) = '' Then dbeImpInd.Text := '0.00';
   If trim(dbeISC.Text) = '' Then dbeISC.Text := '0.00';

   rD := StrToFloat(dbeDscto.Text);
   rI := StrToFloat(dbeImpInd.Text);
   rISC := StrToFloat(dbeISC.Text);
   rTIMP := (rC * rU) - ((rC * rU) * (rD / 100));
   rTIMP := rTIMP + ((rTIMP) * (rI / 100)) + ((rTIMP) * (rISC / 100));
   rVVen := (rC * rU) - ((rC * rU) * (rD / 100));

   dbeImporte.Text := Format('%0.5f', [rTIMP]);
   dbeValVen.Text := Format('%0.5f', [rVVen]);
End;

Procedure TFRegOrdCD.Z2bbtnMasMenosClick(Sender: TObject);
Begin
   If Z2bbtnMasMenos.Caption = '+' Then
   Begin
      ValidaDet;
      Z2bbtnMasMenos.Top := gbxprov.Top + gbxprov.Height + 5;
      gbxProv.Visible := true;
      Z2bbtnMasMenos.Caption := '-';
    //recuperacion de unidaddes de medida equiv.
      cds1.close;
      xSQL := 'select case when EUNMID1 = ' + quotedstr(trim(dblcUMed.Text)) + ' then EUNMID2 '
         + '               when EUNMID2 = ' + quotedstr(trim(dblcUMed.Text)) + ' then EUNMID1 '
         + '               else null '
         + '           end UNMID, '
         + '          case when EUNMID1 = ' + quotedstr(trim(dblcUMed.Text)) + ' then EUNMEQ '
         + '               else cast(1/EUNMEQ AS DECIMAL(15,4)) '
         + '           end EUNMEQ, '
         + '          TGE130.UNMDES '
         + '     from TGE156 '
         + '     left join TGE130 on (case when EUNMID1 = ' + quotedstr(trim(dblcUMed.Text))
         + '                               then UNMID2 '
         + '                               when EUNMID2 = ' + quotedstr(trim(dblcUMed.Text))
         + '                               then UNMID1 '
         + '                           end = TGE130.UNMID) '
         + '    where not case when EUNMID1 = ' + quotedstr(trim(dblcUMed.Text))
         + '                   then EUNMID1 '
         + '                   when EUNMID2 = ' + quotedstr(trim(dblcUMed.Text))
         + '                   then EUNMID2 '
         + '                   else null '
         + '               end is null ';
      cds1.DataRequest(xSQL);
      cds1.open;
      If cds1.recordCount = 0 Then
         dblcUMEquiv.enabled := false
      Else
         dblcUMEquiv.enabled := True;
   End
   Else
   Begin
      Z2bbtnMasMenos.Top := bvlDetalle.Top + bvlDetalle.Height + 5;
      gbxProv.Visible := False;
      Z2bbtnMasMenos.Caption := '+'
   End;
   Z2bbtnRegOk.top := Z2bbtnMasMenos.Top;
   Z2bbtnRegCanc.top := Z2bbtnMasMenos.Top;
   pnlDetallea.Height := Z2bbtnMasMenos.Top + Z2bbtnMasMenos.Height + 5;
End;

Procedure TFRegOrdCD.dblcUMEquivExit(Sender: TObject);
Begin
   dblcUMEquiv.Text := trim(dblcUMEquiv.Text);
   If trim(dblcUMEquiv.Text) <> '' Then
      If cds1.Locate('UNMID', Vararrayof([trim(dblcUMEquiv.Text)]), []) Then
      Begin
         dbeUMEquiv.Text := cds1.fieldbyname('UNMDES').AsString;
         dbePUEquiv.Text := DMLOG.logdec(currtostr(cds1.fieldbyname('FACTOR').AsFloat * StrToFloat(dbePUnit.text)));
         dbeCantEquiv.Text := DMLOG.logdec(currtostr(cds1.fieldbyname('FACTOR').AsFloat * StrToFloat(dbeCnt.text)));
      End
      Else
      Begin
         dbeUMEquiv.Text := '';
         dblcUMEquiv.Text := '';
         dbePUEquiv.Text := '0.00';
         dbeCantEquiv.Text := '0.00';
      End
   Else
   Begin
      dbeUMEquiv.Text := '';
      dbePUEquiv.Text := '';
      dbeCantEquiv.Text := '';
   End;
End;

Procedure TFRegOrdCD.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TDBMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFRegOrdCD.pprOCPEPreviewFormCreate(Sender: TObject);
Begin
   pprOCPE.PreviewForm.ClientHeight := 500;
   pprOCPE.PreviewForm.ClientWidth := 650;
   tppviewer(pprOCPE.PreviewForm.Viewer).zoomSetting := zspageWidth;
End;

Procedure TFRegOrdCD.pprOCPAfterPrint(Sender: TObject);
Begin
   If DMLOG.cdsOrdComp.FieldByName('ODCFATE').IsNull Then
   Begin
      DMLOG.cdsOrdComp.Edit;
      DMLOG.cdsOrdComp.FieldByName('ODCFATE').AsDateTime := Date;
      DMLOG.cdsOrdComp.Post;

      xSQL := ' Update LOG304 '
         + '       set ODCFATE=SYSDATE '
         + '     Where CIAID =' + quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').asString)
         + '       and ODCID =' + quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCID').asString);
      Try      
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al actualizar Fecha de Atención en O.Compra (LOG304-ODCFATE) ');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;
   End;
End;

Procedure TFRegOrdCD.pprOCPBeforePrint(Sender: TObject);
Var
   sConta: String;
Begin
   sConta := '';
   xSQL := 'Select distinct RQSID '
      + '     from LOG324 '
      + '    where CIAID=' + quotedstr(dblcCIA.Text)
      + '      and ODCID=' + quotedstr(DMLOG.cdsOrdComp.fieldbyName('ODCID').asString)
      + '      and DODCCNT>0 '
      + '    order by RQSID';
   DMLOG.cdsLOG.Close;
   DMLOG.cdsLOG.DataRequest(xSQL);
   DMLOG.cdsLOG.Open;
   DMLOG.cdsLOG.First;
   While Not DMLOG.cdsLOG.Eof Do
   Begin
      sConta := sConta + DMLOG.cdsLOG.FieldByName('RQSID').AsString + ', ';
      DMLOG.cdsLOG.Next;
   End;
   ppLabel8.Text := sConta;

End;

Procedure TFRegOrdCD.pprOCPPreviewFormCreate(Sender: TObject);
Begin
   pprOCP.PreviewForm.ClientHeight := 500;
   pprOCP.PreviewForm.ClientWidth := 650;
   tppviewer(pprOCP.PreviewForm.Viewer).zoomSetting := zspageWidth;
End;

Procedure TFRegOrdCD.dblcUMedExit(Sender: TObject);
Begin
   edtUMed.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE130', 'UNMDES', 'UNMID=' + quotedStr(dblcUMed.Text), 'UNMDES');
End;

Procedure TFRegOrdCD.ProXReq;
Begin
   DMLOG.cdsRqsArtX.MasterSource := Nil;
   DMLOG.cdsRqsArtX.MasterFields := '';
   DMLOG.cdsRqsArtX.IndexFieldNames := '';

   xSQL := 'Select A.CIAID, B.ARTID, B.UNMIDG, B.UNMIDU, B.RQSFLAGUM, B.RQSMARK, '
      + '          SUBSTR(B.DRQSOBS,1,100) AS ARTDES, B.TIPOADQ, '
      + '          SUM(NVL(B.DRQSCNSG,0)) AS RXACNTSG, SUM(NVL(B.DRQSCNAG,0)) AS RXACNTAG, '
      + '          SUM(NVL(B.DRQSCNSG,0)-NVL(B.DRQSCNAG,0)) AS RXASALDOG, '
      + '          SUM(NVL(B.DRQSCNSU,0)) AS RXACNTSU, SUM(NVL(B.DRQSCNAU,0)) AS RXACNTAU, '
      + '          SUM(NVL(B.DRQSCNSU,0)-NVL(B.DRQSCNAU,0)) AS RXASALDOU '
      + '     from LOG308 A, LOG309 B, TGE205 C '
      + '    where (( A.RQSEST=' + quotedstr('ACEPTADO') + ' ) OR ( A.RQSEST=' + quotedstr('PARCIAL') + ')) '
      + '      and ( (NVL(B.DRQSCNSG,0)-NVL(B.DRQSCNAG,0)>0) '
      + '         or (NVL(B.DRQSCNSU,0)-NVL(B.DRQSCNAU,0)>0) ) '
      + '      and ( NOT A.RQSVISADOR IS NULL ) '
      + '      and A.CIAID=' + quotedstr(FRegOrdCD.dblcCIA.Text)
      + '      and A.TIPOADQ=' + quotedStr(dblcTipoCompra.text)
      + '      and A.CIAID=B.CIAID(+) '
      + '      and A.RQSID=B.RQSID(+) '
      + '      and B.ARTID=C.ARTID(+) '
      + '    group BY A.CIAID, B.ARTID, B.RQSFLAGUM, B.UNMIDG, B.UNMIDU, B.RQSMARK, '
      + '          SUBSTR(B.DRQSOBS,1,100), B.TIPOADQ';
   DMLOG.cdsArtPendX.Close;
   DMLOG.cdsArtPendX.DataRequest(xSQL);
   DMLOG.cdsArtPendX.Open;
   
   xSQL := 'Select B.CIAID, B.RQSID, B.DRQSID, B.ARTID, B.RQSFLAGUM, B.DRQSCNSG, '
      + '          B.DRQSCNAG, B.DRQSCNSG-B.DRQSCNAG DRQSSLDG, B.TIPOADQ, '
      + '          B.UNMIDG, B.DRQSCNSU, B.DRQSCNAU, B.DRQSCNSU-B.DRQSCNAU DRQSSLDU, '
      + '          B.UNMIDU, A.RQSFREQ, A.CCOSID, A.PRIOID, '
      + '          A.RQSSOLI, A.RQSAUTOR, A.RQSAPRO, A.RQSEST, A.RQSFATE, A.RQSFREG, A.LOCID, '
      + '          C.GRARID, D.CCOSDES, G.UNMDES UNMGDES, H.UNMDES UNMUDES, '
      + '          SUBSTR(B.DRQSOBS,1,100) as ARTDES '
      + '     from LOG309 B, LOG308 A, TGE205 C, TGE203 D, TGE130 G, TGE130 H '
      + '    where A.RQSEST <> ' + quotedstr('ATENDIDO') + ' '
      + '      and ( nvl(B.DRQSCNSG,0) - nvl(B.DRQSCNAG,0) > 0 '
      + '         or nvl(B.DRQSCNSU,0) - nvl(B.DRQSCNAU,0) > 0 ) '
      + '      and B.CIAID=' + quotedstr(FRegOrdCD.dblcCIA.Text)
      + '      and ( not A.RQSVISADOR is null ) '
      + '      and B.TIPOADQ=' + quotedStr(dblcTipoCompra.text)
      + '      and A.CIAID=B.CIAID '
      + '      and A.LOCID=B.LOCID '
      + '      and A.RQSID=B.RQSID '
      + '      and B.ARTID=C.ARTID '
      + '      and B.CIAID=C.CIAID '
      + '      and B.TINID=C.TINID '
      + '      and A.CCOSID=D.CCOSID(+) '
      + '      and B.UNMIDG=G.UNMID(+) '
      + '      and B.UNMIDU=H.UNMID(+) ';
   DMLOG.cdsRqsArtX.Close;
   DMLOG.cdsRqsArtX.datarequest(xSQL);
   DMLOG.cdsRqsArtX.MasterSource := DMLOG.dsArtPendX;
   DMLOG.cdsRqsArtX.MasterFields := 'ARTDES';
   DMLOG.cdsRqsArtX.IndexFieldNames := 'ARTDES';
   DMLOG.cdsRqsArtX.Open;
End;

Procedure TFRegOrdCD.ProXReqTot;
Begin
   xSQL := 'Select A.CIAID, A.RQSID, A.TIPOADQ, A.CCOSID, A.PRIOID, D.CCOSDES, '
      + '          A.RQSSOLI, A.RQSAUTOR, A.RQSAPRO, A.RQSEST, A.RQSFATE, A.RQSFREG, '
      + '          A.LOCID, A.RQSVISADOR, A.RQSVISHREG, A.RQSUSER, RQSHREG, A.RQSCOMPID, '
      + '          A.URQUSR, A.URQHREG, A.URQACEPUSR, A.URQACEPHREG '
      + '     from LOG308 A, TGE203 D '
      + '    where (( A.RQSEST=' + quotedstr('ACEPTADO') + ' ) '
      + '        or ( A.RQSEST=' + quotedstr('PARCIAL') + ')) ';
   If Prm_RqsPedUsu <> 'S' Then
      xSQL := xSQL
         + '   and ( not A.RQSVISADOR is null ) ';
   xSQL := xSQL
      + '      and A.CIAID=' + quotedstr(FRegOrdCD.dblcCIA.Text) + ' '
      + '      and A.TIPOADQ=' + quotedStr(dblcTipoCompra.text) + ' '
      + '      and A.CCOSID = D.CCOSID(+) '
      + '    order by RQSID';
   DMLOG.cdsArtPendXTot.Close;
   DMLOG.cdsArtPendXTot.DataRequest(xSQL);
   DMLOG.cdsArtPendXTot.Open; // Detalle

   xSQL := 'Select B.CIAID, B.RQSID, B.DRQSID, B.ARTID, B.RQSFLAGUM, B.DRQSCNSG, B.DRQSCNAG, '
      + '          NVL(B.DRQSCNSG,0)-NVL(B.DRQSCNAG,0) AS RXACNTSG, B.TIPOADQ, '
      + '          B.UNMIDG, B.DRQSCNSU, B.DRQSCNAU, NVL(B.DRQSCNSU,0)-NVL(B.DRQSCNAU,0) AS RXACNTSU, '
      + '          B.UNMIDU, A.RQSFREQ, A.CCOSID, A.PRIOID, '
      + '          A.RQSSOLI, A.RQSAUTOR, A.RQSAPRO, B.RQSEST, A.RQSFATE, A.RQSFREG, A.LOCID, '
      + '          C.GRARID, D.CCOSDES, G.UNMDES UNMGDES, H.UNMDES UNMUDES, B.DRQSOBS as ARTDES, A.RQSVISADOR '
      + '     from LOG309 B, LOG308 A, TGE205 C, TGE203 D, TGE130 G, TGE130 H '
      + '    where B.RQSEST <> ' + quotedstr('ATENDIDO') + ' '
      + '      and ( NVL(B.DRQSCNSG,0) - NVL(B.DRQSCNAG,0) > 0 '
      + '         or NVL(B.DRQSCNSU,0) - NVL(B.DRQSCNAU,0) > 0 ) '
      + '      and B.CIAID=' + quotedstr(FRegOrdCD.dblcCIA.Text) + ' '
      + '      and B.TIPOADQ=' + quotedStr(dblcTipoCompra.text) + ' ';
   If Prm_RqsPedUsu <> 'S' Then
      xSQL := xSQL
         + '   and ( NOT A.RQSVISADOR IS NULL ) ';
   xSQL := xSQL
      + '      and A.CIAID=B.CIAID(+) AND A.LOCID=B.LOCID(+) AND A.RQSID=B.RQSID(+) '
      + '      and B.ARTID = C.ARTID(+) '
      + '      and B.CIAID = C.CIAID(+) '
      + '      and B.TINID = C.TINID(+) '
      + '      and A.CCOSID= D.CCOSID(+) '
      + '      and B.UNMIDG= G.UNMID(+) '
      + '      and B.UNMIDU= H.UNMID(+) '
      + '    order by RQSID, DRQSID';
   DMLOG.cdsRqsArtXTot.Close;
   DMLOG.cdsRqsArtXTot.datarequest(xSQL);
   DMLOG.cdsRqsArtXTot.MasterSource := DMLOG.dsArtPendXTot;
   DMLOG.cdsRqsArtXTot.MasterFields := 'RQSID';
   DMLOG.cdsRqsArtXTot.IndexFieldNames := 'RQSID';
   DMLOG.cdsRqsArtXTot.Open;
End;

Procedure TFRegOrdCD.dbeNRegExit(Sender: TObject);
Begin
   If DMLOG.wModo = 'A' Then
   Begin
      If Not DMLOG.cdsOrdComp.FieldByName('CIAID').IsNull Then
         If DMLOG.IsExistORD(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString,
            DMLOG.cdsOrdComp.FieldByName('ODCID').AsString) Then
         Begin
            ErrorMsg('Error', 'Ya existe una Orden de Compra con ' + #13 +
               'con el mismo número ... ' + DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);
            dbeNReg.SetFocus;
            Exit;
         End;

    // apertura detalle de Orden de Compra
      DMLOG.cdsDOrdComp.disableControls;
      xSQL := 'Select CIAID, ODCID, ARTID, UNMID, DODCID, DODCCNTU, DODCCNT, DODCPUNU, '
         + '          DODCPUN, DODCDSCTO, DODCIMP, DODCIMPU, PROFID, ODCEST, DODCCATEU,  '
         + '          DODCCATE, DODCCSLDU, DODCCSLD, DODCISC, DODCISCU, ARTIDPROV, ARTDESPROV,  '
         + '          UNMIDEQUIV, PUNTEQUIV, CNTEQUIV, DODCFTUM, TIPOADQ, CCOMERID, ACFREG,  '
         + '          DODCOBS, IMPTOT, IMPUNI, ODCUSER, PROV, TINID, GRARID, FAMID, SFAMID,  '
         + '          ODCANO, ODCMES, ODCDIA, ODCTRIM, ODCSEM, ODCANOMES, ODCSS, ODCAATRI,  '
         + '          ODCAASEM, ODCAASS, ODCFREG, ODCMMSS, PROVRUC, CLAUXID '
         + '     from LOG305 '
         + '    where CIAID=' + quotedstr(dblcCIA.text)
         + '      and ODCID=' + quotedstr(sNumOrd);
      DMLOG.cdsDOrdComp.Close;
      DMLOG.cdsDOrdComp.dataRequest(xSQL);
      DMLOG.cdsDOrdComp.Open;
      DMLOG.cdsDOrdComp.enableControls;
      xOk := False;
   End;
End;

Procedure TFRegOrdCD.bbtnCerrarClick(Sender: TObject);
Begin
   dbeCnt.Text := xCant;
   DMLOG.cdsDODCxDRQS.Cancel;
   pnlDetalleA.Enabled := true;
   DMLOG.cdsDODCxDRQS.Filtered := False;
   DMLOG.cdsDODCxDRQS.Filter := '';
   DMLOG.cdsDODCxDRQS.Filtered := True;
   pnlCant.Visible := false;
End;

Procedure TFRegOrdCD.bbtnAceptarClick(Sender: TObject);
Begin
   dbeCnt.Text := Format('%0.3f', [xMtoCnt]);
   xCant := dbeCnt.Text;
   pnlDetalleA.Enabled := True;
   pnlCant.Visible := False;
   DMLOG.cdsDODCxDRQS.Filtered := False;
   DMLOG.cdsDODCxDRQS.Filter := '';
   DMLOG.cdsDODCxDRQS.Filtered := True;
   dbePUnit.SetFocus;
End;

Procedure TFRegOrdCD.CalCant;
Var
   xCIAid, xODCid, xDODCI, xARTid: String;
Begin
   xCIAid := DMLOG.cdsOrdComp.FieldByName('CIAID').AsString;
   xODCid := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;
   xDODCi := DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString;
   xARTid := dbcldArti.Text;
   xSQL := 'CIAID=' + quotedstr(xCIAid)
      + ' and ODCID=' + quotedstr(xODCid)
      + ' and DODCID=' + quotedstr(xDODCi);
   xMtoCnt := DMLOG.OperClientDataSet(DMLOG.cdsDODCxDRQS, 'SUM(DODCCNT)', xSQL);
   dbgDOCxDrqs.ColumnByName('DODCCNT').FooterValue := FloattoStrF(xMtoCnt, ffNumber, 15, 2);
End;

Procedure TFRegOrdCD.dbgDOCxDrqsCellChanged(Sender: TObject);
Begin
   If xflag Then
   Begin
      xflag := false;
      CalCant;
      xflag := True;
   End
End;

Procedure TFRegOrdCD.dbgDOCxDrqsExit(Sender: TObject);
Begin
   CalCant;
End;

Procedure TFRegOrdCD.Z2bbtnColocacClick(Sender: TObject);
Begin
   If (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) <> 'ACEPTADO') Then
   Begin
      Information('Módulo de Compras', 'Para que pueda Realizar la Colocación Tiene que estar Aceptada la Orden de Compra ');
      Exit;
   End;
   If DMLOG.cdsOrdComp.State In [dsInsert, dsEdit] Then
   Begin
      DMLOG.cdsOrdComp.Cancel;
   End;
   DMLOG.cdsOrdComp.edit;
   DMLOG.cdsOrdComp.FieldByName('OCCOLOCAC').AsString := DMLOG.wUsuario;
   DMLOG.cdsOrdComp.FieldByName('OCCOLOFREG').AsDateTime := Date;
   DMLOG.cdsOrdComp.FieldByName('OCCOLOHREG').AsDateTime := SysUtils.Time;
   DMLOG.cdsOrdComp.Post;

   xSQL := 'Update LOG304 '
      + '      set OCCOLOCAC=' + quotedstr(DMLOG.wUsuario) + ','
      + '          OCCOLOFREG=trunc(sysdate), '
      + '          OCCOLOHREG=sysdate '
      + '    Where CIAID=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').asString)
      + '      and ODCID=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCID').asString);
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      Screen.Cursor := crDefault;
      ShowMessage('Error al realizar al actualizar COLOCACIÓN en la cabecera');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      exit;
   End;

   Z2bbtnColocac.Enabled := False;
End;

Procedure TFRegOrdCD.GenerProfOCompra;
Var
   NumOC: String;
   ConCom: String;
Begin
// DEFINE SI LA CONDICION DE PAGO ES O NO AL CREDITO (1=SI 2=NO)
   xSQL := 'CIAID=' + QuotedStr(dblcCIA.Text) + ' AND CCOMERID=' + QuotedStr(dblcFPago.Text);
   If DMLOG.displaydescrip('prvSQL', 'CXC101', 'CREDITO', xSQL, 'CREDITO') = 'S' Then
      ConCom := '1'
   Else
      ConCom := '2';
   NumOC := DMLOG.cdsOrdComp.fieldbyname('ODCID').AsString;

   xSQL := ' Insert INTO LOG312 ( '
      + '           CIAID, PROFID, PROV, FPAGOID, TMONID, PROFFEMI, PROFTEN, PROFVALID, '
      + '           PROFTCAMB, PROFIXFLE, PROFIXTCC, PROFIXTD, PROFIXTI, PROFEST, PROFOBS, '
      + '           PROFUSER, PROFFREG, PROFHREG, PROFANO, PROFMM, PROFDD, PROFTRI, PROFSEM, '
      + '           PROFSS, PROFANOMM, PROFAATRI, PROFAASEM, PROFAASS, PROFTOTALG, PROFTIMP, '
      + '           PROFTTIMPU, PROFEVAL, PROFISC, FAUTOGEN, PROFGENER, TIPOADQ, ODCID, '
      + '           PROFCONCOM) '
      + '    Select CIAID, ' + QuotedStr('OC' + NumOC) + ', PROV, CCOMERID, TMONID, '
      + '           Sysdate, ODCTEN, ODCVALID, ODCTCAMB, ODCIXFLE, ODCIXTCC, '
      + '           ODCIXTD, ODCIXTI, ''ACEPTADO'', '
      +             QuotedStr('GENERADO POR EL SISTEMA DESDE LA ORDEN DE COMPRA ' + NumOC) + ', '
      + '           ODCUSER, ODCFREG, ODCHREG, ODCANO, ODCMM, ODCDD, '
      + '           ODCTRI, ODCSEM, ODCSS, ODCANOMM, ODCAATRI, ODCAASEM, ODCAASS, '
      + '           ODCTOTALG, ODCTIMP, ODCTTIMPU, ''A'', ODCTOTALISC, ''S'', ''O/COMPRA'', '
      + '           TIPOADQ, ' + quotedstr(NumOC) + ', CCOMERID '
      + '      from LOG304 '
      + '     where CIAID=' + QuotedStr(dblcCIA.Text)
      + '       and ODCID=' + quotedstr(NumOC);
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      Screen.Cursor := crDefault;
      xSigueGrab := False;
      ShowMessage('Error al actualizar cabecera de Orden de Proformas (LOG312)');
      exit;
   End;

   xSQL := ' Insert into LOG313( '
      + '           CIAID, PROFID, ARTID, UNMIDG, UNMIDU, DPROFLAGUM, DPROFID, DPROFCNTG, '
      + '           DPROFCNTU, DPROFPUNG, DPROFPUNU, DPROFDSCTO, DPROFIMP, '
      + '           DPROFIMPU, DPROFEVAL, DPROFISC, ODCID, TIPOADQ, DPROFOBS, DPROFCONCOM, '
      + '           DPROFFREG, DPROFTEN, DPROFVALID, DPROFPRVD, DPROFPROV, TINID, GRARID, '
      + '           FAMID, SFAMID, PROFUSER, PROFANO, PROFMES, PROFDIA, PROFTRIM, PROFSEM, '
      + '           PROFANOMES, PROFSS, PROFAATRI, PROFAASEM, PROFAASS ) '
      + '    Select CIAID, ' + QuotedStr('OC' + NumOC) + ' PROFID, ARTID, '
      + '           (case when DODCCNTU is NULL then UNMID else NULL end) UNMIDG, '
      + '           (case when DODCCNTU is NULL then NULL else UNMID end) UNMIDU, '
      + '           (case when DODCCNTU is NULL then ''G'' else NULL end) DPROFLAGUM, '
      + '           DODCID DPROFID, '
      + '           (case when DODCCNTU is NULL then DODCCNT else NULL end) DPROFCNTG, '
      + '           (case when DODCCNTU is NULL then NULL else DODCCNT end) DPROFCNTU, '
      + '           (case when DODCCNTU is NULL then DODCPUN else NULL end) DPROFPUNG, '
      + '           (case when DODCCNTU is NULL then NULL else DODCPUN end) DPROFPUNU, '
      + '           DODCDSCTO DPROFDSCTO, DODCIMP DPROFIMP, DODCIMPU DPROFIMPU, ''A'' DPROFEVAL,'
      + '           DODCISCU DPROFISC, ODCID, TIPOADQ, DODCOBS DPROFOBS, '
      +             quotedstr(ConCom) + 'DPROFCONCOM, '
      + '           trunc(sysdate) DPROFFREG, '
      +             dbseEnt.Text + ' DPROFTEN, '
      +             dbsbVal.Text + ' DPROFVALID, '
      +             QuotedStr(edtProv.Text) + ' DPROFPRVD, '
      +             quotedstr(dblcdProv.Text) + ' DPROFPROV, '
      + '           TINID, GRARID, FAMID, SFAMID,  ODCUSER PROFUSER, '
      + '           ODCANO PROFANO, ODCMES PROFMES, ODCDIA PROFDIA, ODCTRIM PROFTRIM, '
      + '           ODCSEM PROFSEM, ODCANOMES PROFANOMES, ODCSS PROFSS, ODCAATRI PROFAATRI, '
      + '           ODCAASEM PROFAASEM, ODCAASS PROFAASS'
      + '      from LOG305 '
      + '     where CIAID=' + QuotedStr(dblcCIA.Text)
      + '       and ODCID = ' + QuotedStr(NumOC);
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      Screen.Cursor := crDefault;
      xSigueGrab := False;
      ShowMessage('Error al actualizar la actualización del Detalle de Proformas (LOG313)');
      exit;
   End;
End;

Procedure TFRegOrdCD.ppDetailBand3BeforePrint(Sender: TObject);
Begin
   xVan := xVan + 1;
   If (pprOCP.Page > 1) And (xVan = 1) Then
   Begin
      ppLabel7.Caption := 'VIENEN...';
      ppLabel7.Visible := true;
      ppDBText37.Top := ppLabel7.Top + ppLabel7.Height;
      ppDBMemo1.Top := ppLabel7.Top + ppLabel7.Height;
      ppvLin.Top := ppLabel7.Top + ppLabel7.Height;
      ppDBText39.Top := ppLabel7.Top + ppLabel7.Height;
      ppDBText40.Top := ppLabel7.Top + ppLabel7.Height;
      ppDBText41.Top := ppLabel7.Top + ppLabel7.Height;
      ppDBText42.Top := ppLabel7.Top + ppLabel7.Height;
      ppDBText43.Top := ppLabel7.Top + ppLabel7.Height;
   End
   Else
   Begin
      ppLabel7.Visible := False;
      ppDBText37.Top := 0;
      ppDBMemo1.Top := 0;
      ppvLin.Top := 0;
      ppDBText39.Top := 0;
      ppDBText40.Top := 0;
      ppDBText41.Top := 0;
      ppDBText42.Top := 0;
      ppDBText43.Top := 0;
   End;
   If ppDetailBand3.PrintCount = xvan Then
   Begin
      ppLabel9.Top := ppDBMemo1.Top + ppDBMemo1.Height;
      ppLabel9.Visible := True;
   End
   Else
      ppLabel9.Visible := False;
End;

Procedure TFRegOrdCD.pprOCPStartPage(Sender: TObject);
Begin
   xVan := 0;
End;

Procedure TFRegOrdCD.ppDetailBand4BeforePrint(Sender: TObject);
Begin
   xVan := xVan + 1;
   If (pprOCPE.Page > 1) And (xVan = 1) Then
   Begin
      ppLabel11.Caption := 'VIENEN...';
      ppLabel11.Visible := true;
      ppDBText60.Top := ppLabel11.Top + ppLabel11.Height;
      ppDBMemo2.Top := ppLabel11.Top + ppLabel11.Height;
      ppDBText62.Top := ppLabel11.Top + ppLabel11.Height;
      ppDBText63.Top := ppLabel11.Top + ppLabel11.Height;
      ppDBText64.Top := ppLabel11.Top + ppLabel11.Height;
      ppDBText65.Top := ppLabel11.Top + ppLabel11.Height;
      ppDBText66.Top := ppLabel11.Top + ppLabel11.Height;
   End
   Else
   Begin
      ppLabel11.Visible := False;
      ppDBText60.Top := 0;
      ppDBMemo2.Top := 0;
      ppDBText62.Top := 0;
      ppDBText63.Top := 0;
      ppDBText64.Top := 0;
      ppDBText65.Top := 0;
      ppDBText66.Top := 0;
   End;
   If ppDetailBand4.PrintCount = xvan Then
   Begin
      ppLabel10.Top := ppDBMemo2.Top + ppDBMemo2.Height;
      ppLabel10.Visible := True;
   End
   Else
      ppLabel10.Visible := False;
End;

Procedure TFRegOrdCD.Z2bbtnDepuraOCClick(Sender: TObject);
Begin
//  Para que los usuarios tengan acceso a esta opción
//  tienen que tener el grupo de ADQUISICIONES
//  y NO TIENE QUE ESTAR REGISTRADO el formulario FDepODC en TGE001
//   DMLOG.AccesosUsuarios(DMLOG.wModulo, DMLOG.wUsuario, '2', Screen.ActiveForm.Name);

   If DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString = 'DEPURADO' Then
   Begin
      ShowMessage('La Orden de Compra ya fue Depurada');

      FDepODC := TFDepODC.create(self);
      FDepODC.memObsDep.Text := DMLOG.cdsOrdComp.FieldbyName('ODCOBSDEP').AsString;
      FDepODC.Show;
      FDepODC.bbtnAceObsAnu.Enabled := False;
      FDepODC.memObsDep.Enabled := False;

      exit;
   End;
   If (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) <> 'ACEPTADO') Then
   Begin
      Information('Adquisiciones', 'Sólo se puede Anular una O.Compra ACEPTADA');
      exit;
   End;
   FDepODC := TFDepODC.create(self); // LOG601 - FDepODC - Depuración de O.Compra
   If Length(Trim(DMLOG.cdsOrdComp.FieldByName('ODCOBSDEP').AsString)) > 0 Then
   Begin
      FDepODC.memObsDep.Text := DMLOG.cdsOrdComp.FieldbyName('ODCOBSDEP').AsString;
   End;
   FDepODC.Show;
End;

Procedure TFRegOrdCD.dbcldArtiExit(Sender: TObject);
Begin
   If Z2bbtnRegCanc.Focused Then exit;
   DMLOG.cdsArti.IndexFieldNames := 'ARTID';
   DMLOG.cdsArti.SetKey;
   DMLOG.cdsArti.FieldByName('ARTID').AsString := dbcldArti.text;
   If DMLOG.cdsArti.GotoKey Then
   Begin
      dblcUMed.Text := DMLOG.cdsArti.fieldbyname('UNMIDG').AsString;
      memDetalle.Text := DMLOG.cdsArti.fieldbyname('ARTDES').AsString;
      dbePUnit.Text := Floattostr(DMLOG.cdsArti.fieldbyname('ARTPCG').AsFloat);
      edtAdq.Text := DMLOG.cdsOrdComp.FieldbyName('TIPOADQ').AsString;
      edtUltCompra.text := FloatToStrF(DMLOG.cdsArti.FieldByName('ARTPCG').AsFloat, ffNumber, 15, 4);
      dblcUMedExit(Sender);
   End
   Else
   Begin
      dbcldArti.SetFocus;
      Raise Exception.Create('No existe Artículo');
   End;

End;

Procedure TFRegOrdCD.FormShow(Sender: TObject);
Begin
   lblReferencia.Visible := False;
   edtNumReferencia.Visible := False;
   EdtDescripReferencia.Visible := False;

   xProv := DMLOG.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');
   CbTipOrdCompra.Text := 'O.C. DIRECTA';
   CbTipOrdCompra.Enabled := True;
   dblcdProv.Enabled := True;
   dblcTipoAuxiliar.Enabled := True;
   dblcdProv.Color := clWindow;
   dblcTipoAuxiliar.Color := clWindow;
   edtProv.Color := clWindow;
   DMLOG.FiltraTabla(DMLOG.cdsLEntrega, 'TGE136', 'LGECID', 'LGECID');

   If DMLOG.wModo = 'M' Then
   Begin
      dblcCIA.text := DMLOG.cdsOrdComp.FieldByName('CIAID').AsString;
      dblcdProv.text := DMLOG.cdsOrdComp.FieldByName('PROV').AsString;
      dblcTMoneda.text := DMLOG.cdsOrdComp.FieldByName('TMONID').AsString;
      dbdtpFEmi.Date := DMLOG.cdsOrdComp.FieldByName('ODCFEMI').AsDateTime;
      dblcFPago.text := DMLOG.cdsOrdComp.FieldByName('CCOMERID').AsString;
      dblcLEntrega.text := DMLOG.cdsOrdComp.FieldByName('LGECID').AsString;
      dblcTipoCompra.text := DMLOG.cdsOrdComp.FieldByName('TIPOADQ').AsString;
      xsTipoAuxiliar := DMLOG.cdsOrdComp.fieldbyName('CLAUXID').AsString;
      xOk := True;
      xProv := DMLOG.cdsOrdComp.FieldByName('CLAUXID').AsString;
      edtnumRequerimiento.Text := DMLOG.cdsOrdComp.fieldbyName('DOCREF').AsString;

      If dblcTipoCompra.Text = 'I' Then
      Begin
         xSQL := 'Select A.*, B.DESCRIPCION, B.LOCID, B.CODPROV '
            + '     from LOG_MOV_SERVICIOS A, LOG_MAE_SERVICIOS B '
            + '    where A.CIAID=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
            + '      and A.KEYRECIBO=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('KEYRECIBO').AsString)
            + '      and A.CIAID=B.CIAID AND A.CODUNICO=B.CODUNICO ';
         DMLOG.cdsSerPend.close;
         DMLOG.cdsSerPend.DataRequest(xSQL);
         DMLOG.cdsSerPend.open;
         memDetalle.Lines.Text := DMLOG.cdsSerPend.FieldByname('DESCRIPCION').AsString;
         dbeCnt.Text := '1';
         dbePUnit.Text := DMLOG.cdsSerPend.FieldByname('NETO').AsString;
         dblcLOC.Text := DMLOG.cdsSerPend.FieldByname('LOCID').AsString;
         dbServicioExit(Self);
         dbServicio.Text := DMLOG.cdsSerPend.FieldByname('NUMCLISUM').AsString;
         dbeImporte.Text := DMLOG.cdsSerPend.FieldByname('IMPORTE').AsString;
         edtServicio.Text := DMLOG.cdsSerPend.FieldByName('DESCRIPCION').AsString;
         gbPagoServ.Enabled := False;
      End;
   End;

   If DMLOG.wModo = 'A' Then
   Begin
      DMLOG.cdsOrdComp.Append;
      DMLOG.cdsOrdComp.fieldbyName('ODCFREG').AsDateTime := date;
      DMLOG.cdsOrdComp.fieldbyName('ODCFEMI').AsDateTime := date;
      DMLOG.cdsOrdComp.fieldbyName('ODCFATE').AsDateTime := date;
      DMLOG.cdsOrdComp.fieldbyName('ODCTEN').asInteger := 1;
      DMLOG.cdsOrdComp.fieldbyName('ODCVALID').asInteger := 1;
      dblcdProv.text := '';
      dedNProforma.Text := '';
      dbeFlete.Text := '0.00';
      dblcdProv.Enabled := true;
   End;

   xDesac := 0;
   xCrea := True;
   xflag := True;
   pnlCant.Visible := false;
   wIGV := DMLOG.displaydescrip('prvSQL', 'TGE108', 'TASACAN', 'TASAFLG=''I''', 'TASACAN');
   xOrdElim := '';
   edtCIA.Text := '';
   edtTipoCompra.Text := '';
   edtProv.Text := '';
   edtTMoneda.Text := '';
   edtFPago.Text := '';
   edtLEntrega.Text := '';
   If DMLOG.wModo = 'A' Then
      dbeTCambio.Text := '';

   If DMLOG.wModo = 'M' Then
      dbeNReg.Enabled := False
   Else
      dbeNReg.Enabled := True;

   Screen.Cursor := crHourGlass;
   dblcdProv.Enabled := True;
   If FOrdendeCompra.wTipoOC = 'xProforma' Then
   Begin
      dblcdProv.Enabled := False;
      If Not DMLOG.cdsOrdComp.fieldbyname('PROV').IsNull Then
         If Not (trim(DMLOG.cdsOrdComp.fieldbyname('PROV').AsString) = '') Then
            If DMLOG.RecuperarDatos('TGE201', '*', 'PROV='+quotedstr(DMLOG.cdsOrdComp.fieldbyname('PROV').AsString)) Then
               edtProv.Text := DMLOG.cdsQry.fieldbyname('PROVDES').AsString;
      btnDetalle;
   End;

   If FOrdendeCompra.wTipoOC = 'xCotizacion' Then
//   If Length(Trim(DMLOG.cdsOrdComp.FieldByName('PROFID').AsString)) > 0 Then
   Begin
      lblReferencia.Visible := True;
      edtNumReferencia.Visible := True;
      EdtDescripReferencia.Visible := True;
      edtNumReferencia.Text := DMLOG.cdsOrdComp.FieldByName('PROFID').AsString;
 //Proforma cabecera
      xSQL := 'Select CIAID, SCCID, PROV, FPAGOID, TMONID, PROFID, PROFFEMI, PROFTEN, '
         + '          PROFVALID, PROFTCAMB, PROFIXFLE, PROFIXTCC, PROFIXTD, PROFIXTI, '
         + '          PROFEST, PROFFATE, PROFOBS, PROFUSER, PROFFREG, PROFHREG, PROFANO, '
         + '          PROFMM, PROFDD, PROFTRI, PROFSEM, PROFSS, PROFANOMM, PROFAATRI, '
         + '          PROFAASEM, PROFAASS, FLAGVAR, PROFNPROV, PROFTOTALG, PROFTIMP, '
         + '          PROFTTIMPU, PROFEVAL, PROFCONCOM, PROFGARAN, PROFFARDMA, PROFISC, '
         + '          FAUTOGEN, TRQSID, TIPOADQ, ODCID, PROFGENER, PROVDES, PROVRUC, '
         + '          PROFENTR, CLAUXID, GARANTIAID, FLAGCCOM '
         + '     From LOG312 '
         + '    Where CIAID='+quotedstr(dblcCIA.text)
         + '      And PROFID='+quotedstr(DMLOG.cdsOrdComp.FieldByName('PROFID').AsString);
      DMLOG.cdsQry.Close;
      DMLOG.cdsQry.DataRequest(xSQL);
      DMLOG.cdsQry.Open;
      EdtDescripReferencia.Text := DMLOG.cdsQry.FieldByname('Profobs').AsString;
      dblcdProv.Text := DMLOG.cdsQry.FieldByname('PROV').AsString;
      DMLOG.cdsProv.Locate('PROV', VarArrayOf([dblcdProv.Text]), []);
      DMLOG.cdsOrdComp.Edit;
      DMLOG.cdsOrdComp.FieldByName('PROV').AsString := DMLOG.cdsQry.FieldByname('PROV').AsString;
      DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString := DMLOG.cdsProv.FieldByname('PROVDES').AsString;

 //Solicitud de Cotizacion
      VSCCID := DMLOG.cdsQry.FieldByname('SCCID').AsString;
      dblcdProv.Enabled := False;
      dblcTipoAuxiliar.Enabled := False;
      DMLOG.cdsQry.Close;
      CbTipOrdCompra.Text := 'O.C. COTIZACION';
      CbTipOrdCompra.Enabled := False;
      dblcdProv.Color := clInfoBk;
      dblcTipoAuxiliar.Color := clInfoBk;
      edtProv.Color := clInfoBk;
   End;

   If FOrdendeCompra.wTipoOC = 'xOCDirecta' Then
   Begin
      CbTipOrdCompra.Text := 'O.C. DIRECTA';
      CbTipOrdCompra.Enabled := True;
      dblcdProv.Enabled := True;
      dblcdProv.Color := clWindow;
      dblcTipoAuxiliar.Color := clWindow;
      edtProv.Color := clWindow;
   End;

   If FOrdendeCompra.wTipoOC = 'xRequerimiento' Then
   Begin
      CbTipOrdCompra.Text := 'O.C. REQUERIM';
      CbTipOrdCompra.Enabled := True;
      dblcdProv.Enabled := True;
      dblcdProv.Color := clWindow;
      dblcTipoAuxiliar.Color := clWindow;
      edtProv.Color := clWindow;
   End;

   OnOffVisar(False);

   If DMLOG.wModo <> 'A' Then
   Begin
      If Length(Trim(DMLOG.cdsOrdComp.fieldbyname('ODCVISADOR').AsString)) > 0 Then
      Begin
         OnOffCabecera(False); //Activar la cabecera
         OnOffDetalle(True); //Desactivar el panel de detalle
      End
      Else
      Begin
         OnOffCabecera(True); //Activar la cabecera
         OnOffDetalle(False); //Desactivar el panel de detalle
      End;
   End
   Else
   Begin
      OnOffCabecera(True); //Activar la cabecera
      OnOffDetalle(False); //Desactivar el panel de detalle
   End;

   If DMLOG.wModo <> 'A' Then
      If (btxtEstado.Field.AsString = 'ACEPTADO') Or
         (btxtEstado.Field.AsString = 'DEPURADO') Or
         (btxtEstado.Field.AsString = 'ANULADO') Or
         (btxtEstado.Field.AsString = 'PARCIAL') Or
         (btxtEstado.Field.AsString = 'ATENDIDO') Then
      Begin
         OnOffCabecera(False); //Activar la cabecera
         OnOffDetalle(True); //Desactivar el panel de detalle
         pnlcabecera.Enabled := False;
         Z2bbtnRegresa.Enabled := False;
         Z2bbtnCanc2.Enabled := False;
         Z2bbtnGraba.Enabled := False;
         Z2bbtnAcepta.Enabled := False;
         z2bbtnSalir.Enabled := True;
      End;

   If (FOrdendeCompra.wTipoOC = 'xOCDirecta') Then
   Begin

   End;

   If DMLOG.cdsOrdComp.State In [dsInsert] Then
      dblcCIA.Enabled := True
   Else
      dblcCIA.Enabled := False;

   xSQL := 'Select CIAID, ODCID, ARTID, UNMID, DODCID, DODCCNTU, DODCCNT, DODCPUNU, '
      + '          DODCPUN, DODCDSCTO, DODCIMP, DODCIMPU, PROFID, ODCEST, DODCCATEU,  '
      + '          DODCCATE, DODCCSLDU, DODCCSLD, DODCISC, DODCISCU, ARTIDPROV, ARTDESPROV,  '
      + '          UNMIDEQUIV, PUNTEQUIV, CNTEQUIV, DODCFTUM, TIPOADQ, CCOMERID, ACFREG,  '
      + '          DODCOBS, IMPTOT, IMPUNI, ODCUSER, PROV, TINID, GRARID, FAMID, SFAMID,  '
      + '          ODCANO, ODCMES, ODCDIA, ODCTRIM, ODCSEM, ODCANOMES, ODCSS, ODCAATRI,  '
      + '          ODCAASEM, ODCAASS, ODCFREG, ODCMMSS, PROVRUC, CLAUXID '
      + '     from LOG305 '
      + '    where CIAID='+quotedstr(dblcCIA.Text)
      + '      and ODCID='+quotedstr(dbeNReg.Text)
      + '    order by CIAID, ODCID, DODCID';
   DMLOG.cdsDOrdComp.Close;
   DMLOG.cdsDOrdComp.DataRequest(xSQL);
   DMLOG.cdsDOrdComp.Open;

   If DMLOG.wModo = 'M' Then
   Begin
      dblcdExits(dblcCIA);
      dblcdExits(dblcdProv);
      dblcdExits(dblcTMoneda);
      dblcdExits(dblcFPago);
      dblcdExits(dblcLEntrega);
      dblcdExits(dblcTipoCompra);
      xPriInser := '';

      xSQL := 'Select CIAID, ODCID, DODCID, RQSID, DRQSID, ARTID, '
         + '          DODCCNT, TIPOADQ, DODCOBS, FLAGUM, LOCID '
         + '     from LOG324 '
         + '    where CIAID='+quotedstr(dblcCIA.Text)
         + '      and ODCID='+quotedstr(dbeNReg.Text);
      DMLOG.cdsDODCxDRQS.Close;
      DMLOG.cdsDODCxDRQS.DataRequest(xSQL);
      DMLOG.cdsDODCxDRQS.Open;
      If dblcCIA.Text = '04' Then
         dedNProforma.Enabled := True;
   End;
   If DMLOG.wModo = 'A' Then
   Begin
      xPriInser := 'A';
      dbmObs.Width := 736;
      If DMLOG.cdsCia.RecordCount = 1 Then
      Begin
         DMLOG.cdsOrdComp.FieldByName('CIAID').Value := DMLOG.cdsCia.FieldByname('CIAID').AsString;
         dblcdExits(dblcCIA);
         dblcCia.Enabled := False;

         If dblcCIA.Text = '04' Then
            dedNProforma.Enabled := True;
         dbeNReg.SetFocus;
      End
      Else
      Begin
         dblcCia.Enabled := True;
         dblcCia.SetFocus;
      End;
   End;
   If DMLOG.cdsDOrdComp.RecordCount = 0 Then
   Begin
      dblcTipoCompra.Enabled := True;
   End
   Else
   Begin
      dblcTipoCompra.Enabled := False;
   End;
   xCrea := False;
   Screen.Cursor := crDefault;

   xSQL := 'Select A.CIAID, A.TINID, A.ARTID, A.GRARID, A.FAMID, A.SFAMID, A.ARTDES, A.ARTABR, '
      + '          A.UNMIDG, A.UNMIDU, A.ARTCONT, A.CUENTAID, A.FABID, A.ARTSPRO, A.ARTSCA, '
      + '          A.ARTPARA, A.ARTSNA, A.ARTPCU, A.ARTPCG, A.ARTPVU, A.ARTPVG, A.ARTFUC, '
      + '          A.TMONID, A.ARTCRGO, A.ARTACTIVO, A.ARTCNTG, A.ARTCNTU, A.ARTMNTG, A.ARTMNTU,'
      + '          A.ARTCPROU, A.ARTCPROG, A.ARTFUPRC, A.ARTNSER, A.ARTPRE, A.ARTFVEN, '
      + '          A.ARTDCTG, A.ARTDCTU, A.ARTLOTE, A.ARTIGV, A.ARTFUMV, A.CCUSER, A.CCFREG, '
      + '          A.CCHREG, A.ARTISC, A.ARTCODBAR, A.ARTVENTA, A.ARTFADQ, A.STKSMAX, A.STKSMIN,'
      + '          A.STKSPRE, A.STKSCPE, A.ARTCVIDA, A.FNSERIE, A.FLAGVAR, A.PROVUFMOV, '
      + '          A.ARTEST, A.ARTCOMVTA, A.ARTFLAGINC, A.MARCA, A.MODELO, A.COLOR, A.TIPART, '
      + '          A.PROV, A.CARART, A.OBSEQUIO, A.CONCESION, A.COSTOANT, A.CONSIGNACION, '
      + '          A.ART_IGV_EXO, A.CRITICO '
      + '     from TGE205 A,TGE152 B '
      + '    where A.CIAID=B.CIAID AND A.TINID=B.TINID AND NVL(B.HABILITADO,''S'')=''S'' '
      + '      and NVL(A.ARTEST,''H'')=''H'' ';
   DMLOG.cdsArti.Close;
   DMLOG.cdsArti.DataRequest(xSQL);
   DMLOG.cdsArti.Open;

   If DMLOG.wModo = 'A' Then
   Begin
      dblcLOC.LookupField := 'LOCID';
      dblcLOC.LookupTable := DMLOG.cdsLOC;
      dblcLOC.Selected.Clear;
   End;
   dblcLOC.Selected.Add('LOCID'#9'2'#9'Código'#9'F');
   dblcLOC.Selected.Add('LOCDES'#9'30'#9'Descripción'#9'F');

End;

Procedure TFRegOrdCD.ppHeaderBand4BeforePrint(Sender: TObject);
Var
   nCont: Integer;
Begin
   xSQL := 'Select distinct RQSID '
      + '     from LOG324 '
      + '    where CIAID=' + quotedstr(dblcCIA.Text)
      + '      and ODCID=' + quotedstr(DMLOG.cdsOrdComp.fieldbyName('ODCID').asString)
      + '      and DODCCNT > 0 '
      + '    order by RQSID';
   DMLOG.cdsLOG.Close;
   DMLOG.cdsLOG.DataRequest(xSQL);
   DMLOG.cdsLOG.Open;
   DMLOG.cdsLOG.First;
   pplReq1.Caption := '';
   pplReq2.Caption := '';
   pplReq3.Caption := '';
   pplReq4.Caption := '';
   nCont := 0;

   If DMLOG.cdsLOG.RecordCount = 0 Then
   Begin
      If (dblcCIA.text = '02') And (Length(TRIM(DMLOG.CdsQry.FieldByName('DOCREF').AsString)) > 0) Then
      Begin
         pplReq.Caption := 'REQUERIMIENTO';
         ppDBText11.DataField := 'DOCREF';
         ppDBText11.Font.Size := 11;
         ppDBText11.TextAlignment := taCentered;
      End;
   End;

   While Not DMLOG.cdsLOG.Eof Do
   Begin
      nCont := nCont + 1;
      If nCont = 1 Then
         pplReq1.Caption := DMLOG.cdsLOG.FieldByName('RQSID').AsString;
      If nCont = 2 Then
         pplReq2.Caption := DMLOG.cdsLOG.FieldByName('RQSID').AsString;
      If nCont = 3 Then
         pplReq3.Caption := DMLOG.cdsLOG.FieldByName('RQSID').AsString;
      If nCont = 4 Then
         pplReq4.Caption := DMLOG.cdsLOG.FieldByName('RQSID').AsString;
      DMLOG.cdsLOG.Next;
   End;

End;

Function TFRegOrdCD.RoundD(x: Double; D: Integer): Double;
// DESCRIPCION           : Redondea el número a la cantidad de decimales
//                         que se indica en el argumento
Var
   n: Extended;
Begin
   n := Power(10, d);
   x := x * n;
   Result := (int(x) + Int(Frac(x) * 2)) / n;
End;

Procedure TFRegOrdCD.OnOffVisar(Value: Boolean);
// DESCRIPCION           : Habilita el botón de Visar evaluando antes si
//                         el usuario tiene acceso a esa opción o no
Begin
   If Value = False Then
   Begin
      Z2bbtnVisado.Enabled := False;
      Exit;
   End;
   If (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) <> 'INICIAL') Or
      (DMLOG.cdsDOrdComp.RecordCount = 0) Then
   Begin
      Z2bbtnVisado.Enabled := False;
      Exit;
   End;

   xSQL := 'Select USERID, FRQ, FOC, FPU, FIT, FAP, MONTOMAX, MONTOMAXEXT, '
      + '          REQOC '
      + '     from TGE171 '
      + '    where USERID='+quotedstr(DMLOG.wUsuario);
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      If DMLOG.cdsQry.FieldByName('FOC').AsString = 'S' Then
      Begin
         xMontoVisar := DMLOG.cdsQry.fieldbyname('MONTOMAX').AsCurrency;
         Z2bbtnVisado.Enabled := True;
      End
      Else
      Begin
         Z2bbtnVisado.Enabled := False;
      End;
   End
   Else
   Begin
      Z2bbtnVisado.Enabled := False;
   End;
End;

Procedure TFRegOrdCD.Z2bbtnVisadoClick(Sender: TObject);
// DESCRIPCION           : Visa la orden de compra
Var
   xMonto: Double;
   xsMensaje: String;
Begin

   If dblcTipoCompra.Text = 'I' Then
   Begin
      If DMLOG.Valores(dbeImporte.Text) <> DMLOG.Valores(edtImporte.Text) Then
      Begin
         ShowMessage('El importe es diferente al RECIBO DEL PROVEEDOR....');
         exit;
      End;
   End;

   If DMLOG.fg_ValidaDatosProveedor(DMLOG.cdsOrdComp.FieldByName('CLAUXID').AsString, DMLOG.cdsOrdComp.FieldByName('PROV').AsString, xsMensaje) = False Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage(xsMensaje);
   End;

   If MessageDlg('Está seguro de Visar la Orden de Compra?', mtConfirmation, [mbOK, mbCancel], 0) = mrok Then
   Begin
      OnOffVisar(True);
      If dblcTMoneda.Text <> DMLOG.wTMonLoc Then
         xMonto := DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').AsFloat * strtoFloat(dbeTCambio.text)
      Else
         xMonto := DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').AsFloat;

      If xMonto > xMontoVisar Then
      Begin
         ShowMessage('No puede Visar la actual Orden de Compra,' + #13
            + ' ya que su monto máximo de Visación es :' + currtostr(xMontoVisar));
         exit;
      End;
      DMLOG.cdsOrdComp.edit;
      DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString := DMLOG.wUsuario;
      DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString := 'VISADO';
      DMLOG.cdsOrdComp.post;

      xSQL := 'Update LOG304 '
         + '      set ODCEST=' + quotedstr('VISADO') + ','
         + '          ODCVISADOR=' + quotedstr(DMLOG.wUsuario)
         + '    where CIAID=' + quotedstr(dblcCIA.Text)
         + '      and ODCID=' + quotedstr(DMLOG.cdsOrdComp.FieldByname('ODCID').AsString);
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al actualizar VISADOR en Orden de Compra');
         exit;
      End;
      Z2dbgDReqsIButton.Enabled := False;

      Z2bbtnGraba.Enabled := False;
      Z2bbtnVisado.Enabled := False;
      Z2bbtnAcepta.Enabled := True;

   End;
End;

Procedure TFRegOrdCD.Z2bbtnOrdenpagoClick(Sender: TObject);
Begin
   If (DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString <> 'ACEPTADO')
      And (DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString <> 'ATENDIDO')
      And (DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString <> 'PARCIAL')
      And (DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString <> 'DEPURADO') Then
   Begin
      ShowMessage('El estado de la OC no permite el registro de Ordenes de Pago');
      Exit;
   End;
   If DMLOG.cdsOrdComp.RecordCount > 0 Then
   Begin
      DMLOG.wModo := 'OC'; //que se está invocando desde la orden de compra
      FOrdenPago := TFOrdenPago.Create(Application); // LOG130.pas
   End
   Else
   Begin
      ShowMessage('No existe orden de Compra seleccionado');
      Exit;
   End;
End;

Procedure TFRegOrdCD.fg_RecuperaSubReporte;
Begin
   xSQL := ' Select LOG304.ODCTOTALG, '
      + '           LOG304.ORDPAGTOT, '
      + '           LOG304.ORDPAGPEN, '
      + '           LOG131.CIAID, '
      + '           LOG131.NUMORDPAG, '
      + '           LOG131.FECHA, '
      + '           LOG130.DOCID, '
      + '           (SELECT TGE110.DOCDES '
      + '              FROM TGE110 '
      + '             WHERE TGE110.DOCID = LOG130.DOCID '
      + '               AND TGE110.DOCMOD IN (' + QuotedStr('CXP') + ','
      +             QuotedStr('LOG') + ')) OP_DOCUMENTO_DES , '
      + '           LOG130.CPSERIE, '
      + '           LOG130.CPNODOC, '
      + '           LOG130.CPFEMIS, '
      + '           LOG130.TOTAL, '
// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
      + '           TGE105.BANCONOM, '
      + '           LOG130.BANCOTMONID, '
      + '           LOG130.BANCONUMCTA, '
      + '           LOG130.BANCOCCI, '
//          + '        CASE WHEN LOG304.ORDPAGPEN = 0 THEN ''COMPLETO'' ELSE '' '' END  ESTADO,'
      + '           case when abs(LOG304.ORDPAGPEN)>0.05 then '' '' else ''COMPLETO'' end ESTADO,'

      + '           (CASE WHEN LOG131.NUMORDPAG = (Select max(A.NUMORDPAG) '
// Fin HPC_201701_LOG
      + '                                            from LOG131 A '
      + '                                           where A.ODCCIAID = LOG131.ODCCIAID '
      + '                                             and A.ODCID = LOG131.ODCID) '
      + '                 THEN ' + QuotedStr('Ultima Orden de Pago')
      + '                 ELSE (CASE WHEN ABS(CXP301.CPSALORI) < 0.1 '
      + '                            THEN ' + QuotedStr('Documentos Pagados')
      + '                            ELSE ' + QuotedStr('Documentos Pendientes de Pago')
      + '                       END ) '
      + '            END) SECCION'
      + '      from LOG304, LOG130, LOG131, CXP301 '
// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
      + '          ,TGE105 '
// Fin HPC_201701_LOG
      + '     where LOG304.CIAID = LOG131.ODCCIAID '
// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
      + '       and LOG130.BANCOID = TGE105.BANCOID(+)   '
// Fin HPC_201701_LOG
      + '       and LOG304.ODCID = LOG131.ODCID '
      + '       and LOG130.CIAID = LOG131.CIAID '
      + '       and LOG130.NUMORDPAG = LOG131.NUMORDPAG '
      + '       and LOG130.ODCCIAID = LOG131.ODCCIAID '
      + '       and LOG130.ODCID = LOG131.ODCID '
      + '       and LOG130.CPCIAID = CXP301.CIAID(+) '
      + '       and LOG130.PROV = CXP301.PROV(+) '
      + '       and LOG130.DOCID = CXP301.DOCID(+) '
      + '       and LOG130.CPSERIE = CXP301.CPSERIE(+) '
      + '       and LOG130.CPNODOC = CXP301.CPNODOC(+) '
      + '       and LOG131.ESTADO = ' + QuotedStr('ACEPTADO')
      + '       and LOG130.CPESTTRA <> ' + QuotedStr('ANULADO')
      + '       and LOG304.CIAID = ' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
      + '       and LOG304.ODCID = ' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString)
      + '       and CXP301.CPESTADO(+)<>''E'' ';
   DMLOG.cdsReporte.Close;
   DMLOG.cdsReporte.DataRequest(xSQL);
   DMLOG.cdsReporte.Open;
   ppdbOrdenPagoPorOC.DataSource := DMLOG.dsReporte;
End;

Function TFRegOrdCD.fg_ExisteOrdenPago(wgCiaid, wgNumOrdenCompra: String): Boolean;
Begin
   xSQL := ' Select LOG131.CIAID, LOG131.NUMORDPAG, LOG131.ODCCIAID, LOG131.ODCID, '
      + '           LOG131.TMONID, LOG131.BASEIMP, LOG131.IGV, LOG131.TOTAL, '
      + '           LOG131.OBSERVACION, LOG131.FECHA, LOG131.ESTADO, LOG131.USUREG, '
      + '           LOG131.FECREG, LOG131.USUMOD, LOG131.FECMOD '
      + '      from LOG131 '
      + '     where LOG131.ODCCIAID = ' + QuotedStr(wgCiaid)
      + '       and LOG131.ODCID = ' + QuotedStr(wgNumOrdenCompra)
      + '       and LOG131.ESTADO <> ' + QuotedStr('ANULADO');
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      ShowMessage('Debe anular las Ordenes de Pago' + #13 + 'antes de Anular la Orden de Compra');
      Result := True;
      Exit;
   End;
   Result := False;
End;

Procedure TFRegOrdCD.dblcTipoAuxiliarExit(Sender: TObject);
Begin
   If dblcTipoAuxiliar.Text = '' Then
   Begin
      ShowMessage('Debe Ingresar el Tipo de Auxiliar del Proveedor');
      dblcTipoAuxiliar.SetFocus;
      Exit;
   End;
   xProv := dblcTipoAuxiliar.Text;
   xSQL := ' CLAUXID = ' + QuotedStr(dblcTipoAuxiliar.Text) + ' AND PROV = ' + QuotedStr(dblcdProv.Text);
   If (DMLOG.DisplayDescrip('prvTGE', 'TGE201', 'PROVDES', xSQL, 'PROVDES') = edtProv.Text) And (edtProv.Text <> '') Then
   Begin
      Exit;
   End;
   DMLOG.FiltraTabla(DMLOG.cdsProv, 'TGE201', 'PROV', 'PROV', 'ACTIVO = ' + QuotedStr('S') + ' AND CLAUXID = ' + QuotedStr(dblcTipoAuxiliar.Text));
   dblcdProv.Text := '';
   edtProv.Text := '';
   DMLOG.cdsOrdComp.fieldbyName('PROV').asString := '';
   DMLOG.cdsOrdComp.fieldbyName('PROVDES').asString := '';
End;

Procedure TFRegOrdCD.dblcLOCExit(Sender: TObject);
Begin
   xSQL := 'Select A.CIAID, A.FECPERIODO, A.NUMCLISUM, A.NUMREC, A.FECINIFAC, A.FECFINFAC, '
      + '          A.FECPAGO, A.ESTADO, A.IMPORTE, A.OBSERVACION, A.FECVENREC, A.FECRECREC, '
      + '          A.FECREGREC, A.USUARIO, A.CODUNICO, A.UBICACION, '
      + '          A.USRANULA, A.FECANULA, A.FECOC, A.FECOP, A.FECCP, A.FECCJ, A.SERIE, '
      + '          A.KEYRECIBO, DESCRIPCION,USRMODREC, FECMODREC, NETO, IGV, NUMREF, TIPCAM, TIPMON, B.CODPROV, '
      + '          FECEMIREC '
      + '     From LOG_MOV_SERVICIOS A, LOG_MAE_SERVICIOS B '
      + '    Where A.ESTADO=''I'' '
      + '      and A.CIAID=B.CIAID '
      + '      and A.CODUNICO=B.CODUNICO '
      + '      and B.LOCID='+quotedstr(dblcLOC.Text);
   DMLOG.cdsSerPend.Close;
   DMLOG.cdsSerPend.DataRequest(xSQL);
   DMLOG.cdsSerPend.Open;
   dbServicio.LookupTable := DMLOG.cdsSerPend;
   dbServicio.LookupField := 'KEYRECIBO';
   dbServicio.Selected.Add('NUMCLISUM'#9'15'#9'Cli/Sum'#9'F');
   dbServicio.Selected.Add('DESTIPSER'#9'20'#9'Servicio'#9'F');
   dbServicio.Selected.Add('DESCRIPCION'#9'20'#9'Descripcion'#9'F');
   dbServicio.Selected.Add('IMPORTE'#9'6'#9'Importe'#9'F');
   dbServicio.Selected.Add('FECVENREC'#9'10'#9'Vencimiento'#9'F');
   dbServicio.Selected.Add('NUMREC'#9'10'#9'Documento'#9'F');
End;

Procedure TFRegOrdCD.dbServicioExit(Sender: TObject);
Begin
   If DMLOG.cdsSerPend.Locate('KEYRECIBO', VarArrayOf([DMLOG.cdsSerPend.FieldByname('KEYRECIBO').asstring]), []) Then
   Begin
      edtServicio.Text := DMLOG.cdsSerPend.FieldByName('DESCRIPCION').AsString;
      edtImporte.Text := DMLOG.cdsSerPend.FieldByName('IMPORTE').AsString;
      edtImporte.Text := FormatFloat('###,###.00', DMLOG.Valores(edtImporte.Text));
   End
   Else
   Begin
      edtServicio.Text := '';
      edtImporte.Text := '';
   End;

End;

Procedure TFRegOrdCD.CbTipOrdCompraExit(Sender: TObject);
Begin
   lblReferencia.Visible := False;
   edtNumReferencia.Visible := False;
   EdtDescripReferencia.Visible := False;

// Orden de Comopra Directa
   If CbTipOrdCompra.ItemIndex = 0 Then
   Begin
      dblcdProv.Enabled := True;
      dblcTipoAuxiliar.Enabled := True;
      dblcdProv.Text := '';
      dblcTipoAuxiliar.Text := '';
      edtProv.Text := '';
      dblcdProv.Color := clWindow;
      dblcTipoAuxiliar.Color := clWindow;
      edtProv.Color := clWindow;
      FOrdendeCompra.wTipoOC := 'xOCDirecta';
   End;

// Orden de Compra por Cotización
   If CbTipOrdCompra.ItemIndex = 1 Then
   Begin
    //Cuadro comparativo
      FOrdendeCompra.wTipoOC := 'xCotizacion';
      xSQL := 'Select CIAID, SCCID, NUMCC, FECHA,'
         + '        case when PROFIDGAN is not null then PROFIDGAN else PROFIDSUG end PROFORMA,'
         + '        case when PROFIDGAN is not null then ''GANADORA'' else ''SUGERIDA'' end ESTADO,OBSERVACION,USUREG '
         + '     from LOG341 '
         + '    Where Estcc=''ACEPTADO'' AND NVL(ODCID,0)=0 '
         + '      and length(trim(case when PROFIDGAN is not null then PROFIDGAN else PROFIDSUG END))>0 '
         + '    Order by CIAID,NUMCC DESC,FECHA DESC';
      DMLOG.cdsProformaLista.Close;
      DMLOG.cdsProformaLista.DataRequest(xSQL);
      DMLOG.cdsProformaLista.Open;
      Try
         FreferenciaOT := TFreferenciaOT.create(self);
         FreferenciaOT.ShowModal;
         VSCCID := DMLOG.cdsProformaLista.FieldByname('SCCID').AsString;
      //Proforma cabecera
         xSQL := ' Select CIAID, SCCID, PROV, FPAGOID, TMONID, PROFID, PROFFEMI, PROFTEN, '
            + '           PROFVALID, PROFTCAMB, PROFIXFLE, PROFIXTCC, PROFIXTD, PROFIXTI, '
            + '           PROFEST, PROFFATE, PROFOBS, PROFUSER, PROFFREG, PROFHREG, PROFANO, '
            + '           PROFMM, PROFDD, PROFTRI, PROFSEM, PROFSS, PROFANOMM, PROFAATRI, '
            + '           PROFAASEM, PROFAASS, FLAGVAR, PROFNPROV, PROFTOTALG, PROFTIMP, '
            + '           PROFTTIMPU, PROFEVAL, PROFCONCOM, PROFGARAN, PROFFARDMA, PROFISC, '
            + '           FAUTOGEN, TRQSID, TIPOADQ, ODCID, PROFGENER, PROVDES, PROVRUC, '
            + '           PROFENTR, CLAUXID, GARANTIAID, FLAGCCOM '
            + '      From LOG312 '
            + '     Where CIAID='+quotedstr(dblcCIA.text)
            + '       And PROFID='+quotedstr(edtNumReferencia.Text);
         DMLOG.cdsQry.Close;
         DMLOG.cdsQry.DataRequest(xSQL);
         DMLOG.cdsQry.Open;
      //--Busca el Proveedor
         DMLOG.cdsProv.Locate('PROV', VarArrayOf([DMLOG.cdsQry.FieldByname('PROV').AsString]), []);
         dblcdProv.Text := DMLOG.cdsQry.FieldByname('PROV').AsString;
         dblcTipoAuxiliar.Text := DMLOG.cdsProv.FieldByname('CLAUXID').AsString;
         edtProv.Text := DMLOG.cdsProv.FieldByname('PROVDES').AsString;
         DMLOG.cdsOrdComp.FieldByName('PROV').AsString := DMLOG.cdsQry.FieldByname('PROV').AsString;
         DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString := DMLOG.cdsProv.FieldByname('PROVDES').AsString;
         dblcdProv.Enabled := False;
         dblcTipoAuxiliar.Enabled := False;
         dblcdProv.Color := clInfoBk;
         dblcTipoAuxiliar.Color := clInfoBk;
         edtProv.Color := clInfoBk;

         lblReferencia.Visible := True;
         edtNumReferencia.Visible := True;
         EdtDescripReferencia.Visible := True;

         edtnumRequerimiento.Text := '';
         edtnumRequerimiento.Visible := False;
         edtnumRequerimiento.Enabled := False;
         dedNProforma.Visible := True;
         DMLOG.cdsQry.Close;
      Finally
         FreferenciaOT.Free;
      End;
   End;

// Orden de Compra por Requerimiento de Usuario
   If CbTipOrdCompra.ItemIndex = 2 Then
   Begin
      FOrdendeCompra.wTipoOC := 'xRequerimiento';
      dblcdProv.Enabled := True;
      dblcTipoAuxiliar.Enabled := True;
      dblcdProv.Text := '';
      dblcTipoAuxiliar.Text := '';
      edtProv.Text := '';
      dblcdProv.Color := clWindow;
      dblcTipoAuxiliar.Color := clWindow;
      edtProv.Color := clWindow;
   End;

End;

//Procedimiento que actualiza el Grid con los datos de la Proforma

Procedure TFRegOrdCD.ActualizaGrid(vCiaid, vNumref: String);
Var
   SODCID: String;
   vWhere: String;
Begin

 //Seleciona la Proforma
   xSQL := 'Select CIAID, PROFID, ARTID, UNMIDG, UNMIDU, DPROFID, DPROFCNTG, '
      + '          DPROFCNTU, DPROFPUNG, DPROFPUNU, DPROFDSCTO, DPROFIMP, DPROFIMPU, '
      + '          DPROFMARK, DPROFEVAL, DPROFCONCOM, DPROFGARAN, DPROFGARDMA, DFPAGOID, '
      + '          DPROFTEN, DPROFVALID, DPROFLAGUM, DPROFISC, ODCID, DPROFPROV, DPROFPRVD, '
      + '          DPROFARTD, TRQSID, TIPOADQ, DPROFOBS, DPROFFREG, PROFUSER, TINID, GRARID, '
      + '          FAMID, SFAMID, PROFANO, PROFMES, PROFDIA, PROFTRIM, PROFSEM, PROFANOMES, '
      + '          PROFSS, PROFAATRI, PROFAASEM, PROFAASS, SCCID, DPROFTIPCCOM, CLAUXID, '
      + '          ARTIDMAE '
      + '     from LOG313 '
      + '    where CIAID='+quotedstr(vCiaid)
      + '      and PROFID='+quotedstr(vNumref);
   Dmlog.cdsListaTx.Close;
   Dmlog.cdsListaTx.DataRequest(xSQL);
   Dmlog.cdsListaTx.Open;

  //Verifica Articulos que no estan en el Maestro y los pone en un cds de alerta para corregirlos
  //Es solo para Tipo de Compra Articulos "C"
   DMLOG.cdsListaTx.First;
   CDSFALTINFO.EmptyDataSet;
   If dblcTipoCompra.Text = 'C' Then
   Begin
      While Not DMLOG.cdsListaTx.Eof Do
      Begin
    //Tomo el codigo del mestro atachado por el usuario
         If Length(TRim(Dmlog.cdsListaTx.FieldByname('ArtidMae').AsString)) > 0 Then
            wSQL := 'CIAID=' + QuotedStr(dblcCIA.Text) + ' AND ARTID=' + QuotedStr(Dmlog.cdsListaTx.FieldByname('ArtidMae').AsString)
         Else
            wSQL := 'CIAID=' + QuotedStr(dblcCIA.Text) + ' AND ARTID=' + QuotedStr(Dmlog.cdsListaTx.FieldByname('Artid').AsString);
         DMLOG.DisplayDescrip('prvSQL', 'TGE205', 'ARTID, ARTDES, TINID, GRARID, FAMID, SFAMID, UNMIDG', wSQL, 'ARTID');

         If DMLOG.cdsQry.RecordCount = 0 Then
         Begin
            CDSFALTINFO.Insert;
            CDSFALTINFO.FieldByName('CIAID').AsString := Trim(dblcCIA.Text);
            CDSFALTINFO.FieldByName('PROFID').AsString := Trim(edtNumReferencia.Text);
            CDSFALTINFO.FieldByName('VARTID').AsString := Dmlog.cdsListaTx.FieldByname('Artid').AsString;
            CDSFALTINFO.FieldByName('VARTDES').AsString := Dmlog.cdsListaTx.FieldByname('dProfObs').AsString;
         End;
         DMLOG.cdsListaTx.Next;
      End;
   End;

   CDSFALTINFO.First;
   If CDSFALTINFO.RecordCount > 0 Then
   Begin
      pnlAdvertencias.Top := 148;
      pnlAdvertencias.Left := 226;
      pnlAdvertencias.Visible := True;
      pnlCabecera.Enabled := False;
      pnlDetalleG.Enabled := False;
      Z2bbtnRegresaClick(Self);
      Exit;
   End
   Else
   Begin
      pnlAdvertencias.Visible := False;
      pnlCabecera.Enabled := True;
      pnlDetalleG.Enabled := True;
   End;

   DMLOG.cdsListaTx.First;
   While Not DMLOG.cdsListaTx.Eof Do
   Begin
      If Length(trim(Dmlog.cdsListaTx.FieldByname('ArtidMae').AsString)) > 0 Then
         vWhere := ' Artid='+quotedstr(DMLOG.cdsListaTx.FieldByname('ARTIDMAE').AsString)
      Else
         vWhere := ' Artid='+quotedstr(DMLOG.cdsListaTx.FieldByname('ARTID').AsString);

      xSQL := 'Select Count(1) Registro '
         + '     From LOG305 '
         + '    Where CIAID=' + quotedstr(dblcCIA.Text)
         + '      and ODCID=' + quotedstr(dbeNReg.Text)
         + '      and ' + vWhere
         + '      and nvl(ODCEST,''INICIAL'')<>''ANULADO'' ';
      DMLOG.cdsQry.Close;
      DMLOG.cdsQry.DataRequest(xSQL);
      DMLOG.cdsQry.Open;
      If DMLOG.cdsQry.FieldByname('Registro').Asinteger > 0 Then
      Begin
         DMLOG.cdsQry.Close;
         Break;
      End;

      If Length(TRim(Dmlog.cdsListaTx.FieldByname('ArtidMae').AsString)) > 0 Then
         wSQL := 'CIAID=' + QuotedStr(dblcCIA.Text) + ' AND ARTID=' + QuotedStr(Dmlog.cdsListaTx.FieldByname('ArtidMae').AsString)
      Else
         wSQL := 'CIAID=' + QuotedStr(dblcCIA.Text) + ' AND ARTID=' + QuotedStr(Dmlog.cdsListaTx.FieldByname('Artid').AsString);
      DMLOG.DisplayDescrip('prvSQL', 'TGE205', 'ARTID, ARTDES, TINID, GRARID, FAMID, SFAMID, UNMIDG', wSQL, 'ARTID');

      DMLOG.cdsDOrdComp.Insert;
      DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString := dblcCIA.Text;
      DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString := dbeNReg.Text;
      DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString := Dmlog.cdsListaTx.FieldByname('Dprofid').AsString;
      If dblcTipoCompra.Text = 'C' Then
      Begin
         DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString := Dmlog.cdsQry.FieldByname('Artid').AsString;
         DMLOG.cdsDOrdComp.FieldByName('TINID').AsString := Dmlog.cdsQry.FieldByname('TINID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('GRARID').AsString := Dmlog.cdsQry.FieldByname('GRARID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('FAMID').AsString := Dmlog.cdsQry.FieldByname('FAMID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('SFAMID').AsString := Dmlog.cdsQry.FieldByname('SFAMID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString := Dmlog.cdsQry.FieldByname('UNMIDG').AsString;
         DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString := Dmlog.cdsQry.FieldByname('Artdes').AsString;
      End
      Else
      Begin
         DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString := Dmlog.cdsListaTx.FieldByname('Artid').AsString;
         DMLOG.cdsDOrdComp.FieldByName('TINID').AsString := Dmlog.cdsListaTx.FieldByname('TINID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('GRARID').AsString := Dmlog.cdsListaTx.FieldByname('GRARID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('FAMID').AsString := Dmlog.cdsListaTx.FieldByname('FAMID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('SFAMID').AsString := Dmlog.cdsListaTx.FieldByname('SFAMID').AsString;
         DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString := Dmlog.cdsListaTx.FieldByname('UNMIDG').AsString;
         DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString := Dmlog.cdsListaTx.FieldByname('DPROFOBS').AsString;
      End;
      DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString := Dmlog.cdsListaTx.FieldByname('DPROFCNTG').AsString;
      DMLOG.cdsDOrdComp.FieldByName('DODCCSLD').AsString := Dmlog.cdsListaTx.FieldByname('DPROFCNTG').AsString;
      DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsString := Dmlog.cdsListaTx.FieldByname('DPROFPUNG').AsString;
      DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsString := '0.00';
      DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsString := FloatToStr(Dmlog.cdsListaTx.FieldByname('DPROFCNTG').AsFloat * Dmlog.cdsListaTx.FieldByname('DPROFPUNG').AsFloat);
      DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString := wIGV;
      DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsString := Format('%0.5f', [DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat + (DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat * DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsFloat / 100)]);
      DMLOG.cdsDOrdComp.FieldByName('IMPUNI').AsString := '10';
      DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsString := dbeISC.Text;
      DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString := dblcTipoCompra.Text;
      DMLOG.cdsDOrdComp.FieldByName('CCOMERID').asString := dblcFPago.Text;
      DMLOG.cdsDOrdComp.FieldByName('PROV').asString := dblcdProv.Text;

      If trim(dbecodprov.Text) <> '' Then
         DMLOG.cdsDOrdComp.FieldByName('ARTIDPROV').AsString := trim(dbeCodProv.Text)
      Else
         DMLOG.cdsDOrdComp.FieldByName('ARTIDPROV').Clear;

      If trim(dbeDescProv.Text) <> '' Then
         DMLOG.cdsDOrdComp.FieldByName('ARTDESPROV').AsString := trim(dbeDescProv.Text)
      Else
         DMLOG.cdsDOrdComp.FieldByName('ARTDESPROV').Clear;
      If trim(dblcUMEquiv.Text) <> '' Then
      Begin
         DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').AsString := trim(dblcUMEquiv.Text);
         DMLOG.cdsDOrdComp.FieldByName('PUNTEQUIV').AsString := trim(dbePUEquiv.Text);
         DMLOG.cdsDOrdComp.FieldByName('CNTEQUIV').AsString := trim(dbeCantEquiv.Text);
      End
      Else
      Begin
         DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').Clear;
         DMLOG.cdsDOrdComp.FieldByName('PUNTEQUIV').Clear;
         DMLOG.cdsDOrdComp.FieldByName('CNTEQUIV').Clear;
      End;
      DMLOG.cdsDOrdComp.Post;

      OnOffDetalle(True); // activar detalle
      pnlDetalleA.Visible := False;

      CalcTotal(Nil);
      DMLOG.cdsListaTx.Next;
   End;

End;

Procedure TFRegOrdCD.BitBtn5Click(Sender: TObject);
Begin
   pnlAdvertencias.Visible := False;
   pnlCabecera.Enabled := True;
   pnlDetalleG.Enabled := True;
End;

Procedure TFRegOrdCD.BitBtn2Click(Sender: TObject);
Begin
   xSQL := 'Select CIAID, ARTID, ARTDES '
      + '     from TGE205 '
      + '    Where CIAID=' + quotedstr(dblcCIA.Text)
      + '      and ARTEST=''H'' ';
   DMLOG.cdsArti.Close;
   DMLOG.cdsArti.DataRequest(xSQL);
   DMLOG.cdsArti.Open;

   DMLOG.DCOM1.AppServer.IniciaTransaccion;
   Try
      fSelectCodArticulo := TfSelectCodArticulo.create(self);
      fSelectCodArticulo.edtArtid.Text := CDSFALTINFO.FieldByName('vArtid').AsString;
      fSelectCodArticulo.edtArtdes.Text := CDSFALTINFO.FieldByName('vArtdes').AsString;
      fSelectCodArticulo.ShowModal;
      If fSelectCodArticulo.vAcepta = 'S' Then
      Begin
         If Length(Trim(fSelectCodArticulo.EdtArtidMae.Text)) = 0 Then
         Begin
            ShowMessage('No selecionó Artículo, inténtelo nuevamente..');
            Exit;
         End;
    //VERIFICA QUE NO ESTE DUPLICADO
         xSQL := 'Select CIAID, PROFID, ARTID, UNMIDG, UNMIDU, DPROFID, DPROFCNTG, '
            + '           DPROFCNTU, DPROFPUNG, DPROFPUNU, DPROFDSCTO, DPROFIMP, DPROFIMPU, '
            + '          DPROFMARK, DPROFEVAL, DPROFCONCOM, DPROFGARAN, DPROFGARDMA, DFPAGOID, '
            + '          DPROFTEN, DPROFVALID, DPROFLAGUM, DPROFISC, ODCID, DPROFPROV, DPROFPRVD, '
            + '          DPROFARTD, TRQSID, TIPOADQ, DPROFOBS, DPROFFREG, PROFUSER, TINID, GRARID, '
            + '          FAMID, SFAMID, PROFANO, PROFMES, PROFDIA, PROFTRIM, PROFSEM, PROFANOMES, '
            + '          PROFSS, PROFAATRI, PROFAASEM, PROFAASS, SCCID, DPROFTIPCCOM, CLAUXID, '
            + '          ARTIDMAE '
            + '     From LOG313 '
            + '    Where CIAID='+quotedstr(dblcCIA.Text)
            + '      And PROFID='+quotedstr(Trim(edtNumReferencia.Text))
            + '      And ARTIDMAE is not null '
            + '      And ARTIDMAE='+quotedstr(Trim(fSelectCodArticulo.EdtArtidMae.Text));
         DMLOG.cdsQry.Close;
         DMLOG.cdsQry.DataRequest(xSQL);
         DMLOG.cdsQry.Open;
         If DMLOG.cdsQry.RecordCount > 0 Then
         Begin
            ShowMessage('Artículo duplicado, verifique');
            exit;
         End;
   //ACTUALIZA LA PROFROMA
         xSQL := 'Update LOG313 '
            + '      set ARTIDMAE=' + quotedstr(fSelectCodArticulo.EdtArtidMae.Text)
            + '    Where CIAID=' + quotedstr(dblcCIA.Text)
            + '      and PROFID=' + quotedstr(trim(edtNumReferencia.Text))
            + '      and ARTID=' + quotedstr(CDSFALTINFO.FieldByName('VARTID').AsString);
         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            Screen.Cursor := crDefault;
            ShowMessage('Error al actualizar Detalle de Proforma (LOG313 - ARTÍCULOS DE COTIZACIÓN GANADORA)');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
         Z2bbtnOKClick(Self);
      End;
   Except
      fSelectCodArticulo.Free;
      Screen.Cursor := crDefault;
      ShowMessage('Error al actualizar Detalle de Proforma - ARTÍCULOS DE COTIZACIÓN NO MATRICULADOS');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      exit;
   End;

   DMLOG.DCOM1.AppServer.GrabaTransaccion;

End;

Procedure TFRegOrdCD.error;
Var
   vcero: currency;
Begin
   vcero := 0;
   vcero := vcero + 1 / StrToInt(dbeFlete.Text);
   vcero := vcero + 1 / StrToInt(dbeFlete.Text);
   If vcero < 0 Then
   Begin
      ShowMessage('error');
   End;
End;

Procedure TFRegOrdCD.ActualizaLOG305;
Begin
   If DMLOG.cdsDOrdComp.State In [dsEdit, dsInsert] Then
      DMLOG.cdsDOrdComp.Post;

   xSQL := ' Select CIAID, ODCID, DODCID, ARTID '
      + '      From LOG305 '
      + '     Where CIAID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString)
      + '       And ODCID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString)
      + '       And DODCID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString)
      + '       And ARTID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString);
   DMLOG.cdsQry10.Close;
   DMLOG.cdsQry10.DataRequest(xSQL);
   DMLOG.cdsQry10.Open;
// INICIO HPC_201804_LOG
// Se cambia a Procedimientos almacenados
   If DMLOG.cdsQry10.RecordCount = 0 Then
   Begin
(*
      xSQL := ' Insert Into LOG305(CIAID, ODCID, DODCID, ARTID, UNMID, DODCCNT, DODCPUN, '
         + '                       DODCDSCTO, DODCIMP, DODCIMPU, IMPTOT, IMPUNI, DODCISCU,'
         + '                       DODCOBS, TIPOADQ, CCOMERID, PROV, DODCCSLD, ODCEST, '
         + '                       DODCCATE, TINID, GRARID, DODCCSLDU,'
         + '                       FAMID, SFAMID, ODCANO, ODCMES, ODCDIA, ODCANOMES, ODCTRIM, '
         + '                       ODCSEM, ODCSS, ODCAATRI, ODCAASEM, ODCAASS, ODCUSER, '
         + '                       ARTIDPROV, ARTDESPROV, UNMIDEQUIV, PUNTEQUIV, CNTEQUIV,'
         + '                       CLAUXID, ODCFREG) '
         + '    Values('+quotedstr(DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('IMPUNI').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('CCOMERID').asString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('PROV').asString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCSLD').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCEST').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCATE').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('TINID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('GRARID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCSLDU').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('FAMID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('SFAMID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCANO').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCMES').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCDIA').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCANOMES').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCTRIM').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCSEM').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCSS').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCAATRI').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCAASEM').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCAASS').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCUSER').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ARTIDPROV').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ARTDESPROV').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('PUNTEQUIV').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('CNTEQUIV').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldbyName('CLAUXID').AsString) + ','
         + '             sysdate)';
*)
      xSQL := ' CALL SP_LOG_ING_OCOMPRA_DET('
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('IMPUNI').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('CCOMERID').asString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('PROV').asString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCSLD').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCEST').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCATE').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('TINID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('GRARID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCSLDU').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('FAMID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('SFAMID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCANO').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCMES').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCDIA').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCANOMES').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCTRIM').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCSEM').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCSS').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCAATRI').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCAASEM').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCAASS').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCUSER').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ARTIDPROV').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ARTDESPROV').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('PUNTEQUIV').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('CNTEQUIV').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldbyName('CLAUXID').AsString) + ' ) ';

   End
   Else
   Begin
(*
      xSQL := 'Update LOG305 '
         + '      Set UNMID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString) + ','
         + '          DODCCNT=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString) + ','
         + '          DODCPUN=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsString) + ','
         + '          DODCDSCTO=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsString) + ','
         + '          DODCIMP=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsString) + ','
         + '          DODCIMPU=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString) + ','
         + '          IMPTOT=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsString) + ','
         + '          IMPUNI=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('IMPUNI').AsString) + ','
         + '          DODCISCU=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsString) + ','
         + '          DODCOBS=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString) + ','
         + '          TIPOADQ=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString) + ','
         + '          CCOMERID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('CCOMERID').asString) + ','
         + '          PROV=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('PROV').asString) + ','
         + '          DODCCSLD=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCSLD').AsString) + ','
         + '          ODCEST=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCEST').AsString) + ','
         + '          DODCCATE=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCATE').AsString) + ','
         + '          TINID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('TINID').AsString) + ','
         + '          GRARID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('GRARID').AsString) + ','
         + '          DODCCSLDU=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCSLDU').AsString) + ','
         + '          FAMID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('FAMID').AsString) + ','
         + '          SFAMID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('SFAMID').AsString) + ','
         + '          ODCANO=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCANO').AsString) + ','
         + '          ODCMES=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCMES').AsString) + ','
         + '          ODCDIA=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCDIA').AsString) + ','
         + '          ODCANOMES=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCANOMES').AsString) + ','
         + '          ODCTRIM=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCTRIM').AsString) + ','
         + '          ODCSEM=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCSEM').AsString) + ','
         + '          ODCSS=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCSS').AsString) + ','
         + '          ODCAATRI=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCAATRI').AsString) + ','
         + '          ODCAASEM=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCAASEM').AsString) + ','
         + '          ODCAASS=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCAASS').AsString) + ','
         + '          ODCUSER=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCUSER').AsString) + ','
         + '          ARTIDPROV=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ARTIDPROV').AsString) + ','
         + '          ARTDESPROV=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ARTDESPROV').AsString) + ','
         + '          UNMIDEQUIV=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').AsString) + ','
         + '          PUNTEQUIV=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('PUNTEQUIV').AsString) + ','
         + '          CNTEQUIV=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('CNTEQUIV').AsString) + ','
         + '          CLAUXID=' + quotedstr(DMLOG.cdsDOrdComp.FieldbyName('CLAUXID').AsString) + ','
         + '          ODCFREG=SYSDATE '
         + '    Where CIAID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString)
         + '      And ODCID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString)
         + '      And DODCID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString)
         + '      And ARTID=' + quotedstr(DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString);
*)
      xSQL := ' CALL SP_LOG_UPD_OCOMPRA_DET('
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('IMPUNI').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('CCOMERID').asString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('PROV').asString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCSLD').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCEST').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCATE').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('TINID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('GRARID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('DODCCSLDU').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('FAMID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('SFAMID').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCANO').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCMES').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCDIA').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCANOMES').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCTRIM').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCSEM').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCSS').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCAATRI').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCAASEM').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCAASS').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ODCUSER').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ARTIDPROV').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('ARTDESPROV').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('PUNTEQUIV').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldByName('CNTEQUIV').AsString) + ','
         +               quotedstr(DMLOG.cdsDOrdComp.FieldbyName('CLAUXID').AsString) + ' ) ';
   End;
// Fin HPC_201804_LOG
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      Screen.Cursor := crDefault;
      ShowMessage('Error al Actualizar Detalle de Orden de Compra (LOG305)');
      xSigueGrab := False;
      exit;
   End;
End;

Procedure TFRegOrdCD.ActualizaLOG304;
Var
   xTipoOC: String;
Begin
   If FOrdendeCompra.wTipoOC = 'xOCDirecta' Then
      xTipoOC := 'D'
   Else
      If FOrdendeCompra.wTipoOC = 'xCotizacion' Then
         xTipoOC := 'C'
      Else
         If FOrdendeCompra.wTipoOC = 'xProforma' Then
            xTipoOC := 'P'
         Else
            If FOrdendeCompra.wTipoOC = 'xRequerimiento' Then
               xTipoOC := 'R'
            Else
               If length(trim(DMLOG.cdsOrdComp.FieldByName('PROFID').AsString)) = 0 Then
                  xTipoOC := 'R'
               Else
                  xTipoOC := 'P';
   DMLOG.cdsOrdComp.Edit;
   DMLOG.cdsOrdComp.FieldbyName('OCTIP').AsString := xTipoOC;
   DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString := 'INICIAL';
   DMLOG.cdsOrdComp.FieldbyName('ODCUSER').AsString := DMLOG.wUsuario;
   DMLOG.cdsOrdComp.Post;

   xSQL := 'Select CIAID,ODCID '
      + '     From LOG304 '
      + '    Where CIAID=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
      + '      And ODCID=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);
   DMLOG.cdsQry10.Close;
   DMLOG.cdsQry10.DataRequest(xSQL);
   DMLOG.cdsQry10.Open;
// Inicio HPC_201804_LOG
// Se cambia el código a Procedimientos almacenados
   If DMLOG.cdsQry10.RecordCount = 0 Then
   Begin
(*
      xSQL := 'Insert Into LOG304(CIAID, ODCID, ODCOBS, DOCREF, CLAUXID, ODCEST, ODCTOTALG, '
         + '                      ODCIXTCC, ODCTTIMPU, ODCIXTD, ODCIXFLE, ODCUSER, OCTIP, '
         + '                      ODCANO, ODCMM, ODCDD, ODCANOMM, ODCTRI, ODCSEM, ODCSS, '
         + '                      ODCAATRI, ODCAASEM, ODCAASS, ODCFREG, ODCHREG, PROFID, '
         + '                      ODCVISADOR, OCVISFREG, OCVISHREG, ORDPAGPEN, ODCACEPFREG, '
         + '                      ODCACEPHREG, ODCTOTALISC, ODCTCAMB, PROVDES, PROV, ODCFATE, '
         + '                      OCCOLOCAC, OCCOLOFREG, OCCOLOHREG, ODCFEMI, ODCTEN, ODCVALID, '
         + '                      TMONID, CCOMERID, LGECID, NUMREQUSU, TIPOADQ) '
         + '   Values('+quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').asString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.fieldbyName('ODCID').asString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.fieldbyname('ODCOBS').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('DOCREF').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('CLAUXID').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').AsFloat) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCUSER').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('OCTIP').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCANO').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCMM').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCDD').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCANOMM').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCTRI').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCSEM').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCSS').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCAATRI').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCAASEM').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCAASS').AsString) + ', '
         + '            trunc(SysDate),'
         + '            SysDate,'
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('PROFID').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString) + ', '
         + '            trunc(SysDate),'
         + '            SysDate,'
         +              FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ORDPAGPEN').AsFloat) + ', '
         + '            trunc(SysDate),'
         + '            SysDate,'
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCTOTALISC').AsString) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.fieldbyName('ODCTCAMB').AsFloat) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('PROV').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCFATE').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('OCCOLOCAC').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('OCCOLOFREG').AsString) + ', '
         + '            SysDate,'
         +              quotedstr(DMLOG.cdsOrdComp.fieldbyName('ODCFEMI').AsString) + ', '
         +              quotedstr(IntToStr(DMLOG.cdsOrdComp.fieldbyName('ODCTEN').asInteger)) + ', '
         +              quotedstr(IntToStr(DMLOG.cdsOrdComp.fieldbyName('ODCVALID').asInteger)) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('TMONID').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('CCOMERID').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('LGECID').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('NUMREQUSU').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('TIPOADQ').AsString) + ')';
*)
      xSQL := ' CALL SP_LOG_ING_OCOMPRA_CAB1('
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').asString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.fieldbyName('ODCID').asString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.fieldbyname('ODCOBS').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('DOCREF').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('CLAUXID').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').AsFloat) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCUSER').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('OCTIP').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCANO').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCMM').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCDD').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCANOMM').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCTRI').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCSEM').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCSS').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCAATRI').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCAASEM').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCAASS').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('PROFID').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ORDPAGPEN').AsFloat) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCTOTALISC').AsString) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.fieldbyName('ODCTCAMB').AsFloat) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('PROV').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCFATE').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('OCCOLOCAC').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('OCCOLOFREG').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.fieldbyName('ODCFEMI').AsString) + ', '
         +              quotedstr(IntToStr(DMLOG.cdsOrdComp.fieldbyName('ODCTEN').asInteger)) + ', '
         +              quotedstr(IntToStr(DMLOG.cdsOrdComp.fieldbyName('ODCVALID').asInteger)) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('TMONID').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('CCOMERID').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('LGECID').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('NUMREQUSU').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('TIPOADQ').AsString)
         +')' ;

   End
   Else
   Begin
(*
      xSQL := 'Update LOG304 '
         + '      Set CIAID=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').asString) + ', '
         + '          ODCID=' + quotedstr(DMLOG.cdsOrdComp.fieldbyName('ODCID').asString) + ', '
         + '          ODCOBS=' + quotedstr(DMLOG.cdsOrdComp.fieldbyname('ODCOBS').AsString) + ', '
         + '          DOCREF=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('DOCREF').AsString) + ', '
         + '          CLAUXID=' + quotedstr(DMLOG.cdsOrdComp.FieldbyName('CLAUXID').AsString) + ', '
         + '          ODCEST=' + quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) + ', '
         + '          ODCTOTALG=' + FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').AsFloat) + ','
         + '          ODCIXTCC=' + FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat) + ','
         + '          ODCTTIMPU=' + FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat) + ','
         + '          ODCIXTD=' + FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat) + ','
         + '          ODCIXFLE=' + FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat) + ','
         + '          ODCUSER=' + quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCUSER').AsString) + ', '
         + '          OCTIP=' + quotedstr(DMLOG.cdsOrdComp.FieldbyName('OCTIP').AsString) + ', '
         + '          ODCANO=' + quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCANO').AsString) + ', '
         + '          ODCMM=' + quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCMM').AsString) + ', '
         + '          ODCDD=' + quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCDD').AsString) + ', '
         + '          ODCANOMM=' + quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCANOMM').AsString) + ', '
         + '          ODCTRI=' + quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCTRI').AsString) + ', '
         + '          ODCSEM=' + quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCSEM').AsString) + ', '
         + '          ODCSS=' + quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCSS').AsString) + ', '
         + '          ODCAATRI=' + quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCAATRI').AsString) + ', '
         + '          ODCAASEM=' + quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCAASEM').AsString) + ', '
         + '          ODCAASS=' + quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCAASS').AsString) + ', '
         + '          ODCFREG=TRUNC(SYSDATE),'
         + '          ODCHREG=SYSDATE,'
         + '          PROFID=' + quotedstr(DMLOG.cdsOrdComp.FieldbyName('PROFID').AsString) + ', '
         + '          ODCVISADOR=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString) + ', '
         + '          OCVISFREG=TRUNC(SYSDATE),'
         + '          OCVISHREG=SYSDATE,'
         + '          ORDPAGPEN=' + FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ORDPAGPEN').AsFloat) + ','
         + '          ODCACEPFREG=TRUNC(SYSDATE),'
         + '          ODCACEPHREG=SYSDATE,'
         + '          ODCTOTALISC=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCTOTALISC').AsString) + ', '
         + '          ODCTCAMB=' + FloatToStr(DMLOG.cdsOrdComp.fieldbyName('ODCTCAMB').AsFloat) + ','
         + '          PROVDES=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString) + ', '
         + '          PROV=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('PROV').AsString) + ', '
         + '          ODCFATE=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCFATE').AsString) + ', '
         + '          OCCOLOCAC=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('OCCOLOCAC').AsString) + ', '
         + '          OCCOLOFREG=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('OCCOLOFREG').AsString) + ', '
         + '          OCCOLOHREG=SYSDATE,'
         + '          ODCFEMI=' + quotedstr(DMLOG.cdsOrdComp.fieldbyName('ODCFEMI').AsString) + ', '
         + '          ODCTEN=' + quotedstr(DMLOG.cdsOrdComp.fieldbyName('ODCTEN').AsString) + ', '
         + '          ODCVALID=' + quotedstr(DMLOG.cdsOrdComp.fieldbyName('ODCVALID').AsString) + ', '
         + '          TMONID=' + quotedstr(DMLOG.cdsOrdComp.fieldbyName('TMONID').AsString) + ', '
         + '          CCOMERID=' + quotedstr(DMLOG.cdsOrdComp.fieldbyName('CCOMERID').AsString) + ', '
         + '          LGECID=' + quotedstr(DMLOG.cdsOrdComp.fieldbyName('LGECID').AsString) + ', '
         + '          NUMREQUSU=' + quotedstr(DMLOG.cdsOrdComp.fieldbyName('NUMREQUSU').AsString) + ', '
         + '          TIPOADQ=' + quotedstr(DMLOG.cdsOrdComp.fieldbyName('TIPOADQ').AsString) + ' '
         + '    Where CIAID =' + quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').asString)
         + '      and ODCID =' + quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCID').asString);
*)
      xSQL := ' CALL SP_LOG_UPD_OCOMPRA_CAB1('
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').asString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.fieldbyName('ODCID').asString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.fieldbyname('ODCOBS').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('DOCREF').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('CLAUXID').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').AsFloat) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCUSER').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('OCTIP').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCANO').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCMM').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCDD').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCANOMM').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCTRI').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCSEM').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCSS').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCAATRI').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCAASEM').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCAASS').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldbyName('PROFID').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ORDPAGPEN').AsFloat) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCTOTALISC').AsString) + ', '
         +              FloatToStr(DMLOG.cdsOrdComp.fieldbyName('ODCTCAMB').AsFloat) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('PROV').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCFATE').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('OCCOLOCAC').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('OCCOLOFREG').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.fieldbyName('ODCFEMI').AsString) + ', '
         +              quotedstr(IntToStr(DMLOG.cdsOrdComp.fieldbyName('ODCTEN').asInteger)) + ', '
         +              quotedstr(IntToStr(DMLOG.cdsOrdComp.fieldbyName('ODCVALID').asInteger)) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('TMONID').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('CCOMERID').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('LGECID').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('NUMREQUSU').AsString) + ', '
         +              quotedstr(DMLOG.cdsOrdComp.FieldByName('TIPOADQ').AsString)
         +')' ;
   End;
// Fin HPC_201804_LOG
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      Screen.Cursor := crDefault;
      ShowMessage('Error al Actualizar Cabecera de Orden de Compra (LOG304)');
      xSigueGrab := False;
      exit;
   End;

   xOk := True;
End;

Procedure TFRegOrdCD.ActAnulacion;
Begin
// Actualiza Cabecera de Orden de Compra
   xSQL := 'Update LOG304 '
      + '      Set ODCEST=''ANULADO'','
      + '          ODCANULA='+quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCANULA').AsString)+','
      + '          ODCOBSANU='+quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCOBSANU').AsString) + ','
      + '          OCANUFREG=TRUNC(SYSDATE),'
      + '          OCANUHREG=SYSDATE '
      + '    Where CIAID ='+quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').asString)
      + '      and ODCID ='+quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCID').asString);
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      Screen.Cursor := crDefault;
      ShowMessage('Error al Actualizar Anulación en Cabecera de Orden de Compra - LOG304');
      xSigueGrab := False;
      exit;
   End;

// Actualiza todos los registros del Detalle con Estado='ANULADO'
   xSQL := 'Update LOG305 '
      + '      Set ODCEST=''ANULADO'' '
      + '    Where CIAID ='+quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').asString)
      + '      and ODCID ='+quotedstr(DMLOG.cdsOrdComp.FieldByName('ODCID').asString);
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      Screen.Cursor := crDefault;
      ShowMessage('Error al Actualizar Anulación en Detalle de la Orden de Compra - LOG305');
      xSigueGrab := False;
      exit;
   End;
End;

Procedure TFRegOrdCD.DeletTodoLOG304;
Begin
// Inicio HPC_201804_LOG
// Se cambia a Procedimientos almacenados
(*
   xSQL := 'Delete LOG304 '
      + '    where CIAID='+quotedstr(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString)
      + '      And ODCID='+quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString);
*)
   xSQL := 'CALL SP_LOG_DEL_OCOMPRA_CAB('
          +quotedstr(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString)+','
          +quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString)
          +')' ;
// Fin HPC_201804_LOG
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      Screen.Cursor := crDefault;
      xSigueGrab := False;
      ShowMessage('Error al borrar Cabecera de la Orden de Compra (LOG304) ');
      exit;
   End;
End;

Procedure TFRegOrdCD.DeletTodoLOG305;
Begin
// Inicio HPC_201804_LOG
// Se cambia a Procedimientos almacenados
(*
   xSQL := 'Delete LOG305 '
      + '    where CIAID='+quotedstr(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString)
      + '      and ODCID='+quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString);
*)
   xSQL := 'CALL SP_LOG_DEL_OCOMPRA_DET('
          +quotedstr(DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString)+','
          +quotedstr(DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString)
          +')' ;
// Fin HPC_201804_LOG          
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      Screen.Cursor := crDefault;
      xSigueGrab := False;
      ShowMessage('Error al borrar Detalle de la Orden de Compra (LOG304) ');
      exit;
   End;
End;

Procedure TFRegOrdCD.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;

Procedure TFRegOrdCD.bbtnAceObsAnuClick(Sender: TObject);
Begin
   If Length(Trim(memObsAnu.Text)) = 0 Then
   Begin
      ErrorMsg('Adquisiciones', 'Tiene que Ingresar una Observación para Poder Continuar');
      Exit;
   End;

   If DMLOG.cdsOrdComp.State In [dsBrowse] Then
      DMLOG.cdsOrdComp.Edit;

   Screen.Cursor := crHourGlass;
   DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString := 'ANULADO';
   DMLOG.cdsOrdComp.FieldbyName('ODCANULA').AsString := DMLOG.wUsuario;
   DMLOG.cdsOrdComp.FieldByName('ODCOBSANU').AsString := Uppercase(memObsAnu.Text);
   DMLOG.cdsOrdComp.FieldByName('OCANUFREG').AsDateTime := Date;
   DMLOG.cdsOrdComp.FieldByName('OCANUHREG').AsDateTime := Date + SysUtils.Time;
   DMLOG.cdsOrdComp.Post;

   DMLOG.cdsDOrdComp.disablecontrols;
   DMLOG.cdsDOrdComp.first;
   While Not DMLOG.cdsDOrdComp.eof Do
   Begin
      DMLOG.cdsDOrdComp.Edit;
      DMLOG.cdsDOrdComp.FieldbyName('ODCEST').AsString := 'ANULADO';
      DMLOG.cdsDOrdComp.Post;
      DMLOG.cdsDOrdComp.Next;
   End;
   DMLOG.cdsDOrdComp.enablecontrols;

   DMLOG.DCOM1.AppServer.IniciaTransaccion;
   xSigueGrab := True;
   ActAnulacion;
   If Not xSigueGrab Then
   Begin
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      exit;
   End;

// Actualiza el numero de order de compra en el cuadro comparativo
   If Length(Trim(VSCCID)) > 0 Then
   Begin
      xSQL := 'Update LOG341 '
         + '      Set ODCID=null '
         + '    Where CIAID='+quotedstr(dblcCIA.Text)
         + '      And SCCID='+quotedstr(Trim(VSCCID));
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al actualizar número de OC en el Cuadro Comparativo - LOG341');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;
   End;
   DMLOG.DCOM1.AppServer.GrabaTransaccion;
   pnlObsAnula.Visible := False;
   Screen.Cursor := crDefault;
End;

Procedure TFRegOrdCD.bbtnCerObsAnuClick(Sender: TObject);
Begin
   pnlObsAnula.Visible := False;
End;

Procedure TFRegOrdCD.pprOCPEStartPage(Sender: TObject);
Begin
   xVan := 0;
End;

Procedure TFRegOrdCD.FormActivate(Sender: TObject);
Begin
   DMLOG.AccesosUsuarios(DMLOG.wModulo, DMLOG.wUsuario, '2', Screen.ActiveForm.Name);
End;

Procedure TFRegOrdCD.fg_ListaReqPendientes;
Begin
// Cabecera de Requerimientos
   xSQL := ' Select LOG306.CIAID, ' //COMPANIA --COMPAÑÍA DONDE SE REGISTRO
      + '           LOG306.LOCID, '
      + '           LOG306.URQID, ' //  REQUERIMIENTO, --NUMERO DE REQUERIMIENTO
      + '           LOG306.TIPOADQ, ' //  TIPO_REQUERIMIENTO, --Tipo de requerimento
      + '           LOG306.CCOSID, ' //  CC_REGISTRO, --CENTRO DE COSTO DEL REGISTRO
      + '           LOG306.URQEST, ' //  ESTADO,--estado del requerimiento [ACEPTADO/INICIAL]
      + '           LOG306.URQESTUSR, ' //  SITUACION, --situación requerimiento [EMITIDO/AUTORIZADO/JEFE DE AREA]
      + '           LOG306.URQSOLIC, ' //  CCDESTINO, --centro de costo de destino
      + '           LOG306.URQSOLICDES, ' //  CCDESTINODES, --descripcion del centro de costo de destino
      + '           LOG306.URQOBS, ' //  OBSERVACION, --OBSERVACION
      + '           LOG306.URQUSR, ' //  USUARIO_REGISTRO, --usuario que registró el requerimento
      + '           LOG306.URQFREG, ' //  FECHA_REGISTRO, --fecha de registro
      + '           LOG306.URQACEPUSR, ' //  USUARIO_ACEPTA , --usuario acepta
      + '           LOG306.URQACEPFREG, ' //  FECHA_ACEPTA, --fecha en que se acepta
      + '           LOG306.URQANOMM, ' //  PERIODO, --periodo
      + '           LOG306.GENOC ' //  GENERA ORDEN DE COMPRA
      + '      from LOG306 '
      + '     where LOG306.CIAID = ' + QuotedStr(dblcCIA.Text)
      + '       and LOG306.URQEST = ' + QuotedStr('ACEPTADO')
      + '       and NVL(LOG306.GENOC,' + QuotedStr('N') + ') = ' + Quotedstr('S')
      + '       and NOT EXISTS (SELECT 1 FROM LOG304 WHERE LOG304.CIAID = LOG306.CIAID '
      + '       and LOG304.NUMREQUSU = LOG306.URQID'
      + '       and LOG304.ODCEST <> ' + QuotedStr('ANULADO') + ' )';

   DMLOG.cdsArtPendXTot.Close;
   DMLOG.cdsArtPendXTot.DataRequest(xSQL);
   DMLOG.cdsArtPendXTot.Open;

// Detalle de Requerimientos
   xSQL := ' SELECT LOG307.*, TGE205.ARTDES  '
      + '      FROM LOG307, TGE205  '
      + '     WHERE LOG307.CIAID = TGE205.CIAID(+)'
      + '       AND LOG307.TINID = TGE205.TINID(+)'
      + '       AND LOG307.ARTID = TGE205.ARTID(+)'
      + '       AND EXISTS (SELECT 1 '
      + '                     FROM LOG306 '
      + '                    WHERE LOG306.CIAID  = LOG307.CIAID '
      + '                      AND LOG306.LOCID  = LOG307.LOCID '
      + '                      AND LOG306.CCOSID = LOG307.CCOSID '
      + '                      AND LOG306.URQID  = LOG307.URQID '
      + '                      AND LOG306.CIAID = ' + QuotedStr(dblcCIA.Text)
      + '                      AND LOG306.URQEST = ' + QuotedStr('ACEPTADO')
      + '                      AND NVL(LOG306.GENOC,' + QuotedStr('N') + ') = ' + Quotedstr('S') + ')';
   DMLOG.cdsRqsArtXTot.Close;
   DMLOG.cdsRqsArtXTot.datarequest(xSQL);

   DMLOG.cdsRqsArtXTot.MasterSource := DMLOG.dsArtPendXTot;
   DMLOG.cdsRqsArtXTot.MasterFields := 'CIAID; LOCID;CCOSID;URQID';
   DMLOG.cdsRqsArtXTot.IndexFieldNames := 'CIAID; LOCID;CCOSID;URQID';
   DMLOG.cdsRqsArtXTot.Open;
End;

Procedure TFRegOrdCD.fg_PorRequerimiento;
Var
   xsCompania, xsNumOC: String;
Begin
   xsCompania := DMLOG.cdsOrdComp.FieldByName('CIAID').AsString;
   xsNumOC := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;
   FListaRequermientos := TFListaRequermientos.create(Application); // LOG232.pas
   If FListaRequermientos.showModal = mrCancel Then
      exit;
   iEstado := 0;

   DMLOG.cdsOrdComp.Edit;
   DMLOG.cdsOrdComp.FieldByName('NUMREQUSU').AsString := DMLOG.cdsRqsArtXTot.fieldbyname('URQID').AsString;
   DMLOG.cdsOrdComp.Post;

   xSigueGrab := True;
   DMLOG.DCOM1.AppServer.IniciaTransaccion;
   DMLOG.cdsRqsArtXTot.First;
   While Not DMLOG.cdsRqsArtXTot.Eof Do
   Begin
      DMLOG.cdsDOrdComp.Append;
      DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString := DMLOG.StrZero(DMLOG.MaxValue('DODCID', DMLOG.cdsDOrdComp), 3);
      DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString := xsCompania;
      DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString := xsNumOC;
      DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString := DMLOG.cdsRqsArtXTot.fieldbyname('ARTID').AsString;
      If Length(Trim(DMLOG.cdsRqsArtXTot.fieldbyname('ARTDES').AsString)) = 0 Then
         DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString := DMLOG.cdsRqsArtXTot.fieldbyname('DURQOBS').AsString
      Else
         DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString := Trim(DMLOG.cdsRqsArtXTot.fieldbyname('ARTDES').AsString);
      DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString := DMLOG.cdsRqsArtXTot.fieldbyname('TIPOADQ').AsString;
      DMLOG.cdsDOrdComp.FieldByName('CCOMERID').asString := dblcFPago.Text;
      DMLOG.cdsDOrdComp.FieldByName('CLAUXID').asString := xProv;
      DMLOG.cdsDOrdComp.FieldByName('PROV').asString := dblcdProv.Text;
      DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString := DMLOG.cdsRqsArtXTot.fieldbyName('DURQCNSG').asString;
      DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString := DMLOG.cdsRqsArtXTot.fieldbyName('UNMIDG').asString;
      DMLOG.cdsDOrdComp.FieldByName('ODCEST').AsString := DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString;
      DMLOG.cdsDOrdComp.FieldbyName('ODCFREG').AsDateTime := DMLOG.cdsOrdComp.FieldbyName('ODCFREG').AsDateTime;
      DMLOG.cdsDOrdComp.FieldByName('DODCCATE').AsString := '0.00';
      DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsString := '0.00';
      DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsString := '0.00';
      DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsString := '0.00';
      DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString := wIGV;
      DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsString := '0.00';
      DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsString := '0.00';
      DMLOG.cdsDOrdComp.FieldByName('IMPUNI').AsString := '0.00';

      wSQL := 'CIAID=' + QuotedStr(xsCompania) + ' AND ARTID=' + QuotedStr(DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString);
      DMLOG.DisplayDescrip('prvSQL', 'TGE205', 'ARTID, TINID, GRARID, FAMID, SFAMID', wSQL, 'ARTID');

      DMLOG.cdsDOrdComp.FieldByName('TINID').AsString := DMLOG.cdsQry.FieldByName('TINID').AsString;
      DMLOG.cdsDOrdComp.FieldByName('GRARID').AsString := DMLOG.cdsQry.FieldByName('GRARID').AsString;
      DMLOG.cdsDOrdComp.FieldByName('FAMID').AsString := DMLOG.cdsQry.FieldByName('FAMID').AsString;
      DMLOG.cdsDOrdComp.FieldByName('SFAMID').AsString := DMLOG.cdsQry.FieldByName('SFAMID').AsString;

      DMLOG.cdsDOrdComp.FieldByName('ODCANO').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCANO').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCMES').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCMM').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCDIA').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCDD').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCANOMES').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCANOMM').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCTRIM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCTRI').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCSEM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCSEM').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCSS').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCSS').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCAATRI').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAATRI').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCAASEM').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAASEM').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCAASS').AsString := DMLOG.cdsOrdComp.FieldbyName('ODCAASS').AsString;
      DMLOG.cdsDOrdComp.FieldByName('ODCUSER').AsString := DMLOG.wUsuario;
      DMLOG.cdsDOrdComp.Post;

      ActualizaLOG305;
      If Not xSigueGrab Then
      Begin
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;

      DMLOG.cdsRqsArtXTot.Next;
   End;

   OnOffDetalle(True); // activar detalle
   pnlDetalleA.Visible := False;

   CalcTotal(Nil);

   dbePUnit.text := '0';
   dbeDscto.Text := '0';
   dbeImpInd.Text := '0';
   dbeISC.Text := '0';
   dbeImporte.Text := '0';
   dbeValVen.Text := '0';

   dbeCnt.Enabled := True;
   dbePUnit.Enabled := True;
   dbeDscto.Enabled := True;
   dbeImpInd.Enabled := True;
   dbeImporte.Enabled := True;
End;

Initialization
   registerclasses([TLabel]);
End.


Unit LOG210;

//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG210
//Formulario               : FRegOrdC
//Fecha de Creación        :
//Autor                    : Equipo de desarrollo
//Objetivo                 : Ventana de mantenimiento de las Ordenes de Compra

//Actualizaciones:
//SAR666                   : Se adiciona mascara de salida, tipo de auxiliar por defecto y otros cambios menores
//HPP_201103_LOG 19/04/2011: Se implementa la funcionalidad que permite visar la Orden de Compra
//                           al mismo usuario que registró. sólo se habilitará
//                           el botón de visado si el usuario tiene el acceso a visar la OC
//HPC_201106_LOG             Procedure fg_RecuperaSubReporte;
//HPC_201108_LOG 22/12/2011: Mostrar la descripción del proveedor de acuerdo a lo seleccionado
//                           por el usuario en la ventana que se muestra en el control dblcdProv
//HPC_201202_LOG 13/04/2012: Invocar la funcionalidad DMLOG.fg_ValidaDatosProveedor que valida

//                           si el proveedor está con los datos completos o no
//HPC_201203_LOG 24/04/2012: se implementó la funcionalidad de registrar OC desde
//                           los requerimientos de usuario en estado ACEPTADO
//HPC_201405_LOG  25/09/2014  1.	Se adicionó Control Transaccional en los puntos donde se actualizan las tablas.
//                            2.	Se retira los ApplyUpdates y  se adiciono UPDATE, INSERT Y DELETE con AppServer.EjecutaSQL(sSQL), se le incluye también su Control Transaccional.
//                                REORDENAMIENTO DE SANGRIA

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
   wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg, wwdbdatetimepicker, DBCtrls, db,
   wwSpeedButton, wwDBNavigator, Grids, Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, Wwdbspin,
   ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppModule, daDatMod,
   ppBands, ppPrnabl, ppCtrls, ppViewr, ppArchiv, wwclient, GridControl,
   ppStrtch, ppMemo, ppRichTx, ppVar, ppEndUsr, Variants, ppTypes,
   ppParameter, ppSubRpt, MsgDlgs; //, ppViewr;

Type
   TFRegOrdC = Class(TForm)
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
      dbcldArti: TwwDBEdit;
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
      Z2bbtnGrabaOC: TBitBtn;
      edtUltCompra: TEdit;
      Panel1: TPanel;
      Label5: TLabel;
      DBText1: TDBText;
      ppParameterList1: TppParameterList;
      Z2bbtnVisado: TBitBtn;
      Z2bbtnOrdenpago: TBitBtn;
      ppdbOrdenPagoPorOC: TppDBPipeline;
      Label2: TLabel;
      edtReqUsuario: TwwDBEdit;
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
      dblcTipoAuxiliar: TwwDBLookupCombo;
      Label6: TLabel;
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
      Procedure dbcldArtiChange(Sender: TObject);
      Procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dbeDsctoExit(Sender: TObject);
      Procedure dedNProformaExit(Sender: TObject);
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
      Procedure pprOCPEBeforePrint(Sender: TObject);
      Procedure pprOCPEStartPage(Sender: TObject);
      Procedure bbtnAceObsAnuClick(Sender: TObject);
      Procedure bbtnCerObsAnuClick(Sender: TObject);
      Procedure Z2bbtnGrabaOCClick(Sender: TObject);
      Procedure dbeNRegKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormShow(Sender: TObject);
      Procedure ppHeaderBand4BeforePrint(Sender: TObject);
      Procedure Z2bbtnVisadoClick(Sender: TObject);
      Procedure Z2bbtnOrdenpagoClick(Sender: TObject);
      Procedure dblcTipoAuxiliarExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
      Procedure ActualizaAxP;
      Procedure ActualizaProf;
      Procedure ProXReq;
      Procedure ProXReqTot;
      Procedure CalCant;
      Procedure GenerProfOCompra;
      Procedure fg_RecuperaSubReporte;
      Function fg_ExisteOrdenPago(wgCiaid, wgNumOrdenCompra: String): Boolean;
      Procedure fg_ListaReqPendientes;
      Procedure fg_PorRequerimiento;
      Function fg_ValidaDetalle: Boolean;
      Procedure ActualizaLOG305;
      Procedure ActualizaLOG304;
      Procedure ActAnulacion;
      Procedure DeletTodoLOG305;
      Procedure DeletTodoLOG304;

   Public
    { Public declarations }
      xValorX: String;
      Procedure CalcTotal(Sender: TObject);
   End;

Var
   FRegOrdC: TFRegOrdC;
   xTAutoNum, xTAno, xTMes: String;
   xOrdElim: String;
   wIGV: String;
   xPriInser: String;
   SQLFiltro: String;
   xCant, wSQL: String;
   xDesac: Integer;
   xProv: String;
   xsTipoAuxiliar: String;
Implementation

Uses LOGDM1, LOG221, LOG220, LOG222, LOG601, oaAD3100, LOG130, LOG232;

{$R *.DFM}

Procedure TFRegOrdC.Z2bbtnOKClick(Sender: TObject);
Var
   xPasa: Integer;
   sSQL: String;
Begin
   ValidaCab;
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
         'Desea volver a genera el nuevo Nº de Order de Compra y Continuar ' + #13 + #13) Then
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

   Screen.Cursor := crHourGlass;

   DMLOG.DCOM1.AppServer.IniciaTransaccion;

   If DMLOG.cdsOrdComp.State In [dsInsert, dsEdit] Then
   Try
      AsigDat; // asignar los datos predeterminados
      If Length(trim(dbmObs.text)) = 0 Then
         DMLOG.cdsOrdComp.fieldbyname('ODCOBS').AsString := '.';
      Try
         DMLOG.cdsOrdComp.Post;
      Except
         ShowMessage('Error 01 en un Post en el cdsOrdComp..');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      SQLFiltro := 'SELECT * FROM  LOG304 WHERE ' +
         'CIAID  =''' + dblcCIA.Text + ''' ' +
         'AND ODCID=''' + dbeNReg.Text + '''';
      DMLOG.cdsOrdComp.DataRequest(SQLFiltro);

      xPriInser := '';

      sSQL := 'SELECT * FROM LOG305 WHERE CIAID=''' + dblcCIA.text + ''' AND ODCID=''' + dbeNReg.Text + '''';
      DMLOG.cdsDOrdComp.Close;
      DMLOG.cdsDOrdComp.dataRequest(sSQL);
      DMLOG.cdsDOrdComp.Open;

      If DMLOG.wModo = 'A' Then
      Begin
         DMLOG.cdsDODCxDRQS.Close;
         DMLOG.cdsDODCxDRQS.DataRequest('SELECT * FROM LOG324 WHERE CIAID=''' + dblcCIA.Text + ''' AND ODCID=''' + dbeNReg.Text + '''');
         DMLOG.cdsDODCxDRQS.Open;

         xOrdElim := DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString; // Si graba podre borrar
      End;

      OnOffCabecera(False); //Desactivar el panel de Cabecera
      OnOffDetalle(True); //Activar el panel de detalle
      If (FOrdendeCompra.wTipoOC = 'xProforma') Then
         Z2dbgDReqsIButton.Enabled := False
      Else
         Z2dbgDReqsIButton.Enabled := True;
      Z2bbtnRegresa.Enabled := True;
      Z2bbtnCanc2.Enabled := True;
      Z2bbtnGraba.Enabled := true;
      Z2bbtnAcepta.Enabled := True;
      z2bbtnSalir.Enabled := True;
      pnlDetalleG.SetFocus;
      Screen.Cursor := crDefault;
   Except
      On E: Exception Do
         If Not EHandlerError(E) Then // Raise;
         Begin
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            Z2bbtnSalirClick(SELF);
            Raise;
            exit;
         End;
   End;

   Screen.Cursor := crHourGlass;
   If FOrdendeCompra.wTipoOC = 'xRequisicion' Then
   Begin
      ProXReq;
   End
   Else
      If FOrdendeCompra.wTipoOC = 'xRequisicionTotal' Then
      Begin
         ProXReqTot;

      End
      Else
         If FOrdendeCompra.wTipoOC = 'xRequerimiento' Then
         Begin
            fg_ListaReqPendientes;
         End;

   Screen.Cursor := crDefault;
   If DMLOG.wModo = 'A' Then
   Begin
      xDesac := 1;
      Try
         Z2dbgDReqsIButton.Click;
      Except
         ShowMessage('Error 08 al actualizar el Grid de los OC por Cotizacion');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;
   End;

   DMLOG.DCOM1.AppServer.GrabaTransaccion;
End;

Procedure TFRegOrdC.AsigDat;
Var
   D, M, Y: Word;
   sFecha, sSQL: String;
Begin
   DecodeDate(dbdtpFReg.Date, Y, M, D);

   If Length(Trim(DMLOG.cdsOrdComp.FieldbyName('ODCOBS').AsString)) = 0 Then
      DMLOG.cdsOrdComp.FieldbyName('ODCOBS').AsString := '.';

   If DMLOG.cdsOrdComp.State In [dsInsert] Then
   Begin
      DMLOG.cdsOrdComp.FieldbyName('CLAUXID').AsString := xProv;
      DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString := 'INICIAL';
      DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').AsFloat := 0.0;
      DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat := 0.0;
      DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat := 0.0;
      DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat := 0.0;
      If DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat < 0 Then
         DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat := 0.0;
      DMLOG.cdsOrdComp.FieldbyName('ODCUSER').AsString := DMLOG.wUsuario;

      sFecha := FormatDateTime(DMLOG.wFormatFecha, dbdtpFReg.Date);
      sSQL := 'SELECT * FROM TGE114 WHERE FECHA=' + QuotedStr(sFecha);
      DMLOG.FiltraCDS(DMLOG.cdsPeriodo, sSQL);

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
      DMLOG.cdsOrdComp.FieldbyName('ODCHREG').AsDateTime := SysUtils.Time
   End;
End;

Procedure TFRegOrdC.FormCreate(Sender: TObject);
Begin
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
   dbeNReg.DataSource := DMLOG.dsOrdComp;

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

End;

Procedure TFRegOrdC.Z2bbtnRegresaClick(Sender: TObject);
Begin
   If (DMLOG.cdsDOrdComp.ChangeCount > 0) Or (DMLOG.cdsDOrdComp.Modified) Then
   Begin
      Information('Orden de Compra', 'Guarde las Modificaciones, Primero');
      Exit;
   End;
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
End;

Procedure TFRegOrdC.Z2bbtnCanc2Click(Sender: TObject);
Begin
   If FRegOrdC = Nil Then
      Exit;
   DMLOG.cdsOrdComp.CancelUpdates;
   DMLOG.cdsDOrdComp.CancelUpdates;
   If (DMLOG.wModo = 'A') And
      (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'INICIAL') And
      (DMLOG.cdsOrdComp.FieldbyName('ODCVISADOR').IsNull) And
      (Length(Trim(xOrdElim)) > 0) Then
   Begin
      DMLOG.cdsDOrdComp.First;
      While Not DMLOG.cdsDOrdComp.Eof Do
         DMLOG.cdsDOrdComp.Delete;
      DMLOG.cdsOrdComp.Delete;

      DMLOG.DCOM1.AppServer.IniciaTransaccion;
      Try
         DeletTodoLOG304;
      Except
         ShowMessage('Error 60 al Borrar LOG304 - CANCELAR');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      Try
         DeletTodoLOG305;
      Except
         ShowMessage('Error 61 al Borrar LOG305 - CANCELAR');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;
      DMLOG.DCOM1.AppServer.GrabaTransaccion;

      DMLOG.wModo := '';
   End;
   DMLOG.cdsOrdComp.edit;
End;

Procedure TFRegOrdC.Z2bbtnGrabaClick(Sender: TObject);
Var
   xCIAID, xODCID, xImp: String;
   xFle: Double;
   xsMensaje: String;
Begin
   If DMLOG.cdsDOrdComp.RecordCount > 0 Then
   Begin
      ValidaTot;

      If fg_ValidaDetalle = False Then
      Begin
         Exit;
      End;

      DMLOG.DCOM1.AppServer.IniciaTransaccion;

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

            Try
               CalcTotal(Nil);
            Except
               ShowMessage('Error 13 al calcular los totales - CalcTotal');
               DMLOG.DCOM1.AppServer.RetornaTransaccion;
               Screen.Cursor := crDefault;
               Raise;
               exit;
            End;

            OnOffDetalle(True); // activar detalle
         End;
      End;
   End;

   OnOffVisar(True);
   Screen.Cursor := crHourGlass;
   dbeDescExit(Nil);
   xOrdElim := ''; // Si graba podre borrar

   Try
      DMLOG.ControlTran(9, DMLOG.cdsDODCxDRQS, 'DODCXDRQS');
     //Actualiza Detalle
      DMLOG.cdsDOrdComp.First;
      While Not DMLOG.cdsDOrdComp.Eof Do
      Begin
         ActualizaLOG305;
         DMLOG.cdsDOrdComp.Next;
      End;
      //Actualiza Cabecera
      ActualizaLOG304
   Except
      ShowMessage('Error 15 al realizar Update en, LOG314,LOG315 o cdsDODCxDRQS');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;

   dbeNReg.Enabled := False;
   dbeDesc.Enabled := False;
   btnDetalle;
   DMLOG.wModo := '';
   Screen.Cursor := crDefault;

   If DMLOG.fg_ValidaDatosProveedor(DMLOG.cdsOrdComp.FieldByName('CLAUXID').AsString, DMLOG.cdsOrdComp.FieldByName('PROV').AsString, xsMensaje) = False Then
   Begin
      ShowMessage(xsMensaje);
   End;

   DMLOG.DCOM1.AppServer.GrabaTransaccion;
End;

Procedure TFRegOrdC.Z2bbtnAceptaClick(Sender: TObject);
Var
   Monto: Double;
   xSql: String;
   xPaso, xSalVis: Integer;
   nArtSol, nArtAte: Double;
   xProv, sEstado, sSQL, xCLOCID, xCRQSID, xDRQSID, xFUM: String;
   lCompleto: boolean; //usado para las proformas
   xsMensaje: String;
Begin

   If DMLOG.fg_ValidaDatosProveedor(DMLOG.cdsOrdComp.FieldByName('CLAUXID').AsString, DMLOG.cdsOrdComp.FieldByName('PROV').AsString, xsMensaje) = False Then
   Begin
      ShowMessage(xsMensaje + #13 + 'No podrá ACEPTAR la Orden de Compra');
       //Inicio HPC_201405_LOG
       //Exit;
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
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
   If (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) <> 'INICIAL') Or
      (DMLOG.cdsDOrdComp.RecordCount = 0) Then // inicial...
   Begin
      Z2bbtnRegresa.Enabled := False;
      Z2bbtnCanc2.Enabled := False;
      Z2bbtnGraba.Enabled := False;
      Z2bbtnAcepta.Enabled := False;
      z2bbtnSalir.Enabled := True;
      Raise exception.Create(' Esta Orden de Compra ya fue Aceptada ó no Cuenta con Detalles ');
   End;
   If Length(Trim(DMLOG.cdsOrdComp.fieldbyname('ODCVISADOR').AsString)) = 0 Then
   Begin
    //---------------------------------- Inicio de Visado desde Orden de Compra --------------------------
      If wExoVis <> 'S' Then
         Raise Exception.create('Esta Orden de Compra No se Encuentra Visada')
      Else
      Begin
         If Not Question('Confirmar', 'Esta Orden de Compra ' + #13 + #13 +
            DMLOG.cdsOrdComp.FieldByName('ODCID').AsString + '  -  Prov.  ' +
            DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString + #13 +
            #13 + ' No se Encuentra Visada ' + #13 +
            #13 + ' Desea Visarla ') Then
         Begin
            Exit;
         End;
         If (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'INICIAL') And
            (DMLOG.cdsDOrdComp.RecordCount > 0) And
            (wPreUni = 0) Then
         Begin
            If Not Question('Confirmar', ' Confirme Visación de Orden de Compra ' + #13 + #13 +
               ' Desea Continuar ') Then
            Begin
               Exit;
            End;
            DMLOG.DisplayDescrip('prvTGE', 'TGE171', 'MONTOMAX, FOC', 'USERID=''' + DMLOG.wUsuario + '''', 'MONTOMAX');
            If DMLOG.cdsQry.FieldByName('FOC').AsString = 'S' Then
               xMontoVisar := DMLOG.cdsQry.FieldByName('MONTOMAX').AsCurrency;

            If dblcTMoneda.Text <> DMLOG.wTMonLoc Then
               Monto := DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').AsFloat * strtoFloat(dbeTCambio.text)
            Else
               Monto := DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').AsFloat;

            If Monto > xMontoVisar Then
            Begin
               Raise Exception.create('Su monto Máximo de Visación es :' + currtostr(xMontoVisar));
            End;
            DMLOG.cdsOrdComp.edit;
            DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString := DMLOG.wUsuario;
            DMLOG.cdsOrdComp.FieldByName('OCVISFREG').AsDateTime := Date;
            DMLOG.cdsOrdComp.FieldByName('OCVISHREG').AsDateTime := SysUtils.Time;
            Try
               DMLOG.cdsOrdComp.post;
            Except
               ShowMessage('Error 19 al realizar un Post a cdsOrdComp');
               DMLOG.DCOM1.AppServer.RetornaTransaccion;
               Screen.Cursor := crDefault;
               Raise;
               exit;
            End;

            xSql := 'Update LOG304 SET ODCVISADOR=''' + DMLOG.wUsuario + ''',OCVISFREG=Trunc(sysdate),OCVISHREG=sysdate ' +
               ' Where CIAID=''' + dblcCIA.Text + ''' And ODCID=''' + DMLOG.cdsOrdComp.FieldByname('ODCID').AsString + ''' ';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
               ShowMessage('Error 19 al realizar un Update a LOG304');
               DMLOG.DCOM1.AppServer.RetornaTransaccion;
               Screen.Cursor := crDefault;
               Raise;
               exit;
            End;

         End
         Else
         Begin
            xSalVis := 1;
         End;
      End;
    //---------------------------------- Fin de Visado desde Orden de Compra    -----------------------
   End;
   If xSalVis > 0 Then Exit;

  //---------------------------------- Inicio de Aceptación de Orden de Compra  -------------------------
   If Not Question('Confirmar', 'Esta Seguro de Aceptar La Orden de Compra ' + #13 + #13 +
      DMLOG.cdsOrdComp.FieldByName('ODCID').AsString + '  -  Prov.  ' +
      DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString + #13 +
      #13 + ' Desea Continuar ') Then
   Begin
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   xProv := DMLOG.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');

  //Consultar que lo solicitado de la requisicion por la orden de compra sea todo el pedido
  //si es asi, significa que el estado de la rqs es 'atendido' sino es 'parcial'

   If (FOrdendeCompra.wTipoOC = 'xRequisicion') Or
      (FOrdendeCompra.wTipoOC = 'xRequisicionTotal') Or (FOrdendeCompra.wTipoOC = 'xRequerimiento') Then
   Begin
      DMLOG.cdsDOrdComp.first;
      DMLOG.cdsDODCxDRQS.First;
      While Not DMLOG.cdsDODCxDRQS.Eof Do
      Begin
         nArtSol := DMLOG.cdsDODCxDRQS.fieldbyName('DODCCNT').asFloat;
         xCLOCID := DMLOG.cdsDODCxDRQS.fieldbyName('LOCID').asString;
         xCRQSID := DMLOG.cdsDODCxDRQS.fieldbyName('RQSID').asString;
         xDRQSID := DMLOG.cdsDODCxDRQS.fieldbyName('DRQSID').asString;
         sSQL := 'SELECT DRQSCNSG, DRQSCNAG, DRQSCNSU, DRQSCNAU ' +
            'FROM LOG309 ' +
            'WHERE CIAID=''' + dblcCIA.Text + ''' ' +
            'AND LOCID=''' + xCLOCID + ''' ' +
            'AND RQSID=''' + xCRQSID + ''' ' +
            'AND DRQSID=''' + xDRQSID + '''';
         DMLOG.cdsLOG.Close;
         DMLOG.cdsLOG.DataRequest(sSQL);
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
            sSQL := 'UPDATE LOG309 SET ' +
               'RQSEST=' + quotedStr(sEstado) + ', ' +
               'DRQSCNA' + xFUM + '=' + FloatToStr(nArtAte) + ', ' +
               'RQSFATE=' + DMLOG.wRepFuncDate + quotedStr(formatdatetime(DMLOG.wFormatFecha, Date)) + ') ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' ' +
               'AND LOCID=''' + xCLOCID + ''' ' +
               'AND RQSID=''' + xCRQSID + ''' ' +
               'AND DRQSID=''' + xDRQSID + '''';
            Try
               DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
              //Inicio HPC_201405_LOG
               ShowMessage('Error 21 al realizar un Update a LOG309');
               DMLOG.DCOM1.AppServer.RetornaTransaccion;
               Screen.Cursor := crDefault;
               Raise;
               exit;
            End;
         End;
         DMLOG.cdsDODCxDRQS.Next;
      End;

      xPaso := 0;
      sSQL := 'SELECT DISTINCT CIAID, LOCID, RQSID ' +
         'FROM LOG324 ' +
         'WHERE CIAID=''' + dblcCIA.Text + ''' ' +
         'AND ODCID=''' + DMLOG.cdsOrdComp.fieldbyName('ODCID').asString + ''' ' +
         'AND DODCCNT > 0 ORDER BY RQSID';
      DMLOG.cdsLOG.Close;
      DMLOG.cdsLOG.DataRequest(sSQL);
      DMLOG.cdsLOG.Open;
      DMLOG.cdsLOG.First;
      While Not DMLOG.cdsLOG.Eof Do
      Begin
         If xPaso = 0 Then
         Begin
            sSQL := 'SELECT DISTINCT RQSEST ' +
               'FROM LOG309 ' +
               'WHERE CIAID=''' + dblcCIA.Text + ''' ' +
               'AND LOCID=''' + DMLOG.cdsLOG.FieldByName('LOCID').AsString + ''' ' +
               'AND RQSID=''' + DMLOG.cdsLOG.FieldByName('RQSID').AsString + ''' ' +
               'AND RQSEST = ''PARCIAL''';
            DMLOG.cdsQry.Close;
            DMLOG.cdsQry.DataRequest(sSQL);
            DMLOG.cdsQry.Open;
            If DMLOG.cdsQry.RecordCount > 0 Then
            Begin
               sSQL := 'UPDATE LOG308 SET RQSEST=' + quotedStr('PARCIAL') + ' ' +
                  'WHERE CIAID=' + quotedstr(DMLOG.cdsLOG.FieldByName('CIAID').AsString) + ' ' +
                  'AND LOCID=' + quotedstr(DMLOG.cdsLOG.FieldByName('LOCID').AsString) + ' ' +
                  'AND RQSID=' + quotedstr(DMLOG.cdsLOG.FieldByName('RQSID').AsString);
               Try
                  DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
               Except
                  ShowMessage('Error 22 al realizar un Update a LOG308');
                  DMLOG.DCOM1.AppServer.RetornaTransaccion;
                  Screen.Cursor := crDefault;
                  Raise;
                  exit;
               End;
               xPaso := 1;
            End;
         End;
         If xPaso = 0 Then
         Begin
            sSQL := 'SELECT DISTINCT RQSEST FROM LOG309 ' +
               'WHERE CIAID=''' + DMLOG.cdsLOG.FieldByName('CIAID').AsString + ''' ' +
               'AND LOCID=''' + DMLOG.cdsLOG.FieldByName('LOCID').AsString + ''' ' +
               'AND RQSID=''' + DMLOG.cdsLOG.FieldByName('RQSID').AsString + ''' ' +
               'AND RQSEST=''ACEPTADO''';
            DMLOG.cdsQry.Close;
            DMLOG.cdsQry.DataRequest(sSQL);
            DMLOG.cdsQry.Open;
            If DMLOG.cdsQry.RecordCount > 0 Then
               xPaso := 1
         End;
         If xPaso = 0 Then
         Begin
            sSQL := 'SELECT DISTINCT RQSEST FROM LOG309 ' +
               'WHERE CIAID=''' + DMLOG.cdsLOG.FieldByName('CIAID').AsString + ''' ' +
               'AND LOCID=''' + DMLOG.cdsLOG.FieldByName('LOCID').AsString + ''' ' +
               'AND RQSID=''' + DMLOG.cdsLOG.FieldByName('RQSID').AsString + ''' ' +
               'AND RQSEST=''ATENDIDO''';
            DMLOG.cdsQry.Close;
            DMLOG.cdsQry.DataRequest(sSQL);
            DMLOG.cdsQry.Open;
            If DMLOG.cdsQry.RecordCount > 0 Then
            Begin
               sSQL := 'UPDATE LOG308 SET RQSEST=' + quotedStr('ATENDIDO') + ' ' +
                  'WHERE CIAID=' + quotedstr(DMLOG.cdsLOG.FieldByName('CIAID').AsString) + ' ' +
                  'AND LOCID=' + quotedstr(DMLOG.cdsLOG.FieldByName('LOCID').AsString) + ' ' +
                  'AND RQSID=' + quotedstr(DMLOG.cdsLOG.FieldByName('RQSID').AsString);
               Try
                  DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
               Except
                  ShowMessage('Error 23 al realizar un Update a LOG308');
                  DMLOG.DCOM1.AppServer.RetornaTransaccion;
                  Screen.Cursor := crDefault;
                  Raise;
                  exit;
               End;
            End;
         End;
         xPaso := 0;
         DMLOG.cdsLOG.Next;
      End;
   End; //xRqs

  //Consultar que lo solicitado de la proforma por la orden de compra sea todo el pedido
  //si es asi, significa que el estado de la rqs es 'atendido' sino es 'parcial'
   If FOrdendeCompra.wTipoOC = 'xProforma' Then
   Begin
      sSQL := 'SELECT SUBSTR(DPROF.DPROFOBS,1,50) DPROFOBS, ';
      sSQL := sSQL + 'DECODE(DPROF.DPROFLAGUM, ''G'', DPROF.UNMIDG, DPROF.UNMIDU) UNMIDP, ';
      sSQL := sSQL + 'DECODE(DPROF.DPROFLAGUM, ''G'', DPROF.DPROFCNTG, DPROF.DPROFCNTU) CNT, ';
      sSQL := sSQL + 'DOC.CIAID, DOC.UNMID UNMIDO, DOC.DODCCNT, SUBSTR(DOC.DODCOBS,1,50) DODCOBS ';
      sSQL := sSQL + 'FROM LOG313 DPROF, LOG305 DOC ';
      sSQL := sSQL + 'WHERE DPROF.CIAID=' + quotedstr(dblcCIA.Text) + ' AND DPROF.PROFID=' + quotedstr(dedNProforma.text);
      sSQL := sSQL + ' AND DOC.CIAID=DPROF.CIAID ';
      sSQL := sSQL + 'AND DOC.PROFID=DPROF.PROFID ';
      sSQL := sSQL + 'AND SUBSTR(DPROF.DPROFOBS,1,50) = SUBSTR(DOC.DODCOBS,1,50) ';

      DMLOG.cdsSQL.close;
      DMLOG.cdsSQL.datarequest(sSQL);
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
      sSQL := 'UPDATE LOG312 SET PROFEST=' + quotedStr(sEstado);
      sSQL := sSQL + 'WHERE CIAID=' + quotedstr(dblcCIA.Text) + ' AND PROFID=' + quotedstr(dedNProforma.text);
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         ShowMessage('Error 24 al realizar un Update a LOG312');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;
   End;

  // Cambiar el Estado de la O. Compra y/o Proforma por Aceptado
   Try
      If DMLOG.cdsDOrdComp.State In [dsEdit, dsInsert] Then DMLOG.cdsDOrdComp.Post;
      If DMLOG.cdsOrdComp.State In [dsEdit, dsInsert] Then DMLOG.cdsOrdComp.Post;
   Except
      ShowMessage('Error 25 al realizar un Post a cdsOrdComp o cdsDOrdComp');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;

   Begin
      DMLOG.cdsOrdComp.Edit;
      DMLOG.cdsOrdComp.FieldbyName('ORDPAGPEN').Value := DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').Value;
      DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString := 'ACEPTADO';
      DMLOG.cdsOrdComp.FieldbyName('ODCACEPFREG').AsDateTime := Date;
      DMLOG.cdsOrdComp.FieldbyName('ODCACEPHREG').AsDateTime := SysUtils.Time;
      Try
         DMLOG.cdsOrdComp.Post;
      Except
         ShowMessage('Error 26 al realizar un Post a cdsOrdComp');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      Xsql := 'UPDATE LOG304 SET ORDPAGPEN=' + FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').AsFloat) + ',' +
         ' ODCEST=''ACEPTADO'',ODCACEPFREG=trunc(sysdate),ODCACEPHREG=sysdate ' +
         'WHERE  CIAID=''' + dblcCIA.Text + ''' And ODCID=''' + DMLOG.cdsOrdComp.FieldByname('ODCID').AsString + ''' ';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(Xsql);
      Except
         ShowMessage('Error 35 al realizar un Update a LOG304 de ACEPTADO');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      Try
         ActualizaAxP;
      Except
         ShowMessage('Error 70 al ejecutar ActualizaAxP');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      If (Not DMLOG.cdsOrdComp.fieldbyname('PROFID').ISNULL) And
         (trim(DMLOG.cdsOrdComp.fieldbyname('PROFID').AsString) <> '') Then
         ActualizaProf;
   End;

   sSQL := 'UPDATE TGE201 SET PROVUFMOV=' + DMLOG.wRepFecServi + ', ' +
      'ACTXOC=''S'' ' +
      'WHERE CLAUXID=' + QuotedStr(xProv) + ' ' +
      'AND PROV=' + quotedstr(DMLOG.cdsOrdComp.FieldByName('PROV').AsString);
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
   Except
      ShowMessage('Error 31 al realizar Update a la tabla TGE201');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;

   If FOrdendeCompra.wTipoOC <> 'xProforma' Then
   Begin
      Try
         GenerProfOCompra;
      Except
         ShowMessage('Error 71 al ejecutar - GenerProfOCompra');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;
   End;

   Z2bbtnRegresa.Enabled := False;
   Z2bbtnCanc2.Enabled := False;
   Z2bbtnGraba.Enabled := False;
   Z2bbtnAcepta.Enabled := False;
   z2bbtnSalir.Enabled := True;

   DMLOG.DCOM1.AppServer.GrabaTransaccion;
   Screen.Cursor := crDefault;

  //---------------------------------- Fin de Aceptación de Orden de Compra     -----------------------
End;

Procedure TFRegOrdC.Z2bbtnAnulaClick(Sender: TObject);
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
      Information('Adquisiciones', 'Sólo se puede Anular una O.Compra ACEPTADA');
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
   pnlObsAnula.Visible := True;
   memObsAnu.SetFocus;
End;

Procedure TFRegOrdC.Z2dbgDReqsIButtonClick(Sender: TObject);
Var
   sCIAID, sODCID, sARTID: String;
   bExiste: Boolean;
Begin
   If DMLOG.cdsOrdComp.State In [dsInsert, dsEdit] Then
   Begin
      Exit
   End;

   DMLOG.DCOM1.AppServer.IniciaTransaccion;

   xCant := '';
   sCIAID := DMLOG.cdsOrdComp.FieldByName('CIAID').AsString;
   sODCID := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;
   If FOrdendeCompra.wTipoOC = 'xRequisicionTotal' Then // Por Requisición Total
   Begin
      If FArtOCxReqsTot.showModal = mrCancel Then
         exit;
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
         DMLOG.cdsDOrdComp.FieldByName('CLAUXID').asString := xProv;
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
         DMLOG.cdsDOrdComp.FieldbyName('ODCFREG').AsDateTime := DMLOG.cdsOrdComp.FieldbyName('ODCFREG').AsDateTime;

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
         Try
            DMLOG.cdsDOrdComp.Post;
         Except
            ShowMessage('Error 04 al realizar un Post en cdsDOrdComp');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            Raise;
            exit;
         End;
   {.......................................................................................
   | Aqui debe copiar a la tabla de RELACION ENTRE LA ORDEN DE COMPRA Y LA REQUISION      |
   .......................................................................................}
         DMLOG.cdsDODCxDRQS.Insert;
         DMLOG.cdsDODCxDRQS.FieldByName('CIAID').AsString := sCIAID;
         DMLOG.cdsDODCxDRQS.FieldByName('ODCID').AsString := SODCID;
         DMLOG.cdsDODCxDRQS.FieldByName('DODCID').AsString := DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('LOCID').AsString := DMLOG.cdsRqsArtXTot.FieldByName('LOCID').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('RQSID').AsString := DMLOG.cdsRqsArtXTot.FieldByName('RQSID').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('DRQSID').AsString := DMLOG.cdsRqsArtXTot.FieldByName('DRQSID').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('FLAGUM').AsString := DMLOG.cdsRqsArtXTot.FieldByName('RQSFLAGUM').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('ARTID').AsString := DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('TIPOADQ').AsString := DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString;
         DMLOG.cdsDODCxDRQS.FieldByName('DODCCNT').AsString := DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString;
         DMLOG.cdsDODCxDRQS.FieldByName('DODCOBS').AsString := '.';
         Try
            DMLOG.cdsDODCxDRQS.Post;
            DMLOG.ControlTran(9, DMLOG.cdsDODCxDRQS, 'DODCXDRQS');
         Except
            ShowMessage('Error 55 al realizar una actualización en Post, ControlTran de cdsDODCxDRQS');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            Raise;
            exit;
         End;

         DMLOG.cdsRqsArtXTot.Next;
      End;

      Try
       //Actualiza Detalle
         DMLOG.cdsDOrdComp.First;
         While Not DMLOG.cdsDOrdComp.Eof Do
         Begin
            ActualizaLOG305;
            DMLOG.cdsDOrdComp.Next;
         End;
        //Actualiza Cabecera
         ActualizaLOG304
      Except
         ShowMessage('Error 05 al realizar una actualización en, cdsOrdComp, cdsDOrdComp');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      OnOffDetalle(True); // activar detalle
      pnlDetalleA.Visible := False;

      Try
         CalcTotal(Nil);
      Except
         ShowMessage('Error 78 al calcular los totales - CalcTotal');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

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
   End
   Else

      If FOrdendeCompra.wTipoOC = 'xRequisicion' Then // Por Servicio, Compras, Activo Fijo
      Begin
         If FArtOCxReqs.showModal = mrCancel Then
            exit;
         iEstado := 1; // Estaba en 0 se cambio ppor la joda de la rel. req - ocompra
         iEst := 0;

         edtAdq.Text := DMLOG.cdsArtPendX.fieldbyname('TIPOADQ').AsString;
         dbcldArti.Text := DMLOG.cdsArtPendX.fieldbyname('ARTID').AsString;
         memDetalle.Text := Trim(DMLOG.cdsArtPendX.fieldbyname('ARTDES').AsString); //DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString;
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
               ErrorMsg('Error', 'No pueden existir artículos duplicados' + #13 +
                  'en un detalle de Orden de Compra....... ');
               Exit;
            End;
         End;

         DMLOG.cdsDOrdComp.Append;
         DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString := dbeItem.Text;
         DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString := sCIAID;
         DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString := dbeNReg.Text;
         DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString := dbcldArti.Text;
         DMLOG.cdsDOrdComp.FieldByName('CCOMERID').asString := dblcFPago.Text;
         DMLOG.cdsDOrdComp.FieldByName('CLAUXID').asString := xProv;
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
            DMLOG.DisplayDescrip('prvSQL', 'TGE205', 'ARTID, TINID, GRARID, FAMID, SFAMID, ARTPCG', wSQL, 'ARTID');

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
            Try
               edtUltCompra.text := FloatToStrF(DMLOG.cdsQry.FieldByName('ARTPCG').AsFloat, ffNumber, 15, 4);
            Except
               edtUltCompra.text := '0.0000';
            End;

            Try
               DMLOG.cdsDODCxDRQS.Post;
            Except
               ShowMessage('Error 56 al realizar una actualización en Post de cdsDODCxDRQS');
               DMLOG.DCOM1.AppServer.RetornaTransaccion;
               Screen.Cursor := crDefault;
               Raise;
               exit;
            End;
            DMLOG.cdsRqsArtX.Next;
         End;

         Try
      //Actualiza Detalle
            DMLOG.cdsDOrdComp.First;
            While Not DMLOG.cdsDOrdComp.Eof Do
            Begin
               ActualizaLOG305;
               DMLOG.cdsDOrdComp.Next;
            End;
       //Actualiza Cabecera
            ActualizaLOG304
         Except
            ShowMessage('Error 79 al realizar una actualización en, cdsOrdComp, cdsDOrdComp');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            Raise;
            exit;
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
      End
      Else
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
         End
         Else
            If FOrdendeCompra.wTipoOC = 'xRequerimiento' Then
            Begin
               If (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'ACEPTADO') Or
                  (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'ATENDIDO') Then
               Begin
                  Information('Modulo de Compras', 'Esta Orden de Compra está Aceptada' + #13 + 'No se puede Modificar');
                  Exit;
               End;

               If Length(Trim(DMLOG.cdsOrdComp.fieldbyname('ODCVISADOR').AsString)) > 0 Then
               Begin
                  Information('Modulo de Compras', 'Esta Orden de Compra ya a sido Visada ' + #13 + 'No se puede Modificar');
                  Exit;
               End;

               Try
                  fg_PorRequerimiento;
               Except
                  ShowMessage('Error 76 al ejecutar fg_PorRequerimiento ');
                  DMLOG.DCOM1.AppServer.RetornaTransaccion;
                  Screen.Cursor := crDefault;
                  Raise;
                  exit;
               End;

               Try
      //Actualiza Detalle
                  DMLOG.cdsDOrdComp.First;
                  While Not DMLOG.cdsDOrdComp.Eof Do
                  Begin
                     ActualizaLOG305;
                     DMLOG.cdsDOrdComp.Next;
                  End;
       //Actualiza Cabecera
                  ActualizaLOG304
               Except
                  ShowMessage('Error 80 al realizar una actualización en, cdsOrdComp, cdsDOrdComp');
                  DMLOG.DCOM1.AppServer.RetornaTransaccion;
                  Screen.Cursor := crDefault;
                  Raise;
                  exit;
               End;

            End;

   xCant := dbeCnt.Text;
   DMLOG.DCOM1.AppServer.GrabaTransaccion;
End;

Procedure TFRegOrdC.Z2bbtnRegOkClick(Sender: TObject);
Var
   sCIAID, sODCID, sARTID, wUndID, wUndDE: String;
   bExiste: Boolean;
   xImp: String;
   xFle: Double;
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
   If iEstado = 0 Then
      bExiste := DMLOG.cdsDOrdComp.Locate('CIAID;ODCID;ARTID', VarArrayOf([sCIAID, sODCID, sARTID]), [])
   Else
      bExiste := False;
   If bExiste Then // localizar el valor....
   Begin
      ErrorMsg('Error', 'No pueden existir artículos duplicados' + #13 +
         'en un detalle de Registro de Orden de Compra ');
      Exit; // salir del procedimiento
   End;
 { Si la Cantidad que trae a sido cambiada tendra que modificar la requisicion }
   If xCant <> dbeCnt.Text Then
   Begin
 //
   End;
   wUndID := dblcUMed.value;
   wUndDE := edtUMed.text;
   If iEstado = 0 Then
      DMLOG.cdsDOrdComp.Insert
   Else
      DMLOG.cdsDOrdComp.Edit;

   If DMLOG.cdsDOrdComp.State In [dsInsert, dsEdit] Then
   Begin
      Try
         DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString := sCIAID;
         DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString := SODCID;
         DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString := dbeItem.Text;
         DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString := dbcldArti.Text;
         DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString := wUndID;
         DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString := dbeCnt.Text;
         DMLOG.cdsDOrdComp.FieldByName('DODCCSLD').AsString := dbeCnt.Text;
         DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsString := dbePUnit.Text;
         DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsString := dbeDscto.Text;
         DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsString := dbeValVen.Text; //dbeImporte.Text;
         DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString := dbeImpInd.Text;
         DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsString := dbeImporte.Text;

         xFle := StrtoFloat(DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsString);
         xImp := FloattoStr(xFle + (xFle * StrtoFloat(DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString) / 100));
         DMLOG.cdsDOrdComp.FieldByName('IMPUNI').AsString := xImp;
         DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsString := dbeISC.Text;
         DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString := memDetalle.Text;
         DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString := edtAdq.Text;
         DMLOG.cdsDOrdComp.FieldByName('CCOMERID').asString := dblcFPago.Text;
         DMLOG.cdsDOrdComp.FieldByName('CLAUXID').asString := xProv;
         DMLOG.cdsDOrdComp.FieldByName('PROV').asString := dblcdProv.Text;
   ////////////////Datos Adicionales
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

         Try
            DMLOG.cdsDOrdComp.Post;
         Except
            ShowMessage('Error 47 en un Post en el cdsOrdComp..');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            Raise;
            exit;
         End;

         OnOffDetalle(True); // activar detalle
         pnlDetalleA.Visible := False;
         CalcTotal(Nil);
      Except
         On E: Exception Do EHandlerError(E);
      End;
      Z2btnDesc.Enabled := True;
   End;
End;

Procedure TFRegOrdC.Z2bbtnRegCancClick(Sender: TObject);
Begin
   dbgDReqs.Enabled := true;
   If iEst = 0 Then
   Begin
      DMLOG.cdsDODCxDRQS.Cancel;
      DMLOG.cdsDOrdComp.Cancel;
      iEst := 1;
   End;
   OnOffDetalle(True); // activar detalle
   pnlDetalleA.Visible := False;
End;

Procedure TFRegOrdC.OnOffCabecera(Value: Boolean);
Begin
  // ....................... activar cabecera de requisición ...................
   pnlCabecera.Enabled := Value;
   Z2bbtnBorrar.Enabled := Value;
   Z2bbtnOK.Enabled := Value;
End;

Procedure TFRegOrdC.OnOffDetalle(Value: Boolean);
Begin
   If Value Then
      stxTitulo1.Color := clHighlight
   Else
      stxTitulo1.Color := clGray;

   pnlDetalleG.Enabled := Value;
   Z2bbtnCanc2.Enabled := Value;
   Z2bbtnGraba.Enabled := Value;
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

Procedure TFRegOrdC.btnDetalle;
Var
   bDummy1, bDummy2: Boolean;
   xSQL: String;
Begin
   If DMLOG.cdsDOrdComp.Active = False Then
   Begin
      DMLOG.cdsDOrdComp.Close;
      xSQL := 'SELECT * FROM LOG305 WHERE CIAID=''' + dblcCIA.text + ''' AND ODCID=''' + dbeNReg.Text + '''';
      DMLOG.cdsDOrdComp.Datarequest(xSQL);
      DMLOG.cdsDOrdComp.Open;
   End;
   bDummy1 := (DMLOG.cdsDOrdComp.RecordCount > 0) And ((DMLOG.cdsOrdComp.ChangeCount > 0) Or (DMLOG.cdsDOrdComp.ChangeCount > 0));
   bDummy2 := (DMLOG.cdsDOrdComp.RecordCount > 0) And (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'INICIAL');

   Z2bbtnGraba.Enabled := bDummy1;
   Z2bbtnCanc2.Enabled := bDummy1;
   Z2bbtnAcepta.Enabled := bDummy2;
End;

Procedure TFRegOrdC.Z2bbtnSalirClick(Sender: TObject);
Begin
   If (DMLOG.wModo = 'A') And
      (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'INICIAL') And
      (DMLOG.cdsOrdComp.FieldbyName('ODCVISADOR').IsNull) And
      (Length(Trim(xOrdElim)) > 0) Then
   Begin
      DMLOG.cdsDOrdComp.First;
      While Not DMLOG.cdsDOrdComp.Eof Do
         DMLOG.cdsDOrdComp.Delete;
      DMLOG.cdsOrdComp.Delete;

      DMLOG.DCOM1.AppServer.IniciaTransaccion;
      Try
         DeletTodoLOG304;
      Except
         ShowMessage('Error 62 al Borrar LOG304 - SALIR');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      Try
         DeletTodoLOG305;
      Except
         ShowMessage('Error 63 al Borrar LOG305 - SALIR');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      DMLOG.DCOM1.AppServer.GrabaTransaccion;

      DMLOG.wModo := '';
   End;
   Close;
End;

Procedure TFRegOrdC.dbgDReqsKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Var
   sSQL, sODC, sCIA, sART: String;
Begin
   If (Key = $4D) And (ssCtrl In Shift) Then //77 = ^M
   Begin
      dbgDReqsDblClick(Nil);
      btnDetalle;
   End;

   If (Key = VK_F5) Then //F5
      With DMLOG Do
      Begin
         sODC := cdsOrdComp.FieldByName('ODCID').AsString;
         sCIA := cdsOrdComp.FieldByName('CIAID').AsString;
         sART := cdsDOrdComp.FieldByName('ARTID').AsString;
         sSQL := 'SELECT * FROM LOG309 '
            + ' WHERE ODCID=''' + sODC + ''' AND'
            + ' CIAID=''' + sCIA + ''' AND ARTID=''' + sART + '''';
         cdsDReqs.Close;
         cdsDReqs.DataRequest(sSQL);
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
         If Question('Confirmar', 'Seguro de Eliminar : ' + #13 + #13 +
            'Articulo : ' + DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString) Then
         Begin
            DMLOG.cdsDODCxDRQS.Filtered := False;
            DMLOG.cdsDODCxDRQS.Filter := '';
            DMLOG.cdsDODCxDRQS.Filter := 'ARTID=''' + DMLOG.cdsDOrdComp.FieldByname('ARTID').AsString + '''';
            DMLOG.cdsDODCxDRQS.Filtered := True;
            DMLOG.cdsDODCxDRQS.First;
            While Not DMLOG.cdsDODCxDRQS.Eof Do
               DMLOG.cdsDODCxDRQS.Delete;

            DMLOG.cdsDOrdComp.Delete;
            CalcTotal(Nil);
         End;
      End
      Else
         ErrorMsg('Error', 'No se puede borrar...');
      btnDetalle;
      Z2bbtnGraba.Enabled := True;
   End;
End;

Procedure TFRegOrdC.dbgDReqsDblClick(Sender: TObject);
Var
   xWhere: String;
Begin
   If DMLOG.cdsDOrdComp.RecordCount = 0 Then
   Begin
      Information('Modulo de Compras', ' No Existen Registros a Editar ');
      Exit;
   End;
   If (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'ACEPTADO') Or
      (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'ATENDIDO') Then
   Begin
      Information('Modulo de Compras', 'Esta Orden de Compra está Aceptada' + #13 + 'No se puede Modificar');
      Exit;
   End;
   If Length(Trim(DMLOG.cdsOrdComp.fieldbyname('ODCVISADOR').AsString)) > 0 Then
   Begin
      Information('Modulo de Compras', 'Esta Orden de Compra ya a sido Visada ' + #13 + 'No se puede Modificar');
      Exit;
   End;
   Try
      Screen.Cursor := crHourGlass;
      OnOffDetalle(False); // Desactivar el panel de detalle
      dbeItem.Text := DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString;
      dbcldArti.Text := DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString;
      xWhere := 'ARTID = ''' + DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString + ''' ';
      If DMLOG.RecuperarDatos('TGE205', '*', xWhere) Then
      Begin
         If DMLOG.cdsQry.FieldByName('ARTISC').AsString = 'S' Then
            dbeISC.Enabled := True
         Else
            dbeISC.Enabled := False;
      End;
      dblcUMed.Text := DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString;
      dbeCnt.Text := Format('%0.3f', [DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsCurrency]);
      dbePUnit.Text := Format('%0.4f', [DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsCurrency]);
      dbeValVen.Text := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsCurrency]); //Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsCurrency*DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsCurrency]  );
      dbeDscto.Text := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsCurrency]);
      dbeImporte.Text := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsCurrency + (DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsCurrency * DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsCurrency / 100)]);

      dbeImpInd.Text := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsCurrency]);
      dbeISC.Text := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsCurrency]);
      edtAdq.Text := DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').AsString;
      memDetalle.Text := DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString;

      dbeCodProv.Text := trim(DMLOG.cdsDOrdComp.FieldByName('ARTIDPROV').AsString);
      dbeDescProv.Text := trim(DMLOG.cdsDOrdComp.FieldByName('ARTDESPROV').AsString);
      dblcUMEquiv.Text := trim(DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').AsString);
      dbePUEquiv.Text := trim(DMLOG.cdsDOrdComp.FieldByName('PUNTEQUIV').AsString);
      dbeCantEquiv.Text := trim(DMLOG.cdsDOrdComp.FieldByName('CNTEQUIV').AsString);
      If trim(dblcUMEquiv.Text) <> '' Then
      Begin
         If cds1.locate('UNMID', Vararrayof([dblcUMEquiv.Text]), []) Then
            dbeUMEquiv.Text := cds1.fieldbyname('UNMDES').AsString
         Else
            dbeUMEquiv.Text := '';
      End
      Else
         dbeUMEquiv.Text := '';
    //Datos del Panel de DetalleA//
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

Procedure TFRegOrdC.dbmObsKeyPress(Sender: TObject; Var Key: Char);
Var
   sC: String;
Begin
   sC := Key;
   sC := Uppercase(sC);
   Key := sC[1];
End;

Procedure TFRegOrdC.FormClose(Sender: TObject; Var Action: TCloseAction);
Var
   sSQL: String;
Begin
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

   DMLOG.DCOM1.AppServer.IniciaTransaccion;

   If pnlDetalleA.Visible Then
      Z2bbtnRegCancClick(Nil);

   If (DMLOG.wModo = 'A') And
      (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'INICIAL') And
      (DMLOG.cdsOrdComp.FieldbyName('ODCVISADOR').IsNull) And
      (Length(Trim(xOrdElim)) > 0) Then
   Begin

      sSQL := 'DELETE FROM LOG324 ' +
         'WHERE CIAID=''' + dblcCIA.Text + '''' +
         'AND ODCID=''' + dbeNReg.Text + '''' +
         'AND TIPOADQ=''C''';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         ShowMessage('Error 57 Delete LOG324 - Close');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      DMLOG.cdsDOrdComp.First;
      While Not DMLOG.cdsDOrdComp.Eof Do
         DMLOG.cdsDOrdComp.Delete;

      DMLOG.cdsOrdComp.Delete;

      sSQL := 'Delete LOG305 WHERE CIAID=''' + DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString + ''' And' +
         ' ODCID=''' + DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString + ''' ';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         ShowMessage('Error 57 Delete LOG305 - Close');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      sSQL := 'Delete LOG304 WHERE CIAID=''' + DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString + ''' And' +
         ' ODCID=''' + DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString + ''' ';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         ShowMessage('Error 58 Delete LOG304 - Close');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      DMLOG.DCOM1.AppServer.GrabaTransaccion;

      DMLOG.wModo := '';

   End;
   FOrdendeCompra.wTipoOC := '';
   DMLOG.wModo := '';
   Action := CAFree;
End;

Function TFRegOrdC.EHandlerError(Ex: Exception): Boolean;
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

Procedure TFRegOrdC.dbcldArtiChange(Sender: TObject);
Begin
   dblcUMed.Text := DMLOG.cdsArti.FieldByName('UNMIDU').AsString;
   edtUMed.Text := DMLOG.cdsArti.FieldByName('LKUMUABR').AsString;
End;

Procedure TFRegOrdC.dblcNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRegOrdC.dbeDsctoExit(Sender: TObject);
Var
   xTmp: String;
   xNumero: Currency;
Begin
   If trim(TCustomEdit(Sender).Text) <> strTMP Then
   Begin
      Try
         xnumero := strtocurr(TCustomEdit(Sender).Text);
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
            TCustomEdit(Sender).Text := DMLOG.LogDec(TCustomEdit(Sender).Text, DMLOG.wAnchoPu);
            ImporteDetalle;
         End;
      Except
         If (TCustomEdit(Sender).Text = '') Or (TCustomEdit(Sender).Text = '.') Then
         Begin
            TCustomEdit(Sender).Text := DMLOG.LogDec('', DMLOG.wAnchoPu);
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
         TCustomEdit(Sender).Text := DMLOG.LogDec(TCustomEdit(Sender).Text, DMLOG.wAnchoPu);
      End;
End;

{+.............................................................................+
 |   Calulo de los totales de la orden de compra                               |
 +.............................................................................+}

Procedure TFRegOrdC.CalcTotal(Sender: TObject);
Var
   rTC, rTot, rTD, rTi, rTf, rTp, rI, rX, rTTi, rIsc, rTisc, rTTisc: Currency;
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
         rI := (DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat * (DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsCurrency / 100)) + rI;
         rIsc := (DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat * (DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsCurrency / 100)) + rIsc;
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
   DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat := FRound(rTC, 15, 4);
   DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat := FRound(rTi, 15, 4);
   DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat := FRound(rTD, 15, 4);
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
   DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsCurrency := FRound(rTTi, 15, 4);
   DMLOG.cdsOrdComp.FieldByName('ODCTOTALISC').AsCurrency := FRound(rTTisc, 15, 4);
   DMLOG.cdsOrdComp.FieldByName('ODCTOTALG').AsCurrency := FRound(rX, 15, 4);

   Try
      DMLOG.cdsOrdComp.post;
   Except
      ShowMessage('Error 6 al realizar un Post en cdsOrdComp - Proc. CalcTotal');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Raise;
      Exit;
   End;

End;

Procedure TFRegOrdC.dedNProformaExit(Sender: TObject);
Begin
{ ..... }
   If Not DMLOG.cdsOrdComp.FieldByName('CIAID').IsNull Then
      If DMLOG.IsExistORD(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString,
         DMLOG.cdsOrdComp.FieldByName('ODCID').AsString) Then
      Begin
         Information('Error', 'Ya existe una Orden de Compra con ' + #13 +
            'con el mismo número ... ' + DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);

         DMLOG.cdsOrdComp.FieldByName('ODCID').AsString := DMLOG.MaxORDAnio(dblccia.Text, Copy(dbdtpFReg.Text, 7, 4));
      End;
End;

Procedure TFRegOrdC.dbrgTImpueChange(Sender: TObject);
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

Procedure TFRegOrdC.dblcdExits(Sender: TObject);
Var
   sSQL: String;
Begin
   If sender = dblcCIA Then
   Begin
      edtCIA.text := DMLOG.DisplayDescrip('prvSQL', 'TGE101', 'CIADES', 'CIAID=' + quotedStr(dblcCIA.text), 'CIADES');

      If DMLOG.wModo = 'M' Then
         Exit;

      dblcTipoAuxiliar.Text := 'P'; //por defecto tipo de auxiliar P
      dblcTipoAuxiliarExit(dblcTipoAuxiliar);
      DMLOG.cdsOrdComp.fieldbyName('CLAUXID').asString := 'P';

      If (FOrdendeCompra.wTipoOC = 'xRequisicion') Or
         (FOrdendeCompra.wTipoOC = 'xRequisicionTotal') Or (FOrdendeCompra.wTipoOC = 'xRequerimiento') Then
      Begin
         sNumORD := DMLOG.MaxORDAnio(dblccia.Text, Copy(dbdtpFReg.Text, 7, 4));
         DMLOG.cdsOrdComp.fieldbyName('ODCID').asString := sNumOrd;

         DMLOG.cdsFPago.close;
         DMLOG.cdsFPago.datarequest('SELECT * FROM CXC101 WHERE CIAID=' + quotedStr(dblcCIA.text) + ' ORDER BY CCOMERID');
         DMLOG.cdsFPago.open;

         If length(Trim(dblcCIA.Text)) = 0 Then
            exit;
         sSQL := 'SELECT COUNT(B.ARTID) AS TOTAL ';
         sSQL := sSQL + 'FROM LOG308 A, LOG309 B ';
         sSQL := sSQL + 'WHERE ((A.RQSEST=''ACEPTADO'') OR (A.RQSEST=''PARCIAL'')) ';
         sSQL := sSQL + 'AND (NOT A.RQSVISADOR IS NULL) ';
         sSQL := sSQL + 'AND B.CIAID=' + quotedstr(dblcCIA.Text) + ' ';
         sSQL := sSQL + 'AND A.CIAID=B.CIAID AND A.RQSID=B.RQSID(+) ';
         DMLOG.cdsQry.close;
         DMLOG.cdsQry.dataRequest(sSQL);
         DMLOG.cdsQry.open;
         If DMLOG.cdsQry.fieldbyName('TOTAL').asInteger = 0 Then
         Begin
            ErrorMsg('Error', 'Error, no se puede generar orden de compras' + #13 +
               'porque no hay requisiciones disponibles')
         End;
      End;
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
      If (DMLOG.wModo = 'A') Or (FOrdendeCompra.wTipoOC = 'xRequisicion') Or (FOrdendeCompra.wTipoOC = 'xRequisicionTotal') Or (FOrdendeCompra.wTipoOC = 'xRequerimiento') Then
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
      edtFPago.Text := DMLOG.DisplayDescrip('prvSQL', 'CXC101', 'CCOMERDES', 'CCOMERID=' + quotedStr(dblcFPago.Text), 'CCOMERDES');
      exit;
   End;

   If sender = dblcLEntrega Then
   Begin
      edtLEntrega.text := DMLOG.DisplayDescrip('prvSQL', 'TGE136', 'LGECDES', 'LGECID=' + quotedStr(dblcLEntrega.text), 'LGECDES');
      exit;
   End;

   If sender = dblcTipoCompra Then
   Begin
      If dblcTipoCompra.Text = '' Then
      Begin
         Information('Modulo de Compras', 'Tiene que seleccionar un tipo de Solicitud');
         Exit;
      End;
      edtTipoCompra.text := DMLOG.DisplayDescrip('prvSQL', 'TGE173', 'TIPADQDES', 'TIPOADQ=' + quotedStr(dblcTipoCompra.text), 'TIPADQDES');
      exit;
   End;
End;

Procedure TFRegOrdC.Z2btnDescClick(Sender: TObject);
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

Procedure TFRegOrdC.dbeDescExit(Sender: TObject);
Var
   rTD, rTC, rTf, rTo, rTi: Extended;
Begin
   If dbeDesc.DataSource.Dataset.State In [dsEdit, dsInsert] Then
   Begin
      rTC := DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat;
      rTD := DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat;
      rTf := 0; //DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat;
      rTi := DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat;
      rTo := (rTC - rTD) + rTf + rTi;
      DMLOG.cdsOrdComp.FieldByName('ODCTOTALG').AsFloat := FRound(rTo, 15, 4);
      Try
         DMLOG.cdsOrdComp.post;
      Except
         ShowMessage('Error 48 en un Post en el cdsOrdComp..');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;
      btnDetalle;
      dbeDesc.Enabled := False;
   End;
End;

Procedure TFRegOrdC.cdsDOrdCompBeforePost(DataSet: TDataSet);
Begin
End;

Procedure TFRegOrdC.BitBtn1Click(Sender: TObject);
Begin
   pnlRRA.Visible := False;
   pnlCabecera.Enabled := True;
   OnOffDetalle(True);
   Z2bbtnRegresa.Enabled := True;
End;

Procedure TFRegOrdC.Z2bbtnPrintClick(Sender: TObject);
Var
   EstImp: String;
Begin
   Screen.Cursor := crHourGlass;
   EstImp := DMLOG.DisplayDescrip('prvTGE', 'LOG106', 'FLAG', 'ESTDES=''' + DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString + '''', 'FLAG');
   xVan := 0;
   ppReportOC;
   ppDBCab.DataSource := DMLOG.dsQry;
   ppdbOC.DataSource := DMLOG.dsSQL;
   Screen.Cursor := crDefault;
   DMLOG.cdscia.Locate('CIAID', VarArrayOf([dblcCIA.Text]), []);
   fg_RecuperaSubReporte;
   If DMLOG.cdscia.FieldByName('CIASUGOC').AsString = 'S' Then
   Begin
      pprOCPE.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\OrdComp.rtm';
      pprOCPE.Template.LoadFromFile;
      Try
         If wRptCia <> 'Incoresa' Then
            ppLabel20.Caption := UpperCase(edtTipoCompra.Text);
         If EstImp = 'IE' Then
            ppDBText10.Visible := True;
         If dblcCIA.text = '02' Then
            pplCia.Caption := 'Servicios Generales';
         If (dblcCIA.text <> '02') Then
            pplCia.Caption := edtCIA.Text;
      Except
      End;

      Diseno.Report := pprOCPE;
      If DMLOG.wUsuario = 'HNORIEGA' Then
         Diseno.ShowModal
      Else
         pprOCPE.Print;

      pprOCPE.Stop;
   End
   Else
   Begin
      Diseno.Report := pprOCP;
      pprOCP.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\OrdCompCia.rtm';
      pprOCP.Template.LoadFromFile;
      pprOCP.Print;
      pprOCP.Stop;
   End;
   ppDBCab.DataSource := Nil;
   ppdbOC.DataSource := Nil;
End;

Procedure TFRegOrdC.ppReportOC;
Var
   xProv, sSQL, sCIA, sOC: String;
Begin
   xProv := DMLOG.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');
   sOC := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;
   sCIA := DMLOG.cdsOrdComp.FieldByName('CIAID').AsString;

   sSQL := 'SELECT TGE101.CIADES, TGE101.CIARUC, TGE101.CIATLF, TGE101.CIAFAX, TGE101.CIADIRE, TGE201.PROV, ' +
      'TGE201.PROVDES, TGE201.PROVDIR, TGE201.PROVTELF, TGE201.PROVREPR, TGE201.PROVRUC, ' +

   'TGE201.PROVFAX, LOG304.ODCFATE, LOG304.ODCOBS, TGE136.LGECDES, TGE136.LGECABR, TGE103.TMONABR, ' +

   'CXC101.CCOMERDES, LOG304.ODCID, LOG304.ODCFEMI, LOG304.ODCIXTCC, LOG304.ODCTCAMB, LOG304.ODCEST, ' +
      'LOG304.ODCTTIMPU, LOG304.ODCTOTALISC, LOG304.ODCTOTALG, TGE006.USERNOM USUARIO, A.USERNOM VISADO ' +

   ',LOG304.ODCUSER, LOG304.PROFID, LOG304.NUMREQUSU, LOG304.FECPAG ' +

   'FROM LOG304, TGE101, TGE201, TGE136, TGE103, CXC101, TGE006, TGE006 A ' +
      'WHERE  LOG304.CIAID = ''' + sCIA + ''' ' +
      'AND LOG304.ODCID = ''' + sOC + ''' ' +
      'AND LOG304.CIAID = TGE101.CIAID(+) ' +
   'AND LOG304.PROV  = TGE201.PROV(+) ' +
      'AND LOG304.CLAUXID = TGE201.CLAUXID(+) ' +
      'AND LOG304.LGECID = TGE136.LGECID(+) ' +
      'AND LOG304.TMONID = TGE103.TMONID(+) ' +
      'AND LOG304.CCOMERID = CXC101.CCOMERID(+) ' +
      'AND LOG304.CIAID = CXC101.CIAID(+) ' +
      'AND LOG304.ODCUSER  = TGE006.USERID(+) ' +
      'AND LOG304.ODCVISADOR = A.USERID(+) ';
   DMLOG.cdsQry.DisableControls;
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.ProviderName := 'prvLOG';
   DMLOG.cdsQry.DataRequest(sSQL);
   DMLOG.cdsQry.Open;
   DMLOG.cdsQry.EnableControls;

   sSQL := 'SELECT ' + //CASE WHEN ARTIDPROV IS NULL THEN LOG305.ARTID ELSE ARTIDPROV END ARTID, ' +
      'DECODE(ARTIDPROV, NULL, LOG305.ARTID, ARTIDPROV) ARTID, ' +
      'DODCOBS ARTDES, UM1.UNMABR, ' +
      'DECODE(UNMIDEQUIV, NULL, DODCCNT, CNTEQUIV) AS DODCCNT, ' +
      'DECODE(UNMIDEQUIV, NULL, DODCPUN, PUNTEQUIV) AS DODCPUN, ' +
      'DECODE(UNMIDEQUIV, NULL, DODCCNT * DODCPUN - ( DODCCNT * DODCPUN )*NVL( DODCDSCTO ,0 ) /100, ' +
      'CNTEQUIV * PUNTEQUIV - ( CNTEQUIV * PUNTEQUIV )*NVL( DODCDSCTO ,0 ) /100) ' +
      'DODCIMP, DODCDSCTO, DODCCSLD, DODCCSLDU, DODCCATE, DODCCATEU ' +
      'FROM LOG305, TGE130 UM2, TGE130 UM1, TGE205 ' +
      'WHERE LOG305.CIAID = ''' + sCIA + ''' ' +
      'AND LOG305.ODCID = ''' + sOC + ''' ' +
      'AND LOG305.UNMIDEQUIV = UM2.UNMID(+) ' +
      'AND LOG305.UNMID = UM1.UNMID(+) ' +
      'AND TGE205.ARTID(+) = LOG305.ARTID ' +
      'AND TGE205.CIAID(+) = LOG305.CIAID ' +
      'AND TGE205.TINID(+) = LOG305.TINID';
   DMLOG.cdsSQL.DisableControls;
   DMLOG.cdsSQL.Close;
   DMLOG.cdsSQL.DataRequest(sSQL);
   DMLOG.cdsSQL.Open;
   DMLOG.cdsSQL.EnableControls;
End;

Procedure TFRegOrdC.dblcdProvEnter(Sender: TObject);
Begin
   strTMP := trim(TCustomEdit(Sender).Text);
End;

Procedure TFRegOrdC.dblcdProvExit(Sender: TObject);
Var
   xTmp: String;
   xsMensaje: String;
   xsSql: String;
Begin
   If xCrea Then Exit;
   xsSql := ' CLAUXID = ' + QuotedStr(dblcTipoAuxiliar.Text) + ' AND PROV = ' + QuotedStr(dblcdProv.text);
   DMLOG.cdsOrdComp.fieldbyName('PROVDES').AsString := DMLOG.DisplayDescrip('prvSQL', 'TGE201', 'PROVDES', xsSql, 'PROVDES');
   If DMLOG.cdsOrdComp.fieldbyName('PROVDES').AsString = '' Then
   Begin
      ShowMessage('Proveedor no Existe');
      DMLOG.cdsOrdComp.fieldbyName('CLAUXID').AsString := '';
      DMLOG.cdsOrdComp.fieldbyName('PROV').AsString := '';
      dblcTipoAuxiliar.SetFocus;
      Exit;
   End;
   xsTipoAuxiliar := DMLOG.cdsOrdComp.fieldbyName('CLAUXID').AsString;
   If xsTipoAuxiliar <> '' Then DMLOG.cdsOrdComp.fieldbyName('CLAUXID').AsString := xsTipoAuxiliar;
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

Procedure TFRegOrdC.Z2bbtnBorrarClick(Sender: TObject);
Begin
   If FRegOrdC = Nil Then
      Exit;
   DMLOG.cdsOrdComp.CancelUpdates;
   DMLOG.cdsDOrdComp.CancelUpdates;
   DMLOG.cdsOrdComp.edit;
End;

Procedure TFRegOrdC.ValidaCab;
Begin
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

Procedure TFRegOrdC.ValidaTot;
Begin
   If (DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').AsCurrency = 0) Or
      (DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').IsNull) Then
      Raise Exception.create('Ingrese Importes');
End;

Procedure TFRegOrdC.ValidaDet;
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

Procedure TFRegOrdC.dbeCntEnter(Sender: TObject);
Begin
   strTmp := TCustomEdit(Sender).Text;
End;

Procedure TFRegOrdC.dbeCntExit(Sender: TObject);
Var
   xTmp: String;
   xNumero: Currency;
Begin
   If trim(TCustomEdit(Sender).Text) <> strTMP Then
   Begin
      Try
         xnumero := strtocurr(TCustomEdit(Sender).Text);
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
      If dblcTipoCompra.text = 'C' Then
      Begin
         If Length(Trim(DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString)) > 0 Then
            dbgDOCxDrqs.ReadOnly := true
         Else
         Begin
            DMLOG.cdsDODCxDRQS.Filtered := False;
            dbgDOCxDrqs.ReadOnly := False;
         End;
         pnlDetalleA.Enabled := False;

         DMLOG.cdsDODCxDRQS.FieldByName('ARTID').ReadOnly := False;
         DMLOG.cdsDODCxDRQS.FieldByName('RQSID').ReadOnly := False;

         DMLOG.cdsDODCxDRQS.Filtered := False;
         DMLOG.cdsDODCxDRQS.Filter := '';
         DMLOG.cdsDODCxDRQS.Filter := 'ARTID=''' + dbcldArti.Text + '''';
         DMLOG.cdsDODCxDRQS.Filtered := True;

         DMLOG.cdsDODCxDRQS.FieldByName('ARTID').ReadOnly := True;
         DMLOG.cdsDODCxDRQS.FieldByName('RQSID').ReadOnly := True;

         pnlCant.Visible := True;
         pnlCant.BringToFront;
         CalCant;
         dbgDOCxDrqs.SetFocus;
      End
      Else
      Begin

      End;
   End;
End;

Procedure TFRegOrdC.ImporteDetalle;
Var
   rD, rC, rU, rI, rTIMP, rVVen, rISC: Currency;
Begin
   rC := StrToCurr(dbeCnt.Text);
   rU := StrToCurr(dbePUnit.Text);
   If (rc = 0) Or (ru = 0) Then
   Begin
      dbeImporte.Text := DMLOG.LogDec('', 2);
      Exit;
   End;
   If trim(dbeDscto.Text) = '' Then dbeDscto.Text := '0.00';
   If trim(dbeImpInd.Text) = '' Then dbeImpInd.Text := '0.00';
   If trim(dbeISC.Text) = '' Then dbeISC.Text := '0.00';
   rD := StrToCurr(dbeDscto.Text);
   rI := StrToCurr(dbeImpInd.Text);
   rISC := StrToCurr(dbeISC.Text);

   rTIMP := (rC * rU) - ((rC * rU) * (rD / 100));
   rTIMP := rTIMP + ((rTIMP) * (rI / 100)) + ((rTIMP) * (rISC / 100));

   rVVen := (rC * rU) - ((rC * rU) * (rD / 100));
   dbeImporte.Text := Format('%0.2f', [rTIMP]);
   dbeValVen.Text := Format('%0.2f', [rVVen]);
End;

Procedure TFRegOrdC.Z2bbtnMasMenosClick(Sender: TObject);
Var
   sSQL: String;
Begin
   If Z2bbtnMasMenos.Caption = '+' Then
   Begin
      ValidaDet;
      Z2bbtnMasMenos.Top := gbxprov.Top + gbxprov.Height + 5;
      gbxProv.Visible := true;
      Z2bbtnMasMenos.Caption := '-';
    //recuperacion de unidaddes de medida equiv.
      cds1.close;
      sSQL := 'SELECT CASE WHEN EUNMID1 = ''' + TRIM(dblcUMed.Text) + ''' THEN ' +
         '                EUNMID2                                                           ' +
         '                    WHEN EUNMID2 = ''' + TRIM(dblcUMed.Text) + ''' THEN                 ' +
         '                EUNMID1                                      ' +
         '                ELSE NULL                                   ' +
         '                END UNMID,                                       ' +
         '                CASE WHEN EUNMID1 = ''' + TRIM(dblcUMed.Text) + ''' THEN                ' +
         '                      EUNMEQ                                ' +
         '                ELSE                                        ' +
         '                      CAST(1/EUNMEQ AS DECIMAL(15,4))       ' +
         '                END EUNMEQ,                                       ' +
         '            TGE130.UNMDES                                   ' +
         'FROM TGE156                                                 ' +
         'LEFT JOIN TGE130                                            ' +
         'ON (                                                        ' +
         '               CASE WHEN EUNMID1 = ''' + TRIM(dblcUMed.Text) + ''' THEN                 ' +
         '               UNMID2                                       ' +
         '                    WHEN EUNMID2 = ''' + TRIM(dblcUMed.Text) + ''' THEN                 ' +
         '                UNMID1                                       ' +
         '               END = TGE130.UNMID                           ' +
         '      )                                                     ' +
         'WHERE                                                       ' +
         'NOT CASE WHEN EUNMID1 = ''' + TRIM(dblcUMed.Text) + ''' THEN                            ' +
         '                EUNMID1                                      ' +
         '                    WHEN EUNMID2 = ''' + TRIM(dblcUMed.Text) + ''' THEN                 ' +
         '                EUNMID2                                      ' +
         '                ELSE NULL                                   ' +
         '                END IS NULL                                 ';

      cds1.DataRequest(sSQL);
  //
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

Procedure TFRegOrdC.dblcUMEquivExit(Sender: TObject);
Begin
   dblcUMEquiv.Text := trim(dblcUMEquiv.Text);
   If trim(dblcUMEquiv.Text) <> '' Then
      If cds1.Locate('UNMID', Vararrayof([trim(dblcUMEquiv.Text)]), []) Then
      Begin
         dbeUMEquiv.Text := cds1.fieldbyname('UNMDES').AsString;
         dbePUEquiv.Text := DMLOG.logdec(currtostr(cds1.fieldbyname('FACTOR').Ascurrency * strtocurr(dbePUnit.text)));
         dbeCantEquiv.Text := DMLOG.logdec(currtostr(cds1.fieldbyname('FACTOR').Ascurrency * strtocurr(dbeCnt.text)));
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

Procedure TFRegOrdC.ActualizaAxP;
Var
   cdsClone: TwwClientDataSet;
   xSQL: String;
Begin
   cdsClone := TwwClientDataSet.create(self);
   cdsclone.CloneCursor(DMLOG.cdsDOrdComp, true);
   cdsclone.filter := 'ODCID = ''' + dbeNReg.Text + ''' AND ' +
      ' ( ( NOT (ARTIDPROV IS NULL  )) AND ( TRIM(ARTIDPROV  ) <> '''' ) ' +
      ' OR  ( NOT (ARTDESPROV IS NULL )) AND ( TRIM(ARTDESPROV ) <> '''' ) ' +
      ' OR  ( NOT (UNMIDEQUIV IS NULL )) AND ( TRIM(UNMIDEQUIV ) <> '''' ) )';
   cdsClone.filtered := True;
   If cdsClone.RecordCount > 0 Then
   Begin
    //Recupera del servidor
      DMLOG.cdsGrab.close;
      xSQL := 'SELECT * FROM TGE215 WHERE PROV = ''' + trim(dblcdProv.Text) + ''' ';
      DMLOG.cdsGrab.DataRequest(xSQL);

      DMLOG.cdsGrab.Open;
      cdsClone.first;
      While Not cdsClone.eof Do
      Begin
         If DMLOG.cdsGrab.locate('ARTID', Vararrayof([cdsclone.fieldbyname('ARTID').asstring]), []) Then
         Begin
            xSQL := 'Update  TGE215  ' +
               'Set ARTIDPROV=''' + cdsClone.fieldbyname('ARTIDPROV').AsString + ''',' +
               '    UNMIDPROV=''' + cdsClone.fieldbyname('UNMIDPROV').AsString + ''',' +
               '   ARTDESPROV=''' + cdsClone.fieldbyname('ARTDESPROV').AsString + ''' ' +
               'Where PROV=''' + trim(dblcdProv.Text) + ''' And  ARTID=''' + cdsclone.fieldbyname('ARTID').asstring + ''' ';
         End
         Else
         Begin
            xSQL := 'Insert Into TGE215(PROV,ARTID,ARTIDPROV,UNMIDPROV,ARTDESPROV) VALUES(' +
               '''' + trim(dblcdProv.Text) + ''',''' + cdsClone.fieldbyname('ARTID').AsString + ''',' +
               '''' + cdsClone.fieldbyname('ARTIDPROV').AsString + ''',''' + cdsClone.fieldbyname('UNMIDPROV').AsString + ''',' +
               '''' + cdsClone.fieldbyname('ARTDESPROV').AsString + ''' )';
         End;
         DMLOG.cdsgrab.fieldbyname('ARTIDPROV').AsString := cdsClone.fieldbyname('ARTIDPROV').AsString;
         DMLOG.cdsgrab.fieldbyname('UNMIDPROV').AsString := cdsClone.fieldbyname('UNMIDPROV').AsString;
         DMLOG.cdsgrab.fieldbyname('ARTDESPROV').AsString := cdsClone.fieldbyname('ARTDESPROV').AsString;
         Try
            DMLOG.cdsgrab.Post;
         Except
            ShowMessage('Error 27 al realizar un Post a cdsgrab');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            Raise;
            exit;
         End;

         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error 37 al realizar un Update a TGE215 ');
            DMLOG.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            Raise;
            exit;
         End;
         cdsClone.Next;
      End;
   End;

End;

Procedure TFRegOrdC.ActualizaProf;
Begin

End;

Procedure TFRegOrdC.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TDBMemo Then Exit;
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFRegOrdC.pprOCPEPreviewFormCreate(Sender: TObject);
Begin
   pprOCPE.PreviewForm.ClientHeight := 500;
   pprOCPE.PreviewForm.ClientWidth := 650;
   tppviewer(pprOCPE.PreviewForm.Viewer).zoomSetting := zspageWidth;
End;

Procedure TFRegOrdC.pprOCPAfterPrint(Sender: TObject);
Begin
   If DMLOG.cdsOrdComp.FieldByName('ODCFATE').IsNull Then
   Begin
      DMLOG.cdsOrdComp.Edit;
      DMLOG.cdsOrdComp.FieldByName('ODCFATE').AsDateTime := Date;
      Try
         DMLOG.cdsOrdComp.Post;
      Except
         ShowMessage('Error 49 al realizar un Post a cdsOrdComp');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      xsql := 'Update LOG304 SET  ODCFATE=SYSDATE ' +
         'Where CIAID =''' + DMLOG.cdsOrdComp.FieldByName('CIAID').asString + ''' AND ' +
         '      ODCID =''' + DMLOG.cdsOrdComp.FieldByName('ODCID').asString + ''' ';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error 50 al realizar un Update a LOG304 - ODCFATE ');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;
    //Final HPC_201405_LOG
   End;
End;

Procedure TFRegOrdC.pprOCPBeforePrint(Sender: TObject);
Var
   sSQL, sConta: String;
Begin
   sConta := '';
   sSQL := 'SELECT DISTINCT RQSID FROM LOG324 WHERE CIAID=''' + dblcCIA.Text + ''' AND ODCID=''' + DMLOG.cdsOrdComp.fieldbyName('ODCID').asString + ''' AND DODCCNT>0 ORDER BY RQSID';
   DMLOG.cdsLOG.Close;
   DMLOG.cdsLOG.DataRequest(sSQL);
   DMLOG.cdsLOG.Open;
   DMLOG.cdsLOG.First;
   While Not DMLOG.cdsLOG.Eof Do
   Begin
      sConta := sConta + DMLOG.cdsLOG.FieldByName('RQSID').AsString + ', ';
      DMLOG.cdsLOG.Next;
   End;
   ppLabel8.Text := sConta;

End;

Procedure TFRegOrdC.pprOCPPreviewFormCreate(Sender: TObject);
Begin
   pprOCP.PreviewForm.ClientHeight := 500;
   pprOCP.PreviewForm.ClientWidth := 650;
   tppviewer(pprOCP.PreviewForm.Viewer).zoomSetting := zspageWidth;
End;

Procedure TFRegOrdC.dblcUMedExit(Sender: TObject);
Begin
   edtUMed.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE130', 'UNMDES', 'UNMID=' + quotedStr(dblcUMed.Text), 'UNMDES');
End;

Procedure TFRegOrdC.ProXReq;
Var
   xSQL: String;
Begin
   DMLOG.cdsRqsArtX.MasterSource := Nil;
   DMLOG.cdsRqsArtX.MasterFields := '';
   DMLOG.cdsRqsArtX.IndexFieldNames := '';

   xSQL := 'SELECT A.CIAID, B.ARTID, B.UNMIDG, B.UNMIDU, B.RQSFLAGUM, B.RQSMARK, SUBSTR(B.DRQSOBS,1,100) AS ARTDES, B.TIPOADQ, ';
   xSQL := xSQL + 'SUM(NVL(B.DRQSCNSG,0)) AS RXACNTSG, SUM(NVL(B.DRQSCNAG,0)) AS RXACNTAG, ';
   xSQL := xSQL + 'SUM(NVL(B.DRQSCNSG,0)-NVL(B.DRQSCNAG,0)) AS RXASALDOG, ';
   xSQL := xSQL + 'SUM(NVL(B.DRQSCNSU,0)) AS RXACNTSU, SUM(NVL(B.DRQSCNAU,0)) AS RXACNTAU, ';
   xSQL := xSQL + 'SUM(NVL(B.DRQSCNSU,0)-NVL(B.DRQSCNAU,0)) AS RXASALDOU ';
   xSQL := xSQL + 'FROM LOG308 A, LOG309 B, TGE205 C ';
   xSQL := xSQL + 'WHERE (( A.RQSEST=' + quotedstr('ACEPTADO') + ' ) OR ( A.RQSEST=' + quotedstr('PARCIAL') + ')) ';
   xSQL := xSQL + 'AND ( (NVL(B.DRQSCNSG,0)-NVL(B.DRQSCNAG,0)>0) ';
   xSQL := xSQL + 'OR (NVL(B.DRQSCNSU,0)-NVL(B.DRQSCNAU,0)>0) ) ';
   xSQL := xSQL + ' AND ( NOT A.RQSVISADOR IS NULL ) ';
   xSQL := xSQL + ' AND A.CIAID=' + quotedstr(FRegOrdC.dblcCIA.Text);
   xSQL := xSQL + ' AND A.TIPOADQ=' + quotedStr(dblcTipoCompra.text);
   xSQL := xSQL + ' AND A.CIAID=B.CIAID(+) ';
   xSQL := xSQL + 'AND A.RQSID=B.RQSID(+) ';
   xSQL := xSQL + 'AND B.ARTID=C.ARTID(+) ';
   xSQL := xSQL + 'GROUP BY  A.CIAID, B.ARTID, B.RQSFLAGUM, B.UNMIDG, B.UNMIDU, B.RQSMARK, SUBSTR(B.DRQSOBS,1,100), B.TIPOADQ';

   DMLOG.cdsArtPendX.Close;
   DMLOG.cdsArtPendX.DataRequest(xSQL);
   DMLOG.cdsArtPendX.Open;
   xSQL := 'SELECT B.CIAID, B.RQSID, B.DRQSID, B.ARTID, B.RQSFLAGUM, B.DRQSCNSG, B.DRQSCNAG, B.DRQSCNSG-B.DRQSCNAG DRQSSLDG, B.TIPOADQ, ';
   xSQL := xSQL + 'B.UNMIDG, B.DRQSCNSU, B.DRQSCNAU, B.DRQSCNSU-B.DRQSCNAU DRQSSLDU, B.UNMIDU, A.RQSFREQ, A.CCOSID, A.PRIOID, ';
   xSQL := xSQL + 'A.RQSSOLI, A.RQSAUTOR, A.RQSAPRO, A.RQSEST, A.RQSFATE, A.RQSFREG, A.LOCID, ';
   xSQL := xSQL + 'C.GRARID, D.CCOSDES, G.UNMDES UNMGDES, H.UNMDES UNMUDES, SUBSTR(B.DRQSOBS,1,100) as ARTDES ';
   xSQL := xSQL + 'FROM LOG309 B, LOG308 A, TGE205 C, TGE203 D, TGE130 G, TGE130 H ';
   xSQL := xSQL + 'WHERE A.RQSEST <> ' + quotedstr('ATENDIDO') + ' ';
   xSQL := xSQL + 'AND ( NVL(B.DRQSCNSG,0) - NVL(B.DRQSCNAG,0) > 0 ';
   xSQL := xSQL + 'OR NVL(B.DRQSCNSU,0) - NVL(B.DRQSCNAU,0) > 0 ) ';
   xSQL := xSQL + 'AND B.CIAID=' + quotedstr(FRegOrdC.dblcCIA.Text) + ' ';
   xSQL := xSQL + 'AND ( NOT A.RQSVISADOR IS NULL ) ';
   xSQL := xSQL + 'AND B.TIPOADQ=' + quotedStr(dblcTipoCompra.text) + ' ';
   xSQL := xSQL + 'AND A.CIAID=B.CIAID ';
   xSQL := xSQL + 'AND A.LOCID=B.LOCID ';
   xSQL := xSQL + 'AND A.RQSID=B.RQSID ';
   xSQL := xSQL + 'AND B.ARTID=C.ARTID ';
   xSQL := xSQL + 'AND B.CIAID=C.CIAID ';
   xSQL := xSQL + 'AND B.TINID=C.TINID ';
   xSQL := xSQL + 'AND A.CCOSID=D.CCOSID(+) ';
   xSQL := xSQL + 'AND B.UNMIDG=G.UNMID(+) ';
   xSQL := xSQL + 'AND B.UNMIDU=H.UNMID(+) ';
   DMLOG.cdsRqsArtX.Close;
   DMLOG.cdsRqsArtX.datarequest(xSQL);
   DMLOG.cdsRqsArtX.MasterSource := DMLOG.dsArtPendX;
   DMLOG.cdsRqsArtX.MasterFields := 'ARTDES';
   DMLOG.cdsRqsArtX.IndexFieldNames := 'ARTDES';
   DMLOG.cdsRqsArtX.Open;
End;

Procedure TFRegOrdC.ProXReqTot;
Var
   xSQL: String;
Begin
   xSQL := 'SELECT A.CIAID, A.RQSID, A.TIPOADQ, A.CCOSID, A.PRIOID, D.CCOSDES, ';
   xSQL := xSQL + 'A.RQSSOLI, A.RQSAUTOR, A.RQSAPRO, A.RQSEST, A.RQSFATE, A.RQSFREG, A.LOCID, A.RQSVISADOR, ';
   xSQL := xSQL + 'A.RQSVISHREG, A.RQSUSER, RQSHREG, A.RQSCOMPID, A.URQUSR, A.URQHREG, A.URQACEPUSR, A.URQACEPHREG ';
   xSQL := xSQL + 'FROM LOG308 A, TGE203 D ';
   xSQL := xSQL + 'WHERE (( A.RQSEST=' + quotedstr('ACEPTADO') + ' ) OR ( A.RQSEST=' + quotedstr('PARCIAL') + ')) ';
   If Prm_RqsPedUsu <> 'S' Then
      xSQL := xSQL + 'AND ( NOT A.RQSVISADOR IS NULL ) ';
   xSQL := xSQL + 'AND A.CIAID=' + quotedstr(FRegOrdC.dblcCIA.Text) + ' ';
   xSQL := xSQL + 'AND A.TIPOADQ=' + quotedStr(dblcTipoCompra.text) + ' ';
   xSQL := xSQL + 'AND A.CCOSID = D.CCOSID(+) ORDER BY RQSID';

   DMLOG.cdsArtPendXTot.Close;
   DMLOG.cdsArtPendXTot.DataRequest(xSQL);
   DMLOG.cdsArtPendXTot.Open; // Detalle

   xSQL := 'SELECT B.CIAID, B.RQSID, B.DRQSID, B.ARTID, B.RQSFLAGUM, B.DRQSCNSG, B.DRQSCNAG, ';
   xSQL := xSQL + 'NVL(B.DRQSCNSG,0)-NVL(B.DRQSCNAG,0) AS RXACNTSG, B.TIPOADQ, ';
   xSQL := xSQL + 'B.UNMIDG, B.DRQSCNSU, B.DRQSCNAU, NVL(B.DRQSCNSU,0)-NVL(B.DRQSCNAU,0) AS RXACNTSU, ';
   xSQL := xSQL + 'B.UNMIDU, A.RQSFREQ, A.CCOSID, A.PRIOID, ';
   xSQL := xSQL + 'A.RQSSOLI, A.RQSAUTOR, A.RQSAPRO, B.RQSEST, A.RQSFATE, A.RQSFREG, A.LOCID, ';
   xSQL := xSQL + 'C.GRARID, D.CCOSDES, G.UNMDES UNMGDES, H.UNMDES UNMUDES, B.DRQSOBS as ARTDES, A.RQSVISADOR ';
   xSQL := xSQL + 'FROM LOG309 B, LOG308 A, TGE205 C, TGE203 D, TGE130 G, TGE130 H ';
   xSQL := xSQL + 'WHERE B.RQSEST <> ' + quotedstr('ATENDIDO') + ' ';
   xSQL := xSQL + 'AND ( NVL(B.DRQSCNSG,0) - NVL(B.DRQSCNAG,0) > 0 ';
   xSQL := xSQL + ' OR NVL(B.DRQSCNSU,0) - NVL(B.DRQSCNAU,0) > 0 ) ';
   xSQL := xSQL + 'AND B.CIAID=' + quotedstr(FRegOrdC.dblcCIA.Text) + ' ';
   xSQL := xSQL + 'AND B.TIPOADQ=' + quotedStr(dblcTipoCompra.text) + ' ';
   If Prm_RqsPedUsu <> 'S' Then
      xSQL := xSQL + 'AND ( NOT A.RQSVISADOR IS NULL ) ';
   xSQL := xSQL + 'AND A.CIAID=B.CIAID(+) AND A.LOCID=B.LOCID(+) AND A.RQSID=B.RQSID(+) ';
   xSQL := xSQL + 'AND B.ARTID = C.ARTID(+) ';
   xSQL := xSQL + 'AND B.CIAID = C.CIAID(+) ';
   xSQL := xSQL + 'AND B.TINID = C.TINID(+) ';
   xSQL := xSQL + 'AND A.CCOSID= D.CCOSID(+) ';
   xSQL := xSQL + 'AND B.UNMIDG= G.UNMID(+) ';
   xSQL := xSQL + 'AND B.UNMIDU= H.UNMID(+) ';
   xSQL := xSQL + 'ORDER BY RQSID, DRQSID';

   DMLOG.cdsRqsArtXTot.Close;
   DMLOG.cdsRqsArtXTot.datarequest(xSQL);

   DMLOG.cdsRqsArtXTot.MasterSource := DMLOG.dsArtPendXTot;
   DMLOG.cdsRqsArtXTot.MasterFields := 'RQSID';
   DMLOG.cdsRqsArtXTot.IndexFieldNames := 'RQSID';
   DMLOG.cdsRqsArtXTot.Open;
End;

Procedure TFRegOrdC.dbeNRegExit(Sender: TObject);
Var
   sSQL: String;
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
      sSQL := 'SELECT * FROM LOG305 WHERE CIAID=''' + dblcCIA.text + ''' AND ODCID=''' + sNumOrd + '''';
      DMLOG.cdsDOrdComp.Close;
      DMLOG.cdsDOrdComp.dataRequest(sSQL);
      DMLOG.cdsDOrdComp.Open;
      DMLOG.cdsDOrdComp.enableControls;
   End;
End;

Procedure TFRegOrdC.bbtnCerrarClick(Sender: TObject);
Begin
   dbeCnt.Text := xCant;
   DMLOG.cdsDODCxDRQS.Cancel;
   pnlDetalleA.Enabled := true;
   DMLOG.cdsDODCxDRQS.Filtered := False;
   DMLOG.cdsDODCxDRQS.Filter := '';
   DMLOG.cdsDODCxDRQS.Filtered := True;
   DMLOG.cdsDODCxDRQS.FieldByName('ARTID').ReadOnly := False;
   DMLOG.cdsDODCxDRQS.FieldByName('RQSID').ReadOnly := False;
   pnlCant.Visible := false;
End;

Procedure TFRegOrdC.bbtnAceptarClick(Sender: TObject);
Begin
   dbeCnt.Text := Format('%0.3f', [xMtoCnt]);
   xCant := dbeCnt.Text;
   pnlDetalleA.Enabled := True;
   pnlCant.Visible := False;
   DMLOG.cdsDODCxDRQS.Filtered := False;
   DMLOG.cdsDODCxDRQS.Filter := '';
   DMLOG.cdsDODCxDRQS.Filtered := True;
   DMLOG.cdsDODCxDRQS.FieldByName('ARTID').ReadOnly := False;
   DMLOG.cdsDODCxDRQS.FieldByName('RQSID').ReadOnly := False;

   dbePUnit.SetFocus;
End;

Procedure TFRegOrdC.CalCant;
Var
   sSQL, xCIAid, xODCid, xDODCI, xARTid: String;
Begin
   xCIAid := DMLOG.cdsOrdComp.FieldByName('CIAID').AsString;
   xODCid := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;
   xDODCi := DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString;
   xARTid := dbcldArti.Text;
   sSQL := 'CIAID=''' + xCIAid + ''' AND ODCID=''' + xODCid + ''' AND DODCID=''' + xDODCi + '''';
   xMtoCnt := DMLOG.OperClientDataSet(DMLOG.cdsDODCxDRQS, 'SUM(DODCCNT)', sSQL);
   dbgDOCxDrqs.ColumnByName('DODCCNT').FooterValue := FloattoStrF(xMtoCnt, ffNumber, 15, 2);
End;

Procedure TFRegOrdC.dbgDOCxDrqsCellChanged(Sender: TObject);
Begin
   If xflag Then
   Begin
      xflag := false;
      CalCant;
      xflag := True;
   End
End;

Procedure TFRegOrdC.dbgDOCxDrqsExit(Sender: TObject);
Begin
   CalCant;
End;

Procedure TFRegOrdC.Z2bbtnColocacClick(Sender: TObject);
Var
   xSql: String;
Begin
   If (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) <> 'ACEPTADO') Then
   Begin
      Information('Modulo de Compras', 'Para que pueda Realizar la Colocación Tiene que estar Aceptada la Orden de Compra ');
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
   Try
      DMLOG.cdsOrdComp.Post;
   Except
      ShowMessage('Error 51 al realizar un Post a cdsOrdComp - Colocación');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;

   xSql := 'Update LOG304 SET  OCCOLOCAC=''' + DMLOG.wUsuario + ''',OCCOLOFREG=TRUNC(SYSDATE),OCCOLOHREG=SYSDATE ' +
      'Where CIAID =''' + DMLOG.cdsOrdComp.FieldByName('CIAID').asString + ''' AND ' +
      '      ODCID =''' + DMLOG.cdsOrdComp.FieldByName('ODCID').asString + ''' ';
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error 52 al realizar un Update a LOG304 - Colocación ');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;

   Z2bbtnColocac.Enabled := False;
End;

Procedure TFRegOrdC.GenerProfOCompra;
Var
   NumOC: String;
   xSQL, ConCom: String;
Begin
   xSQL := 'CIAID=' + QuotedStr(dblcCIA.Text) + ' AND CCOMERID=' + QuotedStr(dblcFPago.Text);
   If DMLOG.displaydescrip('prvSQL', 'CXC101', 'CREDITO', xSQL, 'CREDITO') = 'S' Then
      ConCom := '1'
   Else
      ConCom := '2';
   NumOC := DMLOG.cdsOrdComp.fieldbyname('ODCID').AsString;

   xSQL := 'INSERT INTO LOG312 ( ' +
      ' CIAID, PROFID, PROV, FPAGOID, TMONID, PROFFEMI, PROFTEN, PROFVALID, PROFTCAMB, ' +
      ' PROFIXFLE, PROFIXTCC, PROFIXTD, PROFIXTI, PROFEST, PROFOBS, PROFUSER, ' +
      ' PROFFREG, PROFHREG, PROFANO, PROFMM, PROFDD, PROFTRI, PROFSEM, PROFSS, PROFANOMM, ' +
      ' PROFAATRI, PROFAASEM, PROFAASS, PROFTOTALG, PROFTIMP, PROFTTIMPU, ' +
      ' PROFEVAL, PROFISC, FAUTOGEN, PROFGENER, TIPOADQ, ' +
      ' ODCID, PROFCONCOM) ' +
      'SELECT CIAID, ' + QuotedStr('OC' + NumOC) + ', PROV, CCOMERID, TMONID, ' + DMLOG.wRepFecServi + ' ,ODCTEN, ' +
      'ODCVALID, ODCTCAMB, ODCIXFLE, ODCIXTCC, ' +
      'ODCIXTD, ODCIXTI, ''ACEPTADO'', ' +
      QuotedStr('GENERADO POR EL SISTEMA DESDE LA ORDEN DE COMPRA ' + NumOC) + ', ' +
      'ODCUSER, ODCFREG, ODCHREG, ODCANO, ODCMM, ODCDD, ' +
      'ODCTRI, ODCSEM, ODCSS, ODCANOMM, ODCAATRI, ODCAASEM, ODCAASS, ' +
      'ODCTOTALG, ODCTIMP, ODCTTIMPU, ''A'', ODCTOTALISC, ''S'', ''O/COMPRA'', TIPOADQ, ' +
      '''' + NumOC + ''', CCOMERID ' +
      'FROM LOG304 ' +
      'WHERE ODCID=''' + NumOC + '''';
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error 38 al realizar un Insert a LOG312');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;

   xSQL := 'INSERT INTO LOG313( ' +
      ' CIAID, PROFID, ARTID, UNMIDG, UNMIDU, DPROFLAGUM, DPROFID, DPROFCNTG, ' +
      ' DPROFCNTU, DPROFPUNG, DPROFPUNU, DPROFDSCTO, DPROFIMP, ' +
      ' DPROFIMPU, DPROFEVAL, DPROFISC, ODCID, TIPOADQ, DPROFOBS, DPROFCONCOM, DPROFTIPCCOM, ' +
      ' DPROFFREG, DPROFTEN, DPROFVALID, DPROFPRVD, DPROFPROV, ' +
      ' TINID, GRARID, FAMID, SFAMID,  PROFUSER, ' +
      ' PROFANO, PROFMES, PROFDIA, PROFTRIM, PROFSEM, PROFANOMES, PROFSS, PROFAATRI, PROFAASEM, PROFAASS ) ' +
      'SELECT CIAID, ' + QuotedStr('OC' + NumOC) + ', ARTID, ' +
      'DECODE(DODCCNTU, NULL, UNMID, NULL) UNMIDG, ' +
      'DECODE(DODCCNTU, NULL, NULL, UNMID) UNMIDU, ' +
      'DECODE(DODCCNTU, NULL, ''G'', NULL) FLAGUM, ' +
      'DODCID, ' +
      'DECODE(DODCCNTU, NULL, DODCCNT, NULL), ' +
      'DECODE(DODCCNTU, NULL, NULL, DODCCNT), ' +
      'DECODE(DODCCNTU, NULL, DODCPUN, NULL), ' +
      'DECODE(DODCCNTU, NULL, NULL, DODCPUN), ' +
      'DODCDSCTO, DODCIMP, DODCIMPU, ''A'', DODCISCU, ODCID, TIPOADQ, DODCOBS, CCOMERID, ' + QuotedStr(ConCom) + ', ' +
      DMLOG.wRepFuncDate + quotedstr(FormatDateTime(DMLOG.wFormatFecha, dbdtpFReg.Date)) + '), ' + dbseEnt.Text + ', ' +
      dbsbVal.Text + ', ''' + edtProv.Text + ''', ''' + dblcdProv.Text + ''', ' +
      'TINID, GRARID, FAMID, SFAMID,  ODCUSER, ' +
      'ODCANO, ODCMES, ODCDIA, ODCTRIM, ODCSEM, ODCANOMES, ODCSS, ODCAATRI, ODCAASEM, ODCAASS ' +
      'FROM LOG305 ' +
      'WHERE ODCID = ''' + NumOC + '''';
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error 39 al realizar un Insert a LOG313');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;
End;

Procedure TFRegOrdC.ppDetailBand3BeforePrint(Sender: TObject);
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

Procedure TFRegOrdC.pprOCPStartPage(Sender: TObject);
Begin
   xVan := 0;
End;

Procedure TFRegOrdC.ppDetailBand4BeforePrint(Sender: TObject);
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

Procedure TFRegOrdC.pprOCPEBeforePrint(Sender: TObject);
Var
   sSQL: String;
   nCont: Integer;
Begin
   sSQL := 'SELECT DISTINCT RQSID FROM LOG324 WHERE  CIAID=''' + dblcCIA.Text + ''' AND ODCID=''' + DMLOG.cdsOrdComp.fieldbyName('ODCID').asString + ''' AND DODCCNT > 0 ORDER BY RQSID';
   DMLOG.cdsLOG.Close;
   DMLOG.cdsLOG.DataRequest(sSQL);
   DMLOG.cdsLOG.Open;
   DMLOG.cdsLOG.First;
   pplReq1.Caption := '';
   pplReq2.Caption := '';
   pplReq3.Caption := '';
   pplReq4.Caption := '';
   nCont := 0;
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

Procedure TFRegOrdC.pprOCPEStartPage(Sender: TObject);
Begin
   xVan := 0;
End;

Procedure TFRegOrdC.bbtnAceObsAnuClick(Sender: TObject);
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

   Try
      DMLOG.cdsOrdComp.Post;
   Except
      ShowMessage('Error 43 al hacer Post en cdsOrdComp');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;

   DMLOG.cdsDOrdComp.disablecontrols;
   DMLOG.cdsDOrdComp.first;
   While Not DMLOG.cdsDOrdComp.eof Do
   Begin
      DMLOG.cdsDOrdComp.Edit;
      DMLOG.cdsDOrdComp.FieldbyName('ODCEST').AsString := 'ANULADO';
      Try
         DMLOG.cdsDOrdComp.Post;
      Except
         ShowMessage('Error 44 al hacer Post en cdsDOrdComp');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      DMLOG.cdsDOrdComp.Next;
   End;
   DMLOG.cdsDOrdComp.enablecontrols;

   Try
      ActAnulacion;
   Except
      ShowMessage('Error 46 al hacer ejecutar el Procedimiento - ActAnulacion ');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;

   pnlObsAnula.Visible := False;
   Screen.Cursor := crDefault;

End;

Procedure TFRegOrdC.bbtnCerObsAnuClick(Sender: TObject);
Begin
   pnlObsAnula.Visible := False;
End;

Procedure TFRegOrdC.Z2bbtnGrabaOCClick(Sender: TObject);
Begin
   Try

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
      FDepODC := TFDepODC.create(self);
      If Length(Trim(DMLOG.cdsOrdComp.FieldByName('ODCOBSDEP').AsString)) > 0 Then
      Begin
         FDepODC.memObsDep.Text := DMLOG.cdsOrdComp.FieldbyName('ODCOBSDEP').AsString;
      End;
      FDepODC.Show;
   Finally
   End;
End;

Procedure TFRegOrdC.dbeNRegKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In [' ', 'a'..'z',
      '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
      '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
      ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
      '.', '-', '_'] Then
      Key := #0;
End;

Procedure TFRegOrdC.FormShow(Sender: TObject);
Var
   sSQL: String;
Begin
   edtReqUsuario.DataSource := DMLOG.dsOrdComp;
   edtReqUsuario.DataField := 'NUMREQUSU';
   xProv := DMLOG.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');
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
      xProv := DMLOG.cdsOrdComp.FieldByName('CLAUXID').AsString;
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
   If FOrdendeCompra.wTipoOC = 'xProforma' Then
   Begin
      dblcdProv.Enabled := False;
      If Not DMLOG.cdsOrdComp.fieldbyname('PROV').IsNull Then
         If Not (trim(DMLOG.cdsOrdComp.fieldbyname('PROV').AsString) = '') Then
            If DMLOG.RecuperarDatos('TGE201', '*', 'PROV=''' + DMLOG.cdsOrdComp.fieldbyname('PROV').AsString + ''' ') Then
               edtProv.Text := DMLOG.cdsQry.fieldbyname('PROVDES').AsString;
      btnDetalle;
   End
   Else
   Begin
      dblcdProv.Enabled := True;
   End;

   OnOffVisar(False);

  // Aqui Inicio - para modificar los campos de Dscto, Impuesto, etc		 Todo esto en Comentario
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
   Begin
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
   End;
  // Aqui Final

   If (FOrdendeCompra.wTipoOC = 'xRequisicion') Or
      (FOrdendeCompra.wTipoOC = 'xRequisicionTotal') Or (FOrdendeCompra.wTipoOC = 'xRequerimiento') Then
   Begin
      DMLOG.FiltraTabla(DMLOG.cdsLEntrega, 'TGE136', 'LGECID', 'LGECID');
      If DMLOG.wModo <> 'M' Then
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
   End;
   If DMLOG.cdsOrdComp.State In [dsInsert] Then
      dblcCIA.Enabled := True
   Else
      dblcCIA.Enabled := False;

   sSQL := 'SELECT * FROM LOG305 ' +
      'WHERE CIAID=''' + dblcCIA.Text + ''' ' +
      'AND ODCID=''' + dbeNReg.Text + ''' ' +
      'ORDER BY CIAID, ODCID, DODCID';
   DMLOG.cdsDOrdComp.Close;
   DMLOG.cdsDOrdComp.DataRequest(sSQL);
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
      DMLOG.cdsDODCxDRQS.Close;
      DMLOG.cdsDODCxDRQS.DataRequest('SELECT * FROM LOG324 WHERE CIAID=''' + dblcCIA.Text + ''' AND ODCID=''' + dbeNReg.Text + '''');
      DMLOG.cdsDODCxDRQS.Open;
   End;

   If DMLOG.wModo = 'A' Then
   Begin
      xPriInser := 'A';

      If DMLOG.cdsCia.RecordCount = 1 Then
      Begin
         DMLOG.cdsOrdComp.FieldByName('CIAID').Value := DMLOG.cdsCia.FieldByname('CIAID').AsString;
         dblcdExits(dblcCIA);
         dblcCia.Enabled := False;
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
End;

Procedure TFRegOrdC.ppHeaderBand4BeforePrint(Sender: TObject);
Var
   sSQL: String;
   nCont: Integer;
Begin
   sSQL := 'SELECT DISTINCT RQSID FROM LOG324 WHERE  CIAID=''' + dblcCIA.Text + ''' AND ODCID=''' + DMLOG.cdsOrdComp.fieldbyName('ODCID').asString + ''' AND DODCCNT > 0 ORDER BY RQSID';
   DMLOG.cdsLOG.Close;
   DMLOG.cdsLOG.DataRequest(sSQL);
   DMLOG.cdsLOG.Open;
   DMLOG.cdsLOG.First;
   pplReq1.Caption := '';
   pplReq2.Caption := '';
   pplReq3.Caption := '';
   pplReq4.Caption := '';
   nCont := 0;
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

//activar o desactivar el botón Visar

Procedure TFRegOrdC.OnOffVisar(Value: Boolean);
//*********************************************************
// CREADO POR            : Abelardo Sulca Palomino
// FECHA DE CREACION     : 12/04/2011
// DESCRIPCION           : Habilita el botón de Visar evaluando antes si
//                         el usuario tiene acceso a esa opción o no
//*********************************************************
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
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest('SELECT * FROM TGE171 WHERE USERID=''' + DMLOG.wUsuario + ''' ');
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

Procedure TFRegOrdC.Z2bbtnVisadoClick(Sender: TObject);
//*********************************************************
// CREADO POR            : Abelardo Sulca Palomino
// FECHA DE CREACION     : 12/04/2011
// DESCRIPCION           : Visa la orden de compra
//*********************************************************
Var
   xMonto: Double;
   xsMensaje: String;
Begin
   If DMLOG.fg_ValidaDatosProveedor(DMLOG.cdsOrdComp.FieldByName('CLAUXID').AsString, DMLOG.cdsOrdComp.FieldByName('PROV').AsString, xsMensaje) = False Then
   Begin
      ShowMessage(xsMensaje);
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      exit;
   End;

   If MessageDlg('Está seguro de Visar la Orden de Compra?', mtConfirmation, [mbOK, mbCancel], 0) = mrok Then
   Begin
      If dblcTMoneda.Text <> DMLOG.wTMonLoc Then
         xMonto := DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').AsFloat * strtoFloat(dbeTCambio.text)
      Else
         xMonto := DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').AsFloat;
      If xMonto > xMontoVisar Then
      Begin
         ShowMessage('No puede Visar la actual Orden de Compra,' + #13 +
            ' ya que su monto máximo de Visación es :' + currtostr(xMontoVisar));
         exit;
      End;
      DMLOG.cdsOrdComp.edit;
      DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString := DMLOG.wUsuario;
      Try
         DMLOG.cdsOrdComp.post;
      Except
         ShowMessage('Error 39 al hacer Post en cdsOrdComp');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      xSQL := 'Update LOG304 Set ODCVISADOR=''' + DMLOG.wUsuario + ''' ' +
         'Where Ciaid=''' + dblcCIA.Text + ''' And  Odcid=''' + DMLOG.cdsOrdComp.FieldByname('ODCID').AsString + ''' ';
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(Xsql);
      Except
         ShowMessage('Error 40 al realizar un Update a LOG304 - VISADOR');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      Z2bbtnVisado.Enabled := False;
   End;
End;

Procedure TFRegOrdC.Z2bbtnOrdenpagoClick(Sender: TObject);
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
      FOrdenPago := TFOrdenPago.Create(Application); // LOG130
   End
   Else
   Begin
      ShowMessage('No existe orden de Compra seleccionado');
      Exit;
   End;
End;

Procedure TFRegOrdC.fg_RecuperaSubReporte;
Var
   xsSql: String;
Begin
   xsSql := ' SELECT LOG304.ODCTOTALG, ' +
      ' LOG304.ORDPAGTOT, ' +
      ' LOG304.ORDPAGPEN, ' +
      ' LOG131.CIAID, ' +
      ' LOG131.NUMORDPAG, ' +
      ' LOG131.FECHA, ' +
      ' LOG130.DOCID, ' +
      ' (SELECT TGE110.DOCDES FROM TGE110 ' +
      ' WHERE TGE110.DOCID = LOG130.DOCID ' +
      ' AND TGE110.DOCMOD IN (' + QuotedStr('CXP') + ',' + QuotedStr('LOG') + ')) OP_DOCUMENTO_DES , ' +
      ' LOG130.CPSERIE, ' +
      ' LOG130.CPNODOC, ' +
      ' LOG130.CPFEMIS, ' +
      ' LOG130.TOTAL, ' +
      ' (CASE WHEN LOG131.NUMORDPAG = (SELECT MAX(A.NUMORDPAG) FROM LOG131 A WHERE A.ODCCIAID = LOG131.ODCCIAID AND A.ODCID = LOG131.ODCID   )  ' +
      ' THEN ' + QuotedStr('Ultima Orden de Pago') +
      ' ELSE (CASE WHEN ABS(CXP301.CPSALORI) < 0.1 ' +
      ' THEN ' + QuotedStr('Documentos Pagados') +
      ' ELSE ' + QuotedStr('Documentos Pendientes de Pago') + ' END ) END) SECCION' +
      ' FROM LOG304, LOG130, LOG131, CXP301 ' +
      ' WHERE LOG304.CIAID = LOG131.ODCCIAID ' +
      ' AND LOG304.ODCID = LOG131.ODCID ' +
      ' AND LOG130.CIAID = LOG131.CIAID ' +
      ' AND LOG130.NUMORDPAG = LOG131.NUMORDPAG ' +
      ' AND LOG130.ODCCIAID = LOG131.ODCCIAID ' +
      ' AND LOG130.ODCID = LOG131.ODCID ' +
      ' AND LOG130.CPCIAID = CXP301.CIAID(+) ' +
      ' AND LOG130.PROV = CXP301.PROV(+) ' +
      ' AND LOG130.DOCID = CXP301.DOCID(+) ' +
      ' AND LOG130.CPSERIE = CXP301.CPSERIE(+) ' +
      ' AND LOG130.CPNODOC = CXP301.CPNODOC(+) ' +
      ' AND LOG131.ESTADO = ' + QuotedStr('ACEPTADO') +
      ' AND LOG130.CPESTTRA <> ' + QuotedStr('ANULADO') +
      ' AND LOG304.CIAID = ' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString) +
      ' AND LOG304.ODCID = ' + QuotedStr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);

   DMLOG.cdsReporte.Close;
   DMLOG.cdsReporte.DataRequest(xsSql);
   DMLOG.cdsReporte.Open;

   ppdbOrdenPagoPorOC.DataSource := DMLOG.dsReporte;
End;

Function TFRegOrdC.fg_ExisteOrdenPago(wgCiaid, wgNumOrdenCompra: String): Boolean;
Var
   xsSql: String;
Begin
   xsSql := ' SELECT LOG131.* ' +
      ' FROM LOG131  ' +
      ' WHERE LOG131.ODCCIAID = ' + QuotedStr(wgCiaid) +
      ' AND LOG131.ODCID = ' + QuotedStr(wgNumOrdenCompra) +
      ' AND LOG131.ESTADO <> ' + QuotedStr('ANULADO');
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xsSql);
   DMLOG.cdsQry.Open;
   If DMLOG.cdsQry.RecordCount > 0 Then
   Begin
      ShowMessage('Debe anular las Ordenes de Pago' + #13 + 'antes de Anular la Orden de Compra');
      Result := True;
      Exit;
   End;
   Result := False;
End;

Procedure TFRegOrdC.fg_ListaReqPendientes;
Var
   xsSql: String;
Begin

   xsSql := ' SELECT LOG306.CIAID, ' + //COMPANIA --COMPAÑÍA DONDE SE REGISTRO
      ' LOG306.LOCID,LOG306.CCOSID, ' +
      ' LOG306.URQID, ' + // REQUERIMIENTO, --NUMERO DE REQUERIMIENTO
      ' LOG306.TIPOADQ, ' + //  TIPO_REQUERIMIENTO, --Tipo de requerimento
      ' LOG306.CCOSID, ' + //  CC_REGISTRO, --CENTRO DE COSTO DEL REGISTRO
      ' LOG306.URQEST, ' + //  ESTADO,--estado del requerimiento [ACEPTADO/INICIAL]
      ' LOG306.URQESTUSR, ' + //  SITUACION, --situación requerimiento [EMITIDO/AUTORIZADO/JEFE DE AREA]
      ' LOG306.URQSOLIC, ' + //  CCDESTINO, --centro de costo de destino
      ' LOG306.URQSOLICDES, ' + //  CCDESTINODES, --descripcion del centro de costo de destino
      ' LOG306.URQOBS, ' + //  OBSERVACION, --OBSERVACION
      ' LOG306.URQUSR, ' + //  USUARIO_REGISTRO, --usuario que registró el requerimento
      ' LOG306.URQFREG, ' + //  FECHA_REGISTRO, --fecha de registro
      ' LOG306.URQACEPUSR, ' + //  USUARIO_ACEPTA , --usuario acepta
      ' LOG306.URQACEPFREG, ' + //  FECHA_ACEPTA, --fecha en que se acepta
      ' LOG306.URQANOMM, ' + //  PERIODO, --periodo
      ' LOG306.GENOC ' + // --GENERA ORDEN DE COMPRA
      ' FROM LOG306 ' +
      ' WHERE LOG306.CIAID = ' + QuotedStr(dblcCIA.Text) +
      ' AND LOG306.URQEST = ' + QuotedStr('ACEPTADO') +
      ' AND NVL(LOG306.GENOC,' + QuotedStr('N') + ') = ' + Quotedstr('S') +
      ' AND NOT EXISTS (SELECT 1 FROM LOG304 WHERE LOG304.CIAID = LOG306.CIAID ' +
      ' AND LOG304.NUMREQUSU = LOG306.URQID' +
      ' AND LOG304.ODCEST <> ' + QuotedStr('ANULADO') + ' )';

   DMLOG.cdsArtPendXTot.Close;
   DMLOG.cdsArtPendXTot.DataRequest(xsSql);
   DMLOG.cdsArtPendXTot.Open;

   xsSql := ' SELECT LOG307.*,TGE205.ARTDES  FROM LOG307, TGE205  ' +
      ' WHERE LOG307.CIAID = TGE205.CIAID(+)' +
      ' AND LOG307.TINID = TGE205.TINID(+)' +
      ' AND LOG307.ARTID = TGE205.ARTID(+)' +
      ' AND EXISTS (SELECT 1 FROM LOG306 WHERE LOG307.CIAID = LOG306.CIAID ' +
      ' AND LOG307.LOCID = LOG306.LOCID ' +
      ' AND LOG307.CCOSID = LOG306.CCOSID ' +
      ' AND LOG307.URQID = LOG306.URQID ' +
      ' AND LOG306.CIAID = ' + QuotedStr(dblcCIA.Text) +
      ' AND LOG306.URQEST = ' + QuotedStr('ACEPTADO') +
      ' AND NVL(LOG306.GENOC,' + QuotedStr('N') + ') = ' + Quotedstr('S') + ')';
   DMLOG.cdsRqsArtXTot.Close;
   DMLOG.cdsRqsArtXTot.datarequest(xsSql);

   DMLOG.cdsRqsArtXTot.MasterSource := DMLOG.dsArtPendXTot;
   DMLOG.cdsRqsArtXTot.MasterFields := 'CIAID; LOCID;CCOSID;URQID';
   DMLOG.cdsRqsArtXTot.IndexFieldNames := 'CIAID; LOCID;CCOSID;URQID';
   DMLOG.cdsRqsArtXTot.Open;

End;

Procedure TFRegOrdC.fg_PorRequerimiento;
Var
   xsCompania, xsNumOC: String;
Begin
   xsCompania := DMLOG.cdsOrdComp.FieldByName('CIAID').AsString;
   xsNumOC := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;
   FListaRequermientos := TFListaRequermientos.create(Application);
   If FListaRequermientos.showModal = mrCancel Then
      exit;
   iEstado := 0;

   If DMLOG.cdsOrdComp.State <> DsEdit Then
   Begin
      DMLOG.cdsOrdComp.Edit;
      DMLOG.cdsOrdComp.FieldByName('NUMREQUSU').AsString := DMLOG.cdsRqsArtXTot.fieldbyname('URQID').AsString;
      Try
         DMLOG.cdsOrdComp.Post;
      Except
         ShowMessage('Error 75 en el Post del cdsOrdComp');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;
   End;

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
      Try
         DMLOG.cdsDOrdComp.Post;
      Except
         ShowMessage('Error 74 en el Post del cdsDOrdComp');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         Raise;
         exit;
      End;

      DMLOG.cdsRqsArtXTot.Next;
   End;

   OnOffDetalle(True); // activar detalle
   pnlDetalleA.Visible := False;

   Try
      CalcTotal(Nil);
   Except
      ShowMessage('Error 13 al calcular los totales - CalcTotal');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;

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

Function TFRegOrdC.fg_ValidaDetalle: Boolean;
Var
   xbBoolean: Boolean;
Begin
   xbBoolean := True;
   DMLOG.cdsDOrdComp.Prior;
   While Not DMLOG.cdsDOrdComp.eof Do
   Begin
      If DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsFloat = 0 Then
      Begin
         xbBoolean := False;
      End;
      DMLOG.cdsDOrdComp.Next;
   End;
   If xbBoolean = False Then
   Begin
      ShowMessage('Debe ingresar el Precio Unitario a todos los Artículos');
   End;
   Result := xbBoolean;
End;

Procedure TFRegOrdC.dblcTipoAuxiliarExit(Sender: TObject);
Var
   xsSql: String;
Begin
   If dblcTipoAuxiliar.Text = '' Then
   Begin
      ShowMessage('Debe Ingresar el Tipo de Auxiliar del Proveedor');
      dblcTipoAuxiliar.SetFocus;
      Exit;
   End;
   xProv := dblcTipoAuxiliar.Text;
   xsSql := ' CLAUXID = ' + QuotedStr(dblcTipoAuxiliar.Text) + ' AND PROV = ' + QuotedStr(dblcdProv.Text);
   If (DMLOG.DisplayDescrip('prvTGE', 'TGE201', 'PROVDES', xsSql, 'PROVDES') = edtProv.Text) And (edtProv.Text <> '') Then
   Begin
      Exit;
   End;
   DMLOG.FiltraTabla(DMLOG.cdsProv, 'TGE201', 'PROV', 'PROV', 'ACTIVO = ' + QuotedStr('S') + ' AND CLAUXID = ' + QuotedStr(dblcTipoAuxiliar.Text));
   dblcdProv.Text := '';
   edtProv.Text := '';
   DMLOG.cdsOrdComp.fieldbyName('PROV').asString := '';
   DMLOG.cdsOrdComp.fieldbyName('PROVDES').asString := '';
End;

Procedure TFRegOrdC.ActAnulacion;
Var
   xSql: String;
Begin
   xSql := 'Update LOG304 Set ' +
      'ODCEST=''ANULADO'',' +
      'ODCANULA=''' + DMLOG.cdsOrdComp.FieldbyName('ODCANULA').AsString + ''',' +
      'ODCOBSANU=''' + DMLOG.cdsOrdComp.FieldByName('ODCOBSANU').AsString + ''',' +
      'OCANUFREG=TRUNC(SYSDATE),' +
      'OCANUHREG=SYSDATE ' +
      'Where CIAID =''' + DMLOG.cdsOrdComp.FieldByName('CIAID').asString + ''' AND ' +
      'ODCID =''' + DMLOG.cdsOrdComp.FieldByName('ODCID').asString + ''' ';
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error 45 al Actualizar ANULA - LOG304');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;

   xSql := 'Update LOG305 Set ODCEST=''ANULADO'' ' +
      'Where CIAID =''' + DMLOG.cdsOrdComp.FieldByName('CIAID').asString + ''' AND ' +
      '      ODCID =''' + DMLOG.cdsOrdComp.FieldByName('ODCID').asString + ''' ';
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error 46 al Actualizar ANULA - LOG305');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;

End;

Procedure TFRegOrdC.ActualizaLOG304;
Var
   xSql: String;
Begin

   xSql := 'Select CIAID,ODCID ' +
      'From  LOG304 ' +
      'Where  CIAID=''' + DMLOG.cdsOrdComp.FieldByName('CIAID').AsString + ''' And ' +
      'ODCID=''' + DMLOG.cdsOrdComp.FieldByName('ODCID').AsString + '''  ';
   DMLOG.cdsQry10.Close;
   DMLOG.cdsQry10.DataRequest(xSql);
   DMLOG.cdsQry10.Open;
   If DMLOG.cdsQry10.RecordCount = 0 Then
   Begin
      xSQL := 'Insert Into LOG304(CIAID,ODCID,ODCOBS,CLAUXID,ODCEST,ODCTOTALG,ODCIXTCC,ODCTTIMPU,' +
         'ODCIXTD,ODCIXFLE,ODCUSER,ODCANO,ODCMM,ODCDD,ODCANOMM,ODCTRI,ODCSEM,ODCSS,ODCAATRI,ODCAASEM,' +
         'ODCAASS,ODCFREG,ODCHREG,ODCVISADOR,OCVISFREG,OCVISHREG,ORDPAGPEN,ODCACEPFREG,ODCACEPHREG,' +
         'ODCTOTALISC,ODCTCAMB,PROVDES,PROV,ODCFATE,OCCOLOCAC,OCCOLOFREG,OCCOLOHREG,ODCFEMI,ODCTEN,ODCVALID,TMONID,CCOMERID,LGECID,TIPOADQ) Values(' +
         '''' + DMLOG.cdsOrdComp.FieldByName('CIAID').asString + ''',' +
         '''' + DMLOG.cdsOrdComp.fieldbyName('ODCID').asString + ''',' +
         '''' + DMLOG.cdsOrdComp.fieldbyname('ODCOBS').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldbyName('CLAUXID').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString + ''',' +
         '''' + FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').AsFloat) + ''',' +
         '''' + FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat) + ''',' +
         '''' + FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat) + ''',' +
         '''' + FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat) + ''',' +
         '''' + FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat) + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldbyName('ODCUSER').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldbyName('ODCANO').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldbyName('ODCMM').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldbyName('ODCDD').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldbyName('ODCANOMM').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldbyName('ODCTRI').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldbyName('ODCSEM').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldbyName('ODCSS').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldbyName('ODCAATRI').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldbyName('ODCAASEM').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldbyName('ODCAASS').AsString + ''',' +
         'TRUNC(SYSDATE),' +
         'SYSDATE,' +
         '''' + DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString + ''',' +
         'TRUNC(SYSDATE),' +
         'SYSDATE,' +
         '''' + FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ORDPAGPEN').AsFloat) + ''',' +
         'TRUNC(SYSDATE),' +
         'SYSDATE,' +
         '''' + DMLOG.cdsOrdComp.FieldByName('ODCTOTALISC').AsString + ''',' +
         '''' + FloatToStr(DMLOG.cdsOrdComp.fieldbyName('ODCTCAMB').AsFloat) + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldByName('PROV').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldByName('ODCFATE').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldByName('OCCOLOCAC').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldByName('OCCOLOFREG').AsString + ''',' +
         'SYSDATE,' +
         '''' + DMLOG.cdsOrdComp.fieldbyName('ODCFEMI').AsString + ''',' +
         '''' + IntToStr(DMLOG.cdsOrdComp.fieldbyName('ODCTEN').asInteger) + ''',' +
         '''' + IntToStr(DMLOG.cdsOrdComp.fieldbyName('ODCVALID').asInteger) + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldByName('TMONID').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldByName('CCOMERID').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldByName('LGECID').AsString + ''',' +
         '''' + DMLOG.cdsOrdComp.FieldByName('TIPOADQ').AsString + ''')';
   End
   Else
   Begin
      Xsql := 'Update LOG304 Set ' +
         'CIAID=''' + DMLOG.cdsOrdComp.FieldByName('CIAID').asString + ''',' +
         'ODCID=''' + DMLOG.cdsOrdComp.fieldbyName('ODCID').asString + ''',' +
         'ODCOBS=''' + DMLOG.cdsOrdComp.fieldbyname('ODCOBS').AsString + ''',' +
         'CLAUXID=''' + DMLOG.cdsOrdComp.FieldbyName('CLAUXID').AsString + ''',' +
         'ODCEST=''' + DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString + ''',' +
         'ODCTOTALG=' + FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').AsFloat) + ',' +
         'ODCIXTCC=' + FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat) + ',' +
         'ODCTTIMPU=' + FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat) + ',' +
         'ODCIXTD=' + FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat) + ',' +
         'ODCIXFLE=' + FloatToStr(DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat) + ',' +
         'ODCUSER=''' + DMLOG.cdsOrdComp.FieldbyName('ODCUSER').AsString + ''',' +
         'ODCANO=''' + DMLOG.cdsOrdComp.FieldbyName('ODCANO').AsString + ''',' +
         'ODCMM=''' + DMLOG.cdsOrdComp.FieldbyName('ODCMM').AsString + ''',' +
         'ODCDD=''' + DMLOG.cdsOrdComp.FieldbyName('ODCDD').AsString + ''',' +
         'ODCANOMM=''' + DMLOG.cdsOrdComp.FieldbyName('ODCANOMM').AsString + ''',' +
         'ODCTRI=''' + DMLOG.cdsOrdComp.FieldbyName('ODCTRI').AsString + ''',' +
         'ODCSEM=''' + DMLOG.cdsOrdComp.FieldbyName('ODCSEM').AsString + ''',' +
         'ODCSS=''' + DMLOG.cdsOrdComp.FieldbyName('ODCSS').AsString + ''',' +
         'ODCAATRI=''' + DMLOG.cdsOrdComp.FieldbyName('ODCAATRI').AsString + ''',' +
         'ODCAASEM=''' + DMLOG.cdsOrdComp.FieldbyName('ODCAASEM').AsString + ''',' +
         'ODCAASS=''' + DMLOG.cdsOrdComp.FieldbyName('ODCAASS').AsString + ''',' +
         'ODCFREG=TRUNC(SYSDATE),' +
         'ODCHREG=SYSDATE,' +
         'ODCVISADOR=''' + DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString + ''',' +
         'OCVISFREG=TRUNC(SYSDATE),' +
         'OCVISHREG=SYSDATE,' +
         'ORDPAGPEN=' + FloatToStr(DMLOG.cdsOrdComp.FieldbyName('ORDPAGPEN').AsFloat) + ',' +
         'ODCACEPFREG=TRUNC(SYSDATE),' +
         'ODCACEPHREG=SYSDATE,' +
         'ODCTOTALISC=''' + DMLOG.cdsOrdComp.FieldByName('ODCTOTALISC').AsString + ''',' +
         'ODCTCAMB=' + FloatToStr(DMLOG.cdsOrdComp.fieldbyName('ODCTCAMB').AsFloat) + ',' +
         'PROVDES=''' + DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString + ''',' +
         'PROV=''' + DMLOG.cdsOrdComp.FieldByName('PROV').AsString + ''',' +
         'ODCFATE=''' + DMLOG.cdsOrdComp.FieldByName('ODCFATE').AsString + ''',' +
         'OCCOLOCAC=''' + DMLOG.cdsOrdComp.FieldByName('OCCOLOCAC').AsString + ''',' +
         'OCCOLOFREG=''' + DMLOG.cdsOrdComp.FieldByName('OCCOLOFREG').AsString + ''',' +
         'OCCOLOHREG=SYSDATE,' +
         'ODCFEMI=''' + DMLOG.cdsOrdComp.fieldbyName('ODCFEMI').AsString + ''',' +
         'ODCTEN=''' + DMLOG.cdsOrdComp.fieldbyName('ODCTEN').AsString + ''',' +
         'ODCVALID=''' + DMLOG.cdsOrdComp.fieldbyName('ODCVALID').AsString + ''',' +
         'TMONID=''' + DMLOG.cdsOrdComp.fieldbyName('TMONID').AsString + ''',' +
         'CCOMERID=''' + DMLOG.cdsOrdComp.fieldbyName('CCOMERID').AsString + ''',' +
         'LGECID=''' + DMLOG.cdsOrdComp.fieldbyName('LGECID').AsString + ''',' +
         'TIPOADQ=''' + DMLOG.cdsOrdComp.fieldbyName('TIPOADQ').AsString + ''' ' +
         'Where CIAID =''' + DMLOG.cdsOrdComp.FieldByName('CIAID').asString + ''' AND ' +
         'ODCID =''' + DMLOG.cdsOrdComp.FieldByName('ODCID').asString + ''' ';
   End;

   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error 42 al Actualizar - LOG304');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;
End;

Procedure TFRegOrdC.ActualizaLOG305;
Var
   xSql: String;
Begin
   xSql := 'Select CIAID,ODCID,DODCID,ARTID ' +
      'From  LOG305 ' +
      'Where  CIAID=''' + DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString + ''' And ' +
      'ODCID=''' + DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString + ''' And ' +
      'DODCID=''' + DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString + ''' And ' +
      'ARTID=''' + DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString + ''' ';
   DMLOG.cdsQry10.Close;
   DMLOG.cdsQry10.DataRequest(xSql);
   DMLOG.cdsQry10.Open;
   If DMLOG.cdsQry10.RecordCount = 0 Then
   Begin
      Xsql := 'Insert Into  LOG305(CIAID,ODCID,DODCID,ARTID,' +
         'UNMID,DODCCNT,DODCPUN,DODCDSCTO,DODCIMP,DODCIMPU,IMPTOT,IMPUNI,DODCISCU,' +
         'DODCOBS,TIPOADQ,CCOMERID,PROV,DODCCSLD,ODCEST,DODCCATE,TINID,GRARID,DODCCSLDU,' +
         'FAMID,SFAMID,ODCANO,ODCMES,ODCDIA,ODCANOMES,ODCTRIM,ODCSEM,ODCSS,ODCAATRI,' +
         'ODCAASEM,ODCAASS,ODCUSER,ARTIDPROV,ARTDESPROV,UNMIDEQUIV,PUNTEQUIV,CNTEQUIV,' +
         'CLAUXID,ODCFREG) Values(' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('IMPUNI').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('CCOMERID').asString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('PROV').asString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('DODCCSLD').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ODCEST').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('DODCCATE').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('TINID').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('GRARID').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('DODCCSLDU').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('FAMID').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('SFAMID').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ODCANO').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ODCMES').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ODCDIA').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ODCANOMES').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ODCTRIM').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ODCSEM').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ODCSS').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ODCAATRI').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ODCAASEM').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ODCAASS').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ODCUSER').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ARTIDPROV').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('ARTDESPROV').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('PUNTEQUIV').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldByName('CNTEQUIV').AsString + ''',' +
         '''' + DMLOG.cdsDOrdComp.FieldbyName('CLAUXID').AsString + ''',SYSDATE)';
   End
   Else
   Begin
      Xsql := 'Update LOG305 Set ' +
         'CIAID=''' + DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString + ''',' +
         'ODCID=''' + DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString + ''',' +
         'DODCID=''' + DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString + ''',' +
         'ARTID=''' + DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString + ''',' +
         'UNMID=''' + DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString + ''',' +
         'DODCCNT=''' + DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString + ''',' +
         'DODCPUN=''' + DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsString + ''',' +
         'DODCDSCTO=''' + DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsString + ''',' +
         'DODCIMP=''' + DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsString + ''',' +
         'DODCIMPU=''' + DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString + ''',' +
         'IMPTOT=''' + DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsString + ''',' +
         'IMPUNI=''' + DMLOG.cdsDOrdComp.FieldByName('IMPUNI').AsString + ''',' +
         'DODCISCU=''' + DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsString + ''',' +
         'DODCOBS=''' + DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString + ''',' +
         'TIPOADQ=''' + DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString + ''',' +
         'CCOMERID=''' + DMLOG.cdsDOrdComp.FieldByName('CCOMERID').asString + ''',' +
         'PROV=''' + DMLOG.cdsDOrdComp.FieldByName('PROV').asString + ''',' +
         'DODCCSLD=''' + DMLOG.cdsDOrdComp.FieldByName('DODCCSLD').AsString + ''',' +
         'ODCEST=''' + DMLOG.cdsDOrdComp.FieldByName('ODCEST').AsString + ''',' +
         'DODCCATE=''' + DMLOG.cdsDOrdComp.FieldByName('DODCCATE').AsString + ''',' +
         'TINID=''' + DMLOG.cdsDOrdComp.FieldByName('TINID').AsString + ''',' +
         'GRARID=''' + DMLOG.cdsDOrdComp.FieldByName('GRARID').AsString + ''',' +
         'DODCCSLDU=''' + DMLOG.cdsDOrdComp.FieldByName('DODCCSLDU').AsString + ''',' +
         'FAMID=''' + DMLOG.cdsDOrdComp.FieldByName('FAMID').AsString + ''',' +
         'SFAMID=''' + DMLOG.cdsDOrdComp.FieldByName('SFAMID').AsString + ''',' +
         'ODCANO=''' + DMLOG.cdsDOrdComp.FieldByName('ODCANO').AsString + ''',' +
         'ODCMES=''' + DMLOG.cdsDOrdComp.FieldByName('ODCMES').AsString + ''',' +
         'ODCDIA=''' + DMLOG.cdsDOrdComp.FieldByName('ODCDIA').AsString + ''',' +
         'ODCANOMES=''' + DMLOG.cdsDOrdComp.FieldByName('ODCANOMES').AsString + ''',' +
         'ODCTRIM=''' + DMLOG.cdsDOrdComp.FieldByName('ODCTRIM').AsString + ''',' +
         'ODCSEM=''' + DMLOG.cdsDOrdComp.FieldByName('ODCSEM').AsString + ''',' +
         'ODCSS=''' + DMLOG.cdsDOrdComp.FieldByName('ODCSS').AsString + ''',' +
         'ODCAATRI=''' + DMLOG.cdsDOrdComp.FieldByName('ODCAATRI').AsString + ''',' +
         'ODCAASEM=''' + DMLOG.cdsDOrdComp.FieldByName('ODCAASEM').AsString + ''',' +
         'ODCAASS=''' + DMLOG.cdsDOrdComp.FieldByName('ODCAASS').AsString + ''',' +
         'ODCUSER=''' + DMLOG.cdsDOrdComp.FieldByName('ODCUSER').AsString + ''',' +
         'ARTIDPROV=''' + DMLOG.cdsDOrdComp.FieldByName('ARTIDPROV').AsString + ''',' +
         'ARTDESPROV=''' + DMLOG.cdsDOrdComp.FieldByName('ARTDESPROV').AsString + ''',' +
         'UNMIDEQUIV=''' + DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').AsString + ''',' +
         'PUNTEQUIV=''' + DMLOG.cdsDOrdComp.FieldByName('PUNTEQUIV').AsString + ''',' +
         'CNTEQUIV=''' + DMLOG.cdsDOrdComp.FieldByName('CNTEQUIV').AsString + ''',' +
         'CLAUXID=''' + DMLOG.cdsDOrdComp.FieldbyName('CLAUXID').AsString + ''',' +
         'ODCFREG=SYSDATE ' +
         'Where  CIAID=''' + DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString + ''' And ' +
         'ODCID=''' + DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString + ''' And ' +
         'DODCID=''' + DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString + ''' And ' +
         'ARTID=''' + DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString + ''' ';
   End;

   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error 41 al Insertar - LOG305');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;

End;

Procedure TFRegOrdC.DeletTodoLOG304;
Var
   sSQL: String;
Begin
   sSQL := 'Delete LOG304 WHERE CIAID=''' + DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString + ''' And' +
      ' ODCID=''' + DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString + ''' ';
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
   Except
      ShowMessage('Error 59 Delete LOG304 - DeletTodoLOG304 ');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;
End;

Procedure TFRegOrdC.DeletTodoLOG305;
Var
   sSQL: String;
Begin
   sSQL := 'Delete LOG305 WHERE CIAID=''' + DMLOG.cdsOrdComp.FieldbyName('CIAID').AsString + ''' And' +
      ' ODCID=''' + DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString + ''' ';
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
   Except
      ShowMessage('Error 57 Delete LOG305 - DeletTodoLOG305');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := crDefault;
      Raise;
      exit;
   End;
End;

procedure TFRegOrdC.FormActivate(Sender: TObject);
begin
   DMLOG.AccesosUsuarios(DMLOG.wModulo, DMLOG.wUsuario, '2', Screen.ActiveForm.Name);
end;

Initialization
   registerclasses([TLabel]);
End.


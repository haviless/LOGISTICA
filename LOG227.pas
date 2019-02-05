unit LOG227;
//*********************************************************
// MODIFICADO POR        : Abelardo Sulca Palomino
// Nº HPP                : HPP_201104_LOG
// FECHA DE MODIFICACION : 24/05/2011
// DESCRIPCION           : Se carga correctamente el DMLOG.cdsDODCxDRQS para que
//                         no se muestre error al visualizar el detalle del OC
//*********************************************************
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,  wwdbdatetimepicker, DBCtrls, db,
  wwSpeedButton, wwDBNavigator, Grids, Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, Wwdbspin,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppModule, daDatMod,
  ppBands, ppPrnabl, ppCtrls, ppViewr,  ppArchiv, wwclient, GridControl,
  ppStrtch, ppMemo, ppRichTx, ppVar, ppTypes, Variants, ppParameter, MsgDlgs;//, ppViewr;

type
  TFRegOrdCDep = class(TForm)
    pnlCabecera: TPanel;
    dblcCIA: TwwDBLookupCombo;
    Z2bbtnOK: TBitBtn;
	 dbmObs: TDBMemo;
	 pnlDetalleG: TPanel;
    stxTitulo1: TStaticText;
    pnlDetalleA: TPanel;
    Z2bbtnRegOk: TBitBtn;
    Z2bbtnRegCanc: TBitBtn;
    stxTitulo2: TStaticText;
    dblcUMed: TwwDBLookupCombo;
    pnlEstado: TPanel;
    bvlDetalle: TBevel;
    Bevel1: TBevel;
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
    dbeTCompra: TwwDBEdit;
    dbeTFlete: TwwDBEdit;
    dbeTimpues: TwwDBEdit;
    dblcLEntrega: TwwDBLookupCombo;
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
    dbgDepura: TwwDBGrid;
    Z2bbtnPrintDepuradas: TBitBtn;
    ppdbOCDep: TppDBPipeline;
    pprOCDep: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel43: TppLabel;
    ppLabel45: TppLabel;
    ppLabel59: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel60: TppLabel;
    ppDBText20: TppDBText;
    ppLabel61: TppLabel;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppLabel62: TppLabel;
    ppDBText30: TppDBText;
    ppLabel63: TppLabel;
    ppLine19: TppLine;
    ppLabel64: TppLabel;
    ppDBText38: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText53: TppDBText;
    ppDBText61: TppDBText;
    ppDBText72: TppDBText;
    ppDBMemo4: TppDBMemo;
    ppSummaryBand2: TppSummaryBand;
    ppLabel67: TppLabel;
    ppDBMemo5: TppDBMemo;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppSystemVariable2: TppSystemVariable;
    ppLabel65: TppLabel;
    ppParameterList1: TppParameterList;
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
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLine2: TppLine;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    pplReq1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText56: TppDBText;
    pplReq2: TppLabel;
    pplReq3: TppLabel;
    pplReq4: TppLabel;
    pplDerrama: TppLabel;
    ppDBText60: TppDBText;
    ppDetailBand4: TppDetailBand;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppFooterBand4: TppFooterBand;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel38: TppLabel;
    ppLine3: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppShape12: TppShape;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppDBText77: TppDBText;
    ppDBCalc2: TppDBCalc;
    ppLabel44: TppLabel;
    ppDBMemo3: TppDBMemo;
    ppDBCalc1: TppDBCalc;
    ppLabel66: TppLabel;
    procedure Z2bbtnOKClick(Sender: TObject);
    procedure Z2bbtnRegresaClick(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure Z2bbtnCanc2Click(Sender: TObject);
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure Z2bbtnAnulaClick(Sender: TObject);
    procedure Z2bbtnRegOkClick(Sender: TObject);
    procedure Z2bbtnRegCancClick(Sender: TObject);
    procedure Z2bbtnSalirClick(Sender: TObject);
    procedure dbmObsKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbcldArtiChange(Sender: TObject);
    procedure dbeDsctoExit(Sender: TObject);
    procedure dedNProformaExit(Sender: TObject);
    procedure dblcdExits(Sender: TObject);
    procedure Z2btnDescClick(Sender: TObject);
    procedure dbeDescExit(Sender: TObject);
    procedure Z2bbtnPrintClick(Sender: TObject);
    procedure dblcdProvEnter(Sender: TObject);
    procedure dblcdProvExit(Sender: TObject);
    procedure Z2bbtnBorrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure pprOCPEPreviewFormCreate(Sender: TObject);
    procedure pprOCPAfterPrint(Sender: TObject);
    procedure pprOCPBeforePrint(Sender: TObject);
    procedure pprOCPPreviewFormCreate(Sender: TObject);
    procedure dblcUMedExit(Sender: TObject);
    procedure dbeNRegExit(Sender: TObject);
    procedure Z2bbtnColocacClick(Sender: TObject);
    procedure ppDetailBand3BeforePrint(Sender: TObject);
    procedure pprOCPStartPage(Sender: TObject);
    procedure ppDetailBand4BeforePrint(Sender: TObject);
    procedure dbgDepuraCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure Z2bbtnPrintDepuradasClick(Sender: TObject);
    procedure pprOCDepPreviewFormCreate(Sender: TObject);
    procedure pprOCPEBeforePrint(Sender: TObject);
    procedure pprOCPEStartPage(Sender: TObject);
    procedure dbgDepuraDblClick(Sender: TObject);
    procedure ppHeaderBand4BeforePrint(Sender: TObject);
  private
    { Private declarations }
    xVan : Integer;
    iEstado : Integer;  // 0 En Insercion, 1 Edicion
    strTMP: string;
    sNumORD : string;
    xflag   : Boolean;
		xCrea   : Boolean;
    xMontoVisar : double;
  	xYear,xMes,xDia : Word;


    procedure CalculoNivel;
    procedure CreaSuperior;
    procedure inicializoCero(xcds : TwwClientDataSet);    
    procedure  AsigDat;
    procedure OnOffDetalle ( Value : Boolean );
    procedure OnOffCabecera( Value : Boolean );
    procedure btnDetalle;
    //procedure cSetFocus ( Sender: TObject; const sMsg : String);
    function EHandlerError(Ex : Exception ) : Boolean;
		procedure ppReportOC;
    procedure ValidaCab;
    //procedure dblcEditExit(Sender: TObject);
    procedure ValidaTot;
		procedure ImporteDetalle;
    procedure ActualizaAxP;
    procedure ActualizaProf;
		procedure ProXReq;
		procedure ProXReqTot;
    procedure GenerProfOCompra;
  public
    { Public declarations }
		xValorX : String;
		procedure CalcTotal(Sender : TObject);
    //function CalcTipoCambio(sMoneda: string; dtFecha: tdatetime; sCampo : string) : string;
  end;

var
  FRegOrdCDep: TFRegOrdCDep;
  xTAutoNum, xTAno, xTMes : String;
  xOrdElim : String;
  wIGV : String;
  xPriInser : String;
  SQLFiltro : String;
  xCant : String;
  xDesac : Integer;  

implementation

uses LOGDM1, oaAD4000, LOG221, LOG220, LOG222;

{$R *.DFM}

procedure TFRegOrdCDep.Z2bbtnOKClick(Sender: TObject);
var
	xPasa : Integer;
	sSQL : String;
begin
	xPasa:=0;
  if xPriInser ='A' then
  begin
    if not DMLOG.cdsOrdComp.FieldByName('CIAID').IsNull then
    begin
    	if DMLOG.IsExistORD( DMLOG.cdsOrdComp.FieldByName('CIAID').AsString,
                         DMLOG.cdsOrdComp.FieldByName('ODCID').AsString ) then
      begin
      	xPasa:=1;
          {ErrorMsg('Error', 'Ya existe una Orden de Compra con '+#13+
                   'con el mismo número ... '+DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);}
      end
      else
      	xPasa:=0;
    end
    else
    begin
    	ErrorMsg('Error', 'Ingrese la Compañia ..... ');
      Exit;
    end;
  end;

  if xPasa = 1 then
  begin
    if Question('Confirmar', 'Ya existe Una Orden de Compra con el Nº  '+
              dbeNReg.Text  + #13+#13+
              'Desea volver a genera el nuevo Nº de Order de Compra y Continuar ' + #13+ #13 ) then
    begin
     sNumORD := DMLOG.StrZero( DMLOG.MaxORD(trim(dblccia.Text)),8);
     DMLOG.cdsOrdComp.fieldbyName('ODCID').asString := sNumOrd;
     xPasa:=0;
    end;
  end;

  if xPasa = 1 then
  begin
  	Exit;
  end;
  ValidaCab;
	Screen.Cursor:=crHourGlass;
  if DMLOG.cdsOrdComp.State in [dsInsert,dsEdit] then
  try
  	AsigDat; // asignar los datos predeterminados
    if Length(trim(dbmObs.text)) = 0 then
    	DMLOG.cdsOrdComp.fieldbyname('ODCOBS').AsString := '.';
    DMLOG.cdsOrdComp.Post;

		SQLFiltro := 'SELECT * FROM  LOG304 WHERE '
					 +   ' CIAID  ='''+ dblcCIA.Text  +''' and '
					 +   ' ODCID='''+ dbeNReg.Text+''' ' ;
		DMLOG.cdsOrdComp.DataRequest( SQLFiltro ) ;

    sSQL:='SELECT CIAID,ODCID,DODCID,DODCIMP,DODCIMPU,DODCISCU,DODCCNT,DODCPUN,DODCDSCTO,ODCEST,DODCCSLD,DODCCATE,ARTID,UNMID,IMPTOT,IMPUNI,DODCOBS,TIPOADQ,ARTIDPROV,ARTDESPROV,UNMIDEQUIV,PUNTEQUIV,CNTEQUIV FROM LOG305 WHERE CIAID='''+dblcCIA.text+''' AND ODCID='''+dbeNReg.Text+'''';
		DMLOG.cdsDOrdComp.Close;
		DMLOG.cdsDOrdComp.dataRequest(sSQL);
		DMLOG.cdsDOrdComp.Open;

  	xPriInser:='';
		//CalcTotal (nil);
		//DMLOG.ControlTran;
		DMLOG.ControlTran( 9, DMLOG.cdsOrdComp, 'ORDCOMP');
		if DMLOG.wModo = 'A' then
    begin
    	xOrdElim:=DMLOG.cdsOrdComp.FieldbyName('ODCID').AsString;		// Si graba podre borrar
    end;
    OnOffCabecera(False); //Desactivar el panel de Cabecera
    OnOffDetalle(True);   //Activar el panel de detalle
		//Habilitamiento de Botones inferior
    Z2bbtnRegresa.Enabled := True;
    Z2bbtnCanc2.Enabled   := True;
    Z2bbtnGraba.Enabled   := true;
    Z2bbtnAcepta.Enabled  := True;
    //Z2bbtnAnula.Enabled   := True;
    z2bbtnSalir.Enabled   := True;
    //Z2bbtnPrint.Enabled   := False;
		pnlDetalleG.SetFocus;
		Screen.Cursor:=crDefault;
	except
  	on E: Exception do
    if not EHandlerError( E ) then raise;
	end;
  //Estos 'querys' son usados en FArtOCxReqs  En Art, Serv. Act. Fijo
	Screen.Cursor:=crHourGlass;
 	{sSQL := 'SELECT * FROM LOG305 WHERE CIAID='''+dblcCIA.Text+''' AND ODCID='''+dbeNReg.Text+''' ORDER BY CIAID, ODCID, DODCID';
 	DMLOG.cdsDOrdComp.Close;
 	DMLOG.cdsDOrdComp.DataRequest(sSQL);
 	DMLOG.cdsDOrdComp.Open;}
  if wTipoOC = 'xRequisicion' then
  begin
  	ProXReq;
  end
	else
  if wTipoOC = 'xRequisicionTotal' then
  begin
  	ProXReqTot;
  end;
	Screen.Cursor:=crDefault;
end;

procedure TFRegOrdCDep.AsigDat;
var
  D, M, Y : Word;
  sFecha, sSQL : String;  
begin
  if DMLOG.cdsOrdComp.State in [dsInsert] then  
  begin
    DecodeDate(dbdtpFReg.Date, Y, M, D);
    if (DMLOG.cdsOrdComp.State in [dsInsert]) and (DMLOG.cdsOrdComp.FieldbyName('ODCObs').IsNull ) then
      DMLOG.cdsOrdComp.FieldbyName('ODCOBS').AsString   := '.'; // colocar datos en blanco o algo
    if DMLOG.cdsOrdComp.State in [dsInsert] then
    begin
      DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString   := 'INICIAL'; // inicial...
      DMLOG.cdsOrdComp.FieldbyName('ODCTOTALG').AsFloat := 0.0;
      DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat  := 0.0;
      DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat := 0.0;
      DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat   := 0.0;
  		if DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat < 0 then
  			DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat  := 0.0;

      sFecha := formatdatetime(DMLOG.wFormatFecha, dbdtpFReg.Date);
      sSQL := 'SELECT * FROM TGE114 WHERE FECHA='+quotedstr(sFecha);
      DMLOG.FiltraCDS(DMLOG.cdsPeriodo, sSQL);
      DMLOG.cdsOrdComp.FieldbyName('ODCUSER').AsString   := DMLOG.wUsuario;
      DMLOG.cdsOrdComp.FieldbyName('ODCANO').AsString    := IntToStr(Y);
      DMLOG.cdsOrdComp.FieldbyName('ODCMM').AsString     := DMLOG.strzero(IntToStr(M),2);
      DMLOG.cdsOrdComp.FieldbyName('ODCDD').AsString     := DMLOG.strzero(IntToStr(D),2);
      DMLOG.cdsOrdComp.FieldbyName('ODCANOMM').AsString  := IntToStr(Y)+DMLOG.strzero(IntToStr(M),2);

      DMLOG.cdsOrdComp.FieldbyName('ODCTRI').AsString    := DMLOG.cdsPeriodo.fieldbyName('FECTRIM').asString;
      DMLOG.cdsOrdComp.FieldbyName('ODCSEM').AsString    := DMLOG.cdsPeriodo.fieldbyName('FECSEM').asString;
      DMLOG.cdsOrdComp.FieldbyName('ODCSS').AsString     := DMLOG.cdsPeriodo.fieldbyName('FECSS').asString;
      DMLOG.cdsOrdComp.FieldbyName('ODCAATRI').AsString  := DMLOG.cdsPeriodo.fieldbyName('FECAATRI').asString;
      DMLOG.cdsOrdComp.FieldbyName('ODCAASEM').AsString  := DMLOG.cdsPeriodo.fieldbyName('FECAASEM').asString;
      DMLOG.cdsOrdComp.FieldbyName('ODCAASS').AsString   := DMLOG.cdsPeriodo.fieldbyName('FECAASS').asString;

			DMLOG.cdsOrdComp.FieldbyName('ODCFREG').AsDateTime := Date;
			DMLOG.cdsOrdComp.FieldbyName('ODCHREG').AsDateTime := SysUtils.Time
			//DMLOG.cdsOrdComp.FieldbyName('FLAGVAR').AsString   := '';
		end;
	end;
end;

procedure TFRegOrdCDep.Z2bbtnRegresaClick(Sender: TObject);
begin
  if Length(Trim(DMLOG.cdsOrdComp.fieldbyname('ODCVISADOR').AsString)) > 0 then
  begin
	  OnOffCabecera(False); //Activar la cabecera
	  OnOffDetalle(True); //Desactivar el panel de detalle
  end
	else
	begin
		DMLOG.cdsOrdComp.Edit;
		OnOffCabecera(True); //Activar la cabecera
		OnOffDetalle(False); //Desactivar el panel de detalle
	end;
end;

procedure TFRegOrdCDep.Z2bbtnCanc2Click(Sender: TObject);
begin
	if FRegOrdCDep = nil then
		Exit;
	DMLOG.cdsOrdComp.CancelUpdates;
	DMLOG.cdsDOrdComp.CancelUpdates;
end;

procedure TFRegOrdCDep.Z2bbtnGrabaClick(Sender: TObject);
var
	xCIAID, xODCID, xImp : String;
  xFle : Double;
begin
	try
    Screen.Cursor:=crHourGlass;
    ValidaTot;
    if DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat > 0 then
    begin
      xCIAID  := DMLOG.cdsOrdComp.FieldByName('CIAID').AsString;
      xODCID  := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;
      if not DMLOG.cdsDOrdComp.Locate ('CIAID;ODCID;DODCID',VarArrayOf([xCIAID,xODCID,'999']),[]) then
        DMLOG.cdsDOrdComp.Insert
      else
        DMLOG.cdsDOrdComp.Edit;
      if DMLOG.cdsDOrdComp.State in [dsInsert,dsEdit] then
      begin
        DMLOG.cdsDOrdComp.FieldByName('CIAID').AsString     := xCIAID;
        DMLOG.cdsDOrdComp.FieldByName('ODCID').AsString     := xODCID;
        DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString    := '999';
        DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString     := '999';
        DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString     := DMLOG.DisplayDescrip('prvSQL', 'TGE130', 'UNMID', 'UNMSERV=''S''', 'UNMID');
        DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsString   := '1';
        DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsString   := DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsString;
        DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsString := '0.00';
        DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsString   := DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsString;
        if DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsFloat = 0 then
        	DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString  := wIGV;

        xFle:=StrtoFloat(DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsString);
        xImp:=FloattoStr(xFle+(xFle*StrtoFloat(DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsString)/100));
      	DMLOG.cdsDOrdComp.FieldByName('IMPTOT').AsString    := xImp;
      	DMLOG.cdsDOrdComp.FieldByName('IMPUNI').AsString    := xImp;
                                 //rTIMP := (rC*rU)-((rC*rU)*(rD/100));
                                 //rTIMP := rTIMP + ((rTIMP)* (rI/100)) + ((rTIMP)*(rISC/100) );
        DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsString  := '0.00';
        DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString   := 'FLETE';
        DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').asString	  := DMLOG.cdsOrdComp.FieldByName('TIPOADQ').AsString;
        DMLOG.cdsDOrdComp.Post;
    		CalcTotal (nil);
        OnOffDetalle(True); // activar detalle
      end;
    end; 
    dbeDescExit(nil);
  	//DMLOG.cdsOrdComp.ApplyUpdates(0);
  	//DMLOG.cdsDOrdComp.ApplyUpdates(0);    
    xOrdElim:='';		// Si graba podre borrar    
		//DMLOG.ControlTran;
		DMLOG.ControlTran( 9, DMLOG.cdsOrdComp, 'ORDCOMP');
		DMLOG.ControlTran( 9, DMLOG.cdsDOrdComp,'DORDCOMP');				
  	dbeNReg.Enabled:=False;
    dbeDesc.Enabled:=False;
    btnDetalle;
  	wModo := '';
  finally
  	Screen.Cursor:=crDefault;
  end;
end;

procedure TFRegOrdCDep.Z2bbtnAceptaClick(Sender: TObject);
var
	Monto : Double;
  xSql : String;
	xPaso : Integer;
	nArtSol, nArtAte : Double;
  xProv, sEstado, sSQL, xCRQSID, xDRQSID, xFUM : string;
	lCompleto : boolean; //usado para las proformas
begin
	 if (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) <> 'INICIAL') or
		 (DMLOG.cdsDOrdComp.RecordCount = 0)  then // inicial...
  begin
    Z2bbtnRegresa.Enabled := False;
    Z2bbtnCanc2.Enabled   := False;
    Z2bbtnGraba.Enabled   := False;
    Z2bbtnAcepta.Enabled  := False;
    z2bbtnSalir.Enabled   := True;
    raise exception.Create(' Esta Orden de Compra ya fue Aceptada ó no Cuenta con Detalles ') ;
  end;
	if Length(Trim(DMLOG.cdsOrdComp.fieldbyname('ODCVISADOR').AsString)) = 0 then
  begin
  	if wExoVis <> 'S' then
			raise Exception.create ('Esta Orden de Compra No se Encuentra Visada')
    else
    begin
      if not Question('Confirmar', 'Esta Orden de Compra '+ #13+#13+
                   DMLOG.cdsOrdComp.FieldByName('ODCID').AsString  + '  -  Prov.  '+
                   DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString + #13+
                   #13+' No se Encuentra Visada '+#13+
                   #13 +' Desea Visarla ') then
      begin
      	Exit;
      end;
      if (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'INICIAL') and
         (DMLOG.cdsDOrdComp.RecordCount>0)  and
         (wPreUni = 0	)	then
      begin
				if not Question('Confirmar', ' Confirme Visación de Orden de Compra '+ #13+#13+
							       ' Desea Continuar ') then
        begin
          Exit;
        end;
        If wActuaPresu then
        begin
          if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
          begin
            xSql := 'select log324.ciaid,log324.odcid,log324.rqsid,sum(IMPTOT) TOT,log308.parpresid,log308.tippresid'+
                 ' ,log308.ccosid from log324 left Join LOG308 on (log324.rqsid=log308.rqsid)'+
                 ' left join log305 on (log324.odcid=log305.odcid and log324.artid=log305.artid)'+
                 ' where log324.odcid='+quotedstr(dbeNReg.text) +' and log324.ciaid='+quotedstr(dblcCIA.text)+
                 ' group by log324.ciaid,log324.odcid,log324.rqsid,log308.ccosid';
          end
          else
          if SRV_D = 'ORACLE' then
          begin
               xSql := 'select log324.ciaid,log324.odcid,log324.rqsid,sum(IMPTOT) TOT,log308.parpresid,log308.tippresid'+
                       ' ,log308.ccosid from log324 WHERE log324.rqsid=log308.rqsid+'+
                       ' AND log324.odcid=log305.odcid+ and log324.artid=log305.artid+'+
                       ' AND log324.odcid='+quotedstr(dbeNReg.text) +' and log324.ciaid='+quotedstr(dblcCIA.text)+
                       ' group by log324.ciaid,log324.odcid,log324.rqsid,log308.ccosid';
          end;
          DMLOG.cdsSQL.Close;
          DMLOG.cdsSQL.DataRequest(xSql);
          DMLOG.cdsSQL.open;
        end;
        DMLOG.DisplayDescrip('prvTGE','TGE171','MONTOMAX, FOC','USERID='''+DMLOG.wUsuario+'''','MONTOMAX');
        if DMLOG.cdsQry.FieldByName('FOC').AsString = 'S' then
          xMontoVisar:=DMLOG.cdsQry.FieldByName('MONTOMAX').AsCurrency;

        if dblcTMoneda.Text <> DMLOG.wTMonLoc then
          Monto :=  DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').AsFloat * strtoFloat(dbeTCambio.text)
        else
          Monto :=  DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').AsFloat ;

        if Monto > xMontoVisar then
        begin
           Raise Exception.create ( 'Su Monto Máximo de Visación es :'+currtostr(xMontoVisar) ) ;
        end ;
				DMLOG.cdsOrdComp.edit;
				DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString  := DMLOG.wUsuario ;
				DMLOG.cdsOrdComp.FieldByName('OCVISFREG').AsDateTime := Date ;
				DMLOG.cdsOrdComp.FieldByName('OCVISHREG').AsDateTime := SysUtils.Time ;
				DMLOG.cdsOrdComp.post ;
				//DMLOG.ControlTran;
				DMLOG.ControlTran( 9, DMLOG.cdsOrdComp, 'ORDCOMP');

				If wActuaPresu then
				 begin
					DecodeDate(Date,xYear,xMes,xDia);
					xPeriodo := FloatToStr(xYear) +  DMLOG.strZero(FloatToStr(xMes),2);
          CalculoNivel;
         end;
      end;
    end;
	end;

	if not Question('Confirmar', 'Esta Seguro de Aceptar La Orden de Compra '+ #13+#13+
							 DMLOG.cdsOrdComp.FieldByName('ODCID').AsString  + '  -  Prov.  '+
							 DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString + #13+
							 #13 +' Desea Continuar ') then
	begin
		Exit;
	end;
	try
		//if wTipoOC = 'xProforma' then
		Screen.Cursor:=crHourGlass;
		xProv := DMLOG.DisplayDescrip('prvTGE','TGE102','CLAUXID','CLAUXLOG=''S''','CLAUXID');
		{if wTipoOC = 'xProforma' then
		begin
			sSCCID := DMLOG.DisplayDescrip('prvSQL','LOG312','SCCID','PROFID='+quotedstr(dedNProforma.text),'SCCID');
			sSQL :=       'SELECT LOG310.SCCID, LOG310.DSCCID, LOG310.RQSID, LOG310.DRQSID, ';
			sSQL := sSQL +    'LOG310.ARTID, SUBSTR(DRQS.DRQSOBS,1,50) DODCOBS, ';
			sSQL := sSQL +    'DRQS.UNMIDG UNMID, DRQS.DRQSCNSG CANTSOL, DRQS.DRQSCNAG CANTATE ';
			sSQL := sSQL +  'FROM LOG310 ';
			sSQL := sSQL +    'LEFT JOIN LOG309 DRQS ON (DRQS.CIAID=LOG310.CIAID AND DRQS.RQSID=LOG310.RQSID AND DRQS.DRQSID=LOG310.DRQSID) ';
			sSQL := sSQL +  'WHERE DRQS.DRQSCNSG>0 ';
			sSQL := sSQL +    'AND DRQS.RQSFLAGUM='+quotedStr('G')         +' ';
			sSQL := sSQL +    'AND LOG310.SCCID='  +quotedStr(sSCCID)      +' ';
			sSQL := sSQL +    'AND LOG310.CIAID='  +quotedStr(dblcCIA.text)+' ';
			sSQL := sSQL +'UNION ALL ';
			sSQL := sSQL +'SELECT LOG310.SCCID, LOG310.DSCCID, LOG310.RQSID, LOG310.DRQSID, ';
			sSQL := sSQL +    'LOG310.ARTID, SUBSTR(DRQS.DRQSOBS,1,50) DODCOBS, ';
			sSQL := sSQL +    'DRQS.UNMIDU UNMID, DRQS.DRQSCNSU CANTSOL, DRQS.DRQSCNAU CANTATE ';
			sSQL := sSQL +  'FROM LOG310 ';
			sSQL := sSQL +    'LEFT JOIN LOG309 DRQS ON (DRQS.CIAID=LOG310.CIAID AND DRQS.RQSID=LOG310.RQSID AND DRQS.DRQSID=LOG310.DRQSID) ';
			sSQL := sSQL +  'WHERE DRQS.DRQSCNSU>0 ';
			sSQL := sSQL +    'AND DRQS.RQSFLAGUM='+quotedStr('U')         +' ';
			sSQL := sSQL +    'AND LOG310.SCCID='  +quotedStr(sSCCID)      +' ';
			sSQL := sSQL +    'AND LOG310.CIAID='  +quotedStr(dblcCIA.text)+' ';
			DMLOG.cdsFAsig.Close;
			DMLOG.cdsFAsig.datarequest(sSQL);
			DMLOG.cdsFAsig.MasterSource    := DMLOG.dsDOrdComp;
			DMLOG.cdsFAsig.MasterFields    := 'ARTID';
			DMLOG.cdsFAsig.IndexFieldNames := 'ARTID';
			//DMLOG.cdsFAsig.MasterFields    := 'DODCOBS';
			//DMLOG.cdsFAsig.IndexFieldNames := 'DODCOBS';
			DMLOG.cdsFAsig.Open;
		end;}

		{if wTipoOC = 'xRequisicion' then
		begin
			sWhere := '';
			DMLOG.cdsDOrdComp.First;
			while not DMLOG.cdsDOrdComp.eof do
			begin
				if sWhere <> '' then
					sWhere := sWhere + ' OR ';
				sWhere := sWhere + 'SUBSTR(B.DRQSOBS,1,25)=' + quotedstr(copy(DMLOG.cdsDOrdComp.fieldbyName('DODCOBS').asString,1,25));
				//sWhere := sWhere + 'SUBSTR(B.DRQSOBS,1,25)=' + quotedstr(DMLOG.cdsDOrdComp.fieldbyName('DODCOBS').asString);
				DMLOG.cdsDOrdComp.next;
			end;
			sWhere := '(' + sWhere +')';

			sSQL :=       'SELECT B.SCCID, '+quotedstr(' ')+', B.RQSID, B.DRQSID, ';
			sSQL := sSQL +     ' B.ARTID, SUBSTR(B.DRQSOBS,1,50) as DODCOBS,';
			sSQL := sSQL +     ' B.UNMIDG UNMID, B.DRQSCNSG CANTSOL, B.DRQSCNAG CANTATE ';
			sSQL := sSQL +   'FROM LOG309 B ';
			sSQL := sSQL +     'LEFT JOIN LOG308 A ON (A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.RQSID=B.RQSID) ';
			sSQL := sSQL +     'LEFT JOIN TGE130 G ON ( B.UNMIDG = G.UNMID) ';
			sSQL := sSQL +   'WHERE A.RQSEST <> ' +quotedstr('ATENDIDO');
			sSQL := sSQL +     ' AND B.CIAID=' +quotedstr(dblcCIA.Text)+' ';
			sSQL := sSQL +     ' AND (NOT A.RQSVISADOR IS NULL) ';
			sSQL := sSQL +     ' AND ' + sWhere;
			sSQL := sSQL +     ' AND B.RQSFLAGUM='+quotedstr('G');
			sSQL := sSQL +     ' AND (NVL(B.DRQSCNSG,0) - NVL(B.DRQSCNAG,0) > 0) ';
			sSQL := sSQL +' UNION ALL ';
			sSQL := sSQL +' SELECT B.SCCID, '+quotedstr(' ')+', B.RQSID, B.DRQSID, ';
			sSQL := sSQL +     ' B.ARTID, SUBSTR(B.DRQSOBS,1,50) as DODCOBS,';
			sSQL := sSQL +     ' B.UNMIDU UNMID, B.DRQSCNSU CANTSOL, B.DRQSCNAU CANTATE ';
			sSQL := sSQL +   'FROM LOG309 B ';
			sSQL := sSQL +     'LEFT JOIN LOG308 A ON (A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.RQSID=B.RQSID) ';
			sSQL := sSQL +     'LEFT JOIN TGE130 G ON ( B.UNMIDU = G.UNMID) ';
			sSQL := sSQL +   'WHERE A.RQSEST <> ' +quotedstr('ATENDIDO');
			sSQL := sSQL +     ' AND B.CIAID=' +quotedstr(dblcCIA.Text)+' ';
			sSQL := sSQL +     ' AND ( NOT A.RQSVISADOR IS NULL ) ';
			sSQL := sSQL +     ' AND ' + sWhere;
			sSQL := sSQL +     ' AND B.RQSFLAGUM='+quotedstr('U');
			sSQL := sSQL +     ' AND (NVL(B.DRQSCNSU,0) - NVL(B.DRQSCNAU,0) > 0 )';

			DMLOG.cdsFAsig.Close;
			DMLOG.cdsFAsig.datarequest(SSQL);
			DMLOG.cdsFAsig.MasterSource    := DMLOG.dsDOrdComp;
			DMLOG.cdsFAsig.MasterFields    := 'ARTID';
			DMLOG.cdsFAsig.IndexFieldNames := 'ARTID';
			//DMLOG.cdsFAsig.MasterFields    := 'DODCOBS';
			//DMLOG.cdsFAsig.IndexFieldNames := 'DODCOBS';
			DMLOG.cdsFAsig.Open;
		end;}

		//Este proceso reparte la lo procesado segun una tecnica de FIFO o PROMEDIO
		//FAsigOC2Rqs.ShowModal;

		//Consultar que lo solicitado de la requisicion por la orden de compra sea todo el pedido
		//si es asi, significa que el estado de la rqs es 'atendido' sino es 'parcial'
		if wTipoOC = 'xRequisicion' then
		begin
			DMLOG.cdsDOrdComp.first;
			while not DMLOG.cdsDOrdComp.eof do
			begin
				DMLOG.cdsDODCxDRQS.First;
				while not DMLOG.cdsDODCxDRQS.Eof do
				begin
					nArtSol:=DMLOG.cdsDODCxDRQS.fieldbyName('DODCCNT').asFloat;
					xCRQSID:=DMLOG.cdsDODCxDRQS.fieldbyName('RQSID').asString;
					xDRQSID:=DMLOG.cdsDODCxDRQS.fieldbyName('DRQSID').asString;
					sSQL:='SELECT DRQSCNSG, DRQSCNAG, DRQSCNSU, DRQSCNAU FROM LOG309 WHERE RQSID='''+xCRQSID+''' AND DRQSID='''+xDRQSID+'''';
					DMLOG.cdsLOG.Close;
					DMLOG.cdsLOG.DataRequest(sSQL);
					DMLOG.cdsLOG.Open;
					if DMLOG.cdsDODCxDRQS.fieldbyName('FLAGUM').AsString = 'G' then
						xFUM:='G'
					else
					if DMLOG.cdsDODCxDRQS.fieldbyName('FLAGUM').AsString = 'U' then
						xFUM:='U';
					if (nArtSol <> 0) and (Length(Trim(xFUM)) <> 0) then
					begin
						nArtAte:= DMLOG.cdsLOG.FieldByName('DRQSCNA'+xFUM).AsFloat + nArtSol;
						if nArtAte >= DMLOG.cdsLOG.FieldByName('DRQSCNS'+xFUM).AsFloat then
							sEstado := 'ATENDIDO'
						else
							sEstado := 'PARCIAL';
            sSQL := 'UPDATE LOG309 SET RQSEST=' +quotedStr(sEstado)+', DRQSCNA'+xFUM+'='+FloatToStr(nArtAte)+', RQSFATE='+DMLOG.wRepFuncDate+quotedStr(formatdatetime(DMLOG.wFormatFecha,Date))+')'+
                    ' WHERE RQSID='''+xCRQSID+''' AND DRQSID='''+xDRQSID+'''';
            DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
          end;
					DMLOG.cdsDODCxDRQS.Next;
        end;
        DMLOG.cdsDOrdComp.next;
      end; //eof
      xPaso:=0;
			sSQL:='SELECT DISTINCT RQSID FROM LOG324 WHERE ODCID='''+DMLOG.cdsOrdComp.fieldbyName('ODCID').asString+''' AND CIAID='''+dblcCIA.Text+''' AND DODCCNT>0 ORDER BY RQSID';
      DMLOG.cdsLOG.Close;
      DMLOG.cdsLOG.DataRequest(sSQL);
      DMLOG.cdsLOG.Open;
      DMLOG.cdsLOG.First;
      while not DMLOG.cdsLOG.Eof do
      begin
      	if xPaso = 0 then
        begin
          sSQL:='SELECT DISTINCT RQSEST FROM LOG309 WHERE RQSID='''+DMLOG.cdsLOG.FieldByName('RQSID').AsString+''' AND RQSEST = ''PARCIAL''';
          DMLOG.cdsQry.Close;
          DMLOG.cdsQry.DataRequest(sSQL);
          DMLOG.cdsQry.Open;
          if DMLOG.cdsQry.RecordCount > 0 then
          begin
            sSQL := 'UPDATE LOG308 SET RQSEST=' +quotedStr('PARCIAL')
                      + ' WHERE RQSID=' +quotedstr(DMLOG.cdsLOG.FieldByName('RQSID').AsString);
            DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            xPaso:=1;
					end;
        end;
        if xPaso = 0 then
        begin
          sSQL:='SELECT DISTINCT RQSEST FROM LOG309 WHERE RQSID='''+DMLOG.cdsLOG.FieldByName('RQSID').AsString+''' AND RQSEST = ''ACEPTADO''';
          DMLOG.cdsQry.Close;
          DMLOG.cdsQry.DataRequest(sSQL);
          DMLOG.cdsQry.Open;
          if DMLOG.cdsQry.RecordCount > 0 then
            xPaso:=1
        end;
        if xPaso = 0 then
          begin
          sSQL:='SELECT DISTINCT RQSEST FROM LOG309 WHERE RQSID='''+DMLOG.cdsLOG.FieldByName('RQSID').AsString+''' AND RQSEST = ''ATENDIDO''';
          DMLOG.cdsQry.Close;
          DMLOG.cdsQry.DataRequest(sSQL);
          DMLOG.cdsQry.Open;
          if DMLOG.cdsQry.RecordCount > 0 then
          begin
            sSQL := 'UPDATE LOG308 SET RQSEST=' +quotedStr('ATENDIDO')
                      + ' WHERE RQSID=' +quotedstr(DMLOG.cdsLOG.FieldByName('RQSID').AsString);
            DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
          end;
        end;
      	xPaso:=0;
        DMLOG.cdsLOG.Next;
    	end;
    end; //xRqs
    //Consultar que lo solicitado de la proforma por la orden de compra sea todo el pedido
		//si es asi, significa que el estado de la rqs es 'atendido' sino es 'parcial'
    if wTipoOC = 'xProforma' then
    begin
      //DMLOG.cdsDProfxCIA.First;
      if (SRV_D = 'DB2NT') or
		     (SRV_D = 'DB2400') then
      begin
        sSQL := 'SELECT SUBSTR(DPROF.DPROFOBS,1,50) DPROFOBS, ';
        sSQL := sSQL + 'CASE WHEN DPROF.DPROFLAGUM='+quotedstr('G')+' THEN DPROF.UNMIDG ELSE DPROF.UNMIDU END UNMIDP, ';
        sSQL := sSQL + 'CASE WHEN DPROF.DPROFLAGUM='+quotedstr('G')+' THEN DPROF.DPROFCNTG ELSE DPROF.DPROFCNTU END CNT, ';
        sSQL := sSQL + 'DOC.CIAID, DOC.UNMID UNMIDO, DOC.DODCCNT, SUBSTR(DOC.DODCOBS,1,50) DODCOBS ';
        sSQL := sSQL + 'FROM LOG313 DPROF ';
        sSQL := sSQL +   'LEFT JOIN LOG305 DOC ON (DOC.CIAID=DPROF.CIAID AND DOC.PROFID=DPROF.PROFID AND SUBSTR(DPROF.DPROFOBS,1,50) = SUBSTR(DOC.DODCOBS,1,50)) ';
        sSQL := sSQL + 'WHERE DPROF.CIAID=' +quotedstr(dblcCIA.Text)+ ' AND DPROF.PROFID='+quotedstr(dedNProforma.text);
      end
      else
	    if SRV_D = 'ORACLE' then
      begin
        sSQL := 'SELECT SUBSTR(DPROF.DPROFOBS,1,50) DPROFOBS, ';
        sSQL := sSQL + 'DECODE(DPROF.DPROFLAGUM, ''G'', DPROF.UNMIDG, DPROF.UNMIDU) UNMIDP, ';
        sSQL := sSQL + 'DECODE(DPROF.DPROFLAGUM, ''G'', DPROF.DPROFCNTG, DPROF.DPROFCNTU) CNT, ';
        //sSQL := sSQL + 'CASE WHEN DPROF.DPROFLAGUM='+quotedstr('G')+' THEN DPROF.UNMIDG ELSE DPROF.UNMIDU END UNMIDP, ';
        //sSQL := sSQL + 'CASE WHEN DPROF.DPROFLAGUM='+quotedstr('G')+' THEN DPROF.DPROFCNTG ELSE DPROF.DPROFCNTU END CNT, ';
        sSQL := sSQL + 'DOC.CIAID, DOC.UNMID UNMIDO, DOC.DODCCNT, SUBSTR(DOC.DODCOBS,1,50) DODCOBS ';
        sSQL := sSQL + 'FROM LOG313 DPROF, LOG305 DOC ';
        //sSQL := sSQL +   'LEFT JOIN LOG305 DOC ON (DOC.CIAID=DPROF.CIAID AND DOC.PROFID=DPROF.PROFID AND SUBSTR(DPROF.DPROFOBS,1,50) = SUBSTR(DOC.DODCOBS,1,50)) ';
        sSQL := sSQL + 'WHERE DPROF.CIAID=' +quotedstr(dblcCIA.Text)+ ' AND DPROF.PROFID='+quotedstr(dedNProforma.text);
        sSQL := sSQL + ' AND DOC.CIAID=DPROF.CIAID ';
        sSQL := sSQL + 'AND DOC.PROFID=DPROF.PROFID ';
        sSQL := sSQL + 'AND SUBSTR(DPROF.DPROFOBS,1,50) = SUBSTR(DOC.DODCOBS,1,50) ';
      end;

      DMLOG.cdsSQL.close;
      DMLOG.cdsSQL.datarequest(sSQL);
      DMLOG.cdsSQL.open;
      DMLOG.cdsSQL.first;
      lCompleto := true;
      while not DMLOG.cdsSQL.eof and lCompleto do
      begin
        if DMLOG.cdsSQL.fieldbyName('UNMIDP').AsString <> DMLOG.cdsSQL.fieldbyName('UNMIDO').AsString then
          lCompleto := false;
        DMLOG.cdsSQL.next;
      end;
      if lCompleto then
      	sEstado := 'PARCIAL'
      else
      	sEstado := 'ATENDIDO';
      sSQL := 'UPDATE LOG312 SET PROFEST=' +quotedStr(sEstado);
      sSQL := sSQL + 'WHERE CIAID=' +quotedstr(dblcCIA.Text)+ ' AND PROFID='+quotedstr(dedNProforma.text);
      DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
		end;
    // Cambiar el Estado de la O. Compra y/o Proforma por Aceptado
    if DMLOG.cdsDOrdComp.State in [dsEdit, dsInsert] then
      DMLOG.cdsDOrdComp.Post;
    if DMLOG.cdsOrdComp.State in [dsEdit, dsInsert] then
      DMLOG.cdsOrdComp.Post;
    begin
      DMLOG.cdsOrdComp.Edit;
      DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString := 'ACEPTADO';
      DMLOG.cdsOrdComp.FieldbyName('ODCACEPFREG').AsDateTime := Date;
      DMLOG.cdsOrdComp.FieldbyName('ODCACEPHREG').AsDateTime := SysUtils.Time ;
      DMLOG.cdsOrdComp.Post;
      ActualizaAxP;
      if (NOT DMLOG.cdsOrdComp.fieldbyname('PROFID').ISNULL) and
        (trim(DMLOG.cdsOrdComp.fieldbyname('PROFID').AsString) <> '') then
        ActualizaProf;
    end;
		//DMLOG.ControlTran;
		DMLOG.ControlTran( 9, DMLOG.cdsOrdComp, 'ORDCOMP');
		DMLOG.ControlTran( 9, DMLOG.cdsDOrdComp,'DORDCOMP');


    sSQL := 'UPDATE TGE201 SET PROVUFMOV=' +DMLOG.wRepFecServi+','
    					+ ' ACTXOC=''S'''
              + ' WHERE PROV=' +quotedstr(DMLOG.cdsOrdComp.FieldByName('PROV').AsString)
              + ' AND CLAUXID='+QuotedStr(xProv);
    DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);

    if wTipoOC <> 'xProforma' then
      GenerProfOCompra;

    //LEVANTAR FORMA DE
    Z2bbtnRegresa.Enabled := False;
    Z2bbtnCanc2.Enabled   := False;
    Z2bbtnGraba.Enabled   := False;
    Z2bbtnAcepta.Enabled  := False;
    //Z2bbtnAnula.Enabled   := False;
    z2bbtnSalir.Enabled   := True;
    //Z2bbtnPrint.Enabled   := True;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFRegOrdCDep.Z2bbtnAnulaClick(Sender: TObject);
begin
	if not Question('Confirmar', 'Esta Seguro de Anular La Orden de Compra '+ #13+#13+
							 DMLOG.cdsOrdComp.FieldByName('ODCID').AsString  + '  -  Prov.  '+
							 DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString + #13+
							 #13 +' Este Proceso no se podra Revertir ' + #13+ #13+
							 #13 +' Desea Continuar ') then
	begin
		Exit;
	end;
	//if (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'INICIAL')
		// and (DMLOG.cdsDOrdComp.RecordCount>0)  then
	//begin
		if DMLOG.cdsOrdComp.State in [dsBrowse] then
    begin
			DMLOG.cdsOrdComp.Edit;
			DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString  := 'ANULADO';
			DMLOG.cdsOrdComp.FieldbyName('ODCANULA').AsString:= DMLOG.wUsuario;
			DMLOG.cdsOrdComp.FieldByName('OCANUFREG').AsDateTime := Date ;
			DMLOG.cdsOrdComp.FieldByName('OCANUHREG').AsDateTime := SysUtils.Time ;

			DMLOG.cdsOrdComp.Post;
      DMLOG.cdsDOrdComp.disablecontrols;
      DMLOG.cdsDOrdComp.first;
      while not DMLOG.cdsDOrdComp.eof do
      begin
        DMLOG.cdsDOrdComp.Edit;
        DMLOG.cdsDOrdComp.FieldbyName('ODCEST').AsString := 'ANULADO';
        DMLOG.cdsDOrdComp.Post;
        DMLOG.cdsDOrdComp.Next;
			end;
			DMLOG.cdsDOrdComp.enablecontrols;
			//DMLOG.ControlTran;
			DMLOG.ControlTran( 9, DMLOG.cdsOrdComp, 'ORDCOMP');
			DMLOG.ControlTran( 9, DMLOG.cdsDOrdComp,'DORDCOMP');
		end;
	//end;
	btnDetalle;
end;

procedure TFRegOrdCDep.Z2bbtnRegOkClick(Sender: TObject);
begin
	dbgDepura.Enabled:=true;
	OnOffDetalle(True); // activar detalle
	pnlDetalleA.Visible := False;
	Exit;
end;

procedure TFRegOrdCDep.Z2bbtnRegCancClick(Sender: TObject);
begin
	dbgDepura.Enabled:=true;
	OnOffDetalle(True);
	pnlDetalleA.Visible := False;
end;

procedure TFRegOrdCDep.OnOffCabecera(Value: Boolean);
begin
  // ....................... activar cabecera de requisición ...................
  pnlCabecera.Enabled   := Value;
  Z2bbtnBorrar.Enabled  := Value;
  Z2bbtnOK.Enabled      := Value;
end;

procedure TFRegOrdCDep.OnOffDetalle(Value: Boolean);
begin
  if Value then
    stxTitulo1.Color := clHighlight
  else
    stxTitulo1.Color := clGray;

  pnlDetalleG.Enabled  := Value;
  Z2bbtnCanc2.Enabled  := Value;
  Z2bbtnGraba.Enabled  := Value;
  Z2bbtnAcepta.Enabled := Value;
  Z2bbtnAnula.Enabled  := Value;
  btnDetalle;
  if Length(Trim(DMLOG.cdsOrdComp.FieldbyName('OCCOLOCAC').AsString)) = 0 then
  begin
    if (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'ACEPTADO') then
      if xValorX <> 'X' then
        Z2bbtnColocac.Enabled  := True
    else
      Z2bbtnColocac.Enabled  := False;
  end
  else
  	Z2bbtnColocac.Enabled  := False;  
end;

procedure TFRegOrdCDep.btnDetalle;
var
  bDummy1, bDummy2: Boolean;
  //INICIO HPP_201104_LOG
  sSQL :String;
  //FIN HPP_201104_LOG
begin
  //INICIO HPP_201104_LOG
	sSQL := 'SELECT * FROM LOG305 WHERE CIAID='''+dblcCIA.Text+''' AND ODCID='''+dbeNReg.Text+''' ORDER BY CIAID, ODCID, DODCID';
	DMLOG.cdsDOrdComp.Close;
	DMLOG.cdsDOrdComp.DataRequest(sSQL);
	DMLOG.cdsDOrdComp.Open;
  //FIN HPP_201104_LOG
  if DMLOG.cdsDOrdComp.Active = False then
    DMLOG.cdsDOrdComp.Open;
  bDummy1 :=(DMLOG.cdsDOrdComp.RecordCount>0) and (( DMLOG.cdsOrdComp.ChangeCount > 0 ) or ( DMLOG.cdsDOrdComp.ChangeCount > 0 ));
  bDummy2 := (DMLOG.cdsDOrdComp.RecordCount>0) and (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'INICIAL');

  Z2bbtnGraba.Enabled  := bDummy1;
  Z2bbtnCanc2.Enabled  := bDummy1;
  Z2bbtnAnula.Enabled  := bDummy2;
  Z2bbtnAcepta.Enabled := bDummy2;
//  Z2dbgDReqsIButton.Enabled := (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEst').AsString) = 'INICIAL') and False;
end;

procedure TFRegOrdCDep.Z2bbtnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFRegOrdCDep.dbmObsKeyPress(Sender: TObject; var Key: Char);
var
	sC : String;
begin
	sC := Key;
	sC := Uppercase(sC);
	Key:= sC[1];
end;

procedure TFRegOrdCDep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   xValorX := '';
   DMLOG.cdsDODCxDRQS.Close;
   DMLOG.cdsDODCxDRQS.MasterSource    := Nil;
   DMLOG.cdsDODCxDRQS.MasterFields    := '';
   DMLOG.cdsDODCxDRQS.IndexFieldNames := '';
   DMLOG.cdsDODCxDRQS.Open;

   if DMLOG.cdsOrdComp.State in [dsEdit, dsInsert] then    DMLOG.cdsOrdComp.Cancel;
   if DMLOG.cdsDOrdComp.State in [dsEdit, dsInsert] then   DMLOG.cdsDOrdComp.Cancel;
   if DMLOG.cdsDODCxDRQS.State in [dsEdit, dsInsert] then  DMLOG.cdsDODCxDRQS.Cancel;

   if DMLOG.cdsOrdComp.ChangeCount > 0 then   DMLOG.cdsOrdComp.CancelUpdates;
   if DMLOG.cdsDOrdComp.ChangeCount > 0 then  DMLOG.cdsDOrdComp.CancelUpdates;
   if DMLOG.cdsDODCxDRQS.ChangeCount > 0 then  DMLOG.cdsDODCxDRQS.CancelUpdates;

   //FVariables.w_Num_Formas := FVariables.w_Num_Formas-1;
   Action := CAFree;
end;

function TFRegOrdCDep.EHandlerError(Ex : Exception ) : Boolean;
var
 a, b   : Integer;
 s1, s2	: string;
begin
    Result :=  true;
    if Ex.Message = 'Key violation.' then
    begin
       ErrorMsg( 'Error','No pueden existir registros duplicados.. ');
    end
    else begin
      a:=pos('must have a value',Ex.Message);
      s1:='';
      s2:='';
      if a>0 then
      begin
         s1:=Ex.Message;
         b := pos('''',s1);
         while s1[b+1]<>'''' do
         begin
            inc(b);
            s2 := s2+s1[b];
         end;
         ErrorMsg('Error', 'El campo '+s2+' es obligatorio...  ');
      end
      else Result :=  false;
    end;
end;

procedure TFRegOrdCDep.dbcldArtiChange(Sender: TObject);
begin
  dblcUMed.Text := DMLOG.cdsArti.FieldByName('UNMIDU').AsString;
  edtUMed.Text  := DMLOG.cdsArti.FieldByName('LKUMUABR').AsString;
end;

procedure TFRegOrdCDep.dbeDsctoExit(Sender: TObject);
var
   xTmp : string;
   xNumero : Currency;
begin
  if trim(TCustomEdit(Sender).Text) <> strTMP then
  begin
    try
      xnumero := strtocurr(TCustomEdit(Sender).Text);
      if xnumero < 0 then
      begin
        xTmp := strTMP;
        Showmessage('Ingrese Dato Mayor que cero');
        strTMP := xTmp;
        TCustomEdit(Sender).SetFocus;
      end
      else
      begin
        //Aqui va el codigo delos calculos
        TCustomEdit(Sender).Text := DMLOG.LogDec(TCustomEdit(Sender).Text ,DMLOG.wAnchoPu);
        ImporteDetalle;
      end;
    except
      if (TCustomEdit(Sender).Text = '') or (TCustomEdit(Sender).Text = '.') then
      begin
        TCustomEdit(Sender).Text := DMLOG.LogDec('', DMLOG.wAnchoPu);
        //Aqui Tambien va el codigo de los calculos
        ImporteDetalle;
        Exit;
      end
      else
				xTmp := strTMP;
				Showmessage('Ingrese Número');
				strTMP := xTmp;
				TCustomEdit(Sender).SetFocus;
			end;
		end
	else
		if strTmp = '' then
		begin
			TCustomEdit(Sender).Text := DMLOG.LogDec(TCustomEdit(Sender).Text, DMLOG.wAnchoPu);
		end;
end;

{+.............................................................................+
 |   Calulo de los totales de la orden de compra                               |
 +.............................................................................+}
procedure TFRegOrdCDep.CalcTotal(Sender: TObject);
var
	rTC, rTot, rTD, rTi, rTf, rTp, rI, rX, rTTi  ,rIsc ,rTisc , rTTisc : Currency;
	bTotal : Boolean;
begin
	rTTisc := 0;
	rTisc  := 0;
	rTC    := 0;		// Total Compra
	rTot   := 0;		//
	rTD    := 0;		// Total Descuento
	rI     := 0;		// Impuesto General a las Ventas
	rIsc   := 0;		// Impuesto Selectivo Al Consumo
	bTotal := False;

	DMLOG.cdsDOrdComp.First;
	while not DMLOG.cdsDOrdComp.Eof do
	begin
		if bTotal then    // Total Importe Articulo
		begin
			rTC := DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat + rTC
		end
		else
		begin
			rTC  := (DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat + rTC);
			rI   := (DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat * (DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsCurrency/100) )+rI;
			rIsc := ( DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsFloat * (DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsCurrency/100))+rIsc;
		end;
		rTp := (DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsFloat * DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsFloat);
		rTD := rTD+( rTp * (DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsFloat/100));
		DMLOG.cdsDOrdComp.Next;
	end;
	//rTot:=rTot+(rTC-rTD);
	rTot:=rTot+(rTC);
	if bTotal Then
		rTi := DMLOG.cdsOrdComp.FieldByName('ODCIXTI').AsFloat
	else
	begin
		rTi := rI;
		rTisc := rIsc;
	end;
	rTf := 0; //DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat;
	DMLOG.cdsOrdComp.Edit;
	DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat   := rTC;
	DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat  := rTi;
	DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat    := rTD;
	if bTotal Then
	begin
		rTot := rTot + rTf;
		rTTi := (rTot*rTi/100);
		rX   := rTot + rTTi;
	end
	else
	begin
		rTTi := rTi;
		rTTisc := rTisc;
		rX   := rTot + rTi + rTf +rTisc;
	end;
	DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsCurrency   := rTTi;
	DMLOG.cdsOrdComp.FieldByName('ODCTOTALISC').AsCurrency := rTTisc;
  DMLOG.cdsOrdComp.FieldByName('ODCTOTALG').AsCurrency   := rX;
  DMLOG.cdsOrdComp.post;
end;

procedure TFRegOrdCDep.dedNProformaExit(Sender: TObject);
begin
{ ..... }
  if not DMLOG.cdsOrdComp.FieldByName('CIAID').IsNull then
     if DMLOG.IsExistORD( DMLOG.cdsOrdComp.FieldByName('CIAID').AsString,
                         DMLOG.cdsOrdComp.FieldByName('ODCID').AsString ) then
     begin
        ErrorMsg( 'Error', 'Ya existe una Orden de Compra con '+#13+
                   'con el mismo número ... '+DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);
        DMLOG.cdsOrdComp.FieldByName('ODCID').AsString := DMLOG.StrZero(DMLOG.MaxORD(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString),8);
     end;
end;

procedure TFRegOrdCDep.dblcdExits(Sender: TObject);
var
	sSQL : string;
begin
	if sender = dblcCIA then
	begin
		edtCIA.text := DMLOG.DisplayDescrip('prvSQL','TGE101','CIADES','CIAID='+quotedStr(dblcCIA.text),'CIADES');
		if DMLOG.wModo = 'M' then
			Exit;
		if (wTipoOC = 'xRequisicion') or
			 (wTipoOC = 'xRequisicionTotal') then
		begin
			sNumORD := DMLOG.StrZero( DMLOG.MaxORD(trim(dblccia.Text)),8);
			DMLOG.cdsOrdComp.fieldbyName('ODCID').asString := sNumOrd;


			DMLOG.cdsFPago.close;
			DMLOG.cdsFPago.datarequest('SELECT * FROM CXC101 WHERE CIAID='+quotedStr(dblcCIA.text)+' ORDER BY CCOMERID');
			DMLOG.cdsFPago.open;

			if length(Trim(dblcCIA.Text)) = 0 then
				exit;
      if (SRV_D = 'DB2NT') or
		     (SRV_D = 'DB2400') then
      begin
			  sSQL:=' SELECT COUNT(B.ARTID) AS TOTAL '
				 		 +'FROM LOG308 A INNER JOIN LOG309 B ON ( A.CIAID=B.CIAID AND A.RQSID=B.RQSID ) '
						 +'WHERE (( A.RQSEST='+quotedstr('ACEPTADO')+' ) OR ( A.RQSEST='+quotedstr('PARCIAL')+')) '
						 +'AND ( NOT A.RQSVISADOR IS NULL ) '
						 +'AND B.CIAID='+quotedstr(dblcCIA.Text);
      end
      else
	    if SRV_D = 'ORACLE' then
      begin
        sSQL:=     'SELECT COUNT(B.ARTID) AS TOTAL ';
        sSQL:=sSQL+'FROM LOG308 A, LOG309 B ';
        sSQL:=sSQL+'WHERE ((A.RQSEST=''ACEPTADO'') OR (A.RQSEST=''PARCIAL'')) ';
        sSQL:=sSQL+'AND (NOT A.RQSVISADOR IS NULL) ';
        sSQL:=sSQL+'AND B.CIAID='+quotedstr(dblcCIA.Text)+' ';
        sSQL:=sSQL+'AND A.CIAID=B.CIAID AND A.RQSID=B.RQSID(+) ';
      end;
			DMLOG.cdsQry.close;
			DMLOG.cdsQry.dataRequest(sSQL);
			DMLOG.cdsQry.open;
			if DMLOG.cdsQry.fieldbyName('TOTAL').asInteger = 0 then
			begin
				ErrorMsg('Error','Error, no se puede generar orden de compras'+#13+
												 'porque no hay requisiciones disponibles')
			end;
		end;
		exit;
	end;
	if sender = dblcdProv then
	begin
		edtProv.Text := DMLOG.DisplayDescrip('prvSQL','TGE201','PROVDES','PROV='+quotedStr(dblcdProv.text),'PROVDES');
    exit;
  end;
  if sender = dblcTMoneda then
  begin
    edtTMoneda.Text := DMLOG.DisplayDescrip('prvSQL','TGE103','TMONDES','TMONID='+quotedStr(dblcTMoneda.text),'TMONDES');
    if (wModo = 'A') or (wTipoOC = 'xRequisicion') or (wTipoOC = 'xRequisicionTotal') then
    	if Length(Trim(DMLOG.cdsOrdComp.fieldbyName('ODCTCAMB').asString)) = 0 then
      DMLOG.cdsOrdComp.fieldbyName('ODCTCAMB').asString := DMLOG.CalcTipoCambio(dblcTMoneda.text, dbdtpFEmi.DateTime, DMLOG.wTipoCambio);
    exit;
  end;
  if sender = dbdtpFEmi then
  begin
    if dbdtpFEmi.Date = 0 then
    begin
      Showmessage('Ingrese fecha de Emisión');
      dbdtpFEmi.SetFocus;
    end
    else
    begin
      if Length(trim(DMLOG.cdsOrdComp.fieldbyName('ODCTCAMB').asString))=0 then
      DMLOG.cdsOrdComp.fieldbyName('ODCTCAMB').asString := DMLOG.CalcTipoCambio(dblcTMoneda.text, dbdtpFEmi.DateTime, DMLOG.wTipoCambio);
    end;
    exit;
  end;
  if sender = dblcFPago then
  begin
    edtFPago.Text := DMLOG.DisplayDescrip('prvSQL','CXC101','CCOMERDES','CCOMERID='+quotedStr(dblcFPago.Text),'CCOMERDES');
    exit;
  end;
  if sender = dblcLEntrega then
  begin
    edtLEntrega.text := DMLOG.DisplayDescrip('prvSQL','TGE136','LGECDES','LGECID='+quotedStr(dblcLEntrega.text),'LGECDES');
    exit;
  end;
  if sender = dblcTipoCompra then
  begin
    if dblcTipoCompra.Text = '' then
    begin
      Information('Adquisiciones', 'Tiene que seleccionar un tipo de Solicitud');
      //dblcTipoCompra.SetFocus;
      Exit;
    end;
    //sSQL := 'TIPOADQ=' + QuotedStr(dblcTipoCompra.Text);
    //edtTipoCompra.Text := DMLOG.DisplayDescrip('prvSQL','TGE173','TIPADQDES',sSQL,'TIPADQDES');
    edtTipoCompra.text := DMLOG.DisplayDescrip('prvSQL','TGE173','TIPADQDES','TIPOADQ='+quotedStr(dblcTipoCompra.text),'TIPADQDES');
    exit;
  end;
  {if TwwDBCustomLookupCombo(Sender).DataSource <> nil then
     bRq := TwwDBCustomLookupCombo(Sender).DataSource.DataSet.FieldByName(TwwDBCustomLookupCombo(Sender).DataField).Required;
  if (bRq) and (trim(TwwDBCustomLookupCombo(Sender).Text)='') then
  begin
    TwwDBCustomLookupCombo(Sender).DropDown;
    exit;
  end;}
end;

procedure TFRegOrdCDep.Z2btnDescClick(Sender: TObject);
begin
  // cambiar el total de descuento
  if DMLOG.cdsDOrdComp.RecordCount > 0 then
    if not(dbeDesc.DataSource.Dataset.State in [dsEdit, dsInsert]) then
    begin
      dbeDesc.Enabled := true;
      dbeDesc.DataSource.Dataset.Edit;
      btnDetalle;
    end;
end;

procedure TFRegOrdCDep.dbeDescExit(Sender: TObject);
var
  rTD, rTC, rTf, rTo, rTi: Extended;
begin
  if dbeDesc.DataSource.Dataset.State in [dsEdit, dsInsert] then
  begin
    rTC := DMLOG.cdsOrdComp.FieldByName('ODCIXTCC').AsFloat;
    rTD := DMLOG.cdsOrdComp.FieldByName('ODCIXTD').AsFloat;
    rTf := 0;//DMLOG.cdsOrdComp.FieldByName('ODCIXFLE').AsFloat;
    rTi := DMLOG.cdsOrdComp.FieldByName('ODCTTIMPU').AsFloat;
    rTo := (rTC-rTD)+rTf+rTi;
    DMLOG.cdsOrdComp.FieldByName('ODCTOTALG').AsFloat := rTo;
    DMLOG.cdsOrdComp.post;
    btnDetalle;
    dbeDesc.Enabled := False;
  end;
end;

procedure TFRegOrdCDep.Z2bbtnPrintClick(Sender: TObject);
var
  EstImp : String;
begin
	Screen.Cursor:=crHourGlass;
  DMLOG.FiltraTabla( DMLOG.cdsCia, 'TGE101', 'CIAID', 'CIAID');
  DMLOG.cdsCia.Locate('CIAID',dblcCIA.text ,[loCaseInsensitive]);
  EstImp:=DMLOG.DisplayDescrip('prvTGE','LOG106','FLAG','ESTDES='''+DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString+'''','FLAG');
	xVan := 0;
	ppReportOC;
	ppDBCab.DataSource := DMLOG.dsQry;
	ppdbOC.DataSource  := DMLOG.dsSQL;
	Screen.Cursor:=crDefault;
	if DMLOG.cdscia.FieldByName('CIASUGOC').AsString = 'S' then
	begin
		pprOCPE.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\OrdComp.rtm';
		pprOCPE.Template.LoadFromFile;
		if wRptCia <> 'Incoresa' then
		ppLabel20.Caption:=UpperCase(edtTipoCompra.Text);
    if EstImp = 'IE' then
      ppDBText56.Visible:=True;

		pprOCPE.Print;
		pprOCPE.Stop;
	end
	else
	begin
		pprOCP.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\OrdCompCia.rtm';
		pprOCP.Template.LoadFromFile;
		pprOCP.Print;
		pprOCP.Stop;
	end;
	ppDBCab.DataSource := Nil;
	ppdbOC.DataSource  := Nil;
end;

procedure TFRegOrdCDep.ppReportOC;
var
	xProv, sSQL, sCIA, sOC  : string;
begin
	xProv := DMLOG.DisplayDescrip('prvTGE','TGE102','CLAUXID','CLAUXLOG=''S''','CLAUXID');
	sOC   := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;
	sCIA  := DMLOG.cdsOrdComp.FieldByName('CIAID').AsString;
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    sSQL  := 'SELECT TGE101.CIADES, TGE101.CIARUC, TGE101.CIATLF, TGE101.CIAFAX, TGE101.CIADIRE, TGE201.PROV, '+
             'TGE201.PROVDES, TGE201.PROVDIR, TGE201.PROVTELF, TGE201.PROVREPR, TGE201.PROVRUC, ' +
						 'TGE201.PROVFAX, LOG304.ODCFATE, LOG304.ODCOBS, TGE136.LGECABR, TGE103.TMONABR, '+
						 'CXC101.CCOMERDES, LOG304.ODCID, LOG304.ODCFEMI, LOG304.ODCIXTCC, LOG304.ODCTCAMB, LOG304.ODCEST, '+
						 'LOG304.ODCTTIMPU, LOG304.ODCTOTALISC, LOG304.ODCTOTALG, TGE002.USERNOM USUARIO, A.USERNOM VISADO '+
						 'FROM LOG304 '+
						 'LEFT JOIN TGE101 ON (LOG304.CIAID = TGE101.CIAID) '+
						 'LEFT JOIN TGE201 ON (LOG304.PROV  = TGE201.PROV  AND TGE201.CLAUXID='+QuotedStr(xProv)+') '+
						 'LEFT JOIN TGE136 ON (LOG304.LGECID = TGE136.LGECID) '  +
						 'LEFT JOIN TGE103 ON (LOG304.TMONID = TGE103.TMONID) '  +
						 'LEFT JOIN CXC101 ON (LOG304.CCOMERID = CXC101.CCOMERID)' +
						 'LEFT JOIN TGE002 ON (LOG304.ODCUSER  = TGE002.USERID AND TGE002.MODULOID='''+DMLOG.wModulo+''') ' +
						 'LEFT JOIN TGE002 A ON (LOG304.ODCVISADOR = A.USERID) ' +
						 'WHERE  LOG304.CIAID = ''' + sCIA + ''' '+
             'AND LOG304.ODCID = ''' + sOC + '''';
    DMLOG.cdsQry.DisableControls;
    DMLOG.cdsQry.Close;
    DMLOG.cdsQry.ProviderName:='prvLOG';
    DMLOG.cdsQry.DataRequest(sSQL);
    DMLOG.cdsQry.Open;
    DMLOG.cdsQry.EnableControls;

		sSQL  :=  'SELECT CASE WHEN ARTIDPROV IS NULL OR ARTIDPROV = '''' THEN LOG305.ARTID ELSE ARTIDPROV END ARTID, ' +
							'DODCOBS ARTDES, UM1.UNMABR, '+
							'CASE WHEN UNMIDEQUIV IS NULL OR UNMIDEQUIV = '''' THEN  DODCCNT       ELSE CNTEQUIV END DODCCNT, ' +
							'CASE WHEN UNMIDEQUIV IS NULL OR UNMIDEQUIV = '''' THEN  DODCPUN       ELSE PUNTEQUIV END DODCPUN, ' +
							'CASE WHEN UNMIDEQUIV IS NULL OR UNMIDEQUIV = '''' THEN  DODCCNT * DODCPUN - ( DODCCNT * DODCPUN )*'+DMLOG.wReplacCeros+'( DODCDSCTO ,0 ) /100 ' +
							'ELSE ' +
							'CNTEQUIV * PUNTEQUIV - ( CNTEQUIV * PUNTEQUIV )*'+DMLOG.wReplacCeros+'( DODCDSCTO ,0 ) /100 ' +
							'END  DODCIMP, DODCDSCTO, DODCCSLD, DODCCSLDU, DODCCATE, DODCCATEU ' +
							'FROM LOG305 ' +
							'LEFT JOIN TGE130 UM2 ON (LOG305.UNMIDEQUIV = UM2.UNMID) ' +
							'LEFT JOIN TGE130 UM1 ON (LOG305.UNMID = UM1.UNMID) ' +
							'LEFT JOIN TGE205     ON (TGE205.CIAID = LOG305.CIAID AND TGE205.TINID=LOG305.TINID AND TGE205.ARTID = LOG305.ARTID) '+
							'WHERE LOG305.CIAID = ''' + sCIA + ''' '+
							'AND LOG305.ODCID = ''' + sOC + '''';
		DMLOG.cdsSQL.DisableControls;
		DMLOG.cdsSQL.Close;
		DMLOG.cdsSQL.DataRequest(sSQL);
		DMLOG.cdsSQL.Open;
		DMLOG.cdsSQL.EnableControls;
	end
	else
	if SRV_D = 'ORACLE' then
	begin
		sSQL  := 'SELECT TGE101.CIADES, TGE101.CIARUC, TGE101.CIATLF, TGE101.CIAFAX, TGE101.CIADIRE, TGE201.PROV, '+
						 'TGE201.PROVDES, TGE201.PROVDIR, TGE201.PROVTELF, TGE201.PROVREPR, TGE201.PROVRUC, ' +
						 'TGE201.PROVFAX, LOG304.ODCFATE, LOG304.ODCOBS, TGE136.LGECABR, TGE103.TMONABR, '      +
						 'CXC101.CCOMERDES, LOG304.ODCID, LOG304.ODCFEMI, LOG304.ODCIXTCC, LOG304.ODCTCAMB, LOG304.ODCEST, '+
						 'LOG304.ODCTTIMPU, LOG304.ODCTOTALISC, LOG304.ODCTOTALG, TGE002.USERNOM USUARIO, A.USERNOM VISADO '+
             //
             ' ,LOG304.PROFID '+
             //
						 'FROM LOG304, TGE101, TGE201, TGE136, TGE103, CXC101, TGE002, TGE002 A '+
						 'WHERE  LOG304.CIAID = ''' + sCIA + ''' '+
						 'AND LOG304.ODCID = ''' + sOC + ''' '+
						 'AND LOG304.CIAID = TGE101.CIAID(+) '+
						 'AND LOG304.PROV  = TGE201.PROV(+) AND TGE201.CLAUXID='+QuotedStr(xProv)+' '+
						 'AND LOG304.LGECID = TGE136.LGECID(+) '  +
						 'AND LOG304.TMONID = TGE103.TMONID(+) '  +
						 'AND LOG304.CCOMERID = CXC101.CCOMERID(+) ' +
						 'AND LOG304.CIAID = CXC101.CIAID(+) '+
						 'AND LOG304.ODCUSER  = TGE002.USERID(+) ' +
						 'AND TGE002.MODULOID(+)='''+DMLOG.wModulo+''' '+
						 'AND LOG304.ODCVISADOR = A.USERID(+) '+
             'AND A.MODULOID(+)='''+DMLOG.wModulo+'''';
		DMLOG.cdsQry.DisableControls;
		DMLOG.cdsQry.Close;
		DMLOG.cdsQry.ProviderName:='prvLOG';
		DMLOG.cdsQry.DataRequest(sSQL);
		DMLOG.cdsQry.Open;
		DMLOG.cdsQry.EnableControls;

		sSQL  :=  'SELECT '+//CASE WHEN ARTIDPROV IS NULL THEN LOG305.ARTID ELSE ARTIDPROV END ARTID, ' +
							'DECODE(ARTIDPROV, NULL, LOG305.ARTID, ARTIDPROV) ARTID, '+
							'DODCOBS ARTDES, UM1.UNMABR, '+
							'DECODE(UNMIDEQUIV, NULL, DODCCNT, CNTEQUIV) AS DODCCNT, '+
							'DECODE(UNMIDEQUIV, NULL, DODCPUN, PUNTEQUIV) AS DODCPUN, ' +
							'DECODE(UNMIDEQUIV, NULL, DODCCNT * DODCPUN - ( DODCCNT * DODCPUN )*NVL( DODCDSCTO ,0 ) /100, '+
							'CNTEQUIV * PUNTEQUIV - ( CNTEQUIV * PUNTEQUIV )*NVL( DODCDSCTO ,0 ) /100) ' +
							'DODCIMP, DODCDSCTO, DODCCSLD, DODCCSLDU, DODCCATE, DODCCATEU ' +
							'FROM LOG305, TGE130 UM2, TGE130 UM1, TGE205 ' +
							'WHERE LOG305.CIAID = ''' + sCIA + ''' '+
							'AND LOG305.ODCID = ''' + sOC + ''' '+
							'AND LOG305.UNMIDEQUIV = UM2.UNMID(+) '+
							'AND LOG305.UNMID = UM1.UNMID(+) '+
							'AND TGE205.ARTID(+) = LOG305.ARTID '+
              'AND TGE205.CIAID(+) = LOG305.CIAID '+
              'AND TGE205.TINID(+) = LOG305.TINID';
		DMLOG.cdsSQL.DisableControls;
		DMLOG.cdsSQL.Close;
		DMLOG.cdsSQL.DataRequest(sSQL);
		DMLOG.cdsSQL.Open;
		DMLOG.cdsSQL.EnableControls;
	end;
end;

procedure TFRegOrdCDep.dblcdProvEnter(Sender: TObject);
begin
   strTMP := trim(TCustomEdit(Sender).Text);
end;

procedure TFRegOrdCDep.dblcdProvExit(Sender: TObject);
var
	xTmp : String;
  //xFactor : currency;
begin

	if xCrea then Exit;

	if trim(TCustomEdit(Sender).Text) <> strTMP then
	begin
		if not DMLOG.RecuperarDatos('TGE201','*','PROV=''' + TCustomEdit(Sender).Text + ''' ') then
		begin
	  //rmz		TCustomEdit(Sender).SetFocus;
	  //rmz		xTmp := strTMP;
	  //rmz		ShowMessage('Código de Proveedor no Existe');
	  //rmz		strTMP := xTmp
		end
		else
		begin
		 //rmz	dblcdExits(dblcdProv);
		 //rmz	DMLOG.cdsOrdComp.fieldbyName('PROVDES').AsString := edtProv.Text; //DMLOG.DisplayDescrip('prvSQL','TGE201','PROVDES','PROV='+quotedStr(dblcdProv.text),'PROVDES');
		end;
	 {   //asignar datos de los articulos del detalle
			//Aqui se recuperan los posibles detalles del maestro articulo proveedor
			DMLOG.cdsGrab.close;
			DMLOG.cdsgrab.DataRequest('SELECT * FROM TGE215 WHERE PROV= '''+DMLOG.cdsOrdComp.fieldbyname('PROV').AsString+ ''' ');
			//DMLOG.cdsgrab.CommandText := 'SELECT * FROM TGE215 WHERE PROV= '''+DMLOG.cdsOrdComp.fieldbyname('PROV').AsString+ ''' ';
			DMLOG.cdsGrab.Open;
			try
				DMLOG.cdsDOrdComp.First;
				while not DMLOG.cdsDOrdComp.eof do
				begin
					if DMLOG.cdsGrab.Locate('ARTID',Vararrayof([DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString]),[]) then
					begin
						if ( not (DMLOG.cdsgrab.fieldbyname('ARTIDPROV').isnull ))  and (trim(DMLOG.cdsgrab.fieldbyname('ARTIDPROV').AsString)   <> '' ) then
							DMLOG.cdsDOrdComp.FieldByName('ARTIDPROV').AsString   := DMLOG.cdsgrab.FieldByName('ARTIDPROV').AsString;
						if ( not (DMLOG.cdsgrab.fieldbyname('ARTDESPROV').isnull )) and (trim(DMLOG.cdsgrab.fieldbyname('ARTDESPROV').AsString) <> '' ) then
							DMLOG.cdsDOrdComp.FieldByName('ARTDESPROV').AsString   := DMLOG.cdsgrab.FieldByName('ARTDESPROV').AsString;
            if ( not (DMLOG.cdsgrab.fieldbyname('UNMIDEQUIV').isnull )) and (trim(DMLOG.cdsgrab.fieldbyname('UNMIDEQUIV').AsString) <> '' ) then
            begin
            	DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').AsString   := DMLOG.cdsgrab.FieldByName('UNMIDEQUIV').AsString;
              //Hallar el factor
              xFactor := DMLOG.Factor(DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString,
              DMLOG.cdsDOrdComp.FieldByName('UNMIDEQUIV').AsString );
              DMLOG.cdsDOrdComp.FieldByName('PUNTEQUIV').AsCurrency   := xFactor * DMLOG.cdsDOrdComp.FieldByName('DODCPUN').ascurrency;
              DMLOG.cdsDOrdComp.FieldByName('CNTEQUIV').AsCurrency   := xFactor * DMLOG.cdsDOrdComp.FieldByName('DODCCNT').ascurrency;
            end;
          end;
          DMLOG.cdsDOrdComp.Next;
        end;
      except
      	//Puesto para que no vayan a salir errores
    	end;
      //fin de asignar datos
    end;}
  end
  else
  if strTmp = '' then
  begin
  	//TCustomEdit(Sender).SetFocus;
    xTmp := strTMP;
    ShowMessage('Ingrese Código de Proveedor');
    strTMP := xTmp
  end;
end;

procedure TFRegOrdCDep.Z2bbtnBorrarClick(Sender: TObject);
begin
  if FRegOrdCDep = nil then
    Exit;
  DMLOG.cdsOrdComp.CancelUpdates;
  DMLOG.cdsDOrdComp.CancelUpdates;
  DMLOG.cdsOrdComp.edit;
end;

procedure TFRegOrdCDep.ValidaCab;
begin
  if trim(dblcCIA.Text) = '' then
  begin
    dblcCIA.SetFocus;
    raise Exception.create(' Ingrese Compañia ');
  end;

  if trim(dbeNReg.Text) = '' then
  begin
    dbeNReg.SetFocus;
    raise Exception.create(' Ingrese Nº O. Compra ');
  end;
  if trim(dblcdProv.Text) = '' then
  begin
    dblcdProv.SetFocus;
    raise Exception.create('Ingrese Proveedor');
  end;
  if dbdtpfemi.Date = 0 then
  begin
    dbdtpfemi.SetFocus;
    raise Exception.create('Ingrese Fecha de Emisión');
  end;
  if trim(dblcTMoneda.Text) = '' then
  begin
    dblcTMoneda.SetFocus;
    raise Exception.create('Ingrese Moneda');
  end;
  if trim(dbeTCambio.Text) = '' then
  begin
    dbeTCambio.SetFocus;
    raise Exception.create('Ingrese Tipo de Cambio');
  end;
  if trim(dblcFPago.Text) = '' then
  begin
    dblcFPago.SetFocus;
    raise Exception.create('Ingrese Condición Comercial');
  end;
  if trim(dblcTipoCompra.Text) = '' then
  begin
    dblcTipoCompra.SetFocus;
    raise Exception.create(' Ingrese Tipo de Compra ');
  end;
end;

procedure TFRegOrdCDep.ValidaTot;
begin
	if (DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').AsCurrency  = 0 ) or
		 (DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').IsNull) then
		Raise Exception.create('Ingrese Importes');
end;

procedure TFRegOrdCDep.ImporteDetalle;
var
	rD, rC, rU, rI, rTIMP, rVVen, rISC: Currency;
begin
	rC   := StrToCurr(dbeCnt.Text);
	rU   := StrToCurr(dbePUnit.Text);
	if (rc = 0) or (ru = 0) then
	begin
		dbeImporte.Text := DMLOG.LogDec( '' , 2);
		Exit;
  end;
  if trim(dbeDscto.Text) = ''  then dbeDscto.Text  := '0.00';
  if trim(dbeImpInd.Text) = '' then dbeImpInd.Text := '0.00';
  if trim(dbeISC.Text) = ''    then dbeISC.Text    := '0.00';
  rD   := StrToCurr(dbeDscto.Text);
  rI   := StrToCurr(dbeImpInd.Text);
  rISC := StrToCurr(dbeISC.Text);

	//rTIMP := (rC*rU)-((rC*rU)*(rD/100)) + ((rC*rU)* (rI/100)) + ((rC*rU)*(rISC/100) ); // Ojo Anterior

	rTIMP := (rC*rU)-((rC*rU)*(rD/100));
	rTIMP := rTIMP + ((rTIMP)* (rI/100)) + ((rTIMP)*(rISC/100) );

	rVVen := (rC*rU)-((rC*rU)*(rD/100));// + ((rC*rU)* (rI/100)) + ((rC*rU)*(rISC/100) );
	dbeImporte.Text := Format('%0.2f',[rTIMP]);
	dbeValVen.Text := Format('%0.2f',[rVVen]);
end;

procedure TFRegOrdCDep.ActualizaAxP;
var
  cdsClone : TwwClientDataSet;
  xSQL : String;
begin
  cdsClone := TwwClientDataSet.create(self);
  cdsclone.CloneCursor(DMLOG.cdsDOrdComp, true);
  cdsclone.filter := 'ODCID = ''' + dbeNReg.Text + ''' AND ' +
                     ' ( ( NOT (ARTIDPROV IS NULL  )) AND ( TRIM(ARTIDPROV  ) <> '''' ) '  +
                       ' OR  ( NOT (ARTDESPROV IS NULL )) AND ( TRIM(ARTDESPROV ) <> '''' ) '   +
                       ' OR  ( NOT (UNMIDEQUIV IS NULL )) AND ( TRIM(UNMIDEQUIV ) <> '''' ) )';
  cdsClone.filtered := True;
  if cdsClone.RecordCount > 0 then
  begin
    //Recupera del servidor
    DMLOG.cdsGrab.close;
    //DMLOG.cdsgrab.CommandText := 'SELECT * FROM TGE215 WHERE PROV = ''' + trim(dblcdProv.Text)  + ''' ';
    xSQL :=  'SELECT * FROM TGE215 WHERE PROV = ''' + trim(dblcdProv.Text) + ''' ';
    DMLOG.cdsGrab.DataRequest(xSQL);

    DMLOG.cdsGrab.Open;
    cdsClone.first;
    while not cdsClone.eof do
    begin
      if DMLOG.cdsGrab.locate('ARTID', Vararrayof([cdsclone.fieldbyname('ARTID').asstring ]),[]) then
      begin
        DMLOG.cdsgrab.edit;
      end
			else
			begin
				DMLOG.cdsgrab.insert;
				DMLOG.cdsgrab.fieldbyname('PROV').AsString :=  trim(dblcdProv.Text);
				DMLOG.cdsgrab.fieldbyname('ARTID').AsString := cdsClone.fieldbyname('ARTID').AsString;
			end;
			DMLOG.cdsgrab.fieldbyname('ARTIDPROV').AsString  := cdsClone.fieldbyname('ARTIDPROV').AsString;
			DMLOG.cdsgrab.fieldbyname('UNMIDPROV').AsString  := cdsClone.fieldbyname('UNMIDPROV').AsString;
			DMLOG.cdsgrab.fieldbyname('ARTDESPROV').AsString := cdsClone.fieldbyname('ARTDESPROV').AsString;

			DMLOG.cdsgrab.Post;
			cdsClone.Next;
		end;
		//DMLOG.ControlTran;
		DMLOG.ControlTran( 9, DMLOG.cdsgrab, 'GRAB');
	end;
end;

procedure TFRegOrdCDep.ActualizaProf;
begin

end;

procedure TFRegOrdCDep.FormShow(Sender: TObject);
var
	sSQL : String;
begin
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
	pnlDetalleA.Visible:=False;
	xDesac:=0;
	xCrea:=True;
	xflag:=True;
	wIGV:=DMLOG.displaydescrip('prvSQL','TGE108','TASACAN','TASAFLG=''I''','TASACAN');
	xOrdElim:='';
	edtCIA.Text:='';
	edtTipoCompra.Text:='';
	edtProv.Text:='';
	edtTMoneda.Text:='';
	edtFPago.Text:='';
	edtLEntrega.Text:='';
	if DMLOG.wModo = 'A' then
		dbeTCambio.Text:='';

	if DMLOG.wModo = 'M' then
		dbeNReg.Enabled:=False
	else
		dbeNReg.Enabled:=True;

	Screen.Cursor:=crHourGlass;
	if wTipoOC = 'xProforma' then
	begin
		if not DMLOG.cdsOrdComp.fieldbyname('PROV').IsNull then
			if not (trim(DMLOG.cdsOrdComp.fieldbyname('PROV').AsString) = '') then
				if DMLOG.RecuperarDatos('TGE201','*','PROV=''' + DMLOG.cdsOrdComp.fieldbyname('PROV').AsString + ''' ') then
						edtProv.Text := DMLOG.cdsQry.fieldbyname('PROVDES').AsString;
		btnDetalle;
	end;

  // Aqui Inicio - para modificar los campos de Dscto, Impuesto, etc		 Todo esto en Comentario

   if DMLOG.wModo <> 'A' then
   begin
      if Length(Trim(DMLOG.cdsOrdComp.fieldbyname('ODCVISADOR').AsString)) > 0 then
      begin
         OnOffCabecera(False); //Activar la cabecera
         OnOffDetalle(True); //Desactivar el panel de detalle
      end
      else
      begin
         OnOffCabecera(True); //Activar la cabecera
         OnOffDetalle(False); //Desactivar el panel de detalle
      end;
   end
   else
   begin
      OnOffCabecera(True); //Activar la cabecera
      OnOffDetalle(False); //Desactivar el panel de detalle
   end;

	if DMLOG.wModo <> 'A' then
	if ( btxtEstado.Field.AsString = 'ACEPTADO' ) or
		 ( btxtEstado.Field.AsString = 'DEPURADO' )or
		 ( btxtEstado.Field.AsString = 'ANULADO' )or
		 ( btxtEstado.Field.AsString = 'PARCIAL' )  or
		 ( btxtEstado.Field.AsString = 'ATENDIDO' ) then
	begin
		OnOffCabecera(False); //Activar la cabecera
		OnOffDetalle(True); //Desactivar el panel de detalle
		pnlcabecera.Enabled   := False;
		Z2bbtnRegresa.Enabled := False;
		Z2bbtnCanc2.Enabled   := False;
		Z2bbtnGraba.Enabled   := False;
		Z2bbtnAcepta.Enabled  := False;
		//Z2bbtnAnula.Enabled   := False;
		z2bbtnSalir.Enabled   := True;
		//Z2bbtnPrint.Enabled   := True;
	end;

  // Aqui Final

	if (wTipoOC = 'xRequisicion') or
      (wTipoOC = 'xRequisicionTotal') then
	begin
    DMLOG.FiltraTabla( DMLOG.cdsLEntrega,    'TGE136', 'LGECID', 'LGECID');
		//DMLOG.cdsLEntrega.open;
		if DMLOG.wModo <> 'M' then
		begin
			DMLOG.cdsOrdComp.Append;
			//dblcdExits(dblcCIA);         |
			DMLOG.cdsOrdComp.fieldbyName('ODCFREG').AsDateTime := date;
			DMLOG.cdsOrdComp.fieldbyName('ODCFEMI').AsDateTime := date;
			DMLOG.cdsOrdComp.fieldbyName('ODCFATE').AsDateTime := date;
			DMLOG.cdsOrdComp.fieldbyName('ODCTEN').asInteger := 1;
			DMLOG.cdsOrdComp.fieldbyName('ODCVALID').asInteger := 1;
			dblcdProv.text := '';
			dedNProforma.Text := '';
			dbeFlete.Text:='0.00';
			dblcdProv.Enabled := true;
		end;
	end;
	if DMLOG.cdsOrdComp.State in [dsInsert] then
		dblcCIA.Enabled   := True
	else
		dblcCIA.Enabled   := False;

	sSQL := 'SELECT * FROM LOG305 WHERE CIAID='''+dblcCIA.Text+''' AND ODCID='''+dbeNReg.Text+''' ORDER BY CIAID, ODCID, DODCID';
	DMLOG.cdsDOrdComp.Close;
	DMLOG.cdsDOrdComp.DataRequest(sSQL);
	DMLOG.cdsDOrdComp.Open;

	if DMLOG.wModo = 'M' then
	begin
		dblcdExits(dblcCIA);
		dblcdExits(dblcdProv);
		dblcdExits(dblcTMoneda);
      dblcdExits(dblcFPago);
      dblcdExits(dblcLEntrega);
      dblcdExits(dblcTipoCompra);
  	   xPriInser:='';
   end;
   DMLOG.cdsDODCxDRQS.Close;
   DMLOG.cdsDODCxDRQS.MasterSource    := DMLOG.dsDOrdComp;
   DMLOG.cdsDODCxDRQS.MasterFields    := 'CIAID;ODCID;DODCID';
   DMLOG.cdsDODCxDRQS.IndexFieldNames := 'CIAID;ODCID;DODCID';
   //INICIO HPP_201104_LOG
 	 DMLOG.cdsDODCxDRQS.DataRequest(sSQL);
	 DMLOG.cdsDODCxDRQS.Open;
   //FIN HPP_201104_LOG
   DMLOG.cdsDODCxDRQS.Open;

   if DMLOG.wModo = 'A' then
   begin
  	   xPriInser:='A';
      if DMLOG.cdsCia.RecordCount=1 then
      begin
    	   DMLOG.cdsOrdComp.FieldByName('CIAID').Value:=DMLOG.cdsCia.FieldByname('CIAID').AsString;
         dblcdExits(dblcCIA);
         dblcCia.Enabled:=False;
         dbeNReg.SetFocus;
      end
      else
      begin
    	   dblcCia.Enabled:=True;
         dblcCia.SetFocus;
      end;
   end;
   xCrea:=False;
   Screen.Cursor:=crDefault;
end;

procedure TFRegOrdCDep.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
      if self.ActiveControl Is TDBMemo then Exit;
      if self.ActiveControl Is TMemo then Exit;
  	   key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFRegOrdCDep.pprOCPEPreviewFormCreate(Sender: TObject);
begin
	pprOCPE.PreviewForm.ClientHeight := 500;
	pprOCPE.PreviewForm.ClientWidth := 650;
	tppviewer(pprOCPE.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFRegOrdCDep.pprOCPAfterPrint(Sender: TObject);
begin
   if DMLOG.cdsOrdComp.FieldByName('ODCFATE').IsNull then
   begin
      DMLOG.cdsOrdComp.Edit;
      DMLOG.cdsOrdComp.FieldByName('ODCFATE').AsDateTime := Date;
      DMLOG.cdsOrdComp.Post;
		//DMLOG.ControlTran;
		DMLOG.ControlTran( 9, DMLOG.cdsOrdComp, 'ORDCOMP');
		//ApplyUpdates(0);
   end;
end;

procedure TFRegOrdCDep.pprOCPBeforePrint(Sender: TObject);
var
	sSQL, sConta : String;
begin
	sConta:='';
	sSQL:='SELECT DISTINCT RQSID FROM LOG324 WHERE ODCID='''+DMLOG.cdsOrdComp.fieldbyName('ODCID').asString+''' AND CIAID='''+dblcCIA.Text+''' AND DODCCNT>0 ORDER BY RQSID';
	DMLOG.cdsLOG.Close;
	DMLOG.cdsLOG.DataRequest(sSQL);
	DMLOG.cdsLOG.Open;
	DMLOG.cdsLOG.First;
	while not DMLOG.cdsLOG.Eof do
	begin
		sConta:=sConta+DMLOG.cdsLOG.FieldByName('RQSID').AsString+', ';
		DMLOG.cdsLOG.Next;
	end;
	ppLabel8.Text:=sConta;
	{ pprOCP.PreviewForm.WindowState := wsMaximized;
	TppViewer(pprOCP.PreviewForm.Viewer).ZoomSetting := zsPageWidth;
	TppReport(Sender).PreviewForm.WindowState := wsMaximized;
	TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zsPageWidth;}
end;

{    if wTipoOC = 'xRequisicion' then
		begin
			DMLOG.cdsDOrdComp.first;
			while not DMLOG.cdsDOrdComp.eof do
			begin
					//cds1.locate('UNMID',Vararrayof([dblcUMEquiv.Text]),[])

					if DMLOG.cdsArtPendX.fieldbyName('RQSFLAGUM').AsString = 'G' then  //if DMLOG.cdsDOrdComp.fieldbyName('RQSFLAGUM').asString = 'G' then
          	nArtSol := DMLOG.cdsArtPendX.fieldbyName('RXACNTSG').asInteger
          else

          	nArtSol := DMLOG.cdsArtPendX.fieldbyName('RXACNTSU').asInteger;

          if DMLOG.cdsDOrdComp.fieldbyName('DODCCNT').asInteger = nArtSol then  //if DMLOG.cdsDOrdComp.fieldbyName('DRQSCNS').asInteger = nArtSol then
          	sEstado := 'ATENDIDO'
          else
          	sEstado := 'PARCIAL';

          DMLOG.cdsFAsig.First;
          while not DMLOG.cdsFAsig.eof do    //while not DMLOG.cdsRqsArtX.eof do
          begin
            sSQL := 'UPDATE LOG308 SET RQSEST=' +quotedStr(sEstado)
                     + ' WHERE RQSID=' +quotedstr(DMLOG.cdsFAsig.fieldbyName('RQSID').asString);   // + ' WHERE RQSID=' +quotedstr(DMLOG.cdsRqsArtX.fieldbyName('RQSID').asString);
            DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            sSQL := 'UPDATE LOG309 SET RQSEST=' +quotedStr(sEstado)
                     + ' WHERE RQSID=' +quotedstr(DMLOG.cdsFAsig.fieldbyName('RQSID').asString);  //+ ' WHERE RQSID=' +quotedstr(DMLOG.cdsRqsArtX.fieldbyName('RQSID').asString);
            DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
            DMLOG.cdsFAsig.next;         //DMLOG.cdsRqsArtX.next;
          end;
        DMLOG.cdsDOrdComp.next;
      end; //eof
    end; //xRqs
}


procedure TFRegOrdCDep.pprOCPPreviewFormCreate(Sender: TObject);
begin
   pprOCP.PreviewForm.ClientHeight := 500;
   pprOCP.PreviewForm.ClientWidth := 650;
   tppviewer(pprOCP.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFRegOrdCDep.dblcUMedExit(Sender: TObject);
begin
	edtUMed.Text := DMLOG.DisplayDescrip('prvSQL','TGE130','UNMDES','UNMID='+quotedStr(dblcUMed.Text),'UNMDES');
end;

procedure TFRegOrdCDep.ProXReq;
var
	xSQL : String;
begin
   if (SRV_D = 'DB2NT') or
		 (SRV_D = 'DB2400') then
   begin
      DMLOG.cdsRqsArtX.MasterSource    := Nil;
      DMLOG.cdsRqsArtX.MasterFields    := '';
      DMLOG.cdsRqsArtX.IndexFieldNames := '';

      xSQL:= 'SELECT A.CIAID, B.ARTID, B.UNMIDG, B.UNMIDU, B.RQSFLAGUM, B.RQSMARK, SUBSTR(B.DRQSOBS,1,100) AS ARTDES, B.TIPOADQ, '
            +'SUM(COALESCE(B.DRQSCNSG,0)) AS RXACNTSG, SUM(COALESCE(B.DRQSCNAG,0)) AS RXACNTAG, '
            +'SUM(COALESCE(B.DRQSCNSG,0)-COALESCE(B.DRQSCNAG,0)) AS RXASALDOG, '
            +'SUM(COALESCE(B.DRQSCNSU,0)) AS RXACNTSU, SUM(COALESCE(B.DRQSCNAU,0)) AS RXACNTAU, '
            +'SUM(COALESCE(B.DRQSCNSU,0)-COALESCE(B.DRQSCNAU,0)) AS RXASALDOU '
            +'FROM LOG308 A '
            +'INNER JOIN LOG309 B ON ( A.CIAID=B.CIAID AND A.RQSID=B.RQSID ) '
            +'LEFT JOIN  TGE205 ON (B.ARTID = TGE205.ARTID) '
            +'WHERE (( A.RQSEST='+quotedstr('ACEPTADO')+' ) OR ( A.RQSEST='+quotedstr('PARCIAL')+')) '
            +'AND ( (COALESCE(B.DRQSCNSG,0)-COALESCE(B.DRQSCNAG,0)>0) '
                  +'OR (COALESCE(B.DRQSCNSU,0)-COALESCE(B.DRQSCNAU,0)>0) ) '
            +' AND ( NOT A.RQSVISADOR IS NULL ) '
					 +'AND A.CIAID='+quotedstr(dblcCIA.Text)
            +' AND A.TIPOADQ='+quotedStr(dblcTipoCompra.text);
      if SRV_E = 'AS/400' then
      begin
         if SRV_V = '3.5' then
            xSQL := xSQL+' GROUP BY  A.CIAID, B.ARTID, B.RQSFLAGUM, B.UNMIDG, B.UNMIDU, B.RQSMARK, B.DRQSOBS, B.TIPOADQ'
         else
            xSQL := xSQL+' GROUP BY  A.CIAID, B.ARTID, B.RQSFLAGUM, B.UNMIDG, B.UNMIDU, B.RQSMARK, SUBSTR(B.DRQSOBS,1,100), B.TIPOADQ';
      end
      else
         xSQL := xSQL+' GROUP BY  A.CIAID, B.ARTID, B.RQSFLAGUM, B.UNMIDG, B.UNMIDU, B.RQSMARK, SUBSTR(B.DRQSOBS,1,100), B.TIPOADQ';

      DMLOG.cdsArtPendX.Close;
      DMLOG.cdsArtPendX.DataRequest(xSQL);
      DMLOG.cdsArtPendX.Open;
      xSQL := 'SELECT B.CIAID, B.RQSID, B.DRQSID, B.ARTID, B.RQSFLAGUM, B.DRQSCNSG, B.DRQSCNAG, B.DRQSCNSG-B.DRQSCNAG DRQSSLDG, B.TIPOADQ, '
             +' B.UNMIDG, B.DRQSCNSU, B.DRQSCNAU, B.DRQSCNSU-B.DRQSCNAU DRQSSLDU, B.UNMIDU, A.RQSFREQ, A.CCOSID, A.PRIOID, '
             +' A.RQSSOLI, A.RQSAUTOR, A.RQSAPRO, A.RQSEST, A.RQSFATE, A.RQSFREG, A.LOCID, '
             +' C.GRARID, D.CCOSDES, G.UNMDES UNMGDES, H.UNMDES UNMUDES, substr(B.DRQSOBS,1,100) as ARTDES '
             +'FROM LOG309 B '
             +'LEFT JOIN LOG308 A ON (A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.RQSID=B.RQSID) '
             +'LEFT JOIN TGE205 C ON ( B.ARTID  = C.ARTID ) '
             +'LEFT JOIN TGE203 D ON ( A.CCOSID = D.CCOSID ) '
             +'LEFT JOIN TGE130 G ON ( B.UNMIDG = G.UNMID) '
             +'LEFT JOIN TGE130 H ON ( B.UNMIDU = H.UNMID) '
             +'WHERE A.RQSEST <> ' +quotedstr('ATENDIDO')
                  +' AND ( COALESCE(B.DRQSCNSG,0) - COALESCE(B.DRQSCNAG,0) > 0 '
                            +' OR COALESCE(B.DRQSCNSU,0) - COALESCE(B.DRQSCNAU,0) > 0 )'
                  +' AND B.CIAID=' +quotedstr(dblcCIA.Text)+' '
                  +' AND ( NOT A.RQSVISADOR IS NULL ) '
                  +' AND B.TIPOADQ='+quotedStr(dblcTipoCompra.text);
           //   +'ORDER BY SUBSTR(B.DRQSOBS,1,50)';
      DMLOG.cdsRqsArtX.Close;
      DMLOG.cdsRqsArtX.datarequest(xSQL);
      DMLOG.cdsRqsArtX.MasterSource    := DMLOG.dsArtPendX;
      DMLOG.cdsRqsArtX.MasterFields    := 'ARTDES';
      DMLOG.cdsRqsArtX.IndexFieldNames := 'ARTDES';
      DMLOG.cdsRqsArtX.Open;
   end
   else
	if SRV_D = 'ORACLE' then
   begin
      DMLOG.cdsRqsArtX.MasterSource    := Nil;
      DMLOG.cdsRqsArtX.MasterFields    := '';
      DMLOG.cdsRqsArtX.IndexFieldNames := '';

      xSQL:=     'SELECT A.CIAID, B.ARTID, B.UNMIDG, B.UNMIDU, B.RQSFLAGUM, B.RQSMARK, SUBSTR(B.DRQSOBS,1,100) AS ARTDES, B.TIPOADQ, ';
      xSQL:=xSQL+'SUM(NVL(B.DRQSCNSG,0)) AS RXACNTSG, SUM(NVL(B.DRQSCNAG,0)) AS RXACNTAG, ';
      xSQL:=xSQL+'SUM(NVL(B.DRQSCNSG,0)-NVL(B.DRQSCNAG,0)) AS RXASALDOG, ';
      xSQL:=xSQL+'SUM(NVL(B.DRQSCNSU,0)) AS RXACNTSU, SUM(NVL(B.DRQSCNAU,0)) AS RXACNTAU, ';
      xSQL:=xSQL+'SUM(NVL(B.DRQSCNSU,0)-NVL(B.DRQSCNAU,0)) AS RXASALDOU ';
      xSQL:=xSQL+'FROM LOG308 A, LOG309 B, TGE205 C ';
      xSQL:=xSQL+'WHERE (( A.RQSEST='+quotedstr('ACEPTADO')+' ) OR ( A.RQSEST='+quotedstr('PARCIAL')+')) ';
      xSQL:=xSQL+'AND ( (NVL(B.DRQSCNSG,0)-NVL(B.DRQSCNAG,0)>0) ';
      xSQL:=xSQL+'OR (NVL(B.DRQSCNSU,0)-NVL(B.DRQSCNAU,0)>0) ) ';
      //if Prm_RqsPedUsu <> 'N' then
      xSQL:=xSQL+' AND ( NOT A.RQSVISADOR IS NULL ) ';
      xSQL:=xSQL+' AND A.CIAID='+quotedstr(dblcCIA.Text);
      xSQL:=xSQL+' AND A.TIPOADQ='+quotedStr(dblcTipoCompra.text);
      xSQL:=xSQL+' AND A.CIAID=B.CIAID(+) ';
      xSQL:=xSQL+'AND A.RQSID=B.RQSID(+) ';
      xSQL:=xSQL+'AND B.ARTID=C.ARTID(+) ';
      xSQL:=xSQL+'GROUP BY  A.CIAID, B.ARTID, B.RQSFLAGUM, B.UNMIDG, B.UNMIDU, B.RQSMARK, SUBSTR(B.DRQSOBS,1,100), B.TIPOADQ';

      DMLOG.cdsArtPendX.Close;
      DMLOG.cdsArtPendX.DataRequest(xSQL);
      DMLOG.cdsArtPendX.Open;
      xSQL:=     'SELECT B.CIAID, B.RQSID, B.DRQSID, B.ARTID, B.RQSFLAGUM, B.DRQSCNSG, B.DRQSCNAG, B.DRQSCNSG-B.DRQSCNAG DRQSSLDG, B.TIPOADQ, ';
      xSQL:=xSQL+'B.UNMIDG, B.DRQSCNSU, B.DRQSCNAU, B.DRQSCNSU-B.DRQSCNAU DRQSSLDU, B.UNMIDU, A.RQSFREQ, A.CCOSID, A.PRIOID, ';
      xSQL:=xSQL+'A.RQSSOLI, A.RQSAUTOR, A.RQSAPRO, A.RQSEST, A.RQSFATE, A.RQSFREG, A.LOCID, ';
      xSQL:=xSQL+'C.GRARID, D.CCOSDES, G.UNMDES UNMGDES, H.UNMDES UNMUDES, SUBSTR(B.DRQSOBS,1,100) as ARTDES ';
      //xSQL:=xSQL+'C.GRARID, D.CCOSDES, G.UNMDES UNMGDES, H.UNMDES UNMUDES, substr(B.DRQSOBS,1,50) as ARTDES ';
      xSQL:=xSQL+'FROM LOG309 B, LOG308 A, TGE205 C, TGE203 D, TGE130 G, TGE130 H ';
      xSQL:=xSQL+'WHERE A.RQSEST <> ' +quotedstr('ATENDIDO')+' ';
      xSQL:=xSQL+'AND ( NVL(B.DRQSCNSG,0) - NVL(B.DRQSCNAG,0) > 0 ';
      xSQL:=xSQL+'OR NVL(B.DRQSCNSU,0) - NVL(B.DRQSCNAU,0) > 0 ) ';
      xSQL:=xSQL+'AND B.CIAID=' +quotedstr(dblcCIA.Text)+' ';
      //if Prm_RqsPedUsu <> 'N' then
      xSQL:=xSQL+'AND ( NOT A.RQSVISADOR IS NULL ) ';
      xSQL:=xSQL+'AND B.TIPOADQ='+quotedStr(dblcTipoCompra.text)+' ';
      xSQL:=xSQL+'AND A.CIAID=B.CIAID ';
      xSQL:=xSQL+'AND A.LOCID=B.LOCID ';
      xSQL:=xSQL+'AND A.RQSID=B.RQSID ';
      xSQL:=xSQL+'AND B.ARTID=C.ARTID ';
      xSQL:=xSQL+'AND A.CCOSID=D.CCOSID(+) ';
      xSQL:=xSQL+'AND B.UNMIDG=G.UNMID(+) ';
      xSQL:=xSQL+'AND B.UNMIDU=H.UNMID(+) ';
           //   +'ORDER BY SUBSTR(B.DRQSOBS,1,50)';
      DMLOG.cdsRqsArtX.Close;
      DMLOG.cdsRqsArtX.datarequest(xSQL);
      DMLOG.cdsRqsArtX.MasterSource    := DMLOG.dsArtPendX;
      DMLOG.cdsRqsArtX.MasterFields    := 'ARTDES';
      DMLOG.cdsRqsArtX.IndexFieldNames := 'ARTDES';
      DMLOG.cdsRqsArtX.Open;
   end;
end;

procedure TFRegOrdCDep.ProXReqTot;
var
	xSQL : String;
begin
  if (SRV_D = 'DB2NT') or
		 (SRV_D = 'DB2400') then
  begin
    xSQL := 'SELECT A.CIAID, A.RQSID, A.TIPOADQ, A.CCOSID, A.PRIOID, D.CCOSDES, '
           +'A.RQSSOLI, A.RQSAUTOR, A.RQSAPRO, A.RQSEST, A.RQSFATE, A.RQSFREG, A.LOCID, A.RQSVISADOR, '
           +'A.RQSVISHREG, A.RQSUSER, RQSHREG, A.RQSCOMPID, A.URQUSR, A.URQHREG, A.URQACEPUSR, A.URQACEPHREG '
           +'FROM LOG308 A '
           +'LEFT JOIN TGE203 D ON ( A.CCOSID = D.CCOSID ) '
           +'WHERE (( A.RQSEST='+quotedstr('ACEPTADO')+' ) OR ( A.RQSEST='+quotedstr('PARCIAL')+')) '
    //if Prm_RqsPedUsu <> 'S' then
             +' AND ( NOT A.RQSVISADOR IS NULL ) '
             +' AND A.CIAID='+quotedstr(dblcCIA.Text)
             +' AND A.TIPOADQ='+quotedStr(dblcTipoCompra.text);

    DMLOG.cdsArtPendXTot.Close;
    DMLOG.cdsArtPendXTot.DataRequest(xSQL);
    DMLOG.cdsArtPendXTot.Open;             			// Detalle
    xSQL := 'SELECT B.CIAID, B.RQSID, B.DRQSID, B.ARTID, B.RQSFLAGUM, B.DRQSCNSG, B.DRQSCNAG, '
           +'COALESCE(B.DRQSCNSG,0)-COALESCE(B.DRQSCNAG,0) AS RXACNTSG, B.TIPOADQ, '
           +'B.UNMIDG, B.DRQSCNSU, B.DRQSCNAU, COALESCE(B.DRQSCNSU,0)-COALESCE(B.DRQSCNAU,0) AS RXACNTSU, '
           +'B.UNMIDU, A.RQSFREQ, A.CCOSID, A.PRIOID, '
           +'A.RQSSOLI, A.RQSAUTOR, A.RQSAPRO, B.RQSEST, A.RQSFATE, A.RQSFREG, A.LOCID, '
           +'C.GRARID, D.CCOSDES, G.UNMDES UNMGDES, H.UNMDES UNMUDES, B.DRQSOBS as ARTDES '
           //+'C.GRARID, D.CCOSDES, G.UNMDES UNMGDES, H.UNMDES UNMUDES, substr(B.DRQSOBS,1,50) as ARTDES '
           +'FROM LOG309 B '
           +'LEFT JOIN LOG308 A ON (A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.RQSID=B.RQSID) '
           +'LEFT JOIN TGE205 C ON ( B.ARTID  = C.ARTID ) '
           +'LEFT JOIN TGE203 D ON ( A.CCOSID = D.CCOSID ) '
           +'LEFT JOIN TGE130 G ON ( B.UNMIDG = G.UNMID) '
           +'LEFT JOIN TGE130 H ON ( B.UNMIDU = H.UNMID) '
           +'WHERE B.RQSEST <> ' +quotedstr('ATENDIDO')
           +' AND ( COALESCE(B.DRQSCNSG,0) - COALESCE(B.DRQSCNAG,0) > 0 '
           +' OR COALESCE(B.DRQSCNSU,0) - COALESCE(B.DRQSCNAU,0) > 0 )'
           +' AND B.CIAID=' +quotedstr(dblcCIA.Text)+' '
           +' AND B.TIPOADQ='+quotedStr(dblcTipoCompra.text)
           +' AND ( NOT A.RQSVISADOR IS NULL ) ORDER BY RQSID, DRQSID';
    DMLOG.cdsRqsArtXTot.Close;
    DMLOG.cdsRqsArtXTot.datarequest(xSQL);

    DMLOG.cdsRqsArtXTot.MasterSource    := DMLOG.dsArtPendXTot;
    DMLOG.cdsRqsArtXTot.MasterFields    := 'RQSID';
    DMLOG.cdsRqsArtXTot.IndexFieldNames := 'RQSID';
    //DMLOG.cdsRqsArtX.MasterFields    := 'ARTDES';
    //DMLOG.cdsRqsArtX.IndexFieldNames := 'ARTDES';
    DMLOG.cdsRqsArtXTot.Open;
  end
  else
	if SRV_D = 'ORACLE' then
  begin
    xSQL:=     'SELECT A.CIAID, A.RQSID, A.TIPOADQ, A.CCOSID, A.PRIOID, D.CCOSDES, ';
    xSQL:=xSQL+'A.RQSSOLI, A.RQSAUTOR, A.RQSAPRO, A.RQSEST, A.RQSFATE, A.RQSFREG, A.LOCID, A.RQSVISADOR, ';
    xSQL:=xSQL+'A.RQSVISHREG, A.RQSUSER, RQSHREG, A.RQSCOMPID, A.URQUSR, A.URQHREG, A.URQACEPUSR, A.URQACEPHREG ';
    xSQL:=xSQL+'FROM LOG308 A, TGE203 D ';
    xSQL:=xSQL+'WHERE (( A.RQSEST='+quotedstr('ACEPTADO')+' ) OR ( A.RQSEST='+quotedstr('PARCIAL')+')) ';
    if Prm_RqsPedUsu <> 'S' then
    	xSQL:=xSQL+'AND ( NOT A.RQSVISADOR IS NULL ) ';
		xSQL:=xSQL+'AND A.CIAID='+quotedstr(dblcCIA.Text)+' ';
    xSQL:=xSQL+'AND A.TIPOADQ='+quotedStr(dblcTipoCompra.text)+' ';
    xSQL:=xSQL+'AND A.CCOSID = D.CCOSID(+)';

    DMLOG.cdsArtPendXTot.Close;
    DMLOG.cdsArtPendXTot.DataRequest(xSQL);
    DMLOG.cdsArtPendXTot.Open;             			// Detalle

    xSQL := 'SELECT B.CIAID, B.RQSID, B.DRQSID, B.ARTID, B.RQSFLAGUM, B.DRQSCNSG, B.DRQSCNAG, ';
    xSQL:=xSQL+'NVL(B.DRQSCNSG,0)-NVL(B.DRQSCNAG,0) AS RXACNTSG, B.TIPOADQ, ';
    xSQL:=xSQL+'B.UNMIDG, B.DRQSCNSU, B.DRQSCNAU, NVL(B.DRQSCNSU,0)-NVL(B.DRQSCNAU,0) AS RXACNTSU, ';
    xSQL:=xSQL+'B.UNMIDU, A.RQSFREQ, A.CCOSID, A.PRIOID, ';
    xSQL:=xSQL+'A.RQSSOLI, A.RQSAUTOR, A.RQSAPRO, B.RQSEST, A.RQSFATE, A.RQSFREG, A.LOCID, ';
    xSQL:=xSQL+'C.GRARID, D.CCOSDES, G.UNMDES UNMGDES, H.UNMDES UNMUDES, B.DRQSOBS as ARTDES, A.RQSVISADOR ';
    //xSQL:=xSQL+'C.GRARID, D.CCOSDES, G.UNMDES UNMGDES, H.UNMDES UNMUDES, substr(B.DRQSOBS,1,50) as ARTDES ';
    xSQL:=xSQL+'FROM LOG309 B, LOG308 A, TGE205 C, TGE203 D, TGE130 G, TGE130 H ';
    xSQL:=xSQL+'WHERE B.RQSEST <> ' +quotedstr('ATENDIDO')+' ';
    xSQL:=xSQL+'AND ( NVL(B.DRQSCNSG,0) - NVL(B.DRQSCNAG,0) > 0 ';
    xSQL:=xSQL+' OR NVL(B.DRQSCNSU,0) - NVL(B.DRQSCNAU,0) > 0 ) ';
		xSQL:=xSQL+'AND B.CIAID=' +quotedstr(dblcCIA.Text)+' ';
    xSQL:=xSQL+'AND B.TIPOADQ='+quotedStr(dblcTipoCompra.text)+' ';
    if Prm_RqsPedUsu <> 'S' then
    	xSQL:=xSQL+'AND ( NOT A.RQSVISADOR IS NULL ) ';
    xSQL:=xSQL+'AND A.CIAID=B.CIAID(+) AND A.LOCID=B.LOCID(+) AND A.RQSID=B.RQSID(+) ';
    xSQL:=xSQL+'AND B.ARTID  = C.ARTID(+) ';
    xSQL:=xSQL+'AND A.CCOSID = D.CCOSID(+) ';
    xSQL:=xSQL+'AND B.UNMIDG = G.UNMID(+) ';
    xSQL:=xSQL+'AND B.UNMIDU = H.UNMID(+) ';
    xSQL:=xSQL+'ORDER BY RQSID, DRQSID';

    DMLOG.cdsRqsArtXTot.Close;
    DMLOG.cdsRqsArtXTot.datarequest(xSQL);

    DMLOG.cdsRqsArtXTot.MasterSource    := DMLOG.dsArtPendXTot;
    DMLOG.cdsRqsArtXTot.MasterFields    := 'RQSID';
    DMLOG.cdsRqsArtXTot.IndexFieldNames := 'RQSID';
    //DMLOG.cdsRqsArtX.MasterFields    := 'ARTDES';
    //DMLOG.cdsRqsArtX.IndexFieldNames := 'ARTDES';
    DMLOG.cdsRqsArtXTot.Open;
  end;
end;

procedure TFRegOrdCDep.dbeNRegExit(Sender: TObject);
var
   sSQL : String;
begin
	if DMLOG.wModo = 'A' then
  begin
		if not DMLOG.cdsOrdComp.FieldByName('CIAID').IsNull then
       if DMLOG.IsExistORD( DMLOG.cdsOrdComp.FieldByName('CIAID').AsString,
                          DMLOG.cdsOrdComp.FieldByName('ODCID').AsString ) then
       begin
          ErrorMsg('Error', 'Ya existe una Orden de Compra con '+#13+
                   'con el mismo número ... '+DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);
          dbeNReg.SetFocus;
          Exit;
       end;

    // apertura detalle de Orden de Compra
    DMLOG.cdsDOrdComp.disableControls;
    sSQL:='SELECT CIAID,ODCID,DODCID,DODCIMP,DODCIMPU,DODCISCU,DODCCNT,DODCPUN,DODCDSCTO,ODCEST,DODCCSLD,DODCCATE,ARTID,UNMID,IMPTOT,IMPUNI,DODCOBS,TIPOADQ,ARTIDPROV,ARTDESPROV,UNMIDEQUIV,PUNTEQUIV,CNTEQUIV FROM LOG305 '
         +'WHERE CIAID='''+dblcCIA.text+''' AND ODCID='''+sNumOrd+'''';
    DMLOG.cdsDOrdComp.Close;
    DMLOG.cdsDOrdComp.dataRequest(sSQL);
    DMLOG.cdsDOrdComp.Open;
    DMLOG.cdsDOrdComp.enableControls;
  end;
end;

procedure TFRegOrdCDep.Z2bbtnColocacClick(Sender: TObject);
begin
  if (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) <> 'ACEPTADO') then
	begin
    ErrorMsg('Adquisiciones', 'Para que pueda Realizar la Colocación Tiene que estar Aceptada la Orden de Compra ');
  	Exit;
	end;
	if DMLOG.cdsOrdComp.State in [dsInsert,dsEdit] then
  begin
  	DMLOG.cdsOrdComp.Cancel;
    //ErrorMsg('Adquisiciones', ' Grabe Antes de Modificar la Colocación ');
  	//Exit;
  end;
  DMLOG.cdsOrdComp.edit ;
  DMLOG.cdsOrdComp.FieldByName('OCCOLOCAC').AsString := DMLOG.wUsuario ;
  DMLOG.cdsOrdComp.FieldByName('OCCOLOFREG').AsDateTime := Date ;
  DMLOG.cdsOrdComp.FieldByName('OCCOLOHREG').AsDateTime := SysUtils.Time ;
  DMLOG.cdsOrdComp.post ;
	DMLOG.cdsOrdComp.ApplyUpdates(0);
	Z2bbtnColocac.Enabled:=False;
  //DMLOG.ControlTran;
end;

procedure TFRegOrdCDep.GenerProfOCompra;
var
  NumOC    : string;
  xSQL, ConCom : String;
begin
  xSQL := 'CIAID=' + QuotedStr(dblcCIA.Text)+' AND CCOMERID='+QuotedStr(dblcFPago.Text);
  if DMLOG.displaydescrip('prvSQL','CXC101','CREDITO',xSQL,'CREDITO') = 'S' then
    ConCom := '1'
  else
    ConCom := '2';
  NumOC  := DMLOG.cdsOrdComp.fieldbyname('ODCID').AsString;

  xSQL := 'INSERT INTO LOG312 ('+
          '  CIAID, PROFID, PROV, FPAGOID, TMONID, PROFFEMI, PROFTEN, PROFVALID, PROFTCAMB,'+
          '  PROFIXFLE, PROFIXTCC, PROFIXTD, PROFIXTI, PROFEST, PROFOBS, PROFUSER,'+
          '  PROFFREG, PROFHREG, PROFANO, PROFMM, PROFDD, PROFTRI, PROFSEM, PROFSS, PROFANOMM,'   +
          '  PROFAATRI, PROFAASEM, PROFAASS, PROFTOTALG, PROFTIMP, PROFTTIMPU,' +
          '  PROFEVAL, PROFISC, FAUTOGEN, PROFGENER, TIPOADQ,'   +
          '  ODCID, PROFCONCOM) '+
          ' SELECT CIAID, '+QuotedStr('OC'+NumOC)+', PROV, CCOMERID, TMONID, '+DMLOG.wRepFecServi+' ,ODCTEN,'   +
          '  ODCVALID, ODCTCAMB, ODCIXFLE, ODCIXTCC,'   +
          '  ODCIXTD, ODCIXTI, ''ACEPTADO'', '+
          '  '+	QuotedStr('GENERADO POR EL SISTEMA DESDE LA ORDEN DE COMPRA '+NumOC)+', '+
          '  ODCUSER, ODCFREG, ODCHREG, ODCANO, ODCMM, ODCDD,'+
          '  ODCTRI, ODCSEM, ODCSS, ODCANOMM, ODCAATRI, ODCAASEM, ODCAASS,'+
          '  ODCTOTALG, ODCTIMP, ODCTTIMPU, ''A'', ODCTOTALISC, ''S'', ''O/COMPRA'', TIPOADQ,'+
          '  '''+NumOC+''', CCOMERID '+
          ' FROM LOG304'+
          ' WHERE ODCID = '''+NumOC+'''';
  DMLOG.DCOM1.AppServer.EjecutaSQL(xsql);

  if (SRV_D = 'DB2NT') or
		 (SRV_D = 'DB2400') then
  begin
   xSQL := 'INSERT INTO LOG313('  +
           '   CIAID, PROFID, ARTID, UNMIDG, UNMIDU, DPROFLAGUM, DPROFID, DPROFCNTG,'  +
           '   DPROFCNTU, DPROFPUNG, DPROFPUNU, DPROFDSCTO, DPROFIMP,'  +
           '   DPROFIMPU, DPROFEVAL, DPROFISC, ODCID, TIPOADQ, DPROFOBS, DPROFCONCOM,'+
           '   DPROFFREG, DPROFTEN, DPROFVALID, DPROFPRVD, DPROFPROV)'+
           ' SELECT CIAID, '+QuotedStr('OC'+NumOC)+', ARTID,'  +
					 ' CASE WHEN DODCCNT> 0 THEN UNMID ELSE NULL END UNMIDG,'  +
					 ' CASE WHEN DODCCNT> 0 THEN NULL ELSE UNMID END UNMIDU,'  +
					 ' CASE WHEN DODCCNT> 0 THEN ''G'' ELSE NULL END FLAGUM,'  +
           ' DODCID,'  +
					 ' CASE WHEN DODCCNT> 0 THEN  DODCCNT ELSE NULL END,'  +
					 ' CASE WHEN DODCCNT> 0 THEN  NULL ELSE DODCCNT END,'  +
					 ' CASE WHEN DODCCNT> 0 THEN  DODCPUN ELSE NULL END,'  +
					 ' CASE WHEN DODCCNT> 0 THEN  NULL ELSE DODCPUN END,'  +
           ' DODCDSCTO, DODCIMP, DODCIMPU, ''A'', DODCISCU, ODCID, TIPOADQ, DODCOBS, '''+ConCom+''', '+
           ' '+DMLOG.wRepFuncDate+quotedstr(FormatDateTime(DMLOG.wFormatFecha,dbdtpFReg.Date))+'), '+dbseEnt.Text+', '+dbsbVal.Text+', '''+edtProv.Text+''', '''+dblcdProv.Text+''' '+
           ' FROM LOG305 ' +
           ' WHERE ODCID = ''' + NumOC + ''' ';
  end
  else
	if SRV_D = 'ORACLE' then
  begin
   xSQL := 'INSERT INTO LOG313('  +
           '   CIAID, PROFID, ARTID, UNMIDG, UNMIDU, DPROFLAGUM, DPROFID, DPROFCNTG,'  +
           '   DPROFCNTU, DPROFPUNG, DPROFPUNU, DPROFDSCTO, DPROFIMP,'  +
           '   DPROFIMPU, DPROFEVAL, DPROFISC, ODCID, TIPOADQ, DPROFOBS, DPROFCONCOM,'+
           '   DPROFFREG, DPROFTEN, DPROFVALID, DPROFPRVD, DPROFPROV)'+
           ' SELECT CIAID, '+QuotedStr('OC'+NumOC)+', ARTID,'  +

           ' DECODE(DODCCNTU, NULL, UNMID, NULL) UNMIDG, '+
           ' DECODE(DODCCNTU, NULL, NULL, UNMID) UNMIDU, '+
           ' DECODE(DODCCNTU, NULL, ''G'', NULL) FLAGUM, '+
           ' DODCID, '+
           ' DECODE(DODCCNTU, NULL, DODCCNT, NULL), '+
           ' DECODE(DODCCNTU, NULL, NULL, DODCCNT), '+
           ' DECODE(DODCCNTU, NULL, DODCPUN, NULL), '+
           ' DECODE(DODCCNTU, NULL, NULL, DODCPUN), '+

           ' DODCDSCTO, DODCIMP, DODCIMPU, ''A'', DODCISCU, ODCID, TIPOADQ, DODCOBS, '''+ConCom+''', '+
           //' '+DMLOG.wRepFuncDate+FormatDateTime(+''''+DMLOG.wFormatFecha,dbdtpFReg.Date)+'''), '+dbseEnt.Text+', '+dbsbVal.Text+', '''+edtProv.Text+''', '''+dblcdProv.Text+''' '+
           ' '+DMLOG.wRepFuncDate+quotedstr(FormatDateTime(DMLOG.wFormatFecha,dbdtpFReg.Date))+'), '+dbseEnt.Text+', '+dbsbVal.Text+', '''+edtProv.Text+''', '''+dblcdProv.Text+''' '+
           //ssql := ssql + ',RQPARTFREG ='+DMLOG.wRepFuncDate+quotedstr(xfecha)+')';
           ' FROM LOG305 ' +
           ' WHERE ODCID = ''' + NumOC + ''' ';
  end;
  //xSQL:=xSQL;
  //xSQL:=xSQL;
  DMLOG.DCOM1.AppServer.EjecutaSQL(xsql);
end;

procedure TFRegOrdCDep.ppDetailBand3BeforePrint(Sender: TObject);
begin
  xVan := xVan + 1;
  If (pprOCP.Page > 1) and (xVan = 1) then
  begin
    ppLabel7.Caption := 'VIENEN...';
    ppLabel7.Visible := true;
    ppDBText37.Top := ppLabel7.Top + ppLabel7.Height;
    ppDBMemo1.Top  := ppLabel7.Top + ppLabel7.Height;
    ppvLin.Top     := ppLabel7.Top + ppLabel7.Height;
    ppDBText39.Top := ppLabel7.Top + ppLabel7.Height;
    ppDBText40.Top := ppLabel7.Top + ppLabel7.Height;
    ppDBText41.Top := ppLabel7.Top + ppLabel7.Height;
    ppDBText42.Top := ppLabel7.Top + ppLabel7.Height;
    ppDBText43.Top := ppLabel7.Top + ppLabel7.Height;
  end
  else
  begin
    ppLabel7.Visible := False;
    ppDBText37.Top := 0;
    ppDBMemo1.Top  := 0;
    ppvLin.Top     := 0;
    ppDBText39.Top := 0;
    ppDBText40.Top := 0;
    ppDBText41.Top := 0;
    ppDBText42.Top := 0;
    ppDBText43.Top := 0;
  end;
  If ppDetailBand3.PrintCount = xvan then
  begin
    ppLabel9.Top := ppDBMemo1.Top + ppDBMemo1.Height;
    ppLabel9.Visible := True;
  end
  else
    ppLabel9.Visible := False;
end;

procedure TFRegOrdCDep.pprOCPStartPage(Sender: TObject);
begin
  xVan := 0;
end;

procedure TFRegOrdCDep.ppDetailBand4BeforePrint(Sender: TObject);
begin
  xVan := xVan + 1;
  If (pprOCPE.Page > 1) and (xVan = 1) then
   begin
    ppLabel11.Caption := 'VIENEN...';
    ppLabel11.Visible := true;
    ppDBText60.Top := ppLabel11.Top + ppLabel11.Height;
    ppDBMemo2.Top  := ppLabel11.Top + ppLabel11.Height;
    ppDBText62.Top := ppLabel11.Top + ppLabel11.Height;
    ppDBText63.Top := ppLabel11.Top + ppLabel11.Height;
    ppDBText64.Top := ppLabel11.Top + ppLabel11.Height;
    ppDBText65.Top := ppLabel11.Top + ppLabel11.Height;
    ppDBText66.Top := ppLabel11.Top + ppLabel11.Height;
   end
  else
   begin
    ppLabel11.Visible := False;
    ppDBText60.Top := 0;
    ppDBMemo2.Top  := 0;
    ppDBText62.Top := 0;
    ppDBText63.Top := 0;
    ppDBText64.Top := 0;
    ppDBText65.Top := 0;
    ppDBText66.Top := 0;
   end;
  If ppDetailBand4.PrintCount = xvan then
  begin
    ppLabel10.Top := ppDBMemo2.Top + ppDBMemo2.Height;
    ppLabel10.Visible := True;
  end
  else
    ppLabel10.Visible := False;
end;

//**********************************************************************//
// pjsv - para presupuestos
// 08/10/20000 pjsv. para actualizar el monto comprometido
// en el PPRES301,
procedure TFRegOrdCDep.CalculoNivel;
var
  xmonto,xhora,xfecha,xCompMN,xCompME,xmes,ssql : string;
  xcambio : Double;
  iX : integer;
  // xtotal[1] hasta xtotal[12] = EJMN01..EJMN12 --sumatoria por mes
  //  xtotal[13] hasta xtotal[24] = EJME01..EJME12 --sumatoria por mes
  //  xtotal[25] hasta xtotal[36] = VMMN01..VMME12 --sumatoria por mes
  //  xtotal[37] hasta xtotal[48] = VMME01..VMME12 --sumatoria por mes
  xtotal : Array[1..48] of Double;
  // xtotg[1] = xtotal[1] hasta xtotal[12]
  // xtotg[2] = xtotal[13] hasta xtotal[24]
  // xtotg[3] = xtotal[23] hasta xtotal[36]
  // xtotg[4] = xtotal[37] hasta xtotal[48]
  xtotG : Array[1..6] of Double;
  // guarda los montos asignados del PPRES300
  xmcxmes : Array[1..24] of Double;
	xIS : string;
begin
 if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
   // crea los niveles superiores si no tuviera
   CreaSuperior;
   DMLOG.cdsSql.First;
    while not DMLOG.cdsSQL.eof do
     begin
      // registros que tienen las pp
           xmes := xPeriodo; //copy(meAnoMM.Text,5,2);
           ssql := '';
           ssql := 'Update PPRES301 Set ';
           if dblcTMoneda.Text = DMLOG.wTMonLoc then
             begin
               xCambio := StrToFloat(DMLOG.cdsSql.fieldbyname('TOT').AsString)/ StrToFloat(dbeTCambio.text);
               xCompME := '('+DMLOG.wReplacCeros+'(DPREMCME'+xmes+',0) - '+FloatToStr(xcambio)+')';
               xCompMN := '('+DMLOG.wReplacCeros+'(DPREMCMN'+xmes+',0) - '+DMLOG.cdsSQL.fieldbyname('TOT').AsString+')';
               xmonto :=  DMLOG.cdsSql.fieldbyname('TOT').AsString;
             end
           else
            begin
               xCambio := StrToFloat(DMLOG.cdsSql.fieldbyname('TOT').AsString)* StrToFloat(dbeTCambio.text);
               xCompME := '('+DMLOG.wReplacCeros+'(DPREMCME'+xmes+',0) - '+DMLOG.cdsSql.fieldbyname('TOT').AsString+')';
               xCompMN := '('+DMLOG.wReplacCeros+'(DPREMCMN'+xmes+',0) - '+FloatToStr(xcambio)+')';
               xmonto := DMLOG.cdsSQL.fieldbyname('TOT').AsString;
            end;
           ssql := ssql + 'DPREMCMN'+xmes+'= DEC('+xCompMN+',15,2), ';
           ssql := ssql + 'DPREMCME'+xmes+'= DEC('+xCompME+',15,2), ';
           if dblcTMoneda.Text = DMLOG.wTMonLoc then
            begin
             ssql := ssql + 'DPRETOMCMN=DEC('+DMLOG.wReplacCeros+'(DPREMCMN01,0)+'+DMLOG.wReplacCeros+'(DPREMCMN02,0)+'+DMLOG.wReplacCeros+'(DPREMCMN03,0)+'+DMLOG.wReplacCeros+'(DPREMCMN04,0)+'+DMLOG.wReplacCeros+'(DPREMCMN05,0)+'+DMLOG.wReplacCeros+'(DPREMCMN06,0)+'+
                                           ''+DMLOG.wReplacCeros+'(DPREMCMN07,0)+'+DMLOG.wReplacCeros+'(DPREMCMN08,0)+'+DMLOG.wReplacCeros+'(DPREMCMN09,0)+'+DMLOG.wReplacCeros+'(DPREMCMN10,0)+'+DMLOG.wReplacCeros+'(DPREMCMN11,0)+'+DMLOG.wReplacCeros+'(DPREMCMN12,0)-'+
                                           xmonto+',15,2),';
             ssql := ssql +'DPRETOMCME=DEC('+DMLOG.wReplacCeros+'(DPREMCME01,0)+'+DMLOG.wReplacCeros+'(DPREMCME02,0)+'+DMLOG.wReplacCeros+'(DPREMCME03,0)+'+DMLOG.wReplacCeros+'(DPREMCME04,0)+'+DMLOG.wReplacCeros+'(DPREMCME05,0)+'+DMLOG.wReplacCeros+'(DPREMCME06,0)+'+
                                          ''+DMLOG.wReplacCeros+'(DPREMCME07,0)+'+DMLOG.wReplacCeros+'(DPREMCME08,0)+'+DMLOG.wReplacCeros+'(DPREMCME09,0)+'+DMLOG.wReplacCeros+'(DPREMCME10,0)+'+DMLOG.wReplacCeros+'(DPREMCME11,0)+'+DMLOG.wReplacCeros+'(DPREMCME12,0)-'+
                                           FloatToStr(xcambio)+',15,2),';
            end
           else
            begin
             ssql := ssql + 'DPRETOMCME=DEC('+DMLOG.wReplacCeros+'(DPREMCME01,0)+'+DMLOG.wReplacCeros+'(DPREMCME02,0)+'+DMLOG.wReplacCeros+'(DPREMCME03,0)+'+DMLOG.wReplacCeros+'(DPREMCME04,0)+'+DMLOG.wReplacCeros+'(DPREMCME05,0)+'+DMLOG.wReplacCeros+'(DPREMCME06,0)+'+
                                           ''+DMLOG.wReplacCeros+'(DPREMCME07,0)+'+DMLOG.wReplacCeros+'(DPREMCME08,0)+'+DMLOG.wReplacCeros+'(DPREMCME09,0)+'+DMLOG.wReplacCeros+'(DPREMCME10,0)+'+DMLOG.wReplacCeros+'(DPREMCME11,0)+'+DMLOG.wReplacCeros+'(DPREMCME12,0)-'+
                                           xmonto+',15,2),';
             ssql := ssql +'DPRETOMCMN=DEC('+DMLOG.wReplacCeros+'(DPREMCMN01,0)+'+DMLOG.wReplacCeros+'(DPREMCMN02,0)+'+DMLOG.wReplacCeros+'(DPREMCMN03,0)+'+DMLOG.wReplacCeros+'(DPREMCMN04,0)+'+DMLOG.wReplacCeros+'(DPREMCMN05,0)+'+DMLOG.wReplacCeros+'(DPREMCMN06,0)+'+
                                          ''+DMLOG.wReplacCeros+'(DPREMCMN07,0)+'+DMLOG.wReplacCeros+'(DPREMCMN08,0)+'+DMLOG.wReplacCeros+'(DPREMCMN09,0)+'+DMLOG.wReplacCeros+'(DPREMCMN10,0)+'+DMLOG.wReplacCeros+'(DPREMCMN11,0)+'+DMLOG.wReplacCeros+'(DPREMCMN12,0)-'+
                                           FloatToStr(xcambio)+',15,2),';
            end;
           ssql := ssql + 'RQPARTUSER='+ quotedstr(DMLOG.wUsuario);
           xFecha := formatdatetime(DMLOG.wFormatFecha,Date);

           ssql := ssql + ',RQPARTFREG ='+quotedstr(xfecha);
           xhora := formatdatetime('hh:nn:ss',now);
           ssql := ssql + ',RQPARTHREG =time('+quotedstr(xhora)+')'+
                          ' WHERE CIAID='+quotedstr(DMLOG.cdsSql.fieldbyname('CIAID').AsString)+
                          ' AND CCOSID='+quotedstr(DMLOG.cdsSql.fieldbyname('CCOSID').AsString)+
                          ' AND TIPPRESID='+quotedstr(DMLOG.cdsSql.fieldbyname('TIPPRESID').AsString)+
                          ' AND PARPRESID='+quotedstr(DMLOG.cdsSql.fieldbyname('PARPRESID').AsString)+
                          ' AND RQPARTANO='+quotedstr(FloatToStr(xYear));
           DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);

           // se inicia la actualización de la cabecera
           // inicializo en cero el arreglo
           For iX := 1 to 48 do xTotal[iX]  :=0;
           For iX := 1 to 6  do xTotg[iX]   :=0;
           For iX := 1 to 24 do xmcxmes[iX] :=0;

           // actualiza la cabecera de Presupuesto PPRES300, toma del PPRES301
           //  los MC por mes para un mismo centro de costo y los sumariza
           // para cargarlos a los campos respectivos del PPRES300
           ssql := '';
           ssql := 'SELECT * FROM PPRES301'+
                   ' WHERE CIAID='+quotedstr(DMLOG.cdsSql.fieldbyname('CIAID').AsString)+
                   ' AND CCOSID='+quotedstr(DMLOG.cdsSql.fieldbyname('CCOSID').AsString)+
                   ' AND RQPARTANO='+quotedstr(FloatToSTr(xYear));
           DMLOG.cdsQry.Close;
           DMLOG.cdsQry.ProviderName:= 'prvTGE';
           DMLOG.cdsQry.DataRequest(ssql);
           DMLOG.cdsQry.open;
           DMLOG.cdsQry.First;
           // recorro la tabla PPRES301 para hallar los totales por mes y
           //  por campos( MC ) y por mes
           while not DMLOG.cdsQry.Eof do
            begin
             //** 03/11/2000 - pjsv
             ssql := '';
             ssql := 'PARPRESID='+quotedstr(DMLOG.cdsQry.fieldbyname('PARPRESID').AsString);
             xIS :=  DMLOG.BuscaQry('dspPlaParPre','PPRES201','*',ssql,'PARPRES_IS');
             //**
             For iX := 1 to 24 do
              case iX of
               // para DPREMCMN01..12
               1,2,3,4,5,6,7,8,9,10,11,12 :
                  begin
                    xmes := DMLOG.StrZero(IntToStr(iX),2);
                    //** 03/11/2000 - pjsv, tiene que chequear si el PARPRES_IS
                    // del PPRES201 es I = resta,  o S = suma
                    if xIS = 'S' then
                     xTotal[iX] := xTotal[iX] + StrToFloat(DMLOG.cdsQry.fieldbyname('DPREMCMN'+xmes).AsString)
                    else
                     xTotal[iX] := xTotal[iX] - StrToFloat(DMLOG.cdsQry.fieldbyname('DPREMCMN'+xmes).AsString)
                  end;
               // para DPREMCME01..12
               13,14,15,16,17,18,19,20,21,22,23,24 :
                  begin
                    xmes := DMLOG.StrZero(IntToStr(iX-12),2);
                    //** 03/11/2000 - pjsv, tiene que chequear si el PARPRES_IS
                    // del PPRES201 es I = resta,  o S = suma
                    if xIS = 'S' then
                     xTotal[iX] := xTotal[iX] + StrToFloat(DMLOG.cdsQry.fieldbyname('DPREMCME'+xmes).AsString)
                    else
                     xTotal[iX] := xTotal[iX] - StrToFloat(DMLOG.cdsQry.fieldbyname('DPREMCME'+xmes).AsString)
                  end;
              end;
             DMLOG.cdsQry.next;
            end;

           ssql := '';
           ssql := 'Update PPRES300 Set ';
           For iX := 1 to 12 do
            begin
             xmes := DMLOG.StrZero(IntToStr(iX),2);
             // carga para cada mes y campo el valor hallado en las lineas de
             //  arriba
             ssql := ssql + ' DPREMCMN'+xmes+'='+FloatToStrF(xtotal[iX],ffFixed,15,2)+',';
             ssql := ssql + ' DPREMCME'+xmes+'='+FloatToStrF(xtotal[iX+12],ffFixed,15,2)+',';
            end;
           // SUMATORIA DE LOS MCMN, LOS DOCE MESES
           For iX := 1 to 12 do
             xtotG[1] := xtotG[1] + xtotal[iX];
           // SUMATORIA DE LOS MCME, LOS DOCE MESES
           For iX := 13 to 24 do
             xtotG[2] := xtotG[2] + xtotal[iX];

           // asigno los totales para MC en MN y ME
           ssql := ssql + ' DPRETOMCMN='+FloatToStrF(xtotg[1],ffFixed,15,2)+',';
           ssql := ssql + ' DPRETOMCME='+FloatToStrF(xtotg[2],ffFixed,15,2)+',';
           // otros campos a actualizar
           ssql := ssql + 'RQPARTUSER='+ quotedstr(DMLOG.wUsuario);
           xFecha := formatdatetime(DMLOG.wFormatFecha,Date);
           ssql := ssql + ',RQPARTFREG ='+DMLOG.wRepFuncDate+quotedstr(xfecha)+')';
           xhora := formatdatetime('hh:nn:ss',now);
           ssql := ssql + ',RQPARTHREG =time('+quotedstr(xhora)+')'+
           // condicional
                          ' WHERE CIAID='+quotedstr(DMLOG.cdsSql.fieldbyname('CIAID').AsString)+
                          ' AND CCOSID='+quotedstr(DMLOG.cdsSql.fieldbyname('CCOSID').AsString)+
                          ' AND RQPARTANO='+quotedstr(FloatToStr(xYear));
           DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
//        end;
       DMLOG.cdsSql.Next;
     end;
   // ahora para los niveles superiores
  end
 else ///////////////////////////////////////// ORACLE ////////////////////////
	if SRV_D = 'ORACLE' then
  begin
  CreaSuperior;
   DMLOG.cdsSql.First;
    while not DMLOG.cdsSql.eof do
     begin
      // registros que tienen las pp
           xmes := xPeriodo; //xtmes; //copy(meAnoMM.Text,5,2);
           ssql := '';
           ssql := 'Update PPRES301 Set ';
           if dblcTMoneda.Text = DMLOG.wTMonLoc then
             begin
               xCambio := StrToFloat(DMLOG.cdsSql.fieldbyname('TOT').AsString)/ StrToFloat(dbeTCambio.text);
               xCompME := '('+DMLOG.wReplacCeros+'(DPREMcME'+xmes+',0) - '+FloatToStr(xcambio)+')';
               xCompMN := '('+DMLOG.wReplacCeros+'(DPREMCMN'+xmes+',0) - '+DMLOG.cdsSQl.fieldbyname('TOT').AsString+')';
               xmonto :=  DMLOG.cdsSql.fieldbyname('TOT').AsString;
             end
           else
            begin
               xCambio := StrToFloat(DMLOG.cdsSql.fieldbyname('TOT').AsString)* StrToFloat(dbeTCambio.text);
               xCompME := '('+DMLOG.wReplacCeros+'(DPREMCME'+xmes+',0) - '+DMLOG.cdsSQL.fieldbyname('TOT').AsString+')';
               xCompMN := '('+DMLOG.wReplacCeros+'(DPREMCMN'+xmes+',0) - '+FloatToStr(xcambio)+')';
               xmonto := DMLOG.cdsSQL.fieldbyname('TOT').AsString;
            end;
           ssql := ssql + 'DPREMCMN'+xmes+'= TRUNC('+xCompMN+',2), ';
           ssql := ssql + 'DPREMCME'+xmes+'= TRUNC('+xCompME+',2), ';
           if dblcTMoneda.Text = DMLOG.wTMonLoc then
            begin
             ssql := ssql + 'DPRETOMCMN=TRUNC(NVL(DPREMCMN01,0)+NVL(DPREMCMN02,0)+NVL(DPREMCMN03,0)+NVL(DPREMCMN04,0)+NVL(DPREMCMN05,0)+NVL(DPREMCMN06,0)+'+
                                             'NVL(DPREMCMN07,0)+NVL(DPREMCMN08,0)+NVL(DPREMCMN09,0)+NVL(DPREMCMN10,0)+NVL(DPREMCMN11,0)+NVL(DPREMCMN12,0)-'+
                                           xmonto+',2),';
             ssql := ssql +'DPRETOMCME=TRUNC(NVL(DPREMCME01,0)+NVL(DPREMCME02,0)+NVL(DPREMCME03,0)+NVL(DPREMCME04,0)+NVL(DPREMCME05,0)+NVL(DPREMCME06,0)+'+
                                            'NVL(DPREMCME07,0)+NVL(DPREMCME08,0)+NVL(DPREMCME09,0)+NVL(DPREMCME10,0)+NVL(DPREMCME11,0)+NVL(DPREMCME12,0)-'+
                                             FloatToStr(xcambio)+',2),';
            end
           else
            begin
             ssql := ssql + 'DPRETOMCME=TRUNC(NVL(DPREMCME01,0)+NVL(DPREMCME02,0)+NVL(DPREMCME03,0)+NVL(DPREMCME04,0)+NVL(DPREMCME05,0)+NVL(DPREMCME06,0)+'+
                                             'NVL(DPREMCME07,0)+NVL(DPREMCME08,0)+NVL(DPREMCME09,0)+NVL(DPREMCME10,0)+NVL(DPREMCME11,0)+NVL(DPREMCME12,0)-'+
                                            xmonto+',2),';
             ssql := ssql + 'DPRETOMCMN=TRUNC(NVL(DPREMCMN01,0)+NVL(DPREMCMN02,0)+NVL(DPREMCMN03,0)+NVL(DPREMCMN04,0)+NVL(DPREMCMN05,0)+NVL(DPREMCMN06,0)+'+
                                             'NVL(DPREMCMN07,0)+NVL(DPREMCMN08,0)+NVL(DPREMCMN09,0)+NVL(DPREMCMN10,0)+NVL(DPREMCMN11,0)+NVL(DPREMCMN12,0)-'+
                                            FloatToStr(xcambio)+',2),';
            end;
           ssql := ssql + 'RQPARTUSER='+ quotedstr(DMLOG.wUsuario);
           xFecha := formatdatetime(DMLOG.wFormatFecha,Date);
           ssql := ssql + ',RQPARTFREG ='+DMLOG.wRepFuncDate+quotedstr(xfecha)+')';
           xhora := formatdatetime('hh:nn:ss',now);
           ssql := ssql + ',RQPARTHREG =time('+quotedstr(xhora)+')'+
                          ' WHERE CIAID='+quotedstr(DMLOG.cdsSql.fieldbyname('CIAID').AsString)+
                          ' AND CCOSID='+quotedstr(DMLOG.cdsSql.fieldbyname('CCOSID').AsString)+
                          ' AND TIPPRESID='+quotedstr(DMLOG.cdsSql.fieldbyname('TIPPRESID').AsString)+
                          ' AND PARPRESID='+quotedstr(DMLOG.cdsSql.fieldbyname('PARPRESID').AsString)+
                          ' AND RQPARTANO='+quotedstr(FloatToStr(xYear));
           DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);

           // se inicia la actualización de la cabecera
           // inicializo en cero el arreglo
           For iX := 1 to 48 do xTotal[iX]  :=0;
           For iX := 1 to 6  do xTotg[iX]   :=0;
           For iX := 1 to 24 do xmcxmes[iX] :=0;

           // actualiza la cabecera de Presupuesto PPRES300, toma del PPRES301
           //  los EJ,VM y VP por mes para un mismo centro de costo y los sumariza
           //  para cargarlos a los campos respectivos del PPRES300
           ssql := '';
           ssql := 'SELECT * FROM PPRES301'+
                   ' WHERE CIAID='+quotedstr(DMLOG.cdsSQL.fieldbyname('CIAID').AsString)+
                   ' AND CCOSID='+quotedstr(DMLOG.cdsSQL.fieldbyname('CCOSID').AsString)+
                   ' AND RQPARTANO='+quotedstr(FloatToStr(xYear));
           DMLOG.cdsQry.Close;
           DMLOG.cdsQry.ProviderName:= 'dspCxP';
           DMLOG.cdsQry.DataRequest(ssql);
           DMLOG.cdsQry.open;
           DMLOG.cdsQry.First;
           // recorro la tabla PPRES301 para hallar los totales por mes y
           //  por campos( MC ) y por mes
           while not DMLOG.cdsQry.Eof do
            begin
             //** 03/11/2000 - pjsv
             ssql := '';
             ssql := 'PARPRESID='+quotedstr(DMLOG.cdsQry.fieldbyname('PARPRESID').AsString);
             xIS := DMLOG.BuscaQRY('dspPlaParPre','PPRES201','*',ssql,'PARPRES_IS');
             //**
             For iX := 1 to 24 do
              case iX of
                // para DPREEJMN01..12
               1,2,3,4,5,6,7,8,9,10,11,12 :
                  begin
                    xmes := DMLOG.StrZero(IntToStr(iX),2);
                    //** 03/11/2000 - pjsv, tiene que chequear si el PARPRES_IS
                    // del PPRES201 es I = resta,  o S = suma
                    if xIS = 'S' then
                     xTotal[iX] := xTotal[iX] + StrToFloat(DMLOG.cdsQry.fieldbyname('DPREMcMN'+xmes).AsString)
                    else
                     xTotal[iX] := xTotal[iX] - StrToFloat(DMLOG.cdsQry.fieldbyname('DPREMCMN'+xmes).AsString)
                  end;
               // para DPREEJME01..12
               13,14,15,16,17,18,19,20,21,22,23,24 :
                  begin
                    xmes := DMLOG.StrZero(IntToStr(iX-12),2);
                    //** 03/11/2000 - pjsv, tiene que chequear si el PARPRES_IS
                    // del PPRES201 es I = resta,  o S = suma
                    if xIS = 'S' then
                     xTotal[iX] := xTotal[iX] + StrToFloat(DMLOG.cdsQry.fieldbyname('DPREMCME'+xmes).AsString)
                    else
                     xTotal[iX] := xTotal[iX] - StrToFloat(DMLOG.cdsQry.fieldbyname('DPREMCME'+xmes).AsString)
                  end;
              end;
             DMLOG.cdsQry.next;
            end;

           ssql := '';
           ssql := 'Update PPRES300 Set ';
           For iX := 1 to 12 do
            begin
             xmes := DMLOG.StrZero(IntToStr(iX),2);
             // carga para cada mes y campo el valor hallado en las lineas de
             //  arriba
             ssql := ssql + ' DPREMCMN'+xmes+'=TRUNC('+FloatToStr(xtotal[iX]) +',2),';
             ssql := ssql + ' DPREMCME'+xmes+'=TRUNC('+FloatToStr(xtotal[iX+12]) +',2),';
            end;
           // SUMATORIA DE LOS MCMN, LOS DOCE MESES
           For iX := 1 to 12 do
             xtotG[1] := xtotG[1] + xtotal[iX];
           // SUMATORIA DE LOS MCME, LOS DOCE MESES
           For iX := 13 to 24 do
             xtotG[2] := xtotG[2] + xtotal[iX];

           // asigno los totales para EJ,VM y VP en MN y ME
           ssql := ssql + ' DPRETOMCMN=TRUNC('+FloatToStr(xtotg[1]) +',2),';
           ssql := ssql + ' DPRETOMCME=TRUNC('+FloatToStr(xtotg[2]) +',2),';

           // otros campos a actualizar
           ssql := ssql + 'RQPARTUSER='+ quotedstr(DMLOG.wUsuario);
           xFecha := formatdatetime(DMLOG.wFormatFecha,Date);
           ssql := ssql + ',RQPARTFREG ='+DMLOG.wRepFuncDate+quotedstr(xfecha)+')';
           xhora := formatdatetime('hh:nn:ss',now);
           ssql := ssql + ',RQPARTHREG =time('+quotedstr(xhora)+')'+
           // condicional
                          ' WHERE CIAID='+quotedstr(DMLOG.cdsSql.fieldbyname('CIAID').AsString)+
                          ' AND CCOSID='+quotedstr(DMLOG.cdsSql.fieldbyname('CCOSID').AsString)+
                          ' AND RQPARTANO='+quotedstr(FloatToStr(xYear));
           DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
       DMLOG.cdsSql.Next;
     end;
  end;
   // ahora para los niveles speriores
//   CalculoNivelSupe;
end;

// pjsv - para presupuestos
procedure TFRegOrdCDep.CreaSuperior;
var
  xppcomun,ssql,xcc : string;
  xmaxdigitosup,xmaxnivelsup,xmaxnivelinf : string;
  xpp,xmaxdigitoint,xmaxnivelint,xmaxdigitoinf : string;
  xcontador : Integer;
  xcia,xccosid,xtippresid,xano : string;
begin
   // tabla de niveles
   ssql :='';
   ssql := 'SELECT * FROM PPRES103 ORDER BY PARPRESNIV';
   DMLOG.cdsNivelPresu.close;
   DMLOG.cdsNivelPresu.DataRequest(ssql);
   DMLOG.cdsNivelPresu.Open;
   // se recorre el client del detalle, por lo que en este se encuentran
   //  las P.P. a actualizar
   DMLOG.cdsSql.First;
   while not DMLOG.cdsSql.eof do
    begin
//     if (DMLOG.cdsDetCxPTIPDET.Value='MG') or (DMLOG.cdsDetCxPTIPDET.Value='NG')
//         or (DMLOG.cdsDetCxPTIPDET.Value='MN') then
//      begin
        if xcc <> DMLOG.cdsSql.fieldbyname('CCOSID').AsString then
         begin
          // tabla de detalle del presupuesto
          ssql := '';
          ssql := 'SELECT * FROM PPRES301'+
                 ' WHERE CIAID='+quotedstr(DMLOG.cdsSql.fieldbyname('CIAID').AsString)+
                 ' AND CCOSID='+quotedstr(DMLOG.cdsSql.fieldbyname('CCOSID').AsString)+
                 ' AND RQPARTANO='+quotedstr(FloatToStr(xYear));
          DMLOG.cdsDetPre.Close;
          DMLOG.cdsDetPre.DataRequest(ssql);
          DMLOG.cdsDetPre.open;
          xcc := DMLOG.cdsSql.fieldbyname('CCOSID').AsString;
         end;
          ssql := '';
          ssql := 'SELECT * FROM PPRES201';
          DMLOG.cdsParPre.Close;
          DMLOG.cdsParPre.DataRequest(ssql);
          DMLOG.cdsParPre.open;
          // se toma 01 por defecto para el nivel máximo superior
          xmaxnivelsup:='01';
          DMLOG.cdsNivelPresu.First;
          // se jala el máximo digito superior
          xmaxdigitosup := DMLOG.cdsNivelPresu.fieldbyname('DIGITOS').AsString;
          // se carga a partir de la P.P. digitada el digito en común
          //  ejmp. si se digito 10101 --> el digito comuún es 1
          //        si se digito 20501 --> el digito común es 2
          xppcomun := copy(DMLOG.cdsSql.fieldbyname('PARPRESID').AsString,1,StrToInt(xmaxdigitosup));
          DMLOG.cdsNivelPresu.Last;
          // jalo el máximo nivel inferior de la tabla de niveles
          xmaxnivelinf := DMLOG.cdsNivelPresu.fieldbyname('PARPRESNIV').AsString;
          // se jala el máximo digito inferior
          xmaxdigitoinf := DMLOG.cdsNivelPresu.fieldbyname('DIGITOS').AsString;
         // este proceso se repite hasta que la variable xmaxnivelint se iguale
          //  a la xmaxnivelsup. Esto me permite generar los niveles superiores
          //  que cuyo primer digito sea igual a la variable xppcomun
          xcontador := 0;
          repeat
           // ejemp. si el xmaxnivelinf = 03 ==>  xmaxnivelint = 02.
           xmaxnivelint := DMLOG.StrZero(IntToStr(StrToInt(xmaxnivelinf)-xcontador),2);
           xcontador := 1;
           ssql := '';
           ssql := 'PARPRESNIV='+quotedstr(xmaxnivelint);
           xcia := Trim(dblcCia.Text);
           xccosid := Trim(DMLOG.cdsSql.fieldbyname('CCOSID').AsString);
           xtippresid := Trim(DMLOG.cdsSql.fieldbyname('TIPPRESID').AsString);
           xano := Trim(xtano);
           xmaxdigitoint := DMLOG.buscaQRY('dspNivelPresu','PPRES103','*',ssql,'DIGITOS');
           xpp := Trim(copy(DMLOG.cdsSql.fieldbyname('PARPRESID').AsString,1,StrToInt(xmaxdigitoint)));
           if DMLOG.cdsParPre.Locate ('PARPRESID',VarArrayOf([xpp]) ,[loCaseInsensitive]) then
            if not DMLOG.cdsDetPre.Locate ('CIAID;CCOSID;TIPPRESID;PARPRESID;RQPARTANO',VarArrayOf([xcia,xccosid,xtippresid,xpp,xano]) ,[loCaseInsensitive]) then
              DMLOG.cdsDetPre.insert;
           if DMLOG.cdsDetPre.State = dsInsert then
            begin
               DMLOG.cdsDetPre.fieldbyname('CIAID').AsString := dblcCia.Text;
               DMLOG.cdsDetPre.fieldbyname('CCOSID').AsString := DMLOG.cdsSql.fieldbyname('CCOSID').AsString;
               DMLOG.cdsDetPre.fieldbyname('TIPPRESID').AsString := DMLOG.cdsSql.fieldbyname('TIPPRESID').AsString;
               DMLOG.cdsDetPre.fieldbyname('RQPARTANO').AsString :=  FloatToStr(xYear);
               DMLOG.cdsDetPre.FieldByName('PARPRESID').AsString  := DMLOG.cdsParPre.fieldbyname('PARPRESID').AsString;
               DMLOG.cdsDetPre.FieldByName('PARPREDES').AsString  := DMLOG.cdsParPre.fieldbyname('PARPRESDES').AsString;
               DMLOG.cdsDetPre.FieldByName('TMONID').AsString     := dblcTMoneda.Text;
               DMLOG.cdsDetPre.FieldByName('RQPARTUSER').AsString := DMLOG.wusuario;
               DMLOG.cdsDetPre.FieldByName('RQPARTFREG').AsString := DateToStr(Date());
               DMLOG.cdsDetPre.FieldByName('RQPARTHREG').AsString := TimeToStr(now);
               DMLOG.cdsDetPre.FieldByName('RQPARTIS').AsString   := DMLOG.cdsParPre.fieldbyname('PARPRES_IS').AsString;
               DMLOG.cdsDetPre.FieldByName('PARPRESNIV').AsString   := DMLOG.cdsParPre.fieldbyname('PARPRESNIV').AsString;
               // inicializo en cero todos los montos
               inicializoCero(DMLOG.cdsDetPre);
               DMLOG.cdsDetPre.Post;
               DMLOG.cdsDetPre.ApplyUpdates(0);
            end;
            xmaxnivelinf := xmaxnivelint;
          until xmaxnivelsup = xmaxnivelint;
//      end;
     DMLOG.cdsSql.Next;
    end;
end;

procedure TFRegOrdCDep.inicializoCero(xcds: TwwClientDataSet);
var
 iX : integer;
 xmes : string;
begin
    // inicializo los demás campos en cero
    for iX := 1 to 12 do
     begin
      xmes := DMLOG.StrZero(IntToStr(iX),2);
      xcds.FieldByName('DPRERQMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPRERQME'+xmes).AsString   := '0';
      xcds.FieldByName('DPRERMME'+xmes).AsString   := '0';
      xcds.FieldByName('DPRERMMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPREASMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPREASME'+xmes).AsString   := '0';
      xcds.FieldByName('DPREMOMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPREMOME'+xmes).AsString   := '0';
      xcds.FieldByName('DPREEJMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPREEJME'+xmes).AsString   := '0';
      xcds.FieldByName('DPREVMMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPREVMME'+xmes).AsString   := '0';
      xcds.FieldByName('DPREVPMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPREVPME'+xmes).AsString   := '0';
      xcds.FieldByName('DPREMCMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPREMCME'+xmes).AsString   := '0';
      xcds.FieldByName('DPRECAMN'+xmes).AsString   := '0';
      xcds.FieldByName('DPRECAME'+xmes).AsString   := '0';
     end;
    xcds.FieldByName('DPRETORQMN').AsString   := '0';
    xcds.FieldByName('DPRETORQME').AsString   := '0';
    xcds.FieldByName('DPRETORMMN').AsString   := '0';
    xcds.FieldByName('DPRETORMME').AsString   := '0';
    xcds.FieldByName('DPRETOASMN').AsString   := '0';
    xcds.FieldByName('DPRETOASME').AsString   := '0';
    xcds.FieldByName('DPRETOMOMN').AsString   := '0';
    xcds.FieldByName('DPRETOMOME').AsString   := '0';
    xcds.FieldByName('DPRETOEJMN').AsString   := '0';
    xcds.FieldByName('DPRETOEJME').AsString   := '0';
    xcds.FieldByName('DPRETOVMMN').AsString   := '0';
    xcds.FieldByName('DPRETOVMME').AsString   := '0';
    xcds.FieldByName('DPRETOVPMN').AsString   := '0';
    xcds.FieldByName('DPRETOVPME').AsString   := '0';
    xcds.FieldByName('DPRETOMCMN').AsString   := '0';
    xcds.FieldByName('DPRETOMCME').AsString   := '0';
    xcds.FieldByName('DPRETOCAMN').AsString   := '0';
    xcds.FieldByName('DPRETOCAME').AsString   := '0';
end;

procedure TFRegOrdCDep.dbgDepuraCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
	if DMLOG.cdsDOrdComp.FieldByName('DODCCSLD').AsFloat = 0 then
	begin
		AFont.Style := [fsBold];
		AFont.Color  := clBlue;
		//ABrush.Color := clInfoBk;
		ABrush.Color := $00C4E6E3;
	end;
end;

procedure TFRegOrdCDep.Z2bbtnPrintDepuradasClick(Sender: TObject);
begin
	Screen.Cursor:=crHourGlass;
	ppReportOC;
	ppDBCab.DataSource := DMLOG.dsQry;
	//ppdbOC.DataSource  := DMLOG.dsSQL;
	ppdbOCDep.DataSource:= DMLOG.dsSQL;
	Screen.Cursor:=crDefault;
	pprOCDep.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\OrdCompDep.rtm';
	pprOCDep.Template.LoadFromFile;
	pprOCDep.Print;
	pprOCDep.Stop;
	ppDBCab.DataSource := Nil;
	ppdbOCDep.DataSource := Nil;
end;

procedure TFRegOrdCDep.pprOCDepPreviewFormCreate(Sender: TObject);
begin
	pprOCDep.PreviewForm.ClientHeight := 500;
	pprOCDep.PreviewForm.ClientWidth := 650;
	tppviewer(pprOCDep.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFRegOrdCDep.pprOCPEBeforePrint(Sender: TObject);
var
	sSQL, sConta : String;
begin
	sConta:='';
	sSQL:='SELECT DISTINCT RQSID FROM LOG324 WHERE ODCID='''+DMLOG.cdsOrdComp.fieldbyName('ODCID').asString+''' AND CIAID='''+dblcCIA.Text+''' AND DODCCNT>0 ORDER BY RQSID';
	DMLOG.cdsLOG.Close;
	DMLOG.cdsLOG.DataRequest(sSQL);
	DMLOG.cdsLOG.Open;
	DMLOG.cdsLOG.First;
	while not DMLOG.cdsLOG.Eof do
	begin
		sConta:=sConta+DMLOG.cdsLOG.FieldByName('RQSID').AsString+', ';
		DMLOG.cdsLOG.Next;
	end;
	ppLabel8.Text:=sConta;
end;

procedure TFRegOrdCDep.pprOCPEStartPage(Sender: TObject);
begin
	xVan := 0;
end;

procedure TFRegOrdCDep.dbgDepuraDblClick(Sender: TObject);
begin
	if DMLOG.cdsDOrdComp.RecordCount = 0 then
	begin
		ErrorMsg('Adquisiciones', ' No Existen Registros a Editar ');
		Exit;
	end;
	try
		Screen.Cursor:=crHourGlass;
		OnOffDetalle(False);
		dbeItem.Text    := DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString;
		dbcldArti.Text  := DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString;

		dblcUMed.Text     := DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString;
		dbeCnt.Text       := Format('%0.3f', [DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsCurrency]  );
		dbePUnit.Text     := Format('%0.4f', [DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsCurrency]  );
		dbeValVen.Text    := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsCurrency]  ); //Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsCurrency*DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsCurrency]  );
		dbeDscto.Text     := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsCurrency]);
		dbeImporte.Text   := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsCurrency + (DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsCurrency*DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsCurrency/100 )] );

		dbeImpInd.Text    := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsCurrency] );
		dbeISC.Text       := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsCurrency] );
		edtAdq.Text       := DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').AsString;
		memDetalle.Text   := DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString;

		//Datos del Panel de DetalleA//
		dblcUMed.onExit(sender);
		pnlDetalleA.Visible := True;
		pnlDetallea.BringToFront;
		memDetalle.SetFocus;
		iEstado:=1;
		dbgDepura.Enabled:=false;
		btnDetalle;
		xCant:=dbeCnt.Text;
	finally
		dbgDepura.Enabled:=False;
		Screen.Cursor:=crDefault;
	end;
end;

procedure TFRegOrdCDep.ppHeaderBand4BeforePrint(Sender: TObject);
begin
  //
end;

Initialization
	registerclasses([TLabel]);
End.


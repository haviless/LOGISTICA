unit LOG230;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,
  wwdbdatetimepicker, DBCtrls, db, wwSpeedButton, wwDBNavigator, Grids,
  Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, Wwdbspin, Wwdotdot, Wwdbcomb,
  GridControl, ComCtrls, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe, ppViewr, ppBands, ppVar, ppStrtch, ppMemo,
  ppCtrls, ppPrnabl, ppEndUsr, Variants, ppTypes, MsgDlgs;

type
  TFRegSolProfAut = class(TForm)
    pnlCabecera: TPanel;
    dblcCIA: TwwDBLookupCombo;
    lblCIA: TLabel;
    Z2bbtnOK: TBitBtn;
    Z2bbtnBorrar: TBitBtn;
    dbeNumSol: TwwDBEdit;
    lblNSolCot: TLabel;
    lblLEntrega: TLabel;
    dbeLEntrega: TwwDBEdit;
    dbmObs: TDBMemo;
    lblObs: TLabel;
    pnlDetalleG: TPanel;
	 stxTitulo1: TStaticText;
    dbeCIA: TwwDBEdit;
    pnlDetalleA: TPanel;
    Z2bbtnRegOk: TBitBtn;
    Z2bbtnRegCanc: TBitBtn;
    stxTitulo2: TStaticText;
    dbeItem: TwwDBEdit;
    dbeCntS: TwwDBEdit;
    lblItem: TLabel;
    lblCntS: TLabel;
    pnlEstado: TPanel;
    Label4: TLabel;
    bvlDetalle: TBevel;
    Z2bbtnRegresa: TBitBtn;
    Z2bbtnCanc2: TBitBtn;
    Z2bbtnGraba: TBitBtn;
    Z2bbtnAcepta: TBitBtn;
    Z2bbtnAnula: TBitBtn;
    Z2bbtnNuevo: TBitBtn;
    dblcComprador: TwwDBLookupCombo;
    dbeComprador: TwwDBEdit;
    lblComprador: TLabel;
    lblTMon: TLabel;
    dblcTMoneda: TwwDBLookupCombo;
    dbeTMoneda: TwwDBEdit;
    dblcLEntrega: TwwDBLookupCombo;
    dblcTSolCot: TwwDBLookupCombo;
    dbeTSolCot: TwwDBEdit;
    Label2: TLabel;
    dbdtpFSolicitud: TwwDBDateTimePicker;
    Label3: TLabel;
    lblPrioridad: TLabel;
    dblcFPago: TwwDBLookupCombo;
    dbeFPago: TwwDBEdit;
    lblFPago: TLabel;
    btxtEstado: TDBText;
    dblcPRIO: TwwDBLookupCombo;
    dbePRIO: TwwDBEdit;
    dbcbFLAG: TwwDBComboBox;
    dblcUNMID: TwwDBLookupCombo;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dblcTipSol: TwwDBLookupCombo;
    dbeTipSol: TwwDBEdit;
    pnlDetalleB: TPanel;
    Bevel3: TBevel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Z2bbtnRegserOk: TBitBtn;
	 Z2bbtnRegSerCanc: TBitBtn;
    StaticText1: TStaticText;
    dbeItemSer: TwwDBEdit;
    dbeCntSSer: TwwDBEdit;
    dbcbFLAGSer: TwwDBComboBox;
    dblcUNMIDSer: TwwDBLookupCombo;
    pnlDetalleC: TPanel;
    Bevel4: TBevel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Z2bbtnRegActOk: TBitBtn;
    Z2bbtnRegActCanc: TBitBtn;
    StaticText2: TStaticText;
    dbeItemAct: TwwDBEdit;
    dbeCntSAct: TwwDBEdit;
    dbcbFLAGAct: TwwDBComboBox;
    dblcUNMIDAct: TwwDBLookupCombo;
    dbcldArti: TwwDBLookupComboDlg;
    DBMemo1Act: TMemo;
    DBMemo1Ser: TMemo;
    Label9: TLabel;
    edtUNMIDSer: TEdit;
    edtUNMIDAct: TEdit;
    edtUNMID: TEdit;
    edtSer: TEdit;
    edtActFij: TEdit;
    dbeArti: TMemo;
    pgcControl: TPageControl;
    tbsArt: TTabSheet;
    tbsProv: TTabSheet;
    dbgDReqs: TwwDBGrid;
    Z2dbgDReqsIButton: TwwIButton;
    dbgProfProv: TwwDBGrid;
    dblcdProv: TwwDBLookupComboDlg;
    edtProv: TEdit;
    lblProv: TLabel;
    Z2bbtnAcepProv: TBitBtn;
    pnlDatCabProf: TPanel;
    Z2bbtnActpProvOk: TBitBtn;
    Z2bbtnActpProvCa: TBitBtn;
    pnlDatDetProf: TPanel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dbgDProf: TwwDBGrid;
    pnlPrecioArt: TPanel;
    lblImporte: TLabel;
    Z2bbtnActProfOk: TBitBtn;
    Z2bbtnCanProf: TBitBtn;
    StaticText3: TStaticText;
    dbeItemProf: TwwDBEdit;
    dbcldArtiProf: TwwDBLookupComboDlg;
    dbeCntG: TwwDBEdit;
    dbePUnitG: TwwDBEdit;
    dbeDscto: TwwDBEdit;
    dbeImporte: TwwDBEdit;
    dbeImpInd: TwwDBEdit;
    dbcbFLAGProf: TwwDBComboBox;
    dblcUNMIDProf: TwwDBLookupCombo;
    dbeISC: TwwDBEdit;
    edtUMedDes: TEdit;
    dbeArtiProf: TMemo;
    pnlPrecioSer: TPanel;
    lblimporte1: TLabel;
    lblCant: TLabel;
    Z2bbtnRegOk1: TBitBtn;
    Z2bbtnRegCanc1: TBitBtn;
    dbeItem1: TwwDBEdit;
    dbePUnitG1: TwwDBEdit;
    dbeDscto1: TwwDBEdit;
    dbeImporte1: TwwDBEdit;
    dbeImpInd1: TwwDBEdit;
    dbcbFLAG1: TwwDBComboBox;
    dblcUNMID1: TwwDBLookupCombo;
    dbeISC1: TwwDBEdit;
    stxTitulo3: TStaticText;
    edtUMedDes1: TEdit;
    edtCant: TEdit;
    edtActSer: TEdit;
    DBMemo1: TMemo;
    lblNItem: TLabel;
    lblArtProf: TLabel;
    lblTUM: TLabel;
    lblUMedida: TLabel;
    lblCantProf: TLabel;
    lblPreUnit: TLabel;
    lbklDscto: TLabel;
    lblIGV: TLabel;
    lblISC: TLabel;
    tblMarco1: TBevel;
    lblDescrArt: TLabel;
    dbseGarantia: TwwDBSpinEdit;
    Memo1: TMemo;
    rgdTipoGrt: TRadioGroup;
    dbeFlete: TEdit;
    pnlValores: TPanel;
    dbgValores: TwwDBGrid;
    StaticText4: TStaticText;
    pnlBtns: TPanel;
    Z2bbtnPrint: TBitBtn;
    BitBtn3: TBitBtn;
    Z2bbtnSalir: TBitBtn;
    BitBtn4: TBitBtn;
    Z2bbtnVisEvaProf: TBitBtn;
    ppData: TppDBPipeline;
    ppReporte: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDBText43: TppDBText;
    ppLabel52: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppShape1: TppShape;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppLabel78: TppLabel;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText59: TppDBText;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel33: TppLabel;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel39: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBMemo6: TppDBMemo;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBMemo4: TppDBMemo;
    ppDBText24: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine17: TppLine;
    ppDBText44: TppDBText;
    ppLine18: TppLine;
    ppLabel71: TppLabel;
    ppDBText45: TppDBText;
    ppLine19: TppLine;
    ppLabel72: TppLabel;
    ppLine20: TppLine;
    ppLabel73: TppLabel;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppLine21: TppLine;
    ppLabel74: TppLabel;
    ppDBText48: TppDBText;
    ppLine22: TppLine;
    ppLabel75: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel70: TppLabel;
    ppDBMemo7: TppDBMemo;
    ppLine4: TppLine;
    Z2bbtnPrintCuadro: TBitBtn;
    ppDiseno: TppDesigner;
    Label1: TLabel;
    dblcFPagoD: TwwDBLookupCombo;
    dbeFPagoD: TwwDBEdit;
    dblcTMonedaD: TwwDBLookupCombo;
    Label14: TLabel;
    dbeTMonedaD: TwwDBEdit;
    lblFEntre: TLabel;
    dbdtpFEntrega: TwwDBDateTimePicker;
    dbeValor: TwwDBEdit;
    dbdtpFAtt: TwwDBDateTimePicker;
    dbdtpFechaEntrega: TwwDBDateTimePicker;
	 procedure Z2bbtnOKClick(Sender: TObject);
    procedure Z2bbtnBorrarClick(Sender: TObject);
    procedure Z2bbtnRegresaClick(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure Z2bbtnCanc2Click(Sender: TObject);
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure Z2bbtnAnulaClick(Sender: TObject);
    procedure Z2dbgDReqsIButtonClick(Sender: TObject);
    procedure Z2bbtnRegOkClick(Sender: TObject);
    procedure Z2bbtnRegCancClick(Sender: TObject);
    procedure Z2bbtnNuevoClick(Sender: TObject);
		procedure dbgDReqsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
		procedure dbgDReqsDblClick(Sender: TObject);
		procedure dbmObsKeyPress(Sender: TObject; var Key: Char);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
{31/07/2000
		procedure dblcUMedChange(Sender: TObject);}
		procedure dblcExist(Sender: TObject);
		procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
		procedure dblcTipSolExit(Sender: TObject);
		procedure dblcTipSolNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure Z2bbtnRegActCancClick(Sender: TObject);
		procedure Z2bbtnRegSerCancClick(Sender: TObject);
		procedure dblcUNMIDActExit(Sender: TObject);
		procedure dblcUNMIDSerExit(Sender: TObject);
		procedure dblcUNMIDExit(Sender: TObject);
		procedure dbcldArtiExit(Sender: TObject);
		procedure FormKeyPress(Sender: TObject; var Key: Char);
		procedure dbcbFLAGExit(Sender: TObject);
    procedure dblcdProvExit(Sender: TObject);
    procedure Z2bbtnAcepProvClick(Sender: TObject);
    procedure Z2bbtnActpProvOkClick(Sender: TObject);
    procedure Z2bbtnActpProvCaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dbgProfProvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgDProfDblClick(Sender: TObject);
    procedure Z2bbtnCanProfClick(Sender: TObject);
    procedure dbcldArtiProfExit(Sender: TObject);
    procedure dblcUNMIDProfExit(Sender: TObject);
    procedure dbePUnitGExit(Sender: TObject);
    procedure Z2bbtnActProfOkClick(Sender: TObject);
    procedure dbeFleteKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure Z2bbtnSalirClick(Sender: TObject);
    procedure Z2bbtnVisEvaProfClick(Sender: TObject);
    procedure Z2bbtnPrintCuadroClick(Sender: TObject);
    procedure ppReportePreviewFormCreate(Sender: TObject);
    procedure dbgValoresCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbeValorEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeNumSolExit(Sender: TObject);
	private
		{ Private declarations }
		iEstado : Integer;
		procedure  AsigDat;
		procedure dcCIA;
		procedure OnOffDetalle ( Value : Boolean );
		procedure OnOffCabecera( Value : Boolean );
		procedure btnDetalle;
    //procedure lblEstado;
    //procedure cSetFocus ( Sender: TObject ; const sMsg : String);
		function Artpend : Integer;
		function Serpend : Integer;
		function EHandlerError(Ex : Exception ) : Boolean;
    procedure GenerProfAuto;
		procedure CalTotal(Sender : TObject);
      procedure AsignaValoresNoEditables;
      Function  wPreUni : integer;              
	public
		{ Public declarations }
		bExit : Boolean;
		//vunmid : String;
	end;

var
	FRegSolProfAut: TFRegSolProfAut;
	sSQL, vflag, vUMActSer, wSQL : String;
	wIGV, NumAnoSol, NumAnoPro, SQLFiltro : String;
	Punt : TBookmark;

implementation

uses LOGDM1, LOG202, LOG204, oaAD3000, LOG217;

{$R *.DFM}

procedure TFRegSolProfAut.Z2bbtnOKClick(Sender: TObject);
var
	xSQL : String;
begin
	Screen.Cursor:=crHourGlass;
	DMLOG.cdsDSCxDRQS.Open;
	Screen.Cursor:=crDefault;
	if DMLOG.cdsSolCot.State in [dsInsert,dsEdit] then
	try
		Screen.Cursor:=crHourGlass;
		AsigDat; // asignar los datos predeterminados
		if Length(trim(dbmObs.Text)) = 0 then
			DMLOG.cdsSolCot.fieldbyname('SCCOBS').AsString := '.';
		dbeNumSol.OnExit(sender);
		DMLOG.cdsSolCot.Post;
		if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
		begin
			SQLFiltro := 'SELECT * FROM  LOG302 WHERE '
								 +   ' CIAID  ='''+ dblcCIA.Text  +''' and '
								 +   ' SCCID='''+ dbeNumSol.Text+''' ' ;
			DMLOG.cdsSolCot.DataRequest( SQLFiltro ) ;
		end;

		//DMLOG.ControlTran;
		DMLOG.ControlTran( 9, DMLOG.cdsSolCot,'SOLCOT');

		xSQL:='SELECT * FROM LOG303 '+
					'WHERE CIAID='+QuotedStr(dblcCIA.Text)+' '+
					'AND SCCID='+QuotedStr(dbeNumSol.Text)+' '+
					'ORDER BY DSCCID';

		DMLOG.cdsDSolCot.Close;
		DMLOG.cdsDSolCot.DataRequest(xSQL);
		DMLOG.cdsDSolCot.Open;

		Screen.Cursor:=crDefault;
  except
  	on E: Exception do
    	if not EHandlerError( E ) then raise;
  end;
  Screen.Cursor:=crHourGlass;
  OnOffCabecera(False); //Desactivar el panel de Cabecera
  OnOffDetalle(True);   //Activar el panel de detalle

  if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then
  begin
    if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
    begin
      xSQL:= 'SELECT A.CIAID, A.TIPOADQ, B.UNMIDG, B.ARTID, B.RQSMARK, C.ARTDES, E.UNMABR, B.RQSFLAGUM, '+
        'SUM(B.DRQSCNSG) AS RXACNTSG, '+
        'SUM(B.DRQSCNSU) AS RXACNTSU, '+
        'SUM(B.DRQSCNAG) AS RXACNTAG, '+
        'SUM(B.DRQSCNAU) AS RXACNTAU, '+
        'SUM(COALESCE(B.DRQSCNSG,0)-COALESCE(B.DRQSCNAG,0)) AS RXASALDOG, SUM(COALESCE(B.DRQSCNSU,0)-COALESCE(B.DRQSCNAU,0)) AS RXASALDOU '+
        'FROM LOG308 A '+
        'LEFT JOIN LOG309 B ON (A.CIAID = B.CIAID AND A.RQSID=B.RQSID AND A.LOCID = B.LOCID) '+
        'LEFT JOIN TGE205 C ON (B.CIAID = C.CIAID AND B.ARTID = C.ARTID) '+
        'LEFT JOIN TGE203 D ON (A.CCOSID = D.CCOSID) '+
        'LEFT JOIN TGE130 E ON (B.UNMIDG = E.UNMID) '+
        'WHERE ((A.RQSEST=''ACEPTADO'') OR (A.RQSEST=''PARCIAL'')) '+
        'AND ((B.RQSEST=''ACEPTADO'') OR (B.RQSEST=''PARCIAL'')) '+
        'AND NOT RQSVISADOR IS NULL '+
        'AND A.CIAID='''+dblcCIA.Text+''' '+
        'AND A.TIPOADQ=''C'' '+
        'AND ((COALESCE(B.DRQSCNSG,0)-COALESCE(B.DRQSCNAG,0))>0 OR (COALESCE(B.DRQSCNSU,0)-COALESCE(B.DRQSCNAU,0))>0) '+
        'GROUP BY  A.CIAID, A.TIPOADQ, B.ARTID, B.UNMIDG, C.ARTDES, B.RQSMARK, B.RQSFLAGUM, E.UNMABR '+
        'ORDER BY  B.ARTID, A.CIAID , B.UNMIDG, C.ARTDES, B.RQSMARK';
    end
    else
    if SRV_D = 'ORACLE' then
    begin
      xSQL:= 'SELECT A.CIAID, A.TIPOADQ, B.UNMIDG, B.ARTID, B.RQSMARK, C.ARTDES, E.UNMABR, B.RQSFLAGUM, '+
        'SUM(B.DRQSCNSG) AS RXACNTSG, SUM(B.DRQSCNSU) AS RXACNTSU, SUM(B.DRQSCNAG) AS RXACNTAG, '+
        'SUM(B.DRQSCNAU) AS RXACNTAU, SUM(NVL(B.DRQSCNSG,0)-NVL(B.DRQSCNAG,0)) AS RXASALDOG, '+
        'SUM(NVL(B.DRQSCNSU,0)-NVL(B.DRQSCNAU,0)) AS RXASALDOU '+
        'FROM LOG309 B, LOG308 A, TGE205 C, TGE203 D, TGE130 E '+
        'WHERE B.CIAID=A.CIAID AND B.LOCID=A.LOCID AND B.RQSID=A.RQSID '+
        'AND ((A.RQSEST=''ACEPTADO'') OR (A.RQSEST=''PARCIAL'')) '+
        'AND ((B.RQSEST=''ACEPTADO'') OR (B.RQSEST=''PARCIAL'')) '+
        'AND A.RQSVISADOR IS NOT NULL '+
        'AND A.TIPOADQ=''C'' '+
        'AND A.CIAID='''+dblcCIA.Text+''' '+
        'AND B.CIAID=C.CIAID '+
        'AND B.TINID=C.TINID '+
        'AND B.ARTID=C.ARTID '+
        'AND A.CCOSID=D.CCOSID '+
        'AND B.UNMIDG=E.UNMID '+
        'AND ((NVL(B.DRQSCNSG,0)-NVL(B.DRQSCNAG,0))>0 OR (NVL(B.DRQSCNSU,0)-NVL(B.DRQSCNAU,0))>0) '+
        'GROUP BY  A.CIAID, A.TIPOADQ, B.ARTID, B.UNMIDG, C.ARTDES, B.RQSMARK, B.RQSFLAGUM, E.UNMABR '+
        'ORDER BY  B.ARTID, A.CIAID , B.UNMIDG, C.ARTDES, B.RQSMARK';

      {xSQL:=    'SELECT A.CIAID, A.TIPOADQ, B.UNMIDG, B.ARTID, B.RQSMARK, C.ARTDES, E.UNMABR, B.RQSFLAGUM, ';
      xSQL:=xSQL+'SUM(B.DRQSCNSG) AS RXACNTSG, ';
      xSQL:=xSQL+'SUM(B.DRQSCNSU) AS RXACNTSU, ';
      xSQL:=xSQL+'SUM(B.DRQSCNAG) AS RXACNTAG, ';
      xSQL:=xSQL+'SUM(B.DRQSCNAU) AS RXACNTAU, ';
      xSQL:=xSQL+' SUM(NVL(B.DRQSCNSG,0)-NVL(B.DRQSCNAG,0)) AS RXASALDOG, SUM(NVL(B.DRQSCNSU,0)-NVL(B.DRQSCNAU,0)) AS RXASALDOU ';
      xSQL:=xSQL+'FROM LOG308 A, LOG309 B, TGE205 C, TGE203 D, TGE130 E ';
      xSQL:=xSQL+'WHERE ((A.RQSEST=''ACEPTADO'') OR (A.RQSEST=''PARCIAL'')) ';
      xSQL:=xSQL+'AND NOT RQSVISADOR IS NULL ';
      xSQL:=xSQL+'AND A.TIPOADQ=''C'' ';
      xSQL:=xSQL+'AND A.CIAID=B.CIAID AND A.RQSID=B.RQSID(+) ';
      xSQL:=xSQL+'AND B.CIAID = C.CIAID AND B.ARTID = C.ARTID(+) ';
      xSQL:=xSQL+'AND A.CCOSID = D.CCOSID(+) ';
      xSQL:=xSQL+'AND B.UNMIDG = E.UNMID(+) ';
      xSQL:=xSQL+'GROUP BY  A.CIAID, A.TIPOADQ, B.ARTID, B.UNMIDG, C.ARTDES, B.RQSMARK, B.RQSFLAGUM, E.UNMABR ';
      xSQL:=xSQL+'ORDER BY  B.ARTID, A.CIAID , B.UNMIDG, C.ARTDES, B.RQSMARK';}
    end;
    DMLOG.cdsArtPend.Close;
    DMLOG.cdsArtPend.DataRequest(xSQL);
    DMLOG.cdsArtPend.Open;

  end;

  xSQL:='SELECT * FROM LOG312 '+
        'WHERE CIAID='+QuotedStr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString)+' '+
        'AND SCCID='+QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString);
  DMLOG.cdsPadre.Close;
  DMLOG.cdsPadre.DataRequest(xSQL);

	dbgProfProv.Selected.Clear;
	dbgProfProv.Selected.Add('PROFID'+#9+'9'+#9+'Proforma');
	dbgProfProv.Selected.Add('PROV'+#9+'10'+#9+'Id~Proveedor');
	dbgProfProv.Selected.Add('PROVDES'+#9'60'+#9+'Nombre~Proveedor');
	//dbgProfProv.Selected.Add('EVALU'+#9'18'+#9+'Evaluación');
	//dbgProfProv.Selected.Add('TOTAL'+#9+'7'+#9+'Total');
  dbgProfProv.RefreshDisplay;

  DMLOG.cdsPadre.Open;

  btnDetalle;
  pnlDetalleG.SetFocus;
  Screen.Cursor:=crDefault;
  if DMLOG.wModo = 'A' then
  	Z2dbgDReqsIButton.Click;
end;

procedure TFRegSolProfAut.Z2bbtnBorrarClick(Sender: TObject);
begin
  DMLOG.cdsSolCot.CancelUpdates;
  if DMLOG.wModo='A' then
	begin
		DMLOG.cdsSolCot.Insert;
		//FormCreate(nil);
		OnOffCabecera(True); //Desactivar el panel de Cabecera
	end;
end;

procedure TFRegSolProfAut.AsigDat;
var
	D, M, Y : Word;
	sFecha, sSQL : String;	
begin
	if DMLOG.cdsSolCot.State in [dsInsert, dsEdit] then
	begin
		DecodeDate(dbdtpFSolicitud.Date, Y, M, D);

		if Length(trim(dbmObs.text)) = 0 then
			DMLOG.cdsSolCot.fieldbyname('SCCOBS').AsString := '.';

		Screen.Cursor:=crDefault;

		if Length(dblcCia.Text)=0     then raise Exception.Create('Falta Registrar Compañía...');
		if Length(dbeNumSol.Text)=0   then raise Exception.Create('Falta Registrar Solicitud...');
		if Length(dblcTipSol.Text)=0  then raise Exception.Create('Falta Registrar Tipo de Solicitud...');
		if dbdtpFSolicitud.Date=0     then raise Exception.Create('Falta Registrar Fecha Solicitud...');
		if Length(dblcPRIO.Text)=0    then raise Exception.Create('Falta Registrar Prioridad...');
		if Length(dblcTSolCot.Text)=0 then raise Exception.Create('Falta Registrar Tipo Solicitud...');
		if Length(dblcComprador.Text)=0 then raise Exception.Create('Falta Registrar Comprador...');
		if Length(dblcTMoneda.Text)=0  then raise Exception.Create('Falta Registrar Tipo Moneda...');
		if Length(dblcLEntrega.Text)=0 then raise Exception.Create('Falta Registrar Lugar de Entrega...');
		if Length(dblcFPago.Text)=0    then raise Exception.Create('Falta Registrar Condición Comercial...');
		//if dbdtpFLimite.Date=0      then raise Exception.Create('Falta Registrar Fecha Limite...');
		if dbdtpFEntrega.Date=0     then raise Exception.Create('Falta Registrar Fecha Entrega...');
		Screen.Cursor:=crHourGlass;

		if DMLOG.cdsSolCot.State in [dsInsert] then
		begin
			DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString 	:= 'INICIAL';
			DMLOG.cdsSolCot.FieldbyName('SCCUSER').AsString := DMLOG.wUsuario;

			sFecha := formatdatetime(DMLOG.wFormatFecha, dbdtpFSolicitud.Date);
			sSQL := 'SELECT * FROM TGE114 WHERE FECHA='+quotedstr(sFecha);
			DMLOG.FiltraCDS(DMLOG.cdsPeriodo, sSQL);
			DMLOG.cdsSolCot.FieldbyName('SCCANO').AsString    := IntToStr(Y);
			DMLOG.cdsSolCot.FieldbyName('SCCMM').AsString     := DMLOG.strzero(IntToStr(M),2);
			DMLOG.cdsSolCot.FieldbyName('SCCDD').AsString     := DMLOG.strzero(IntToStr(D),2);
			DMLOG.cdsSolCot.FieldbyName('SCCTRI').AsString    := DMLOG.cdsPeriodo.fieldbyName('FECTRIM').asString;
			DMLOG.cdsSolCot.FieldbyName('SCCSEM').AsString    := DMLOG.cdsPeriodo.fieldbyName('FECSEM').asString;
			DMLOG.cdsSolCot.FieldbyName('SCCANOMM').AsString  := IntToStr(Y)+DMLOG.strzero(IntToStr(M),2);
			DMLOG.cdsSolCot.FieldbyName('SCCSS').AsString     := DMLOG.cdsPeriodo.fieldbyName('FECSS').asString;
			DMLOG.cdsSolCot.FieldbyName('SCCAATRI').AsString  := DMLOG.cdsPeriodo.fieldbyName('FECAATRI').asString;
			DMLOG.cdsSolCot.FieldbyName('SCCAASEM').AsString  := DMLOG.cdsPeriodo.fieldbyName('FECAASEM').asString;
			DMLOG.cdsSolCot.FieldbyName('SCCAASS').AsString   := DMLOG.cdsPeriodo.fieldbyName('FECAASS').asString;

      DMLOG.cdsSolCot.FieldbyName('SCCFREG').AsDateTime := Date;
      DMLOG.cdsSolCot.FieldbyName('SCCHREG').AsDateTime := Date+SysUtils.Time;
    end;
  end;
end;

procedure TFRegSolProfAut.Z2bbtnRegresaClick(Sender: TObject);
begin
  DMLOG.cdsSolCot.Edit;
  DMLOG.wModo := 'M';
  OnOffCabecera(True);
  OnOffDetalle(False);
end;

procedure TFRegSolProfAut.Z2bbtnGrabaClick(Sender: TObject);
var
	xSQL, sSQL : String;
begin
	try
		Screen.Cursor:=crHourGlass;
		//DMLOG.ControlTran;

		if SRV_D <> 'DB2400' then
    begin
			Errorcount:=0;
			DMLOG.DCOM1.AppServer.IniciaTransaccion;
    end;

		DMLOG.ControlTran( 0, DMLOG.cdsDSolCot,'DSOLCOT');

		xSQL := 'SELECT * FROM LOG310 WHERE LOG310.SCCID='+ QuotedStr(dbeNumSol.text);
		DMLOG.cdsDSCxDRQS.Close;
		DMLOG.cdsDSCxDRQS.ProviderName:='prvDSCxDRQS';
		DMLOG.cdsDSCxDRQS.DataRequest(xSQL);
		DMLOG.cdsDSCxDRQS.Open;
		DMLOG.cdsDSCxDRQS.First;
		while not DMLOG.cdsDSCxDRQS.eof do
		begin
			sSQl :='UPDATE LOG309 SET SCCID='+''''+dbeNumSol.Text+''' '+
						 'WHERE CIAID='+QuotedStr(DMLOG.cdsDSCxDRQS.fieldbyname('CIAID').AsString)+' '+
						 'AND RQSID='+QuotedStr(DMLOG.cdsDSCxDRQS.fieldbyname('RQSID').AsString)+' '+
						 'AND ARTID='+QuotedStr(DMLOG.cdsDSCxDRQS.fieldbyname('ARTID').AsString);
			try
				DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
			Except
				DMLOG.ControlTran( 1, nil, '' );
			end;
		 DMLOG.cdsDSCxDRQS.Next;
		end;

		DMLOG.ControlTran( 8, nil, '' );		// Fin del StartTra..

		xSQL := 'SELECT * FROM LOG310';
		DMLOG.cdsDSCxDRQS.Close;
		DMLOG.cdsDSCxDRQS.ProviderName:='prvDSCxDRQS';
		DMLOG.cdsDSCxDRQS.DataRequest(xSQL);
		DMLOG.cdsDSCxDRQS.Open;
		btnDetalle;
	finally
		Screen.Cursor:=crDefault;
	end;
end;

procedure TFRegSolProfAut.Z2bbtnCanc2Click(Sender: TObject);
var
	sSQL : String;
begin
	if not Question('Adquisiciones',  'Desea Cancelar la Solicitud de Cotizacón '+#13+#13
														+#13+'Desea Continuar ') then
	begin
		Exit;
	end;
	if DMLOG.wModo='A' then
  begin
		sSQL:='DELETE FROM LOG302 WHERE SCCID='''+dbeNumSol.Text+'''';
    DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
		sSQL:='DELETE FROM LOG303 WHERE SCCID='''+dbeNumSol.Text+'''';
    DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
  	wModo := '';
    Z2bbtnNuevo.Click;
  end;
  DMLOG.cdsDSolCot.CancelUpdates;
  OnOffCabecera(True);
  OnOffDetalle(False);
end;

procedure TFRegSolProfAut.Z2bbtnAceptaClick(Sender: TObject);
var
	sSQL, CCOID, CCODE, CCOTE, CCOPT : String;
begin
  if (trim(DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString) = 'INICIAL') and
     (DMLOG.cdsDSolCot.RecordCount>0)  then // inicial...
	begin
     if wPreUni > 0 then
     	ShowMessage(' Al menos uno de los Campos de Precio Unitario esta en Blanco '+#13+#13+'Verifique !!! ');

		if not Question('Adquisiciones',  'Este Proceso: '+ #13+#13 +
															'Aceptará la Solicitud de Cotización '+#13+#13
															+#13+'Desea Continuar ') then
		begin
			Exit;
		end;
		try
    	Screen.Cursor:=crHourGlass;
    	if DMLOG.cdsSolCot.State in [dsBrowse] then
    	begin
      	DMLOG.cdsSolCot.Edit;
       	DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString := 'ACEPTADO';
       	DMLOG.cdsSolCot.Post;
				//DMLOG.ControlTran;
				DMLOG.ControlTran( 9, DMLOG.cdsSolCot,'SOLCOT');
  			//cdsSolCot.ApplyUpdates(0);
//------------------------------------------------------------------------------
				DMLOG.DisplayDescrip('prvSQL','LOG101','*','FLAG=''D''','CCOCODID');
				CCOID:=DMLOG.cdsqry.fieldbyname('CCOCODID').AsString;
				CCODE:=DMLOG.cdsqry.fieldbyname('CCODESC').AsString;
				CCOTE:=DMLOG.cdsqry.fieldbyname('CCOTEND').AsString;
				CCOPT:=DMLOG.cdsqry.fieldbyname('CCOPTOS').AsString;

        DMLOG.cdsPadre.First;
        while not DMLOG.cdsPadre.Eof do
        begin
          if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
          begin
            sSQL:='INSERT INTO LOG326 '+
                  'SELECT '''+DMLOG.cdsPadre.FieldByName('CIAID').AsString+''', '''+DMLOG.cdsPadre.FieldByName('SCCID').AsString+''', '''+DMLOG.cdsPadre.FieldByName('PROFID').AsString+''', ''01'', '+
                  ''''+CCOID+''', '''+CCODE+''', ARTID, '''+CCOTE+''', '+CCOPT+', DPROFIMP, 0, SUBSTR(DPROFOBS,1,30), TINID '+
                  'FROM LOG313 '+
                  'WHERE ARTID NOT IN (SELECT ARTID '+
                                      'FROM LOG326 '+
                                      'WHERE CIAID='''+DMLOG.cdsPadre.FieldByName('CIAID').AsString+'''  '+
                                      'AND PROFID='''+DMLOG.cdsPadre.FieldByName('PROFID').AsString+''') '+
                  'AND CIAID='''+DMLOG.cdsPadre.FieldByName('CIAID').AsString+''' '+
                  'AND PROFID='''+DMLOG.cdsPadre.FieldByName('PROFID').AsString+'''';
          end
          else
          if SRV_D = 'ORACLE' then
          begin
            sSQL:='INSERT INTO LOG326 '+
                  'SELECT '''+DMLOG.cdsPadre.FieldByName('CIAID').AsString+''', '''+DMLOG.cdsPadre.FieldByName('SCCID').AsString+''', '''+DMLOG.cdsPadre.FieldByName('PROFID').AsString+''', ''01'', '+
                  ''''+CCOID+''', '''+CCODE+''', ARTID, '''+CCOTE+''', '+CCOPT+', DPROFIMP, 0, SUBSTR(DPROFOBS,1,30), TINID '+
                  'FROM LOG313 '+
                  'WHERE ARTID NOT IN (SELECT ARTID '+
                                      'FROM LOG326 '+
                                      'WHERE CIAID='''+DMLOG.cdsPadre.FieldByName('CIAID').AsString+''' '+
                                      'AND PROFID='''+DMLOG.cdsPadre.FieldByName('PROFID').AsString+''') '+
                  'AND CIAID='''+DMLOG.cdsPadre.FieldByName('CIAID').AsString+''' '+
                  'AND PROFID='''+DMLOG.cdsPadre.FieldByName('PROFID').AsString+'''';
          end;
          Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
          except
            //DMLOG.ControlTran( 1, Nil, '');
          end;
        DMLOG.cdsPadre.Next;
        end;
//------------------------------------------------------------------------------
      end;
    finally
    	Screen.Cursor:=crDefault;
    end;
  end;
  btnDetalle;
end;

procedure TFRegSolProfAut.Z2bbtnAnulaClick(Sender: TObject);
begin
  if (trim(DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString) = 'INICIAL') and (DMLOG.cdsDSolCot.RecordCount>0)  then
  begin
    if DMLOG.cdsSolCot.State in [dsBrowse] then
    begin
       DMLOG.cdsSolCot.Edit;
       DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString := 'ANULADO';
			 DMLOG.cdsSolCot.Post;
			 //DMLOG.ControlTran;
			 DMLOG.ControlTran( 9, DMLOG.cdsSolCot,'SOLCOT');
			 //DMLOG.cdsSolCot.ApplyUpdates(0);
    end;
  end;
  
  btnDetalle;
end;

procedure TFRegSolProfAut.Z2dbgDReqsIButtonClick(Sender: TObject);
begin
	wModo := '';
	Screen.Cursor:=crhourGlass;
  iEstado := 0;
  dbeCntS.Text := '0';   dbeCntSSer.Text := '0';   dbeCntSAct.Text := '0';
  dbcbFLAG.Text := 'G';  dbcbFLAGSer.Text := 'G';  dbcbFLAGAct.Text := 'G';
  if dblcTipSol.Text = 'C' then
  	dbeItem.Text := DMLOG.StrZero( DMLOG.MaxValue( 'DSCCID', DMLOG.cdsDSolCot ),3)
  else
  if dblcTipSol.Text = 'S' then
  	dbeItemSer.Text := DMLOG.StrZero( DMLOG.MaxValue( 'DSCCID', DMLOG.cdsDSolCot ),3)
  else
  if dblcTipSol.Text = 'A' then
  dbeItemAct.Text := DMLOG.StrZero( DMLOG.MaxValue( 'DSCCID', DMLOG.cdsDSolCot ),3);
	OnOffDetalle(False);          // Desactivar el panel de detalle
  Screen.Cursor:=crDefault;
	{.............................................................................
  | Mostrar el cuadro de díalogo de los artículos pendientes                  |
  .............................................................................}
  if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then
  begin
    if Artpend=mrOk then
    begin
      pnlDetalleA.Height:=211;
      pnlDetalleA.Left:=177;
      pnlDetalleA.Top:=317;
      pnlDetalleA.Width:=440;
      pnlDetalleA.Visible := True  // Activar el panel de Mantenimiento
    end
    else
			OnOffDetalle(true);          // Activar el panel de detalle
  end
  else
  if (DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'S') or
  	 (DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'A') then		// Servicio
  begin
		if Serpend=mrOk then
    begin
    	if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'S' then
      begin
        pnlDetalleB.Height:=211;
        pnlDetalleB.Left:=177;
        pnlDetalleB.Top:=317;
        pnlDetalleB.Width:=440;
      	pnlDetalleB.Visible := True;
      end
      else
      begin
        pnlDetalleC.Height:=211;
        pnlDetalleC.Left:=177;
        pnlDetalleC.Top:=317;
        pnlDetalleC.Width:=440;
      	pnlDetalleC.Visible := True;
      end;
    end
    else
		 OnOffDetalle(true);
	end;
	btnDetalle;
end;

function TFRegSolProfAut.Artpend : Integer;
var
	sSQL, xUMed : string;
begin
	// invocar los articulos pendientes de atencion correspondiente al articulo seleccionado ..........
	Screen.Cursor:=crhourGlass;
	Result := mrCancel;
	Screen.Cursor:=crDefault;
	if FRqsArt.Execute( dbcldArti.Text, dblcCIA.Text) then
	begin
	{............................................................................
	| Aqui debe ejecutarse y copiar a la tabla que contiene la siguiente       |
	| estructura :                                                             |
	|                                                                          |
	|  ----- RELACION ENTRE LA SOLICITUD DE COTIZACION Y LA REQUISION -----    |
	|     SCCID   -> número solicitud de cotización                            |
	|     DSCCID  -> número correlativo del item en la solicitud de cotización |
	|     RQSID   -> número requisición                                        |
	|     DRQSID  -> número correlativo del item en la requisión               |
	|     CIAID   -> Compañía                                                  |
	...........................................................................}
	Result := mrOk;
	if trim(dbcldArti.Text) <> '' then
	begin
		if FRqsArt.dbgRA.SelectedList.Count > 0 then
		begin
			sSql := 'ARTID=' + quotedStr(dbcldArti.Text)+' AND CIAID=' + quotedStr(dblcCIA.Text);
			FRqsArt.dbgRA.DataSource.DataSet.DisableControls;
			FRqsArt.dbgRA.DataSource.DataSet.GotoBookmark(FRqsArt.dbgRA.SelectedList.Items[0]);
			FRqsArt.dbgRA.DataSource.DataSet.EnableControls;
			//DBMemo1.Text:=FRqsArt.dbgRA.DataSource.DataSet.FieldByName('ARTID').AsString+'  '+DMLOG.displayDescrip('prvArti','TGE205','*',ssql,'ARTDES');
			if DMLOG.displayDescrip('prvSQL','TGE205','ARTCONT',ssql,'ARTCONT') = '1' then
			 begin
				dbcbFLAG.Enabled := false;
				dblcUNMID.Enabled := false;
			 end
			else
			 begin
				 dbcbFLAG.Enabled := true;
				 dblcUNMID.Enabled := False;
			 end;
			dbcbFLAG.Text := vflag;
			if  vflag = 'G' then
			begin
				xUMed:=DMLOG.cdsArtPend.FieldByName('UNMIDG').AsString;
				sSQL := 'UNMID=' + QuotedStr(xUMed);
				dbeCNTS.Text := FRqsArt.edSUMG.Text;
			end
			else
			begin
				sSQL := 'ARTID=' + quotedStr(dbcldArti.Text)+' AND CIAID=' + quotedStr(dblcCIA.Text);
				xUMed:= DMLOG.displaydescrip('prvSQL','TGE205','UNMIDU',sSQL,'UNMIDU');
				sSQL := 'UNMID=' + quotedStr(xUMed);
				dbeCNTS.Text := FRqsArt.edSUMG.Text;
			end;
			edtUNMID.Text := DMLOG.displaydescrip('prvSQL','TGE130','UNMDES',sSQL,'UNMDES');
			dblcUNMID.Text:= xUMed;
		end;
	end
	else
		Exit; // salir porque no existe ninguna lista seleccionada...
		//aqui estaba el insertar relacion de documentos
	end;
end;

function TFRegSolProfAut.Serpend : Integer;
//var
//	xsql,ssql : string;
begin
  Result := mrCancel;
  if FRqsSer.Execute( dbcldArti.Text, dblcCIA.Text) then
  begin
  Result := mrOk;
  if trim(dbcldArti.Text) = '' then
  	if FRqsSer.dbgRA.SelectedList.Count > 0 then
    begin
    	FRqsSer.dbgRA.DataSource.DataSet.DisableControls;
      FRqsSer.dbgRA.DataSource.DataSet.GotoBookmark(FRqsSer.dbgRA.SelectedList.Items[0]);
      FRqsSer.dbgRA.DataSource.DataSet.EnableControls;
      dbcbFLAG.Text := vflag; // DMLOG.cdsDReqs.FieldByName('RQSFLAGUM').AsString;
    end
    else
    	Exit;
	end;
end;

procedure TFRegSolProfAut.Z2bbtnRegOkClick(Sender: TObject);
var
	sCIAID,sSCCID, sARTID, sUMEDC, sUMEDA, sUMEDS  : String;
	iX							  : Integer;
begin
	if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'A' then
	begin
		if trim(dblcUNMIDAct.Text) = ''  then
		begin
			ErrorMsg('Adquisiciones', 'La unidad de medida no puede estar en blanco');
			dblcUNMIDAct.SetFocus;
			Exit;
		end;
		if trim(dbeCntSAct.Text) = '' then
		begin
			ErrorMsg('Adquisiciones', ' La Cantidad no puede estar en blanco ');
			dbeCntSAct.SetFocus;
			Exit;
		end;
		if strtofloat(dbeCntSAct.Text) <= 0 then
		begin
			ErrorMsg('Adquisiciones', 'La Cantidad debe ser Mayor a Cero' );
			dbeCntSAct.SetFocus;
			Exit;
		end;
	end;
	if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'S' then
	begin
		if trim(dblcUNMIDSer.Text) = ''  then
		begin
			ErrorMsg('Adquisiciones', 'La unidad de medida no puede estar en blanco');
			dblcUNMIDSer.SetFocus;
			Exit;
		end;
	end;
	if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then
	begin
		if trim(dblcUNMID.Text) = ''  then
		begin
			ErrorMsg('Adquisiciones', 'La unidad de medida no puede estar en blanco');
			dblcUNMID.SetFocus;
			Exit;
		end;
		if trim(dbeCntS.Text) = '' then
		begin
			ErrorMsg('Adquisiciones', ' La Cantidad no puede estar en blanco ');
			dbeCntS.SetFocus;
			Exit;
		end;
		if strtofloat(dbeCntS.Text) <= 0 then
		begin
			ErrorMsg('Adquisiciones', 'La Cantidad debe ser Mayor a Cero' );
			dbeCntS.SetFocus;
			Exit;
		end;
	end;
	sCIAID := DMLOG.cdsSolCot.FieldByName('CIAID').AsString;
	sSCCID := DMLOG.cdsSolCot.FieldByName('SCCID').AsString;
	sARTID := dbcldArti.Text;
	sUMEDC := dblcUNMID.Text;
	sUMEDA := dblcUNMIDAct.Text;
	sUMEDS := dblcUNMIDSer.Text;
	{Guardar los datos del detalle}
	if iEstado=0 then
		DMLOG.cdsDSolCot.Insert
	else
		DMLOG.cdsDSolCot.Edit;

	dblcUNMID.Text:=sUMEDC;
	dblcUNMIDAct.Text:=sUMEDA;
	dblcUNMIDSer.Text:=sUMEDS;

	if DMLOG.cdsDSolCot.State in [dsInsert,dsEdit] then
	begin
		try
			DMLOG.cdsDSolCot.FieldByName('CIAID').AsString  := dblcCIA.Text;
			DMLOG.cdsDSolCot.FieldByName('SCCID').AsString  := dbeNumSol.text;
			DMLOG.cdsDSolCot.FieldByName('FPAGOID').AsString:= dblcFPago.Text;
			DMLOG.cdsDSolCot.FieldByName('COMPID').AsString := dblcComprador.Text;

			if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then		// Por Economato
			begin
				DMLOG.cdsDSolCot.FieldByName('DSCCID').AsString   := dbeItem.Text;
				DMLOG.cdsDSolCot.FieldByName('SCCFLAGUM').AsString:= dbcbFLAG.text;
				DMLOG.cdsDSolCot.FieldByName('DSCCCNTG').AsString  := dbeCntS.Text;
				DMLOG.cdsDSolCot.FieldByName('DSCOBS').AsString  := dbeArti.Text;
				DMLOG.cdsDSolCot.FieldByName('ARTID').AsString := dbcldArti.Text;
				DMLOG.cdsDSolCot.FieldByName('TIPOADQ').AsString  := dblcTipSol.Text;
				if  dbcbFLAG.text = 'G' then
					DMLOG.cdsDSolCot.FieldByName('UNMIDG').AsString  := sUMEDC
				else
					DMLOG.cdsDSolCot.FieldByName('UNMIDU').AsString  := sUMEDC;

				wSQL:='CIAID='+QuotedStr(dblcCIA.Text)+' AND ARTID='+QuotedStr(DMLOG.cdsDSolCot.FieldByName('ARTID').AsString);
				DMLOG.DisplayDescrip('prvSQL', 'TGE205', 'ARTID, TINID, GRARID, FAMID, SFAMID', wSQL, 'ARTID');

				DMLOG.cdsDSolCot.FieldByName('TINID').AsString     := DMLOG.cdsQry.FieldByName('TINID').AsString;
				DMLOG.cdsDSolCot.FieldByName('GRARID').AsString    := DMLOG.cdsQry.FieldByName('GRARID').AsString;
				DMLOG.cdsDSolCot.FieldByName('FAMID').AsString     := DMLOG.cdsQry.FieldByName('FAMID').AsString;
				DMLOG.cdsDSolCot.FieldByName('SFAMID').AsString    := DMLOG.cdsQry.FieldByName('SFAMID').AsString;
			end
			else
			if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'S' then		// Por Servicio
			begin
				DMLOG.cdsDSolCot.FieldByName('DSCCID').AsString   := dbeItemSer.Text;
				DMLOG.cdsDSolCot.FieldByName('SCCFLAGUM').AsString:= dbcbFLAGSer.text;
				DMLOG.cdsDSolCot.FieldByName('DSCOBS').AsString  := DBMemo1Ser.Text;
				DMLOG.cdsDSolCot.FieldByName('TIPOADQ').AsString  := dblcTipSol.Text;
				DMLOG.cdsDSolCot.FieldByName('DSCCCNTG').AsString  := dbeCntSSer.Text;
				DMLOG.cdsDSolCot.FieldByName('ARTID').AsString  := edtSer.Text;
				if  dbcbFLAGSer.text = 'G' then
					DMLOG.cdsDSolCot.FieldByName('UNMIDG').AsString  := sUMEDS
				else
					DMLOG.cdsDSolCot.FieldByName('UNMIDU').AsString  := sUMEDS;
			end
			else
			if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'A' then			// Por Activo Fijo
			begin
				DMLOG.cdsDSolCot.FieldByName('DSCCID').AsString   := dbeItemAct.Text;
				DMLOG.cdsDSolCot.FieldByName('SCCFLAGUM').AsString:= dbcbFLAGAct.text;
				DMLOG.cdsDSolCot.FieldByName('DSCOBS').AsString  := DBMemo1Act.Text;
				DMLOG.cdsDSolCot.FieldByName('TIPOADQ').AsString  := dblcTipSol.Text;
				DMLOG.cdsDSolCot.FieldByName('DSCCCNTG').AsString  := dbeCntSAct.Text;
				DMLOG.cdsDSolCot.FieldByName('ARTID').AsString  := edtActFij.Text;
				if  DMLOG.cdsDSolCot.FieldByName('SCCFLAGUM').AsString = 'G' then
					DMLOG.cdsDSolCot.FieldByName('UNMIDG').AsString  := sUMEDA
				else
					DMLOG.cdsDSolCot.FieldByName('UNMIDU').AsString  := sUMEDA;
			end;

			if iEstado = 0 then
			begin
				DMLOG.cdsDSolCot.FieldbyName('SCCANO').AsString      := DMLOG.cdsSolCot.FieldbyName('SCCANO').AsString;
				DMLOG.cdsDSolCot.FieldbyName('SCCMES').AsString      := DMLOG.cdsSolCot.FieldbyName('SCCMM').AsString;
				DMLOG.cdsDSolCot.FieldbyName('SCCDIA').AsString      := DMLOG.cdsSolCot.FieldbyName('SCCDD').AsString;
				DMLOG.cdsDSolCot.FieldbyName('SCCTRIM').AsString     := DMLOG.cdsSolCot.FieldbyName('SCCTRI').AsString;
				DMLOG.cdsDSolCot.FieldbyName('SCCSEM').AsString      := DMLOG.cdsSolCot.FieldbyName('SCCSEM').AsString;
				DMLOG.cdsDSolCot.FieldbyName('SCCANOMES').AsString   := DMLOG.cdsSolCot.FieldbyName('SCCANOMM').AsString;
				DMLOG.cdsDSolCot.FieldbyName('SCCSS').AsString       := DMLOG.cdsSolCot.FieldbyName('SCCSS').AsString;
				DMLOG.cdsDSolCot.FieldbyName('SCCAATRI').AsString    := DMLOG.cdsSolCot.FieldbyName('SCCAATRI').AsString;
				DMLOG.cdsDSolCot.FieldbyName('SCCAASEM').AsString    := DMLOG.cdsSolCot.FieldbyName('SCCAASEM').AsString;
				DMLOG.cdsDSolCot.FieldbyName('SCCAASS').AsString     := DMLOG.cdsSolCot.FieldbyName('SCCAASS').AsString;
				DMLOG.cdsDSolCot.FieldByName('SCCUSER').AsString     := DMLOG.wUsuario;
			end;
			DMLOG.cdsDSolCot.Post;
			OnOffDetalle(True); // activar detalle
			pnlDetalleB.Visible := False;
			btnDetalle;
			{+..................................................................................+
			| Aqui se guarda la relación existente entre requisiciones y solicitudes de compra                                                              |
			+.................................................................................. +}
			if iEstado = 0 then
      begin
        if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then		// Almacen
        begin
          if FRqsArt.dbgRA.SelectedList.Count > 0 then
          begin
            FRqsArt.dbgRA.DataSource.DataSet.DisableControls;
            for iX:=0 to FRqsArt.dbgRA.SelectedList.Count-1 do
            begin
              FRqsArt.dbgRA.DataSource.DataSet.GotoBookmark(FRqsArt.dbgRA.SelectedList.Items[iX]);
              DMLOG.cdsDSCxDRQS.Insert;
              DMLOG.cdsDSCxDRQS.FieldByName('CIAID').AsString  := FRqsArt.dbgRA.DataSource.DataSet.FieldByName('CIAID').AsString;
							DMLOG.cdsDSCxDRQS.FieldByName('RQSID').AsString  := FRqsArt.dbgRA.DataSource.DataSet.FieldByName('RQSID').AsString;
							DMLOG.cdsDSCxDRQS.FieldByName('DRQSID').AsString := FRqsArt.dbgRA.DataSource.DataSet.FieldByName('DRQSID').AsString;
							DMLOG.cdsDSCxDRQS.FieldByName('TIPOADQ').AsString := dblcTipSol.Text;
							DMLOG.cdsDSCxDRQS.FieldByName('ARTID').AsString  := dbcldArti.Text;  //DataSet.FieldByName('RQSID').AsString;
							DMLOG.cdsDSCxDRQS.FieldByName('SCCID').AsString  := dbeNumSol.Text;
							DMLOG.cdsDSCxDRQS.FieldByName('DSCCID').AsString := dbeItem.Text;
							DMLOG.cdsDSCxDRQS.Post;  // de cdsDSCxDRQS
						end;
						FRqsArt.dbgRA.DataSource.DataSet.EnableControls;
					end;
				end
				else
				begin
					if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'S' then		// Servicio
					begin
						DMLOG.cdsDSCxDRQS.Insert;
						DMLOG.cdsDSCxDRQS.FieldByName('CIAID').AsString  := dblcCIA.Text;
            DMLOG.cdsDSCxDRQS.FieldByName('TIPOADQ').AsString:= dblcTipSol.Text;
            DMLOG.cdsDSCxDRQS.FieldByName('SCCID').AsString  := dbeNumSol.Text;
            DMLOG.cdsDSCxDRQS.FieldByName('DSCCID').AsString := dbeItemSer.Text;
            DMLOG.cdsDSCxDRQS.FieldByName('RQSOBS').AsString := DBMemo1Ser.Text;
            DMLOG.cdsDSCxDRQS.FieldByName('RQSID').AsString  := DMLOG.cdsSerPend.FieldByName('RQSID').AsString;
            DMLOG.cdsDSCxDRQS.FieldByName('DRQSID').AsString := DMLOG.cdsSerPend.FieldByName('DRQSID').AsString;
            DMLOG.cdsDSCxDRQS.Post;  // de cdsDSCxDRQS
          end
          else
          begin
            if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'A' then		// Activo
            begin
              DMLOG.cdsDSCxDRQS.Insert;
              DMLOG.cdsDSCxDRQS.FieldByName('CIAID').AsString  := dblcCIA.Text;
              DMLOG.cdsDSCxDRQS.FieldByName('TIPOADQ').AsString:= dblcTipSol.Text;
              DMLOG.cdsDSCxDRQS.FieldByName('SCCID').AsString  := dbeNumSol.Text;
              DMLOG.cdsDSCxDRQS.FieldByName('DSCCID').AsString := dbeItemAct.Text;
              DMLOG.cdsDSCxDRQS.FieldByName('RQSOBS').AsString := DBMemo1Act.Text;
              DMLOG.cdsDSCxDRQS.FieldByName('RQSID').AsString  := DMLOG.cdsSerPend.FieldByName('RQSID').AsString;
              DMLOG.cdsDSCxDRQS.FieldByName('DRQSID').AsString := DMLOG.cdsSerPend.FieldByName('DRQSID').AsString;
              DMLOG.cdsDSCxDRQS.Post;  // de cdsDSCxDRQS
            end;
          end;
        end;
      end;
			pnlDetalleA.Visible:=False;
			pnlDetalleB.Visible:=False;
			pnlDetalleC.Visible:=False;
      pnlPrecioSer.Visible:=False;
      pnlPrecioArt.Visible:=False;

      Z2bbtnGraba.Click;  // Grabo por que tengo que insertar el Art. añadido en el Detalle de Proforma

      if iEstado = 0 then
      begin
        DMLOG.cdsPadre.First;
        while not DMLOG.cdsPadre.Eof do
        begin
          xSQL:='INSERT INTO LOG313 ('  +
                'CIAID, PROFID, SCCID, ARTID, UNMIDG, UNMIDU, DPROFLAGUM, DPROFID, DPROFCNTG, '  +
                'DPROFCNTU, DPROFPUNG, DPROFPUNU, DPROFDSCTO, DPROFIMP, '  +
                'DPROFIMPU, DPROFEVAL, DPROFISC, TIPOADQ, DPROFOBS, DPROFARTD, '+
                'DPROFFREG, DPROFTEN, DPROFVALID, DPROFPRVD, DPROFPROV, '+
                'TINID, GRARID, FAMID, SFAMID, PROFUSER, DPROFCONCOM, '+
                'PROFANO, PROFMES, PROFDIA, PROFTRIM, PROFSEM, PROFANOMES, PROFSS, PROFAATRI, PROFAASEM, PROFAASS ) '+

                'SELECT CIAID, '+QuotedStr(DMLOG.cdsPadre.FieldByName('PROFID').AsString)+', SCCID, ARTID, '  +
                'UNMIDG, UNMIDU, SCCFLAGUM, DSCCID, '+
                'DSCCCNTG, 0, 0, 0, 0, 0, '+wIGV+', ''X'', 0, TIPOADQ, DSCOBS, TRIM(DSCOBS), '+
                DMLOG.wRepFuncDate+quotedstr(FormatDateTime(DMLOG.wFormatFecha,dbdtpFSolicitud.Date))+'), 0, 0, '''+
                DMLOG.cdsPadre.FieldByName('PROVDES').AsString+''', '''+DMLOG.cdsPadre.FieldByName('PROV').AsString+''', '+
                'TINID, GRARID, FAMID, SFAMID, SCCUSER, '+
                QuotedStr(DMLOG.cdsSolCot.FieldByName('FPAGOID').AsString)+', '+
                'SCCANO, SCCMES, SCCDIA, SCCTRIM, SCCSEM, SCCANOMES, SCCSS, SCCAATRI, SCCAASEM, SCCAASS '+
                'FROM LOG303 ' +
                'WHERE SCCID='+QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString)+' '+
                'AND ARTID='+QuotedStr(DMLOG.cdsDSolCot.FieldByName('ARTID').AsString);
          Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
          Except
          End;
          DMLOG.cdsPadre.Next;
        end;
      end;

		except
    	on E: Exception do EHandlerError( E );
    end;
  end;

  if DMLOG.wModo = 'A' then
    Z2dbgDReqsIButton.Click;
end;

procedure TFRegSolProfAut.Z2bbtnRegCancClick(Sender: TObject);
begin
 if DMLOG.cdsDSolCot.State in [dsInsert,dsEdit] then
    DMLOG.cdsDSolCot.Cancel;
 OnOffDetalle(True); // activar detalle
 pnlDetalleA.Visible := False;
end;

procedure TFRegSolProfAut.OnOffCabecera(Value: Boolean);
begin
  //....................... activar cabecera de requisición ...................
  pnlCabecera.Enabled := Value;
  Z2bbtnBorrar.Enabled  := Value;
  Z2bbtnOK.Enabled 	  := Value;
end;

procedure TFRegSolProfAut.OnOffDetalle(Value: Boolean);
begin
	// ....................... activar detalle de requisición ....................
  if Value then
  	stxTitulo1.Color := clHighlight
  else
  	stxTitulo1.Color := clGray;
  pnlDetalleG.Enabled  := Value;
  Z2bbtnRegresa.Enabled:= Value;
  Z2bbtnCanc2.Enabled 	:= Value;
  Z2bbtnGraba.Enabled 	:= Value;
  Z2bbtnAcepta.Enabled := Value;
  Z2bbtnAnula.Enabled 	:= Value;
  Z2bbtnNuevo.Enabled 	:= Value;
  if Value then
  	Z2bbtnNuevo.SetFocus;
	//btnDetalle;
end;

procedure TFRegSolProfAut.btnDetalle;
var
  bDummy1, bDummy2, bDummy3 : Boolean;
begin
  bDummy1:=((DMLOG.cdsDSolCot.ChangeCount>0) or (DMLOG.cdsDSolCot.Modified) or
            (DMLOG.cdsSolCot.ChangeCount>0)  or (DMLOG.cdsSolCot.Modified) );
  bDummy2:= True;
  if trim(DMLOG.cdsSolCot.FieldbyName('SCCEst').AsString)<> 'INICIAL' then begin
     OnOffCabecera(False); //Activar la cabecera
     OnOffDetalle(False); //Activar la cabecera
     bDummy2:=False;
     end
  else begin
     if not pnlDetalleG.Enabled then
        bDummy2:=False
     else
        if trim(DMLOG.cdsSolCot.FieldbyName('SCCEst').AsString)='INICIAL' then
           bDummy2:= not bDummy1;
  end;

  Z2bbtnGraba.Enabled  := bDummy1 ;
  Z2bbtnAnula.Enabled  := bDummy2;
  Z2bbtnAcepta.Enabled := bDummy2;
  Z2bbtnCanc2.Enabled  := bDummy1 or bDummy2;
  Z2bbtnRegresa.Enabled:= bDummy1 or bDummy2;
  Z2bbtnNuevo.Enabled  := False;

  bDummy3 := False;
  if DMLOG.wModo='A' then bDummy3 := not bDummy1;
  Z2bbtnNuevo.Enabled:= bDummy3;

  //Z2dbgDReqsIButton.Enabled := ( trim(DMLOG.cdsSolCot.FieldbyName('SCCEst').AsString) = 'INICIAL' );
end;

{procedure TFRegSolCot.lblEstado;
begin
end;}

procedure TFRegSolProfAut.Z2bbtnNuevoClick(Sender: TObject);
var
	xSQL : String;
begin
	OnOffCabecera(True);
	OnOffDetalle(False);
	dblcCIA.Enabled   := True;
	dbeNumSol.Enabled := True;
	dbeTipSol.Text:='';
	dbeTSolCot.Text:='';
	dbeNumSol.Text:='';
	dbePRIO.Text:='';
	dbeComprador.Text:='';
	dbeTMoneda.Text:='';
	dbeLEntrega.Text:='';
	dbeFPago.Text:='';
	dbmObs.Text:='';
	DMLOG.cdsSolCot.Insert;
	wModo := 'A';
	if DMLOG.cdsSolCot.State in [dsInsert] then
		dcCIA;

	xSQL:='SELECT * FROM LOG303 '+
				'WHERE CIAID=''99'' '+
				'AND SCCID=''00000000''';
	DMLOG.cdsDSolCot.Close;
	DMLOG.cdsDSolCot.DataRequest(xSQL);
	DMLOG.cdsDSolCot.Open;

	DMLOG.cdsSolCot.FieldByName('SCCEST').AsString := 'INICIAL';

  btnDetalle;
end;

procedure TFRegSolProfAut.dbgDReqsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key=$4D) and (ssCtrl in Shift)  then
  begin
    dbgDReqsDblClick(nil);
	end;

  if (Key=VK_DELETE) and (ssCtrl in Shift)  then
  begin
    if trim(DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString) = 'INICIAL' then
    begin
      if not Question('Confirmar', 'Esta Seguro de Eliminar El Articulo '+#13+#13+
                   DMLOG.cdsDSolCot.FieldByName('ARTID').AsString  + '  -  '+
                   DMLOG.cdsDSolCot.FieldByName('DSCOBS').AsString + #13+#13 +'de la Proforma Automatica'+#13+#13+
                   ' Desea Continuar ') then
      begin
        Exit;
      end;

      sSQL:='DELETE FROM LOG313 '+
            'WHERE SCCID='+QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString)+' '+
            'AND ARTID='+QuotedStr(DMLOG.cdsDSolCot.FieldByName('ARTID').AsString);
	    Try
		    DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
	    Except
	    End;

      DMLOG.cdsDSolCot.Delete;

      DMLOG.ControlTran( 0, nil, '' );

      if DMLOG.cdsDSolCot.RecordCount = 0 then
      begin
        sSQL:='DELETE FROM LOG312 '+
              'WHERE SCCID='+QuotedStr(DMLOG
              .cdsSolCot.FieldByName('SCCID').AsString);
        Try
          DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
        Except
        End;

        xSQL:='SELECT * FROM LOG312 '+
              'WHERE SCCID='+QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString);
        DMLOG.cdsPadre.Close;
        DMLOG.cdsPadre.DataRequest(xSQL);
        DMLOG.cdsPadre.Open;
      end;
    end
    else ErrorMsg('Error','No se puede borrar...');
  end;
	 btnDetalle;
end;

procedure TFRegSolProfAut.dbgDReqsDblClick(Sender: TObject);
begin
  if DMLOG.cdsDSolCot.RecordCount = 0 then
  begin
    ErrorMsg('Adquisiciones', 'No Existe Articulos Para esta Solicitud');
    exit;
  end;

  if DMLOG.cdsPadre.RecordCount = 0 then
  begin
    ErrorMsg('Adquisiciones', 'No Existe Proveedores Para estos Articulos');
    exit;
  end;

  xSQL:='SELECT * FROM LOG313 '+
        'WHERE SCCID='+QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString)+' '+
        'AND ARTID='+QuotedStr(DMLOG.cdsDSolCot.FieldByName('ARTID').AsString);
  DMLOG.cdsHijo.Close;
  DMLOG.cdsHijo.DataRequest(xSQL);

	dbgDProf.Selected.Clear;
	dbgDProf.Selected.Add('PROFID'+#9+'9'+#9+'Proforma');
	dbgDProf.Selected.Add('DPROFPRVD'+#9'28'+#9+'Nombre~Proveedor');
	dbgDProf.Selected.Add('DPROFCNTG'+#9'8'+#9+'Cantidad');
	dbgDProf.Selected.Add('DPROFPUNG'+#9+'7'+#9+'Precio~Unitario');
	dbgDProf.Selected.Add('DPROFISC'+#9+'7'+#9+'I.S.C.');
	dbgDProf.Selected.Add('DPROFIMPU'+#9+'7'+#9+'Impuesto');
	dbgDProf.Selected.Add('DPROFDSCTO'+#9+'7'+#9+'Dscto');
	dbgDProf.Selected.Add('DPROFIMP'+#9+'10'+#9+'Importe~Total');
  dbgDProf.RefreshDisplay;
  DMLOG.cdsHijo.Open;

  TNumericField(DMLOG.cdsHijo.FieldByName('DPROFCNTG')).DisplayFormat:='###,###,##0.00';
  TNumericField(DMLOG.cdsHijo.FieldByName('DPROFPUNG')).DisplayFormat:='###,###,##0.00';
  TNumericField(DMLOG.cdsHijo.FieldByName('DPROFISC')).DisplayFormat:='###,###,##0.00';
  TNumericField(DMLOG.cdsHijo.FieldByName('DPROFIMPU')).DisplayFormat:='###,###,##0.00';
  TNumericField(DMLOG.cdsHijo.FieldByName('DPROFDSCTO')).DisplayFormat:='###,###,##0.00';
  TNumericField(DMLOG.cdsHijo.FieldByName('DPROFIMP')).DisplayFormat:='###,###,##0.00';
  //TNumericField(DMLOG.cdsHijo.FieldByName('RCOBAPOVAL')).EditFormat:='########0.00';

  dbgDReqs.Enabled:=False;
  lblDescrArt.Caption:=DMLOG.cdsDSolCot.FieldByName('DSCOBS').AsString;
  pnlDatDetProf.Visible:=True;

  Exit;
	if trim(DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString) = 'INICIAL' then
  begin
  	OnOffDetalle(False);          // Desactivar el panel de detalle
    dbeItem.Text   := DMLOG.cdsDSolCot.FieldByName('DSCCID').AsString;
    dbcldArti.Text := DMLOG.cdsDSolCot.FieldByName('ARTID').AsString;
    dbcbFLAG.Text := DMLOG.cdsDSolCot.FieldByName('SCCFLAGUM').AsString;

    if DMLOG.cdsDSolCot.FieldByName('SCCFLAGUM').AsString = 'G' then
    begin
      sSQL := 'UNMID=' + QuotedStr(DMLOG.cdsDSolCot.FieldByName('UNMIDG').AsString);
      dbeCNTS.Text := DMLOG.cdsDSolCot.FieldByName('DSCCCNTG').AsString;
    end
    else
    begin
      sSQL := 'UNMID=' + quotedStr(DMLOG.cdsDSolCot.FieldByName('UNMIDU').AsString);
      dbeCNTS.Text := DMLOG.cdsDSolCot.FieldByName('DSCCCNTU').AsString;
    end;
    if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then   // Activar el panel de Mantenimiento
    begin
    	//DBMemo1.Text:=DMLOG.cdsDSolCotDSCOBS.value;
      dbeItem.Text:=DMLOG.cdsDSolCot.FieldByName('DSCCID').value;
      dbeCntS.Text:=floattostr(DMLOG.cdsDSolCot.FieldByName('DSCCCNTG').value);
      dbcldArti.Text := DMLOG.cdsDSolCot.FieldByName('ARTID').AsString;
      dbeArti.Text:=DMLOG.cdsDSolCot.FieldByName('DSCOBS').AsString;
			dbcbFLAG.Text:=DMLOG.cdsDSolCot.FieldByName('SCCFLAGUM').AsString;
      //dblcUNMID.Text:=DMLOG.cdsDSolCot.FieldByName('SCCFLAGUM').AsString;//DMLOG.cdsDSolCotUNMIDG.value;
    	if DMLOG.cdsDSolCot.FieldByName('SCCFLAGUM').AsString = 'G' then
      	dblcUNMID.Text:=DMLOG.cdsDSolCot.FieldByName('UNMIDG').AsString
      else
      	dblcUNMID.Text:=DMLOG.cdsDSolCot.FieldByName('UNMIDU').AsString;
      edtUNMID.Text:=DMLOG.displaydescrip('prvSQL','TGE130','UNMDES','UNMID='''+dblcUNMID.Text+'''','UNMDES');
      pnlDetalleA.Height:=211;
      pnlDetalleA.Left:=177;
      pnlDetalleA.Top:=317;
      pnlDetalleA.Width:=440;
    	pnlDetalleA.Visible := True;
    end
    else
    if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'S' then
  	begin
    	DBMemo1Ser.Text:=DMLOG.cdsDSolCot.FieldByName('DSCOBS').value;
      dbeItemSer.Text:=DMLOG.cdsDSolCot.FieldByName('DSCCID').value;
      dbeCntSSer.Text:=floattostr(DMLOG.cdsDSolCot.FieldByName('DSCCCNTG').value);
      dbcbFLAGSer.Text:=DMLOG.cdsDSolCot.FieldByName('SCCFLAGUM').value;
      edtSer.Text := DMLOG.cdsDSolCot.FieldByName('ARTID').AsString;
//      dblcUNMIDSer.Text:=DMLOG.cdsDSolCotUNMIDG.value;
    	if DMLOG.cdsDSolCot.FieldByName('SCCFLAGUM').AsString = 'G' then
      	dblcUNMIDSer.Text:=DMLOG.cdsDSolCot.FieldByName('UNMIDG').AsString
      else
      	dblcUNMIDSer.Text:=DMLOG.cdsDSolCot.FieldByName('UNMIDU').AsString;
      edtUNMIDSer.Text:=DMLOG.displaydescrip('prvSQL','TGE130','UNMDES','UNMID='''+dblcUNMIDSer.Text+'''','UNMDES');
      pnlDetalleB.Height:=211;
      pnlDetalleB.Left:=177;
      pnlDetalleB.Top:=317;
      pnlDetalleB.Width:=440;
    	pnlDetalleB.Visible := True;
    end
    else
    if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'A' then
    begin
    	DBMemo1Act.Text:=DMLOG.cdsDSolCot.FieldByName('DSCOBS').value;
      dbeItemAct.Text:=DMLOG.cdsDSolCot.FieldByName('DSCCID').value;
      dbeCntSAct.Text:=floattostr(DMLOG.cdsDSolCot.FieldByName('DSCCCNTG').value);
      dbcbFLAGAct.Text:=DMLOG.cdsDSolCot.FieldByName('SCCFLAGUM').value;
      edtActFij.Text := DMLOG.cdsDSolCot.FieldByName('ARTID').AsString;
//      dblcUNMIDAct.Text:=DMLOG.cdsDSolCotUNMIDG.value;
    	if DMLOG.cdsDSolCot.FieldByName('SCCFLAGUM').AsString = 'G' then
      	dblcUNMIDAct.Text:=DMLOG.cdsDSolCot.FieldByName('UNMIDG').AsString
      else
      	dblcUNMIDAct.Text:=DMLOG.cdsDSolCot.FieldByName('UNMIDU').AsString;

      edtUNMIDAct.Text:=DMLOG.displaydescrip('prvSQL','TGE130','UNMDES','UNMID='''+dblcUNMIDAct.Text+'''','UNMDES');
      pnlDetalleC.Height:=211;
      pnlDetalleC.Left:=177;
      pnlDetalleC.Top:=317;
      pnlDetalleC.Width:=440;
    	pnlDetalleC.Visible := True;
    end;
    dbcldArti.OnExit(nil);
    DMLOG.cdsDSolCot.Edit;
    iEstado := 1;
    btnDetalle;
  end
 	else
  	ErrorMsg('Error', 'Sólo se pueden hacer cambios cuando la'+#13+
                     	'Solicitud de Cotización se halla en modo inicial...');
end;

procedure TFRegSolProfAut.dbmObsKeyPress(Sender: TObject; var Key: Char);
//var
  //sC : String;
begin
{  sC := Key;
  sC := Uppercase(sC);
  Key:= sC[1];}
end;

procedure TFRegSolProfAut.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   bExit := True;
   if DMLOG.cdsSolCot.State in [dsEdit, dsInsert] then
      DMLOG.cdsSolCot.Cancel;
   if DMLOG.cdsDSolCot.State in [dsEdit, dsInsert] then
      DMLOG.cdsDSolCot.Cancel;
   if DMLOG.cdsSolCot.ChangeCount > 0 then
      DMLOG.cdsSolCot.CancelUpdates;
   if DMLOG.cdsDSolCot.ChangeCount > 0 then
      DMLOG.cdsDSolCot.CancelUpdates;

//   FADMovimientos.xProfAut := '';

   //FVariables.w_AD_Registro := False;
   //FVariables.w_Num_Formas  := FVariables.w_Num_Formas-1;
   if DMLOG.wTipoAdicion='xFiltro' then
   begin
      DMLOG.ActualizaFiltro(Mtx3000,DMLOG.cdsSolCot,DMLOG.wModo);
   end;

   Action := CAFree;
end;

{procedure TFRegSolCot.cSetFocus(Sender: TObject; const sMsg: String);
begin
 if TCustomEdit(Sender).Text='' then
 begin
   ErrorMsg('Error',sMsg);
   TCustomEdit(Sender).SetFocus;
 end;
end;}

function TFRegSolProfAut.EHandlerError(Ex : Exception ) : Boolean;
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
         ErrorMsg( 'Error','El campo '+s2+' es obligatorio...  ');
      end
      else Result :=  false;
    end;
end;

procedure TFRegSolProfAut.dblcExist(Sender: TObject);
var
  bRq : Boolean;
	xSql: String;
   xNum : String;
	D, M, Y : Word;
begin
  if TwwDBCustomLookupCombo(Sender).DataSource <> nil then
  begin
    bRq := TwwDBCustomLookupCombo(Sender).DataSource.DataSet.FieldByName(TwwDBCustomLookupCombo(Sender).DataField).Required;
    if (bRq) and (trim(TwwDBCustomLookupCombo(Sender).Text)='') then
      TwwDBCustomLookupCombo(Sender).DropDown;
  end
  else
  begin
    if (trim(TwwDBCustomLookupCombo(Sender).Text)='') then
      TwwDBCustomLookupCombo(Sender).DropDown;
  end;
  xSql:='';
  if Sender = dblcCIA then
  begin
  	xSql:='CIAID='''+dblcCIA.Text+'''';
		dbeCIA.Text:=DMLOG.DisplayDescrip('prvLOG','TGE101','*',xSql,'CIADES');

    DMLOG.cdsFPago.Close;
		DMLOG.cdsFPago.DataRequest('SELECT * FROM CXC101 WHERE CIAID='''+dblcCIA.Text+'''');
		DMLOG.cdsFPago.Open;

     if DMLOG.wModo = 'A' then
     begin
         DecodeDate(DateS, Y, M, D);
         if DMLOG.wModo = 'A' then
         begin
            xNum := DMLOG.StrZero(DMLOG.MaxSCC(DMLOG.cdsSolCot.FieldByName('CIAID').AsString),8);

            if NumAnoSol = 'S' then
            begin
               if copy(xNum,1,4) = InttoStr(Y) then
                  xNum := xNum
               else
                  xNum := InttoStr(Y) + '0001'
            end
            else
               xNum := xNum;

            DMLOG.cdsSolCot.FieldByName('SCCID').AsString := xNum;
         end;
     end;
  end;

	if Sender = dblcTSolCot then
  begin
  	xSql:='TSCID='''+dblcTSolCot.Text+'''';
		dbeTSolCot.Text:=DMLOG.DisplayDescrip('prvSQL','TGE137','TSCDES',xSql,'TSCDES');
  end;
  if Sender = dblcPRIO then
  begin
  	xSql:= 'PRIOID=' + QuotedStr(dblcPRIO.Text);
  	dbePRIO.Text := DMLOG.DisplayDescrip('prvSQL','TGE155','PRIODES',xsql,'PRIODES');
  end;
  if Sender = dblcComprador then
  begin
  	xsql := 'COMPCID=' + QuotedStr(dblcComprador.Text);
  	dbeComprador.Text := DMLOG.DisplayDescrip('prvSQL','TGE135','COMPDES',xsql,'COMPDES');
  end;
	if Sender = dblcTMoneda then
  begin
  	xsql := 'TMONID=' + QuotedStr(dblcTMoneda.Text);
  	dbeTMoneda.Text := DMLOG.DisplayDescrip('prvSQL','TGE103','TMONDES',xsql,'TMONDES');
  end;
	if Sender = dblcTMonedaD then
  begin
  	xsql := 'TMONID=' + QuotedStr(dblcTMonedaD.Text);
  	dbeTMonedaD.Text := DMLOG.DisplayDescrip('prvSQL','TGE103','TMONDES',xsql,'TMONDES');
  end;
	if Sender = dblcLEntrega then
  begin
  	xsql := 'LGECID=' + QuotedStr(dblcLEntrega.Text);
		dbeLEntrega.Text := DMLOG.DisplayDescrip('prvSQL','TGE136','LGECDES',xsql,'LGECDES');
  end;
  if Sender = dblcFPago then
  begin
  	xsql := 'CCOMERID=' + QuotedStr(dblcFPago.Text)+' AND CIAID='''+dblcCIA.Text+'''';
  	dbeFPago.Text := DMLOG.DisplayDescrip('prvSQL','CXC101','CCOMERDES',xsql,'CCOMERDES');
  end;

  if Sender = dblcFPagoD then
  begin
  	xsql := 'CCOMERID=' + QuotedStr(dblcFPagoD.Text)+' AND CIAID='''+dblcCIA.Text+'''';
  	dbeFPagoD.Text := DMLOG.DisplayDescrip('prvSQL','CXC101','CCOMERDES',xsql,'CCOMERDES');
  end;
end;

procedure TFRegSolProfAut.dblcNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFRegSolProfAut.dcCIA;
var
  sCIA   : String;
begin
  DMLOG.cdsCIA.First;
  sCIA := trim(DMLOG.cdsCIA.FieldByName('CIAID').AsString);
  DMLOG.cdsSolCot.FieldByName('CIAID').AsString := sCIA;
  dblcCIA.Enabled := DMLOG.cdsCIA.RecordCount > 1;
  DMLOG.cdsFPago.Close;
  DMLOG.cdsFPago.DataRequest('SELECT * FROM CXC101 WHERE CIAID='''+dblcCIA.Text+'''');
  DMLOG.cdsFPago.Open;
end;


procedure TFRegSolProfAut.dblcTipSolExit(Sender: TObject);
var
	xSql : String;
begin
	if Z2bbtnBorrar.Focused then Exit;
	if dblcTipSol.Text = '' then
   begin
      ErrorMsg('Adquisiciones', 'Tiene que seleccionar un tipo de Solicitud');
      dblcTipSol.SetFocus;
    	Exit;
   end;
   xSQL := 'TIPOADQ=' + QuotedStr(dblcTipSol.Text);
   dbeTipSol.Text := DMLOG.DisplayDescrip('prvSQL','TGE173','TIPADQDES',xSQL,'TIPADQDES');

	xSql:='SELECT * FROM TGE137 WHERE TIPOADQ='''+dblcTipSol.Text+'''';
   DMLOG.cdsTSolCot.Close;
   DMLOG.cdsTSolCot.DataRequest(xSql);
   DMLOG.cdsTSolCot.Open;

   if DMLOG.wModo = 'A' then
//      dbeNumSol.OnExit(sender);
   if DMLOG.cdsSolCot.State = dsInsert then
   begin
		//08/11/2000    dblcTSolCot.Text:='';
		//08/11/2000    dbeTSolCot.Text:='';
    dbdtpFSolicitud.Date:=date;
    DMLOG.cdsSolCot.fieldbyname('SCCFSOL').AsDateTime:=dbdtpFSolicitud.Date;
    DMLOG.cdsSolCot.fieldbyname('SCCDIVIG').AsString := '1';
		//spbDiaVig.Value:=1;
   end;
end;

procedure TFRegSolProfAut.dblcTipSolNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFRegSolProfAut.Z2bbtnRegActCancClick(Sender: TObject);
begin
 if DMLOG.cdsDSolCot.State in [dsInsert,dsEdit] then
    DMLOG.cdsDSolCot.Cancel;

 OnOffDetalle(True); // activar detalle
 pnlDetalleC.Visible := False;
end;

procedure TFRegSolProfAut.Z2bbtnRegSerCancClick(Sender: TObject);
begin
	Screen.Cursor:=crHourGlass;
 	if DMLOG.cdsDSolCot.State in [dsInsert,dsEdit] then
  	DMLOG.cdsDSolCot.Cancel;
 	OnOffDetalle(True); // activar detalle
 	pnlDetalleB.Visible := False;
  Screen.Cursor:=crDefault;
end;

procedure TFRegSolProfAut.dblcUNMIDActExit(Sender: TObject);
var
	ssql : String;
begin
	ssql := 'UNMID=' + quotedStr(dblcUNMIDAct.Text);
	vUMActSer:=dblcUNMIDAct.Text;
	edtUNMIDAct.text :=  DMLOG.displaydescrip('prvSQL','TGE130','UNMDES',ssql,'UNMDES');
end;

procedure TFRegSolProfAut.dblcUNMIDSerExit(Sender: TObject);
var
  ssql : String;
begin
  ssql := 'UNMID=' + quotedStr(dblcUNMIDSer.Text);
  edtUNMIDSer.text :=  DMLOG.displaydescrip('prvSQL','TGE130','UNMDES',ssql,'UNMDES');
end;

procedure TFRegSolProfAut.dblcUNMIDExit(Sender: TObject);
var
	sSQL : String;
begin
	sSQL := 'UNMID=' + quotedStr(dblcUNMID.Text);
	edtUNMID.text :=  DMLOG.displaydescrip('prvSQL','TGE130','UNMDES',ssql,'UNMDES');
end;

procedure TFRegSolProfAut.dbcldArtiExit(Sender: TObject);
//var
	//sSQL : string;
begin
	//sSQL := 'ARTID='+quotedstr(dbcldArti.text);
	//dbeArti.text := DMLOG.DisplayDescrip('prvSQL','TGE205','ARTDES',sSQL,'ARTDES');
end;

procedure TFRegSolProfAut.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
	begin
		if self.ActiveControl Is TMemo then Exit;
		if self.ActiveControl Is TDBMemo then Exit;
		key:=#0;
		perform(CM_DialogKey,VK_TAB,0);
	end;
end;

procedure TFRegSolProfAut.dbcbFLAGExit(Sender: TObject);
var
 sSQL, xUMed, xUM : string;
begin
	xUM:=dbcbFLAG.Text;
	sSQL := 'ARTID=' + quotedStr(dbcldArti.Text)+' AND CIAID=' + quotedStr(dblcCIA.Text);
	xUMed:= DMLOG.displaydescrip('prvSQL','TGE205','UNMID'+xUM,sSQL,'UNMID'+xUM);

	ssql := 'UNMID=' + ''''+ xUMed + '''';

	dblcUNMID.text:=xUMed;
	edtUNMID.Text := DMLOG.displaydescrip('prvSQL','TGE130','UNMDES',ssql,'UNMDES');
end;

procedure TFRegSolProfAut.dblcdProvExit(Sender: TObject);
begin
  edtProv.Text := DMLOG.DisplayDescrip('prvSQL','TGE201','PROVDES','PROV='+quotedStr(dblcdProv.text),'PROVDES');
end;

procedure TFRegSolProfAut.Z2bbtnAcepProvClick(Sender: TObject);
var
  bExiste : Boolean;
begin
	bExiste := False;
  bExiste := DMLOG.cdsPadre.Locate ('PROV',VarArrayOf([dblcdProv.Text]),[]);
  if bExiste then
  begin
     ErrorMsg( 'Error', 'No Pueden Existir Proveedores Duplicados'+#13+#13+
                        'en la Proforma Automatica ....... ');
     Exit;
  end;

  dbdtpFAtt.Date:=Date;
  rgdTipoGrt.Itemindex:=0;
  dbseGarantia.Text:='0';
  dbeFlete.Text:='0';
  Memo1.Text:='';
  dblcTMonedaD.text:=dblcTMoneda.text;
  dbeTMonedaD.text:=dbeTMoneda.text;
  dblcFPagoD.text:=dblcFPago.text;
  dbeFPagoD.text:=dbeFPago.text;
  pnlDatCabProf.Visible:=True;
  dbdtpFAtt.SetFocus;
end;

procedure TFRegSolProfAut.GenerProfAuto;
var
   NumSOL, NumPro    : string;
   xSQL, xTCamb, xTGarant, ConCom : String;
	D, M, Y : Word;
begin
   DecodeDate(DateS, Y, M, D);
  {xSQL := 'CIAID=' + QuotedStr(dblcCIA.Text)+' AND CCOMERID='+QuotedStr(dblcFPago.Text);
  if DMLOG.displaydescrip('prvSQL','CXC101','CREDITO',xSQL,'CREDITO') = 'S' then
    ConCom := '1'
  else
    ConCom := '2';}
  //ConCom := '0';
  NumSOL := DMLOG.cdsSolCot.fieldbyname('SCCID').AsString;

  NumPro := DMLOG.StrZero( DMLOG.UltimoNum('prvSQL','LOG312','PROFID','CIAID='+quotedStr(dblcCIA.text)), 8) ;

  if NumAnoPro = 'S' then
  begin
    if copy(NumPro,1,4) = InttoStr(Y) then
      NumPro := NumPro
    else
      NumPro := InttoStr(Y) + '0001'
  end
  else
    NumPro := NumPro;

  xTCamb := DMLOG.CalcTipoCambio(dblcTMoneda.text, dbdtpFSolicitud.DateTime, DMLOG.wTipoCambio);
  if Length(Trim(xTCamb)) = 0 then
    xTCamb:='0';

  if rgdTipoGrt.ItemIndex = 0 then
    xTGarant := 'D'
  else
  if rgdTipoGrt.ItemIndex = 1 then
    xTGarant := 'M'
  else
  if rgdTipoGrt.ItemIndex = 2 then
    xTGarant := 'A';

  xSQL := 'CIAID=' + QuotedStr(dblcCIA.Text)+' AND CCOMERID='+QuotedStr(dblcFPagoD.Text);
  if DMLOG.displaydescrip('prvSQL','CXC101','CREDITO',xSQL,'CREDITO') = 'S' then
    ConCom := '1'
  else
    ConCom := '2';

	xSQL := 'INSERT INTO LOG312 ('+
					'CIAID, PROFID, SCCID, PROV, PROVDES, PROFCONCOM, TMONID, PROFFEMI, PROFTEN, PROFVALID, PROFTCAMB, '+
					'PROFIXFLE, PROFIXTCC, PROFIXTD, PROFIXTI, PROFEST, PROFOBS, PROFUSER, '+
					'PROFFREG, PROFHREG, PROFANO, PROFMM, PROFDD, PROFTRI, PROFSEM, PROFSS, PROFANOMM, '+
					'PROFAATRI, PROFAASEM, PROFAASS, PROFTOTALG, PROFTIMP, PROFTTIMPU, PROFFATE, PROFFARDMA, PROFGARAN, '+
					'PROFEVAL, PROFISC, FAUTOGEN, PROFGENER, TIPOADQ,PROFENTR) '+

					'SELECT CIAID, '+QuotedStr(NumPro)+', SCCID, '+QuotedStr(Trim(dblcdProv.Text))+', '+QuotedStr(Trim(edtProv.Text))+', '+
          QuotedStr(dblcFPagoD.text)+', '+
          QuotedStr(dblcTMonedaD.text)+' TMONID, '+DMLOG.wRepFecServi+', 0, '+
					'0, '+xTCamb+', '+dbeFlete.Text+', 0, ' +
					'0, 0, ''ACEPTADO'', '+
					QuotedStr('GENERADO POR EL SISTEMA DESDE LA PROFORMA AUTOMATICA '+Trim(Memo1.Text))+', '+
					'SCCUSER, SCCFREG, SCCHREG, SCCANO, SCCMM, SCCDD, '+
					'SCCTRI, SCCSEM, SCCSS, SCCANOMM, SCCAATRI, SCCAASEM, SCCAASS, '+
					'0, ''0'', 0, '+QuotedStr(DatetoStr(dbdtpFAtt.Date))+', '+QuotedStr(xTGarant)+', '+dbseGarantia.Text+', ''P'', 0, ''S'', ''SOLICITUD'', TIPOADQ, '+
               QuotedStr(DateToStr(dbdtpFechaEntrega.date))+' PROFENTR '+
					' FROM LOG302 '+
					'WHERE SCCID='''+NumSOL+'''';
	try
		DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
	Except
	End;
  xSQL :='INSERT INTO LOG313 ('  +
        'CIAID, PROFID, SCCID, ARTID, UNMIDG, UNMIDU, DPROFLAGUM, DPROFID, DPROFCNTG, '  +
        'DPROFCNTU, DPROFPUNG, DPROFPUNU, DPROFDSCTO, DPROFIMP, '  +
        'DPROFIMPU, DPROFEVAL, DPROFISC, TIPOADQ, DPROFOBS, DPROFARTD, '+
        'DPROFFREG, DPROFTEN, DPROFVALID, DPROFPRVD, DPROFPROV, '+
        'TINID, GRARID, FAMID, SFAMID, PROFUSER, DPROFCONCOM, DPROFTIPCCOM, '+
        'PROFANO, PROFMES, PROFDIA, PROFTRIM, PROFSEM, PROFANOMES, PROFSS, PROFAATRI, PROFAASEM, PROFAASS ) '+

        'SELECT CIAID, '+QuotedStr(NumPro)+', SCCID, ARTID, '  +
        'UNMIDG, UNMIDU, SCCFLAGUM, DSCCID, '+
        'DSCCCNTG, 0, 0, 0, 0, 0, '+wIGV+', ''X'', 0, TIPOADQ, DSCOBS, SUBSTR('+DMLOG.wRepTrim+'(DSCOBS),1,40), '+
        DMLOG.wRepFuncDate+quotedstr(FormatDateTime(DMLOG.wFormatFecha,dbdtpFSolicitud.Date))+'), 0, 0, '''+
        edtProv.Text+''', '''+dblcdProv.Text+''', '+
        'TINID, GRARID, FAMID, SFAMID, SCCUSER, '+
        QuotedStr(dblcFPagoD.Text)+', '+QuotedStr(ConCom)+', '+
        'SCCANO, SCCMES, SCCDIA, SCCTRIM, SCCSEM, SCCANOMES, SCCSS, SCCAATRI, SCCAASEM, SCCAASS '+
        'FROM LOG303 ' +
        'WHERE SCCID = '''+NumSOL+'''';
	Try
		DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
	Except
	End;

  xSQL:='INSERT INTO LOG326 '+
        'SELECT '+QuotedStr(dblcCIA.Text)+', '+QuotedStr(NumSOL)+', '+QuotedStr(NumPro)+', ''01'', CCOCODID, '+
        'CCODESC, ''-'', CCOTEND, CCOPTOS, 0, 0, '''', '''' '+
        'FROM LOG101 WHERE FLAG=''C'' '+
        'AND CCOCODID NOT IN (SELECT CCOCODID '+
        'FROM LOG326 '+
        'WHERE CIAID='''+dblcCIA.Text+''' '+
        'AND SCCID='+QuotedStr(NumSOL)+' '+
        'AND PROFID='+QuotedStr(NumPro)+')';
  Try
    DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
  Except //DMLOG.ControlTran( 1, nil, '' );
  End;
end;

procedure TFRegSolProfAut.Z2bbtnActpProvOkClick(Sender: TObject);
begin
  if Z2bbtnActpProvCa.Focused then
    Exit;

  if trim(dbeFlete.Text) = '' then
  begin
    ErrorMsg('Adquisiciones', ' El Monto del Flete No Puede Estar en Blanco ');
    dbeFlete.SetFocus;
    Exit;
  end;
  if strtofloat(dbeFlete.Text) < 0 then
  begin
    ErrorMsg('Adquisiciones', 'El Monto del Flete debe ser Mayor a Cero' );
    dbeFlete.SetFocus;
    Exit;
  end;

  if dbdtpFAtt.Date=0 then
  begin
    ErrorMsg('Adquisiciones', 'Ingrese Fecha de Atención' );
    dbdtpFAtt.SetFocus;
    Exit;
  end;

  if dbdtpFechaEntrega.Date=0 then
  begin
    ErrorMsg('Adquisiciones', 'Ingrese Fecha de Entrega' );
    dbdtpFechaEntrega.SetFocus;
    Exit;
  end;

  if not Question('Confirmar', 'Esta Seguro de Ingresar El Proveedor '+#13+#13+
               DMLOG.cdsProv.FieldByName('PROV').AsString  + '  -  '+
							 DMLOG.cdsProv.FieldByName('PROVDES').AsString + #13+#13 +'a la Proforma'+#13+#13+
               ' Desea Continuar ') then
	begin
    Exit;
  end;

  Z2bbtnGraba.Click;
  GenerProfAuto;

  xSQL:='SELECT * FROM LOG312 '+
        'WHERE SCCID='+QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString);
  DMLOG.cdsPadre.Close;
  DMLOG.cdsPadre.DataRequest(xSQL);
  DMLOG.cdsPadre.Open;

  DMLOG.cdsPadre.IndexFieldNames := 'PROV';
  DMLOG.cdsPadre.SetKey;
  DMLOG.cdsPadre.FieldByName('PROV').AsString:=dblcdProv.text;
	if DMLOG.cdsPadre.GotoKey then
  begin
    sSQL:='SELECT LOG326.* FROM LOG326, LOG101 '+
          'WHERE CIAID='''+dblcCIA.Text+''' '+
          'AND SCCID='''+DMLOG.cdsSolCot.FieldByName('SCCID').AsString+''' '+
          'AND PROFID='''+DMLOG.cdsPadre.FieldByName('PROFID').AsString+''' '+
          'AND LOG326.CCOCODID=LOG101.CCOCODID '+
          'AND LOG101.FLAG=''C''';
    DMLOG.cdsValEva.Close;
    DMLOG.cdsValEva.DataRequest(sSQL);
    DMLOG.cdsValEva.Open;
    AsignaValoresNoEditables;

    pnlValores.Height:=285;
    pnlValores.Left:=110;
    pnlValores.Top:=40;
    pnlValores.Width:=574;

    pnlDatCabProf.Visible:=False;
    pnlValores.Visible:=True;
    dbgValores.SetFocus;
  end;
end;

procedure TFRegSolProfAut.Z2bbtnActpProvCaClick(Sender: TObject);
begin
  pnlDatCabProf.Visible:=False;
end;

procedure TFRegSolProfAut.BitBtn2Click(Sender: TObject);
begin
  dbgDReqs.Enabled:=True;
  pnlDatDetProf.Visible:=False;
end;

procedure TFRegSolProfAut.dbgProfProvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  {if (Key=$4D) and (ssCtrl in Shift)  then
  begin
    dbgProfProvDblClick(nil);
	end;}
  if (Key=VK_DELETE) and (ssCtrl in Shift)  then
  begin
    if trim(DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString) = 'INICIAL' then
    begin

      if not Question('Confirmar', 'Esta Seguro de Eliminar Al Proveedor '+#13+#13+
                   DMLOG.cdsPadre.FieldByName('PROV').AsString  + '  -  '+
                   DMLOG.cdspadre.FieldByName('PROVDES').AsString + #13+#13 +'de la Proforma Automatica'+#13+#13+
                   ' Desea Continuar ') then
      begin
        Exit;
      end;

      sSQL:='DELETE FROM LOG326 '+
            'WHERE CIAID='+QuotedStr(DMLOG.cdsPadre.FieldByName('CIAID').AsString)+' '+
            'AND SCCID='+QuotedStr(DMLOG.cdsPadre.FieldByName('SCCID').AsString)+' '+
            'AND PROFID='+QuotedStr(DMLOG.cdsPadre.FieldByName('PROFID').AsString);
	    Try
		    DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
	    Except
	    End;

      sSQL:='DELETE FROM LOG313 '+
            'WHERE PROFID='+QuotedStr(DMLOG.cdsPadre.FieldByName('PROFID').AsString);
	    Try
		    DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
	    Except
	    End;

      DMLOG.cdsPadre.Delete;

      DMLOG.ControlTran( 0, nil, '' );
    end
    else ErrorMsg('Error','No se puede borrar...');
  end;
	 btnDetalle;
end;

procedure TFRegSolProfAut.dbgDProfDblClick(Sender: TObject);
begin
	if trim(DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString) ='ACEPTADO' then
 	begin
  	ErrorMsg('Error', 'Sólo se Pueden Hacer Cambios Cuando la'+#13+
                     'Generación de Proforma Automatica se Halla en Modo Inicial...');
    Exit;
  end;

  if dbeNumSol.Text <> '' then
    dbcldArti.Enabled := false
  else
    dbcldArti.Enabled := true;
  OnOffDetalle(False);          // Desactivar el panel de detalle

  DMLOG.cdsHijo.Edit;
  iEstado:=1;
  if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then
  begin
    dbeItemProf.Text    := DMLOG.cdsHijo.FieldByName('DPROFID').AsString;
    dbcldArtiProf.Text  := DMLOG.cdsHijo.FieldByName('ARTID').AsString;
    dbeArtiProf.Text    := DMLOG.cdsHijo.FieldByName('DPROFOBS').AsString;
    //dbeArti.Text    := DMLOG.cdsHijo.FieldByName('DPROFARTD').AsString;//DMLOG.DisplayDescrip('prvSQL','TGE205','ARTDES','ARTID='+quotedStr(dbcldArti.text),'ARTDES');
    dbeDscto.Text   := Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFDSCTO').AsFloat]));
    dbeImporte.Text := Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFIMP').AsFloat]));
    dbeImpInd.Text  := Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFIMPU').AsFloat]));
    dbeISC.text     := Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFISC').AsFloat]));
  end
  else
  begin
    dbeItem1.Text    := DMLOG.cdsHijo.FieldByName('DPROFID').AsString;
    //edtCant.Text		 := Trim(Format('%8.1f',[DMLOG.cdsHijo.FieldByName('DPROFCNTG').AsFloat]));
    dbeDscto1.Text   := Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFDSCTO').AsFloat]));
    dbeImporte1.Text := Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFIMP').AsFloat]));
    dbeImpInd1.Text  := Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFIMPU').AsFloat]));
    dbeISC1.text     := Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFISC').AsFloat]));
    edtActSer.Text   := DMLOG.cdsHijo.FieldByName('ARTID').AsString;
    DBMemo1.Text     := DMLOG.cdsHijo.FieldByName('DPROFOBS').AsString;
  end;

  if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then
  begin
    if DMLOG.cdsHijo.FieldByName('DPROFLAGUM').AsString = 'G' then
    begin
      dbcbFLAGProf.Text := 'G';
      dbeCntG.Text  := Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFCNTG').AsFloat]));
      dbePUnitG.Text:= Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFPUNG').AsFloat]));
      //sSQL := 'UNMID='+QuotedStr(DMLOG.cdsArti.FieldByName('UNMIDG').AsString);
      //dblcUNMID.Text:= DMLOG.DisplayDescrip('prvUMed','TGE130','*',sSQL,'UNMDES');
    end
    else
    begin
      dbcbFLAGProf.Text := 'U';
      dbeCntG.Text  := Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFCNTU').AsFloat]));
      dbePUnitG.Text:= Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFPUNU').AsFloat]));
      //sSQL := 'UNMID='+quotedStr(DMLOG.cdsArti.FieldByName('UNMIDU').AsString);
      //dblcUNMID.Text:= DMLOG.DisplayDescrip('prvUMed','TGE130','*',sSQL,'UNMDES');
      //edtUMedDes.Text :=
    end;
  end
  else
  begin
    if DMLOG.cdsHijo.FieldByName('DPROFLAGUM').AsString = 'G' then
    begin
      dbcbFLAG1.Text := 'G';
      edtCant.Text  := Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFCNTG').AsFloat]));
      dbePUnitG1.Text:= Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFPUNG').AsFloat]));
    end
    else
    begin
      dbcbFLAG1.Text := 'U';
      edtCant.Text  := Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFCNTU').AsFloat]));
      dbePUnitG1.Text:= Trim(Format('%8.4f',[DMLOG.cdsHijo.FieldByName('DPROFPUNU').AsFloat]));
    end;
  end;

  if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then		// Articulos
  begin
    if dbcbFLAGProf.Text='G' then
       dblcUNMID.DataField := 'UNMIDG'
    else
       dblcUNMID.DataField := 'UNMIDU';

    pnlPrecioArt.Height:=281;
    pnlPrecioArt.Left:=186;
    pnlPrecioArt.Top:=18;
    pnlPrecioArt.Visible := True;  // Activar el panel de Mantenimiento
  end
  else				// Servicio - Activo Fijo
  begin
    if dbcbFLAG1.Text='G' then
    dblcUNMID1.DataField := 'UNMIDG'
    else
    dblcUNMID1.DataField := 'UNMIDU';

    pnlPrecioSer.Height:=229;
    pnlPrecioSer.Left:=192;
    pnlPrecioSer.Top:=36;
    pnlPrecioSer.Visible := True;  // Activar el panel de Mantenimiento
  end;

  if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then
  begin
    if dbcbFLAGProf.Text = 'G' then
      dblcUNMIDProf.Text  := DMLOG.cdsHijo.FieldByName('UNMIDG').AsString
    else
      dblcUNMIDProf.Text  := DMLOG.cdsHijo.FieldByName('UNMIDU').AsString;
    edtUMedDes.Text := DMLOG.DisplayDescrip('prvSQL','TGE130','UNMDES','UNMID='+quotedStr(dblcUNMIDProf.text),'UNMDES');
    dbePUnitG.Setfocus;
  end
  else			// Servicio - Activo Fijo
  begin
    if dbcbFLAG1.Text = 'G' then
      dblcUNMID1.Text  := DMLOG.cdsHijo.FieldByName('UNMIDG').AsString
    else
      dblcUNMID1.Text  := DMLOG.cdsHijo.FieldByName('UNMIDU').AsString;
    edtUMedDes1.Text := DMLOG.DisplayDescrip('prvSQL','TGE130','UNMDES','UNMID='+quotedStr(dblcUNMID1.text),'UNMDES');
    dbePUnitG1.SetFocus;
  end;
  btnDetalle;
end;

procedure TFRegSolProfAut.Z2bbtnCanProfClick(Sender: TObject);
begin
	if DMLOG.cdsHijo.State in [dsInsert,dsEdit] then
 		DMLOG.cdsHijo.Cancel;
	OnOffDetalle(True); // activar detalle
 	if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then
    pnlPrecioArt.Visible := False
 	else
    pnlPrecioSer.Visible := False;
end;

procedure TFRegSolProfAut.dbcldArtiProfExit(Sender: TObject);
begin
  sSQL := 'ARTID=' + quotedStr(dbcldArti.Text)+' AND CIAID=' + quotedStr(dblcCIA.Text);
  if DMLOG.displayDescrip('prvSQL','TGE205','ARTCONT',sSQL,'ARTCONT') = '1' then
  begin
    dbcbFLAG.Enabled := False;
    dblcUNMID.Enabled := false;
  end
  else
  begin
    dbcbFLAG.Enabled := true;
    dblcUNMID.Enabled := true;
  end;
  dblcUNMID.Text := DMLOG.DisplayDescrip('prvSQL','TGE130','UNMDES',sSQL,'UNMDES');
end;

procedure TFRegSolProfAut.dblcUNMIDProfExit(Sender: TObject);
begin
  edtUMedDes.Text := DMLOG.DisplayDescrip('prvSQL','TGE130','UNMDES','UNMID='+quotedStr(dblcUNMID.text),'UNMDES');
end;

procedure TFRegSolProfAut.dbePUnitGExit(Sender: TObject);
var
 rTC,rTd,rTi,rTs,rimporte,rtotal : double;
begin
	if Trim(dbeCntG.text) = ''   then dbeCntG.text := '0';
	if Trim(dbePUnitG.text) = '' then dbePUnitG.text := '0';
	if Trim(dbeDscto.text) = ''  then dbeDscto.text  := '0';
	if Trim(dbeImpInd.text) = '' then dbeImpInd.text := '0';
	if Trim(dbeISC.text) = ''    then dbeISC.text    := '0';

	rTc := StrToFloat(Trim(dbeCntG.text))*StrToFloat(Trim(dbePUnitG.text));
	rimporte := rTc;                                      // 100
	rTd := ((rimporte * strToFloat(dbeDscto.text)) /100); // 10
	rimporte := rimporte - rtd;                           // 100 - 10 = 90
	rTi := (rimporte * strToFloat(dbeImpInd.text)) /100;  // 16.2
	rTs := (rimporte * strToFloat(dbeISC.text)) /100;     // 10
	rtotal := rimporte + rTi + rTs;

  //dbePUnit.Text := Format('%0.4f', [DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsCurrency]  );

	dbeImporte.text := Format('%0.4f', [rtotal]);
end;

procedure TFRegSolProfAut.Z2bbtnActProfOkClick(Sender: TObject);
var
  sCIAID,sPROFID, sARTID, xCampo  : String;
  bExiste        : Boolean;
begin
  sCIAID  := DMLOG.cdsHijo.FieldByName('CIAID').AsString;
  sPROFID  := DMLOG.cdsHijo.FieldByName('PROFID').AsString;

  if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then
  begin
    if trim(dbePUnitG.Text) = '' then
    begin
      ErrorMsg('Adquisiciones', ' La Cantidad no puede estar en blanco ');
      dbePUnitG.SetFocus;
      Exit;
    end;
    if strtofloat(dbePUnitG.Text) <= 0 then
    begin
      ErrorMsg('Adquisiciones', ' La Cantidad tiene ser mayor a cero ');
      dbePUnitG.SetFocus;
      Exit;
    end;

    sARTID  := dbcldArtiProf.Text;
    if iEstado = 0 then
      bExiste := DMLOG.cdsHijo.Locate ('CIAID;PROFID;ARTID',VarArrayOf([sCIAID,sPROFID,sARTID]),[])
    else
      bExiste := False;
    if bExiste then // localizar el valor....
    begin
      ErrorMsg( 'Error','No pueden Existir Artículos Duplicados'+#13+
                'en un Detalle de Registro de Proformas ');
      Exit;     // salir del procedimiento
    end;
  end
  else
  begin
    if trim(dbePUnitG1.Text) = '' then
    begin
      ErrorMsg('Adquisiciones', ' La Cantidad no puede estar en blanco ');
      dbePUnitG1.SetFocus;
      Exit;
    end;
    if strtofloat(dbePUnitG1.Text) <= 0 then
    begin
      ErrorMsg('Adquisiciones', ' La cantidad tiene ser mayor a cero ');
      dbePUnitG1.SetFocus;
      Exit;
    end;
  end;

 { Guardar los datos del detalle }
 if iEstado=0 then
    DMLOG.cdsHijo.Insert
 else
    DMLOG.cdsHijo.Edit;

 if DMLOG.cdsHijo.State in [dsInsert,dsEdit] then
 begin
 	try
    if dbcbFLAGProf.Text='G' then
       xCampo := 'UNMIDG'
    else
       xCampo := 'UNMIDU';

    if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then
    begin
     DMLOG.cdsHijo.FieldByName('DPROFID').AsString   := dbeItemProf.Text;
     DMLOG.cdsHijo.FieldByName('ARTID').AsString     := dbcldArtiProf.Text;
     DMLOG.cdsHijo.FieldByName('DPROFOBS').AsString  := dbeArtiProf.Text;
     DMLOG.cdsHijo.FieldByName('DPROFDSCTO').AsString:= dbeDscto.Text;
     DMLOG.cdsHijo.FieldByName('DPROFIMP').AsString  := dbeImporte.Text;
     DMLOG.cdsHijo.FieldByName('DPROFIMPU').AsString := dbeImpInd.Text;
     DMLOG.cdsHijo.FieldByName(xCampo).AsString      := dblcUNMID.Text;//DMLOG.cdsUMed.FieldByName('UNMID').AsString;
    end
    else
    begin
     DMLOG.cdsHijo.FieldByName(xCampo).AsString      := dblcUNMID1.Text; //DMLOG.cdsUMed.FieldByName('UNMID').AsString;
     DMLOG.cdsHijo.FieldByName('DPROFID').AsString   := dbeItem1.Text;
     DMLOG.cdsHijo.FieldByName('ARTID').AsString     := edtActSer.Text;
     DMLOG.cdsHijo.FieldByName('DPROFDSCTO').AsString:= dbeDscto1.Text;
     DMLOG.cdsHijo.FieldByName('DPROFIMP').AsString  := dbeImporte1.Text;
     DMLOG.cdsHijo.FieldByName('DPROFIMPU').AsString := dbeImpInd1.Text;
     DMLOG.cdsHijo.FieldByName('DPROFOBS').AsString  := DBMemo1.Text;
    end;

    DMLOG.cdsHijo.FieldByName('DPROFLAGUM').AsString := dbcbFLAGProf.Text;

    if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then
    begin
     if dbcbFLAGProf.Text = 'G' then
     begin
       //DMLOG.cdsDProforma.FieldByName('UNMIDG').AsString     := DMLOG.cdsArti.FieldByName('UNMIDG').AsString;// dbeUMedG.Text;
       //DMLOG.cdsHijo.FieldByName('DPROFCNTG').AsString  := dbeCntG.Text;
       DMLOG.cdsHijo.FieldByName('DPROFPUNG').AsString  := dbePUnitG.Text;
     end
     else
     begin
       //DMLOG.cdsDProforma.FieldByName('UNMIDU').AsString     := DMLOG.cdsArti.FieldByName('UNMIDU').AsString;//dbeUMedU.Text;
       //DMLOG.cdsHijo.FieldByName('DPROFCNTU').AsString  := dbeCntG.Text;
       DMLOG.cdsHijo.FieldByName('DPROFPUNU').AsString  := dbePUnitG.Text;
     end;
    end
    else
    begin
     if dbcbFLAG.Text = 'G' then
     begin
       DMLOG.cdsHijo.FieldByName('DPROFCNTG').AsString  := edtCant.Text;//'1';
       DMLOG.cdsHijo.FieldByName('DPROFPUNG').AsString  := dbePUnitG1.Text;
     end
     else
     begin
       DMLOG.cdsHijo.FieldByName('DPROFCNTU').AsString  := edtCant.Text;//'1';
       DMLOG.cdsHijo.FieldByName('DPROFPUNU').AsString  := dbePUnitG1.Text;
     end;
    end;
    DMLOG.cdsHijo.Post;
    OnOffDetalle(True); // activar detalle

    if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then
      pnlPrecioArt.Visible := False
    else
      pnlPrecioSer.Visible := False;
    btnDetalle;
    CalTotal (nil);

    DMLOG.ControlTran( 0, nil, '' );    
    except
       on E: Exception do EHandlerError( E );
    end;
    //Z2btnDesc.Enabled := True;
 end;
end;

procedure TFRegSolProfAut.CalTotal(Sender: TObject);
var
	rTs,rTC, rTt, rTD, rTi, rTf,rdd   : double;
	xPrecio : double;
begin
	rTC := 0; rTt:= 0; rTD:= 0; rTi:= 0;rTf:= 0;rTs:= 0; rdd:= 0;
  Exit;
	DMLOG.cdsDProforma.First;
	while not DMLOG.cdsDProforma.Eof do
	begin
		if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then
		begin
			xPrecio := DMLOG.cdsDProforma.FieldByName('DPROFPUNG').asFloat;
			rTc := rTc + DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsFloat * xPrecio;
		end
		else
		begin
			xPrecio := DMLOG.cdsDProforma.fieldbyname('DPROFPUNG').asFloat;
			rTc := rTc + xPrecio  * DMLOG.cdsDProforma.fieldbyname('DPROFCNTG').asFloat;
		end;

		//rTf := StrToFloat(dbeFlete.Text);
		rTf := StrToFloat('0');
		if DMLOG.cdsDProforma.FieldByName('DPROFDSCTO').AsFloat <> 0 then
		begin
			rdd := ((DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsFloat * xPrecio) * DMLOG.cdsDProforma.FieldByName('DPROFDSCTO').AsFloat)/100;
			rTd := rTd +((DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsFloat * xPrecio) * DMLOG.cdsDProforma.FieldByName('DPROFDSCTO').AsFloat)/100;
		end;
		if (DMLOG.cdsDProforma.FieldByName('DPROFIMPU').AsFloat <> 0) and (DMLOG.cdsDProforma.FieldByName('DPROFDSCTO').AsFloat = 0) then
			rTi := rTi +((DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsFloat * xPrecio) * DMLOG.cdsDProforma.FieldByName('DPROFIMPU').AsFloat)/100
		else
			rTi := rTi +(((DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsFloat * xPrecio) - rdd) * DMLOG.cdsDProforma.FieldByName('DPROFIMPU').AsFloat)/100;

		if (DMLOG.cdsDProforma.FieldByName('DPROFISC').AsFloat <> 0) and (DMLOG.cdsDProforma.FieldByName('DPROFDSCTO').AsFloat = 0) then
			rTs := rTs +((DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsFloat * xPrecio) * DMLOG.cdsDProforma.FieldByName('DPROFISC').AsFloat)/100
		else
			rTs := rTs +(((DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsFloat * xPrecio) - rdd) * DMLOG.cdsDProforma.FieldByName('DPROFISC').AsFloat)/100;
		DMLOG.cdsDProforma.Next;
	end;
	rTt:=(rTC+rTf+rTi+rTs)-rTd;

	DMLOG.cdsProforma.Edit;
	DMLOG.cdsProforma.FieldByName('PROFIXTCC').AsFloat  := FRound(rTC,15,4);
	DMLOG.cdsProforma.FieldByName('PROFTTIMPU').AsFloat := FRound(rTi,15,4);
	DMLOG.cdsProforma.FieldByName('PROFISC').AsFloat    := FRound(rTs,15,4);
	DMLOG.cdsProforma.FieldByName('PROFIXTD').AsFloat   := FRound(rTD,15,4);
	DMLOG.cdsProforma.FieldByName('PROFTOTALG').AsFloat := FRound(rTt,15,4);
	DMLOG.cdsProforma.post;
end;

procedure TFRegSolProfAut.dbeFleteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key In [' ', 'a'..'z', 'A'..'Z',
             '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
             '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
             ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
             '.', '-', '_'] Then
    Key := #0;
end;

procedure TFRegSolProfAut.BitBtn4Click(Sender: TObject);
begin
	//DMLOG.ControlTran( 9, DMLOG.cdsValEva, '');
	DMLOG.cdsValEva.ApplyUpdates(0);
  ShowMessage(' Registro Grabado ');
	pnlValores.Visible:=False;  
end;

procedure TFRegSolProfAut.Z2bbtnSalirClick(Sender: TObject);
begin
	pnlValores.Visible:=False;
end;

procedure TFRegSolProfAut.Z2bbtnVisEvaProfClick(Sender: TObject);
begin
  sSQL:='SELECT LOG326.* FROM LOG326, LOG101 '+
        'WHERE CIAID='+QuotedStr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString)+' '+
        'AND SCCID='+QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString)+' '+
        'AND PROFID='+QuotedStr(DMLOG.cdsPadre.FieldByName('PROFID').AsString)+' '+
				'AND LOG326.CCOCODID=LOG101.CCOCODID '+
				'AND LOG101.FLAG=''C''';
  DMLOG.cdsValEva.Close;
  DMLOG.cdsValEva.DataRequest(sSQL);
  DMLOG.cdsValEva.Open;
  AsignaValoresNoEditables;

  pnlValores.Height:=285;
  pnlValores.Left:=110;
  pnlValores.Top:=40;
  pnlValores.Width:=574;

	pnlValores.Visible:=True;
	dbgValores.SetFocus;
end;

procedure TFRegSolProfAut.Z2bbtnPrintCuadroClick(Sender: TObject);
var
  x10 : Integer;
begin
  Screen.Cursor:=crHourGlass;
  sSQL:='SELECT A.*, B.*, C.SCCOBS, C.SCCFREG, D.TIPADQDES, E.CIADES, F.CCOMERDES '+
        'FROM LOG313 A, LOG312 B, LOG302 C, TGE173 D, TGE101 E, CXC101 F '+
        'WHERE A.CIAID=B.CIAID '+
        'AND A.SCCID=B.SCCID '+
        'AND A.PROFID=B.PROFID '+
        'AND A.CIAID=C.CIAID '+
        'AND A.SCCID=C.SCCID '+
        'AND A.TIPOADQ=D.TIPOADQ '+
        'AND A.CIAID=E.CIAID '+
        'AND C.CIAID=F.CIAID '+
        'AND C.FPAGOID=F.CCOMERID '+
        'AND A.CIAID='+QuotedStr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString)+' '+
        'AND A.SCCID='+QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString)+' '+
        'ORDER BY A.ARTID, A.PROFID';

  DMLOG.cdsReporte.Close;
  DMLOG.cdsReporte.DataRequest(sSQL);
  DMLOG.cdsReporte.Open;

	if DMLOG.cdsReporte.RecordCount = 0 then
	begin
    Screen.Cursor:=crDefault;
		Information('Modulo de Compras','No Existe Información a Mostrar');
		Exit;
	end;

	ppData.DataSource := DMLOG.dsReporte;
  ppReporte.DataPipeline:=ppData;
  ppReporte.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\CuadroCompa.rtm';
  ppReporte.Template.LoadFromFile;
  Screen.Cursor:=crDefault;
  //ppDiseno.Show;
  ppReporte.Print;
  Screen.Cursor:=crHourGlass;
  ppReporte.Stop;

  x10:=Self.ComponentCount-1;
  while x10>=0 do
  begin
  	if Self.Components[ x10 ].ClassName='TppGroup' then
    begin
    	Self.Components[ x10 ].Free ;
    end;
    x10:=x10-1;
	end;
  Screen.Cursor:=crDefault;
	ppData.DataSource := Nil;
  ppReporte.DataPipeline:=nIL;
end;

procedure TFRegSolProfAut.ppReportePreviewFormCreate(Sender: TObject);
begin
	ppReporte.PreviewForm.ClientHeight := 500;
	ppReporte.PreviewForm.ClientWidth := 650;
	tppviewer(ppReporte.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFRegSolProfAut.AsignaValoresNoEditables;
var sTipoEval:string;
begin
  DMLOG.cdsValEva.First;
  while not DMLOG.cdsValEva.EOF do
  begin
    sTipoEval:=DMLOG.DisplayDescrip('prvSQL','LOG101','TIPOEVAL','CCOCODID='+QuotedStr(DMLOG.cdsValEva.FieldByName('CCOCODID').AsString),'TIPOEVAL');
    if sTipoEval='CC' then  // CONDICION COMERCIAL
    begin
      DMLOG.cdsValEva.Edit;
      try
        DMLOG.cdsValEva.FieldByName('VALOR').AsFloat:=StrToFloat(DMLOG.DisplayDescrip('prvSQL','CXC101','PESOEVALLOG',
                             'CIAID='+QuotedStr(dblcCIA.text)+' AND CCOMERID='+QuotedStr(DMLOG.cdsPadre.FieldByName('PROFCONCOM').AsString),'PESOEVALLOG'));
      except
        DMLOG.cdsValEva.FieldByName('VALOR').AsFloat:=0;
      end;
      DMLOG.cdsValEva.Post;
    end;
    if sTipoEval='TE' then  // Tiempo de Entrega
    begin
      DMLOG.cdsValEva.Edit;
      try
        DMLOG.cdsValEva.FieldByName('VALOR').AsFloat:=dbdtpFEntrega.Date-DMLOG.cdsPadre.FieldByName('PROFENTR').AsDateTime;
      except
        DMLOG.cdsValEva.FieldByName('VALOR').AsFloat:=0;
      end;
      DMLOG.cdsValEva.Post;
    end;

    if sTipoEval='GA' then  // Garantia en Dias
    begin
      DMLOG.cdsValEva.Edit;
      try
        DMLOG.cdsValEva.FieldByName('VALOR').AsFloat:=DMLOG.cdsPadre.FieldByName('PROFGARAN').AsFloat;
      except
        DMLOG.cdsValEva.FieldByName('VALOR').AsFloat:=0;
      end;
      DMLOG.cdsValEva.Post;
    end;

    DMLOG.cdsValEva.Next;
  end;
end;

procedure TFRegSolProfAut.dbgValoresCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Field.FieldName  = 'VALOR' then
  begin
     DMLOG.DisplayDescrip('prvSQL','LOG101','EDITABLE,TIPOEVAL','CCOCODID='+QuotedStr(DMLOG.cdsValEva.FieldByName('CCOCODID').AsString),'TIPOEVAL');
     if (DMLOG.cdsQry.FieldByName('EDITABLE').AsString<>'S') then
     begin
        ABrush.Color:=clYellow;
        AFont.Color:=clBlue;
     end
     else
     begin
        ABrush.Color:=clAqua;
        AFont.Color:=clBlack;
     end;
  end;
end;

procedure TFRegSolProfAut.dbeValorEnter(Sender: TObject);
begin
  DMLOG.DisplayDescrip('prvSQL','LOG101','EDITABLE,TIPOEVAL','CCOCODID='+QuotedStr(DMLOG.cdsValEva.FieldByName('CCOCODID').AsString),'TIPOEVAL');

   if (DMLOG.cdsQry.FieldByName('EDITABLE').AsString<>'S') then //CONDICION COMERCIAL
   begin
     dbeValor.ReadOnly:=True;
   end
   else
     dbeValor.ReadOnly:=False;
end;

function TFRegSolProfAut.wPreUni: integer;
var
	wConta : Integer;
   xSQL:string;
begin
	wConta := 0;
  xSQL:='SELECT * FROM LOG313 '+
        'WHERE CIAID='+QuotedStr(dblcCIA.text)+' AND SCCID='+QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString);

  DMLOG.cdsHijo.Close;
  DMLOG.cdsHijo.DataRequest(xSQL);
  DMLOG.cdsHijo.Open;

  DMLOG.cdsHijo.DisableControls;
  DMLOG.cdsHijo.First;
  while not DMLOG.cdsHijo.Eof do
  begin
    if DMLOG.cdsHijo.FieldByName('DPROFPUNG').AsFloat = 0.0 then
    	wConta:=wConta+1;
  	DMLOG.cdsHijo.Next;
  end;
  DMLOG.cdsHijo.First;
  DMLOG.cdsHijo.EnableControls;
  //if wConta > 0 then
  //	ErrorMsg('Adquisiciones', ' Al menos uno de los Campos de Precio Unitario esta en Blanco '+#13+#13+
  //                'Verifique !!! ');
	Result:= wConta;
end;

procedure TFRegSolProfAut.FormShow(Sender: TObject);
var
	xSQL : String;
begin
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
	dbeTSolCot.Text  :='';
	dbePRIO.Text     :='';
	dbeComprador.Text:='';
	dbeTMoneda.Text  :='';
	dbeLEntrega.Text :='';
	dbeFPago.Text    :='';
	dbeTipSol.text   := '';
   pnlDatDetProf.Visible:=False;
   pnlDatCabProf.Visible:=False;
   pgcControl.ActivePage:=tbsArt;

	wIGV := DMLOG.displaydescrip('prvSQL','TGE108','TASACAN','TASAFLG=''I''','TASACAN');

   NumAnoSol := copy(DMLOG.DisplayDescrip('prvTGE','oaREGLAS','VRN_NUMCORANO','VRN_MODULO=''LOG''','VRN_NUMCORANO'),3,1);

   NumAnoPro := copy(DMLOG.DisplayDescrip('prvTGE','oaREGLAS','VRN_NUMCORANO','VRN_MODULO=''LOG''','VRN_NUMCORANO'),4,1);

	if DMLOG.cdsSolCot.State in [dsInsert] then
		dcCIA;
	if DMLOG.cdsSolCot.State in [dsEdit] then
	begin
		xSQL := 'TIPOADQ=' + QuotedStr(dblcTipSol.Text);
		dbeTipSol.Text := DMLOG.DisplayDescrip('prvSQL','TGE173','TIPADQDES',xSQL,'TIPADQDES');

		xSql := 'TSCID='''+dblcTSolCot.Text+'''';
		dbeTSolCot.Text := DMLOG.DisplayDescrip('prvSQL','TGE137','TSCDES',xSql,'TSCDES');

		xSql := 'PRIOID=' + QuotedStr(dblcPRIO.Text);
		dbePRIO.Text := DMLOG.DisplayDescrip('prvSQL','TGE155','PRIODES',xsql,'PRIODES');

		xsql := 'COMPCID=' + QuotedStr(dblcComprador.Text);
		dbeComprador.Text := DMLOG.DisplayDescrip('prvSQL','TGE135','COMPDES',xsql,'COMPDES');

		xsql := 'TMONID=' + QuotedStr(dblcTMoneda.Text);
		dbeTMoneda.Text := DMLOG.DisplayDescrip('prvSQL','TGE103','TMONDES',xsql,'TMONDES');

		xsql := 'LGECID=' + QuotedStr(dblcLEntrega.Text);
		dbeLEntrega.Text := DMLOG.DisplayDescrip('prvSQL','TGE136','LGECDES',xsql,'LGECDES');

		xsql := 'CCOMERID=' + QuotedStr(dblcFPago.Text)+' AND CIAID='''+dblcCIA.Text+'''';
		dbeFPago.Text := DMLOG.DisplayDescrip('prvSQL','CXC101','CCOMERDES',xsql,'CCOMERDES');
	end;
	xSql:='CIAID='''+dblcCIA.Text+'''';
	dbeCIA.Text:=DMLOG.DisplayDescrip('prvSQL','TGE101','CIADES',xSql,'CIADES');

	DMLOG.cdsFPago.Close;
	DMLOG.cdsFPago.DataRequest('SELECT * FROM CXC101 WHERE CIAID='''+dblcCIA.Text+'''');
	DMLOG.cdsFPago.Open;

	bExit :=False;
	OnOffCabecera(True); //Activar la cabecera
	OnOffDetalle(False); //Desactivar el panel de detalle
	if DMLOG.wModo='M' then
	begin
		dblcTipSol.Enabled:=False;
		dblcTSolCot.Enabled:=False;
		dbdtpFSolicitud.Enabled:=False;
		dblcComprador.Enabled:=False;
		dblcFPago.Enabled:=False;

		btnDetalle;
	end
	else
	if DMLOG.wModo='A' then
	begin
		dblcTipSol.Enabled:=True;
		dblcTSolCot.Enabled:=True;
		dbdtpFSolicitud.Enabled:=True;
      dbdtpFSolicitud.Date;
      DMLOG.cdsSolCot.fieldbyname('SCCFSOL').AsDateTime:=dbdtpFSolicitud.Date;
		dblcComprador.Enabled:=True;
		dblcFPago.Enabled:=True;
	end;
end;

procedure TFRegSolProfAut.FormCreate(Sender: TObject);
begin
   DMLOG.FiltraTabla( DMLOG.cdsCia, 'TGE101', 'CIAID',  'CIAID');
end;

procedure TFRegSolProfAut.dbeNumSolExit(Sender: TObject);
var
   xSQL : String;
begin
	if Z2bbtnBorrar.Focused then Exit;

   xSQL := 'select SCCID from LOG302 where CIAID='+quotedstr(dblcCIA.Text)
          +' and SCCID='+quotedstr(dbeNumSol.Text);
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   if DMLOG.cdsQry.recordcount>0 then
   begin
      ShowMessage('Número de Solicitud ya fue usado');
      dbeNumSol.SetFocus;
      exit;
   end;
end;

END.


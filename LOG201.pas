unit LOG201;
//*********************************************************
// MODIFICADO POR        : Abelardo Sulca Palomino
// Nº HPP                : HPP_201103_LOG
// FECHA DE MODIFICACION : 19/04/2011
// DESCRIPCION           : Se implementa la funcionalidad que permite visar la requisición
//                         al mismo usuario que registró y aceptó. sólo se habilitará
//                         el botón de visado si el usuario tiene el acceso a visar
//*********************************************************
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,
  wwdbdatetimepicker, DBCtrls, db, wwSpeedButton, wwDBNavigator, Grids,
  Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, wwclient, Wwdotdot, Wwdbcomb,
  ppDB, ppDBPipe, ppCtrls, ppBands, ppStrtch, ppMemo, ppViewr, 
  ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppVar,
  ppEndUsr, Variants, ppTypes;

type
  TFRegReqs = class(TForm)
     pnlCabecera: TPanel;
    dblcCIA: TwwDBLookupCombo;
    Z2bbtnOK: TBitBtn;
    Z2bbtnBorrar: TBitBtn;
    dbeNumRqs: TwwDBEdit;
    dbeSolic: TwwDBEdit;
    dblcdCCos: TwwDBLookupComboDlg;
    dbdtpFReqs: TwwDBDateTimePicker;
    dbdtpFAnten: TwwDBDateTimePicker;
    dbeAtorizado: TwwDBEdit;
    dbeAprobado: TwwDBEdit;
    dbmObs: TDBMemo;
    pnlDetalleG: TPanel;
    stxTitulo1: TStaticText;
    dbgDReqs: TwwDBGrid;
	  pnlDetalleA: TPanel;
    stxTitulo2: TStaticText;
    pnlEstado: TPanel;
    Label4: TLabel;
    Bevel1: TBevel;
    Z2dbgDReqsIButton: TwwIButton;
    edtInsTec: TwwDBEdit;
    pnlBotones: TPanel;
    Z2bbtnRegresa: TBitBtn;
    Z2bbtnCanc2: TBitBtn;
    Z2bbtnGraba: TBitBtn;
    Z2bbtnAnula: TBitBtn;
    Z2bbtnAcepta: TBitBtn;
    Z2bbtnNuevo: TBitBtn;
    btxtEstado: TDBText;
    dblcPRIO: TwwDBLookupCombo;
    dblcLOC: TwwDBLookupCombo;
    dblcObra: TwwDBLookupCombo;
    dbePrior: TwwDBEdit;
    Z2bbtnRegOk: TBitBtn;
    Z2bbtnRegCanc: TBitBtn;
    pnlDetalleB: TPanel;
    Z2bbtnRegOk2: TBitBtn;
    Z2bbtnRegCanc2: TBitBtn;
    dbeItem1: TwwDBEdit;
    dbeItem: TwwDBEdit;
    dbcldArti: TwwDBLookupComboDlg;
    dbeCNTS: TwwDBEdit;
	 dbeCNTA: TwwDBEdit;
    dblcUNMID: TwwDBLookupCombo;
    dbcbFLAG: TwwDBComboBox;
    edtARTDES: TEdit;
    stxTitulo3: TStaticText;
    dblcTRqs: TwwDBLookupCombo;
    dblcTipoCompra: TwwDBLookupCombo;
    dbeCant: TwwDBEdit;
    dblcUnMed: TwwDBLookupCombo;
    edtUNMID: TEdit;
    edtTipoCompra: TEdit;
    dbeTRqs: TEdit;
    edtUMedReq: TEdit;
    lblTexto: TLabel;
    Z2bbtnPrint: TBitBtn;
    pprOCPE: TppReport;
    ppDBCab: TppDBPipeline;
    ppdbOC: TppDBPipeline;
    edtLoc: TEdit;
    edtCia: TEdit;
    edtObra: TEdit;
    dbmObservacion: TMemo;
    lblTipPre: TLabel;
    dblcTipPre: TwwDBLookupCombo;
    lblPresu: TLabel;
    dblcdPresup: TwwDBLookupComboDlg;
    dbeTipPre: TwwDBEdit;
    edtPresup: TEdit;
    pnlActualizando: TPanel;
	 lblActualizando: TLabel;
    lblObra: TLabel;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    dbeCCostos: TEdit;
    ppHeaderBand4: TppHeaderBand;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel1: TppLabel;
    ppLine4: TppLine;
    ppLabel12: TppLabel;
    ppLine5: TppLine;
    ppShape9: TppShape;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDBText58: TppDBText;
    ppDBText8: TppDBText;
    ppLabel2: TppLabel;
    ppDBText5: TppDBText;
    ppLabel9: TppLabel;
    ppDBText1: TppDBText;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    ppLabel10: TppLabel;
    ppDBText70: TppDBText;
    ppDetailBand4: TppDetailBand;
    ppDBText60: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText4: TppDBText;
    ppdbtConsumo: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppLine3: TppLine;
    ppLabel6: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine6: TppLine;
    ppLabel3: TppLabel;
    ppDBMemo2: TppDBMemo;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    ppDesigner1: TppDesigner;
    pnlVisador: TPanel;
    Label5: TLabel;
    DBText1: TDBText;
    pnlComprador: TPanel;
    lblComprador: TLabel;
    Label6: TLabel;
    dblcComprador: TwwDBLookupCombo;
    dbeComprador: TwwDBEdit;
    Z2bbtnVisado: TBitBtn;
    dbeNOCompra: TwwDBEdit;
    procedure Z2bbtnOKClick(Sender: TObject);
    procedure Z2bbtnBorrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
	 procedure FormClose(Sender: TObject; var Action: TCloseAction);
{27/07/2000 se quito el control
		procedure dblcUMedChange(Sender: TObject);}
	 procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
	 procedure dblcExist(Sender: TObject);
	 procedure dbeNumRqsExit(Sender: TObject);
    procedure dbdtpFReqsExit(Sender: TObject);
    procedure dblcTipoCompraExit(Sender: TObject);
    procedure dblcdCCosExit(Sender: TObject);
    procedure dblcTRqsExit(Sender: TObject);
    procedure dbcldArtiExit(Sender: TObject);
    procedure dbcbFLAGExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z2bbtnPrintClick(Sender: TObject);
    procedure dblcPRIOExit(Sender: TObject);
    procedure pprOCPEPreviewFormCreate(Sender: TObject);
    procedure dblcTipPreExit(Sender: TObject);
    procedure dblcdPresupExit(Sender: TObject);
    procedure dbeNumRqsKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Z2bbtnVisadoClick(Sender: TObject);
    procedure dblcCompradorExit(Sender: TObject);
    procedure dbeNOCompraExit(Sender: TObject);
  private
		{ Private declarations }
		iEstado  : Integer;  // 0 En Insercion, 1 Edicion
		sTipoRQS : string; // Solo tiene tres valores Requisicion x (C)ompras (S)ervicios (A)ctivos Fijos
		xPresu : String; //'S' = si tiene presupuesto, N = no tiene presupuesto

		procedure dcCIA;
		procedure dcLOC;
		procedure dcNUM;
		procedure AsigDat;
		procedure btnDetalle;
		procedure OnOffDetalle ( Value : Boolean );
		procedure OnOffCabecera( Value : Boolean );
    //INICIO HPP_201103_LOG
    procedure OnOffVisar( Value : Boolean );
    //FIN HPP_201103_LOG
		//procedure cSetFocus ( Sender: TObject ; const sMsg : String);
		function EHandlerError(Ex : Exception ) : Boolean;
		//function ValidaCantidad(VCantidad : string) : Bool;
		procedure ConsumoPro(pArtid,pCiaId,pUnidad : string);
      procedure ConsumoTotal(pArtid,pCiaId,pUnidad : string);
	public
		{ Public declarations }
		xValorX : String;
		xReqAut : String;
		xReqLec : String;
		procedure ppReportRQS(sCIA, sLOC, sRQS : String);
	end;

var
	FRegReqs: TFRegReqs;
	vunmid : string;
	xPriInser : String;
	SQLFiltro : String;
	xOrdElim, wSQL : String;
	Punt : TBookmark;
	xTotal : Double;

implementation

uses LOGDM1, oaAD3050;

{$R *.DFM}

procedure TFRegReqs.Z2bbtnOKClick(Sender: TObject);
var
	xPasa : Integer;
	sSQL : String;
begin
	xPasa:=0;

	DMLOG.DisplayDescrip('prvSQL','TGE203','CCOSDES, '+DMLOG.wReplacCeros+'(CCOSMOV,''N'') CCOSMOV','CCOSID='+quotedStr(dblcdCCos.text),'CCOSDES');
   if DMLOG.cdsQry.FieldByName('CCOSMOV').ASString = 'N' then
   begin
  	   dbeCCostos.Text := '';
  	   ShowMessage(' Sólo puede Seleccionar un Código de C. Costo de Último Nivel ');
  	   Exit;
   end;

   if (wActuaPresu)  and (xPresu = 'N') then
   begin
      ShowMessage(' No tiene Presupuesto, Usted no puede Continuar ');
      Exit;
   end;

   if xPriInser ='A' then
   begin
      if not DMLOG.cdsReqs.FieldByName('CIAID').IsNull then
      begin
    	   if DMLOG.IsExistRqsM( DMLOG.cdsReqs.FieldByName('CIAID').AsString,
                          DMLOG.cdsReqs.FieldByName('LOCID').AsString,
                          DMLOG.cdsReqs.FieldByName('RQSID').AsString ) then
         begin
      	   xPasa:=1;
         end
         else
      	   xPasa:=0;
      end
      else
      begin
    	   ShowMessage('Debe Ingresar la Compañía ..... ');
         Exit;
      end;
   end;

   if xPasa = 1 then
   begin
      if MessageDlg('Ya existe la Requisición con el Nº  '+ dbeNumRqs.Text  + #13
                   +'Desea volver a Generar el Nuevo Nº de la Requisición y Continuar ',
                   mtConfirmation, [mbYes, mbNo], 0 )=mrYes then
      begin
    	   dcNUM;
			xPasa:=0;
		end;
	end;
	if xPasa = 1 then
	begin
		Exit;
	end;
	Screen.Cursor:=crHourGlass;
	if DMLOG.cdsReqs.State in [dsInsert,dsEdit] then
	begin
		AsigDat; // asignar los datos predeterminados
		if Length(trim(dbmObs.text)) = 0 then
			DMLOG.cdsReqs.fieldbyname('RQSOBS').AsString := '.';
		DMLOG.cdsReqs.Post;

		SQLFiltro:= 'SELECT * FROM LOG308 '+
								'WHERE CIAID='''+dblcCIA.Text+''' '+
								'AND LOCID='''+dblcLOC.Text+''' '+
								'AND RQSID='''+dbeNumRqs.Text+'''';
		DMLOG.cdsReqs.DataRequest( SQLFiltro ) ;

		sSQL:='SELECT * FROM LOG309 '+
				  'WHERE CIAID='''+dblcCIA.Text+''' '+
				  'AND LOCID='''+dblcLOC.Text  +''' '+
          'AND RQSID='''+dbeNumRqs.Text+''' '+
          'ORDER BY CIAID, LOCID, RQSID, DRQSID';


		DMLOG.cdsDReqs.DisableControls;
		DMLOG.cdsDReqs.Close;
		DMLOG.cdsDReqs.DataRequest(sSQL);
		DMLOG.cdsDReqs.Open;
		DMLOG.cdsDReqs.EnableControls;

      sSQL:='SELECT * FROM TGE205 A '+
            'WHERE A.CIAID= '''+dblcCIA.Text+'''';
      DMLOG.cdsArti.Close;
      DMLOG.cdsArti.DataRequest(sSQL);
      DMLOG.cdsArti.Open;

		xPriInser:='';

		DMLOG.ControlTran( 9, DMLOG.cdsReqs, 'REQS' );

		if DMLOG.wModo = 'A' then
		begin
			xOrdElim:=DMLOG.cdsReqs.FieldbyName('RQSID').AsString;		// Si no graba podre borrar
		end;
	end
	else
		sTipoRQS := DMLOG.cdsReqs.FieldByName('TIPOADQ').AsString;

	OnOffCabecera(False); //Desactivar el panel de Cabecera
	OnOffDetalle(True);   //Activar el panel de detalle
	btnDetalle;
	Z2dbgDReqsIButton.Enabled:= ( trim(DMLOG.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL' );
	Screen.Cursor:=crDefault;
	if xReqAut = 'S' then
	begin
		Screen.Cursor:=crHourGlass;
		DMLOG.cdsReqAut.First;
		while not DMLOG.cdsReqAut.Eof do
		begin
			DMLOG.cdsDReqs.Insert;
			DMLOG.cdsDReqs.FieldByName('DRQSID').AsString    := DMLOG.StrZero( DMLOG.MaxValue( 'DRQSID', DMLOG.cdsDReqs ),3);
			DMLOG.cdsDReqs.FieldByName('CIAID').AsString     := dblcCIA.Text;
			DMLOG.cdsDReqs.FieldByName('RQSID').AsString     := dbeNumRqs.Text;
			DMLOG.cdsDReqs.FieldByName('LOCID').AsString     := dblcLOC.Text;
			DMLOG.cdsDReqs.FieldByName('ARTID').AsString     := DMLOG.cdsReqAut.FieldByName('ARTID').AsString;
			DMLOG.cdsDReqs.FieldByName('UNMIDG').AsString    := DMLOG.cdsReqAut.FieldByName('UNMIDG').AsString;
			DMLOG.cdsDReqs.FieldByName('RQSFLAGUM').AsString := 'G';
			DMLOG.cdsDReqs.FieldByName('TIPOADQ').asString   := dblcTipoCompra.Text;
			DMLOG.cdsDReqs.FieldByName('RQSFREG').AsDateTime := DMLOG.cdsReqs.FieldByName('RQSFREG').AsDateTime;
			DMLOG.cdsDReqs.FieldByName('RQSFATE').AsDateTime := DMLOG.cdsReqs.FieldByName('RQSFATE').AsDateTime;
			DMLOG.cdsDReqs.FieldByName('PRIOID').AsString    := DMLOG.cdsReqs.FieldByName('PRIOID').AsString;
			DMLOG.cdsDReqs.FieldByName('RQSEST').AsString    := DMLOG.cdsReqs.FieldByName('RQSEST').AsString;
			DMLOG.cdsDReqs.FieldByName('TRQSID').AsString    := dblcTRqs.Text;
			DMLOG.cdsDReqs.FieldByName('DRQSCNSG').AsFloat   := DMLOG.cdsReqAut.FieldByName('STKSCPE').AsFloat;
			DMLOG.cdsDReqs.FieldByName('DRQSCNSU').AsFloat   := 0;
			DMLOG.cdsDReqs.FieldByName('DRQSCNAG').AsFloat   := DMLOG.cdsReqAut.FieldByName('STKSCPE').AsFloat;
			DMLOG.cdsDReqs.FieldByName('DRQSCNAU').AsFloat   := 0;
			DMLOG.cdsDReqs.FieldByName('DRQSOBS').asString   := DMLOG.cdsReqAut.FieldByName('ARTDES').AsString;
			DMLOG.cdsDReqs.Post;
			DMLOG.cdsReqAut.Next;
		end;
		Screen.Cursor:=crDefault;
		Exit;
  end;
	Screen.Cursor:=crDefault;
	if DMLOG.wModo = 'A' then
		Z2dbgDReqsIButton.Click;
end;

procedure TFRegReqs.Z2bbtnBorrarClick(Sender: TObject);
begin
  DMLOG.cdsReqs.CancelUpdates;
  if DMLOG.wModo='A' then
  begin
    DMLOG.cdsReqs.Insert;
		//FormCreate(nil);
		//OnOffCabecera(True);
		//OnOffDetalle(False);
		//DMLOG.cdsDReqs.CancelUpdates;
	end;
	//FormShow(Sender);
end;

procedure TFRegReqs.AsigDat;
var
	D, M, Y : Word;
	sFecha, sSQL : String;
begin
	// --> Asignar datos de cabecera de requisición
	if DMLOG.cdsReqs.State in [dsInsert, dsEdit] then
	begin
		if Length(dblcCia.Text)=0   			then raise Exception.Create('Falta Registrar Compañía...');
		if Length(dblcLOC.Text)=0   			then raise Exception.Create('Falta Registrar Localidad...');
		if Length(dbeNumRqs.Text)=0				then raise Exception.Create('Falta Registrar No.Requisición...');
		if Length(dblcTipoCompra.Text)=0 	then raise Exception.Create('Falta Registrar Tipo de Compra...');
		if dbdtpFReqs.Date=0        			then raise Exception.Create('Falta Registrar Fecha de Requisición...');
		if Length(dblcPRIO.Text)=0  			then raise Exception.Create('Falta Registrar Prioridad...');
		if dbdtpFAnten.Date=0       			then raise Exception.Create('Falta Registrar Fecha de Requisición...');
		if Length(dblcTRqs.Text)=0  			then raise Exception.Create('Falta Registrar Tipo Requisición...');
		if dbdtpFReqs.Date>dbdtpFAnten.date then raise Exception.Create('La Fecha de Atención debe ser mayor'+#13+' a la Fecha de Requisición...');
		if trim(dbeCCostos.Text)='' 			then raise Exception.Create('Falta Registrar Centro de Costo...');

		DecodeDate(dbdtpFReqs.Date, Y, M, D);
		if Length(Trim(DMLOG.cdsReqs.FieldbyName('RQSOBS').AsString)) = 0 then
			DMLOG.cdsReqs.FieldbyName('RQSOBS').AsString := '.';

		if DMLOG.cdsReqs.State in [dsInsert] then
    begin
			DMLOG.cdsReqs.FieldbyName('RQSEST').AsString := 'INICIAL';
      sFecha := formatdatetime(DMLOG.wFormatFecha, Date);
      sSQL := 'SELECT * FROM TGE114 WHERE FECHA='+quotedstr(sFecha);
      DMLOG.FiltraCDS(DMLOG.cdsPeriodo, sSQL);
      DMLOG.cdsReqs.FieldbyName('RQSANO').AsString    := IntToStr(Y);
      DMLOG.cdsReqs.FieldbyName('RQSMM').AsString     := DMLOG.strzero(IntToStr(M),2);
      DMLOG.cdsReqs.FieldbyName('RQSDD').AsString     := DMLOG.strzero(IntToStr(D),2);
      DMLOG.cdsReqs.FieldbyName('RQSTRI').AsString    := DMLOG.cdsPeriodo.fieldbyName('FECTRIM').asString;
      DMLOG.cdsReqs.FieldbyName('RQSSEM').AsString    := DMLOG.cdsPeriodo.fieldbyName('FECSEM').asString;
      DMLOG.cdsReqs.FieldbyName('RQSANOMM').AsString  := IntToStr(Y)+DMLOG.strzero(IntToStr(M),2);
      DMLOG.cdsReqs.FieldbyName('RQSSS').AsString     := DMLOG.cdsPeriodo.fieldbyName('FECSS').asString;
      DMLOG.cdsReqs.FieldbyName('RQSAATRI').AsString  := DMLOG.cdsPeriodo.fieldbyName('FECAATRI').asString;
      DMLOG.cdsReqs.FieldbyName('RQSAASEM').AsString  := DMLOG.cdsPeriodo.fieldbyName('FECAASEM').asString;
      DMLOG.cdsReqs.FieldbyName('RQSAASS').AsString   := DMLOG.cdsPeriodo.fieldbyName('FECAASS').asString;

      DMLOG.cdsReqs.FieldbyName('RQSUSER').AsString   := DMLOG.wUsuario;
      DMLOG.cdsReqs.FieldbyName('RQSFREG').AsDateTime := Date;
      DMLOG.cdsReqs.FieldbyName('RQSHREG').AsDateTime := SysUtils.Time;
    end;

		sTipoRQS := DMLOG.DisplayDescrip('prvSQL','TGE142','TIPOADQ','TRQSID='+quotedStr(dblcTRqs.text), 'TIPOADQ');
    DMLOG.cdsReqs.FieldbyName('TIPOADQ').asString := dblcTipoCompra.text;//sTipoRQS;
  end;
end;

procedure TFRegReqs.FormCreate(Sender: TObject);
//var
	//sSQL : string;
begin
  dblcdCCos.OnNotInList := dblcNotInList;
  OnOffCabecera(True); //Activar la cabecera
  OnOffDetalle(False); //Desactivar el panel de detalle
   if DMLOG.cdsCia.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsCia,'TGE101','CIAID','CIAID');
   dblcCIA.LookupTable:= DMLOG.cdsCia;

   if DMLOG.cdsCia.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsLoc,'TGE126','LOCID','LOCID');
   dblcLOC.LookupTable:= DMLOG.cdsLoc;

   if DMLOG.cdsTipSol.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsTipSol,'TGE173','TIPOADQ','TIPOADQ');
   dblcTipoCompra.LookupTable:= DMLOG.cdsTipSol;

   if DMLOG.cdsTRqs.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsTRqs,'TGE142','TRQSID','TRQSID');
   dblcTRqs.LookupTable:= DMLOG.cdsTRqs;

   if DMLOG.cdsPRIO.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsPrio,     'TGE155', 'PRIOID', 'PRIOID');
   dblcPRIO.LookupTable:= DMLOG.cdsPRIO;

   if DMLOG.cdsCCost.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsCCost,    'TGE203', 'CCOSID', 'CCOSID');
   dblcdCCos.LookupTable:= DMLOG.cdsCCost;

   if DMLOG.cdsObra.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsObra,'TGE213','OBRAID','OBRAID');
   dblcObra.LookupTable:= DMLOG.cdsObra;

   if DMLOG.cdsTipPre.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsTipPre,'PPRES101','TIPPRESID','TIPPRESID');
   dblcTipPre.LookupTable:= DMLOG.cdsTipPre;
{
   if DMLOG.cdsParPre.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsParPre,'PPRES201','PARPRESID','PARPRESID');
}
   dblcdPresup.LookupTable:= DMLOG.cdsParPre;

   if DMLOG.cdsUMed.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsUMed,'TGE130','UNMID','UNMID');
   dblcUnMed.LookupTable:= DMLOG.cdsUMed;
   dblcUNMID.LookupTable:= DMLOG.cdsUMed;
{
   if DMLOG.cdsArti.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsArti,'TGE205','ARTID','ARTID');
}
   dbcldArti.LookupTable:= DMLOG.cdsArti;
end;

procedure TFRegReqs.Z2bbtnRegresaClick(Sender: TObject);
begin
	if DMLOG.cdsDReqs.RecordCount = 0 then
	begin
		dblcdCCos.Enabled:=True;
		dblcPRIO.Enabled:=True;
      dblcTipoCompra.Enabled:=True;
	end
	else
	begin
		dblcdCCos.Enabled:=False;
		dblcPRIO.Enabled:=False;
      dblcTipoCompra.Enabled:=False;
	end;
	DMLOG.dsReqs.Edit;
  DMLOG.wModo := 'M';
  OnOffCabecera(True);
  OnOffDetalle(False);
end;

procedure TFRegReqs.Z2bbtnGrabaClick(Sender: TObject);
begin
	try
      Screen.Cursor:=crHourGlass;
      //DMLOG.ControlTran;
      DMLOG.ControlTran( 9, DMLOG.cdsDReqs, 'DREQS' ); //AplicaDatos([cdsReqs,cdsDReqs]);
      btnDetalle;
      DMLOG.wModo := '';
      xOrdElim:='';		// Si graba YA NO podre borrar
      Z2bbtnGraba.Enabled  := False;


  finally
      Screen.Cursor:=crDefault;
  end;
end;

procedure TFRegReqs.Z2bbtnCanc2Click(Sender: TObject);
begin
  DMLOG.cdsDReqs.CancelUpdates;
	if (DMLOG.wModo='A') and
     (trim(DMLOG.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL') and
     (DMLOG.cdsReqs.FieldbyName('RQSVISADOR').IsNull) and
     (Length(Trim(xOrdElim)) > 0 ) then
  begin
		DMLOG.cdsDReqs.First;
		while not DMLOG.cdsDReqs.Eof do
			DMLOG.cdsDReqs.Delete;
		//sSQL:='DELETE FROM LOG309 WHERE RQSID='''+xOrdElim+'''';
		//DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
		DMLOG.cdsReqs.Delete;
		//DMLOG.ControlTran;
		DMLOG.ControlTran( 9, DMLOG.cdsReqs, 'REQS' ); //AplicaDatos([cdsReqs,cdsDReqs]);
		DMLOG.ControlTran( 9, DMLOG.cdsDReqs, 'DREQS' ); //AplicaDatos([cdsReqs,cdsDReqs]);
		DMLOG.wModo := '';
	end;
  OnOffCabecera(True);
  OnOffDetalle(False);
  Close;
end;

procedure TFRegReqs.Z2bbtnAceptaClick(Sender: TObject);
begin
	if (trim(DMLOG.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL') and
		 (DMLOG.cdsDReqs.RecordCount>0)  then // inicial...
	begin
		if MessageDlg('¿Esta Seguro de Aceptar La Requisición '
                            +DMLOG.cdsReqs.FieldByName('RQSID').AsString+'?',
                   mtConfirmation, [mbYes, mbNo], 0 )=mrNo then
		begin
			Exit;
		end;
		try
			Screen.Cursor:=crHourGlass;
			if DMLOG.cdsReqs.State in [dsBrowse] then
			begin
				DMLOG.cdsReqs.Edit;
				DMLOG.cdsReqs.FieldbyName('RQSEST').AsString := 'ACEPTADO';
				DMLOG.cdsReqs.FieldByName('RQSACEPFREG').AsDateTime := Date;

				if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
					DMLOG.cdsReqs.FieldByName('RQSACEPHREG').AsDateTime:= SysUtils.Time
				else
				if SRV_D = 'ORACLE' then
					DMLOG.cdsReqs.FieldByName('RQSACEPHREG').AsDateTime:= Date+SysUtils.Time;

				DMLOG.cdsReqs.Post;

				DMLOG.cdsReqs.DataRequest('SELECT * FROM LOG308 WHERE CIAID='''+ dblcCIA.Text+''' AND LOCID='''+dblcLOC.Text+''' AND RQSID='''+dbeNumRqs.Text+'''');

				DMLOG.cdsDReqs.First;
				while not DMLOG.cdsDReqs.Eof do
				begin
					DMLOG.cdsDReqs.Edit;
					DMLOG.cdsDReqs.FieldbyName('RQSEST').AsString := 'ACEPTADO';
					DMLOG.cdsDReqs.Post;
					DMLOG.cdsDReqs.Next;
				end;
				//DMLOG.ControlTran;
				DMLOG.ControlTran( 9, DMLOG.cdsReqs, 'REQS' );
				DMLOG.ControlTran( 9, DMLOG.cdsDReqs, 'DREQS' );

            if DMLOG.wTipoAdicion='xFiltro' then
            begin
               DMLOG.ActualizaFiltro(Mtx3050,DMLOG.cdsReqs,DMLOG.wModo);
            end;
            
            Z2dbgDReqsIButton.enabled:=False;
				//DMLOG.cdsReqs.ApplyUpdates(0);
				//DMLOG.cdsDReqs.ApplyUpdates(0);
         //INICIO HPP_201103_LOG
         OnOffVisar(True);
         //FIN HPP_201103_LOG
      end;
		finally
    	Screen.Cursor:=crDefault;
    end;
  end;
  btnDetalle;
end;

{Function  TFRegReqs.wPreUni : integer;
var
	wConta : Integer;
begin
	wConta := 0;
  DMLOG.cdsDReqs.DisableControls;
  DMLOG.cdsDReqs.First;
  while not DMLOG.cdsDReqs.Eof do
  begin
    if DMLOG.cdsDReqs.FieldByName('DPROFPUNG').AsFloat = 0.0 then
    	wConta:=wConta+1;
  	DMLOG.cdsDReqs.Next;
  end;
  DMLOG.cdsDReqs.First;
  DMLOG.cdsDReqs.EnableControls;
  if wConta > 0 then
  	ErrorMsg('Adquisiciones', ' Al menos uno de los Campos de Precio Unitario esta en Blanco '+#13+#13+
                  'Verifique !!! ');
	Result:= wConta;
end;}

procedure TFRegReqs.Z2bbtnAnulaClick(Sender: TObject);
begin
	if (trim(DMLOG.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL') and
		 (DMLOG.cdsDReqs.RecordCount>0)  then
	begin
		if DMLOG.cdsReqs.State in [dsBrowse] then
		begin
			 DMLOG.cdsReqs.Edit;
			 DMLOG.cdsReqs.FieldbyName('RQSEST').AsString := 'ANULADO';
			 DMLOG.cdsReqs.Post;
		end;
		DMLOG.cdsDReqs.First;
		while not DMLOG.cdsDReqs.Eof do
		begin
			DMLOG.cdsDReqs.Edit;
			DMLOG.cdsDReqs.FieldbyName('RQSEST').AsString := 'ANULADO';
			DMLOG.cdsDReqs.Post;
			DMLOG.cdsDReqs.Next;
		end;
		//DMLOG.ControlTran;
		DMLOG.ControlTran( 9, DMLOG.cdsReqs, 'REQS');
		DMLOG.ControlTran( 9, DMLOG.cdsDReqs,'DREQS');

      if DMLOG.wTipoAdicion='xFiltro' then
      begin
         DMLOG.ActualizaFiltro(Mtx3050,DMLOG.cdsReqs,'M');
      end;
		//DMLOG.cdsReqs.ApplyUpdates(0);
	end;
  btnDetalle;
end;

procedure TFRegReqs.Z2dbgDReqsIButtonClick(Sender: TObject);
var
	sMax : string;
begin
	Screen.Cursor:=crHourGlass;
	edtUNMID.Text:='';
	dbcbFLAG.Text:='';
	dblcUNMID.Text:='';
	edtUMedReq.Text:='';
	dbeCNTS.Text:='';
	iEstado := 0;
	vunmid := '';
	pnlBotones.Enabled := False;

	sMax := DMLOG.StrZero( DMLOG.MaxValue( 'DRQSID', DMLOG.cdsDReqs ),3);

	if (sTipoRQS = 'S') or (sTipoRQS = 'A')  then
	begin
		dbmObservacion.Clear;
		pnlDetalleB.Visible := True;
		dbeItem1.Text := sMax;
		if sTipoRQS = 'S' then
		begin
			stxTitulo3.caption := 'Detalle de Requisición x Servicios';
			lblTexto.Caption:=' Servicio ';
			dbeCant.Text:='1';
			dblcUnMed.Text:='';
			dblcUnMed.Text:=DMLOG.DisplayDescrip('prvSQL', 'TGE130', 'UNMID', 'UNMSERV=''S''', 'UNMID');
			edtUNMID.Text:=DMLOG.DisplayDescrip('prvSQL', 'TGE130', 'UNMDES', 'UNMID='''+dblcUnMed.Text+'''', 'UNMDES');
			dbmObservacion.SetFocus;
		end
		else
		begin
			stxTitulo3.caption := 'Detalle de Requisición x Compra de Activo Fijo';
			lblTexto.Caption:=' Activo Fijo ';
			dbeCant.Text:='1';
			dblcUnMed.Text:='';
			dblcUnMed.Text:=DMLOG.DisplayDescrip('prvSQL', 'TGE130', 'UNMID', 'UNMSERV=''S''', 'UNMID');
			edtUNMID.Text:=DMLOG.DisplayDescrip('prvSQL', 'TGE130', 'UNMDES', 'UNMID='''+dblcUnMed.Text+'''', 'UNMDES');
			dbeCant.Enabled:=true;
			dbeCant.SetFocus;
		 end;
	end
	else
	if (sTipoRQS = 'C') then
	begin
		dbeItem.Text:=sMax;
		dbcbFLAG.Text:= 'G';
		pnlDetalleA.Visible := True;
    dbcldArti.Enabled:=True;
		dbcldArti.SetFocus;
    dbeCNTS.Enabled:=True;
		dbeItem.Text:= sMax;
		dbeCNTS.text := '';
		dbeCNTA.text := '';
		dbcldArti.text := '';
		edtARTDES.text := '';
		dblcUNMID.text := '';
		dbcbFLAG.Value := '';
	end;
	OnOffDetalle(False);
	dbgDReqs.Enabled:=False;
	Screen.Cursor:=crDefault;	
end;

procedure TFRegReqs.Z2bbtnRegOkClick(Sender: TObject);
var
  sCIAID, sRQSID, sARTID, sALMID, sLOCID : String;
  bExiste        : Boolean;  
begin
  dbgDReqs.Enabled:=True;
  if DMLOG.cdsReqs.FieldbyName('RQSEST').AsString <> 'INICIAL' then
  begin
  	if (sTipoRQS = 'S') or (sTipoRQS = 'A') then
    begin
    	dbeCant.Enabled:=True;
      dblcUnMed.Enabled:=True;
    	pnlDetalleB.Visible := False;
    end
   	else
    begin
    	dbcldArti.Enabled:=true;
      dblcUNMID.Enabled:=true;
      dbcbFLAG.Enabled:=true;
      dbeCNTS.Enabled:=true;
    	pnlDetalleA.Visible := False;
    end;
		ShowMessage(' Sin Modificar ');
		Exit;
	end;

	if sTipoRQS = 'C' then
	begin
		if trim(edtARTDES.Text) = '' then
		begin
			ShowMessage(' Artículo no Existe ');
			dbcldArti.SetFocus;
			Exit;
		end;
		if trim(dbeCNTS.Text) = '' then
		begin
			ShowMessage(' La cantidad no puede estar en blanco ');
			dbeCNTS.SetFocus;
			Exit;
		end;
		if strtofloat(dbeCNTS.Text) <= 0 then
		begin
			ShowMessage(' La cantidad tiene que ser mayor a cero ');
			dbeCNTS.SetFocus;
			Exit;
		end;
	end
	else				// Servicio - Activo Fijo
	begin
		if trim(dblcUnMed.Text) = ''  then
		begin
			ShowMessage('La unidad de medida no puede estar en blanco');
			dblcUnMed.SetFocus;
			Exit;
		end;
		if trim(dbeCant.Text) = '' then
		begin
			ShowMessage('La Cantidad no puede estar en blanco');
			dbeCant.SetFocus;
			Exit;
		end;
		if strtofloat(dbeCant.Text) <= 0 then
		begin
			ShowMessage('La Cantidad tiene que ser mayor a cero');
			dbeCant.SetFocus;
			Exit;
		end;

		if trim(dbmObservacion.Text) = '' then
		begin
			if sTipoRQS = 'S' then
				ShowMessage('No existe Información para el servicio a prestar ');
			if sTipoRQS = 'A' then
				ShowMessage('No existe Información para el Activo Fijo ');
			dbmObservacion.SetFocus;
			Exit;
		end;
	end;
	sCIAID := DMLOG.cdsReqs.FieldByName('CIAID').AsString;
	sRQSID := DMLOG.cdsReqs.FieldByName('RQSID').AsString;
	sLOCID := DMLOG.cdsReqs.FieldByName('LOCID').AsString;
	sALMID := DMLOG.cdsReqs.FieldByName('ALMID').AsString;
	sARTID := dbcldArti.Text;
	if sTipoRQS = 'C' then
	begin

		if iEstado=0 then
			bExiste := DMLOG.cdsDReqs.Locate ('CIAID;RQSID;ARTID',VarArrayOf([sCIAID,sRQSID,sARTID]),[])
		else
			bExiste := False;
		if bExiste then
		begin
			 ShowMessage('No pueden existir artículos duplicados'+#13+
													'en un detalle de Registro de Requisición ');
			 Exit;
		end;

		if dbcldArti.Text='' then
		begin
			ShowMessage('El Código del Artículo es Obligatorio.....');
			dbcldArti.SetFocus;
			Exit;
		end;
		if Length(dbeCntS.Text)=0 then
		begin
			ShowMessage('La Cantidad pedida debe ser mayor que cero...');
			Exit;
		end;
		if StrToFloat(dbeCntS.Text) <= 0 then
		begin
			ShowMessage('La Cantidad pedida debe ser mayor que cero...');
			DMLOG.cdsDReqs.Cancel;
			Exit;
		end;
	end;
	{Guardar los datos del detalle }
	if (iEstado=0) and (DMLOG.cdsDReqs.state <> dsInsert) then
		DMLOG.cdsDReqs.Insert
	else
		if (iEstado=1) and (DMLOG.cdsDReqs.state <> dsEdit) then
			DMLOG.cdsDReqs.Edit;

	if DMLOG.cdsDReqs.State in [dsInsert,dsEdit] then
	begin
		try
			DMLOG.cdsDReqs.FieldByName('CIAID').AsString       := dblcCIA.Text;
			DMLOG.cdsDReqs.FieldByName('RQSID').AsString       := dbeNumRqs.Text;
			DMLOG.cdsDReqs.FieldByName('LOCID').AsString       := dblcLOC.Text;
			DMLOG.cdsDReqs.FieldByName('CCOSID').AsString      := dblcdCCos.Text;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			if sTipoRQS = 'C' then
			begin
				DMLOG.cdsDReqs.FieldByName('ARTID').AsString     := dbcldArti.Text;

				wSQL:='CIAID='+QuotedStr(dblcCIA.Text)+' AND ARTID='+QuotedStr(DMLOG.cdsDReqs.FieldByName('ARTID').AsString);
				DMLOG.DisplayDescrip('prvSQL', 'TGE205', 'ARTID, TINID, GRARID, FAMID, SFAMID', wSQL, 'ARTID');

				DMLOG.cdsDReqs.FieldByName('TINID').AsString     := DMLOG.cdsQry.FieldByName('TINID').AsString;
				DMLOG.cdsDReqs.FieldByName('GRARID').AsString    := DMLOG.cdsQry.FieldByName('GRARID').AsString;
				DMLOG.cdsDReqs.FieldByName('FAMID').AsString     := DMLOG.cdsQry.FieldByName('FAMID').AsString;
				DMLOG.cdsDReqs.FieldByName('SFAMID').AsString    := DMLOG.cdsQry.FieldByName('SFAMID').AsString;
			end
			else
			if (sTipoRQS = 'A')  or (sTipoRQS = 'S') then
				DMLOG.cdsDReqs.FieldByName('ARTID').AsString     := dbeItem1.Text;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			DMLOG.cdsDReqs.FieldByName('RQSFLAGUM').AsString   := dbcbFLAG.text;
			if sTipoRQS <> 'C' then
				DMLOG.cdsDReqs.FieldByName('RQSFLAGUM').AsString :='G';
			{ La información se guardará en los campos G. o U. dependiendo del Flag}
			if sTipoRQS = 'C' then
			begin
				if  DMLOG.cdsDReqs.FieldByName('RQSFLAGUM').AsString = 'G' then
				begin
					DMLOG.cdsDReqs.FieldByName('DRQSID').AsString  := dbeItem.Text;
					DMLOG.cdsDReqs.FieldByName('UNMIDG').AsString  := dblcUNMID.Text;//vunmid;
					DMLOG.cdsDReqs.FieldByName('DRQSCNSG').AsString:= dbeCntS.Text;
					DMLOG.cdsDReqs.FieldByName('DRQSCNAG').AsString:= dbeCntA.Text;
          // VHNDEMA NUEVO CAMPO
					DMLOG.cdsDReqs.FieldByName('CANREQORI').AsString:= dbeCntS.Text;
          // VHNDEMA
				end
				else
				begin
					DMLOG.cdsDReqs.FieldByName('DRQSID').AsString  := dbeItem.Text;
					DMLOG.cdsDReqs.FieldByName('UNMIDU').AsString  := dblcUNMID.Text;//vunmid;
					DMLOG.cdsDReqs.FieldByName('DRQSCNSU').AsString:= dbeCntS.Text;
					DMLOG.cdsDReqs.FieldByName('DRQSCNAU').AsString:= dbeCntA.Text;
				end;
			end
			else
			begin                // Henry
				DMLOG.cdsDReqs.FieldByName('DRQSID').AsString    := dbeItem1.Text;
				DMLOG.cdsDReqs.FieldByName('UNMIDG').AsString    := dblcUnMed.Text;//vunmid;
				DMLOG.cdsDReqs.FieldByName('DRQSCNSG').AsString  := dbeCant.Text;
				//DMLOG.cdsDReqs.FieldByName('DRQSCNAG').AsString:= dbeCntA.Text;
			end;

			DMLOG.cdsDReqs.FieldByName('TIPOADQ').asString := sTipoRQS;
			// ------------------ Igualar los valores de la Requisición --------------------
			DMLOG.cdsDReqs.FieldByName('RQSFREG').AsDateTime   := DMLOG.cdsReqs.FieldByName('RQSFREG').AsDateTime;
			DMLOG.cdsDReqs.FieldByName('RQSFATE').AsDateTime   := DMLOG.cdsReqs.FieldByName('RQSFATE').AsDateTime;
			DMLOG.cdsDReqs.FieldByName('PRIOID').AsString      := DMLOG.cdsReqs.FieldByName('PRIOID').AsString;
			DMLOG.cdsDReqs.FieldByName('RQSEST').AsString      := DMLOG.cdsReqs.FieldByName('RQSEST').AsString;
			DMLOG.cdsDReqs.FieldByName('TRQSID').AsString      := DMLOG.cdsReqs.FieldByName('TRQSID').AsString;
			if DMLOG.cdsDReqs.FieldByName('DRQSCNSG').IsNull then DMLOG.cdsDReqs.FieldByName('DRQSCNSG').AsFloat := 0;
			if DMLOG.cdsDReqs.FieldByName('DRQSCNSU').IsNull then DMLOG.cdsDReqs.FieldByName('DRQSCNSU').AsFloat := 0;
			if DMLOG.cdsDReqs.FieldByName('DRQSCNAG').IsNull then DMLOG.cdsDReqs.FieldByName('DRQSCNAG').AsFloat := 0;
			if DMLOG.cdsDReqs.FieldByName('DRQSCNAU').IsNull then DMLOG.cdsDReqs.FieldByName('DRQSCNAU').AsFloat := 0;
      
      // VHNDEMA
			if DMLOG.cdsDReqs.FieldByName('CANREQORI').IsNull then DMLOG.cdsDReqs.FieldByName('CANREQORI').AsFloat := 0;
      // END VHNDEMA

			if sTipoRQS = 'C' then
				DMLOG.cdsDReqs.FieldByName('DRQSOBS').asString   := edtARTDES.Text
			else
				DMLOG.cdsDReqs.FieldByName('DRQSOBS').asString   := dbmObservacion.Text;

			DMLOG.cdsDReqs.FieldbyName('RQSANO').AsString      := DMLOG.cdsReqs.FieldbyName('RQSANO').AsString;
			DMLOG.cdsDReqs.FieldbyName('RQSMES').AsString      := DMLOG.cdsReqs.FieldbyName('RQSMM').AsString;
			DMLOG.cdsDReqs.FieldbyName('RQSDIA').AsString      := DMLOG.cdsReqs.FieldbyName('RQSDD').AsString;
			DMLOG.cdsDReqs.FieldbyName('RQSTRIM').AsString     := DMLOG.cdsReqs.FieldbyName('RQSTRI').AsString;
			DMLOG.cdsDReqs.FieldbyName('RQSSEM').AsString      := DMLOG.cdsReqs.FieldbyName('RQSSEM').AsString;
			DMLOG.cdsDReqs.FieldbyName('RQSANOMES').AsString   := DMLOG.cdsReqs.FieldbyName('RQSANOMM').AsString;
			DMLOG.cdsDReqs.FieldbyName('RQSSS').AsString       := DMLOG.cdsReqs.FieldbyName('RQSSS').AsString;
			DMLOG.cdsDReqs.FieldbyName('RQSAATRI').AsString    := DMLOG.cdsReqs.FieldbyName('RQSAATRI').AsString;
			DMLOG.cdsDReqs.FieldbyName('RQSAASEM').AsString    := DMLOG.cdsReqs.FieldbyName('RQSAASEM').AsString;
			DMLOG.cdsDReqs.FieldbyName('RQSAASS').AsString     := DMLOG.cdsReqs.FieldbyName('RQSAASS').AsString;
			DMLOG.cdsDReqs.FieldByName('RQSUSER').AsString     := DMLOG.wUsuario;

			DMLOG.cdsDReqs.Post;
			//DMLOG.ControlTran;
			OnOffDetalle(True); // activar detalle
			btnDetalle;
			Z2bbtnGraba.Enabled  := true;
		 if (iEstado=0) and (DMLOG.cdsDReqs.state <> dsInsert) then
			Z2dbgDReqsIButton.Click
		 else
			if (iEstado=1) and (DMLOG.cdsDReqs.state <> dsEdit) then
			 if (sTipoRQS = 'S') or (sTipoRQS = 'A') then
				pnlDetalleB.Visible := False
			 else
				pnlDetalleA.Visible := False;
		except
      on  E: Exception do
         if not EHandlerError( E ) then raise;
   end;
  end;
end;

procedure TFRegReqs.Z2bbtnRegCancClick(Sender: TObject);
begin
  if DMLOG.cdsDReqs.State in [dsInsert,dsEdit] then
    DMLOG.cdsDReqs.Cancel;

  OnOffDetalle(True); // activar detalle
  if (sTipoRQS = 'S') or (sTipoRQS = 'A') then
  begin
  	dbeCant.Enabled:=True;
    dblcUnMed.Enabled:=True;
  	pnlDetalleB.Visible := False;
  end
  else
  	pnlDetalleA.Visible := False;
  btnDetalle;
  pnlBotones.Enabled := True;
  Z2bbtnGraba.Enabled  := true;
  dbgDReqs.Enabled:=True;
end;

procedure TFRegReqs.OnOffCabecera(Value: Boolean);
begin
  // ----------------------  activar cabecera de requisición -------------------
  pnlCabecera.Enabled   := Value;
  Z2bbtnBorrar.Enabled  := Value;
  Z2bbtnOK.Enabled 	   := Value;
end;

procedure TFRegReqs.OnOffDetalle(Value: Boolean);
begin
  //----------------  activar detalle de requisición ---------------
  if Value then
  	stxTitulo1.Color := clHighlight
  else
  	stxTitulo1.Color := clGray;
	//  pnlBotones.Enabled   := Value;
	//  pnlDetalleG.Enabled  := Value;
  Z2bbtnRegresa.Enabled:= Value;
  Z2bbtnCanc2.Enabled  := Value;
  Z2bbtnGraba.Enabled  := Value;
  Z2bbtnAcepta.Enabled := Value;
  Z2bbtnAnula.Enabled  := Value;
	//  Z2bbtnNuevo.Enabled  := Value;
end;

procedure TFRegReqs.btnDetalle;
var
  bDummy1, bDummy2 : Boolean;
begin
	bDummy1:=((DMLOG.cdsDReqs.ChangeCount>0) or (DMLOG.cdsReqs.ChangeCount>0) or
						( DMLOG.cdsDReqs.Modified    ) or (DMLOG.cdsReqs.Modified     ) );
   bDummy2:= True;
   if trim(DMLOG.cdsReqs.FieldbyName('RQSEST').AsString) <> 'INICIAL' then
   begin
  	   OnOffCabecera(False);
      OnOffDetalle(False);
      bDummy2:=False;
   end
   else
   begin
  	   if not pnlDetalleG.Enabled then
    	   bDummy2:=False
      else
    	if trim(DMLOG.cdsReqs.FieldbyName('RQSEST').AsString)='INICIAL' then
      	bDummy2:= not bDummy1;
   end;
   Z2bbtnGraba.Enabled  := bDummy2;
   Z2bbtnAnula.Enabled  := bDummy2;
   Z2bbtnAcepta.Enabled := bDummy2;
   Z2bbtnCanc2.Enabled  := bDummy1 or bDummy2;
   Z2bbtnRegresa.Enabled:= bDummy1 or bDummy2;
end;

procedure TFRegReqs.Z2bbtnNuevoClick(Sender: TObject);
begin
	if (DMLOG.wModo='A') and
     (trim(DMLOG.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL') and
     (DMLOG.cdsReqs.FieldbyName('RQSVISADOR').IsNull) and
     (Length(Trim(xOrdElim)) > 0 ) then
  begin
		//sSQL:='DELETE FROM LOG309 WHERE RQSID='''+xOrdElim+'''';
    //DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
    DMLOG.cdsDReqs.First;
    while not DMLOG.cdsDReqs.Eof do
    	DMLOG.cdsDReqs.Delete;
    DMLOG.cdsReqs.Delete;
		//DMLOG.ControlTran;
		DMLOG.ControlTran( 9, DMLOG.cdsReqs, 'REQS' );
		DMLOG.ControlTran( 9, DMLOG.cdsDReqs, 'DREQS' );
  	DMLOG.wModo := '';
  end;
  OnOffCabecera(True);
  OnOffDetalle(False);
  //dblcCIA.Enabled  :=True;
  dbeNumRqs.Enabled:=True;
	dblcTipoCompra.Enabled:=True;
  dblcTRqs.Enabled:=True;
  
  DMLOG.cdsReqs.Insert;
	DMLOG.wModo := 'A';
  dcCIA;
  dcLOC;
//  dcALM;
  dcNUM;
  DMLOG.cdsReqs.fieldbyname('PRIOID').AsString:='M';
	if SRV_D = 'ORACLE' then
    DMLOG.cdsReqs.fieldbyname('PRIOID').AsString:='N';
  DMLOG.cdsReqs.fieldbyname('RQSFREQ').AsDateTime:=date;
  DMLOG.cdsReqs.fieldbyname('RQSFATE').AsDateTime:=date;
  DMLOG.cdsReqs.FieldByName('RQSEST').AsString := 'INICIAL';
  dbeCCostos.Text := '';
  dbeTRqs.Text := '';
  edtObra.Text := '';
  edtTipoCompra.Text := '';
  dbeTipPre.Text:='';
  edtPresup.Text:='';
  dbeNumRqs.SetFocus;
end;

procedure TFRegReqs.dbgDReqsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key=$4D) and (ssCtrl in Shift)  then  //^N
    dbgDReqsDblClick(nil);
  if (Key=VK_DELETE) and (ssCtrl in Shift)  then
  begin
    if trim(DMLOG.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL' then
		begin
			if xValorX <> 'X' then		// Este Control (xValorX) sirve para que no elimine registros cuando viene
			begin                     // de la opcion ¨ Depuracion Requisiciones Pendientes ¨ // Ojo
				if DMLOG.cdsDReqs.RecordCount > 0 then
					DMLOG.cdsDReqs.Delete;
				if DMLOG.cdsDReqs.RecordCount > 0 then
				begin
					dblcTipoCompra.Enabled:=false;
					dblcTRqs.Enabled:=false;
				end
				else
				begin
					dblcTipoCompra.Enabled:=true;
					dblcTRqs.Enabled:=true;
				end;
			end;
			//DMLOG.ControlTran; ESTABA
		end
		else
			ShowMessage('No se puede borrar...');
	end;
	btnDetalle;
   if DMLOG.cdsReqs.FieldByName('RQSEST').AsString <> 'ACEPTADO' then
	if xValorX <> 'X' then					// Este Control (xValorX) sirve para que no elimine registros cuando viene
		Z2bbtnGraba.Enabled:=True;    // de la opcion ¨ Depuracion Requisiciones Pendientes ¨ // Ojo
end;

procedure TFRegReqs.dbgDReqsDblClick(Sender: TObject);
var
  sSQL,sEST : String;
begin
 	if DMLOG.cdsDReqs.RecordCount = 0 then
  begin
  	  ShowMessage('No Existen Registros a Editar ');
    Exit;
  end;
	//if length(Trim(sTipoRQS)) = 0 then
  	//sTipoRQS := DMLOG.cdsReqs.FieldByName('TIPOADQ').asString;
  OnOffDetalle(False);          // Desactivar el panel de detalle
  iEstado := 1;

  if (sTipoRQS = 'S') or (sTipoRQS = 'A')  then
  begin
    if DMLOG.cdsDReqs.FieldByName('RQSFLAGUM').AsString = 'G' then
    begin
			dbeCant.Text := DMLOG.cdsDReqs.FieldByName('DRQSCNSG').AsString;
			dblcUnMed.text := DMLOG.cdsDReqs.FieldByName('UNMIDG').AsString;
		end
		else
		begin
			dbeCant.Text := DMLOG.cdsDReqs.FieldByName('DRQSCNSU').AsString;
			dblcUnMed.text := DMLOG.cdsDReqs.FieldByName('UNMIDU').AsString;
		end;
		dbeItem1.Text  := DMLOG.cdsDReqs.FieldByName('DRQSID').AsString;
		dbmObservacion.Text:= DMLOG.cdsDReqs.FieldByName('DRQSOBS').AsString;
		sSQL := 'UNMID=' + QuotedStr(dblcUnMed.text);
		edtUNMID.Text := DMLOG.displaydescrip('prvSQL','TGE130','UNMDES',sSQL,'UNMDES');
		dblcExist(dblcUnMed);
	end
	else
	if (sTipoRQS = 'C') then
	begin
		if DMLOG.cdsDReqs.FieldByName('RQSFLAGUM').AsString = 'G' then
		begin
			dbeCNTS.Text := DMLOG.cdsDReqs.FieldByName('DRQSCNSG').AsString;
			dbeCNTA.Text := DMLOG.cdsDReqs.FieldByName('DRQSCNAG').AsString;
			dblcUNMID.text := DMLOG.cdsDReqs.FieldByName('UNMIDG').AsString;
		end
		else
		begin
			dbeCNTS.Text := DMLOG.cdsDReqs.FieldByName('DRQSCNSU').AsString;
			dbeCNTA.Text := DMLOG.cdsDReqs.FieldByName('DRQSCNAU').AsString;
			dblcUNMID.text := DMLOG.cdsDReqs.FieldByName('UNMIDU').AsString;
		end;
		dbeItem.Text   := DMLOG.cdsDReqs.FieldByName('DRQSID').AsString;
		dbcldArti.Text:= DMLOG.cdsDReqs.FieldByName('ARTID').AsString;
		edtARTDES.Text:= DMLOG.cdsDReqs.FieldByName('DRQSOBS').AsString;
		dbcbFLAG.value := DMLOG.cdsDReqs.FieldByName('RQSFLAGUM').AsString;
		sSQL := 'UNMID=' + QuotedStr(dblcUnMed.text);
		edtUNMID.Text := DMLOG.displaydescrip('prvSQL','TGE130','UNMDES',sSQL,'UNMDES');
		dblcExist(dblcUNMID);
	end;
	sEST := trim(DMLOG.cdsReqs.FieldbyName('RQSEst').AsString);
	if sEST = 'INICIAL' then
	begin
		if (sTipoRQS = 'S') or (sTipoRQS = 'A') then
		begin
			pnlDetalleB.Visible := True;  // Activar el panel de Mantenimiento
			if sTipoRQS = 'S' then
			begin
				stxTitulo3.caption := 'Detalle de Requisición x Servicios';
				lblTexto.Caption:=' Servicio ';
				if iEstado = 0  then
					dbeCant.text := '1';  //DMLOG.cdsDReqs.fieldbyname('DRQSCNSG').AsInteger:=1;
				//dbeCant.Enabled:=false;
        //dblcEdblcUnMed.SetFocus;
      end
      else
      begin
         stxTitulo3.caption := 'Detalle de Requisición x Compra de Activo Fijo';
          lblTexto.Caption:=' Activo Fijo ';
         dbeCant.Enabled:=true;
         dbeCant.SetFocus;
      end;
    end
    else
    if (sTipoRQS = 'C') then
    begin
      sSQL := 'ARTID=' + ''''+ DMLOG.cdsDReqs.FieldByName('ARTID').AsString + '''';
      if DMLOG.displaydescrip('prvSQL','TGE205','ARTCONT',sSQL,'ARTCONT') = '1' then
      begin
        dbcbFLAG.Enabled := false;
        dblcUNMID.Enabled := false;
      end
      else
      begin
        dbcbFLAG.Enabled := true;
        dblcUNMID.Enabled := False;
      end;
    	dbcbFLAG.OnExit(Sender);
    	pnlDetalleA.Visible := True;  // Activar el panel de Mantenimiento
    end;
     DMLOG.cdsDReqs.Edit;
  end
  else
  begin
    ShowMessage('Sólo se pueden hacer cambios cuando la'+#13+
                     'Requisición se halla en modo inicial...');
    exit;
    if (sTipoRQS = 'S') or (sTipoRQS = 'A') then
    begin
      dbeCant.Enabled:=false;
      dblcUnMed.Enabled:=false;
    	pnlDetalleB.Visible := True;
    end
    else
    begin
    	dbcldArti.Enabled:=false;
 			sSQL := 'ARTID=' + quotedstr(uppercase(dbcldArti.Text)); // quotedstr(DMLOG.cdsArti.FieldByName('ARTID').AsString);
    	edtARTDES.Text := DMLOG.displaydescrip('prvSQL','TGE205','ARTDES',sSQL,'ARTDES');
      dblcUNMID.Enabled:=false;
      dbcbFLAG.Enabled:=false;
      dbeCNTS.Enabled:=false;
    	pnlDetalleA.Visible := True;
    end;
  end;

  if sEST = 'ATENDIDO' then
  begin
    dbeCntS.Color		:= clWindow;
    dbeCntA.Enabled	:= False;
  end;
  dbgDReqs.Enabled:=False;
  // btnDetalle;
end;

procedure TFRegReqs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	xValorX := '';
   if DMLOG.cdsReqs.State in [dsEdit, dsInsert] then DMLOG.cdsReqs.Cancel;
   if DMLOG.cdsDReqs.State in [dsEdit, dsInsert] then DMLOG.cdsDReqs.Cancel;
   if DMLOG.cdsReqs.ChangeCount >0 then DMLOG.cdsReqs.CancelUpdates;
   if DMLOG.cdsDReqs.ChangeCount >0 then DMLOG.cdsDReqs.CancelUpdates;
   if (DMLOG.wModo='A') and
      (trim(DMLOG.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL') and
      (DMLOG.cdsReqs.FieldbyName('RQSVISADOR').IsNull) and
      (Length(Trim(xOrdElim)) > 0 ) then
   begin
      DMLOG.cdsDReqs.First;
      while not DMLOG.cdsDReqs.Eof do
      begin
         DMLOG.cdsDReqs.Delete;
      end;
      DMLOG.cdsReqs.Delete;
         //DMLOG.ControlTran;
      DMLOG.ControlTran( 9, DMLOG.cdsReqs, 'REQS' );
      DMLOG.ControlTran( 9, DMLOG.cdsDReqs, 'DREQS' );
      DMLOG.wModo := '';
   end;
   DMLOG.cdsLoc.Close;
   DMLOG.cdsObra.Close;
   DMLOG.cdsTipSol.Close;
   DMLOG.cdsUMed.Close;

   //FVariables.w_AD_Registro := False;
   //FVariables.w_Num_Formas  := FVariables.w_Num_Formas-1;

   DMLOG.wModo := '';
   Action := CAFree;
end;

{procedure TFRegReqs.cSetFocus(Sender: TObject; const sMsg: String);
begin
  if TCustomEdit(Sender).Text='' then
  begin
    ErrorMsg('Error',sMsg);
    TCustomEdit(Sender).SetFocus;
  end;
end;}

function TFRegReqs.EHandlerError(Ex : Exception ) : Boolean;
var
	a, b   : Integer;
 	s1, s2	: string;
begin
  Result :=  true;
  if Ex.Message = 'Key violation.' then
     ShowMessage('No pueden existir registros duplicados.. ')
  else
  begin
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
       ShowMessage('El campo '+s2+' es obligatorio...  ');
    end
    else Result :=  false;
  end;
end;

procedure TFRegReqs.dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFRegReqs.dblcExist(Sender: TObject);
var
  ssql : String;
begin
  if sender = dblcCIA then
  begin
    edtCia.text := DMLOG.DisplayDescrip('prvSQL','TGE101','CIADES','CIAID='+quotedStr(dblcCIA.text),'CIADES');

    DMLOG.cdsLOC.Filtered := False;
    DMLOG.cdsLOC.Filter   := 'CIAID='''+dblcCIA.Text+'''';
    DMLOG.cdsLOC.Filtered := True;

    if wFil_Ccos = 'S' then
    begin
  		DMLOG.FiltraCDS(DMLOG.cdsCCost, 'SELECT * FROM TGE203 WHERE CCOSACT<>''N'' AND CCOSCIAS LIKE ''%'+dblcCIA.Text+'%'' ORDER BY CCOSID');// WHERE CCOSMOV=''S''');
    	//DMLOG.cdsCCost.Filtered := False;
    	//DMLOG.cdsCCost.Filter   := 'CCOSCIAS='''+dblcCIA.Text+'''';
    	//DMLOG.cdsCCost.Filtered := True;
  	end;

  	if wActuaPresu then
    begin
    	DMLOG.cdsParPre.Filtered := False;
    	DMLOG.cdsParPre.Filter   := 'CIAID='''+dblcCIA.Text+'''';
    	DMLOG.cdsParPre.Filtered := True;
    end;

		{ DMLOG.cdsALM.Filtered := False;
		DMLOG.cdsALM.Filter   := 'CIAID='''+dblcCIA.Text+''' AND LOCID='''+dblcLOC.Text+'''';
		DMLOG.cdsALM.Filtered := True;}
		dcLOC;
		//dcALM;
    dcNUM;
    exit;
  end;
  if sender = dblcLOC then
  begin
    sSQL:='CIAID='+quotedStr(dblcCIA.text)+' AND LOCID='+quotedStr(dblcLOC.text);
    edtLoc.text := DMLOG.DisplayDescrip('prvSQL','TGE126','LOCDES',sSQL,'LOCDES');
		{DMLOG.cdsALM.Filtered := False;
		DMLOG.cdsALM.Filter   := 'CIAID='''+dblcCIA.Text+''' AND LOCID='''+dblcLOC.Text+'''';
		DMLOG.cdsALM.Filtered := True;
    dcALM;}
    dcNUM;
    exit;
  end;
	if sender = dblcObra then
	begin
		sSQL:='OBRAID='+quotedStr(dblcObra.text);
		edtObra.text := DMLOG.DisplayDescrip('prvSQL','TGE213','OBRADES',sSQL,'OBRADES');
    exit;
	end;

	if sender = dblcUnMed then
	begin
    ssql := 'UNMID=' + quotedStr(dblcUnMed.Text);
    edtUNMID.text :=  DMLOG.displaydescrip('prvSQL','TGE130','UNMDES',ssql,'UNMDES');
    exit;
  end;
  if sender = dblcUNMID then
  begin
    ssql := 'UNMID=' + quotedStr(dblcUNMID.Text);
    edtUMedReq.text :=  DMLOG.displaydescrip('prvSQL','TGE130','UNMDES',ssql,'UNMDES');
  	if dblcUNMID.Text <> '' then
   		vunmid := dblcUNMID.Text//vunmid;
  	else
    	vunmid := '';
    exit;
  end;
end;

procedure TFRegReqs.dbeNumRqsExit(Sender: TObject);
var
  sSQL, sCIAID, sLOCID, sRQSID : String;
begin
  if DMLOG.wModo<>'A' then Exit;
  if length(trim(dbeNumRqs.Text)) = 0 then
  	dcNUM;
  sCIAID := dblcCIA.Text;
  sLOCID := dblcLOC.Text;
  sRQSID := dbeNumRqs.Text;
  if DMLOG.IsExistRqsM( sCIAID, sLOCID, sRQSID ) then
  begin
    ShowMessage('Ya existe una requisión con '+#13+
                      'el mismo número ... '+DMLOG.cdsReqs.FieldByName('RQSID').AsString);
    dcNUM;
    //dbeNumRqs.SetFocus;
    Exit;
  end;

	sSQL:='SELECT * FROM LOG309 '+
				'WHERE CIAID='''+sCIAID+''' '+
				'AND LOCID='''+sLOCID+''' '+
				'AND RQSID='''+sRQSID+''' '+				
				'ORDER BY CIAID, LOCID, RQSID, DRQSID';
				
 	DMLOG.cdsDReqs.Close;
 	DMLOG.cdsDReqs.DataRequest(sSQL);
 	DMLOG.cdsDReqs.Open;
end;

procedure TFRegReqs.dcCIA;
var
  sCIA : String;
begin
  DMLOG.cdsCIA.First;
  sCIA := trim(DMLOG.cdsCIA.FieldByName('CIAid').AsString);
  if DMLOG.cdsReqs.State in [dsInsert] then
    DMLOG.cdsReqs.FieldByName('CIAID').AsString := sCIA
  else
    dblcCIA.Text := sCIA;

//  dblcCIA.OnExit(dblcCIA);

  edtCia.text := DMLOG.DisplayDescrip('prvSQL','TGE101','CIADES','CIAID='+quotedStr(dblcCIA.text),'CIADES');

  DMLOG.cdsLOC.Filtered := False;
  DMLOG.cdsLOC.Filter   := 'CIAID='''+dblcCIA.Text+'''';
  DMLOG.cdsLOC.Filtered := True;

  dblcCIA.Enabled := DMLOG.cdsCIA.RecordCount > 1;
end;

procedure TFRegReqs.dbdtpFReqsExit(Sender: TObject);
begin
  if dbdtpFReqs.Text='' then
    dbdtpFReqs.Field.AsDateTime:= Date;
end;

{procedure TFRegReqs.dcALM;
begin
  dcNUM;
end;}

procedure TFRegReqs.dcLOC;
var
  sLOC, sSQL : String;
begin
	if DMLOG.cdsLOC.Active = False then
  begin
  	DMLOG.cdsLOC.Close;
    sSQL:='SELECT * FROM TGE126 WHERE CIAID='''+dblcCIA.Text+'''';
  	DMLOG.cdsLOC.DataRequest(sSQL);
  	DMLOG.cdsLOC.Open;
  end;
  DMLOG.cdsLOC.First;
  sLOC := trim(DMLOG.cdsLOC.FieldByName('LOCID').AsString);
  if DMLOG.cdsReqs.State in [dsInsert] then
    DMLOG.cdsReqs.FieldByName('LOCID').AsString := sLOC
  else
    dblcLOC.Text := sLOC;

  sSQL:='CIAID='+quotedStr(dblcCIA.text)+' AND LOCID='+quotedStr(dblcLOC.text);
  edtLoc.text := DMLOG.DisplayDescrip('prvSQL','TGE126','LOCDES',sSQL,'LOCDES');
	//  dblcLOC.OnExit(dblcLOC);
  dblcLOC.Enabled := DMLOG.cdsLOC.RecordCount > 1;
end;

procedure TFRegReqs.dcNUM;
begin
  if DMLOG.cdsReqs.State in [dsInsert] then
  begin
    dbeNumRqs.Text := DMLOG.StrZero( DMLOG.MaxReqA(dblcCIA.Text,dblcLOC.Text), 8);
    DMLOG.cdsReqs.FieldByName('RQSID').AsString := dbeNumRqs.Text;
  end;
end;

procedure TFRegReqs.dblcTipoCompraExit(Sender: TObject);
var
	sSQL : string;
begin
	if Z2bbtnBorrar.Focused or Z2bbtnOK.Focused then Exit;
  dblcTRqs.Text:='';
  dbeTRqs.Text:='';
  edtTipoCompra.Text:='';
	if dblcTipoCompra.Text = '' then
  begin
    ShowMessage('Tiene que seleccionar un tipo de Solicitud');
    dblcTipoCompra.SetFocus;
  	Exit;
  end;
  sSQL := 'TIPOADQ=' + QuotedStr(dblcTipoCompra.Text);
  edtTipoCompra.Text := DMLOG.DisplayDescrip('prvSQL','TGE173','TIPADQDES',sSQL,'TIPADQDES');
  if edtTipoCompra.Text <> '' then
  begin
    sSQL := 'SELECT * FROM TGE142 WHERE TIPOADQ='+quotedStr(dblcTipoCompra.text);
		DMLOG.cdsTRqs.Close;
		DMLOG.cdsTRqs.DataRequest(sSQL);
    DMLOG.cdsTRqs.Open;
    DMLOG.cdsTRqs.First;
    if (DMLOG.cdsTRqs.RecordCount=1) AND (DMLOG.wModo='A') then
    begin
      DMLOG.cdsReqs.FieldByName('TRQSID').AsString:=DMLOG.cdsTRqs.FieldByName('TRQSID').AsString;
    end;
    //dblcTRqs.SetFocus;
    //dblcTRqs.Text := DMLOG.cdsTRqs.fieldbyName('TRQSID').asString;
    //dblcTRqs.DropDown;
  end;
end;

procedure TFRegReqs.dblcdCCosExit(Sender: TObject);
var
 xSql,xWhere,xParPres,xTipPres : String;
begin
  xPresu := 'N';
  if dblcCIA.Focused then Exit;
  if dblcLOC.Focused then Exit;
  if dblcTipoCompra.Focused then Exit;
  if dblcTRqs.Focused then Exit;

  //dbeCCostos.Text := DMLOG.DisplayDescrip('prvSQL','TGE203','CCOSDES','CCOSID='+quotedStr(dblcdCCos.text),'CCOSDES');

	DMLOG.DisplayDescrip('prvSQL','TGE203','CCOSDES, '+DMLOG.wReplacCeros+'(CCOSMOV,''N'') CCOSMOV','CCOSID='+quotedStr(dblcdCCos.text),'CCOSDES');
  if DMLOG.cdsQry.FieldByName('CCOSMOV').ASString = 'N' then
  begin
  	dbeCCostos.Text := '';
  	ShowMessage('Sólo puede Seleccionar un Codigo de C. Costo de Ultimo Nivel ');
  	Exit;
  end;
  dbeCCostos.Text := DMLOG.cdsQry.FieldByName('CCOSDES').ASString;

  If dblcdCCos.Text = '' Then Exit;
  If wActuaPresu then
  begin
    try
     	If DMLOG.wModo = 'A' then
      begin
        Screen.Cursor := crHourGlass;
        pnlActualizando.Visible := True;
        pnlActualizando.Refresh;
        lblActualizando.Caption := 'Buscando Partidas Presupuestales...';
        lblActualizando.Refresh;
        xWhere := 'CCOSID='+quotedstr(dblcdCCos.text)+' AND CIAID='+quotedstr(dblcCIA.text);
        IF Length(DMLOG.DisplayDescrip('prvTGE','PPRES301','CCOSID',xWhere,'CCOSID')) > 0 then
        begin
          xPresu := 'S';
          xSql := 'SELECT CIAID, CCOSID, PARPRESID, TIPPRESID FROM PPRES301 WHERE CCOSID='+quotedstr(dblcdCCos.text)+' AND CIAID='+quotedstr(dblcCIA.text);
          DMLOG.cdsSQL.Close;
          DMLOG.cdsSQL.DataRequest(xSql);
          DMLOG.cdsSQL.open;
          DMLOG.cdsSQL.First;
          xParPres := 'SELECT * FROM PPRES201 WHERE CIAID='+quotedstr(dblcCIA.text);
          xTipPres := 'SELECT * FROM PPRES101 WHERE';
          DMLOG.cdsParPre.IndexFieldNames := 'CIAID;PARPRESID;PARPRESMOV';
          DMLOG.cdsTipPre.IndexFieldNames := 'TIPPRESID';
          while not DMLOG.cdsSQL.Eof do
           begin
             DMLOG.cdsParPre.SetKey;
             DMLOG.cdsParPre.FieldByName('CIAID').AsString := DMLOG.cdsSQL.fieldbyname('CIAID').Asstring;
             DMLOG.cdsParPre.FieldByName('PARPRESID').AsString := DMLOG.cdsSQL.fieldbyname('PARPRESID').Asstring;
             DMLOG.cdsParPre.FieldByName('PARPRESMOV').AsString := 'S';
             If DMLOG.cdsParPre.GotoKey then
               xParPres := xParPres + ' AND PARPRESID ='+quotedstr(DMLOG.cdsSQL.fieldbyname('PARPRESID').Asstring);
             DMLOG.cdsTipPre.SetKey;
  //           DMLOG.cdsTipPre.FieldByName('CIAID').AsString := DMLOG.cdsSQL.fieldbyname('CIAID').Asstring;
             DMLOG.cdsTipPre.FieldByName('TIPPRESID').AsString := DMLOG.cdsSQL.fieldbyname('TIPPRESID').Asstring;
             If DMLOG.cdsTipPre.GotoKey then
              If Length(xTipPres) > 28 then
                xTipPres := xTipPres + ' AND TIPPRESID ='+quotedstr(DMLOG.cdsSQL.fieldbyname('TIPPRESID').Asstring)
              else
                xTipPres := xTipPres + ' TIPPRESID ='+quotedstr(DMLOG.cdsSQL.fieldbyname('TIPPRESID').Asstring);
             DMLOG.cdsSQL.Next;
           end;
          DMLOG.cdsParPre.Close;
          DMLOG.cdsParPre.DataRequest(xParPres);
          DMLOG.cdsParPre.Open;
          DMLOG.cdsTipPre.Close;
          DMLOG.cdsTipPre.DataRequest(xTipPres);
          DMLOG.cdsTipPre.Open;
        end
        else
        begin
          showmessage('Centro de Costo No tiene Partida Presupuestal');
          xPresu := 'N';
        end;
      end;
    Finally
      pnlActualizando.Visible := False;
      Screen.Cursor := crDefault;
    end;
   end;
end;

procedure TFRegReqs.dblcTRqsExit(Sender: TObject);
var
  sSQL : string;
begin
  sSQL := 'TRQSID=' + QuotedStr(dblcTRqs.Text)+' AND TIPOADQ='+QuotedStr(dblcTipoCompra.Text);
  dbeTRqs.Text := DMLOG.DisplayDescrip('prvSQL','TGE142','TRQSDES',sSQL,'TRQSDES');
end;

procedure TFRegReqs.dbcldArtiExit(Sender: TObject);
var
	sSQL : string;
begin
  if Z2bbtnRegCanc.Focused then
    Exit;
	edtARTDES.clear;
	if dbcldArti.Text <> '' then
 	begin
 		sSQL := 'CIAID='+QuotedStr(dblcCIA.text)+' AND ARTID=' + quotedstr(uppercase(dbcldArti.Text)); // quotedstr(DMLOG.cdsArti.FieldByName('ARTID').AsString);
    edtARTDES.Text := DMLOG.displaydescrip('prvSQL','TGE205','ARTDES',sSQL,'ARTDES');
  end
 	else
  	edtARTDES.Clear;
  {por defecto toma el código de la UNMID General para mostrarlo }
  //dblcUNMID.Text:=DMLOG.cdsArti.FieldByName('UNMIDG').AsString;
  //DMLOG.cdsDReqs.FieldByName('UNMIDG').AsString:=DMLOG.cdsArti.FieldByName('UNMIDG').AsString;
  //DMLOG.cdsDReqs.FieldByName('RQSFLAGUM').AsString := 'G';
  dbcbFLAG.Text:= 'G';
  dblcUNMID.Text:=DMLOG.cdsArti.FieldByName('UNMIDG').AsString;
  sSQL := 'UNMID=' + ''''+ DMLOG.cdsArti.FieldByName('UNMIDG').AsString + '''';
  edtUMedReq.Text := DMLOG.displaydescrip('prvSQL','TGE130','UNMDES',sSQL,'UNMDES');
  if DMLOG.cdsArti.FieldByName('ARTCONT').AsString = '1' then
  begin
    dbcbFLAG.Enabled := false;
    dblcUNMID.Enabled := false;
  end
  else
  begin
    dbcbFLAG.Enabled := true;
    dblcUNMID.Enabled := False;
  end;
  dbeCNTS.SetFocus;
end;

procedure TFRegReqs.dbcbFLAGExit(Sender: TObject);
var
	sSQL : String;
begin
	sSQL := 'ARTID=' + ''''+ dbcldArti.Text + '''';
	if dbcbFLAG.Text = 'G' then
  begin
    dblcUNMID.Text:=DMLOG.displaydescrip('prvSQL','TGE205','UNMIDG',sSQL,'UNMIDG');
  end
  else
	if dbcbFLAG.Text = 'U' then
  begin
    dblcUNMID.Text:=DMLOG.displaydescrip('prvSQL','TGE205','UNMIDU',sSQL,'UNMIDU');
  end;
  sSQL := 'UNMID=' + ''''+ dblcUNMID.Text + '''';
  edtUMedReq.Text := DMLOG.displaydescrip('prvSQL','TGE130','UNMDES',sSQL,'UNMDES');

	{if length(dblcUNMID.Text) > 0 then
  	dbeCNTS.SetFocus
  else
  	dblcUNMID.SetFocus;}
end;

procedure TFRegReqs.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
    if Self.ActiveControl Is TMemo then Exit;
    if self.ActiveControl Is TDBMemo then Exit;
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFRegReqs.Z2bbtnPrintClick(Sender: TObject);
begin
 	Screen.Cursor:=crHourGlass;
	if DMLOG.cdscia.FieldByName('CIASUGRQ').AsString = 'S' then
	begin
		pprOCPE.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\Requisicion.rtm';
		pprOCPE.Template.LoadFromFile;
	end
	else
	begin
		pprOCPE.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\Requisicion.rtm';
		pprOCPE.Template.LoadFromFile;
	end;
	//pprOCPE.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\Requisicion.Rtm';
	//pprOCPE.Template.LoadFromFile;
	ppReportRQS(DMLOG.cdsReqs.FieldByName('CIAID').AsString,
							DMLOG.cdsReqs.FieldByName('LOCID').AsString,
							DMLOG.cdsReqs.FieldByName('RQSID').AsString);
	ppDBCab.DataSource := DMLOG.dsQry;
	ppdbOC.DataSource  := DMLOG.dsSQL;
	DMLOG.cdsSQL.First;
	while not DMLOG.cdsSQL.eof do
	begin
		//ConsumoPro(DMLOG.cdsSQL.fieldbyname('ARTID').AsString,dblcCIA.text,DMLOG.cdsSQL.fieldbyname('UNIDAD').AsString);
      ConsumoTotal(DMLOG.cdsSQL.fieldbyname('ARTID').AsString,dblcCIA.text,DMLOG.cdsSQL.fieldbyname('UNIDAD').AsString);
		DMLOG.cdsSQL.edit;

		//DMLOG.cdsSQL.fieldbyname('CONSUMO').value := DMLOG.cdsConsumo.fieldbyname('CONSUMO').value;
		DMLOG.cdsSQL.fieldbyname('CONSUMO').AsFloat := xTotal;

		DMLOG.cdsSQL.next;
	 end;
	DMLOG.cdsSQL.First;
	Screen.Cursor:=crDefault;
   //ppdesigner1.Report:=pprOCPE;
   //ppdesigner1.Show;

	pprOCPE.Print;
	pprOCPE.Stop;
   ppDBCab.DataSource := Nil;
   ppdbOC.DataSource  := Nil;
end;

procedure TFRegReqs.ppReportRQS(sCIA, sLOC, sRQS : String);
var
	sSQL : string;
begin
	//sCIA := DMLOG.cdsReqs.FieldByName('CIAID').AsString;
	//sLOC := DMLOG.cdsReqs.FieldByName('LOCID').AsString;
	//sRQS := DMLOG.cdsReqs.FieldByName('RQSID').AsString;
	if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    sSQL:='SELECT '+
          'CASE WHEN LOG308.RQSEST=''ANULADO'' OR LOG308.RQSEST=''DEPURADO'' THEN LOG308.RQSEST ELSE NULL END RQSEST, '+
          'TGE101.CIADES, TGE101.CIARUC, TGE101.CIATLF, TGE101.CIAFAX, TGE101.CIADIRE, LOG308.RQSFREQ, '+
          'LOG308.RQSOBS, LOG308.RQSID, LOG308.CCOSID, TGE203.CCOSDES, TGE002.USERNOM USUARIO, A.USERNOM VISADO, '+
          'LOG308.RQSSOLI, LOG308.RQSAUTOR, TGE213.OBRADES, TGE155.PRIODES, H.TIPADQDES '+
          'FROM LOG308 '+
          'LEFT JOIN TGE101 ON ( LOG308.CIAID   = TGE101.CIAID) '+
          'LEFT JOIN TGE213 ON ( LOG308.OBRAID  = TGE213.OBRAID ) '+
          'LEFT JOIN TGE155 ON ( LOG308.PRIOID  = TGE155.PRIOID ) '+
          'LEFT JOIN TGE203 ON ( LOG308.CCOSID  = TGE203.CCOSID ) '+
          //'LEFT JOIN TGE203 ON ( LOG308.CCOSID  = TGE203.CCOSID AND LOG308.CIAID=TGE203.CIAID) '+
          'LEFT JOIN TGE002 ON ( LOG308.RQSUSER = TGE002.USERID ) '+
          'LEFT JOIN TGE002 A ON ( LOG308.RQSVISADOR = A.USERID ) '+
          'LEFT JOIN TGE173 H ON ( LOG308.TIPOADQ=H.TIPOADQ ) '+
          'WHERE  LOG308.CIAID = '''+sCIA+''' '+
          'AND LOG308.LOCID = '''+sLOC+''' '+
          'AND LOG308.RQSID = '''+sRQS+''' ';
  end
  else
  if SRV_D = 'ORACLE' then
  begin
    sSQL:='SELECT '+
          'CASE WHEN A.RQSEST=''ANULADO'' OR A.RQSEST=''DEPURADO'' THEN A.RQSEST ELSE NULL END RQSEST, '+
          'B.CIADES, B.CIARUC, B.CIATLF, B.CIAFAX, B.CIADIRE, A.RQSFREQ, '+
          'A.RQSOBS, A.RQSID, A.CCOSID, E.CCOSDES, F.USERNOM USUARIO, G.USERNOM VISADO, '+
          'A.RQSSOLI, A.RQSAUTOR, C.OBRADES, D.PRIODES, H.TIPADQDES '+
          'FROM LOG308 A, TGE101 B, TGE213 C, TGE155 D, TGE203 E, TGE002 F, TGE002 G, TGE173 H '+
          'WHERE A.CIAID = ''' + sCIA + ''' '+
          'AND A.RQSID=''' + sRQS + ''' '+
          'AND A.LOCID=''' + sLOC + ''' '+
          'AND A.CIAID=B.CIAID(+) '+
          'AND A.OBRAID=C.OBRAID(+) '+
          'AND A.PRIOID=D.PRIOID(+) '+
          'AND A.CCOSID=E.CCOSID(+) '+
          'AND A.RQSUSER=F.USERID(+) '+
          'AND A.RQSVISADOR=G.USERID(+) '+
          'AND F.MODULOID='+QuotedStr(DMLOG.wModulo)+' '+
          'AND A.TIPOADQ=H.TIPOADQ';
    //sSQL:=sSQL+'AND G.MODULOID='+QuotedStr(DMLOG.wModulo);
  end;
	DMLOG.cdsQry.DisableControls;
	DMLOG.cdsQry.Close;
	DMLOG.cdsQry.ProviderName:='prvLOG';
	DMLOG.cdsQry.DataRequest(sSQL);
	DMLOG.cdsQry.Open;
	DMLOG.cdsQry.EnableControls;
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    sSQL :=        'SELECT LOG309.CIAID, LOG309.LOCID, LOG309.RQSID, ';
    sSQL := sSQL + 'DRQSID, LOG309.ARTID, DRQSOBS ARTDES, UM2.UNMABR, 0 AS CONSUMO, ';
    sSQL := sSQL + 'CASE WHEN RQSFLAGUM = '''' THEN ''G'' ELSE RQSFLAGUM END AS UNIDAD, ';
    sSQL := sSQL + 'CASE WHEN DRQSCNSU = 0 THEN  DRQSCNSG ELSE DRQSCNSU END CANTIDA, ';
    sSQL := sSQL + 'CASE WHEN COALESCE(UM3.ARTMNTG,0) <> 0 THEN COALESCE(UM3.ARTMNTG,0) / COALESCE(DRQSCNSG,0) END MONTOG, ';
    sSQL := sSQL + 'CASE WHEN COALESCE(UM3.ARTMNTU,0) <> 0 THEN COALESCE(UM3.ARTMNTU,0) / COALESCE(DRQSCNSU,0) END MONTOU ';
    sSQL := sSQL + 'FROM LOG309 ';
    sSQL := sSQL + 'LEFT JOIN TGE130 UM2 ON ( LOG309.UNMIDG = UM2.UNMID ) ';
    sSQL := sSQL + 'LEFT JOIN TGE130 UM1 ON ( LOG309.UNMIDU = UM1.UNMID ) ';
    sSQL := sSQL + 'LEFT JOIN TGE205 UM3 ON ( LOG309.ARTID  = UM3.ARTID ) ';
    sSQL := sSQL + 'WHERE LOG309.CIAID = ''' + sCIA + ''' ';
    sSQL := sSQL + 'AND LOG309.LOCID = ''' + sLOC + ''' ';
    sSQL := sSQL + 'AND LOG309.RQSID = ''' + sRQS + ''' ';
    sSQL := sSQL + 'ORDER BY LOG309.CIAID, LOG309.LOCID, LOG309.RQSID, LOG309.DRQSID';    
  end
  else
	if SRV_D = 'ORACLE' then
  begin
    sSQL :=        'SELECT ';
    sSQL := sSQL + 'DRQSID, A.ARTID, DRQSOBS ARTDES, UM2.UNMABR, 0 AS CONSUMO, ';
    sSQL := sSQL + 'CASE WHEN NVL(A.RQSFLAGUM,''XX'')=''XX'' THEN ''G'' ELSE A.RQSFLAGUM END AS UNIDAD, ';
    sSQL := sSQL + 'CASE WHEN NVL(DRQSCNSU,0) = 0 THEN  DRQSCNSG ELSE  DRQSCNSU END AS CANTIDA, ';
    sSQL := sSQL + 'ROUND(CASE WHEN NVL(UM3.ARTMNTG,0)= 0 THEN 0 ELSE NVL(UM3.ARTMNTG,0) / NVL(DRQSCNSG,0) END,4) AS MONTOG, ';
    sSQL := sSQL + 'ROUND(CASE WHEN NVL(UM3.ARTMNTU,0)= 0 THEN 0 ELSE NVL(UM3.ARTMNTU,0) / NVL(DRQSCNSU,0) END,4) AS MONTOU ';
    sSQL := sSQL + 'FROM LOG309 A, TGE130 UM2, TGE130 UM1, TGE205 UM3 ';
    sSQL := sSQL + 'WHERE A.CIAID ='''+sCIA+''' ';
    sSQL := sSQL + 'AND A.LOCID  =''' +sLOC +''' ';
    sSQL := sSQL + 'AND A.RQSID  =''' +sRQS +''' ';
    sSQL := sSQL + 'AND A.UNMIDG = UM2.UNMID(+) ';
    sSQL := sSQL + 'AND A.UNMIDU = UM1.UNMID(+) ';
    sSQL := sSQL + 'AND A.ARTID  = UM3.ARTID(+) ';
    sSQL := sSQL + 'AND A.CIAID  = UM3.CIAID(+) ';
    sSQL := sSQL + 'AND A.TINID  = UM3.TINID(+) ';
    sSQL := sSQL + 'ORDER BY A.CIAID, A.LOCID, A.RQSID, A.DRQSID';
	end;
  DMLOG.cdsSQL.DisableControls;
	DMLOG.cdsSQL.Close;
	DMLOG.cdsSQL.DataRequest(sSQL);
  DMLOG.cdsSQL.Open;
  DMLOG.cdsSQL.EnableControls;
end;

procedure TFRegReqs.dblcPRIOExit(Sender: TObject);
var
	sSQL : string;
begin
  sSQL := 'PRIOID=' + QuotedStr(dblcPRIO.Text);
  dbePrior.Text := DMLOG.DisplayDescrip('prvSQL','TGE155','PRIODES',sSQL,'PRIODES');
end;

procedure TFRegReqs.pprOCPEPreviewFormCreate(Sender: TObject);
begin
  pprOCPE.PreviewForm.ClientHeight := 500;
  pprOCPE.PreviewForm.ClientWidth := 650;
  tppviewer(pprOCPE.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFRegReqs.ConsumoPro(pArtid,pCiaId,pUnidad : string);
var
	anio, mes, dia: Word;
	xDife,xMes,xMesAnt,xAniAnt : Integer;
	xI : integer;
	xsql : string;
begin
  DecodeDate(dbdtpFReqs.Date, anio, mes, Dia);
  xMesant := 0;
  xAniant := 0;
  xsql := '';
	xDife := Mes - wConsumo;
	If xDife < 0 then
	 begin
		xAniant := anio - 1;
		xMesant := 13 + xDife;
	 end;
	xsql := 'SELECT * FROM LOG316 WHERE CIAID='+quotedstr(pCiaId)+' AND ARTID='+quotedstr(pArtid);
	DMLOG.cdsQry6.Close;
	DMLOG.cdsQry6.DataRequest(xsql);
	DMLOG.cdsQry6.open;
	DMLOG.cdsQry6.IndexFieldNames := 'STKANO';
	xTotal := 0;
	// cuando se retrocede un año
	If xAniant <> 0 then
	 begin
		DMLOG.cdsQry6.SetKey;
		DMLOG.cdsQry6.FieldByName('STKANO').AsString := FloatToStr(xAniAnt);
		If DMLOG.cdsQry6.GotoKey then
		 begin
			For xI := xMesant to 12 do
			 begin
				xTotal := xTotal + DMLOG.cdsQry6.FieldByName('STKSS'+pUnidad+DMLOG.strzero(IntToStr(Xi),2)).AsFloat;
			 end;
		end;
	 end;
	 //** para el año actual
	 DMLOG.cdsQry6.SetKey;
	 DMLOG.cdsQry6.FieldByName('STKANO').AsString := FloatToStr(Anio);
	 If DMLOG.cdsQry6.GotoKey then
		begin
		 If xDife <= 0 then xMes := 1
		 else xMes := Mes - xDife;
		 For xI := xMes to Mes do
			begin
			 xTotal := xTotal + DMLOG.cdsQry6.FieldByName('STKSS'+pUnidad+DMLOG.strzero(IntToStr(Xi),2)).AsFloat;
			end;
		end;
		xTotal := xTotal / wConsumo;
//**
end;

procedure TFRegReqs.dblcTipPreExit(Sender: TObject);
begin
	if Length(dblcTipPre.Text) = 0 then
	 begin
		raise exception.Create('Falta Tipo de Presupuesto');
		 Exit;
   end;
 dbeTipPre.text := DMLOG.DisplayDescrip('prvTGE','PPRES101','TIPPRESDES','TIPPRESID='+quotedstr(dblcTipPre.text),'TIPPRESDES');
end;

procedure TFRegReqs.dblcdPresupExit(Sender: TObject);
var
	xSQL : String;
begin
	xSQL:='PARPRESID='+quotedstr(dblcdPresup.Text)+' AND CIAID='''+dblcCIA.Text+'''';
  edtPresup.Text:= DMLOG.DisplayDescrip('PPRES201','PPRES201','PARPRESDES',xSQL,'PARPRESDES');
  if Length(edtPresup.text)=0 then
   begin
    raise exception.Create('Falta Partida Presupuestal');
    dblcdPresup.SetFocus;
  end;
end;

procedure TFRegReqs.dbeNumRqsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key In [' ', 'a'..'z',
             '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
             '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
             ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
             '.', '-', '_'] Then
    Key := #0;
end;

procedure TFRegReqs.ConsumoTotal(pArtid, pCiaId, pUnidad: string);
var sSQL:string;
    anio,mes,dia:word;
begin
  DecodeDate(dbdtpFReqs.Date, anio, mes, Dia);

   sSQL:=' SELECT SUM(B.KDXCNTG) TOTAL '+
         ' FROM LOG314 A, LOG315 B'+
         ' WHERE A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.TINID=B.TINID AND A.ALMID=B.ALMID'+
         ' AND A.NISATIP=B.NISATIP AND A.NISAID=B.NISAID AND A.TDAID=B.TDAID AND A.TRIID=B.TRIID'+
         ' AND A.CIAID='+QuotedStr(pCiaId)+' AND A.NISATIP=''SALIDA'' AND B.ARTID='+QuotedStr(pArtid)+
         ' AND A.CCOSID='+QuotedStr(dblcdCCos.text)+' AND A.NISSIT=''ACEPTADO'' '+
         ' AND A.NISAFREG>='+QuotedStr('01/01/'+IntToStr(anio))+' AND A.NISAFREG<='+QuotedStr(DateToStr(dbdtpFReqs.Date));

	DMLOG.cdsQry6.Close;
	DMLOG.cdsQry6.DataRequest(sSql);
	DMLOG.cdsQry6.open;
   xTotal := DMLOG.cdsQry6.FieldByName('TOTAL').AsFloat;
end;

procedure TFRegReqs.FormShow(Sender: TObject);
var
	sSQL : string;
begin
  //** 14/06/2001 - Para Presupuestos
   OnOffCabecera(True); //Activar la cabecera
   OnOffDetalle(False); //Desactivar el panel de detalle
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
	if dblcCIA.Enabled then
		dblcCIA.SetFocus;
	Z2dbgDReqsIButton.Enabled:= ( trim(DMLOG.cdsReqs.FieldbyName('RQSEST').AsString) = 'INICIAL' );
	pnlDetalleA.Visible:=False;
   pnlDetalleB.Visible:=False;
   dblcTipPre.Visible := wActuaPresu;
   dblcdPresup.Visible:= wActuaPresu;
   if wActuaPresu then
   begin
      dbmObs.Width:=514;
      dbmObs.Left:=280;
      DMLOG.cdsParPre.Open;
      DMLOG.cdsTipPre.Open;
   end
   else
   begin
      dbmObs.Width:=748;
      dbmObs.Left:=24;
      DMLOG.cdsParPre.Close;
      DMLOG.cdsTipPre.Close;
   end;
   lblTipPre.Visible  := wActuaPresu;
   lblPresu.Visible   := wActuaPresu;
   dbeTipPre.Visible  := wActuaPresu;
   edtPresup.Visible  := wActuaPresu;

   DMLOG.FiltraCDS(DMLOG.cdsCCost, 'SELECT * FROM TGE203 WHERE CCOSACT<>''N'' ORDER BY CCOSID');// WHERE CCOSMOV=''S''');

	pnlDetalleA.Visible:=False;
	pnlDetalleB.Visible:=False;
	edtCia.Text:='';
   edtLoc.Text:='';
   edtObra.Text:='';
   dbePrior.Text:='';
	xOrdElim:='';
   edtTipoCompra.Text:='';
   dbeTRqs.Text:='';
   dbeCCostos.Text:='';
   dbeTipPre.Text:='';
   edtPresup.Text:='';

   if DMLOG.cdsReqs.State in [dsInsert] then
   begin
      dcCIA;
      dcLOC;
      dcNUM;
 		DMLOG.cdsReqs.FieldByName('RQSEST').AsString := 'INICIAL';
		DMLOG.cdsReqs.fieldbyname('RQSFREQ').AsDateTime:=date;
      DMLOG.cdsReqs.fieldbyname('PRIOID').AsString:='M';
	   if SRV_D = 'ORACLE' then
         DMLOG.cdsReqs.fieldbyname('PRIOID').AsString:='N';

      DMLOG.cdsReqs.fieldbyname('RQSFATE').AsDateTime:=date;
   end;
   dblcPRIO.OnExit(sender);
   if (DMLOG.wModo<>'A') then //and (DMLOG.cdsReqs.fieldbyname('SCCEST').asString<>'ACEPTADO') then
   begin
      btnDetalle;
      dblcTipoCompra.OnExit(sender);
      dblcCIA.OnExit(dblcCIA);
      dblcLOC.OnExit(dblcLOC);
      dblcObra.OnExit(dblcObra);
      //INICIO HPP_201103_LOG
      //dblcdCCos.OnExit(sender);
      dblcdCCos.OnExit(dblcdCCos);
      //FIN HPP_201103_LOG
      dblcObra.OnExit(sender);
      sSQL := 'TRQSID=' + QuotedStr(dblcTRqs.Text);
      dbeTRqs.Text := DMLOG.DisplayDescrip('prvSQL','TGE142','TRQSDES',sSQL,'TRQSDES');
      sTipoRQS := DMLOG.cdsReqs.FieldByName('TIPOADQ').asString;
      dblcTRqs.OnExit(sender);
   end;

	if DMLOG.wModo = 'A' then
	begin
		xPriInser:='A';
		dblcTipoCompra.Enabled:=True;
		dblcTRqs.Enabled:=True;
		dblcdCCos.Enabled:=True;
		dblcPRIO.Enabled:=True;
	end
	else
	begin
		xPriInser:='';
		if DMLOG.cdsDReqs.RecordCount > 0 then
		begin
			dblcTipoCompra.Enabled:=False;
			dblcTRqs.Enabled:=False;
			dblcdCCos.Enabled:=False;
			dblcPRIO.Enabled:=False;
		end
		else
		begin
			dblcTipoCompra.Enabled:=True;
			dblcTRqs.Enabled:=True;
			dblcdCCos.Enabled:=True;
			dblcPRIO.Enabled:=True;
		end;
	end;
   //INICIO HPP_201103_LOG
   if (DMLOG.cdsReqs.fieldbyname('RQSEST').asString = 'ACEPTADO') and
      (DMLOG.cdsReqs.fieldbyname('RQSCOMPID').asString = '') then
   begin
      OnOffVisar(True);
   end
   else
   begin
      OnOffVisar(False);
   end;
 	 DMLOG.cdsComprador.Close;
	 DMLOG.cdsComprador.dataRequest('SELECT * FROM TGE135 ORDER BY COMPCID');
	 DMLOG.cdsComprador.Open;
   dblcCompradorExit(Nil);
   if Length(Trim(DMLOG.cdsReqs.FieldByName('RQSVISADOR').AsString)) = 0 then
   begin
      dbeNOCompra.Text:='';
   end;
   //FIN HPP_201103_LOG
  
	sSQL := 'SELECT * FROM LOG309 '+
					'WHERE CIAID='''+dblcCIA.Text+''' '+
					'AND LOCID='''+dblcLOC.Text+''' '+
					'AND RQSID='''+dbeNumRqs.Text+''' '+
					'ORDER BY CIAID, LOCID, RQSID, DRQSID';
	DMLOG.cdsDReqs.Close;
	DMLOG.cdsDReqs.MasterSource    := Nil;
	DMLOG.cdsDReqs.MasterFields    := '';
	DMLOG.cdsDReqs.IndexFieldNames := '';
	DMLOG.cdsDReqs.DataRequest(sSQL);
 	DMLOG.cdsDReqs.Open;
   if xReqLec = 'S' then
   begin
	   OnOffCabecera(False); //Desactivar el panel de Cabecera
	   OnOffDetalle(False);   //Activar el panel de detalle
      Z2bbtnNuevo.Enabled:=False;
   end;
end;
//INICIO HPP_201103_LOG
//activar o desactivar el botón Visar
procedure TFRegReqs.OnOffVisar(Value: Boolean);
//*********************************************************
// CREADO POR            : Abelardo Sulca Palomino
// FECHA DE CREACION     : 14/04/2011
// DESCRIPCION           : Habilita el botón de Visar evaluando antes si
//                         el usuario tiene acceso a esa opción o no
//*********************************************************
begin
   if Value = False then
   begin
      Z2bbtnVisado.Enabled := False ;
      pnlComprador.Enabled := False ;
      Exit;
   end;
   if (trim(DMLOG.cdsReqs.FieldbyName('RQSEST').AsString) <> 'ACEPTADO') or
		 (DMLOG.cdsReqs.RecordCount = 0) then
   begin
      Z2bbtnVisado.Enabled := False ;
      pnlComprador.Enabled := False ;
      Exit;
   end;
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest('SELECT * FROM TGE171 WHERE USERID='''+ DMLOG.wUsuario +''' ' )  ;
   DMLOG.cdsQry.Open;
   if DMLOG.cdsQry.RecordCount > 0 then
   begin
      if DMLOG.cdsQry.FieldByName('FRQ').AsString = 'S' then
      begin
         //xMontoVisar := DMLOG.cdsQry.fieldbyname('MONTOMAX').AsCurrency ;
         Z2bbtnVisado.Enabled := True ;
         pnlComprador.Enabled := True ;
      end
      else
      begin
         Z2bbtnVisado.Enabled := False ;
         pnlComprador.Enabled := False ;
      end;
   end
   else
   begin
      Z2bbtnVisado.Enabled := False ;
      pnlComprador.Enabled := False ;
   end;
end;
procedure TFRegReqs.Z2bbtnVisadoClick(Sender: TObject);
begin
   if DMLOG.wReqComp = 'S' then
	 begin
	    if Length(Trim(dbeComprador.Text)) = 0 then
			begin
			   ShowMessage(' Comprador no es Válido, Verifique ');
				 Exit;
			end;

			if Length(Trim(dbeNOCompra.Text)) = 0 then
			begin
			   ShowMessage(' Nro. de Orden de Trabajo no es Válido, Verifique ');
				 Exit;
			end;
	 end;
	 if MessageDlg('Está seguro de Visar el Requerimiento?' , mtConfirmation ,[ mbOK , mbCancel ] , 0 ) = mrok then
	 begin
			DMLOG.cdsReqs.edit ;
			DMLOG.cdsReqs.FieldByName('RQSVISADOR').AsString  := DMLOG.wUsuario;
			DMLOG.cdsReqs.FieldByName('RQSVISFREG').value			:= Date;
			DMLOG.cdsReqs.FieldByName('RQSVISHREG').Value		:= Date+SysUtils.Time;

			DMLOG.cdsReqs.FieldByName('RQSCOMPID').AsString   := dblcComprador.Text;
			DMLOG.cdsReqs.FieldByName('RQSNOTRAB').AsString   := dbeNOCompra.Text;
			DMLOG.cdsReqs.post;
		  DMLOG.ControlTran( 9, DMLOG.cdsReqs, 'REQS' );

      //INICIO HPP_201103_LOG
      OnOffVisar(False);
      ShowMessage(' El Requerimiento fue VISADO correctamente');
      //FIN HPP_201103_LOG
   end;
end;

procedure TFRegReqs.dblcCompradorExit(Sender: TObject);
var
	xsql : string;
begin
  xsql := 'COMPCID=' + QuotedStr(dblcComprador.Text);
  dbeComprador.Text:= DMLOG.DisplayDescrip('prvSQL','TGE135','COMPDES',xsql,'COMPDES');
	if Length(Trim(DMLOG.cdsReqs.FieldByName('RQSVISADOR').AsString)) = 0 then
    if Length(Trim(dbeNOCompra.Text)) = 0 then
      dbeNOCompra.Text := DMLOG.StrZero( DMLOG.MaxNOTranReq(dblcCIA.Text,dblcLOC.Text),8);
end;

procedure TFRegReqs.dbeNOCompraExit(Sender: TObject);
var
  sCIAID, sLOCID, sOTRAB : String;
begin
  if Length(Trim(DMLOG.cdsReqs.FieldByName('RQSVISADOR').AsString)) = 0 then
  begin
    dbeNOCompra.Text := DMLOG.StrZero(dbeNOCompra.Text,6);
    sCIAID := dblcCIA.Text;
    sLOCID := dblcLOC.Text;
    sOTRAB := dbeNOCompra.Text;

    if DMLOG.IsExistOTrab( sCIAID, sLOCID, sOTRAB ) then
    begin
      ShowMessage('Ya existe una requisión con '+#13+
                       'el Mismo Número de Orden de Trabajo  ... '+sOTRAB);
    end;
  end;
end;
//FIN HPP_201103_LOG
initialization
  registerclasses([TLabel])
end.

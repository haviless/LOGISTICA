unit LOG203;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,
  wwdbdatetimepicker, DBCtrls, db, wwSpeedButton, wwDBNavigator, Grids,
  Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, Wwdbspin, Wwdotdot, Wwdbcomb,
  GridControl, MsgDlgs;

type
  TFRegSolCot = class(TForm)
    pnlCabecera: TPanel;
    dblcCIA: TwwDBLookupCombo;
    lblCIA: TLabel;
    Z2bbtnOK: TBitBtn;
    Z2bbtnBorrar: TBitBtn;
    dbeNumSol: TwwDBEdit;
    lblNSolCot: TLabel;
    lblLEntrega: TLabel;
    dbeLEntrega: TwwDBEdit;
    dbdtpFLimite: TwwDBDateTimePicker;
    lblFlimite: TLabel;
    lblFEntre: TLabel;
    dbdtpFEntrega: TwwDBDateTimePicker;
    dbmObs: TDBMemo;
    lblObs: TLabel;
    pnlDetalleG: TPanel;
    stxTitulo1: TStaticText;
    dbgDReqs: TwwDBGrid;
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
    Bevel1: TBevel;
    Z2dbgDReqsIButton: TwwIButton;
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
		spbDiaVig: TwwDBSpinEdit;
    Label1: TLabel;
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
		procedure dbeNumSolExit(Sender: TObject);
		procedure dbmObsKeyPress(Sender: TObject; var Key: Char);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
{31/07/2000
		procedure dblcUMedChange(Sender: TObject);}
		procedure dblcExist(Sender: TObject);
		procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
		procedure dbdtpFEntregaExit(Sender: TObject);
		procedure dbdtpFLimiteExit(Sender: TObject);
		procedure spbDiaVigExit(Sender: TObject);
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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
	private
		{ Private declarations }
		iEstado : Integer;
		procedure  AsigDat;
		procedure dcCIA;
		procedure OnOffDetalle ( Value : Boolean );
		procedure OnOffCabecera( Value : Boolean );
		procedure btnDetalle;
//    procedure lblEstado;
//    procedure cSetFocus ( Sender: TObject ; const sMsg : String);
		function Artpend : Integer;
		function Serpend : Integer;
		function EHandlerError(Ex : Exception ) : Boolean;
	public
		{ Public declarations }
		bExit : Boolean;
		//vunmid : String;
	end;

var
	FRegSolCot: TFRegSolCot;
	vflag, vUMActSer, wSQL : String;
	SQLFiltro : String;
	Punt : TBookmark;

implementation

uses LOGDM1, LOG202, LOG204, oaAD3000, LOG217;

{$R *.DFM}

procedure TFRegSolCot.Z2bbtnOKClick(Sender: TObject);
var
	xSQL : String;
begin
	Screen.Cursor:=crHourGlass;
	//DMLOG.cdsDSCxDRQS.Open;
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
  btnDetalle;
  pnlDetalleG.SetFocus;
  Screen.Cursor:=crDefault;
  if DMLOG.wModo = 'A' then
  	Z2dbgDReqsIButton.Click;
end;

procedure TFRegSolCot.Z2bbtnBorrarClick(Sender: TObject);
begin
  DMLOG.cdsSolCot.CancelUpdates;
  if DMLOG.wModo='A' then
	begin
		DMLOG.cdsSolCot.Insert;
		//FormCreate(nil);
		OnOffCabecera(True); //Desactivar el panel de Cabecera
	end;
end;

procedure TFRegSolCot.AsigDat;
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
		dbdtpFEntregaExit(nil);
		dbdtpFLimiteExit(nil);

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
		//if dbdtpFEntrega.Date=0     then raise Exception.Create('Falta Registrar Fecha Entrega...');
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
      DMLOG.cdsSolCot.FieldbyName('SCCHREG').AsDateTime := SysUtils.Time;
    end;
  end;
end;

procedure TFRegSolCot.Z2bbtnRegresaClick(Sender: TObject);
begin
	if DMLOG.cdsDSolCot.RecordCount = 0 then
	begin
		dbdtpFSolicitud.Enabled:=True;
		dblcPRIO.Enabled:=True;
      dblcTipSol.Enabled:=True;
	end
	else
	begin
		dbdtpFSolicitud.Enabled:=False;
		dblcPRIO.Enabled:=False;
      dblcTipSol.Enabled:=False;
	end;

  DMLOG.cdsSolCot.Edit;
  DMLOG.wModo := 'M';
  OnOffCabecera(True);
  OnOffDetalle(False);
end;

procedure TFRegSolCot.Z2bbtnGrabaClick(Sender: TObject);
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

procedure TFRegSolCot.Z2bbtnCanc2Click(Sender: TObject);
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

procedure TFRegSolCot.Z2bbtnAceptaClick(Sender: TObject);
begin
  if (trim(DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString) = 'INICIAL') and
     (DMLOG.cdsDSolCot.RecordCount>0)  then // inicial...
	begin
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
      end;
    finally
    	Screen.Cursor:=crDefault;
    end;
  end;
  btnDetalle;
end;

procedure TFRegSolCot.Z2bbtnAnulaClick(Sender: TObject);
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

procedure TFRegSolCot.Z2dbgDReqsIButtonClick(Sender: TObject);
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
      pnlDetalleA.Visible := True  // Activar el panel de Mantenimiento
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
      	pnlDetalleB.Visible := True
      else
      	pnlDetalleC.Visible := True
    end
    else
		 OnOffDetalle(true);
	end;
	btnDetalle;
end;

function TFRegSolCot.Artpend : Integer;
var
	xSql, sSQL, xUMed : string;
begin
	// invocar los articulos pendientes de atencion correspondiente al articulo seleccionado ..........
	Screen.Cursor:=crhourGlass;
	Result := mrCancel;
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
      'AND NOT RQSVISADOR IS NULL '+
      'AND A.CIAID='''+dblcCIA.Text+''' '+
      'AND A.TIPOADQ=''C'' '+
      'AND (B.DRQSCNSG - B.DRQSCNAG > 0 OR B.DRQSCNSU - B.DRQSCNAU > 0) '+
      'GROUP BY  A.CIAID, A.TIPOADQ, B.ARTID, B.UNMIDG, C.ARTDES, B.RQSMARK, B.RQSFLAGUM, E.UNMABR '+
      'ORDER BY  B.ARTID, A.CIAID , B.UNMIDG, C.ARTDES, B.RQSMARK';
  end
  else
  if SRV_D = 'ORACLE' then
  begin
    xSQL:= 'SELECT A.CIAID, A.TIPOADQ, B.UNMIDG, B.ARTID, B.RQSMARK, C.ARTDES, E.UNMABR, B.RQSFLAGUM, '+
      'SUM(B.DRQSCNSG) AS RXACNTSG, SUM(B.DRQSCNSU) AS RXACNTSU, SUM(B.DRQSCNAG) AS RXACNTAG, '+
      'SUM(B.DRQSCNAU) AS RXACNTAU,  SUM(NVL(B.DRQSCNSG,0)-NVL(B.DRQSCNAG,0)) AS RXASALDOG, '+
      'SUM(NVL(B.DRQSCNSU,0)-NVL(B.DRQSCNAU,0)) AS RXASALDOU '+
      'FROM LOG309 B, LOG308 A, TGE205 C, TGE203 D, TGE130 E '+
      'WHERE B.CIAID=A.CIAID(+) AND B.RQSID=A.RQSID(+) '+
      'AND ((A.RQSEST=''ACEPTADO'') OR (A.RQSEST=''PARCIAL'')) '+
      'AND A.RQSVISADOR IS NOT NULL '+
      'AND A.TIPOADQ=''C'' '+
      'AND A.CIAID='''+dblcCIA.Text+''' '+
      'AND B.ARTID = C.ARTID(+) '+
      'AND A.CCOSID = D.CCOSID(+) '+
      'AND B.UNMIDG = E.UNMID(+) '+
      'AND (B.DRQSCNSG - B.DRQSCNAG > 0 OR B.DRQSCNSU - B.DRQSCNAU > 0) '+
      'GROUP BY  A.CIAID, A.TIPOADQ, B.ARTID, B.UNMIDG, C.ARTDES, B.RQSMARK, B.RQSFLAGUM, E.UNMABR '+
      'ORDER BY  B.ARTID, A.CIAID , B.UNMIDG, C.ARTDES, B.RQSMARK ';

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
	DMLOG.cdsArtPend.DataRequest(xSql);
	DMLOG.cdsArtPend.Open;
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

function TFRegSolCot.Serpend : Integer;
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

procedure TFRegSolCot.Z2bbtnRegOkClick(Sender: TObject);
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
		except
    	on E: Exception do EHandlerError( E );
    end;
  end;
  if DMLOG.wModo = 'A' then
    Z2dbgDReqsIButton.Click;
end;

procedure TFRegSolCot.Z2bbtnRegCancClick(Sender: TObject);
begin
 if DMLOG.cdsDSolCot.State in [dsInsert,dsEdit] then
    DMLOG.cdsDSolCot.Cancel;
 OnOffDetalle(True); // activar detalle
 pnlDetalleA.Visible := False;
end;

procedure TFRegSolCot.OnOffCabecera(Value: Boolean);
begin
  //....................... activar cabecera de requisición ...................
  pnlCabecera.Enabled := Value;
  Z2bbtnBorrar.Enabled  := Value;
  Z2bbtnOK.Enabled 	  := Value;
end;

procedure TFRegSolCot.OnOffDetalle(Value: Boolean);
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

procedure TFRegSolCot.btnDetalle;
var
  bDummy1, bDummy2, bDummy3 : Boolean;
begin
  bDummy1:=((DMLOG.cdsDSolCot.ChangeCount>0) or (DMLOG.cdsDSolCot.Modified) or
            (DMLOG.cdsSolCot.ChangeCount>0)  or (DMLOG.cdsSolCot.Modified) );
  bDummy2:= True;
  if trim(DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString)<> 'INICIAL' then begin
     OnOffCabecera(False); //Activar la cabecera
     OnOffDetalle(False); //Activar la cabecera
     bDummy2:=False;
     end
  else begin
     if not pnlDetalleG.Enabled then
        bDummy2:=False
     else
        if trim(DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString)='INICIAL' then
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

procedure TFRegSolCot.Z2bbtnNuevoClick(Sender: TObject);
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

procedure TFRegSolCot.dbgDReqsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=$4D) and (ssCtrl in Shift)  then
  begin
    dbgDReqsDblClick(nil);
	end;

  if (Key=VK_DELETE) and (ssCtrl in Shift)  then
  begin
    if trim(DMLOG.cdsSolCot.FieldbyName('SCCEST').AsString) = 'INICIAL' then
    begin
      DMLOG.cdsDSolCot.Delete;
    end
    else ErrorMsg('Error','No se puede borrar...');
  end;
	 btnDetalle;
end;

procedure TFRegSolCot.dbgDReqsDblClick(Sender: TObject);
var
	ssql : string;
begin
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

procedure TFRegSolCot.dbeNumSolExit(Sender: TObject);
begin
  if bExit then Exit;
  if DMLOG.wModo = 'A' then
  begin
  	{if DMLOG.IsExistSol( DMLOG.cdsSolCot.FieldByName('CIAID').AsString,
                     DMLOG.cdsSolCot.FieldByName('SCCID').AsString ) then
  	begin
  		ErrorMsg('Error','Ya existe una solicitud '+#13+
                       'con el mismo número ... '+DMLOG.cdsSolCot.FieldByName('SCCID').AsString);}
    	DMLOG.cdsSolCot.FieldByName('SCCID').AsString := DMLOG.StrZero(DMLOG.MaxSCC(DMLOG.cdsSolCot.FieldByName('CIAID').AsString),8);
  end;
end;

procedure TFRegSolCot.dbmObsKeyPress(Sender: TObject; var Key: Char);
//var
  //sC : String;
begin
{  sC := Key;
  sC := Uppercase(sC);
  Key:= sC[1];}
end;

procedure TFRegSolCot.FormClose(Sender: TObject; var Action: TCloseAction);
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
	DMLOG.cdsDSolCot.Close;
	DMLOG.cdsComprador.Close;
	DMLOG.cdsArtPend.Close;
	DMLOG.cdsAlm.Close;
	DMLOG.cdsTSolCot.close;
	DMLOG.cdsTipSol.close;
   DMLOG.cdsPRIO.Close;
	DMLOG.cdsLEntrega.close;
	DMLOG.cdsFPago.close;
	DMLOG.cdsUMed.Close;

	DMLOG.cdsDReqs.Close;
	DMLOG.cdsDReqs.MasterSource    := Nil;
	DMLOG.cdsDReqs.MasterFields    := '';
	DMLOG.cdsDReqs.IndexFieldNames := '';

   if DMLOG.wReqComp = 'S' then
	   DMLOG.cdsComprador.Close;

	DMLOG.cdsLOC.Close;
   DMLOG.cdsALM.Close;

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

function TFRegSolCot.EHandlerError(Ex : Exception ) : Boolean;
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

procedure TFRegSolCot.dblcExist(Sender: TObject);
var
  bRq : Boolean;
	xSql:String;
begin
  if TwwDBCustomLookupCombo(Sender).DataSource <> nil then
    bRq := TwwDBCustomLookupCombo(Sender).DataSource.DataSet.FieldByName(TwwDBCustomLookupCombo(Sender).DataField).Required;
  if (bRq) and (trim(TwwDBCustomLookupCombo(Sender).Text)='') then
    TwwDBCustomLookupCombo(Sender).DropDown;
  xSql:='';
  if Sender = dblcCIA then
  begin
  	xSql:='CIAID='''+dblcCIA.Text+'''';
		dbeCIA.Text:=DMLOG.DisplayDescrip('prvLOG','TGE101','*',xSql,'CIADES');

    DMLOG.cdsFPago.Close;
		DMLOG.cdsFPago.DataRequest('SELECT * FROM CXC101 WHERE CIAID='''+dblcCIA.Text+'''');
		DMLOG.cdsFPago.Open;

  	if DMLOG.wModo = 'A' then
    	dbeNumSol.OnExit(sender);
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
end;

procedure TFRegSolCot.dblcNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFRegSolCot.dbdtpFEntregaExit(Sender: TObject);
begin
	if (dbdtpFEntrega.Text<>'') then
  	if not(StrToDate(dbdtpFEntrega.Text) >= StrToDate(dbdtpFLimite.Text)) and
       not(StrToDate(dbdtpFEntrega.Text) >= StrToDate(dbdtpFSolicitud.Text))  then
    		raise Exception.Create('La Fecha de Entrega debe ser mayor'+#13+' a la Fecha de Límite y a la Fecha de Solicitud...');
       
end;

procedure TFRegSolCot.dbdtpFLimiteExit(Sender: TObject);
begin
  if (dbdtpFLimite.Text<>'') then
    if not(StrToDate(dbdtpFLimite.Text)>= StrToDate(dbdtpFSolicitud.Text)) then
       raise Exception.Create('La Fecha Límite debe ser mayor'+#13+' a la Fecha de Solicitud...');
  if spbDiaVig.text = '' then
   DMLOG.cdsSolCot.fieldbyname('SCCDIVIG').AsString := '0';
//  	spbDiaVig.Value := 0;
end;

procedure TFRegSolCot.dcCIA;
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


procedure TFRegSolCot.spbDiaVigExit(Sender: TObject);
begin
  if spbDiaVig.text = '' then
   DMLOG.cdsSolCot.fieldbyname('SCCDIVIG').AsString := '0';
//  	spbDiaVig.text := '0';
   if strtoint(spbDiaVig.Text)<0 then
   begin
      ShowMessage('Días de Vigencia debe ser mayor o igual a cero');
      spbDiaVig.SetFocus;
   end;
end;

procedure TFRegSolCot.dblcTipSolExit(Sender: TObject);
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
    dbeNumSol.OnExit(sender);
  if DMLOG.cdsSolCot.State = dsInsert then
   begin
		//08/11/2000    dblcTSolCot.Text:='';
		//08/11/2000    dbeTSolCot.Text:='';
    dbdtpFSolicitud.Date:=date;
    DMLOG.cdsSolCot.fieldbyname('SCCDIVIG').AsString := '1';
		//spbDiaVig.Value:=1;
   end;
end;

procedure TFRegSolCot.dblcTipSolNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFRegSolCot.Z2bbtnRegActCancClick(Sender: TObject);
begin
 if DMLOG.cdsDSolCot.State in [dsInsert,dsEdit] then
    DMLOG.cdsDSolCot.Cancel;

 OnOffDetalle(True); // activar detalle
 pnlDetalleC.Visible := False;
end;

procedure TFRegSolCot.Z2bbtnRegSerCancClick(Sender: TObject);
begin
	Screen.Cursor:=crHourGlass;
 	if DMLOG.cdsDSolCot.State in [dsInsert,dsEdit] then
  	DMLOG.cdsDSolCot.Cancel;
 	OnOffDetalle(True); // activar detalle
 	pnlDetalleB.Visible := False;
  Screen.Cursor:=crDefault;
end;

procedure TFRegSolCot.dblcUNMIDActExit(Sender: TObject);
var
	ssql : String;
begin
	ssql := 'UNMID=' + quotedStr(dblcUNMIDAct.Text);
	vUMActSer:=dblcUNMIDAct.Text;
	edtUNMIDAct.text :=  DMLOG.displaydescrip('prvSQL','TGE130','UNMDES',ssql,'UNMDES');
end;

procedure TFRegSolCot.dblcUNMIDSerExit(Sender: TObject);
var
  ssql : String;
begin
  ssql := 'UNMID=' + quotedStr(dblcUNMIDSer.Text);
  edtUNMIDSer.text :=  DMLOG.displaydescrip('prvSQL','TGE130','UNMDES',ssql,'UNMDES');
end;

procedure TFRegSolCot.dblcUNMIDExit(Sender: TObject);
var
	sSQL : String;
begin
	sSQL := 'UNMID=' + quotedStr(dblcUNMID.Text);
	edtUNMID.text :=  DMLOG.displaydescrip('prvSQL','TGE130','UNMDES',ssql,'UNMDES');
end;

procedure TFRegSolCot.dbcldArtiExit(Sender: TObject);
//var
	//sSQL : string;
begin
	//sSQL := 'ARTID='+quotedstr(dbcldArti.text);
	//dbeArti.text := DMLOG.DisplayDescrip('prvSQL','TGE205','ARTDES',sSQL,'ARTDES');
end;

procedure TFRegSolCot.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
	begin
		if self.ActiveControl Is TMemo then Exit;
		if self.ActiveControl Is TDBMemo then Exit;
		key:=#0;
		perform(CM_DialogKey,VK_TAB,0);
	end;
end;

procedure TFRegSolCot.dbcbFLAGExit(Sender: TObject);
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

procedure TFRegSolCot.FormCreate(Sender: TObject);
begin
   if DMLOG.cdsCia.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsCia,'TGE101','CIAID','CIAID');
   dblcCIA.LookupTable:=DMLOG.cdsCia;

   if DMLOG.cdsTipSol.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsTipSol,'TGE173','TIPOADQ','TIPOADQ');
   dblcTipSol.LookupTable:=DMLOG.cdsTSolCot;

   if DMLOG.cdsTSolCot.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsTSolCot,'TGE137','TSCID','TSCID');
   dblcTSolCot.LookupTable:=DMLOG.cdsTSolCot;

   if DMLOG.cdsPRIO.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsPrio,     'TGE155', 'PRIOID', 'PRIOID');
   dblcPRIO.LookupTable:=DMLOG.cdsPRIO;

   if DMLOG.cdsComprador.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsComprador,    'TGE135', 'COMPCID', 'COMPCID');
   dblcComprador.LookupTable:=DMLOG.cdsComprador;

   if DMLOG.cdsTMoneda.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsTMoneda,    'TGE103', 'TMONID', 'TMONID');
   dblcTMoneda.LookupTable:=DMLOG.cdsTMoneda;

   if DMLOG.cdsLEntrega.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsLEntrega,    'TGE136', 'LGECID', 'LGECID');
   dblcLEntrega.LookupTable:=DMLOG.cdsLEntrega;

   if DMLOG.cdsFPago.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsFPago,    'CXC101', 'CCOMERID', 'CCOMERID');
   dblcFPago.LookupTable:=DMLOG.cdsFPago;

   if DMLOG.cdsUMed.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsUMed,'TGE130','UNMID','UNMID');
   dblcUNMID.LookupTable:=DMLOG.cdsUMed;

   dbcldArti.LookupTable:=DMLOG.cdsArti;
end;

procedure TFRegSolCot.FormShow(Sender: TObject);
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
		dblcComprador.Enabled:=True;
		dblcFPago.Enabled:=True;

	end;
end;

end.

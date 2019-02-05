unit LOG207;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,
  wwdbdatetimepicker, DBCtrls, db, wwSpeedButton, wwDBNavigator, Grids,
  Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, Wwdbspin, Wwdotdot, Wwdbcomb,
  GridControl, wwDialog, wwidlg, Variants, MsgDlgs;

type
  TFRegProf = class(TForm)
    pnlCabecera: TPanel;
    dblcCIA: TwwDBLookupCombo;
    Z2bbtnOK: TBitBtn;
    Z2bbtnBorrar: TBitBtn;
    dbmObs: TDBMemo;
    pnlDetalleG: TPanel;
    stxTitulo1: TStaticText;
    pnlDetalleA: TPanel;
    Z2bbtnRegOk: TBitBtn;
    Z2bbtnRegCanc: TBitBtn;
    stxTitulo2: TStaticText;
    dbeItem: TwwDBEdit;
    dbcldArti: TwwDBLookupComboDlg;
    dbeCntG: TwwDBEdit;
    pnlEstado: TPanel;
    Bevel1: TBevel;
    Z2bbtnRegresa: TBitBtn;
    Z2bbtnCanc2: TBitBtn;
    Z2bbtnGraba: TBitBtn;
    Z2bbtnAcepta: TBitBtn;
    Z2bbtnAnula: TBitBtn;
    Z2bbtnNuevo: TBitBtn;
    dblcTMoneda: TwwDBLookupCombo;
    dbeTMoneda: TwwDBEdit;
    dbdtpFEmi: TwwDBDateTimePicker;
    dblcCondComercial: TwwDBLookupCombo;
    dbeFPago: TwwDBEdit;
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
    dbePUnitG: TwwDBEdit;
    dbeDscto: TwwDBEdit;
    dbeImporte: TwwDBEdit;
    bvlT: TBevel;
    dbeImpInd: TwwDBEdit;
    dbeTCompra: TwwDBEdit;
    dbeTimpues: TwwDBEdit;
    btxtEstado: TDBText;
    dbseGarantia: TwwDBSpinEdit;
    dbeEvalu: TwwDBEdit;
    dbrgTipo: TDBRadioGroup;
    dbcbFLAG: TwwDBComboBox;
    dblcUNMID: TwwDBLookupCombo;
    edtEvalu: TEdit;
    dbeISC: TwwDBEdit;
    dbeTISC: TwwDBEdit;
    Z2btnDesc: TButton;
    dbeDesc: TwwDBEdit;
    pnlDetalleB: TPanel;
    Z2bbtnRegOk1: TBitBtn;
    Z2bbtnRegCanc1: TBitBtn;
    stxTitulo3: TStaticText;
    dbeItem1: TwwDBEdit;
    dbePUnitG1: TwwDBEdit;
    dbeDscto1: TwwDBEdit;
    dbeImporte1: TwwDBEdit;
    dbeImpInd1: TwwDBEdit;
    dbcbFLAG1: TwwDBComboBox;
    dblcUNMID1: TwwDBLookupCombo;
    dbeISC1: TwwDBEdit;
    edtCia: TEdit;
    edtProv: TEdit;
    dbeNReg: TwwDBEdit;
    dblcdNSol: TwwDBLookupComboDlg;
    dbeTFlete: TwwDBEdit;
    edtUMedDes1: TEdit;
    edtUMedDes: TEdit;
    edtCant: TEdit;
    lblCant: TLabel;
    Label1: TLabel;
    DBText1: TDBText;
    edtActSer: TEdit;
    lblimporte1: TLabel;
    lblImporte: TLabel;
    DBMemo1: TMemo;
    dbgDReqs: TwwDBGrid;
    pnlValores: TPanel;
    dbgValores: TwwDBGrid;
    StaticText1: TStaticText;
    pnlBtns: TPanel;
    Z2bbtnPrint: TBitBtn;
    BitBtn2: TBitBtn;
    Z2bbtnSalir: TBitBtn;
    BitBtn3: TBitBtn;
    btnValores: TBitBtn;
    dbeArti: TMemo;
    dbeValor: TwwDBEdit;
    dbdtpFechaEntrega: TwwDBDateTimePicker;
    procedure Z2bbtnOKClick(Sender: TObject);
    procedure Z2bbtnBorrarClick(Sender: TObject);
    procedure Z2bbtnRegresaClick(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure Z2bbtnCanc2Click(Sender: TObject);
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure Z2bbtnAnulaClick(Sender: TObject);
    procedure Z2bbtnRegOkClick(Sender: TObject);
    procedure Z2bbtnRegCancClick(Sender: TObject);
    procedure Z2bbtnNuevoClick(Sender: TObject);
    procedure dbgDReqsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgDReqsDblClick(Sender: TObject);
    procedure dbmObsKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbcldArtiChange(Sender: TObject);
    //procedure dblcUMedChange(Sender: TObject);
    procedure dblcEditExit(Sender: TObject);
    procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure dbeDsctoExit(Sender: TObject);
    procedure dedNProformaExit(Sender: TObject);
    //procedure dbrgTImpueChange(Sender: TObject);
    procedure dbeImpIndExit(Sender: TObject);
    procedure dblcCondComercialExit(Sender: TObject);
    procedure dblcdExits(Sender: TObject);
    procedure Z2btnDescClick(Sender: TObject);
    procedure dbeDescExit(Sender: TObject);
    procedure dbrgTipoChange(Sender: TObject);
    procedure dbePUnitGExit(Sender: TObject);
    procedure dbdtpFAttExit(Sender: TObject);
    procedure dbseEntExit(Sender: TObject);
    procedure dbsbValExit(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure dbseGarantiaExit(Sender: TObject);
    procedure dblcTMonedaExit(Sender: TObject);
    procedure dbePUnitG1Exit(Sender: TObject);
    procedure pnlDetalleAEnter(Sender: TObject);
    procedure dblcUNMIDExit(Sender: TObject);
    procedure dblcUNMID1Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure dblcdNSolInitDialog(Dialog: TwwLookupDlg);
    procedure btnValoresClick(Sender: TObject);
    procedure Z2bbtnSalirClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
		procedure dbgValoresCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbeValorEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
	private
		{ Private declarations }
		iEstado : Integer;
		vciatasa,wflagedit : string;
		sTipoADQ : string;

		procedure AsigDat;
		procedure OnOffDetalle ( Value : Boolean );
		procedure OnOffCabecera( Value : Boolean );
		procedure btnDetalle;
		procedure lblEstado;
		procedure cSetFocus ( Sender: TObject ; const sMsg : String);
		procedure CalTotal(Sender : TObject);
		function  EHandlerError(Ex : Exception ) : Boolean;
      procedure AsignaValoresNoEditables;
      procedure dcCIA;
		Function  wPreUni : integer;
      procedure VerificaValoresDeEvaluacion;
  public
    { Public declarations }
    fGraba : Boolean;

  end;

var
  FRegProf: TFRegProf;
	SQLFiltro  : String;
	sSQL, wIGV : String;
   sDato:string;
implementation

uses LOGDM1, oaAD3000;

{$R *.DFM}

procedure TFRegProf.Z2bbtnOKClick(Sender: TObject);
var
	iMxE,	vitem   : Integer;
	vigv, visc, vimporart : double;
 	sSQL1,sSQL,xSql, wArtdes : string;
begin
	iMxE :=0; vitem := 0; vimporart :=0; vigv:=0; visc:=0; wArtdes:='';
	if DMLOG.cdsProforma.State in [dsInsert,dsEdit] then
	try
		AsigDat; // asignar los datos predeterminados
		Screen.Cursor:=crHourGlass;
		if DMLOG.wModo = 'A' then
		begin
			DMLOG.cdsProforma.FieldByName('PROFID').asString := DMLOG.StrZero( DMLOG.UltimoNum('prvSQL','LOG312','PROFID','CIAID='+quotedStr(dblcCIA.text)),8);
		end;
		DMLOG.cdsProforma.Post;
		SQLFiltro:= 'SELECT * FROM  LOG312 '+
								'WHERE CIAID='''+dblcCIA.Text+''' '+
								'AND PROFID='''+dbeNReg.Text+'''';
		DMLOG.cdsProforma.DataRequest( SQLFiltro ) ;

		//DMLOG.ControlTran;
		if SRV_D <> 'DB2400' then
    begin
			Errorcount:=0;
			DMLOG.DCOM1.AppServer.IniciaTransaccion;
    end;

		DMLOG.ControlTran( 0, DMLOG.cdsProforma,'PROFORMA');

		btnValores.Enabled := True;
		sSQL:='INSERT INTO LOG326 '+
    			'SELECT '''+dblcCIA.Text+''', '''+dblcdNSol.Text+''', '''+dbeNReg.Text+''', ''01'', CCOCODID, '+
          'CCODESC, ''-'', CCOTEND, CCOPTOS, 0, 0, '''', '''' '+
          'FROM LOG101 WHERE FLAG=''C'' '+
					'AND CCOCODID NOT IN (SELECT CCOCODID '+
          'FROM LOG326 '+
          'WHERE CIAID='''+dblcCIA.Text+''' '+
          'AND SCCID='''+dblcdNSol.Text+''' '+
          'AND PROFID='''+dbeNReg.Text+''')';
    Try
    	DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
		Except
			DMLOG.ControlTran( 1, nil, '' );
		End;

		DMLOG.ControlTran( 8, nil, '' );		// Fin del StartTra..

		sTipoADQ := DMLOG.cdsProforma.fieldbyName('TIPOADQ').asString;
		xSQL := 'SELECT * FROM LOG303 '+
						'WHERE CIAID='''+dblcCIA.Text+''' '+
						'AND SCCID='+QuotedStr(dblcdNSol.value);
		DMLOG.cdsSQL.Close;
		DMLOG.cdsSQL.DataRequest(xSQL);
		DMLOG.cdsSQL.Open;

		xSQL:='SELECT * FROM LOG313 '+
					'WHERE CIAID='+QuotedStr(dblcCIA.Text)+' '+
					'AND PROFID='+QuotedStr(dbeNReg.Text)+' '+
					'ORDER BY CIAID, PROFID, DPROFID';

		DMLOG.cdsDProforma.Close;
		DMLOG.cdsDProforma.DataRequest(xSQL);
		DMLOG.cdsDProforma.Open;

		if DMLOG.cdsDProforma.RecordCount=0 then
		begin
			DMLOG.cdsSQL.First;
			while not DMLOG.cdsSQL.Eof do
			begin
				DMLOG.cdsDProforma.Insert;
				vitem := vitem + 1;
				DMLOG.cdsDProforma.FieldByName('CIAID').AsString      := dblcCIA.Text;
				DMLOG.cdsDProforma.FieldByName('PROFID').AsString     := dbeNReg.Text;
				DMLOG.cdsDProforma.FieldByName('DPROFID').AsString    := DMLOG.StrZero(IntToStr(vitem),3);
				DMLOG.cdsDProforma.FieldByName('ARTID').AsString      := DMLOG.cdsSQL.fieldbyname('ARTID').AsString;
				DMLOG.cdsDProforma.FieldByName('DPROFLAGUM').AsString := DMLOG.cdsSQL.fieldbyname('SCCFLAGUM').AsString;
				//DMLOG.cdsDProforma.FieldByName('DPROFDSCTO').AsString := '0';
				//DMLOG.cdsDProforma.FieldByName('DPROFIMPU').AsString  := '0';
				//DMLOG.cdsDProforma.FieldByName('DPROFISC').AsString   := '0';
				DMLOG.cdsDProforma.FieldByName('DPROFPROV').AsString  := dblcdProv.Text;
				DMLOG.cdsDProforma.FieldByName('DPROFPRVD').AsString  := edtProv.Text;
				DMLOG.cdsDProforma.FieldByName('DPROFTEN').AsString   := dbseEnt.Text;
				DMLOG.cdsDProforma.FieldByName('DPROFGARAN').AsString := dbseGarantia.Text;
				DMLOG.cdsDProforma.FieldByName('DPROFGARDMA').AsString:= dbrgTipo.Value;
				DMLOG.cdsDProforma.FieldByName('DPROFVALID').AsString := dbsbVal.TEXT;
				DMLOG.cdsDProforma.FieldByName('DPROFEVAL').AsString  := dbeEvalu.TEXT;
				DMLOG.cdsDProforma.FieldByName('TIPOADQ').AsString    := sTipoADQ;

				DMLOG.cdsDProforma.FieldbyName('PROFANO').AsString    := DMLOG.cdsProforma.FieldbyName('PROFANO').AsString;
				DMLOG.cdsDProforma.FieldbyName('PROFMES').AsString    := DMLOG.cdsProforma.FieldbyName('PROFMM').AsString;
				DMLOG.cdsDProforma.FieldbyName('PROFDIA').AsString    := DMLOG.cdsProforma.FieldbyName('PROFDD').AsString;
				DMLOG.cdsDProforma.FieldbyName('PROFTRIM').AsString   := DMLOG.cdsProforma.FieldbyName('PROFTRI').AsString;
				DMLOG.cdsDProforma.FieldbyName('PROFSEM').AsString    := DMLOG.cdsProforma.FieldbyName('PROFSEM').AsString;
				DMLOG.cdsDProforma.FieldbyName('PROFANOMES').AsString := DMLOG.cdsProforma.FieldbyName('PROFANOMM').AsString;
				DMLOG.cdsDProforma.FieldbyName('PROFSS').AsString     := DMLOG.cdsProforma.FieldbyName('PROFSS').AsString;
				DMLOG.cdsDProforma.FieldbyName('PROFAATRI').AsString  := DMLOG.cdsProforma.FieldbyName('PROFAATRI').AsString;
				DMLOG.cdsDProforma.FieldbyName('PROFAASEM').AsString  := DMLOG.cdsProforma.FieldbyName('PROFAASEM').AsString;
				DMLOG.cdsDProforma.FieldbyName('PROFAASS').AsString   := DMLOG.cdsProforma.FieldbyName('PROFAASS').AsString;
				DMLOG.cdsDProforma.FieldByName('PROFUSER').AsString   := DMLOG.wUsuario;
				DMLOG.cdsDProforma.FieldByName('DPROFCONCOM').AsString:= DMLOG.cdsProforma.FieldbyName('PROFCONCOM').AsString;

				sSQL := 'CIAID=' + QuotedStr(dblcCIA.Text)+' AND CCOMERID='+QuotedStr(dblcCondComercial.Text);
				if DMLOG.displaydescrip('prvSQL','CXC101','CREDITO',sSQL,'CREDITO') = 'S' then
					DMLOG.cdsDProforma.FieldByName('DPROFTIPCCOM').AsString  := '1'
				else
					DMLOG.cdsDProforma.FieldByName('DPROFTIPCCOM').AsString  := '2';

				if sTipoADQ = 'C' then
				begin
					sSQL:='CIAID='+QuotedStr(dblcCIA.Text)+' AND ARTID='+QuotedStr(DMLOG.cdsDProforma.FieldByName('ARTID').AsString);
					DMLOG.DisplayDescrip('prvSQL', 'TGE205', 'ARTID, ARTDES, TINID, GRARID, FAMID, SFAMID', sSQL, 'ARTID');

					wArtdes:=Trim(DMLOG.cdsQry.FieldByName('ARTDES').AsString);
					DMLOG.cdsDProforma.FieldByName('TINID').AsString     := DMLOG.cdsQry.FieldByName('TINID').AsString;
					DMLOG.cdsDProforma.FieldByName('GRARID').AsString    := DMLOG.cdsQry.FieldByName('GRARID').AsString;
					DMLOG.cdsDProforma.FieldByName('FAMID').AsString     := DMLOG.cdsQry.FieldByName('FAMID').AsString;
					DMLOG.cdsDProforma.FieldByName('SFAMID').AsString    := DMLOG.cdsQry.FieldByName('SFAMID').AsString;

					DMLOG.cdsDProforma.FieldByName('DPROFARTD').AsString := wArtdes;
					DMLOG.cdsDProforma.fieldbyName('DPROFOBS').AsString  := DMLOG.cdsSQL.FieldByName('DSCOBS').AsString;//wArtdes;

					//if DMLOG.displaydescrip('prvSQL','TGE205','ARTIGV',sSQL,'ARTIGV') = 'S' then
					//begin
						DMLOG.cdsDProforma.FieldByName('DPROFIMPU').AsString  := wIGV;//DMLOG.displaydescrip('prvSQL','TGE108','TASACAN','TASAFLG=''I''','TASACAN');
					//end;
					if DMLOG.displaydescrip('prvSQL','TGE205','ARTISC',sSQL,'ARTISC') = 'S' then
					begin
						DMLOG.cdsDProforma.FieldByName('DPROFISC').AsString  := DMLOG.displaydescrip('prvSQL','TGE108','TASACAN','TASAFLG=''S''','TASACAN');
					end;
					if DMLOG.cdsDProforma.FieldByName('DPROFLAGUM').AsString = 'G' then
					begin
						DMLOG.cdsDProforma.FieldByName('UNMIDG').AsString     := DMLOG.cdsSQL.FieldByName('UNMIDG').AsString;
						DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsString  := DMLOG.cdsSQL.FieldByName('DSCCCNTG').AsString;
						DMLOG.cdsDProforma.FieldByName('DPROFPUNG').AsString  := DMLOG.displaydescrip('prvSQL','TGE205','*',sSQL,'ARTPVG');
						if length(DMLOG.displaydescrip('prvSQL','TGE205','ARTPVG',sSQL,'ARTPVG'))=0 then
							vimporart := 0
						else
							vimporart := StrToFloat(DMLOG.cdsQry.FieldByName('ARTPVG').AsString);
						vimporart := vimporart * DMLOG.cdsDProforma.FieldByName('DPROFCNTG').Asfloat;
						if DMLOG.cdsDProforma.FieldByName('DPROFIMPU').AsFloat > 0 then
							vigv := ((vimporart*DMLOG.cdsDProforma.FieldByName('DPROFIMPU').AsFloat)/100);
						if DMLOG.cdsDProforma.FieldByName('DPROFISC').AsFloat > 0 then
							visc := ((vimporart*DMLOG.cdsDProforma.FieldByName('DPROFISC').AsFloat)/100);
						vimporart := vimporart + vigv + visc;
						DMLOG.cdsDProforma.FieldByName('DPROFIMP').AsString :=  FloatToStrF(vimporart,ffFixed,15,4);//DMLOG.FRound(vimporart,15,4); //(Format('%8.4f',[vimporart]));
						//ppDBCalc6.Text := FloatToStrF(ppDBCalc6.Value,ffFixed,15,4);
					end
					else
					begin
						DMLOG.cdsDProforma.FieldByName('UNMIDU').AsString    :=DMLOG.cdsSQL.FieldByName('UNMIDU').AsString;
						DMLOG.cdsDProforma.FieldByName('DPROFCNTU').AsString :=DMLOG.cdsSQL.FieldByName('DSCCCNTU').AsString;
						DMLOG.cdsDProforma.FieldByName('DPROFPUNU').AsString :=DMLOG.displaydescrip('prvSQL','TGE205','ARTPVU',sSQL,'ARTPVU');
						if length(DMLOG.displaydescrip('prvSQL','TGE205','ARTPVU',sSQL,'ARTPVU'))=0 then
							vimporart := 0
						else
							vimporart := StrToFloat(DMLOG.displaydescrip('prvSQL','TGE205','ARTPVU',sSQL,'ARTPVU'));
						vimporart := DMLOG.cdsDProforma.FieldByName('DPROFCNTU').AsFloat * vimporart;
						if DMLOG.cdsDProforma.FieldByName('DPROFIMPU').AsFloat > 0 then
							vigv := ((vimporart*DMLOG.cdsDProforma.FieldByName('DPROFIMPU').AsFloat)/100);
						if DMLOG.cdsDProforma.FieldByName('DPROFISC').AsFloat > 0 then
							visc := ((vimporart*DMLOG.cdsDProforma.FieldByName('DPROFISC').AsFloat)/100);
						vimporart := vimporart + vigv + visc;
						DMLOG.cdsDProforma.FieldByName('DPROFIMP').AsFloat  := FRound(vimporart,15,4);//Format('%8.4f',[vimporart]); //FloatToStr(vimporart);
          end;
        end  //TipoADQ = 'C' }
        else
        if (sTipoADQ = 'S') or (sTipoADQ = 'A') then
        begin
        	DMLOG.cdsDProforma.FieldByName('UNMIDG').AsString    := DMLOG.cdsSQL.FieldByName('UNMIDG').AsString;
          DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsString := DMLOG.cdsSQL.FieldByName('DSCCCNTG').AsString;
          DMLOG.cdsDProforma.fieldbyName('DPROFOBS').AsString  := DMLOG.cdsSQL.FieldByName('DSCOBS').AsString;
        end; //TipoADQ = 'S' or TipoADQ = 'A'
        DMLOG.cdsDProforma.Post;
        DMLOG.cdsSQL.Next;
      end;
  	end;
		//DMLOG.ControlTran;
    CalTotal(nil);
  except
  	on E: Exception do
    	if not EHandlerError( E ) then raise;
	end;
  OnOffCabecera(False); //Desactivar el panel de Cabecera
  OnOffDetalle(True);   //Activar el panel de detalle
  pnlDetalleG.SetFocus;
  btnDetalle;
  Screen.Cursor:=crDefault;  
end;

procedure TFRegProf.Z2bbtnBorrarClick(Sender: TObject);
begin
	Screen.Cursor:=crHourGlass;
	DMLOG.cdsProforma.CancelUpdates;
  if (wModo='A') and (not fGraba) then
  begin
  	Z2bbtnNuevoClick(Self);
  end;
  Screen.Cursor:=crDefault;
end;

procedure TFRegProf.AsigDat;
var
	D, M, Y : Word;
	sFecha, sSQL : String;
begin
	// --> Asignar datos de cabecera de requisición
	if DMLOG.cdsProforma.State in [dsInsert, dsEdit] then
	begin
		DecodeDate(DMLOG.cdsProforma.fieldbyname('PROFFREG').AsDateTime, Y, M, D);
		if Length(dblcCIA.Text)=0   then Raise Exception.Create('Falta Companía');
      if Length(dbseGarantia.Text)=0 then Raise Exception.Create('Falta Garantía');
		if Length(dbeNReg.Text)=0   then Raise Exception.Create('Falta No.Registro');
		if Length(dblcdNSol.Text)=0 then Raise Exception.Create('Falta No.Solicitud');
		if dbdtpFEmi.Date=0         then Raise Exception.Create('Falta Fecha Emisión');
		if Length(dblcdProv.Text)=0 then Raise Exception.Create('Falta Proveedor');
		if Length(dedNproforma.Text)=0 then Raise Exception.Create('Falta No. Proforma');
		if dbdtpFAtt.Date=0         then Raise Exception.Create('Falta Fecha Atención');
		if dbdtpFechaEntrega.Date=0     then Raise Exception.Create('Falta Fecha de Entrega');
		if Length(dblcTMoneda.Text)=0 then Raise Exception.Create('Falta Tipo de Moneda');
		if Length(dbeTCambio.Text)=0 then Raise Exception.Create('Falta Tipo de Cambio');
		if Length(dblcCondComercial.Text)=0 then Raise Exception.Create('Falta Condiciones Comerciales');

		if Length(trim(dbmObs.text)) = 0 then
			DMLOG.cdsProforma.fieldbyname('PROFOBS').AsString := '.';

		if DMLOG.cdsProforma.State in [dsInsert] then
		begin
			if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
			begin
				//DMLOG.cdsProforma.FieldbyName('PROFHREG').AsDateTime := SysUtils.Time;
			end
			else
			if SRV_D = 'ORACLE' then
			begin
				DMLOG.cdsProforma.FieldbyName('PROFHREG').AsDateTime := date+SysUtils.Time;
			end;
         DMLOG.cdsProforma.FieldbyName('PROFFARDMA').AsString   := 'D';
			DMLOG.cdsProforma.FieldbyName('PROFEST').AsString   := 'INICIAL';
			DMLOG.cdsProforma.FieldbyName('PROFTOTALG').AsFloat := 0.0;
			DMLOG.cdsProforma.FieldByName('PROFIXTCC').AsFloat  := 0.0;
			DMLOG.cdsProforma.FieldByName('PROFTTIMPU').AsFloat := 0.0;
			DMLOG.cdsProforma.FieldByName('PROFIXTD').AsFloat   := 0.0;

			sFecha := formatdatetime(DMLOG.wFormatFecha, dbdtpFemi.date);
			sSQL := 'SELECT * FROM TGE114 WHERE FECHA='+quotedstr(sFecha);
			DMLOG.FiltraCDS(DMLOG.cdsPeriodo, sSQL);
			DMLOG.cdsProforma.FieldbyName('PROFUSER').AsString   := DMLOG.wUsuario;

			DMLOG.cdsProforma.FieldbyName('PROFANO').AsString    := IntToStr(Y);
			DMLOG.cdsProforma.FieldbyName('PROFMM').AsString     := DMLOG.strzero(IntToStr(M),2);
			DMLOG.cdsProforma.FieldbyName('PROFDD').AsString     := DMLOG.strzero(IntToStr(D),2);
			DMLOG.cdsProforma.FieldbyName('PROFANOMM').AsString  := IntToStr(Y)+DMLOG.strzero(IntToStr(M),2);

			DMLOG.cdsProforma.FieldbyName('PROFTRI').AsString    := DMLOG.cdsPeriodo.fieldbyName('FECTRIM').asString;
			DMLOG.cdsProforma.FieldbyName('PROFSEM').AsString    := DMLOG.cdsPeriodo.fieldbyName('FECSEM').asString;
			DMLOG.cdsProforma.FieldbyName('PROFSS').AsString     := DMLOG.cdsPeriodo.fieldbyName('FECSS').asString;
			DMLOG.cdsProforma.FieldbyName('PROFAATRI').AsString  := DMLOG.cdsPeriodo.fieldbyName('FECAATRI').asString;
			DMLOG.cdsProforma.FieldbyName('PROFAASEM').AsString  := DMLOG.cdsPeriodo.fieldbyName('FECAASEM').asString;
			DMLOG.cdsProforma.FieldbyName('PROFAASS').AsString   := DMLOG.cdsPeriodo.fieldbyName('FECAASS').asString;

			DMLOG.cdsProforma.FieldbyName('PROFFREG').AsDateTime := Date;
      //DMLOG.cdsProforma.FieldbyName('PROFHREG').AsDateTime := SysUtils.Time;
      //DMLOG.cdsProforma.FieldbyName('FlaGVAR').AsString    := '';
      DMLOG.cdsProforma.FieldbyName('TIPOADQ').asString    := DMLOG.displayDescrip('prvSQL','LOG302','TIPOADQ','SCCID='''+dblcdNSol.value+'''','TIPOADQ');
    end;
    {dbdtpFEntregaExit(nil);
    dbdtpFLimiteExit(nil);}
  end;
end;

procedure TFRegProf.Z2bbtnRegresaClick(Sender: TObject);
begin
	if DMLOG.cdsDProforma.RecordCount = 0 then
	begin
		dblcdNSol.Enabled:=True;
		dblcdProv.Enabled:=True;
      //dblcTipoCompra.Enabled:=True;
	end
	else
	begin
		dblcdNSol.Enabled:=False;
		dblcdProv.Enabled:=False;
      //dblcTipoCompra.Enabled:=False;
	end;

	DMLOG.cdsProforma.Edit;
  DMLOG.wModo := 'M';  
  OnOffCabecera(True);
  OnOffDetalle(False);
end;

procedure TFRegProf.Z2bbtnGrabaClick(Sender: TObject);
begin
	try
		Screen.Cursor:=crHourGlass;
		if dblcdNSol.Text = '' then
		begin
			DMLOG.cdsDproforma.FieldByName('DPROFEVAL').AsString:= 'A';
			DMLOG.cdsProforma.FieldByName('PROFEVAL').AsString  := 'A';
			showmessage('La Proforma ha sido Grabada como Evaluada y Aceptada');
		end;
		dbeDescExit(nil);
		//DMLOG.ControlTran;
		DMLOG.ControlTran( 0, DMLOG.cdsProforma,'PROFORMA');
		DMLOG.ControlTran( 0, DMLOG.cdsDProforma, 'DPROFORMA');
		fGraba:= True;
		dbeDesc.Enabled := False;
		btnDetalle;
		Z2bbtnGraba.Enabled:=False;		
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFRegProf.Z2bbtnCanc2Click(Sender: TObject);
var
	sSQL : String;
begin
	if DMLOG.wModo='A' then
  begin
		if not Question('Confirmar', 'Esta Seguro de Cancelar La Proforma '+ #13+#13+
							 DMLOG.cdsProforma.FieldByName('PROFID').AsString  + '  -  '+
							 DMLOG.cdsProforma.FieldByName('PROV').AsString  +' '+edtProv.Text+
               #13+ #13 +' Desea Continuar ') then
		begin
			sSQL:='DELETE FROM LOG312 '+
						'WHERE CIAID='''+dblcCIA.Text+''' '+
						'AND PROFID='''+dbeNReg.Text+'''';
      Try
      	DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      end;
			sSQL:='DELETE FROM LOG313 '+
						'WHERE CIAID='''+dblcCIA.Text+''' '+
						'AND PROFID='''+dbeNReg.Text+'''';
      Try
      	DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      end;
      DMLOG.cdsProforma.Delete;
      {sSQL:='DELETE FROM LOG312 '+
          ' WHERE CIAID='''+dblcCIA.Text+''' '+
          ' AND SCCID='''+dblcdNSol.Text+''' '+
          ' AND PROFID='''+dbeNReg.Text+'''';
      Try
      	DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      end;}
      DMLOG.wModo := '';
      Z2bbtnNuevo.Click;
    end;
  end;
	DMLOG.cdsDProforma.CancelUpdates;
	//DMLOG.cdsProforma.Edit;
 	OnOffCabecera(True);
 	OnOffDetalle(False);
end;

procedure TFRegProf.Z2bbtnAceptaClick(Sender: TObject);
var
	sSQL, CCOID, CCODE, CCOTE, CCOPT : String;
begin
	if (trim(DMLOG.cdsProforma.FieldbyName('PROFEST').AsString) = 'INICIAL') and
		 (DMLOG.cdsDProforma.RecordCount>0)  and
		 (wPreUni = 0	)	then // inicial...
	begin
      VerificaValoresDeEvaluacion;
		if not Question('Confirmar', 'Esta Seguro de Aceptar La Proforma '+ #13+#13+
							 DMLOG.cdsProforma.FieldByName('PROFID').AsString  + '  -  Prov. '+
							 DMLOG.cdsProforma.FieldByName('PROV').AsString  +' '+edtProv.Text+
							 #13+ #13 +' Desea Continuar ') then
		begin
			Exit;
		end;
		try
			Screen.Cursor:=crHourGlass;
			btnValores.Enabled := False;
			if DMLOG.cdsProforma.State in [dsBrowse] then
			begin
				DMLOG.cdsProforma.Edit;
				DMLOG.cdsProforma.FieldbyName('PROFEST').AsString := 'ACEPTADO';
				DMLOG.cdsProforma.Post;
				//DMLOG.ControlTran;
				if SRV_D <> 'DB2400' then
      		begin
					ErrorCount:=0;
 					DMLOG.DCOM1.AppServer.IniciaTransaccion;
            end;

				DMLOG.ControlTran( 0, DMLOG.cdsProforma, 'PROFORMA');

				DMLOG.DisplayDescrip('prvSQL','LOG101','*','FLAG=''D'' AND TIPOEVAL=''PR''','CCOCODID');
				CCOID:=DMLOG.cdsqry.fieldbyname('CCOCODID').AsString;
				CCODE:=DMLOG.cdsqry.fieldbyname('CCODESC').AsString;
				CCOTE:=DMLOG.cdsqry.fieldbyname('CCOTEND').AsString;
				CCOPT:=DMLOG.cdsqry.fieldbyname('CCOPTOS').AsString;

            IF DMLOG.cdsQry.RecordCount>0 then
            begin
              if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
              begin
                 sSQL:='INSERT INTO LOG326 '+
                          'SELECT '''+dblcCIA.Text+''', '''+dblcdNSol.Text+''', '''+dbeNReg.Text+''', ''01'', '+
                          ''''+CCOID+''', '''+CCODE+''', ARTID, '''+CCOTE+''', '+CCOPT+', DPROFIMP, 0, SUBSTR(DPROFOBS,1,30), TINID '+
                          'FROM LOG313 '+
                          'WHERE ARTID NOT IN (SELECT ARTID '+
                                                        'FROM LOG326 '+
                                                        'WHERE CIAID='''+dblcCIA.Text+'''  '+
                                                        'AND PROFID='''+dbeNReg.Text+''')'+
                           'AND CIAID='''+dblcCIA.Text+''' '+
                           'AND PROFID='''+dbeNReg.Text+'''';
              end
              else
              if SRV_D = 'ORACLE' then
              begin
                 sSQL:='INSERT INTO LOG326 '+
                          'SELECT '''+dblcCIA.Text+''', '''+dblcdNSol.Text+''', '''+dbeNReg.Text+''', ''01'', '+
                          ''''+CCOID+''', '''+CCODE+''', ARTID, '''+CCOTE+''', '+CCOPT+', DPROFIMP, 0, SUBSTR(DPROFOBS,1,30), TINID '+
                          //''''+CCOID+''', '''+CCODE+''', ARTID, '''+CCOTE+''', '+CCOPT+', DECODE(DPROFCNTG, NULL, DPROFPUNU, DPROFPUNG), 0, SUBSTR(DPROFOBS,1,30) '+
                          'FROM LOG313 '+
                          'WHERE ARTID NOT IN (SELECT ARTID '+
                                                        'FROM LOG326 '+
                                                        'WHERE CIAID='''+dblcCIA.Text+''' '+
                                                        'AND PROFID='''+dbeNReg.Text+''')'+
                           'AND CIAID='''+dblcCIA.Text+''' '+
                           'AND PROFID='''+dbeNReg.Text+'''';
              end;
              Try
                 DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
              except
                 DMLOG.ControlTran( 1, Nil, '');
              end;
            end;
				DMLOG.ControlTran( 8, Nil, '');
			end;
		finally
			Screen.Cursor:=crDefault;
		end;
	end;
	btnDetalle;
end;

Function  TFRegProf.wPreUni : integer;
var
	wConta : Integer;
begin
	wConta := 0;
  DMLOG.cdsDProforma.DisableControls;
  DMLOG.cdsDProforma.First;
  while not DMLOG.cdsDProforma.Eof do
  begin
    if DMLOG.cdsDProforma.FieldByName('DPROFPUNG').AsFloat = 0.0 then
    	wConta:=wConta+1;
  	DMLOG.cdsDProforma.Next;
  end;
  DMLOG.cdsDProforma.First;
  DMLOG.cdsDProforma.EnableControls;
  if wConta > 0 then
  	ErrorMsg('Adquisiciones', ' Al menos uno de los Campos de Precio Unitario esta en Blanco '+#13+#13+
                  'Verifique !!! ');
	Result:= wConta;
end;

procedure TFRegProf.Z2bbtnAnulaClick(Sender: TObject);
begin
	if (trim(DMLOG.cdsProforma.FieldbyName('PROFEST').AsString) = 'INICIAL') and (DMLOG.cdsDProforma.RecordCount>0)  then
  begin
    if DMLOG.cdsProforma.State in [dsBrowse] then
    begin
    	DMLOG.cdsProforma.Edit;
      DMLOG.cdsProforma.FieldbyName('PROFEST').AsString := 'ANULADO';
      DMLOG.cdsProforma.Post;
			//DMLOG.ControlTran;
			DMLOG.ControlTran( 9, DMLOG.cdsProforma, 'PROFORMA');
      //cdsProforma.ApplyUpdates(0);
    end;
  end;
  btnDetalle;
end;

procedure TFRegProf.Z2bbtnRegOkClick(Sender: TObject);
var
  sCIAID,sPROFID, sARTID, xCampo  : String;
  bExiste        : Boolean;
begin
  sCIAID  := DMLOG.cdsProforma.FieldByName('CIAID').AsString;
  sPROFID  := DMLOG.cdsProforma.FieldByName('PROFID').AsString;
  if sTipoADQ = 'C' then
  begin
    if trim(dbePUnitG.Text) = '' then
    begin
      ErrorMsg('Adquisiciones', ' La Cantidad no puede estar en blanco ');
      dbePUnitG.SetFocus;
      Exit;
    end;
    if strtofloat(dbePUnitG.Text) <= 0 then
    begin
      ErrorMsg('Adquisiciones', ' La cantidad tiene ser mayor a cero ');
      dbePUnitG.SetFocus;
      Exit;
    end;
    sARTID  := dbcldArti.Text;
    if iEstado=0 then
      bExiste := DMLOG.cdsDProforma.Locate ('CIAID;PROFID;ARTID',VarArrayOf([sCIAID,sPROFID,sARTID]),[])
    else
      bExiste := False;
    if bExiste then // localizar el valor....
    begin
      ErrorMsg( 'Error','No pueden existir artículos duplicados'+#13+
                  'en un detalle de Registro de Proformas ');
      Exit;        // salir del procedimiento
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
    DMLOG.cdsDProforma.Insert
 else
    DMLOG.cdsDProforma.Edit;

 if DMLOG.cdsDProforma.State in [dsInsert,dsEdit] then
 begin
 	try
    if dbcbFLAG.Text='G' then
       xCampo := 'UNMIDG'
    else
       xCampo := 'UNMIDU';

    if sTipoADQ = 'C' then
    begin
     DMLOG.cdsDProforma.FieldByName('DPROFID').AsString   := dbeItem.Text;
     DMLOG.cdsDProforma.FieldByName('ARTID').AsString     := dbcldArti.Text;
     DMLOG.cdsDProforma.FieldByName('DPROFOBS').AsString  := dbeArti.Text;
     DMLOG.cdsDProforma.FieldByName('DPROFDSCTO').AsString:= dbeDscto.Text;
     DMLOG.cdsDProforma.FieldByName('DPROFIMP').AsString  := dbeImporte.Text;
     DMLOG.cdsDProforma.FieldByName('DPROFIMPU').AsString := dbeImpInd.Text;
     DMLOG.cdsDProforma.FieldByName(xCampo).AsString      := dblcUNMID.Text;//DMLOG.cdsUMed.FieldByName('UNMID').AsString;
    end
    else
    begin
     DMLOG.cdsDProforma.FieldByName(xCampo).AsString      := dblcUNMID1.Text; //DMLOG.cdsUMed.FieldByName('UNMID').AsString;
     DMLOG.cdsDProforma.FieldByName('DPROFID').AsString   := dbeItem1.Text;
     DMLOG.cdsDProforma.FieldByName('ARTID').AsString     := edtActSer.Text;
     DMLOG.cdsDProforma.FieldByName('DPROFDSCTO').AsString:= dbeDscto1.Text;
     DMLOG.cdsDProforma.FieldByName('DPROFIMP').AsString  := dbeImporte1.Text;
     DMLOG.cdsDProforma.FieldByName('DPROFIMPU').AsString := dbeImpInd1.Text;
     DMLOG.cdsDProforma.FieldByName('DPROFOBS').AsString  := DBMemo1.Text;
    end;

    DMLOG.cdsDProforma.FieldByName('DPROFLAGUM').AsString := dbcbFLAG.Text;
    DMLOG.cdsDProforma.FieldByName('DPROFPROV').AsString  := dblcdProv.Text;
    DMLOG.cdsDProforma.FieldByName('DPROFPRVD').AsString  := edtProv.Text;
    //DMLOG.cdsDProforma.FieldByName('DPROFARTD').AsString  := dbeArti.Text;
    DMLOG.cdsDProforma.FieldByName('DPROFTEN').AsString   := dbseEnt.Text;
    DMLOG.cdsDProforma.FieldByName('DPROFVALID').AsString := dbsbVal.Text;
    DMLOG.cdsDProforma.FieldByName('DPROFGARDMA').AsString:= dbrgTipo.Value;
    DMLOG.cdsDProforma.FieldByName('DPROFGARAN').AsString := dbseGarantia.Text;
    DMLOG.cdsDProforma.FieldByName('DPROFEVAL').AsString  := dbeEvalu.Text;
    DMLOG.cdsDProforma.FieldByName('TIPOADQ').AsString    := sTipoADQ;
    DMLOG.cdsDProforma.FieldByName('DPROFFREG').AsDateTime:= dbdtpFReg.Date;
    {03/08/2000 sse agrego}
    if sTipoADQ = 'C' then
    begin
     if dbcbFLAG.Text = 'G' then
     begin
       //DMLOG.cdsDProforma.FieldByName('UNMIDG').AsString     := DMLOG.cdsArti.FieldByName('UNMIDG').AsString;// dbeUMedG.Text;
       DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsString  := dbeCntG.Text;
       DMLOG.cdsDProforma.FieldByName('DPROFPUNG').AsString  := dbePUnitG.Text;
     end
     else
     begin
       //DMLOG.cdsDProforma.FieldByName('UNMIDU').AsString     := DMLOG.cdsArti.FieldByName('UNMIDU').AsString;//dbeUMedU.Text;
       DMLOG.cdsDProforma.FieldByName('DPROFCNTU').AsString  := dbeCntG.Text;
       DMLOG.cdsDProforma.FieldByName('DPROFPUNU').AsString  := dbePUnitG.Text;
     end;
    end
    else
    begin
     if dbcbFLAG.Text = 'G' then
     begin
       DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsString  := edtCant.Text;//'1';
       //DMLOG.cdsDProforma.FieldByName('UNMIDG').AsString     := DMLOG.cdsArti.FieldByName('UNMIDG').AsString;// dbeUMedG.Text;
       DMLOG.cdsDProforma.FieldByName('DPROFPUNG').AsString  := dbePUnitG1.Text;
     end
     else
     begin
       DMLOG.cdsDProforma.FieldByName('DPROFCNTU').AsString  := edtCant.Text;//'1';
       //DMLOG.cdsDProforma.FieldByName('UNMIDU').AsString     := DMLOG.cdsArti.FieldByName('UNMIDU').AsString;//dbeUMedU.Text;
       DMLOG.cdsDProforma.FieldByName('DPROFPUNU').AsString  := dbePUnitG1.Text;
     end;
    end;
    DMLOG.cdsDProforma.Post;
    OnOffDetalle(True); // activar detalle

       if sTipoADQ = 'C'
       then       pnlDetalleA.Visible := False
       else       pnlDetalleB.Visible := False;
       btnDetalle;
       CalTotal (nil);
    except
       on E: Exception do EHandlerError( E );
    end;
    Z2btnDesc.Enabled := True;
 end;
end;

procedure TFRegProf.Z2bbtnRegCancClick(Sender: TObject);
begin
	if DMLOG.cdsProforma.State in [dsInsert,dsEdit] then
 		DMLOG.cdsProforma.Cancel;
	OnOffDetalle(True); // activar detalle
 	if sTipoADQ = 'C'
 	then pnlDetalleA.Visible := False
 	else pnlDetalleB.Visible := False;
end;

procedure TFRegProf.OnOffCabecera(Value: Boolean);
begin
  // ....................... activar cabecera de requisición ...................
  pnlCabecera.Enabled := Value;
  Z2bbtnBorrar.Enabled:= Value;
  Z2bbtnOK.Enabled    := Value;
  {if Value = True then
		btnValores.Enabled:= False
 	else
		btnValores.Enabled:= True;}
end;

procedure TFRegProf.OnOffDetalle(Value: Boolean);
begin
  // ....................... activar detalle de requisición ....................
  if Value then
    stxTitulo1.Color := clHighlight
  else
    stxTitulo1.Color := clGray;

  pnlDetalleG.Enabled  := Value;
  Z2bbtnRegresa.Enabled:= Value;
  Z2bbtnCanc2.Enabled  := Value;
  Z2bbtnGraba.Enabled  := Value;
  Z2bbtnAcepta.Enabled := Value;
  Z2bbtnAnula.Enabled  := Value;
  Z2bbtnNuevo.Enabled  := Value;
  {if Value = True then
		btnValores.Enabled := True
 	else
		btnValores.Enabled := False;}  
end;

procedure TFRegProf.btnDetalle;
var
  bDummy1, bDummy2, bDummy3 : Boolean;
begin
  bDummy1:=(DMLOG.cdsDProforma.RecordCount>0) and
           ((DMLOG.cdsProforma.ChangeCount>0) or (DMLOG.cdsDProforma.ChangeCount>0) or
            (DMLOG.cdsProforma.Modified)      or (DMLOG.cdsDProforma.Modified) );

  bDummy2:= True;
  if trim(DMLOG.cdsProforma.FieldbyName('ProfEst').AsString)<> 'INICIAL' then begin
     OnOffCabecera(False);
     OnOffDetalle(False);
     bDummy2:=False;
     end
  else begin
     if not pnlDetalleG.Enabled then
        bDummy2:=False
     else
        if trim(DMLOG.cdsProforma.FieldbyName('ProfEst').AsString)='INICIAL' then
           bDummy2:= not bDummy1;
  end;

  Z2bbtnRegresa.Enabled:= bDummy1 or bDummy2;
  Z2bbtnCanc2.Enabled  := bDummy1 or bDummy2;
  Z2bbtnGraba.Enabled  := bDummy1 or bDummy2;
  Z2bbtnAcepta.Enabled := bDummy2;
  Z2bbtnAnula.Enabled  := bDummy2;
  Z2bbtnNuevo.Enabled  := False;

  bDummy3 := False;
  if DMLOG.wModo='A' then bDummy3:= not bDummy1;
  Z2bbtnNuevo.Enabled:= bDummy3;
end;

procedure TFRegProf.lblEstado;
begin
//
end;

procedure TFRegProf.Z2bbtnNuevoClick(Sender: TObject);
var
	sSQL,vcampo : string;
begin
	OnOffCabecera(True);
  OnOffDetalle(False);
  edtProv.Text:='';
  dbeTMoneda.Text:='';
  dbeFPago.text:='';
	dbeNReg.text:='';
  dblcdNSol.text:='';
  dblcdProv.text:='';
  dedNProforma.text:='';
  dblcCondComercial.text:='';
  dbmObs.text:='';
  dblcCIA.Enabled      := True;
  dedNProforma.Enabled := True;
  wflagedit := 'N';
  dcCIA;
  fGraba:= False;
  {if vciatasa = '1' then vcampo := 'TCAMVBC';
  if vciatasa = '2' then vcampo := 'TCAMVBV';
  if vciatasa = '3' then vcampo := 'TCAMVPC';
  if vciatasa = '4' then vcampo := 'TCAMVPV';
  if vciatasa = '5' then vcampo := 'TCAMVOC';
  if vciatasa = '6' then vcampo := 'TCAMVOV';
  if vciatasa = '7' then vcampo := 'TCAMVXC';
  if vciatasa = '8' then vcampo := 'TCAMVXV';}
  vcampo :=DMLOG.wTipoCambio;


  wflagedit := 'S';
  sSQL := '';
  sSQL := 'FECHA='''+ FormatDateTime(DMLOG.wFormatFecha,Date) + '''';
  DMLOG.cdsProforma.FieldByName('PROFIXFLE').AsInteger:= 0;
  DMLOG.cdsProforma.fieldbyname('PROFTCAMB').AsString := DMLOG.DisplayDescrip('prvSQL','TGE107',vcampo,sSQL,vcampo);
  DMLOG.cdsProforma.fieldbyname('PROFEVAL').AsString  := 'P';
  edtEvalu.Text := 'Por Evaluar';
  dbrgTipo.ItemIndex := 2;   // Año';
end;

procedure TFRegProf.dbgDReqsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=$4D) and (ssCtrl in Shift)  then
  begin
    dbgDReqsDblClick(nil);
  end;

  if (Key=VK_DELETE) and (ssCtrl in Shift)  then
  begin
    if trim(DMLOG.cdsProforma.FieldbyName('PROFEst').AsString) = 'INICIAL' then
    begin
      DMLOG.cdsDProforma.Delete;
      CalTotal(nil);
    end
    else ErrorMsg('Error','No se puede borrar...');
  end;
  btnDetalle;
end;

procedure TFRegProf.dbgDReqsDblClick(Sender: TObject);
//var
	//sSQL : string;
begin
	if trim(DMLOG.cdsProforma.FieldbyName('PROFEST').AsString)<>'ACEPTADO' then
 	begin
  	if dblcdNSol.Text <> '' then
    	dbcldArti.Enabled := false
   	else
    	dbcldArti.Enabled := true;
		OnOffDetalle(False);          // Desactivar el panel de detalle

   	DMLOG.cdsDProforma.Edit;
   	iEstado:=1;
    if sTipoADQ = 'C' then
    begin
      dbeItem.Text    := DMLOG.cdsDProforma.FieldByName('DPROFID').AsString;
      dbcldArti.Text  := DMLOG.cdsDProforma.FieldByName('ARTID').AsString;
      dbeArti.Text    := DMLOG.cdsDProforma.FieldByName('DPROFOBS').AsString;
    	//dbeArti.Text    := DMLOG.cdsDProforma.FieldByName('DPROFARTD').AsString;//DMLOG.DisplayDescrip('prvSQL','TGE205','ARTDES','ARTID='+quotedStr(dbcldArti.text),'ARTDES');
			dbeDscto.Text   := Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFDSCTO').AsFloat]));
			dbeImporte.Text := Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFIMP').AsFloat]));
			dbeImpInd.Text  := Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFIMPU').AsFloat]));
			dbeISC.text     := Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFISC').AsFloat]));
		end
		else
		begin
			dbeItem1.Text    := DMLOG.cdsDProforma.FieldByName('DPROFID').AsString;
			//edtCant.Text		 := Trim(Format('%8.1f',[DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsFloat]));
			dbeDscto1.Text   := Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFDSCTO').AsFloat]));
			dbeImporte1.Text := Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFIMP').AsFloat]));
			dbeImpInd1.Text  := Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFIMPU').AsFloat]));
			dbeISC1.text     := Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFISC').AsFloat]));
			edtActSer.Text   := DMLOG.cdsDProforma.FieldByName('ARTID').AsString;
      DBMemo1.Text     := DMLOG.cdsDProforma.FieldByName('DPROFOBS').AsString;
    end;

    if sTipoADQ = 'C' then
    begin
      if DMLOG.cdsDProforma.FieldByName('DPROFLAGUM').AsString = 'G' then
      begin
        dbcbFLAG.Text := 'G';
        dbeCntG.Text  := Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsFloat]));
        dbePUnitG.Text:= Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFPUNG').AsFloat]));
        //sSQL := 'UNMID='+QuotedStr(DMLOG.cdsArti.FieldByName('UNMIDG').AsString);
        //dblcUNMID.Text:= DMLOG.DisplayDescrip('prvUMed','TGE130','*',sSQL,'UNMDES');
      end
      else
      begin
        dbcbFLAG.Text := 'U';
        dbeCntG.Text  := Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFCNTU').AsFloat]));
        dbePUnitG.Text:= Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFPUNU').AsFloat]));
        //sSQL := 'UNMID='+quotedStr(DMLOG.cdsArti.FieldByName('UNMIDU').AsString);
        //dblcUNMID.Text:= DMLOG.DisplayDescrip('prvUMed','TGE130','*',sSQL,'UNMDES');
        //edtUMedDes.Text :=
      end;
    end
    else
    begin
      if DMLOG.cdsDProforma.FieldByName('DPROFLAGUM').AsString = 'G' then
      begin
        dbcbFLAG1.Text := 'G';
        edtCant.Text  := Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsFloat]));
        dbePUnitG1.Text:= Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFPUNG').AsFloat]));
      end
      else
      begin
        dbcbFLAG1.Text := 'U';
        edtCant.Text  := Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFCNTU').AsFloat]));
        dbePUnitG1.Text:= Trim(Format('%8.4f',[DMLOG.cdsDProforma.FieldByName('DPROFPUNU').AsFloat]));
      end;
    end;

    if sTipoADQ = 'C' then		// Articulos
    begin
      pnlDetalleA.Visible := True;  // Activar el panel de Mantenimiento
      if dbcbFLAG.Text='G' then
         dblcUNMID.DataField := 'UNMIDG'
      else
         dblcUNMID.DataField := 'UNMIDU';
    end
    else				// Servicio - Activo Fijo
    begin
      pnlDetalleB.Visible := True;  // Activar el panel de Mantenimiento
      if dbcbFLAG1.Text='G' then
      dblcUNMID1.DataField := 'UNMIDG'
      else
      dblcUNMID1.DataField := 'UNMIDU';
    end;

    if sTipoADQ = 'C' then
    begin
      if dbcbFLAG.Text = 'G' then
      	dblcUNMID.Text  := DMLOG.cdsDProforma.FieldByName('UNMIDG').AsString
    	else
      	dblcUNMID.Text  := DMLOG.cdsDProforma.FieldByName('UNMIDU').AsString;
      edtUMedDes.Text := DMLOG.DisplayDescrip('prvSQL','TGE130','UNMDES','UNMID='+quotedStr(dblcUNMID.text),'UNMDES');
      dbePUnitG.Setfocus;
    end
    else			// Servicio - Activo Fijo
    begin
      if dbcbFLAG.Text = 'G' then
      	dblcUNMID1.Text  := DMLOG.cdsDProforma.FieldByName('UNMIDG').AsString
    	else
      	dblcUNMID1.Text  := DMLOG.cdsDProforma.FieldByName('UNMIDU').AsString;
      edtUMedDes1.Text := DMLOG.DisplayDescrip('prvSQL','TGE130','UNMDES','UNMID='+quotedStr(dblcUNMID1.text),'UNMDES');
			dbePUnitG1.SetFocus;
    end;
   	btnDetalle;
 	end
 	else
  	ErrorMsg('Error', 'Solo se pueden hacer cambios cuando la'+#13+
                     'Proforma se halla en modo inicial...');
end;

procedure TFRegProf.dbmObsKeyPress(Sender: TObject; var Key: Char);
var
  sC : String;
begin
  sC := Key;
  sC := Uppercase(sC);
  Key:= sC[1];
end;

procedure TFRegProf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dblcdProv.OnNotInList   := Nil;
   dblcdNSol.OnNotInList   := Nil;
   dbcldArti.OnNotInList   := Nil;
	dblcTMoneda.OnNotInList := Nil;

	if DMLOG.cdsProforma.State in [dsEdit, dsInsert] then
      DMLOG.cdsProforma.Cancel;
   if DMLOG.cdsDProforma.State in [dsEdit, dsInsert] then
      DMLOG.cdsDProforma.Cancel;
   if DMLOG.cdsProforma.ChangeCount > 0 then
      DMLOG.cdsProforma.CancelUpdates;
   if DMLOG.cdsDProforma.ChangeCount > 0 then
      DMLOG.cdsDProforma.CancelUpdates;
{   DMLOG.cdsDProforma.Close;
	DMLOG.cdsDProforma.MasterSource     := Nil;
	DMLOG.cdsDProforma.MasterFields     := '';
	DMLOG.cdsDProforma.IndexFieldNames  := '';
   DMLOG.cdsUMed.close;
   DMLOG.cdsSolxCIA.close;
   DMLOG.cdsScxProv.close;
}

   //FVariables.w_AD_Registro := False;
   //FVariables.w_Num_Formas  := FVariables.w_Num_Formas-1;
   if DMLOG.wTipoAdicion='xFiltro' then
   begin
      DMLOG.ActualizaFiltro(Mtx3000,DMLOG.cdsProforma,DMLOG.wModo);
   end;

   Action := CAFree;
end;

procedure TFRegProf.cSetFocus(Sender: TObject; const sMsg: String);
begin
 if TCustomEdit(Sender).Text='' then
 begin
   ErrorMsg('Error',sMsg);
   TCustomEdit(Sender).SetFocus;
 end;
end;

function TFRegProf.EHandlerError(Ex : Exception ) : Boolean;
var
 a, b   : Integer;
 s1, s2	: string;
begin
    Result :=  true;
    if Ex.Message = 'Key violation.' then
    begin
       ErrorMsg('Error','No pueden existir registros duplicados.. ');
    end
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
         ErrorMsg('Error', 'El campo '+s2+' es obligatorio...  ');
      end
      else
         Result :=  false;
    end;
end;

procedure TFRegProf.dbcldArtiChange(Sender: TObject);
//var
	//sSQL : string;
begin
  {If dbcbFLAG.Text = 'G' then				// Verificar antes lo hacia ?? - Consultar si es correcto
   begin                           		// que saque la u. Med. de la tabla o de lo que el usuario selecciono en la requi. 
    sSQL := 'UNMID='+QuotedStr(DMLOG.cdsArti.FieldByName('UNMIDG').AsString);
    dblcUNMID.Text := DMLOG.DisplayDescrip('prvUMed','TGE130','*',sSQL,'UNMDES');
   end
  else
  begin
    sSQL := 'UNMID='+QuotedStr(DMLOG.cdsArti.FieldByName('UNMIDU').AsString);
    dblcUNMID.Text := DMLOG.DisplayDescrip('prvUMed','TGE130','*',sSQL,'UNMDES');
  end}
end;

procedure TFRegProf.dblcEditExit(Sender: TObject);
begin
  if TCustomEdit(Sender).Text='' then
  begin
    ErrorMsg('Error','El Campo no debe estar vacío');
    TCustomEdit(Sender).SetFocus;
  end;
end;

procedure TFRegProf.dblcNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFRegProf.dbeDsctoExit(Sender: TObject);
var
  rImp, rD, rCG, rUG: double;
begin
 dblcEditExit(Sender);
 with DMLOG.cdsDProforma do
  if dbeDscto.Text<>'' then
  begin
    rCG:=StrToFloat(dbeCntG.Text);    //FieldByName('DPROFCNT').ASFloat;
    rUG:=StrToFloat(dbePUnitG.Text);  //FieldByName('DPROFPUN').ASFloat;
    rD:=StrToFloat(dbeDscto.Text);  //FieldByName('DPROFDSCTO').ASFloat;
    rImp := ((rCG*rUG))-(((rCG*rUG))*(rD/100));
    dbeImporte.Text := Format('%8.4f',[rImp]); //   FieldByName('DPROFIMP').AsFloat := rImp;
  end;
end;

{+.............................................................................+
 |   Calulo de los totales de la proforma                                      |
 +.............................................................................+}
procedure TFRegProf.CalTotal(Sender: TObject);
var
	rTs,rTC, rTt, rTD, rTi, rTf,rdd   : double;
	//sSQL : string;
	xPrecio : double;
begin
	rTC := 0; rTt:= 0; rTD:= 0; rTi:= 0;rTf:= 0;rTs:= 0; rdd:= 0;
	DMLOG.cdsDProforma.First;
	while not DMLOG.cdsDProforma.Eof do
	begin
		if sTipoADQ = 'C' then
		begin
			xPrecio := DMLOG.cdsDProforma.FieldByName('DPROFPUNG').asFloat;
			rTc := rTc + DMLOG.cdsDProforma.FieldByName('DPROFCNTG').AsFloat * xPrecio;
		end
		else
		begin
			xPrecio := DMLOG.cdsDProforma.fieldbyname('DPROFPUNG').asFloat;
			rTc := rTc + xPrecio  * DMLOG.cdsDProforma.fieldbyname('DPROFCNTG').asFloat;
		end;

		rTf := StrToFloat(dbeFlete.Text);
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

{	DMLOG.cdsDOrdComp.First;
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
	DMLOG.cdsOrdComp.post;}
end;

procedure TFRegProf.dedNProformaExit(Sender: TObject);
begin
  if length(dedNProforma.Text)>0 then
  begin
  	if DMLOG.IsExistPROF( DMLOG.cdsProforma.FieldByName('CIAID').AsString,
                        DMLOG.cdsProforma.FieldByName('PROFID').AsString,
                        DMLOG.cdsProforma.FieldByName('PROFNPROV').AsString ) then
    begin
    	ErrorMsg( 'Error','Ya existe una Proforma con '+#13+
                        'con el mismo número ... '+DMLOG.cdsProforma.FieldByName('PROFID').AsString);
      DMLOG.cdsProforma.FieldByName('PROFNPROV').AsString := DMLOG.StrZero(DMLOG.MaxPROF(dblcdProv.Text),8);
    end;
  end
  else
  begin
  	DMLOG.cdsProforma.FieldByName('PROFNPROV').AsString := DMLOG.StrZero(DMLOG.MaxPROF(dblcdProv.Text),8);
  end;
end;

procedure TFRegProf.dbeImpIndExit(Sender: TObject);
var
  rImp, rD, rCG, rUG, rI, rTIMP: Extended;
begin
 dbeDsctoExit(Sender);
 dblcEditExit(Sender);
 with DMLOG.cdsDProforma do
  if dbeImpInd.Text<>'' then
  begin
    rCG:=StrToFloat(dbeCntG.Text);   //FieldByName('DPROFCNT').ASFloat;
    rUG:=StrToFloat(dbePUnitG.Text);  //FieldByName('DPROFPUN').ASFloat;
    rD:=StrToFloat(dbeDscto.Text);  //FieldByName('DPROFDSCTO').ASFloat;
    rI:=StrToFloat(dbeImpInd.Text);  //FieldByName('DPROFIMPU').ASFloat;
    rImp := ((rCG*rUG))-(((rCG*rUG))*(rD/100));
     rTIMP := rImp + (rImp*(rI/100));
     dbeImporte.Text := Format('%8.4f',[rTIMP]);
    //FieldByName('DPROFIMP').AsFloat := rImp;
  end;
end;

procedure TFRegProf.dblcCondComercialExit(Sender: TObject);
begin
  dbeFPago.Text := DMLOG.DisplayDescrip('prvSQL','CXC101','CCOMERDES','CCOMERID='+quotedStr(dblcCondComercial.text),'CCOMERDES');
end;

procedure TFRegProf.dblcdExits(Sender: TObject);
var
 	wWhere,sSQL, xSQL, xProv : String;
 	vContador : integer;
begin
  if sender = dbcldArti then
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

  if sender = dblcCIA then
  begin
    edtCIA.Text := DMLOG.DisplayDescrip('prvSQL','TGE101','CIADES','CIAID='+quotedStr(dblcCIA.text),'CIADES');
    {sSQL := 'SELECT * FROM LOG302 WHERE SCCEST=''ACEPTADO'' AND CIAID='''+dblcCIA.Text+'''';
    DMLOG.cdsSolCot.Close;
    DMLOG.cdsSolCot.DataRequest(sSQL);
    DMLOG.cdsSolCot.Open;}
    sSQL := 'SELECT * FROM CXC101 WHERE CIAID='+quotedstr(dblcCIA.Text)+' ORDER BY CCOMERID';
    DMLOG.cdsFPago.Close;
    DMLOG.cdsFPago.DataRequest(sSQL);
    DMLOG.cdsFPago.Open;
    exit;
  end;

  if sender = dblcdProv then
  begin
    edtProv.Text := DMLOG.DisplayDescrip('prvSQL','TGE201','PROVDES','PROV='+quotedStr(dblcdProv.text),'PROVDES');
    exit;
  end;
  if DMLOG.wModo='M' then
  begin
  	Exit;
  end;

  if sender = dblcdNSOL then
  begin
    sTipoADQ := DMLOG.cdsProforma.fieldbyName('TIPOADQ').asString;
    DMLOG.cdsProforma.FieldByName('PROFFEMI').AsDateTime:=Date;
    DMLOG.cdsProforma.FieldByName('PROV').Clear;
    //DMLOG.cdsProforma.FieldByName('PROV').AsString      :='';
    edtProv.Text := '';
    DMLOG.cdsDProforma.CancelUpdates;
    while not DMLOG.cdsDProforma.Eof do
    begin
       DMLOG.cdsDProforma.Delete;
    end;
    sSQL := 'SELECT * FROM CXC101 WHERE CIAID='+quotedstr(dblcCIA.Text)+' ORDER BY CCOMERID';
    DMLOG.cdsFPago.Close;
    DMLOG.cdsFPago.DataRequest(sSQL);
    DMLOG.cdsFPago.Open;
    DMLOG.cdsFPago.First;

    sSQL := 'SELECT * FROM LOG311 WHERE SCCID='+quotedstr(dblcdNSol.Text);
    DMLOG.cdsSCxProv.MasterSource := nil;
    DMLOG.cdsSCxProv.MasterFields := '';
    DMLOG.cdsSCxProv.IndexFieldNames := '';
    DMLOG.cdsSCxProv.Close;
    DMLOG.cdsSCxProv.DataRequest(sSQL);
    DMLOG.cdsSCxProv.Open;
    if DMLOG.cdsSCxProv.recordCount=0 then
    begin
      ErrorMsg('Adquisiciones','La proforma no tiene proveedores asignados' +#13+
               'Asigne proveedores con numero de proforma '+dblcdNSOL.text);
      //dblcdNSOL.setFocus;
      exit;
    end;
    wWhere := '';

		xProv := DMLOG.DisplayDescrip('prvTGE','TGE102','CLAUXID','CLAUXLOG=''S''','CLAUXID');

    vContador := 1;
    DMLOG.cdsSCxProv.First;
    while not DMLOG.cdsSCxProv.eof do
    begin
      if vContador=1 then
      begin
         wWhere := ' WHERE PROV='+quotedstr(DMLOG.cdsSCxProv.fieldbyname('PROV').AsString);
         vContador:=0;
      end
      else
         wWhere := wWhere+' OR PROV='+quotedstr(DMLOG.cdsSCxProv.fieldbyname('PROV').AsString);
      DMLOG.cdsSCxProv.Next;
    end;
    xSQL := 'SELECT * FROM TGE201';
    if length(wWhere)>0 then
    	sSQL := xSQL+wWhere+' AND CLAUXID='+QuotedStr(xProv)
    else
    	sSQL:=xSQL+' WHERE CLAUXID='+QuotedStr(xProv);
    DMLOG.cdsProv.Close;
    DMLOG.cdsProv.DataRequest(sSQL);
    DMLOG.cdsProv.Open;
  end;
  {if TwwDBCustomLookupCombo(Sender).DataSource <> nil then
    bRq := TwwDBCustomLookupCombo(Sender).DataSource.DataSet.FieldByName(TwwDBCustomLookupCombo(Sender).DataField).Required;
  if (bRq) and (trim(TwwDBCustomLookupCombo(Sender).Text)='') then
    TwwDBCustomLookupCombo(Sender).DropDown;}
end;

procedure TFRegProf.Z2btnDescClick(Sender: TObject);
begin
// cambiar el total de descuento
  if DMLOG.cdsDProforma.RecordCount > 0 then
    if not(dbeDesc.DataSource.Dataset.State in [dsEdit, dsInsert]) then
    begin
       dbeDesc.Enabled := true;
       dbeDesc.DataSource.Dataset.Edit;
       btnDetalle;
    end;
end;

procedure TFRegProf.dbeDescExit(Sender: TObject);
var
  rTD, rTC, rTf, rTo, rTi: Extended;
begin
  if dbeDesc.DataSource.Dataset.State in [dsEdit, dsInsert] then
  begin
    rTC := DMLOG.cdsProforma.FieldByName('PROFIXTCC').AsFloat;
    rTD := DMLOG.cdsProforma.FieldByName('PROFIXTD').AsFloat;
    rTf := DMLOG.cdsProforma.FieldByName('PROFIXFLE').AsFloat;
    rTi := DMLOG.cdsProforma.FieldByName('PROFTTIMPU').AsFloat;
    rTo := (rTC-rTD)+rTf+rTi;
    DMLOG.cdsProforma.FieldByName('PROFTOTALG').AsFloat := rTo;
    DMLOG.cdsProforma.post;
    btnDetalle;
    dbeDesc.Enabled := False;
  end;
end;

procedure TFRegProf.dcCIA;
var
  sCIA   : String;
  sState : TDataSetState;
begin
  sState := DMLOG.cdsProforma.State;

  DMLOG.cdsCIA.First;
  sCIA := trim(DMLOG.cdsCIA.FieldByName('CIAID').AsString);
  if DMLOG.wModo='A' then
  begin
     DMLOG.cdsProforma.Insert;
     DMLOG.cdsProforma.FieldByName('PROFIXFLE').AsInteger := 0;
  end
  else
     DMLOG.cdsProforma.Edit;
  DMLOG.cdsProforma.FieldByName('CIAID').AsString := sCIA;
  dblcCIA.Enabled := DMLOG.cdsCIA.RecordCount > 1;
  vciatasa := trim(DMLOG.cdsCIA.FieldByName('CIATASA').AsString);
end;

procedure TFRegProf.dbrgTipoChange(Sender: TObject);
begin
{  if DMLOG.cdsProforma.State in [dsEdit, dsInsert] then
  begin
    if dbrgTipo.ItemIndex=0 then
      DMLOG.cdsProforma.FieldByName('PROFFARDMA').AsString := 'D';
    if dbrgTipo.ItemIndex=1 then
      DMLOG.cdsProforma.FieldByName('PROFFARDMA').AsString := 'M';
		if dbrgTipo.ItemIndex=2 then
			DMLOG.cdsProforma.FieldByName('PROFFARDMA').AsString := 'A';
  end;}
end;

procedure TFRegProf.dbePUnitGExit(Sender: TObject);
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

procedure TFRegProf.dbePUnitG1Exit(Sender: TObject);
var
 rTC,rTd,rTi,rTs,rimporte,rtotal : double;
begin
	if Trim(dbePUnitG1.text) = '' then dbePUnitG1.text := '0';
	if Trim(dbeDscto1.text) = ''  then dbeDscto1.text  := '0';
	if Trim(dbeImpInd1.text) = '' then dbeImpInd1.text := '0';
	if Trim(dbeISC1.text) = ''    then dbeISC1.text    := '0';

	rTc := StrToFloat(Trim(dbePUnitG1.text))*StrToFloat(Trim(edtCant.text));
	rimporte := rTc;                               // 100
  rTd := ((rimporte * strToFloat(dbeDscto1.text)) /100); // 10
  rimporte := rimporte - rtd;                           // 100 - 10 = 90
  rTi := (rimporte * strToFloat(dbeImpInd1.text)) /100;  // 16.2
  rTs := (rimporte * strToFloat(dbeISC1.text)) /100;     // 10
  rtotal := rimporte + rTi + rTs;
  dbeImporte1.text := FloatToStr(rtotal);
end;

procedure TFRegProf.dbdtpFAttExit(Sender: TObject);
begin
   if dbdtpFAtt.date<dbdtpFemi.date then
   begin
      ShowMessage('Fecha de Atención debe ser mayor o igual que Fecha de Emisión');
      dbdtpFAtt.date := dbdtpFemi.date;
      //dbdtpFAtt.SetFocus;
   end;
end;

procedure TFRegProf.dbseEntExit(Sender: TObject);
begin
{   if dbseEnt.Value < 0 then
   begin
      dbseEnt.value := -1*dbseEnt.Value;
      ShowMessage('Días de Entrega debe ser mayor o igual a cero');
      dbseEnt.SetFocus;
   end;}
end;

procedure TFRegProf.dbsbValExit(Sender: TObject);
begin
{   if dbsbVal.Value < 0 then
   begin
      dbsbVal.Value := -1*dbsbVal.Value;
      ShowMessage('Días de Validez debe ser mayor o igual a cero');
      dbsbVal.SetFocus;
   end;}
end;

procedure TFRegProf.dbeTCambioExit(Sender: TObject);
begin
   {if trim(dbeTCambio.Text) = '' then
   begin
      ShowMessage('El Tipo de Cambio no Puede estar en Blanco ');
      dbeTCambio.SetFocus;
      Exit;
   end;
   if strtoFloat(dbeTCambio.Text)<=0 then
   begin
      ShowMessage('Tipo de Cambio debe ser mayor o igual a cero');
      dbeTCambio.SetFocus;
   end;}
end;

procedure TFRegProf.dbseGarantiaExit(Sender: TObject);
begin
{  if dbseGarantia.text = '' then
    dbseGarantia.text := '0';
   if strtoint(dbseGarantia.Text)<0 then
   begin
      ShowMessage('Tiempo de Garantía debe ser mayor o igual a cero');
      dbseGarantia.SetFocus;
   end;}
end;

procedure TFRegProf.dblcTMonedaExit(Sender: TObject);
var sFecha, sSQL : string;
begin
  dbeTMoneda.text := DMLOG.DisplayDescrip('prvSQL','TGE103','TMONDES','TMONID='+quotedStr(dblcTMoneda.text),'TMONDES');
  if Length(trim(DMLOG.cdsProforma.FieldbyName('PROFTCAMB').asString))=0 then
    DMLOG.cdsProforma.fieldbyName('PROFTCAMB').asString := DMLOG.CalcTipoCambio(dblcTMoneda.text, dbdtpFEmi.DateTime, DMLOG.wTipoCambio);

  {sFecha := formatdatetime(DMLOG.wFormatFecha,dbdtpFEmi.DateTime);
  sSQL := 'SELECT '+ DMLOG.wTipoCambio +' FROM TGE107 WHERE FECHA=DATE(' +quotedStr(sFecha)+ ') AND TMONID='+ quotedStr(dblcTMoneda.Text);
  DMLOG.cdsQry.Close;
  DMLOG.cdsQry.DataRequest(sSQL);
  DMLOG.cdsQry.Open;
  if DMLOG.cdsQry.FieldByName(DMLOG.wTipoCambio).asString <> '' then
    DMLOG.cdsProforma.FieldByName('PROFTCAMB').asFloat := DMLOG.cdsQry.FieldByName(DMLOG.wTipoCambio).asFloat
  else
    DMLOG.cdsProforma.FieldByName('PROFTCAMB').asFloat := 0;}
end;

procedure TFRegProf.pnlDetalleAEnter(Sender: TObject);
begin
  //sCampo := 'UNMIDU'
  //dblcUNMID.Text := DMLOG.DisplayDescrip('prvSQL','TGE130','UNMDES','UNMID='+quoteddStr(dbcldArti.text),'UNMDES');
end;

procedure TFRegProf.dblcUNMIDExit(Sender: TObject);
begin
  //if dbcbFLAG.Text='G' then
    // dblcUNMID.DataField := 'UNMIDG'
  //else
    // dblcUNMID.DataField := 'UNMIDU';
  edtUMedDes.Text := DMLOG.DisplayDescrip('prvSQL','TGE130','UNMDES','UNMID='+quotedStr(dblcUNMID.text),'UNMDES');
end;

procedure TFRegProf.dblcUNMID1Exit(Sender: TObject);
begin
  if dbcbFLAG1.Text='G' then
     dblcUNMID1.DataField := 'UNMIDG'
  else
     dblcUNMID1.DataField := 'UNMIDU';
 edtUMedDes1.Text := DMLOG.DisplayDescrip('prvSQL','TGE130','UNMDES','UNMID='+quotedStr(dblcUNMID1.text),'UNMDES');
end;

procedure TFRegProf.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
    if self.ActiveControl Is TMemo then Exit;
    if self.ActiveControl Is TDBMemo then Exit;
		key:=#0;
		perform(CM_DialogKey,VK_TAB,0);
	end;
end;

procedure TFRegProf.FormCreate(Sender: TObject);
var
	xProv : String;
begin
  pnlValores.Height:=481;
  pnlValores.Left:=115;
  pnlValores.Top:=58;
  pnlValores.Width:=574;

   DMLOG.FiltraTabla( DMLOG.cdsCia, 'TGE101', 'CIAID',  'CIAID');

	xProv := DMLOG.DisplayDescrip('prvTGE','TGE102','CLAUXID','CLAUXLOG=''S''','CLAUXID');
  DMLOG.cdsProv.Close;
  DMLOG.cdsProv.DataRequest('SELECT CLAUXID,PROV, PROVRUC, PROVDES, PROVNOMCOM FROM TGE201 WHERE CLAUXID='+QuotedStr(xProv)+' ORDER BY PROV');
	DMLOG.cdsProv.FetchOnDemand:=False;
	DMLOG.cdsProv.PacketRecords:=20;
  DMLOG.cdsProv.FetchOnDemand:=True;
  DMLOG.cdsProv.Open;

  //DMLOG.cdsSolxCIA.Open;

  //DMLOG.cdsUMed.Close;
  //DMLOG.cdsUMed.DataRequest('SELECT * FROM TGE130');
  //DMLOG.cdsUMed.open;

  dblcdProv.OnNotInList   := dblcNotInList;
  dblcdNSol.OnNotInList   := dblcNotInList;
  dbcldArti.OnNotInList   := dblcNotInList;
  dblcTMoneda.OnNotInList := dblcNotInList;

  //DMLOG.cdsDProforma.Open;
end;

procedure TFRegProf.dblcdNSolInitDialog(Dialog: TwwLookupDlg);
var
  sSQL : String;
begin
	sSQL := 'SELECT * FROM LOG302 '+
					'WHERE CIAID='''+dblcCIA.Text+''' '+
					'AND SCCEST=''ACEPTADO'' ORDER BY SCCID DESC';
  DMLOG.cdsSolCot.Close;
  DMLOG.cdsSolCot.DataRequest(sSQL);
  DMLOG.cdsSolCot.Open;
end;

procedure TFRegProf.btnValoresClick(Sender: TObject);
begin
  sSQL:='SELECT LOG326.* FROM LOG326, LOG101 '+
        'WHERE CIAID='''+dblcCIA.Text+''' '+
        'AND SCCID='''+dblcdNSol.Text+''' '+
        'AND PROFID='''+dbeNReg.Text+''' '+
				'AND LOG326.CCOCODID = LOG101.CCOCODID '+
				'AND LOG101.FLAG=''C''';
  DMLOG.cdsValEva.Close;
  DMLOG.cdsValEva.DataRequest(sSQL);
  DMLOG.cdsValEva.Open;
  AsignaValoresNoEditables;
	pnlValores.Visible:=True;
	dbgValores.SetFocus;  
end;

procedure TFRegProf.Z2bbtnSalirClick(Sender: TObject);
begin
	pnlValores.Visible:=False;
end;

procedure TFRegProf.BitBtn3Click(Sender: TObject);
begin
	//DMLOG.ControlTran( 9, DMLOG.cdsValEva, '');
	DMLOG.cdsValEva.ApplyUpdates(0);
  ShowMessage(' Registro Grabado ');
	pnlValores.Visible:=False;
end;

procedure TFRegProf.dbgValoresCalcCellColors(Sender: TObject;
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

procedure TFRegProf.AsignaValoresNoEditables;
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
                             'CIAID='+QuotedStr(dblcCIA.text)+' AND CCOMERID='+QuotedStr(dblcCondComercial.text),'PESOEVALLOG'));
      except
        DMLOG.cdsValEva.FieldByName('VALOR').AsFloat:=0;
      end;
      DMLOG.cdsValEva.Post;
    end;
    if sTipoEval='TE' then  // Tiempo de Entrega
    begin
      DMLOG.cdsValEva.Edit;
      try
        DMLOG.cdsValEva.FieldByName('VALOR').AsFloat:=StrToDate(DMLOG.DisplayDescrip('prvSQL','LOG302','SCCFENT',
                             'CIAID='+QuotedStr(dblcCIA.text)+' AND SCCID='+QuotedStr(dblcdNSol.text),'SCCFENT'))-
                             dbdtpFechaEntrega.date;
      except
        DMLOG.cdsValEva.FieldByName('VALOR').AsFloat:=0;
      end;
      DMLOG.cdsValEva.Post;
    end;

    if sTipoEval='GA' then  // Garantia en Dias
    begin
      DMLOG.cdsValEva.Edit;
      try
        DMLOG.cdsValEva.FieldByName('VALOR').AsFloat:=DMLOG.cdsProforma.FieldByName('PROFGARAN').AsFloat;
      except
        DMLOG.cdsValEva.FieldByName('VALOR').AsFloat:=0;
      end;
      DMLOG.cdsValEva.Post;
    end;

    DMLOG.cdsValEva.Next;
  end;
end;

procedure TFRegProf.dbeValorEnter(Sender: TObject);
begin
  DMLOG.DisplayDescrip('prvSQL','LOG101','EDITABLE,TIPOEVAL','CCOCODID='+QuotedStr(DMLOG.cdsValEva.FieldByName('CCOCODID').AsString),'TIPOEVAL');

   if (DMLOG.cdsQry.FieldByName('EDITABLE').AsString<>'S') then //CONDICION COMERCIAL
   begin
     dbeValor.ReadOnly:=True;
   end
   else
     dbeValor.ReadOnly:=False;
end;

procedure TFRegProf.VerificaValoresDeEvaluacion;
begin
  sSQL:='SELECT LOG326.* FROM LOG326, LOG101 '+
        'WHERE CIAID='''+dblcCIA.Text+''' '+
        'AND SCCID='''+dblcdNSol.Text+''' '+
        'AND PROFID='''+dbeNReg.Text+''' '+
				'AND LOG326.CCOCODID = LOG101.CCOCODID '+
				'AND LOG101.FLAG=''C''';
  DMLOG.cdsValEva.Close;
  DMLOG.cdsValEva.DataRequest(sSQL);
  DMLOG.cdsValEva.Open;
  DMLOG.cdsValEva.First;
  while not DMLOG.cdsValEva.eof do
  begin
    if DMLOG.cdsValEva.FieldByName('VALOR').AsFloat=0 then
    begin
      ShowMessage('Existe un Registro con Valor Cero. verifique');
      DMLOG.cdsValEva.Last;
    end;
    DMLOG.cdsValEva.Next;
  end;
end;

procedure TFRegProf.FormShow(Sender: TObject);
var
   cProfEval : String;
   sSQL : String;
begin
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
	wIGV := DMLOG.displaydescrip('prvSQL','TGE108','TASACAN','TASAFLG=''I''','TASACAN');

   if DMLOG.wModo='A' then
	begin
		Z2bbtnNuevoClick(Self);
		dbeFlete.Text := '0';
		dbdtpFReg.Enabled:= True;
		DMLOG.cdsProforma.FieldByName('PROFTIMP').AsString := '0';
		DMLOG.cdsProforma.FieldByName('PROFFREG').asDateTime := date();
		DMLOG.cdsProforma.FieldByName('PROFID').asString := DMLOG.StrZero( DMLOG.UltimoNum('prvSQL','LOG312','PROFID','CIAID='+quotedStr(dblcCIA.text)), 8) ;
		dblcdNSol.Enabled:=True;
		dblcdProv.Enabled:=True;
	end
	else
	begin
		OnOffCabecera(True); //Activar la cabecera
		OnOffDetalle(False); //Desactivar el panel de detalle
		dblcCIA.Enabled     := False;
		dedNProforma.Enabled:= False;
		dbdtpFReg.Enabled:= False;
		edtProv.Text := DMLOG.DisplayDescrip('prvSQL','TGE201','PROVDES','PROV='+quotedStr(dblcdProv.text),'PROVDES');
		dbeTMoneda.text := DMLOG.DisplayDescrip('prvSQL','TGE103','TMONDES','TMONID='+quotedStr(dblcTMoneda.text),'TMONDES');
		sSQL := 'CIAID=' + QuotedStr(dblcCIA.Text)+' AND CCOMERID='+QuotedStr(dblcCondComercial.Text);
		dbeFPago.text := DMLOG.displaydescrip('prvSQL','CXC101','CCOMERDES',sSQL,'CCOMERDES');
		sTipoADQ := DMLOG.cdsProforma.fieldbyName('TIPOADQ').asString;

		dblcdNSol.Enabled:=False;
		dblcdProv.Enabled:=False;
      sSQL := 'SELECT * FROM CXC101 WHERE CIAID='+quotedstr(dblcCIA.Text)+' ORDER BY CCOMERID';
      DMLOG.cdsFPago.Close;
      DMLOG.cdsFPago.DataRequest(sSQL);
      DMLOG.cdsFPago.Open;
   end;

//   cProfEval := DMLOG.cdsProforma.fieldbyname('PROFEVAL').AsString[1];
   cProfEval := DMLOG.cdsProforma.fieldbyname('PROFEVAL').AsString;

   edtEvalu.Text := 'Por Evaluar';
   if cProfEval='P' then
      edtEvalu.Text := 'Por Evaluar'
   else if cProfEval='A' then
           edtEvalu.Text := 'Avaluada y Aceptada'
        else if cProfEval='D' then
                edtEvalu.Text := 'Evaluada y Descartada';

   edtCIA.Text := DMLOG.DisplayDescrip('prvSQL','TGE101','CIADES','CIAID='+quotedStr(dblcCIA.text),'CIADES');
   sSQL := 'SELECT * FROM LOG302 '+
					'WHERE CIAID='''+dblcCIA.Text+''' '+
					'AND SCCEST=''ACEPTADO'' ORDER BY SCCID DESC';
	DMLOG.cdsSolCot.Close;
	DMLOG.cdsSolCot.DataRequest(sSQL);
	DMLOG.cdsSolCot.Open;
   if DMLOG.wModo<>'A' then btnDetalle;

	if (trim(DMLOG.cdsProforma.FieldbyName('PROFEST').AsString) <> 'INICIAL') then
      btnValores.Enabled := False
 	else
		btnValores.Enabled := True;
end;

Initialization
	registerclasses([TLabel]);
	//registerclasses([TLabel, TBevel]);
End.

{
procedure TFRegProf.CalTotal(Sender: TObject);
var
  rTC, rTot, rTD, rTi, rTf, rTp, rI, rX, rTTi  : Real;
  bTotal                                       : Boolean;
begin
   rTC    := 0;
   rTot   := 0;
   rTD    := 0;
   rTi    := 0;
   rTf    := 0;
   bTotal := DMLOG.cdsProforma.FieldByName('PROFTIMP').AsString = 'TOTAL';
   rI     := 0;

   with DMLOG.cdsDProforma do
   begin
      First;
      while not Eof do
      begin
        if bTotal then
           rTC := FieldByName('DPROFIMP').AsFloat + rTC
        else begin
           rTC := (FieldByName('DPROFIMP').AsFloat + rTC);
           rI  := (rTC*(FieldByName('DPROFIMPU').AsFloat/100))+rI;
        end;
        If dbcbFLAG.Text = 'G' then
          rTp := (FieldByName('DPROFCNTG').AsFloat * FieldByName('DPROFPUNG').AsFloat)
        else
          rTp := (FieldByName('DPROFCNTU').AsFloat * FieldByName('DPROFPUNU').AsFloat);
        rTD := rTD+( rTp * (FieldByName('DPROFDSCTO').AsFloat/100));
        Next;
      end;
      rTot:=rTot+(rTC-rTD);
   end;

   with DMLOG.cdsProforma do
   begin
     if bTotal Then
        rTi := FieldByName('PROFIXTI').AsFloat
     else
        rTi := rI;

     rTf := FieldByName('PROFIXFLE').AsFloat;

     Edit;
     FieldByName('PROFIXTCC').AsFloat   := rTC;
     FieldByName('PROFTTIMPU').AsFloat  := rTi;
     FieldByName('PROFIXTD').AsFloat    := rTD;

     if bTotal Then
     begin
        rTot := rTot + rTf;
        rTTi := (rTot*rTi/100);
        rX   := rTot + rTTi;
     end
     else begin
        rTTi := rTi;
        rX   := rTot + rTi + rTf;
     end;
     FieldByName('PROFTTIMPU').AsFloat := rTTi;
     FieldByName('PROFTOTALG').AsFloat := rX;

     post;
   end;

end;

}


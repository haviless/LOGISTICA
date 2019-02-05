unit LOG500;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,
	wwdbdatetimepicker, DBCtrls, db, wwSpeedButton, wwDBNavigator, Grids,
	Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, wwclient, GridControl, Wwdotdot,
	Wwdbcomb,

	ppProd, ppClass,
//	ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, Psock, NMMSG,
	ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, 
	ppBands, ppPrnabl, ppCtrls, ppVar, ppStrtch, ppMemo, ShellApi, ComCtrls,
	wwriched, Wwkeycb, FileCtrl, MsgDlgs;

type
	TFSeguiReqs = class(TForm)
		pnlDetalleG: TPanel;
		stxTitulo1: TStaticText;
		pnlEstado: TPanel;
		Label4: TLabel;
		btxtEstado: TDBText;
		pnlCabecera: TPanel;
		lblCIA: TLabel;
		lblNSolCot: TLabel;
		lblSolicitante: TLabel;
		Label1: TLabel;
		lblPrioridad: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblAutorizado: TLabel;
    lblAprobado: TLabel;
    lblObs: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dbeSolic: TwwDBEdit;
    dblcCIA: TwwDBLookupCombo;
    dbeNumRqs: TwwDBEdit;
    dblcdCCos: TwwDBLookupComboDlg;
    dbdtpFReqs: TwwDBDateTimePicker;
    dbdtpFAnten: TwwDBDateTimePicker;
    dbeAtorizado: TwwDBEdit;
    dbeAprobado: TwwDBEdit;
    dbmObs: TDBMemo;
    edtInsTec: TwwDBEdit;
    dblcTRqs: TwwDBLookupCombo;
    dblcPRIO: TwwDBLookupCombo;
    dblcLOC: TwwDBLookupCombo;
    dblcALM: TwwDBLookupCombo;
    Z2bbtnSalir: TBitBtn;
    Bevel1: TBevel;
    Z2bbtnVisado: TBitBtn;
    pnlVisador: TPanel;
    Label5: TLabel;
    DBText1: TDBText;
    dbgDReqs: TwwDBGrid;
    pnlDetalleA: TPanel;
    stxTitulo2: TStaticText;
    Z2bbtnRegOk: TBitBtn;
    dbeItem: TwwDBEdit;
    dbcldArti: TwwDBLookupComboDlg;
    dbeCNTS: TwwDBEdit;
    dbeCNTA: TwwDBEdit;
    dblcUNMID: TwwDBLookupCombo;
    dbcbFLAG: TwwDBComboBox;
    edtARTDES: TEdit;
    edtUMedReq: TEdit;
    pnlDetalleB: TPanel;
    lblTexto: TLabel;
    Z2bbtnRegOk2: TBitBtn;
    dbeItem1: TwwDBEdit;
    stxTitulo3: TStaticText;
    dbmObservacion: TDBMemo;
    dbeCant: TwwDBEdit;
    dblcUnMed: TwwDBLookupCombo;
    edtUNMID: TEdit;
    dbeCIA: TEdit;
    dbeLOC: TEdit;
    dbeALM: TEdit;
    dbePRIO: TEdit;
    dbeTRqs: TEdit;
    dbeCCostos: TEdit;
    pnlComprador: TPanel;
    dblcComprador: TwwDBLookupCombo;
    dbeComprador: TwwDBEdit;
    lblComprador: TLabel;
    Label6: TLabel;
    dbeNOCompra: TEdit;
    dbeCanSol: TwwDBEdit;
    lblvis: TLabel;
    lblsol: TLabel;
    lblAte: TLabel;
    lblUM: TLabel;
    lblTUM: TLabel;
    lblart: TLabel;
    lblNo: TLabel;
    lblIt: TLabel;
    lblCP: TLabel;
    lblMe: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dbmObsKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNumRqsExit(Sender: TObject);
    procedure dbdtpFReqsExit(Sender: TObject);
    procedure Z2bbtnSalirClick(Sender: TObject);
    procedure Z2bbtnVisadoClick(Sender: TObject);
    procedure dbgDReqsDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z2bbtnRegOkClick(Sender: TObject);
    procedure dblcCIAExit(Sender: TObject);
    procedure dblcLOCExit(Sender: TObject);
    procedure dblcALMExit(Sender: TObject);
    procedure dblcPRIOExit(Sender: TObject);
    procedure dblcTRqsExit(Sender: TObject);
    procedure dblcdCCosExit(Sender: TObject);
    procedure dblcCompradorExit(Sender: TObject);
    procedure dbeNOCompraExit(Sender: TObject);
  private
    { Private declarations }
    iEstado    : Integer;

    procedure dcCIA;
    procedure dcALM;
    procedure dcLOC;
    procedure dcNUM;

    procedure  AsigDat;
    procedure lblEstado;
    procedure cSetFocus ( Sender: TObject ; const sMsg : String);
    function EHandlerError(Ex : Exception ) : Boolean;
  public
    { Public declarations }

  end;

var
  FSeguiReqs: TFSeguiReqs;

implementation

uses LOGDM1, oaAD3050;

{$R *.DFM}

procedure TFSeguiReqs.AsigDat;
var
	//dA, dB : TDate;
	D, M, Y : Word;
begin
   // --> Asignar datos de cabecera de requisición
   with DMLOG do
   begin
      with cdsReqs do
      if State in [dsInsert, dsEdit] then
      begin
         DecodeDate(Now, Y, M, D);
         if (State in [dsInsert]) and (FieldbyName('RqsObs').IsNull ) then
            FieldbyName('RqsObs').AsString   := '   '; // colocar datos en blanco o algo
         if State in [dsInsert] then FieldbyName('RqsEst').AsString := 'INICIAL'; // inicial...

         if dbdtpFAnten.Text<>'' then
            if StrToDate(dbdtpFReqs.Text) > StrToDate(dbdtpFAnten.Text) then
               raise Exception.Create('La Fecha de Atención debe ser mayor'+#13+' a la Fecha de Requisición...');

         FieldbyName('RqsUser').AsString   := DMLOG.wUsuario;  // por el momento nada no se sabe nada del usuario
         FieldbyName('RqsAno').AsString    := IntToStr(Y);
         FieldbyName('RqsMM').AsString     := DMLOG.strzero(IntToStr(M),2);
				 FieldbyName('RqsDD').AsString     := DMLOG.strzero(IntToStr(D),2);
         //FieldbyName('RqsTri').AsString    := '';
         //FieldbyName('RqsSem').AsString    := '';
         //FieldbyName('RqsSS').AsString     := '';
         FieldbyName('RqsAnoMM').AsString  := IntToStr(Y)+DMLOG.strzero(IntToStr(M),2);
         //FieldbyName('RqsAATri').AsString  := '';
         //FieldbyName('RqsAASem').AsString  := '';
         //FieldbyName('RqsAASS').AsString   := '';
         //FieldbyName('FlagVar').AsString   := '';
         FieldbyName('RqsFReg').AsDateTime := Date;
         FieldbyName('RqsHReg').AsDateTime := SysUtils.Time;
      end;
   end;
end;

procedure TFSeguiReqs.FormCreate(Sender: TObject);
begin

	 if DMLOG.cdsReqs.State in [dsInsert] then
	 begin
		 dcCIA;
		 dcALM;
		 dcLOC;
		 dcNUM;
	 end;
end;



procedure TFSeguiReqs.lblEstado;
begin
end;

procedure TFSeguiReqs.dbmObsKeyPress(Sender: TObject; var Key: Char);
var
  sC : String;
begin
  sC := Key;
  sC := Uppercase(sC);
  Key:= sC[1];
end;

procedure TFSeguiReqs.cSetFocus(Sender: TObject; const sMsg: String);
begin
 if TCustomEdit(Sender).Text='' then
 begin
   ErrorMsg('Error',sMsg);
   TCustomEdit(Sender).SetFocus;
 end;
end;

function TFSeguiReqs.EHandlerError(Ex : Exception ) : Boolean;
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

procedure TFSeguiReqs.dbeNumRqsExit(Sender: TObject);
var
  iVal, iCod : Integer;
  sCIAID, sLOCID, sALMID, sRQSID : String;
begin
  Val(dbeNumRqs.Text, iVal, iCod);
  if iCod=0 then
  begin
   sCIAID := dblcCIA.Text;
   sLOCID := dblcLOC.Text;
   sALMID := dblcALM.Text;
   sRQSID := dbeNumRqs.Text;

   if DMLOG.IsExistRqs( sCIAID, sLOCID, sALMID, sRQSID ) then
   begin
    ErrorMsg('Error','Ya existe una requisión con '+#13+
               'el mismo número ... '+DMLOG.cdsReqs.FieldByName('RQSID').AsString);
    dcNUM;
//  DMLOG.cdsReqs.FieldByName('RQSID').AsString := DMLOG.StrZero(DMLOG.MaxReqs(DMLOG.cdsReqs.FieldByName('CIAID').AsString),8);
    dbeNumRqs.SetFocus;
   end;
  end
   else
     dcNUM;
//   DMLOG.cdsReqs.FieldByName('RQSID').AsString := DMLOG.StrZero(DMLOG.MaxReqs(DMLOG.cdsReqs.FieldByName('CIAID').AsString),8);
end;

procedure TFSeguiReqs.dcCIA;
var
  sCIA : String;
begin
	DMLOG.cdsCIA.First;
  sCIA := trim(DMLOG.cdsCIA.FieldByName('CIAid').AsString);
  if DMLOG.cdsReqs.State in [dsInsert] then
    DMLOG.cdsReqs.FieldByName('CIAID').AsString := sCIA
  else
    dblcCIA.Text := sCIA;
  dblcCIA.Enabled := DMLOG.cdsCIA.RecordCount > 1;
end;

procedure TFSeguiReqs.dbdtpFReqsExit(Sender: TObject);
begin
  if dbdtpFReqs.Text='' then
   dbdtpFReqs.Field.AsDateTime:= Date;
end;

procedure TFSeguiReqs.dcALM;
var
  sALM : String;
begin
	DMLOG.cdsALM.First;
  sALM := trim(DMLOG.cdsALM.FieldByName('ALMID').AsString);
  if DMLOG.cdsReqs.State in [dsInsert] then
    DMLOG.cdsReqs.FieldByName('ALMID').AsString := sALM
  else
    dblcALM.Text := sALM;
  dblcALM.Enabled := DMLOG.cdsALM.RecordCount > 1;
end;

procedure TFSeguiReqs.dcLOC;
var
  sLOC : String;
begin
  DMLOG.cdsLOC.First;
  sLOC := trim(DMLOG.cdsLOC.FieldByName('LOCID').AsString);
  if DMLOG.cdsReqs.State in [dsInsert] then
    DMLOG.cdsReqs.FieldByName('LOCID').AsString := sLOC
  else
    dblcLOC.Text := sLOC;
  dblcLOC.Enabled := DMLOG.cdsLOC.RecordCount > 1;
end;

procedure TFSeguiReqs.dcNUM;
begin
  with DMLOG do
  begin
    if cdsReqs.State in [dsInsert] then
    begin
       dbeNumRqs.Text := StrZero(MaxReqs(dblcCIA.Text,dblcLOC.Text,dblcALM.Text),8);
       cdsReqs.FieldByName('RQSID').AsString := dbeNumRqs.Text;
    end;
  end;
end;

procedure TFSeguiReqs.Z2bbtnSalirClick(Sender: TObject);
begin
		close ;
end;

procedure TFSeguiReqs.Z2bbtnVisadoClick(Sender: TObject);
var
	 xTime : TDateTime;
begin
	if DMLOG.cdsReqs.FieldByName('RQSEST').AsString = 'ACEPTADO' then
	begin
		if DMLOG.wReqComp = 'S' then
		begin
			if Length(Trim(dbeComprador.Text)) = 0 then
			begin
				ErrorMsg('Adquisiciones', ' Comprador no es Válido, Verifique ');
				Exit;
			end;

			if Length(Trim(dbeNOCompra.Text)) = 0 then
			begin
				ErrorMsg('Adquisiciones', ' Nro. de Orden de Trabajo no es Válido, Verifique ');
				Exit;
			end;
		end;

		if MessageDlg('Confirme Visación de Requisición' , mtConfirmation ,[ mbOK , mbCancel ] , 0 ) = mrok then
		begin
			DMLOG.cdsReqs.edit ;
			DMLOG.cdsReqs.FieldByName('RQSVISADOR').AsString  := DMLOG.wUsuario;
			DMLOG.cdsReqs.FieldByName('RQSVISFREG').value			:= Date;
			if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
			begin
				DMLOG.cdsReqs.FieldByName('RQSVISHREG').Value		:= sysutils.Time;
			end
			else
			if SRV_D = 'ORACLE' then
			begin
				DMLOG.cdsReqs.FieldByName('RQSVISHREG').Value		:= Date+SysUtils.Time;
			end;
			DMLOG.cdsReqs.FieldByName('RQSCOMPID').AsString   := dblcComprador.Text;
			DMLOG.cdsReqs.FieldByName('RQSNOTRAB').AsString   := dbeNOCompra.Text;
			DMLOG.cdsReqs.post;

			//DMLOG.ControlTran;
      xBorrar:= '1';
			DMLOG.ControlTran( 9, DMLOG.cdsReqs, 'REQS');
      xBorrar:= '0';

      // vhndema
      DMLOG.ControlTran( 9, DMLOG.cdsDReqs, 'DREQS' ); //AplicaDatos([cdsReqs,cdsDReqs]);
      // end vhndema


      if DMLOG.wTipoAdicion='xFiltro' then
      begin
         DMLOG.ActualizaFiltro(Mtx3050,DMLOG.cdsReqs,'M');
      end;

			Z2bbtnVisado.Enabled := False;
      pnlComprador.Enabled := False;
      end;
   end
	else
   begin
      MessageDlg('Error, La Requisición debe estar Aceptada', mtConfirmation, [mbOK], 0 );
   end;
end;

procedure TFSeguiReqs.dbgDReqsDblClick(Sender: TObject);
var
  sSQL, sTipoRQS : String;
begin
	if DMLOG.cdsDReqs.RecordCount = 0 then
  begin
  	ErrorMsg('Adquisiciones', ' No Existen Registros ');
    Exit;
  end;
  sTipoRQS := DMLOG.cdsReqs.FieldByName('TIPOADQ').asString;

  if (sTipoRQS = 'S') or (sTipoRQS = 'A')  then
  begin
    dbeItem.Text   := DMLOG.cdsDReqs.FieldByName('DRQSID').AsString;
    dbcldArti.Text := DMLOG.cdsDReqs.FieldByName('ARTID').AsString;
    dbcbFLAG.value := DMLOG.cdsDReqs.FieldByName('RQSFLAGUM').AsString;
    if DMLOG.cdsDReqs.FieldByName('RQSFLAGUM').AsString = 'G' then
    begin
      dbeCNTS.Text := DMLOG.cdsDReqs.FieldByName('DRQSCNSG').AsString;
      dbeCNTA.Text := DMLOG.cdsDReqs.FieldByName('DRQSCNAG').AsString;
      dblcUnMed.text := DMLOG.cdsDReqs.FieldByName('UNMIDG').AsString;
    end
    else
    begin
			sSQL := 'UNMID=' + quotedStr(DMLOG.cdsDReqs.FieldByName('UNMIDU').AsString);
      dbeCNTS.Text := DMLOG.cdsDReqs.FieldByName('DRQSCNSU').AsString;
      dbeCNTA.Text := DMLOG.cdsDReqs.FieldByName('DRQSCNAU').AsString;
      dblcUnMed.text := DMLOG.cdsDReqs.FieldByName('UNMIDU').AsString;
      edtARTDES.Text:= DMLOG.cdsDReqs.FieldByName('DRQSOBS').AsString;
    end;
    edtUNMID.Text:=DMLOG.DisplayDescrip('prvSQL', 'TGE130', 'UNMDES', 'UNMID='''+dblcUnMed.Text+'''', 'UNMDES');        
  end;

  if (sTipoRQS = 'S') or (sTipoRQS = 'A') then
  begin
    dbeItem1.Text  := DMLOG.cdsDReqs.FieldByName('DRQSID').AsString;
    pnlDetalleB.Visible := True;  // Activar el panel de Mantenimiento
    if sTipoRQS = 'S' then
    begin
      stxTitulo3.caption := 'Detalle de Requisición x Servicios';
      lblTexto.Caption:=' Servicio ';
      if iEstado = 0  then
        dbeCant.text := '1';
    end
    else
    if sTipoRQS = 'A' then
    begin
    	stxTitulo3.caption := 'Detalle de Requisición x Compra de Activo Fijo';
      lblTexto.Caption:=' Activo Fijo ';         
    end;
    pnlDetalleB.Visible := True;      
  end
  else
  if sTipoRQS = 'C' then    
	begin
    dbcldArti.Enabled:=false;
    sSQL := 'ARTID=' + quotedstr(uppercase(dbcldArti.Text));
    edtARTDES.Text := DMLOG.displaydescrip('prvSQL','TGE205','*',sSQL,'ARTDES');
    sSQL := 'UNMID=' + quotedStr(dblcUNMID.Text);
    edtUMedReq.text :=  DMLOG.displaydescrip('prvSQL','TGE130','UNMDES',ssql,'UNMDES');

    // vhndema
    dbeCNTS.Enabled:=False;
		if DMLOG.cdsReqs.FieldByName('RQSVISADOR').AsString='' then
			 if Z2bbtnVisado.Enabled then
          dbeCNTS.Enabled:=True;
    // end vhndema

    pnlDetalleA.Visible := True;
  end
end;

procedure TFSeguiReqs.FormShow(Sender: TObject);
var
	xFlag : Boolean ;
   xsql : string;
begin
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
//
   if DMLOG.wReqComp = 'S' then
   begin
     pnlComprador.Visible:=True;
     dblcCompradorExit(Nil);
     if Length(Trim(DMLOG.cdsReqs.FieldByName('RQSVISADOR').AsString)) = 0 then
     begin
        dbeNOCompra.Text:='';
        dbeNOCompra.Enabled:=true;
     end
     else
     begin
        dbeNOCompra.Enabled:=False;
        dbeNOCompra.Text:=DMLOG.cdsReqs.FieldByName('RQSNOTRAB').AsString
     end;
   end
   else
     pnlComprador.Visible:=False;

   xSQL := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
   DMLOG.cdsCCost.close;
   DMLOG.cdsCCost.datarequest(xsql);
   DMLOG.cdsCCost.Open;

   dbeCIA.Text:='';
   dbeLOC.Text:='';
   dbeALM.Text:='';
   dbePRIO.Text:='';
   dbeTRqs.Text:='';
   dbeCCostos.Text:='';
   dblcCIAExit(Nil);
   dblcLOCExit(Nil);
   dblcALMExit(Nil);
   dblcPRIOExit(Nil);
   dblcTRqsExit(Nil);
   dblcdCCosExit(Nil);
   Screen.Cursor:=crDefault;
//
//	FVisOCReq := TFVisOCReq.create(Application) ;
//	FVisOCReq.ConfiguracionInicial(dbgDReqs) ;

	xFlag := False ;
	if DMLOG.cdsReqs.FieldByName('RQSVISADOR').IsNull then
		xFlag := True
	else
	if trim(DMLOG.cdsReqs.FieldByName('RQSVISADOR').AsString) = '' then
		xFlag := true ;

  // vhndema
  pnlComprador.Enabled := False;

	if xFlag then
	begin
		DMLOG.cdsQry.Active := False ;
		DMLOG.cdsQry.ProviderName := 'prvLOG' ;
		DMLOG.cdsQry.DataRequest('SELECT * FROM TGE171 WHERE USERID='''+ DMLOG.wUsuario +''' ' )  ;
		DMLOG.cdsQry.Active := True ;

		if DMLOG.cdsQry.RecordCount <> 0 then
		begin
			if DMLOG.cdsQry.FieldByName('FRQ').AsString = 'S' then
      begin
        pnlComprador.Enabled := True;
				Z2bbtnVisado.Enabled := True;
      end
			else
				Z2bbtnVisado.Enabled := False ;
		end
		else
			Z2bbtnVisado.Enabled := False ;
		end
	else
	begin
		Z2bbtnVisado.Enabled := False ;
	end ;
  // end vhndema
end;

procedure TFSeguiReqs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //FVariables.w_AD_Registro := False;
   //FVariables.w_Num_Formas  := FVariables.w_Num_Formas-1;
   Action := CAFree;
end;

procedure TFSeguiReqs.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFSeguiReqs.Z2bbtnRegOkClick(Sender: TObject);
var
	sTipoRQS : String;
begin
	sTipoRQS := DMLOG.cdsReqs.FieldByName('TIPOADQ').asString;
	if (sTipoRQS = 'S') or (sTipoRQS = 'A') then
		pnlDetalleB.Visible := False
	else
		pnlDetalleA.Visible := False;
end;

procedure TFSeguiReqs.dblcCIAExit(Sender: TObject);
begin
	dbeCIA.text := DMLOG.DisplayDescrip('prvSQL','TGE101','CIADES','CIAID='+quotedStr(dblcCIA.text),'CIADES');

	{DMLOG.cdsLOC.Filtered := False;
  DMLOG.cdsLOC.Filter   := 'CIAID='''+dblcCIA.Text+'''';
  DMLOG.cdsLOC.Filtered := True;

  DMLOG.cdsALM.Filtered := False;
  DMLOG.cdsALM.Filter   := 'CIAID='''+dblcCIA.Text+''' AND LOCID='''+dblcLOC.Text+'''';
  DMLOG.cdsALM.Filtered := True;
 	dcLOC;
 	dcALM;
 	dcNUM;}
end;

procedure TFSeguiReqs.dblcLOCExit(Sender: TObject);
var
	sSQL : String;
begin
	sSQL:='CIAID='+quotedStr(dblcCIA.text)+' AND LOCID='+quotedStr(dblcLOC.text);
  dbeLOC.text := DMLOG.DisplayDescrip('prvSQL','TGE126','LOCDES',sSQL,'LOCDES');

	{DMLOG.cdsALM.Filtered := False;
  DMLOG.cdsALM.Filter   := 'CIAID='''+dblcCIA.Text+''' AND LOCID='''+dblcLOC.Text+'''';
  DMLOG.cdsALM.Filtered := True;
 	dcALM;
 	dcNUM;}
end;

procedure TFSeguiReqs.dblcALMExit(Sender: TObject);
var
	sSQL : String;
begin
	sSQL:='CIAID='+quotedStr(dblcCIA.text)+' AND ALMID='+quotedStr(dblcALM.text)+' AND LOCID='+quotedStr(dblcLOC.text);
  dbeALM.text := DMLOG.DisplayDescrip('prvSQL','TGE151','ALMDES',sSQL,'ALMDES');
  //dbeALM.Text := DMLOG.cdsALM.FieldByName('ALMDES').AsString;
  //dcNUM;
end;

procedure TFSeguiReqs.dblcPRIOExit(Sender: TObject);
var
	sSQL : String;
begin
	sSQL:='PRIOID='+quotedStr(dblcPRIO.text);
  dbePRIO.text := DMLOG.DisplayDescrip('prvSQL','TGE155','PRIODES',sSQL,'PRIODES');
end;

procedure TFSeguiReqs.dblcTRqsExit(Sender: TObject);
var
	sSQL : String;
begin
	sSQL:='TRQSID='+quotedStr(dblcTRqs.text);
  dbeTRqs.text := DMLOG.DisplayDescrip('prvSQL','TGE142','TRQSDES',sSQL,'TRQSDES');
end;

procedure TFSeguiReqs.dblcdCCosExit(Sender: TObject);
var
	sSQL : String;
begin
	sSQL:='CCOSID='+quotedStr(dblcdCCos.text);
  dbeCCostos.text := DMLOG.DisplayDescrip('prvSQL','TGE203','CCOSDES',sSQL,'CCOSDES');
end;

procedure TFSeguiReqs.dblcCompradorExit(Sender: TObject);
var
	xSql:String;
begin
  xsql := 'COMPCID=' + QuotedStr(dblcComprador.Text);
  dbeComprador.Text:= DMLOG.DisplayDescrip('prvSQL','TGE135','COMPDES',xsql,'COMPDES');
	if Length(Trim(DMLOG.cdsReqs.FieldByName('RQSVISADOR').AsString)) = 0 then
    if Length(Trim(dbeNOCompra.Text)) = 0 then
      dbeNOCompra.Text := DMLOG.StrZero( DMLOG.MaxNOTranReq(dblcCIA.Text,dblcLOC.Text),8);
end;

procedure TFSeguiReqs.dbeNOCompraExit(Sender: TObject);
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
      ErrorMsg('Error','Ya existe una requisión con '+#13+
                       'el Mismo Número de Orden de Trabajo  ... '+sOTRAB);
    end;
  end;
end;

end.

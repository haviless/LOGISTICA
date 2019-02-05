unit LOG501;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,
  wwdbdatetimepicker, DBCtrls, db, wwSpeedButton, wwDBNavigator, Grids,
  Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, Wwdbspin, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe, ppModule, daDatMod, ppBands, ppPrnabl, ppCtrls, ppViewr,
  ppArchiv, GridControl,wwclient, ppTypes, Variants, MsgDlgs;

type
  TFSeguiOrdC = class(TForm)
    pnlCabecera: TPanel;
    dblcCIA: TwwDBLookupCombo;
    lblCIA: TLabel;
    dbmObs: TDBMemo;
    lblObs: TLabel;
    pnlDetalleG: TPanel;
    stxTitulo1: TStaticText;
    dbgDOrdComp: TwwDBGrid;
    lblTMon: TLabel;
    dblcTMoneda: TwwDBLookupCombo;
    dbeTMoneda: TwwDBEdit;
    dbdtpFEmi: TwwDBDateTimePicker;
    Label3: TLabel;
    dblcFPago: TwwDBLookupCombo;
    dbeFPago: TwwDBEdit;
    lblFPago: TLabel;
    Label6: TLabel;
    dedNProforma: TwwDBEdit;
    Label2: TLabel;
    dbdtpFAtt: TwwDBDateTimePicker;
    dbdtpFReg: TwwDBDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    dbseEnt: TwwDBSpinEdit;
    Label9: TLabel;
    dbsbVal: TwwDBSpinEdit;
    dbeTCambio: TwwDBEdit;
    lblTCamb: TLabel;
    dblcdProv: TwwDBLookupComboDlg;
    Label1: TLabel;
    lblImpxFle: TLabel;
    dbeFlete: TwwDBEdit;
    Label13: TLabel;
    dbeNReg: TwwDBEdit;
    dbeImpuesto: TwwDBEdit;
    dbrgTImpue: TDBRadioGroup;
    Label15: TLabel;
    Label14: TLabel;
    dblcLEntrega: TwwDBLookupCombo;
    dbeLEntrega: TwwDBEdit;
    pnlRRA: TPanel;
    pnlTitle5: TPanel;
    Bevel5: TBevel;
    BitBtn1: TBitBtn;
    dbgReqRelArt: TwwDBGrid;
    pnlEstado: TPanel;
    Label4: TLabel;
    btxtEstado: TDBText;
    Panel1: TPanel;
    Label5: TLabel;
    DBText1: TDBText;
    Z2bbtnVisado: TBitBtn;
    Z2bbtnSalir: TBitBtn;
    Bevel1: TBevel;
    Z2bbtnRequi: TBitBtn;
    Z2bbtnFactura: TBitBtn;
    bvlT: TBevel;
    lblTComp: TLabel;
    dbeTCompra: TwwDBEdit;
    lblTFlete: TLabel;
    dbeTFlete: TwwDBEdit;
    lbltImp: TLabel;
    dbeTimpues: TwwDBEdit;
    Label16: TLabel;
    dbeTotISC: TwwDBEdit;
    lblTDesc: TLabel;
    Z2btnDesc: TButton;
    dbeDesc: TwwDBEdit;
    dbeTotal: TwwDBEdit;
    lblTotal: TLabel;
    edtProv: TEdit;
    Z2bbtnAlmacen: TBitBtn;
    pnlDetalleA: TPanel;
    bvlDetalle: TBevel;
    Label10: TLabel;
    Z2bbtnRegOk: TBitBtn;
    stxTitulo2: TStaticText;
    dblcUMed: TwwDBLookupCombo;
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
    dbeValVen: TEdit;
    edtCia: TEdit;
    SpeedButton1: TSpeedButton;
    procedure dbmObsKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcEditExit(Sender: TObject);
    procedure dedNProformaExit(Sender: TObject);
    procedure dbrgTImpueChange(Sender: TObject);
    procedure dblcFPagoExit(Sender: TObject);
    procedure dbeDescExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure pprOCPAfterPrint(Sender: TObject);
    procedure pprOCPBeforePrint(Sender: TObject);
    procedure Z2bbtnVisadoClick(Sender: TObject);
    procedure Z2bbtnSalirClick(Sender: TObject);
    procedure Z2bbtnRequiClick(Sender: TObject);
    procedure dbgDOrdCompDblClick(Sender: TObject);
    procedure Z2bbtnFacturaClick(Sender: TObject);
    procedure dblcCIAExit(Sender: TObject);
    procedure dblcdProvExit(Sender: TObject);
    procedure dblcTMonedaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcLEntregaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z2bbtnRegOkClick(Sender: TObject);
    procedure dblcUMedExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    iEstado : Integer;
    xMontoVisar: double;
    xPeriodo : String;
    xYear,xMes,xDia : Word;
    //**
    procedure  AsigDat;
    procedure lblEstado;
    procedure cSetFocus ( Sender: TObject ; const sMsg : String);
    function EHandlerError(Ex : Exception ) : Boolean;
    procedure ppReportOC;
		//Function  wPreUni : integer;
    procedure CalculoNivel;
    procedure CreaSuperior;
    procedure inicializoCero(xcds : TwwClientDataSet);
    procedure CalculoNivelSupe;
  public
    { Public declarations }
    procedure CalTotal(Sender : TObject);

  end;

var
  FSeguiOrdC: TFSeguiOrdC;

implementation

uses LOGDM1, LOG502, LOG503, oaAD3100;

{$R *.DFM}

procedure TFSeguiOrdC.AsigDat;
var
D, M, Y : Word;
begin
   // --> Asignar datos de cabecera de requisición
   with DMLOG do
   begin
      with cdsOrdComp do
      if State in [dsInsert, dsEdit] then
      begin
         DecodeDate(Now, Y, M, D);
         if (State in [dsInsert]) and (FieldbyName('ODCObs').IsNull ) then
            FieldbyName('ODCObs').AsString   := '   '; // colocar datos en blanco o algo
         if State in [dsInsert] then
         begin
           FieldbyName('ODCEst').AsString   := 'INICIAL'; // inicial...
           FieldbyName('ODCTOTALG').AsFloat := 0.0;
           FieldByName('ODCIXTCC').AsFloat  := 0.0;
           FieldByName('ODCTTIMPU').AsFloat := 0.0;
           FieldByName('ODCIXTD').AsFloat   := 0.0;
         end;

         {dbdtpFEntregaExit(nil);
          dbdtpFLimiteExit(nil);}

         FieldbyName('ODCUser').AsString   := DMLOG.wUsuario;  // por el momento nada no se sabe nada del usuario
         FieldbyName('ODCAno').AsString    := IntToStr(Y);
         FieldbyName('ODCMM').AsString     := DMLOG.strzero(IntToStr(M),2);
         FieldbyName('ODCDD').AsString     := DMLOG.strzero(IntToStr(D),2);
         //FieldbyName('ODCTri').AsString    := '';
         //FieldbyName('ODCSem').AsString    := '';
         //FieldbyName('ODCSS').AsString     := '';
         FieldbyName('ODCANOMM').AsString  := IntToStr(Y)+DMLOG.strzero(IntToStr(M),2);
         //FieldbyName('ODCAATri').AsString  := '';
         //FieldbyName('ODCAASem').AsString  := '';
         //FieldbyName('ODCAASS').AsString   := '';
         //FieldbyName('FlagVar').AsString    := '';
         FieldbyName('ODCFReg').AsDateTime := Date;
         FieldbyName('ODCHReg').AsDateTime := SysUtils.Time;
      end;
   end;
end;



procedure TFSeguiOrdC.lblEstado;
begin
end;

procedure TFSeguiOrdC.dbmObsKeyPress(Sender: TObject; var Key: Char);
var
  sC : String;
begin
  sC := Key;
  sC := Uppercase(sC);
  Key:= sC[1];
end;

procedure TFSeguiOrdC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//   FVisOCReq.free ;
//  DMLOG.cdsLEntrega.Close;
   // vhndema
   //FOrdendeCompra.wTipoOC := '';
   // end vhndema
   
   DMLOG.wModo := '';
   //FVariables.w_AD_Registro := False;
   //FVariables.w_Num_Formas  := FVariables.w_Num_Formas-1;
   Action := CAFree;
end;

procedure TFSeguiOrdC.cSetFocus(Sender: TObject; const sMsg: String);
begin
 if TCustomEdit(Sender).Text='' then
 begin
   ErrorMsg('Error',sMsg);
   TCustomEdit(Sender).SetFocus;
 end;
end;

function TFSeguiOrdC.EHandlerError(Ex : Exception ) : Boolean;
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

procedure TFSeguiOrdC.dblcEditExit(Sender: TObject);
begin
  if TCustomEdit(Sender).Text='' then
  begin
    ErrorMsg( 'Error','El Campo no debe estar vacío');
    TCustomEdit(Sender).SetFocus;
  end;
end;


{+.............................................................................+
 |   Calulo de los totales de la orden de compra                               |
 +.............................................................................+}
procedure TFSeguiOrdC.CalTotal(Sender: TObject);
var
  rTC, rTot, rTD, rTi, rTf, rTp, rI, rX, rTTi  : Real;
  bTotal                                       : Boolean;
begin
   rTC    := 0;
   rTot   := 0;
   rTD    := 0;
   rTi    := 0;
   rTf    := 0;
   bTotal := DMLOG.cdsOrdComp.FieldByName('ODCTIMP').AsString = 'TOTAL';
   rI     := 0;

   with DMLOG.cdsDOrdComp do
   begin
      First;
      while not Eof do
      begin
        if bTotal then    // Total Importe Articulo
           rTC := FieldByName('DODCIMP').AsFloat + rTC
        else begin
           rTC := (FieldByName('DODCIMP').AsFloat + rTC);
           rI  := (rTC*(FieldByName('DODCIMPU').AsFloat/100))+rI;
        end;
        rTp := (FieldByName('DODCCNT').AsFloat * FieldByName('DODCPUN').AsFloat);
        rTD := rTD+( rTp * (FieldByName('DODCDSCTO').AsFloat/100));
        Next;
      end;

      rTot:=rTot+(rTC-rTD);
   end;

   with DMLOG.cdsOrdComp do
   begin
     if bTotal Then
        rTi := FieldByName('ODCIXTI').AsFloat
     else
        rTi := rI;

     rTf := FieldByName('ODCIXFLE').AsFloat;

     Edit;
     FieldByName('ODCIXTCC').AsFloat   := rTC;
     FieldByName('ODCTTIMPU').AsFloat  := rTi;
     FieldByName('ODCIXTD').AsFloat    := rTD;

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
     FieldByName('ODCTTIMPU').AsFloat := rTTi;
     FieldByName('ODCTOTALG').AsFloat := rX;

     post;
   end;

end;

procedure TFSeguiOrdC.dedNProformaExit(Sender: TObject);
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

procedure TFSeguiOrdC.dbrgTImpueChange(Sender: TObject);
begin
 if DMLOG.cdsOrdComp.State in [dsEdit, dsInsert] then
    if dbrgTImpue.ItemIndex=0 then
    begin
      dbeImpuesto.Text:='0';
      dbeImpuesto.Enabled := False;
    end
    else begin
      dbeImpuesto.Text:='';
      dbeImpuesto.Enabled := Enabled;
      //dbeImpuesto.SetFocus;
    end
end;

procedure TFSeguiOrdC.dblcFPagoExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'CIAID='+quotedstr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)
            +' and CCOMERID='+quotedstr(DMLOG.cdsOrdComp.FieldByName('CCOMERID').AsString);
   dbeFPago.text := DMLOG.DisplayDescrip('prvSQL','CXC101','CCOMERDES',xWhere,'CCOMERDES');
//  if trim(dblcFPago.Text)='' then
//     dblcFPago.DropDown;
  if dbrgTImpue.Visible  then
     if trim(dblcFPago.Text)<>'' then
     begin
       dbrgTImpue.SetFocus;
       dbrgTImpue.Field.AsString := 'DETALLADO';
     end
end;

procedure TFSeguiOrdC.dbeDescExit(Sender: TObject);
var
  rTD, rTC, rTf, rTo, rTi: Extended;
begin
  if dbeDesc.DataSource.Dataset.State in [dsEdit, dsInsert] then
  begin
      with DMLOG.cdsOrdComp do
      begin
        rTC := FieldByName('ODCIXTCC').AsFloat;
        rTD := FieldByName('ODCIXTD').AsFloat;
        rTf := FieldByName('ODCIXFLE').AsFloat;
        rTi := FieldByName('ODCTTIMPU').AsFloat;
        rTo := (rTC-rTD)+rTf+rTi;
        FieldByName('ODCTOTALG').AsFloat := rTo;
        post;
      end;
    dbeDesc.Enabled := False;
  end;
end;

procedure TFSeguiOrdC.dblcLEntregaExit(Sender: TObject);
begin
  dbeLEntrega.Text := DMLOG.DisplayDescrip('prvSQL','TGE136','LGECABR','LGECID='+quotedStr(dblcLEntrega.text),'LGECABR');
end;

procedure TFSeguiOrdC.FormDestroy(Sender: TObject);
begin
	DMLOG.cdsDOrdComp.BeforePost := nil;
end;

procedure TFSeguiOrdC.BitBtn1Click(Sender: TObject);
begin
	pnlRRA.Visible := False;
  pnlCabecera.Enabled := True;
end;

procedure TFSeguiOrdC.pprOCPAfterPrint(Sender: TObject);
begin
  if DMLOG.cdsOrdComp.FieldByName('ODCFATE').IsNull then
  begin
   DMLOG.cdsOrdComp.Edit;
   DMLOG.cdsOrdComp.FieldByName('ODCFATE').AsDateTime := Date;
	 DMLOG.cdsOrdComp.Post;
	 //DMLOG.ControlTran;
	 DMLOG.ControlTran( 9, DMLOG.cdsOrdComp, 'ORDCOMP' )
   //DMLOG.cdsOrdComp.ApplyUpdates(0);
  end;
end;

procedure TFSeguiOrdC.pprOCPBeforePrint(Sender: TObject);
begin
{ pprOCP.PreviewForm.WindowState := wsMaximized;
 TppViewer(pprOCP.PreviewForm.Viewer).ZoomSetting := zsPageWidth;}
 TppReport(Sender).PreviewForm.WindowState := wsMaximized;
 TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

procedure TFSeguiOrdC.ppReportOC;
var
  sSQL ,
  sCIA : String;
begin
 with DMLOG.cdsSQL do
 begin
   sCIA  := DMLOG.cdsOrdComp.FieldByName('ODCID').AsString;
   sSQL  := ' SELECT                                   '+
            '   A.*, B.*, C.*, D.*, E.*, F.*, G.*, H.*,'+
            '   I.*                                    '+
            ' FROM                                     '+
            '   LOG304 A,                     '+
            '   LOG305 B,                     '+
            '   TGE201 C,                     '+
            '   TGE136 D,                     '+
            '   TGE103 E,                     '+
            '   TGE130 F,                     '+
            '   TGE101 G,                     '+
//            '   TGE112 H,                     '+
            '   TGE205 I                      '+
            ' WHERE                                    '+
            '     A.CIAID=B.CIAID                      '+
            ' AND B.ODCID=A.ODCID                      '+
            ' AND C.PROV=A.PROV                        '+
            ' AND D.LGECID=A.LGECID                    '+
            ' AND E.TMONID=A.TMONID                    '+
            ' AND F.UNMID=B.UNMID                      '+
            ' AND G.CIAID=A.CIAID                      '+
//            ' AND H.FPAGOID=A.FPAGOID                  '+
            ' AND I.ARTID=B.ARTID                      '+
            ' AND A.ODCID='''+sCIA+'''';

   DisableControls;
   Close;
   DataRequest(sSQL);
   Open;
   EnableControls;
 end;
end;

procedure TFSeguiOrdC.Z2bbtnVisadoClick(Sender: TObject);
var
	Monto : Double ;
  xSql : String;
begin
	if (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) = 'INICIAL') and
		 (DMLOG.cdsDOrdComp.RecordCount>0)  and
		 (wPreUni = 0	)	then // i4nicial...
	begin
		if MessageDlg('Confirme Visación de Orden de Compra' , mtConfirmation ,[ mbOK , mbCancel ] , 0 ) = mrok then
		begin
			If wActuaPresu then
			begin
			if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
				begin
					xSql:= 'SELECT LOG324.CIAID, LOG324.ODCID, LOG324.RQSID, SUM(IMPTOT) TOT,LOG308.PARPRESID, LOG308.TIPPRESID, '+
								 'LOG308.CCOSID FROM LOG324 LEFT JOIN LOG308 ON (LOG324.RQSID=LOG308.RQSID) '+
								 'LEFT JOIN LOG305 ON (LOG324.ODCID=LOG305.ODCID AND LOG324.ARTID=LOG305.ARTID) '+
								 'WHERE LOG324.ODCID='+Quotedstr(dbeNReg.Text) +' AND LOG324.CIAID='+Quotedstr(dblcCIA.text)+' '+
								 'GROUP BY LOG324.CIAID, LOG324.ODCID, LOG324.RQSID, LOG308.CCOSID';
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
        //DMLOG.cdsSQL.DataRequest(xSql);
        //DMLOG.cdsSQL.open;
     end;

      if dblcTMoneda.Text <> DMLOG.wTMonLoc then
        Monto :=  DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').AsFloat * strtoFloat(dbeTCambio.text)
      else
        Monto :=  DMLOG.cdsOrdComp.fieldbyname('ODCTOTALG').AsFloat ;

      if Monto > xMontoVisar then
      begin
         Raise Exception.create ( 'Su monto Máximo de Visación es :'+currtostr(xMontoVisar) ) ;
      end ;
      DMLOG.cdsOrdComp.edit ;
      DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString  := DMLOG.wUsuario;
      //DMLOG.cdsOrdComp.FieldByName('OCVISFREG').AsDateTime := Date;
      {if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
      	DMLOG.cdsOrdComp.FieldByName('OCVISHREG').AsDateTime := SysUtils.Time;
      end
      else
      if SRV_D = 'ORACLE' then
      begin
      	DMLOG.cdsOrdComp.FieldByName('OCVISHREG').AsDateTime := Date+SysUtils.Time;
      end;{}
			DMLOG.cdsOrdComp.post ;
			//DMLOG.ControlTran;
			DMLOG.ControlTran( 9, DMLOG.cdsOrdComp, 'ORDCOMP');

         if DMLOG.wTipoAdicion='xFiltro' then
         begin
            DMLOG.ActualizaFiltro(Mtx3100,DMLOG.cdsOrdComp,'M');
         end;

			If wActuaPresu then
			 begin
				DecodeDate(Date,xYear,xMes,xDia);
				xPeriodo := FloatToStr(xYear) +  DMLOG.strZero(FloatToStr(xMes),2);
				//CalculoNivel;
			 end;
      Z2bbtnVisado.Enabled := False ;
    end ;
  end;
end;

{Function  TFSeguiOrdC.wPreUni : integer;
var
	wConta : Integer;
begin
	wConta := 0;
  DMLOG.cdsDOrdComp.DisableControls;
  DMLOG.cdsDOrdComp.First;
  while not DMLOG.cdsDOrdComp.Eof do
  begin
		if DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsFloat = 0.0 then
    	wConta:=wConta+1;
  	DMLOG.cdsDOrdComp.Next;
  end;
  DMLOG.cdsDOrdComp.First;
  DMLOG.cdsDOrdComp.EnableControls;
  if wConta > 0 then
  	ErrorMsg('Adquisiciones', ' Al menos uno de los Campos de Precio Unitario esta en Blanco '+#13+
    									' No se Puede Visar esta Orden de Compra '+#13+#13+
                  'Verifique !!! ');
	Result:= wConta;
end;}

procedure TFSeguiOrdC.Z2bbtnSalirClick(Sender: TObject);
begin
  if DMLOG.cdsOrdComp.State = dsedit then
    DMLOG.cdsOrdComp.Cancel;
  close ;
end;

procedure TFSeguiOrdC.Z2bbtnRequiClick(Sender: TObject);
begin
	FVisOCReq.ShowModal ;
end;

procedure TFSeguiOrdC.dbgDOrdCompDblClick(Sender: TObject);
var
	xWhere : String;
begin
	if DMLOG.cdsDOrdComp.RecordCount = 0 then
  begin
  	ErrorMsg('Adquisiciones', ' No Existen Registros a Editar ');
    Exit;
  end;
	try
  	Screen.Cursor:=crHourGlass;
    //OnOffDetalle(False);          // Desactivar el panel de detalle
    dbeItem.Text    := DMLOG.cdsDOrdComp.FieldByName('DODCID').AsString;
    dbcldArti.Text  := DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString;
    xWhere := 'ARTID = ''' + DMLOG.cdsDOrdComp.FieldByName('ARTID').AsString + ''' ';
    if DMLOG.RecuperarDatos('TGE205','*',xWhere) then
    begin
      if DMLOG.cdsQry.FieldByName('ARTISC').AsString = 'S' then
        dbeISC.Enabled := True
      else
        dbeISC.Enabled := False;
    end;
    dblcUMed.Text     := DMLOG.cdsDOrdComp.FieldByName('UNMID').AsString;
		//edtUMed.Text			:= DMLOG.DisplayDescrip('prvSQL','TGE130','UNMDES','UNMID='+quotedStr(dblcUMed.Text),'UNMDES');
    dbeCnt.Text       := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsCurrency]  );
    dbePUnit.Text     := Format('%0.4f', [DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsCurrency]  );
		dbeValVen.Text    := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsCurrency*DMLOG.cdsDOrdComp.FieldByName('DODCCNT').AsCurrency]  );
   	dbeDscto.Text     := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCDSCTO').AsCurrency]);
    dbeImporte.Text   := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCIMP').AsCurrency]  );
    dbeImpInd.Text    := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCIMPU').AsCurrency] );
    dbeISC.Text       := Format('%0.2f', [DMLOG.cdsDOrdComp.FieldByName('DODCISCU').AsCurrency] );
    edtAdq.Text       := DMLOG.cdsDOrdComp.FieldByName('TIPOADQ').AsString;
    memDetalle.Text   := DMLOG.cdsDOrdComp.FieldByName('DODCOBS').asString;

    //Datos del Panel de DetalleA//
    dblcUMed.onExit(sender);
    pnlDetalleA.Visible := True;  // Activar el panel de Mantenimiento
    pnlDetallea.BringToFront;
    //DMLOG.cdsDOrdComp.Edit;
    //iEstado:=1;
  finally
  	Screen.Cursor:=crDefault;
  end;
	//FVisOCReq.ShowModal ;
end;

procedure TFSeguiOrdC.Z2bbtnFacturaClick(Sender: TObject);
var
   xxCia      ,
   xxTDiario  ,
   xxAnoMM    ,
   xxNoReg    : String ;
begin
   DMLOG.cdsQry.Active := False ;
   DMLOG.cdsQry.ProviderName := 'prvLOG' ;
   DMLOG.cdsQry.DataRequest('SELECT * FROM CXP301 WHERE CIAID='''+ dblcCIA.Text +
                          ''' AND CPOCOMP = ''' + dbeNReg.Text + ''' ')  ;
   DMLOG.cdsQry.Active := True ;

   xxCia    := DMLOG.cdsqry.FieldByName( 'CIAID' ).AsString  ;
   xxTDiario:= DMLOG.cdsqry.FieldByName( 'TDIARID' ).AsString  ;
   xxAnoMM  := DMLOG.cdsqry.FieldByName( 'CPANOMES' ).AsString ;
   xxNoReg  := DMLOG.cdsqry.FieldByName( 'CPNOREG' ).AsString  ;

   DMLOG.Filtracds( DMLOG.cdsMovCxP,'Select * from CXP301 Where '
                + 'CIAID='    +''''+ xxCia     +''''+' and '
                + 'TDIARID='  +''''+ xxTDiario +''''+' and '
                + 'CPANOMES=' +''''+ xxAnoMM   +''''+' and '
                + 'CPNOREG='  +''''+ xxNoReg   +'''' );
   FProvision := TFProvision.create(self) ;
   try
     FProvision.ShowModal;
   finally
     FProvision.Free ;
   end ;
end;


procedure TFSeguiOrdC.dblcCIAExit(Sender: TObject);
begin
  if sender = dblcCIA then
  begin
    edtCIA.Text := DMLOG.DisplayDescrip('prvSQL','TGE101','CIADES','CIAID='+quotedStr(dblcCIA.text),'CIADES');
    exit;
  end;
end;

procedure TFSeguiOrdC.dblcdProvExit(Sender: TObject);
begin
  if sender = dblcdProv then
  begin
    edtProv.Text := DMLOG.DisplayDescrip('prvSQL','TGE201','PROVDES','PROV='+quotedStr(dblcdProv.text),'PROVDES');
    exit;
  end;
end;

procedure TFSeguiOrdC.dblcTMonedaExit(Sender: TObject);
begin
  dbeTMoneda.text := DMLOG.DisplayDescrip('prvSQL','TGE103','TMONDES','TMONID='+quotedStr(dblcTMoneda.text),'TMONDES');
	//if strtofloat(dblcTMoneda.Text) > 0 then
  //begin
  //  Exit;
  //end;
end;

procedure TFSeguiOrdC.FormCreate(Sender: TObject);
begin
  DMLOG.FiltraTabla( DMLOG.cdsLEntrega,    'TGE136', 'LGECID', 'LGECID');
  //DMLOG.cdsLEntrega.Open;
end;


procedure TFSeguiOrdC.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFSeguiOrdC.Z2bbtnRegOkClick(Sender: TObject);
begin
  pnlDetalleA.Visible := False;
end;

procedure TFSeguiOrdC.dblcUMedExit(Sender: TObject);
begin
	edtUMed.Text := DMLOG.DisplayDescrip('prvSQL','TGE130','UNMDES','UNMID='+quotedStr(dblcUMed.Text),'UNMDES');
end;



//**********************************************************************//
// pjsv - para presupuestos
// 08/10/20000 pjsv. para actualizar el monto comprometido
// en el PPRES301,
procedure TFSeguiOrdC.CalculoNivel;
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
  //xestado : bool;
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
procedure TFSeguiOrdC.CreaSuperior;
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


// pjsv - para presupuestos
procedure TFSeguiOrdC.inicializoCero;
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


// pjsv - para presupuestos
procedure TFSeguiOrdC.CalculoNivelSupe;
var
  xppcomun,xmaxdigitosup,xmaxnivelsup,xmaxnivelinf,ssql : string;
  xcc,xmes,xmaxdigitoint,xmaxnivelint,xmaxdigitoinf : string;
  ix : integer;
  xestado,xestado1 : bool;
  // para los EJMN y EJME del mes 01 al mes 12
  xmontos : array[1..24] of double;
  xtotmcmn,xtotmcme : double;
begin
   xestado := False; xestado1 := False;
   // tabla de niveles, se ordena por el nivel
   ssql :='';
   ssql := 'SELECT * FROM PPRES103 ORDER BY PARPRESNIV';
   DMLOG.cdsNivelPresu.close;
   DMLOG.cdsNivelPresu.DataRequest(ssql);
   DMLOG.cdsNivelPresu.open;
   DMLOG.cdsNivelPresu.First;
   // se recorre el client del detalle, por lo que en este se encuentran
   //  las P.P. a actualizar
   DMLOG.cdsSql.First;
   while not DMLOG.cdsSql.eof do
    begin
        // solo si se cambia de centro de costo
        if xcc <> DMLOG.cdsDetCxP.fieldbyname('CCOSID').AsString then
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
          // se carga la variable
          xcc := DMLOG.cdsSql.fieldbyname('CCOSID').AsString;
         end;
       if xppcomun <> copy(DMLOG.cdsSql.fieldbyname('PARPRESID').AsString,1,1) then
         begin
          //////////// poceso para genera los niveles superiores ////////////
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
          xppcomun := copy(DMLOG.cdsDetCxP.fieldbyname('PARPRESID').AsString,1,StrToInt(xmaxdigitosup));
          DMLOG.cdsNivelPresu.Last;
          // jalo el máximo nivel inferior de la tabla de niveles
          xmaxnivelinf := DMLOG.cdsNivelPresu.fieldbyname('PARPRESNIV').AsString;
          // se jala el máximo digito inferior
          xmaxdigitoinf := DMLOG.cdsNivelPresu.fieldbyname('DIGITOS').AsString;

          // se filtra la tabla por CIA, TIPPRESID RQPARTANO y PARPRESID cuyo digito
          //  sustraido se igual al xppcomun
          ssql := '';
          ssql := 'SELECT PARPRESID,PARPREDES,RQPARTIS,TMONID,'+
                         'DPREEJMN01,DPREEJMN02,DPREEJMN03,DPREEJMN04,DPREEJMN05,DPREEJMN06,'+
                         'DPREEJMN07,DPREEJMN08,DPREEJMN09,DPREEJMN10,DPREEJMN11,DPREEJMN12,'+
                         'DPREEJME01,DPREEJME02,DPREEJME03,DPREEJME04,DPREEJME05,DPREEJME06,'+
                         'DPREEJME07,DPREEJME08,DPREEJME09,DPREEJME10,DPREEJME11,DPREEJME12,'+

                  ' FROM PPRES301 WHERE CIAID='+quotedstr(dblcCia.Text)+
                  ' AND CCOSID='+quotedstr(DMLOG.cdsSql.fieldbyname('CCOSID').AsString)+
                  ' AND TIPPRESID='+quotedstr(DMLOG.cdsSql.fieldbyname('TIPPRESID').AsString)+
                  ' AND SUBSTR(PARPRESID,1,'+xmaxdigitosup+')='+quotedstr(xppcomun)+
                  ' AND RQPARTANO='+quotedstr(FloatToStr(xYear));
          DMLOG.cdsQry.Close;
          DMLOG.cdsQry.DataRequest(ssql);
          DMLOG.cdsQry.Open;
          DMLOG.cdsQry.first;
          // este proceso se repite hasta que la variable xmaxnivelint se iguale
          //   a la xmaxnivelsup. Esto me permite generar los niveles superiores
          //  que cuyo primer digito sea igual a la variable xppcomun
          repeat
            // ejemp. si el xmaxnivelinf = 03 ==>  xmaxnivelint = 02.
            xmaxnivelint := DMLOG.StrZero(IntToStr(StrToInt(xmaxnivelinf)-1),2);
            ssql := '';
            ssql := 'PARPRESNIV='+quotedstr(xmaxnivelint);
            xmaxdigitoint := DMLOG.buscaQRY('dspNivelPresu','PPRES103','*',ssql,'DIGITOS');
            // filtra la tabla de P.P.P. por todas aquellas cuyo digito sean igual al del
            //  xmaxdigitoint
            ssql := '';
            ssql := 'SELECT * FROM PPRES201 WHERE LENGTH(PARPRESID)='+xmaxdigitoint+
                    ' ORDER BY PARPRESID';
            DMLOG.cdsParPre.Close;
            DMLOG.cdsParPre.DataRequest(ssql);
            DMLOG.cdsParPre.Open;
            // se recorre la tabla
            while not DMLOG.cdsParPre.Eof do
             begin
               DMLOG.cdsQry.First;
               // se blanquea
               for iX := 1 to 24 do
                  xmontos[iX] := 0;
                // se recorre el clon del detalle
                while not DMLOG.cdsQry.Eof do
                 begin
                  // si el # de digitos es = al # maximo de digitos inferior
                  if length(DMLOG.cdsQry.fieldbyname('PARPRESID').AsString) = StrToInt(xmaxdigitoinf) then
                   // si la sustracción es = al nivel de la P.P..
                   if copy(DMLOG.cdsQry.fieldbyname('PARPRESID').AsString,1,StrToInt(xmaxdigitoint)) =
                    DMLOG.cdsParPre.fieldbyname('PARPRESID').AsString then
                    For iX := 1 to 12 do
                     begin
                      // se halla los montos para las 2 monesa y los 12 meses
                     //se agrego esta linea 17/10/2000 para que sólo actualice el mes del periodo
                      //y ya no los 12 meses
                        xmes := DMLOG.StrZero(IntToStr(iX),2);
                        xmontos[iX]    := xmontos[iX]    + DMLOG.cdsQry.fieldbyname('DPREMMCMN'+xmes).value;
                        xmontos[iX+12] := xmontos[iX+12] + DMLOG.cdsQry.fieldbyname('DPREMCME'+xmes).value;
                     end;
                   DMLOG.cdsQry.next;
                 end;
                 // si hubiera montos
                 for iX := 1 to 12 do
                  if xmontos[iX] <> 0 then
                    begin
                     xestado := true; break;
                    end;
                 // si es true, me indica que al menos hay una cantidad a actualizar
                 if xestado = true then
                  begin
                   xtotmcmn := 0;
                   xtotmcme := 0;
                   // para posicionarme sobre el nivel en el clon
                   if DMLOG.cdsQry.Locate('PARPRESID',DMLOG.cdsParPre.fieldbyname('PARPRESID').AsString,[loCaseInsensitive]) then
                      DMLOG.cdsQry.Edit;
                   // para posicionarme sobre el nivel en el detalle
                   if DMLOG.cdsDetPre.Locate('PARPRESID',DMLOG.cdsParPre.fieldbyname('PARPRESID').AsString,[loCaseInsensitive]) then
                      DMLOG.cdsDetPre.Edit;
                   for iX := 1 to 12 do
                    begin
                      xmes := DMLOG.StrZero(IntToStr(iX),2);
                      // para el cdsQry
                      DMLOG.cdsQry.fieldbyname('DPREMCMN'+xmes).AsString := FloatToStr(xmontos[iX]);
                      DMLOG.cdsQry.fieldbyname('DPREMCME'+xmes).AsString := FloatToStr(xmontos[iX+12]);
                      // para el detalle
                      DMLOG.cdsDetPre.fieldbyname('DPREMCMN'+xmes).AsString := FloatToStr(xmontos[iX]);
                      DMLOG.cdsDetPre.fieldbyname('DPREMCME'+xmes).AsString := FloatToStr(xmontos[iX+12]);
                    end;
                   //** 06/11/2000
                   for iX := 1 to 12 do
                    begin
                     // totales de EJ y VM
                      xtotmcmn := xtotmcmn + xmontos[iX];
                      xtotmcme := xtotmcme + xmontos[iX+12];
                    end;
                    //**
                    // para el detalle, se asignan los totales
                     DMLOG.cdsDetPre.fieldbyname('DPRETOMCMN').AsString := FloatToStr(xtotmcmn);
                     DMLOG.cdsDetPre.fieldbyname('DPRETOMCME').AsString := FloatToStr(xtotmcme);
                     DMLOG.cdsSQL.Post;
                     DMLOG.cdsDetPre.Post;
                     DMLOG.cdsDetPre.ApplyUpdates(0);
                     xEstado := false;
                   end;
                   DMLOG.cdsParPre.next;
                  end;
                 // se igualan variables
                 xmaxnivelinf := xmaxnivelint;
                 xmaxdigitoinf := xmaxdigitoint;
          until xmaxnivelsup = xmaxnivelint;
         end;
     DMLOG.cdsSql.Next;
    end;
end;


procedure TFSeguiOrdC.SpeedButton1Click(Sender: TObject);
var
  sSQL : String;
begin
  if (trim(DMLOG.cdsOrdComp.FieldbyName('ODCEST').AsString) <> 'ACEPTADO') then
    Exit;

  if Question('Confirmar', 'Esta Seguro de Poner en Estado  ''INICIAL''  La Orden de Compra '+ #13+#13+
               DMLOG.cdsOrdComp.FieldByName('ODCID').AsString  + '  -  Prov.  '+
               DMLOG.cdsOrdComp.FieldByName('PROVDES').AsString + #13+
               #13 +' Desea Continuar ') then
	begin
		Screen.Cursor:=crHourGlass;
		sSQL:= 'UPDATE LOG304 SET '+
           'ODCEST=''INICIAL'', '+
           'ODCVISADOR=NULL, '+
           'OCVISFREG=NULL, '+
           'OCVISHREG=NULL '+
           'WHERE	CIAID='+QuotedStr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)+' '+
           'AND ODCID='+QuotedStr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);
		try
			DMLOG.DCOM1.AppServer.EjecutaSQL(sSQL);
		Except
      ErrorMsg('Adquisiciones', 'Error al Poner en Estado Inicial la Orden de Compra')
		End;

    {if length(trim(DMLOG.cdsOrdComp.FieldByName('PROFID').AsString)) = 0 then
    begin
      sSQL:='SELECT * FROM LOG324 '+
            'WHERE CIAID='+QuotedStr(DMLOG.cdsOrdComp.FieldByName('CIAID').AsString)+' '+
            'AND ODCID='''+QuotedStr(DMLOG.cdsOrdComp.FieldByName('ODCID').AsString);

      DMLOG.cdsPadre.Close;
      DMLOG.cdsPadre.DataRequest(sSQL);
      DMLOG.cdsPadre.Open;

      DMLOG.cdsPadre.First;
      while not DMLOG.cdsPadre.Eof do
      begin

        DMLOG.cdsPadre.Next;
      end;

    end;}

		Screen.Cursor:=crDefault;
    Information('Adquisiciones', 'La Orden de Compra ya se Encuentra en Estado Inicial');
	end;
end;

procedure TFSeguiOrdC.FormShow(Sender: TObject);
var
	xFlag : Boolean ;
begin
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
   FVisOCReq := TFVisOCReq.create(self) ;
   FVisOCReq.ConfiguracionInicial(dbgDOrdComp) ;
   DMLOG.cdsQry.Active := False ;
   DMLOG.cdsQry.ProviderName := 'prvLOG' ;
   DMLOG.cdsQry.DataRequest('SELECT * FROM CXP301 WHERE CIAID='''+ dblcCIA.Text +
                         ''' AND CPOCOMP = ''' + dbeNReg.Text + ''' ')  ;
   DMLOG.cdsQry.Active := True ;
   if DMLOG.cdsQry.RecordCount <> 0 then
      Z2bbtnFactura.Enabled := True
   else
      Z2bbtnFactura.Enabled := False ;
   xFlag := False ;
   if DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').IsNull then
    	xFlag := True
   else
  	   if trim(DMLOG.cdsOrdComp.FieldByName('ODCVISADOR').AsString) = '' then
    	   xFlag := true ;
   if xFlag then
   begin
      DMLOG.cdsQry.Active := False ;
      DMLOG.cdsQry.DataRequest('SELECT * FROM TGE171 WHERE USERID='''+ DMLOG.wUsuario +''' ' )  ;
      DMLOG.cdsQry.Active := True ;
      if DMLOG.cdsQry.RecordCount <> 0 then
      begin
         if DMLOG.cdsQry.FieldByName('FOC').AsString = 'S' then
         begin
            xMontoVisar := DMLOG.cdsQry.fieldbyname('MONTOMAX').AsCurrency ;
            Z2bbtnVisado.Enabled := True ;
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
   if DMLOG.RecuperarDatos('TGE201','*','PROV=''' + DMLOG.cdsordcomp.fieldbyname('PROV').AsString + ''' ') then
      edtProv.Text := DMLOG.cdsQry.fieldbyname('PROVDES').AsString ;

   dblcCiaExit(dblcCia);
   dblcTMonedaExit(dblcTMoneda);
   dblcFPagoExit(dblcFPago);
   dblcLEntregaExit(dblcLEntrega);
	Screen.Cursor:=crDefault;
end;

end.

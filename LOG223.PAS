unit LOG223;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls,wwDBGrid,db;

type
  TFToolNeg = class(TForm)
    pnlcomandos: TPanel;
    bbtnReq: TBitBtn;
    bbtnMArt: TBitBtn;
    bbtnGenOC: TBitBtn;
    procedure bbtnReqClick(Sender: TObject);
    procedure bbtnMArtClick(Sender: TObject);
    procedure bbtnGenOCClick(Sender: TObject);
  private
    { Private declarations }
    grid : TwwDBGrid;
    sCIA,sProveedor,sNumORD,sNumREQ,sItem,sTMonId:string;
    fODCIXTCC,fODCIXTD,fODCTOTALG,fODCTTIMPU: real;
    fTODCIXTCC,fTODCIXTD,fTODCTOTALG,fTODCTTIMPU :real;
    fTCambio :real;
    procedure ValidaOrdenDeCompra;
    procedure ValidaTCambio;
    procedure InsertaCabeceraOrdenDeCompra;
    procedure InsertaDetalleOrdenDeCompra;
    procedure InsertaCabeceraRequisicion;
    procedure ActualizaArchivoDeControl(cnumero:string);
    procedure ActualizaEscritorio(creg:string);
    function  NumeroRegistro():string;
  public
    { Public declarations }
  end;

var
  FToolNeg: TFToolNeg;
  sCIA,sLinea,sFamilia,sSFamilia,sArticulo,sArtDes,sLocalidad,sRequisicion : string;
  bGeneraReq:Boolean;
implementation

uses Log224, Log225, oaAD2000, LOGDM1;

{$R *.DFM}

procedure TFToolNeg.bbtnReqClick(Sender: TObject);
begin
  FNegDesdeReq.ShowModal;
end;

procedure TFToolNeg.bbtnMArtClick(Sender: TObject);
begin
  FNegDesdeArt.ShowModal;
end;

procedure TFToolNeg.bbtnGenOCClick(Sender: TObject);
var
	ix : integer;
	sReg:string;
begin
	if DM1.cdsNegociacion.RecordCount = 0 then
	begin
		ErrorMsg('Adquisiciones', ' No Existe Informacion ');
		Exit;
	end;

	bGeneraReq:=False;
	ValidaOrdenDeCompra;
	ValidaTCambio;
	sNumORD := DM1.StrZero( DM1.MaxORD(trim(DM1.cdsNegociacion.FieldByName('CIAID').AsString)),8);
  sNumREQ :=DM1.StrZero( DM1.MaxReqA(DM1.cdsNegociacion.FieldByName('CIAID').AsString,'01'), 8);
	//sNumORD:='00099';
  sitem:='001';
  fTODCIXTCC:=0;
  fTODCIXTD:=0;
  fTODCTOTALG:=0;
  fTODCTTIMPU:=0;
	Screen.Cursor:=crHourGlass;
	if grid.SelectedList.Count>0 then
	begin
		for iX:= 0 to grid.SelectedList.Count-1 do
		begin
			grid.datasource.dataset.GotoBookmark(grid.SelectedList.items[iX]);
			sCIA         := DM1.cdsNegociacion.FieldByName('CIAID').AsString;
			sLinea       := DM1.cdsNegociacion.FieldByName('GRARID').AsString;
			sFamilia     := DM1.cdsNegociacion.FieldByName('FAMID').AsString;
			sSFamilia    := DM1.cdsNegociacion.FieldByName('SFAMID').AsString;
			sArticulo    := DM1.cdsNegociacion.FieldByName('ARTID').AsString;
			sArtDes      := DM1.cdsNegociacion.FieldByName('ARTDES').AsString;
			sUnMid       := DM1.cdsNegociacion.FieldByName('UNMID').AsString;
			// INSERTA DETALLE EN LA ORDEN DE COMPRA
			InsertaDetalleOrdenDeCompra;
			sReg:=NumeroRegistro;
			ActualizaArchivoDeControl(sReg);
			ActualizaEscritorio(sReg);
		end;
		InsertaCabeceraOrdenDeCompra;
		if bGeneraReq then
			InsertaCabeceraRequisicion;

		ShowMessage('Se generó la Orden de Compra N°:'+QuotedStr(sNumORD));
		Mtx.RefreshFilter;
	end;
  Screen.Cursor:=crDefault
end;

procedure TFToolNeg.ValidaOrdenDeCompra;
var
	ix :integer;
begin
	Grid := Mtx.FMant.dbgFiltro;
  if grid.SelectedList.Count>0 then
  begin
  	grid.datasource.dataset.GotoBookmark(grid.SelectedList.items[0]);
    sTMonId:=DM1.cdsNegociacion.FieldByName('TMONID').AsString;
    sProveedor:=DM1.cdsNegociacion.FieldByName('PROV').AsString;
    sCIA:=DM1.cdsNegociacion.FieldByName('CIAID').AsString;
  end;

  for iX:= 0 to grid.SelectedList.Count-1 do
  begin
  	grid.datasource.dataset.GotoBookmark(grid.SelectedList.items[iX]);

    if DM1.cdsNegociacion.FieldByName('FLAGORI').AsString='AR' Then
    	bGeneraReq:=true;

    if sTMonid<>DM1.cdsNegociacion.FieldByName('TMONID').AsString then
    begin
    	Raise Exception.Create('Existen Registro de diferentes monedas');
    end;

    if sProveedor<>DM1.cdsNegociacion.FieldByName('PROV').AsString then
    begin
    	Raise Exception.Create('Existen Registro de diferentes proveedores');
    end;

		if DM1.cdsNegociacion.FieldByName('ARTCNT').AsFloat<=0 then
    begin
    	Raise Exception.Create('La cantidad debe ser mayor que Cero');
    end;

		if DM1.cdsNegociacion.FieldByName('TCAMBIO').AsFloat<=0 then
    begin
    	Raise Exception.Create('El tipo de Cambio debe ser mayor que Cero');
    end;

		if DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat<=0 then
    begin
    	Raise Exception.Create('El Precio debe ser mayor que Cero');
    end;

		if DM1.cdsNegociacion.FieldByName('CCNOREG').AsString<>'99999999' then
    begin
    	Raise Exception.Create('Solo se pueden generar los Registros ''99999999'' ');
    end;

		if (DM1.cdsNegociacion.FieldByName('TMONID').IsNull) OR
       (DM1.cdsNegociacion.FieldByName('TMONID').AsString='') then
    begin
    	Raise Exception.Create('Existen Registros sin Moneda');
    end;

		if (DM1.cdsNegociacion.FieldByName('PROV').IsNull) OR
       (DM1.cdsNegociacion.FieldByName('PROV').AsString='') then
    begin
    	Raise Exception.Create('Existen Registros sin Proveedor');
    end;
  end;
end;

procedure TFToolNeg.InsertaCabeceraOrdenDeCompra;
var
	sProvDes,sFecha,sSQL:string;
begin
  sFecha := formatdatetime(dm1.wFormatFecha,Date);
  sSQL := 'SELECT * FROM TGE114 WHERE FECHA='+quotedstr(sFecha);
  DM1.FiltraCDS(DM1.cdsPeriodo, sSQL);

  sProvDes:=DM1.DisplayDescrip('prvTGE','TGE201','PROVDES','PROV='+QuotedStr(sProveedor),'PROVDES');

  sSQL:=' INSERT INTO LOG304 (CIAID,PROV,TMONID,ODCID,ODCFEMI,ODCTEN, '+
        ' ODCVALID,ODCTCAMB,ODCIXTCC,ODCIXTD,ODCEST,ODCFATE,ODCOBS, ODCUSER,ODCFREG,ODCHREG, '+
        ' ODCANO,ODCMM,ODCDD,ODCTRI,ODCSEM,ODCSS,ODCANOMM,ODCAATRI,ODCAASEM,ODCAASS, '+
        ' ODCTOTALG,ODCTTIMPU,ODCTOTALISC,TIPOADQ,PROVDES) '+
        ' VALUES ('+QuotedStr(sCIA)+','+QuotedStr(sProveedor)+','+QuotedStr(sTMonid)+','+QuotedStr(sNumORD)+','+
        DM1.wRepFecServi+',1,1,'+FloatToStr(fTCambio)+','+FloatToStr(fTODCIXTCC)+','+FloatToStr(fTODCIXTD)+','+
        QuotedStr('INICIAL')+','+DM1.wRepFecServi+','+QuotedStr('.')+','+QuotedStr(DM1.wUsuario)+','+DM1.wRepFecServi+','+DM1.wRepHorServi+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECANO').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECMES').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECDIA').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECTRIM').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECSEM').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECSS').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECANO').asString+DM1.cdsPeriodo.fieldbyName('FECMES').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECAATRI').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECAASEM').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECAASS').asString)+','+
        FloatToStr(fTODCTOTALG)+','+FloatToStr(fTODCTTIMPU)+','+
        '0,'+QuotedStr('C')+','+QuotedStr(sProvDes)+')';
  try
    DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
  end;
end;

procedure TFToolNeg.InsertaDetalleOrdenDeCompra;
var
	sSQL,sIGV : string;
  figv,fdescuento,fimporte,fimporteu : real;
begin
  fODCIXTCC:=0;
  fODCIXTD:=0;
  fODCTOTALG:=0;
  fODCTTIMPU:=0;

  sIGV:=DM1.DisplayDescrip('prvTGE','TGE128','TASA','TIPDET=''I1''','TASA');
  if sIGV <> '' then
   fIGV:=1+strToFloat(sIGV)/100;


  fdescuento:=DM1.cdsNegociacion.FieldByName('DESC1P').AsFloat+
              DM1.cdsNegociacion.FieldByName('DESC2P').AsFloat+
              DM1.cdsNegociacion.FieldByName('DESC3P').AsFloat+
              DM1.cdsNegociacion.FieldByName('DESC4P').AsFloat+
              DM1.cdsNegociacion.FieldByName('DESC5P').AsFloat;

  fimporte:= FRound(DM1.cdsNegociacion.FieldByName('ARTCNT').AsFloat*
//             DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat*(1-(fdescuento/100)),15,2);
             DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat,15,2);

//  fimporteu:= DM1.FRound(DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat*(1-(fdescuento/100)),15,4);
	fimporteu:= FRound(DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat,15,4);

  sSQL:=' INSERT INTO LOG305 (CIAID,ODCID,ARTID,UNMID,DODCID,DODCCNT,DODCPUN,DODCDSCTO,DODCIMP, '+
        ' DODCIMPU,ODCEST,DODCCATE,DODCCSLD,DODCISCU,TIPOADQ,DODCOBS,IMPTOT,IMPUNI) '+
        ' VALUES ('+QuotedStr(DM1.cdsNegociacion.FieldByName('CIAID').AsString)+','+
          QuotedStr(sNumORD)+','+QuotedStr(DM1.cdsNegociacion.FieldByName('ARTID').AsString)+','+
          QuotedStr(DM1.cdsNegociacion.FieldByName('UNMID').AsString)+','+QuotedStr(sItem)+','+
          DM1.cdsNegociacion.FieldByName('ARTCNT').AsString+','+
//          DM1.cdsNegociacion.FieldByName('PCOSNETO').AsString+','+FloatToStr(fdescuento)+','+
          DM1.cdsNegociacion.FieldByName('PCOSNETO').AsString+','+'0,'+
          FloatToStr(fimporte)+','+sIGV+','+QuotedStr('INICIAL')+',0,'+
          DM1.cdsNegociacion.FieldByName('ARTCNT').AsString+',0,'+QuotedStr('C')+','+QuotedStr(DM1.cdsNegociacion.FieldByName('ARTDES').AsString)+','+
					FloatToStr(FRound(fimporte*figv,15,2))+','+
          FloatToStr(FRound(fimporteu*figv,15,4))+')';


  fODCIXTCC:=fimporte;

	fODCIXTD:=FRound((DM1.cdsNegociacion.FieldByName('ARTCNT').AsFloat*DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat)-
					 (DM1.cdsNegociacion.FieldByName('ARTCNT').AsFloat*
//            DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat*(1-(fdescuento/100))),15,4);
						DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat),15,4);

	fODCTTIMPU:=FRound(DM1.cdsNegociacion.FieldByName('ARTCNT').AsFloat*
//            DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat*(1-(fdescuento/100))*(strToFloat(sIGV)/100),15,4);
						DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat*(strToFloat(sIGV)/100),15,4);

  fODCTOTALG:=FRound(DM1.cdsNegociacion.FieldByName('ARTCNT').AsFloat*
//            DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat*(1-(fdescuento/100))+fODCTTIMPU,15,4);
            DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat+fODCTTIMPU,15,4);

  fTODCIXTCC :=fTODCIXTCC+fODCIXTCC;
  fTODCIXTD  :=fTODCIXTD+fODCIXTD;
  fTODCTTIMPU:=fTODCTTIMPU+fODCTTIMPU;
  fTODCTOTALG:=fTODCTOTALG+fODCTOTALG;

  try
    DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
  end;

// INSERTA EN EL LOG304 LA RELACION ORDEN DE COMPRA - REQUISICION
  sSQL:=' SELECT RQSID FROM LOG328 '+
        ' WHERE CIAID='+QuotedStr(sCIA)+' AND GRARID='+QuotedStr(sLinea)+
        ' AND FAMID='+QuotedStr(sFamilia)+' AND SFAMID='+QuotedStr(sSFamilia)+
        ' AND ARTID='+QuotedStr(sArticulo)+' AND CCNOREG='+QuotedStr('99999999')+' ';

   DM1.cdsSQL.close;
   DM1.cdsSQL.DataRequest(sSQL);
   DM1.cdsSQL.Open;

   if (not DM1.cdsSQL.FieldByName('RQSID').IsNull) OR (DM1.cdsSQL.FieldByName('RQSID').AsString<>'') then
   begin
     sSQL:=' INSERT INTO LOG324 (CIAID,ODCID,DODCID,RQSID,DRQSID,ARTID,DODCCNT,TIPOADQ,DODCOBS,FLAGUM) '+
           ' VALUES ('+QuotedStr(sCIA)+','+QuotedStr(sNumORD)+','+QuotedStr(sItem)+','+
           QuotedStr(DM1.cdsSQL.FieldByName('RQSID').AsString)+','+QuotedStr(sItem)+','+
           QuotedStr(sArticulo)+','+DM1.cdsNegociacion.FieldByName('ARTCNT').AsString+','+
           QuotedStr('C')+','+QuotedStr('.')+','+QuotedStr('G')+')';
     try
       DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
     except
     end;
     sSQL:=' UPDATE LOG308 SET RQSEST='+QuotedStr('ATENDIDO')+
           ' WHERE CIAID='+QuotedStr(sCIA)+' AND RQSID='+QuotedStr(DM1.cdsSQL.FieldByName('RQSID').AsString);
     try
       DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
     except
     end;
	 end;

	 //INSERTA DETALLE DE REQUISICION
	if DM1.cdsNegociacion.FieldByName('FLAGORI').AsString='AR' then
	begin
		sSQL:=' INSERT INTO LOG324 (CIAID,ODCID,DODCID,RQSID,DRQSID,ARTID,DODCCNT,TIPOADQ,DODCOBS,FLAGUM) '+
					 ' VALUES ('+QuotedStr(sCIA)+','+QuotedStr(sNumORD)+','+QuotedStr(sItem)+','+
					 QuotedStr(sNumREQ)+','+QuotedStr(sItem)+','+
					 QuotedStr(sArticulo)+','+DM1.cdsNegociacion.FieldByName('ARTCNT').AsString+','+
					 QuotedStr('C')+','+QuotedStr('.')+','+QuotedStr('G')+')';
		try
			 DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
		except
		end;

		sSQL:=' INSERT INTO LOG309 (CIAID,RQSID,DRQSID,ARTID,DRQSCNSG,DRQSCNSU, '+
					 ' DRQSCNAG,DRQSCNAU,UNMIDG,RQSFREG,RQSEST,RQSFATE,TRQSID,PRIOID,LOCID, '+
					 ' RQSFLAGUM,DRQSOBS,TIPOADQ) '+
					 ' VALUES ('+QuotedStr(sCIA)+','+QuotedStr(sNumREQ)+','+QuotedStr(sItem)+','+
					 QuotedStr(sArticulo)+','+DM1.cdsNegociacion.FieldByName('ARTCNT').AsString+',0,'+
					 DM1.cdsNegociacion.FieldByName('ARTCNT').AsString+',0,'+QuotedStr(sUnMid)+','+
					 DM1.wRepFecServi+','+QuotedStr('ATENDIDO')+','+DM1.wRepFecServi+','+QuotedStr('01')+','+QuotedStr('M')+','+QuotedStr('01')+','+
					 QuotedStr('G')+','+QuotedStr(sArtDes)+','+QuotedStr('C')+')';
		try
			DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
		except
		end;
	end;
	sItem:= DM1.StrZero(IntToStr(StrToInt(sItem)+1),3);
end;

procedure TFToolNeg.ValidaTCambio;
var
	sTCambio : string;
	bPaso:boolean;
begin
	bPaso:=True;
	sTCambio:=DM1.CalcTipoCambio(DM1.wTMonExt, Date, DM1.wTipoCambio);
	if sTCambio='' then
	begin
		while bPaso do
		begin
			sTCambio:= InputBox('Ingreso de Datos', 'Tipo de Cambio', '0.00');
			try
				fTCambio:=StrToFloat(sTCambio);
				bPaso:=False;
			except
				bPaso:=True;
			end;
		end;
	end
	else
		fTCambio:=StrToFloat(sTCambio);
end;

procedure TFToolNeg.ActualizaArchivoDeControl(cnumero:string);
var
	sSQL:string;
begin
	sSQL:=' UPDATE LOG328 '+
				' SET (CCNOREG,FREG,HREG) ='+
        ' ('+QuotedStr(cnumero)+','+DM1.wRepFecServi+','+DM1.wRepHorServi+') '+
        ' WHERE CIAID='+QuotedStr(sCIA)+' AND GRARID='+QuotedStr(sLinea)+
        ' AND FAMID='+QuotedStr(sFamilia)+' AND SFAMID='+QuotedStr(sSFamilia)+
        ' AND ARTID='+QuotedStr(sArticulo)+' AND CCNOREG=''99999999'' ';
  try
    DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
  end;
end;

function TFToolNeg.NumeroRegistro:string;
var
	sNumReg,sSQL:string;
begin
  sSQL:=' SELECT MAX(CCNOREG) NUMERO FROM LOG327 '+
        ' WHERE CIAID='+QuotedStr(sCIA)+' AND GRARID='+QuotedStr(sLinea)+
        ' AND FAMID='+QuotedStr(sFamilia)+' AND SFAMID='+QuotedStr(sSFamilia)+
        ' AND ARTID='+QuotedStr(sArticulo)+' AND CCNOREG<>''99999999'' ';

  DM1.cdsSQL.Close;
  DM1.cdsSQL.DataRequest(sSQL);
  DM1.cdsSql.Open;

  if (DM1.cdsSQL.FieldByName('NUMERO').AsString='') OR (DM1.cdsSQL.FieldByName('NUMERO').IsNull) then
  begin
		sNumReg:='00000001';
  end
  else
  begin
    sNumReg:= DM1.StrZero(IntToStr(StrToInt(DM1.cdsSQL.FieldByName('NUMERO').AsString)+1),8);
  end;
  result:=sNumReg;
end;

procedure TFToolNeg.ActualizaEscritorio(creg: string);
var
	sSQL:string;
begin
  sSQL:=' UPDATE LOG327 '+
        ' SET (CCNOREG,FREG,HREG) ='+
        ' ('+QuotedStr(creg)+','+DM1.wRepFecServi+','+DM1.wRepHorServi+') '+
        ' WHERE CIAID='+QuotedStr(sCIA)+' AND GRARID='+QuotedStr(sLinea)+
        ' AND FAMID='+QuotedStr(sFamilia)+' AND SFAMID='+QuotedStr(sSFamilia)+
        ' AND ARTID='+QuotedStr(sArticulo)+' AND CCNOREG=''99999999'' ';
  try
    DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
  end;
end;

procedure TFToolNeg.InsertaCabeceraRequisicion;
var
	sSQL,sFecha:string;
begin
	sFecha := formatdatetime(dm1.wFormatFecha,Date);
  sSQL := 'SELECT * FROM TGE114 WHERE FECHA='+quotedstr(sFecha);
  DM1.FiltraCDS(DM1.cdsPeriodo, sSQL);

  sSQL:=' INSERT INTO LOG308(CIAID,RQSID,RQSFREQ,CCOSID,TRQSID,RQSSOLI,RQSAUTOR,RQSAPRO, '+
        ' RQSEST,RQSFATE,RQSOBS,RQSUSER,RQSFREG,RQSHREG,RQSANO,RQSMM,RQSDD,RQSTRI,RQSSEM, '+
        ' RQSSS,RQSANOMM,RQSAATRI,RQSAASEM,RQSAASS,PRIOID,LOCID,RQSVISADOR,TIPOADQ, '+
        ' RQSACEPFREG,RQSACEPHREG,RQSVISFREG,RQSVISHREG) '+
        ' VALUES ('+QuotedStr(sCIA)+','+QuotedStr(sNumREQ)+','+DM1.wRepFecServi+','+QuotedStr('05010')+','+
        QuotedStr('01')+','+QuotedStr(DM1.wUsuario)+','+QuotedStr(DM1.wUsuario)+','+QuotedStr(DM1.wUsuario)+','+
        QuotedStr('ATENDIDO')+','+DM1.wRepFecServi+','+QuotedStr('.')+','+QuotedStr(DM1.wUsuario)+','+DM1.wRepFecServi+','+
        DM1.wRepHorServi+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECANO').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECMES').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECDIA').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECTRIM').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECSEM').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECSS').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECANO').asString+DM1.cdsPeriodo.fieldbyName('FECMES').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECAATRI').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECAASEM').asString)+','+
        QuotedStr(DM1.cdsPeriodo.fieldbyName('FECAASS').asString)+','+
        QuotedStr('M')+','+QuotedStr('01')+','+QuotedStr(DM1.wUsuario)+','+QuotedStr('C')+','+
        DM1.wRepFecServi+','+DM1.wRepHorServi+','+DM1.wRepFecServi+','+DM1.wRepHorServi+')';
  try
    DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
  end;
end;

end.

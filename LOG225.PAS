unit LOG225;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, wwdblook,DB;

type
  TFNegDesdeArt = class(TForm)
    dbgArti: TwwDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lblGrArtID: TLabel;
    dblcGrpArti: TwwDBLookupCombo;
    dbeGrpArti: TwwDBEdit;
    lblFAM: TLabel;
    dblcFAM: TwwDBLookupCombo;
    dbeFAM: TwwDBEdit;
    dblcSUBFAM: TwwDBLookupCombo;
    lblSUBFAM: TLabel;
    dbeSFAM: TwwDBEdit;
    Label1: TLabel;
    dblcCia: TwwDBLookupCombo;
    dbeCIA: TwwDBEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure NotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcGrpArtiExit(Sender: TObject);
    procedure dblcFAMExit(Sender: TObject);
    procedure dblcSUBFAMExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure dblcCiaEnter(Sender: TObject);
    procedure dblcGrpArtiEnter(Sender: TObject);
    procedure dblcFAMEnter(Sender: TObject);
    procedure dblcSUBFAMEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure InsertaAnterior;
  public
    { Public declarations }
  end;

var
  FNegDesdeArt: TFNegDesdeArt;
  sCIA,sLinea,sFamilia,sSFamilia,sArticulo,sArtDes,sLocalidad,sRequisicion : string;
  sUnMid,sTCambio:string;
implementation
uses LOGDM1, oaAD2000;
{$R *.DFM}

procedure TFNegDesdeArt.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFNegDesdeArt.NotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFNegDesdeArt.dblcGrpArtiExit(Sender: TObject);
var
	sSQL : String;
begin
	Screen.Cursor:=crHourGlass;
	sSQL := 'SELECT * FROM TGE169 WHERE '+
				' TGE169.GRARID='+QuotedStr(dblcGrpArti.text)+
				' ORDER BY FAMID';
	DM1.cdsFAM.Close;
	DM1.cdsFAM.DataRequest(sSQL);
	DM1.cdsFAM.Open;
	if dblcGrpArti.Text <> '' then
	begin
		sSQL:='GRARID='+quotedstr(dblcGrpArti.text);
		dbeGrpArti.text:= DM1.DisplayDescrip('prvTGE','TGE131','GRARDES',sSQL,'GRARDES');
	end;
	Screen.Cursor:=crDefault;	
end;

procedure TFNegDesdeArt.dblcFAMExit(Sender: TObject);
var
	sSQL : String;
begin
	Screen.Cursor:=crHourGlass;
	sSQL := 'SELECT * FROM TGE170 WHERE '+
					' GRARID='+QuotedStr(dblcGrpArti.text)+
					' AND FAMID='+QuotedStr(dblcFAM.text)+
					' ORDER BY SFAMID';
	DM1.cdsSUBFAM.Close;
	DM1.cdsSUBFAM.DataRequest(sSQL);
	DM1.cdsSUBFAM.Open;
	if dblcFAM.Text <> '' then
	begin
		sSQL:='GRARID='+quotedstr(dblcGrpArti.text)+' AND FAMID='+quotedstr(dblcFAM.text);
		dbeFAM.text := DM1.DisplayDescrip('prvTGE','TGE169','FAMDES, ARTUSU',sSQL,'FAMDES');
	end;
	Screen.Cursor:=crDefault;	
end;

procedure TFNegDesdeArt.dblcSUBFAMExit(Sender: TObject);
var
	sSQL, xSQL : String;
begin
	Screen.Cursor:=crHourGlass;
	sSQL:='GRARID='+quotedstr(dblcGrpArti.text)+' AND FAMID='+quotedstr(dblcFAM.text)+' AND SFAMID='+quotedstr(dblcSUBFAM.text);
	dbeSFAM.text   := DM1.DisplayDescrip('prvTGE','TGE170','SFAMDES',sSQL,'SFAMDES');

	xSQL:='SELECT * FROM TGE205 A '+
				'WHERE A.CIAID='+QuotedStr(dblcCia.text);

	if dblcGrpArti.Text<>'' then
		xSQL:=xSQL+' AND A.GRARID= '+QuotedStr(dblcGrpArti.Text);

	if dblcFAM.Text<>'' then
		xSQL:=xSQL+' AND A.FAMID= '+QuotedStr(dblcFAM.Text);
	if dblcSUBFAM.Text<>'' then
		xSQL:=xSQL+' AND A.SFAMID= '+QuotedStr(dblcSUBFAM.Text);

	xSQL:=xSQL+' ORDER BY ARTID ';
	dm1.cdsArti.Close;
	dm1.cdsArti.DataRequest(xSQL);
	dm1.cdsArti.Open;
	Screen.Cursor:=crDefault;
end;

procedure TFNegDesdeArt.dblcCiaExit(Sender: TObject);
var
	sSQL : String;
begin
	if dblcCIA.text='' then
	begin
    ErrorMsg('Modulo de Compras','Compañia no Valida');
		//dblcCIA.setFocus;
		exit;
	end;
	Screen.Cursor:=crHourGlass;
	sSQL := 'SELECT * FROM TGE131 WHERE '+
				' CIAID='+QuotedStr(dblcCia.text)+
				' ORDER BY GRARID';
	DM1.cdsGArti.Close;
	DM1.cdsGArti.DataRequest(sSQL);
	DM1.cdsGArti.Open;

	dbeCIA.text := DM1.DisplayDescrip('prvSQL','TGE101','CIADES','CIAID='+quotedStr(dblcCIA.text),'CIADES');
	Screen.Cursor:=crDefault;	
end;

procedure TFNegDesdeArt.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFNegDesdeArt.FormActivate(Sender: TObject);
begin
	Screen.Cursor:=crHourGlass;
	DM1.cdsArti.Close;
	dbeCIA.Text:='';
	dbeGrpArti.text:='';
	dbeFAM.text:='';
	dbeSFAM.text:='';
	dblcCia.text:='';
	dblcGrpArti.text:='';
	dblcFAM.text:='';
	dblcSUBFAM.text:='';
	Screen.Cursor:=crDefault;	
end;

procedure TFNegDesdeArt.dblcCiaEnter(Sender: TObject);
begin
  dbeCIA.text:='';
end;

procedure TFNegDesdeArt.dblcGrpArtiEnter(Sender: TObject);
begin
  dbeGrpArti.text:='';
end;

procedure TFNegDesdeArt.dblcFAMEnter(Sender: TObject);
begin
  dbeFAM.text:='';
end;

procedure TFNegDesdeArt.dblcSUBFAMEnter(Sender: TObject);
begin
  dbeSFAM.text:='';
end;

procedure TFNegDesdeArt.BitBtn1Click(Sender: TObject);
var
	//bmk: TBookMark;
  ix : integer;
  sSQL:string;
begin
	if Length(Trim(dblcCia.Text)) = 0 then
	begin
		ErrorMsg('Modulo de Compras','Compañia no Valida');
		Exit;
	end;
	if dm1.cdsArti.Active = False then
	begin
		sSQL:='SELECT * FROM TGE205 A WHERE A.CIAID='+QuotedStr(dblcCia.text)+' ORDER BY ARTID';
		dm1.cdsArti.Close;
		dm1.cdsArti.DataRequest(sSQL);
		dm1.cdsArti.Open;
	end;

	if DM1.cdsArti.RecordCount = 0 then
  begin
  	ErrorMsg('Adquisiciones', ' No Existe Información ');
  	Exit;
  end;

  if dbgArti.SelectedList.Count<= 0 then
  begin
  	ErrorMsg('Adquisiciones', ' No a Seleccionado Articulos ');
  	exit;
  end;
	Screen.Cursor:=crHourGlass;
	sTCambio:=DM1.CalcTipoCambio(DM1.wTMonExt, Date, DM1.wTipoCambio);
	if sTCambio='' then
		sTCambio:='0';

	DM1.cdsArti.DisableControls;
	for iX := 0 to dbgArti.SelectedList.Count-1 do
	begin
		DM1.cdsArti.GotoBookmark(dbgArti.SelectedList.Items[iX]);
		sCIA         := DM1.cdsArti.FieldByName('CIAID').AsString;
		sLinea       := DM1.cdsArti.FieldByName('GRARID').AsString;
		sFamilia     := DM1.cdsArti.FieldByName('FAMID').AsString;
		sSFamilia    := DM1.cdsArti.FieldByName('SFAMID').AsString;
		sArticulo    := DM1.cdsArti.FieldByName('ARTID').AsString;
		sArtDes      := DM1.cdsArti.FieldByName('ARTDES').AsString;
		sUnMid       := DM1.cdsArti.FieldByName('UNMIDG').AsString;
		//sLocalidad   := DM1.cdsArti.FieldByName('LOCID').AsString;
		//sRequisicion := DM1.cdsArti.FieldByName('RQSID').AsString;

		sSQL:= 'SELECT * FROM LOG327 '+
					 'WHERE CIAID='+QuotedStr(sCIA)+' AND GRARID='+QuotedStr(sLinea)+
					 ' AND FAMID='+QuotedStr(sFamilia)+' AND SFAMID='+QuotedStr(sSFamilia)+
					 ' AND ARTID='+QuotedStr(sArticulo)+
					 ' ORDER BY CCNOREG DESC';

		DM1.cdsSQL.Close;
		DM1.cdsSQL.DataRequest(sSQL);
		DM1.cdsSQL.Open;
		DM1.cdsSQL.First;
		if DM1.cdsSQL.RecordCount<=0 then  //NO EXISTE EN EL ESCRITORIO
		begin
			sSQL:=' INSERT INTO LOG327 '+
						'(CIAID,GRARID,FAMID,SFAMID,ARTID,UNMID,ARTDES,ARTCNT,CCNOREG,FREG,HREG,TCAMBIO,FLAGORI) '+
						'VALUES('+QuotedStr(sCIA)+','+QuotedStr(sLinea)+','+QuotedStr(sFamilia)+','+QuotedStr(sSFamilia)+','+
												QuotedStr(sArticulo)+','+QuotedStr(sUnMid)+','+QuotedStr(sArtDes)+','+'0'+','+'''99999999'','+DM1.wRepFecServi+','+DM1.wRepHorServi+','+
												sTCambio+','+QuotedStr('AR')+')';
			try
				DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
			except
			end;
			//ActualizaDetalleRequisicion;
		end
		else
		begin
			if DM1.cdsSQL.RecordCount>1 then  // SIGNIFICA QUE HAY MINIMO DOS
			begin
				if DM1.cdsSQL.FieldByName('CCNOREG').AsString='99999999' then
				begin
					//ACTUALIZAR
					sSQL:='UPDATE LOG327 '+
								'SET (ARTCNT,FREG,HREG) = '+
								' (ARTCNT+'+'0'+','+DM1.wRepFecServi+','+DM1.wRepHorServi+') '+
								'WHERE CIAID='+QuotedStr(sCIA)+' AND GRARID='+QuotedStr(sLinea)+
								' AND FAMID='+QuotedStr(sFamilia)+' AND SFAMID='+QuotedStr(sSFamilia)+
								' AND ARTID='+QuotedStr(sArticulo)+' AND CCNOREG=''99999999'' ';
					try
						DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
					except
					end;
						//ActualizaDetalleRequisicion;
				end
				else
				begin
					//COJER DATOS
					//INSERTAR
					//DM1.cdsSQL.Prior;
					InsertaAnterior;
					//ActualizaDetalleRequisicion;
				end;
			end
			else
			begin
				if DM1.cdsSQL.RecordCount=1 then
				begin
					if DM1.cdsSQL.FieldByName('CCNOREG').AsString='99999999' then
					begin
						//ACTUALIZAR
						sSQL:='UPDATE LOG327 '+
									'SET (ARTCNT,FREG,HREG) = '+
									'(ARTCNT+'+'0'+','+DM1.wRepFecServi+','+DM1.wRepHorServi+') '+
									'WHERE CIAID='+QuotedStr(sCIA)+' AND GRARID='+QuotedStr(sLinea)+
									' AND FAMID='+QuotedStr(sFamilia)+' AND SFAMID='+QuotedStr(sSFamilia)+
									' AND ARTID='+QuotedStr(sArticulo)+' AND CCNOREG=''99999999'' ';
						try
							DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
						except
						end;
						//ActualizaDetalleRequisicion;
					end
					else
					begin
						//COJER DATOS
						//INSERTAR
						//DM1.cdsSQL.Prior;
						InsertaAnterior;
						//ActualizaDetalleRequisicion;
					end;
				end;
			end;
		end;
	end;
	DM1.cdsArti.EnableControls;
	Mtx.RefreshFilter;
	Screen.Cursor:=crDefault;	
end;

procedure TFNegDesdeArt.InsertaAnterior;
var
	sProveedor, sDesc1E, sDesc1P, sDesc2E, sDesc3E, sDesc2P, sDesc3P, sDesc4P : string;
	sDesc5P, sMargCosto, sPComCIGVLoc, sPComCIGVOri, sPComSIGVEXT, sPComSIGVLOC : string;
	sPComSIGVOri, sPCosNeto, sPCosUnVent, sPVenta, sRelacion, sTMonid, sPComCIGVEXT : string;
	sSQL : string;
begin
	DM1.cdsSQL.Prior;

	sProveedor  := DM1.cdsSQL.FieldByName('PROV').AsString;
  sDesc1E     := FloatToStr(DM1.cdsSQL.FieldByName('DESC1E').AsFloat);
  sDesc1P     := FloatToStr(DM1.cdsSQL.FieldByName('DESC1P').AsFloat);
  sDesc2E     := FloatToStr(DM1.cdsSQL.FieldByName('DESC2E').AsFloat);
  sDesc3E     := FloatToStr(DM1.cdsSQL.FieldByName('DESC3E').AsFloat);
  sDesc2P     := FloatToStr(DM1.cdsSQL.FieldByName('DESC2P').AsFloat);
  sDesc3P     := FloatToStr(DM1.cdsSQL.FieldByName('DESC3P').AsFloat);
  sDesc4P     := FloatToStr(DM1.cdsSQL.FieldByName('DESC4P').AsFloat);
  sDesc5P     := FloatToStr(DM1.cdsSQL.FieldByName('DESC5P').AsFloat);
  sMargCosto  := FloatToStr(DM1.cdsSQL.FieldByName('MARGCOSTO').AsFloat);
  sPComCIGVLoc:= FloatToStr(DM1.cdsSQL.FieldByName('PCOMCIGVLOC').AsFloat);
  sPComCIGVEXT:= FloatToStr(DM1.cdsSQL.FieldByName('PCOMCIGVEXT').AsFloat);
  sPComCIGVOri:= FloatToStr(DM1.cdsSQL.FieldByName('PCOMCIGVORI').AsFloat);
  sPComSIGVEXT:= FloatToStr(DM1.cdsSQL.FieldByName('PCOMSIGVEXT').AsFloat);
  sPComSIGVLOC:= FloatToStr(DM1.cdsSQL.FieldByName('PCOMSIGVLOC').AsFloat);
  sPComSIGVOri:= FloatToStr(DM1.cdsSQL.FieldByName('PCOMSIGVORI').AsFloat);
  sPCosNeto   := FloatToStr(DM1.cdsSQL.FieldByName('PCOSNETO').AsFloat);
  sPCosUnVent := FloatToStr(DM1.cdsSQL.FieldByName('PCOSUNVENT').AsFloat);
  sPVenta     := FloatToStr(DM1.cdsSQL.FieldByName('PVENTA').AsFloat);
  sRelacion   := FloatToStr(DM1.cdsSQL.FieldByName('RELACION').AsFloat);
  sTMonid     := DM1.cdsSQL.FieldByName('TMONID').AsString;

  sSQL:=' INSERT INTO LOG327 '+
        ' (CIAID,GRARID,FAMID,SFAMID,ARTID,UNMID,ARTDES,ARTCNT,CCNOREG,FREG,HREG, '+
        ' PROV,DESC1E,DESC1P,DESC2E,DESC3E,DESC2P,DESC3P, '+
        ' DESC4P,DESC5P,MARGCOSTO,PCOMCIGVLOC,PCOMCIGVORI, '+
        ' PCOMSIGVEXT,PCOMSIGVLOC,PCOMSIGVORI,PCOSNETO, '+
        ' PCOSUNVENT,PVENTA,RELACION,PCOMCIGVEXT,TMONID,TCAMBIO) '+
        ' VALUES ('+QuotedStr(sCIA)+','+QuotedStr(sLinea)+','+QuotedStr(sFamilia)+','+QuotedStr(sSFamilia)+','+
                  QuotedStr(sArticulo)+','+QuotedStr(sUnMid)+','+QuotedStr(sArtDes)+','+'0'+','+'''99999999'','+
                  DM1.wRepFecServi+','+DM1.wRepHorServi+','+
          QuotedStr(sProveedor)+','+
          sDesc1E+','+
          sDesc1P+','+
          sDesc2E+','+
          sDesc3E+','+
          sDesc2P+','+
          sDesc3P+','+
          sDesc4P+','+
          sDesc5P+','+
          sMargCosto+','+
          sPComCIGVLoc+','+
          sPComCIGVOri+','+
          sPComSIGVEXT+','+
          sPComSIGVLOC+','+
          sPComSIGVOri+','+
          sPCosNeto+','+
          sPCosUnVent+','+
          sPVenta+','+
          sRelacion+','+
          sPComCIGVEXT+','+
          QuotedStr(sTMonid)+','+
          sTCambio+')';
  try
    DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
  end;

end;

end.

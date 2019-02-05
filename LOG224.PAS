unit LOG224;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons,DB, Mask, wwdbedit, wwdblook;

type
  TFNegDesdeReq = class(TForm)
    dbgRqsArtX: TwwDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    Label1: TLabel;
    dbeCIA: TwwDBEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure NotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcCiaEnter(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure InsertaAnterior;
    procedure InsertaRegistroControl;
    procedure ActualizaDetalleRequisicion;
  public
    { Public declarations }
  end;

var
  FNegDesdeReq: TFNegDesdeReq;
  sCIA,sLinea,sFamilia,sSFamilia,sArticulo,sArtDes,sLocalidad,sRequisicion : string;
  sUnMid,sTCambio:string;
implementation

uses LOGDM1, oaAD2000;

{$R *.DFM}

procedure TFNegDesdeReq.BitBtn1Click(Sender: TObject);
var //bmk: TBookMark;
	ix : integer;
  sSQL:string;
begin
	if DM1.cdsRqsArtXTot.RecordCount = 0 then
  begin
  	ErrorMsg('Adquisiciones', ' No Existe Informacion a Transferir ');
  end;
  if dbgRqsArtX.SelectedList.Count<= 0 then
  	exit;
  sTCambio:=DM1.CalcTipoCambio(DM1.wTMonExt, Date, DM1.wTipoCambio);
  if sTCambio='' then
  	sTCambio:='0';
	Screen.Cursor:=crHourGlass;
	DM1.cdsArti.DisableControls;
	for iX := 0 to dbgRqsArtX.SelectedList.Count-1 do
	begin
		DM1.cdsRqsArtXTot.GotoBookmark(dbgRqsArtX.SelectedList.Items[iX]);
		sCIA         := DM1.cdsRqsArtXTot.FieldByName('CIAID').AsString;
		sLinea       := DM1.cdsRqsArtXTot.FieldByName('GRARID').AsString;
		sFamilia     := DM1.cdsRqsArtXTot.FieldByName('FAMID').AsString;
		sSFamilia    := DM1.cdsRqsArtXTot.FieldByName('SFAMID').AsString;
		sArticulo    := DM1.cdsRqsArtXTot.FieldByName('ARTID').AsString;
		sUnMid       := DM1.cdsRqsArtXTot.FieldByName('UNMIDG').AsString;
		sArtDes      := DM1.cdsRqsArtXTot.FieldByName('ARTDES').AsString;
		sLocalidad   := DM1.cdsRqsArtXTot.FieldByName('LOCID').AsString;
		sRequisicion := DM1.cdsRqsArtXTot.FieldByName('RQSID').AsString;

		sSQL:= ' SELECT * FROM LOG327 '+
					 ' WHERE CIAID='+QuotedStr(sCIA)+' AND GRARID='+QuotedStr(sLinea)+
					 ' AND FAMID='+QuotedStr(sFamilia)+' AND SFAMID='+QuotedStr(sSFamilia)+
					 ' AND ARTID='+QuotedStr(sArticulo)+
					 ' ORDER BY CCNOREG DESC ';

		DM1.cdsSQL.Close;
		DM1.cdsSQL.DataRequest(sSQL);
		DM1.cdsSQL.Open;
		DM1.cdsSQL.First;
		if DM1.cdsSQL.RecordCount<=0 then  //NO EXISTE EN EL ESCRITORIO
		begin
			sSQL:=' INSERT INTO LOG327 '+
						' (CIAID,GRARID,FAMID,SFAMID,ARTID,UNMID,ARTDES,ARTCNT,CCNOREG,FREG,HREG,TCAMBIO,FLAGORI) '+
						' VALUES('+QuotedStr(sCIA)+','+QuotedStr(sLinea)+','+QuotedStr(sFamilia)+','+QuotedStr(sSFamilia)+','+
												QuotedStr(sArticulo)+','+QuotedStr(sUnMid)+','+QuotedStr(sArtDes)+','+DM1.cdsRqsArtXTot.FieldByName('DRQSCNSG').AsString+','+'''99999999'','+DM1.wRepFecServi+','+DM1.wRepHorServi+','+
												sTCambio+','+QuotedStr('RE')+')';
			try
				DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
			except
			end;
			ActualizaDetalleRequisicion;
			InsertaRegistroControl;
		end
		else
		begin
		if DM1.cdsSQL.RecordCount>1 then  // SIGNIFICA QUE HAY MINIMO DOS
		begin
			if DM1.cdsSQL.FieldByName('CCNOREG').AsString='99999999' then
			begin
				//ACTUALIZAR
				sSQL:='UPDATE LOG327 '+
							'SET (ARTCNT,FREG,HREG) ='+
							' (ARTCNT+'+DM1.cdsRqsArtXTot.FieldByName('DRQSCNSG').AsString+','+DM1.wRepFecServi+','+DM1.wRepHorServi+')'+
							' WHERE CIAID='+QuotedStr(sCIA)+' AND GRARID='+QuotedStr(sLinea)+
							' AND FAMID='+QuotedStr(sFamilia)+' AND SFAMID='+QuotedStr(sSFamilia)+
							' AND ARTID='+QuotedStr(sArticulo)+' AND CCNOREG=''99999999''';
				try
					DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
				except
				end;
				ActualizaDetalleRequisicion;
				InsertaRegistroControl;
			end
			else
			begin
				//COJER DATOS
				//INSERTAR
				DM1.cdsSQL.Prior;
				InsertaAnterior;
				ActualizaDetalleRequisicion;
				InsertaRegistroControl;
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
									'(ARTCNT+'+DM1.cdsRqsArtXTot.FieldByName('DRQSCNSG').AsString+','+DM1.wRepFecServi+','+DM1.wRepHorServi+')'+
									' WHERE CIAID='+QuotedStr(sCIA)+' AND GRARID='+QuotedStr(sLinea)+
									' AND FAMID='+QuotedStr(sFamilia)+' AND SFAMID='+QuotedStr(sSFamilia)+
									' AND ARTID='+QuotedStr(sArticulo)+' AND CCNOREG=''99999999''';
						try
							DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
						except
						end;
						ActualizaDetalleRequisicion;
						InsertaRegistroControl;
					end
					else
					begin
						//COJER DATOS
						//INSERTAR
						DM1.cdsSQL.Prior;
						InsertaAnterior;
						ActualizaDetalleRequisicion;
						InsertaRegistroControl;
					end;
				end;
			end;
		end;
	end;
	DM1.cdsArti.EnableControls;
	Mtx.RefreshFilter;
  Screen.Cursor:=crDefault;	
end;

procedure TFNegDesdeReq.InsertaAnterior;
var
	sProveedor,sDesc1E,sDesc1P,sDesc2E,sDesc3E,sDesc2P,sDesc3P,sDesc4P : string;
	sDesc5P,sMargCosto,sPComCIGVLoc,sPComCIGVOri,sPComSIGVEXT,sPComSIGVLOC : string;
	sPComSIGVOri,sPCosNeto,sPCosUnVent,sPVenta,sRelacion,sTMonid,sPComCIGVEXT : string;
	sSQL : string;
begin
	Screen.Cursor:=crHourGlass;
	DM1.cdsSQL.Prior;

	sProveedor  := DM1.cdsSQL.FieldByName('PROV').AsString;
	sDesc1E     := DM1.cdsSQL.FieldByName('DESC1E').AsString;
	sDesc1P     := DM1.cdsSQL.FieldByName('DESC1P').AsString;
	sDesc2E     := DM1.cdsSQL.FieldByName('DESC2E').AsString;
	sDesc3E     := DM1.cdsSQL.FieldByName('DESC3E').AsString;
	sDesc2P     := DM1.cdsSQL.FieldByName('DESC2P').AsString;
	sDesc3P     := DM1.cdsSQL.FieldByName('DESC3P').AsString;
	sDesc4P     := DM1.cdsSQL.FieldByName('DESC4P').AsString;
	sDesc5P     := DM1.cdsSQL.FieldByName('DESC5P').AsString;
	sMargCosto  := DM1.cdsSQL.FieldByName('MARGCOSTO').AsString;
	sPComCIGVLoc:= DM1.cdsSQL.FieldByName('PCOMCIGVLOC').AsString;
	sPComCIGVEXT:= DM1.cdsSQL.FieldByName('PCOMCIGVEXT').AsString;
	sPComCIGVOri:= DM1.cdsSQL.FieldByName('PCOMCIGVORI').AsString;
	sPComSIGVEXT:= DM1.cdsSQL.FieldByName('PCOMSIGVEXT').AsString;
	sPComSIGVLOC:= DM1.cdsSQL.FieldByName('PCOMSIGVLOC').AsString;
	sPComSIGVOri:= DM1.cdsSQL.FieldByName('PCOMSIGVORI').AsString;
	sPCosNeto   := DM1.cdsSQL.FieldByName('PCOSNETO').AsString;
	sPCosUnVent := DM1.cdsSQL.FieldByName('PCOSUNVENT').AsString;
	sPVenta     := DM1.cdsSQL.FieldByName('PVENTA').AsString;
	sRelacion   := DM1.cdsSQL.FieldByName('RELACION').AsString;
	sTMonid     := DM1.cdsSQL.FieldByName('TMONID').AsString;

	sSQL:=' INSERT INTO LOG327 '+
				' (CIAID,GRARID,FAMID,SFAMID,ARTID,UNMID,ARTDES,ARTCNT,CCNOREG,FREG,HREG, '+
				' PROV,DESC1E,DESC1P,DESC2E,DESC3E,DESC2P,DESC3P, '+
				' DESC4P,DESC5P,MARGCOSTO,PCOMCIGVLOC,PCOMCIGVORI, '+
				' PCOMSIGVEXT,PCOMSIGVLOC,PCOMSIGVORI,PCOSNETO, '+
				' PCOSUNVENT,PVENTA,RELACION,PCOMCIGVEXT,TMONID,TCAMBIO) '+
				' VALUES ('+QuotedStr(sCIA)+','+QuotedStr(sLinea)+','+QuotedStr(sFamilia)+','+QuotedStr(sSFamilia)+','+
									QuotedStr(sArticulo)+','+QuotedStr(sUnMid)+','+QuotedStr(sArtDes)+','+DM1.cdsRqsArtXTot.FieldByName('DRQSCNSG').AsString+','+'''99999999'','+
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
  Screen.Cursor:=crDefault;
end;

procedure TFNegDesdeReq.ActualizaDetalleRequisicion;
var sSQL:string;
begin
  sSQL:=' UPDATE LOG309 '+
        ' SET RQSEST = ''ACEPTADO'' '+
        ' WHERE CIAID='+QuotedStr(sCIA)+
        ' AND ARTID='+QuotedStr(sArticulo)+ ' AND LOCID='+QuotedStr(sLocalidad)+
        ' AND RQSID='+QuotedStr(sRequisicion);
  try
    DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
  end;

end;

procedure TFNegDesdeReq.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFNegDesdeReq.InsertaRegistroControl;
var sSQL:string;
begin
  sSQL:=' INSERT INTO LOG328 (CIAID,ARTID,GRARID,FAMID,SFAMID,ARTDES,ARTCNT,CCNOREG,RQSID,FREG,HREG,USUARIO) '+
        ' VALUES ('+QuotedStr(sCIA)+','+QuotedStr(sArticulo)+','+QuotedStr(sLinea)+','+QuotedStr(sFamilia)+','+QuotedStr(sSFamilia)+','+
                    QuotedStr(sArtDes)+','+DM1.cdsRqsArtXTot.FieldByName('DRQSCNSG').AsString+','+'''99999999'','+
                    QuotedStr(DM1.cdsRqsArtXTot.FieldByName('RQSID').AsString)+','+DM1.wRepFecServi+','+DM1.wRepHorServi+','+
                    QuotedStr(DM1.wUsuario)+')';
  try
    DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
  except
  end;
end;

procedure TFNegDesdeReq.NotInList(Sender: TObject; LookupTable: TDataSet;
  NewValue: String; var Accept: Boolean);
begin
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFNegDesdeReq.dblcCiaEnter(Sender: TObject);
begin
  dbeCIA.text:='';
end;

procedure TFNegDesdeReq.dblcCiaExit(Sender: TObject);
var
	sSQL:string;
begin
  if dblcCIA.text='' then
  begin
    dblcCIA.setFocus;
    exit;
  end;
  dbeCIA.text := DM1.DisplayDescrip('prvSQL','TGE101','CIADES','CIAID='+quotedStr(dblcCIA.text),'CIADES');
	Screen.Cursor:=crHourGlass;
	if (SRV_D = 'DB2NT') or
	(SRV_D = 'DB2400') then
	begin
		sSQL := 'SELECT B.CIAID, B.RQSID, B.DRQSID, B.ARTID, C.GRARID, L.GRARDES, C.FAMID, F.FAMDES, C.SFAMID, S.SFAMDES, B.RQSFLAGUM, B.DRQSCNSG, B.DRQSCNAG, '
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
						+'LEFT JOIN TGE131 L ON (L.CIAID=C.CIAID AND L.TINID=C.TINID AND L.GRARID=C.GRARID ) '
						+'LEFT JOIN TGE169 F ON (F.TINID=C.TINID AND F.FAMID=C.FAMID ) '
						+'LEFT JOIN TGE170 S ON (S.TINID=C.TINID AND S.FAMID=C.FAMID AND S.GRARID=C.GRARID ) '
						+'WHERE B.RQSEST = ' +quotedstr('ACEPTADO')
						+' AND B.CIAID='+QuotedStr(dblcCIA.text)
						+' AND B.TIPOADQ='+QuotedStr('C')
						+' AND ( NOT A.RQSVISADOR IS NULL ) ORDER BY RQSID, DRQSID';
	end
	else
	if SRV_D = 'ORACLE' then
	begin
		sSQL := 'SELECT B.CIAID, B.RQSID, B.DRQSID, B.ARTID, C.GRARID, L.GRARDES, C.FAMID, F.FAMDES, C.SFAMID, '
						+'S.SFAMDES, B.RQSFLAGUM, B.DRQSCNSG, B.DRQSCNAG, '
						+'NVL(B.DRQSCNSG,0)-NVL(B.DRQSCNAG,0) AS RXACNTSG, B.TIPOADQ, '
						+'B.UNMIDG, B.DRQSCNSU, B.DRQSCNAU, NVL(B.DRQSCNSU,0)-NVL(B.DRQSCNAU,0) AS RXACNTSU, '
						+'B.UNMIDU, A.RQSFREQ, A.CCOSID, A.PRIOID, '
						+'A.RQSSOLI, A.RQSAUTOR, A.RQSAPRO, B.RQSEST, A.RQSFATE, A.RQSFREG, A.LOCID, '
						+'C.GRARID, D.CCOSDES, G.UNMDES UNMGDES, H.UNMDES UNMUDES, B.DRQSOBS as ARTDES '
						+'FROM LOG309 B, LOG308 A, TGE205 C, TGE203 D, TGE130 G, TGE130 H, TGE131 L, TGE169 F, TGE170 S '
						+'WHERE B.RQSEST = ' +quotedstr('ACEPTADO')
						+' AND B.CIAID='+QuotedStr(dblcCIA.text)
						+' AND B.TIPOADQ='+QuotedStr('C')
						+' AND (NOT A.RQSVISADOR IS NULL) '
						+'AND A.CIAID=B.CIAID(+) AND A.LOCID=B.LOCID(+) AND A.RQSID=B.RQSID(+) '
						+'AND B.CIAID=C.CIAID(+) AND B.ARTID=C.ARTID(+) '
						+'AND A.CCOSID=D.CCOSID(+) '
						+'AND B.UNMIDG=G.UNMID(+) '
						+'AND B.UNMIDU=H.UNMID(+) '
						+'AND L.CIAID(+)=C.CIAID AND L.TINID(+)=C.TINID AND L.GRARID(+)=C.GRARID '
						+'AND F.TINID(+)=C.TINID AND F.FAMID(+)=C.FAMID '
						+'AND S.TINID(+)=C.TINID AND S.FAMID(+)=C.FAMID AND S.GRARID(+)=C.GRARID '
						+'ORDER BY RQSID, DRQSID';
	end;
	DM1.cdsRqsArtXTot.Close;
	DM1.cdsRqsArtXTot.datarequest(sSQL);
	DM1.cdsRqsArtXTot.IndexFieldNames := 'ARTID';
	DM1.cdsRqsArtXTot.Open;
  Screen.Cursor:=crDefault;	
end;

procedure TFNegDesdeReq.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
	begin
		if Self.ActiveControl Is TMemo then Exit;
    //if self.ActiveControl Is TDBMemo then Exit;
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

end.

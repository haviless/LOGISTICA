unit LOG213;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdbdlg, Mask, wwdbedit, StdCtrls, wwdblook, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, DB, DBTables, Buttons, dbclient;

type
  TFRqsAutoLog = class(TForm)
    pnlCab: TPanel;
    lblCIA: TLabel;
    dblcCIA: TwwDBLookupCombo;
    dbeCIA: TwwDBEdit;
    Label1: TLabel;
    dblcdCCos: TwwDBLookupComboDlg;
    dbeCCostos: TwwDBEdit;
    dbeTRqs: TwwDBEdit;
    dblcTRqs: TwwDBLookupCombo;
    Label8: TLabel;
    Bevel1: TBevel;
    Z2bbtnArtPOk: TBitBtn;
    Z2bbtnAcepta: TBitBtn;
    pnlGrids: TPanel;
    dbgArtPend: TwwDBGrid;
    dbgArtNIS: TwwDBGrid;
    Z2bbtnRegresa: TBitBtn;
    Z2bbtnCanc2: TBitBtn;
    lblPrioridad: TLabel;
    dblcPRIO: TwwDBLookupCombo;
    dbePRIO: TwwDBEdit;
    Label9: TLabel;
    dblcLOC: TwwDBLookupCombo;
    dbeLOC: TwwDBEdit;
    dbeALM: TwwDBEdit;
    dblcALM: TwwDBLookupCombo;
    Label10: TLabel;
    procedure dblcCIAChange(Sender: TObject);
    procedure dblcExist(Sender: TObject);
    procedure dblcNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure Z2bbtnArtPOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcdCCosChange(Sender: TObject);
    procedure Z2bbtnRegresaClick(Sender: TObject);
    procedure dbgArtPendCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgArtNISCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgArtNISDblClick(Sender: TObject);
    procedure Z2bbtnCanc2Click(Sender: TObject);
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure dblcPRIOChange(Sender: TObject);
    procedure dblcLOCChange(Sender: TObject);
    procedure dblcALMChange(Sender: TObject);
    procedure dblcTRqsExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sSQL, sCIA, sTRQ, sCCO, sPIO, sALM, sLOC : String;
    procedure dcCIA;
    procedure dcALM;
    procedure dcLOC;
    procedure dcTRQ;
    procedure dcCCO;
    procedure dcPRI;
  end;

var
  FRqsAutoLog: TFRqsAutoLog;
  wAcepto : Boolean;
  wNReq   : String;

implementation

uses LOGDM1, LOG215, oaAD6000;

{$R *.DFM}

procedure TFRqsAutoLog.dblcCIAChange(Sender: TObject);
begin
  dbeCIA.Text := DM1.cdsCIA.FieldByName('CIADES').AsString;
  sCIA        := DM1.cdsCIA.FieldByName('CIAID').AsString;
end;

procedure TFRqsAutoLog.dblcExist(Sender: TObject);
var
	bRq : Boolean;
begin
  if TwwDBCustomLookupCombo(Sender).DataSource <> nil then
    bRq := TwwDBCustomLookupCombo(Sender).DataSource.DataSet.FieldByName(TwwDBCustomLookupCombo(Sender).DataField).Required;

  if (bRq) and (trim(TwwDBCustomLookupCombo(Sender).Text)='') then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFRqsAutoLog.dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFRqsAutoLog.Z2bbtnArtPOkClick(Sender: TObject);
begin
  sCIA := trim(dblcCIA.Text);
  sTRQ := trim(dblcTRqs.Text);
  sCCO := trim(dblcdCCos.Text);
  sPIO := trim(dblcPRIO.Text);
  sLOC := trim(dblcLOC.Text);
  sALM := trim(dblcALM.Text);

  if sCIA='' then begin
  ErrorMsg('Error',' Debe ingresar la Compañía...');
  Exit;
  end;

  if sTRQ='' then begin
  ErrorMsg('Error',' Debe ingresar el Tipo de Requisición... ');
  Exit;
  end;

  if sCCO='' then begin
  ErrorMsg('Error',' Debe ingresar el Centro de Costos... ');
  Exit;
  end;

  if sPIO='' then begin
  DM1.cdsPRIO.First;
  dblcPRIO.Text := DM1.cdsPRIO.FieldByName('PRIOID').AsString;
  dbePRIO.Text  := DM1.cdsPRIO.FieldByName('PRIODES').AsString;
  end;

  if sLOC='' then begin
  ErrorMsg('Error',' Debe ingresar la Localidad... ');
  Exit;
  end;

  if sALM='' then begin
  ErrorMsg('Error',' Debe ingresar el Almacén... ');
  Exit;
  end;

  Z2bbtnArtPOk.Enabled := False;
  pnlCab.Enabled       := False;
  pnlGrids.Enabled     := True;

  sSQL:=' SELECT'
    +'    A.CIAID,  B.ARTID,  B.ARTDES, '
    +'    SUM(B.KDXPEDIDOG) AS AXPED, '
    +'    SUM(B.KDXPEDIDOG-B.KDXCNTG) AS AXPSA, '
    +'    B.UNMIDG,  C.UNMDES AS UNMDESG, '''' as FLAGVAR '
    +' FROM LOG314 A, LOG315 B, TGE130 C '
    +' WHERE A.CIAID=B.CIAID      AND A.NISAID=B.NISAID '
    +'   AND A.TRIID=B.TRIID      AND A.ALMID=B.ALMID '
    +'   AND A.NISATIP=''SALIDA'' AND A.NISATIP=B.NISATIP '
    +'   AND ('+dm1.wReplacCeros+'(B.KDXPEDIDOG,0)-'+dm1.wReplacCeros+'(B.KDXCNTG,0)>0) '
    +'   AND A.NISSIT=''1'' '
    +'   AND C.UNMID=B.UNMIDG '
    +'   AND A.CIAID='''+sCIA+''''
    +'   AND A.LOCID='''+sLOC+''''
    +'   AND A.ALMID='''+sALM+''''
    +'   AND '+dm1.wReplacCeros+'(B.KDXNREQ,'''')='''' '
    +' GROUP BY A.CIAID, B.UNMIDG, C.UNMDES, C.UNMDES, B.ARTID, B.ARTDES '
    +' ORDER BY B.ARTID ';
  DM1.cdsAPNIS.Close;
  DM1.cdsAPNIS.DataRequest(sSQL);
  DM1.cdsAPNIS.Open;
  sSQL :=  'Select LOG315.*, (KDXPEDIDOG-KDXCNTG) AS SALDO '+
           ' from LOG315 where '+
           '        CIAID='''+sCIA+''''+
           '    and LOCID='''+sLOC+''''+
           '    and ALMID='''+sALM+''''+
           '    and NISATIP=''SALIDA'''+
           '    and '+dm1.wReplacCeros+'(KDXNREQ,'''')='''' '+
           '    and ('+dm1.wReplacCeros+'(KDXPEDIDOG,0)-'+dm1.wReplacCeros+'(KDXCNTG,0))>0';
  //             '    and KDXSALDOG>0    ';
  DM1.cdsKDX.Close;
  DM1.cdsKDX.DataRequest(sSQL);
  DM1.cdsKDX.Open;
end;

procedure TFRqsAutoLog.FormCreate(Sender: TObject);
{var
 Agg : TAggregate;}
begin
	pnlGrids.Enabled := False;
	sSQL :=  'SELECT A.CIAID, B.ARTID, B.ARTDES, '+
					 ' SUM(B.KDXPEDIDOG) AS AXPED, '+
					 ' SUM(B.KDXPEDIDOG-B.KDXCNTG) AS AXPSA, '+
					 //'     SUM(B.KDXSALDOG) AS AXPSA, '+
					 ' B.UNMIDG, D.UNMDES AS UNMDESG, B.UNMIDU, C.UNMDES AS UNMDESU, '''' as FLAGVAR '+
           'FROM LOG314 A, LOG315 B, TGE130 C, TGE130 D '+
					 'WHERE A.CIAID=''01'' '+
					 'GROUP BY  A.CIAID, B.UNMIDG, D.UNMDES, B.UNMIDU, C.UNMDES, B.ARTID,  B.ARTDES '+
					 'ORDER BY  B.ARTID';

	DM1.cdsAPNIS.Close;
	DM1.cdsAPNIS.DataRequest(sSQL);
	DM1.cdsAPNIS.Open;
  sSQL :=  'SELECT LOG315.*, (KDXPEDIDOG-KDXCNTG) AS SALDO FROM LOG315 WHERE CIAID=''01''';
  DM1.cdsKDX.Close;
  DM1.cdsKDX.DataRequest(sSQL);
  DM1.cdsKDX.MasterSource    := DM1.dsAPNIS;
  DM1.cdsKDX.MasterFields    := 'CIAID;ARTID';
  DM1.cdsKDX.IndexFieldNames := 'CIAID;ARTID';
  DM1.cdsKDX.Open;
  {   Agg := cdsKDX.Aggregates.Add;
  Agg.AggregateName := 'AggKDXPEDIDO';
  Agg.Expression    := 'SUM(KDXPEDIDO)';}
  sSQL := 'SELECT * FROM LOG308';
  DM1.cdsReqs.Close;
  DM1.cdsReqs.DataRequest(sSQL);
  DM1.cdsReqs.Open;

  sSQL := 'SELECT * FROM LOG309';
  DM1.cdsDReqs.Close;
  DM1.cdsDReqs.DataRequest(sSQL);
  DM1.cdsDReqs.MasterSource    := DM1.dsReqs;
  DM1.cdsDReqs.MasterFields    := 'CIAID;RQSID';
  DM1.cdsDReqs.IndexFieldNames := 'CIAID;RQSID';
  DM1.cdsDReqs.Open;

  DM1.cdsLOC.Close;
  DM1.cdsLOC.MasterSource    := DM1.dsCIA;
  DM1.cdsLOC.MasterFields    := 'CIAID';
  DM1.cdsLOC.IndexFieldNames := 'CIAID';
  DM1.cdsLOC.Open;

  DM1.cdsALM.Close;
  DM1.cdsALM.MasterSource    := DM1.dsLOC;
  DM1.cdsALM.MasterFields    := 'CIAID;LOCID';
  DM1.cdsALM.IndexFieldNames := 'CIAID;LOCID';
  DM1.cdsALM.Open;
  
  dblcdCCos.OnNotInList := dblcNotInList;
  dcCIA;
  dcLOC;
  dcALM;
  dcTRQ;
  dcCCO;
  dcPRI;
end;

procedure TFRqsAutoLog.dblcdCCosChange(Sender: TObject);
begin
  dbeCCostos.Text := DM1.cdsCCost.FieldByName('CCOSDES').AsString;
end;

procedure TFRqsAutoLog.dcCIA;
begin
  DM1.cdsCIA.First;
	sCIA := trim(DM1.cdsCIA.FieldByName('CIAID').AsString);
  dblcCIA.Text := sCIA;
  dblcCIA.Enabled := DM1.cdsCIA.RecordCount > 1;
end;

procedure TFRqsAutoLog.Z2bbtnRegresaClick(Sender: TObject);
begin
  pnlGrids.Enabled := False;
  pnlCab.Enabled   := True;
  Z2bbtnArtPOk.Enabled := True;
  if dblcCIA.Enabled then
  	dblcCIA.SetFocus
	else
	begin
		if dblcLOC.Enabled then
			dblcLOC.SetFocus
		else
		begin
			if dblcALM.Enabled then
			begin
				dblcALM.SetFocus
			end;
		end;
	end;
	DM1.cdsKDX.CancelUpdates;
  DM1.cdsAPNIS.CancelUpdates;
end;

procedure TFRqsAutoLog.dbgArtPendCalcCellColors(Sender: TObject;
	Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
	if DM1.cdsAPNIS.FieldByName('FLAGVAR').AsString = '*' then
	if (not Highlight) then
	begin
		AFont.Style := [fsBold];
		ABrush.Color := clInfoBk;
	end;

	if gdSelected	in State then
	begin
		AFont.Color  := clHighlightText;
		ABrush.Color := clHighlight;
	end;
end;

procedure TFRqsAutoLog.dbgArtNISCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
	if DM1.cdsKDX.FieldByName('FLAGVAR').AsString = '*' then
	if (not Highlight) then
	begin
		AFont.Style := [fsBold];
		ABrush.Color := clInfoBk;
	end;

	if gdSelected	in State then
	begin
		AFont.Color  := clHighlightText;
		ABrush.Color := clHighlight;
 	end;
end;

procedure TFRqsAutoLog.dbgArtNISDblClick(Sender: TObject);
var
  Cnt        : LongInt;
  sART, sFIL : String;
begin
	DM1.cdsKDX.Edit;
	if ( DM1.cdsKDX.FieldByName('FLAGVAR').IsNull) or
		 ( DM1.cdsKDX.FieldByName('FLAGVAR').AsString='') then
		DM1.cdsKDX.FieldByName('FLAGVAR').AsString := '*'
	else
		DM1.cdsKDX.FieldByName('FLAGVAR').AsString := '';
	DM1.cdsKDX.Post;

	sART := DM1.cdsAPNIS.FieldByName('ARTID').AsString;
	sFIL := 'CIAID='''+sCIA+''' AND ARTID='''+sART+''' AND FLAGVAR=''*''';
	Cnt  := DM1.CountFor(DM1.cdsKDX,sFIL);

	DM1.cdsAPNIS.Edit;

	if (Cnt>0) then
	begin
		if (DM1.cdsAPNIS.FieldByName('FLAGVAR').IsNull) or
			 (DM1.cdsAPNIS.FieldByName('FLAGVAR').AsString='') then
			DM1.cdsAPNIS.FieldByName('FLAGVAR').AsString := '*';
	end
	else
		DM1.cdsAPNIS.FieldByName('FLAGVAR').AsString :='';
	DM1.cdsAPNIS.Post;
 	dbgArtPend.RefreshDisplay ;
end;

procedure TFRqsAutoLog.Z2bbtnCanc2Click(Sender: TObject);
begin
	// Cancelar..
	DM1.cdsKDX.CancelUpdates;
	DM1.cdsAPNIS.CancelUpdates;
	Close;
end;

procedure TFRqsAutoLog.Z2bbtnAceptaClick(Sender: TObject);
var
	sMarkAP, sMarkKD, sRQS, sFIL    : String;
	fSaldo, fSum  : Extended;
	Cnt           : Integer;
	sTDA,	sNIS,	sART : String;
begin
	begin
	sFIL:= 'CIAID='''+sCIA+''' AND FLAGVAR=''*''';
	DM1.cdsKDX.First;
	Cnt := DM1.CountFor( DM1.cdsKDX,sFIL );
	if Cnt=0 then begin
		ErrorMsg('Error',' No se han seleccionado artículos para generar requisición.  ');
		Exit;
	end;

	sRQS := DM1.StrZero(DM1.MaxReqs(sCIA,sLOC,sALM),8);
	DM1.cdsReqs.Insert;
	DM1.cdsReqs.FieldByName('CIAID').AsString     := sCIA;
	DM1.cdsReqs.FieldByName('RQSID').AsString     := sRQS;
	DM1.cdsReqs.FieldByName('LOCID').AsString     := sLOC;
	DM1.cdsReqs.FieldByName('ALMID').AsString     := sALM;
	DM1.cdsReqs.FieldByName('CCOSID').AsString    := sCCO;
	DM1.cdsReqs.FieldByName('RQSFREG').AsDateTime := Date;
	DM1.cdsReqs.FieldByName('TRQSID').AsString := sTRQ;
	DM1.cdsReqs.FieldByName('RQSEST').AsString := 'INICIAL';
	DM1.cdsReqs.FieldByName('PRIOID').AsString :=sPIO;
	DM1.cdsReqs.fieldbyname('RQSFREQ').AsDateTime:=date;
	DM1.cdsReqs.fieldbyname('PRIOID').AsString:='M';
	if SRV_D = 'ORACLE' then
    DM1.cdsReqs.fieldbyname('PRIOID').AsString:='N';
	DM1.cdsReqs.fieldbyname('RQSFATE').AsDateTime:=date;
	DM1.cdsReqs.Post;

	DM1.cdsAPNIS.First;
	while not DM1.cdsAPNIS.Eof do
	begin
		sMarkAP := DM1.cdsAPNIS.FieldByName('FLAGVAR').AsString;
		if sMarkAP = '*' then
		begin
			fSum := 0;
			DM1.cdsKDX.First;
			while not DM1.cdsKDX.Eof do
			begin
				// Aqui se genera las requisiciones
				sMarkKD := DM1.cdsKDX.FieldByName('FLAGVAR').AsString;
				if sMarkKD = '*' then
				begin
					fSaldo:= DM1.cdsKDX.FieldByName('KDXPEDIDOG').AsFloat-DM1.cdsKDX.FieldByName('KDXCNTG').AsFloat;
					fSum  := fSum + fSaldo;
				end;
				DM1.cdsKDX.Next;
			end;

			if fSum>0 then
			begin
				DM1.cdsDReqs.Insert;
				DM1.cdsDReqs.FieldByName('CIAID').AsString  := sCIA;
				DM1.cdsDReqs.FieldByName('RQSID').AsString  := sRQS;
				DM1.cdsDReqs.FieldByName('PRIOID').AsString := sPIO;
				DM1.cdsDReqs.FieldByName('LOCID').AsString  := sLOC;
				DM1.cdsDReqs.FieldByName('ALMID').AsString  := sALM;
				DM1.cdsDReqs.FieldByName('DRQSID').AsString := DM1.StrZero( DM1.MaxValue( 'DRQSID', DM1.cdsDReqs ),3);
				DM1.cdsDReqs.FieldByName('ARTID').AsString  := DM1.cdsAPNIS.FieldByName('ARTID').AsString;
				DM1.cdsDReqs.FieldByName('UNMIDG').AsString := DM1.cdsAPNIS.FieldByName('UNMIDG').AsString;
				DM1.cdsDReqs.FieldByName('DRQSCNSG').AsFloat:= fSum;
				DM1.cdsDReqs.FieldByName('DRQSCNAG').AsFloat:= 0;
				DM1.cdsDReqs.Post;
			end;
		end;
		DM1.cdsAPNIS.Next;
	end;

	if DM1.cdsDReqs.RecordCount = 0 then
	begin
		ErrorMsg('Error','No se han seleccionado artículos para generar requisición.');
		Exit;
	end;

	wAcepto := False;
	wNReq   := '';
	DM1.cdsReqs.Edit;
	// Se cambio la Forma de LOG201 a LOG215
	Application.CreateForm(TFRqsAutoGen, FRqsAutoGen);
	Try
		FRqsAutoGen.ShowModal;
		Finally
			FRqsAutoGen.Free;
		End;
	end;

	if not wAcepto then
		Exit;

	DM1.cdsAPNIS.First;
	while not DM1.cdsAPNIS.Eof do
	begin
		DM1.cdsKDX.First;
		while not DM1.cdsKDX.Eof do
		begin
			sMarkKD := DM1.cdsKDX.FieldByName('FLAGVAR').AsString;
			if sMarkKD = '*' then
			begin
				sTDA := DM1.cdsKDX.FieldByName('TDAID').AsString;
				sNIS := DM1.cdsKDX.FieldByName('NISAID').AsString;
				sART := DM1.cdsKDX.FieldByName('ARTID').AsString;
				sSQL := 'UPDATE LOG315 SET KDXNREQ='''+wNReq+''' '
							+ 'WHERE CIAID=''' + dblcCIA.Text+''' and '
							+       'LOCID=''' + dblcLOC.Text+''' and '
							+       'ALMID=''' + dblcALM.Text+''' and '
							+       'TDAID=''' + sTDA        +''' and '
							+       'NISAID='''+ sNIS        +''' and '
							+       'ARTID=''' + sART        +'''';

				DM1.ExecSQL( sSQL );
			end;
			DM1.cdsKDX.Next;
		end;
		DM1.cdsAPNIS.Next;
	end;
	DM1.cdsKDX.Close;
  DM1.cdsKDX.Open;
  DM1.cdsAPNIS.Close;
  DM1.cdsAPNIS.Open;
end;

procedure TFRqsAutoLog.dblcPRIOChange(Sender: TObject);
begin
  dbePRIO.Text := DM1.cdsPRIO.FieldByName('PRIODES').AsString;
end;

procedure TFRqsAutoLog.dblcLOCChange(Sender: TObject);
begin
  dbeLOC.Text :=  DM1.cdsLOC.FieldByName('LOCDES').AsString;
  sLOC := dblcLOC.Text;
end;

procedure TFRqsAutoLog.dblcALMChange(Sender: TObject);
begin
  dbeALM.Text :=  DM1.cdsALM.FieldByName('ALMDES').AsString;
  sALM := dblcALM.Text;
end;

procedure TFRqsAutoLog.dcALM;
begin
  DM1.cdsALM.First;
  sALM := trim(DM1.cdsALM.FieldByName('ALMID').AsString);
  dblcALM.Text := sALM;
  dblcALM.Enabled := DM1.cdsALM.RecordCount > 1;
end;

procedure TFRqsAutoLog.dcLOC;
begin
  DM1.cdsLOC.First;
  sLOC := trim(DM1.cdsLOC.FieldByName('LOCID').AsString);
  dblcLOC.Text := sLOC;
  dblcLOC.Enabled := DM1.cdsLOC.RecordCount > 1;
end;

procedure TFRqsAutoLog.dcCCO;
begin
  DM1.cdsCCost.First;
  sLOC := trim(DM1.cdsCCost.FieldByName('CCOSID').AsString);
  dblcdCCos.Text := sLOC;
  dblcdCCos.Enabled := DM1.cdsCCost.RecordCount > 1;
end;

procedure TFRqsAutoLog.dcPRI;
begin
  DM1.cdsPRIO.First;
  sPIO := trim(DM1.cdsPRIO.FieldByName('PRIOID').AsString);
  dblcPRIO.Text := sPIO;
  dblcPRIO.Enabled := DM1.cdsPRIO.RecordCount > 1;
end;

procedure TFRqsAutoLog.dcTRQ;
begin
  DM1.cdsLOC.First;
	sTRQ := trim(DM1.cdsTRqs.FieldByName('TRQSID').AsString);
	dblcTRqs.Text := sTRQ;
	dblcTRqs.Enabled := DM1.cdsTRqs.RecordCount > 1;
end;

procedure TFRqsAutoLog.dblcTRqsExit(Sender: TObject);
var
	sSQL : String;
	bRq : Boolean;
begin
	sSQL := 'TIPOADQ=' + QuotedStr(dblcTRqs.Text);
	dbeTRqs.Text := dm1.DisplayDescrip('prvSQL','TGE142','TIPADQDES',sSQL,'TIPADQDES');
	//dbeTRqs.Text := DM1.cdsTRqs.FieldByName('TRQSDES').AsString;
end;

procedure TFRqsAutoLog.FormActivate(Sender: TObject);
var
 xsql : string;
begin
  //** 05/04/2001 - pjsv
  xsql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
  DM1.cdsCCost.close;
  DM1.cdsCCost.datarequest(xsql);
  DM1.cdsCCost.Open;
  //**
end;

end.

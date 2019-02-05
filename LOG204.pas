unit LOG204;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls, db, Mask,
  wwdbedit, wwdblook, GridControl, Wwkeycb, Variants, MsgDlgs;

type
  TFRqsArt = class(TForm)
    gbRqsArt: TGroupBox;
    rbPendiente: TRadioButton;
    rbSPendiente: TRadioButton;
    Panel1: TPanel;
    lblTotal: TLabel;
    edSUMG: TEdit;
    plnRA: TPanel;
    dbgArtPend: TwwDBGrid;
    Bevel1: TBevel;
    Z2btnSelAll: TButton;
    Label1: TLabel;
    Panel2: TPanel;
    pnlHead: TPanel;
    Bevel2: TBevel;
    Label9: TLabel;
    dblcLOC: TwwDBLookupCombo;
    dbeLOC: TwwDBEdit;
    Label10: TLabel;
    dblcALM: TwwDBLookupCombo;
    dbeALM: TwwDBEdit;
    dbeCIA: TwwDBEdit;
    dblcCIA: TwwDBLookupCombo;
    lblCIA: TLabel;
    Z2bbtnAcepta: TBitBtn;
    cbAll: TCheckBox;
    Panel3: TPanel;
    Z2bbtnRegOk: TBitBtn;
    Z2bbtnRegCanc: TBitBtn;
    dbgRA: TwwDBGrid;
    pnlOrden: TPanel;
    lblBusca: TLabel;
    Bevel3: TBevel;
    isBusca: TwwIncrementalSearch;
    btnSalir: TBitBtn;
    Z2btnTotal: TBitBtn;
    procedure rbPendienteClick(Sender: TObject);
    procedure rbSPendienteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Z2btnTotalClick(Sender: TObject);
    procedure Z2bbtnRegOkClick(Sender: TObject);
    procedure Z2btnSelAllClick(Sender: TObject);
    procedure Z2bbtnRegCancClick(Sender: TObject);
    procedure dblcCIAChange(Sender: TObject);
    procedure dblcExist(Sender: TObject);
    procedure dblcLOCChange(Sender: TObject);
    procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure dblcALMChange(Sender: TObject);
    procedure cbAllClick(Sender: TObject);
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure dbgRAMultiSelectRecord(Grid: TwwDBGrid; Selecting: Boolean; var Accept: Boolean);
    procedure dbgArtPendRowChanged(Sender: TObject);
    procedure dbgRATitleButtonClick(Sender: TObject; AFieldName: String);
    procedure dbgRACalcTitleAttributes(Sender: TObject; AFieldName: String; AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
    procedure dbgArtPendEnter(Sender: TObject);
    procedure dbgRAEnter(Sender: TObject);
    procedure dbgArtPendTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure btnSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sSQL, sCIA, sALM : String;
    procedure initSQL;
  public
    { Public declarations }
    dbg 				: TwwDBGrid;
    function Execute ( const sA, sC  : String ) : Boolean ;
    procedure dcALM;
    procedure dcLOC;
    procedure dcCIA;
  end;

var
	FRqsArt: TFRqsArt;


implementation

uses LOGDM1, Log203, oaAD3000, LOG230;

{$R *.DFM}

procedure TFRqsArt.rbPendienteClick(Sender: TObject);
begin
	dbgRA.UnselectAll;
	dbgRA.SelectedList.Clear;
	initSQL;
	sSQL := sSQL+' ORDER BY A.CIAID, A.RQSID, B.ARTID';   // Este Usa
	DMLOG.cdsRqsArt.Close;
	DMLOG.cdsRqsArt.DataRequest(sSQL);
  DMLOG.cdsRqsArt.MasterSource   := DMLOG.dsArtPend;
  DMLOG.cdsRqsArt.MasterFields   := 'CIAID;ARTID;UNMIDG';
  DMLOG.cdsRqsArt.IndexFieldNames:= 'CIAID;ARTID;UNMIDG';
  DMLOG.cdsRqsArt.Open;
end;

procedure TFRqsArt.rbSPendienteClick(Sender: TObject);
begin
  // Ojo no Funciona
  dbgRA.UnselectAll;
  dbgRA.SelectedList.Clear;
  initSQL;
  sSQL := sSQL+' ORDER BY A.CIAID, A.RQSID, B.ARTID';
  DMLOG.cdsRqsArt.Close;
	DMLOG.cdsRqsArt.DataRequest(sSQL);
	DMLOG.cdsRqsArt.MasterSource   := DMLOG.dsArtPend;
	DMLOG.cdsRqsArt.MasterFields   := 'CIAID;ARTID;UNMIDG';
	DMLOG.cdsRqsArt.IndexFieldNames:= 'CIAID;ARTID;UNMIDG';
	DMLOG.cdsRqsArt.Open;
end;

procedure TFRqsArt.initSQL;
begin
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    sSQL :='SELECT A.CIAID,  B.ARTID, B.UNMIDG, A.RQSID, A.TIPOADQ,  A.RQSFREQ, A.CCOSID, C.ARTCONT, '+
           'B.DRQSCNSG, B.DRQSCNSU, B.DRQSCNAG, B.DRQSCNAU, '+
           'B.DRQSCNSG - B.DRQSCNAG RXASALDOG, '+
           'B.DRQSCNSU - B.DRQSCNAU RXASALDOU, '+
           '(B.DRQSCNSG - B.DRQSCNAG) + ((B.DRQSCNSU - B.DRQSCNAU)/C.ARTCONT) LKCNTSOL, '+
           'A.PRIOID, A.RQSSOLI,  A.RQSAUTOR, A.RQSAPRO, A.RQSEST, A.RQSFATE,  A.RQSFREG, A.LOCID,  A.ALMID, '+
           'F.CIADES,  B.DRQSID, B.UNMIDU,  C.ARTDES, C.GRARID,  D.CCOSDES, E.UNMDES '+
           'FROM LOG308 A '+
           'LEFT JOIN LOG309 B ON (A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.RQSID=B.RQSID) '+
           'LEFT JOIN TGE205 C ON (B.CIAID=C.CIAID AND B.TINID=C.TINID AND B.ARTID=C.ARTID) '+
           'LEFT JOIN TGE203 D ON (A.CCOSID=D.CCOSID) '+
           'LEFT JOIN TGE130 E ON (B.UNMIDG=E.UNMID) '+
           'LEFT JOIN TGE101 F ON (A.CIAID=F.CIAID) '+
           'WHERE A.CIAID='''+sCIA+''' '+
           'AND A.TIPOADQ= ''C'' '+
           'AND ((A.RQSEST=''ACEPTADO'') OR (A.RQSEST=''PARCIAL'')) '+
           'AND ((B.RQSEST=''ACEPTADO'') OR (B.RQSEST=''PARCIAL'')) '+
           'AND (B.DRQSCNSG - B.DRQSCNAG > 0 OR B.DRQSCNSU - B.DRQSCNAU > 0) '+           
           'AND NOT RQSVISADOR IS NULL';
  end
  else
  if SRV_D = 'ORACLE' then
  begin
		sSQL:= 'SELECT A.CIAID,  B.ARTID, B.UNMIDG, A.RQSID, A.TIPOADQ,  A.RQSFREQ, A.CCOSID, C.ARTCONT, '+
           'B.DRQSCNSG, B.DRQSCNSU, B.DRQSCNAG, B.DRQSCNAU, '+
           'B.DRQSCNSG - B.DRQSCNAG RXASALDOG, '+
           'B.DRQSCNSU - B.DRQSCNAU RXASALDOU, '+
           '(B.DRQSCNSG - B.DRQSCNAG) + ((B.DRQSCNSU - B.DRQSCNAU)/C.ARTCONT) LKCNTSOL, '+
           'A.PRIOID, A.RQSSOLI,  A.RQSAUTOR, A.RQSAPRO, A.RQSEST, A.RQSFATE,  A.RQSFREG, A.LOCID,  A.ALMID, '+
           'F.CIADES,  B.DRQSID, B.UNMIDU,  C.ARTDES, C.GRARID,  D.CCOSDES, E.UNMDES '+
           'FROM LOG308 A, LOG309 B, TGE205 C, TGE203 D, TGE130 E, TGE101 F '+
           'WHERE A.CIAID='''+sCIA+''' '+
           'AND A.TIPOADQ= ''C'' '+
           'AND (( A.RQSEST=''ACEPTADO'') OR (A.RQSEST=''PARCIAL'')) '+
           'AND (( B.RQSEST=''ACEPTADO'') OR (B.RQSEST=''PARCIAL'')) '+
           'AND NOT RQSVISADOR IS NULL '+
           'AND A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.RQSID=B.RQSID '+
           'AND B.CIAID=C.CIAID AND B.TINID=C.TINID AND B.ARTID=C.ARTID '+
           'AND A.CCOSID=D.CCOSID '+
           'AND B.UNMIDG=E.UNMID '+
           'AND (B.DRQSCNSG - B.DRQSCNAG > 0 OR B.DRQSCNSU - B.DRQSCNAU > 0) '+           
           'AND A.CIAID=F.CIAID';
	end;
end;

function TFRqsArt.Execute(const sA, sC: String): Boolean;
begin
	sCIA := sC;
	//dblcCIA.Text := sCIA;
	{if(trim(sC)<>'') then
		sSQL := sSQL + ' AND A.CIAID='''+sC+'''';}
	//if (trim(sA)<>'') then
    //sSQL := sSQL + ' AND B.ARTID='''+sA+'''';
	//if rbPendiente.Checked then
		//rbPendienteClick(nil)
	//else
		//rbSPendienteClick(nil);
  result := ShowModal=mrOK;
end;

procedure TFRqsArt.FormActivate(Sender: TObject);
begin
	dbgRA.SelectedList.Clear;
	if rbPendiente.Checked then
		rbPendienteClick(nil)
	else
		rbSPendienteClick(nil);
	edSUMG.Text := '';
	pnlOrden.Visible:=False;
	dbgArtPend.SetFocus;
	//cbAllClick(Nil);
end;

procedure TFRqsArt.Z2btnTotalClick(Sender: TObject);
var
  iX   : Integer;
  fSumG : Double;
begin
	dbgRA.SelectedList.Clear;
 	dbgRA.UnselectAll;
 	dbgRA.SelectAll;
	fSumG := 0;
	//DisableControls;
	for iX:= 0 to dbgRA.SelectedList.Count-1 do
	begin
		dbgRA.datasource.dataset.GotoBookmark(dbgRA.SelectedList.items[iX]);
		fSumG := dbgRA.datasource.dataset.FieldByName('LKCNTSOL').AsFloat + fSumG;
		//fSumG := dbgRA.datasource.dataset.FieldByName('RXASALDOG').AsFloat + fSumG;
		//fSumG := dbgRA.datasource.dataset.FieldByName('DRQSCNSG').AsFloat + dbgRA.datasource.dataset.FieldByName('DRQSCNSU').AsFloat + fSumG;
	end;
	//EnableControls;
  edSUMG.Clear;
  edSUMG.Text := Format('%-8.4f',[fSumG]);
end;


procedure TFRqsArt.Z2bbtnRegOkClick(Sender: TObject);
var
	I,ix : integer;
  bExiste : Boolean;	
begin
	bExiste := False;
	//Z2btnTotalClick(nil);
	if DMLOG.cdsRqsArt.RecordCount=0 then
	begin
		ErrorMsg('Error','No hay requisiciones ...');
		Exit;
	end;
	if dbgRA.SelectedList.Count=0 then
	begin
		ErrorMsg('Error','No ha seleccionado ningún registro....');
		Exit;
	end;

  if FADMovimientos.xProfAut = 'SOLICITUD' then
  begin
    bExiste := DMLOG.cdsDSolCot.Locate ('CIAID;ARTID',VarArrayOf([DMLOG.cdsArtPend.FieldByName('CIAID').AsString,
                                                                DMLOG.cdsArtPend.FieldByName('ARTID').AsString]),[]);
    if bExiste then
    begin
       ErrorMsg( 'Error', 'No Pueden Existir Artículos Duplicados'+#13+#13+
                          'en el Detalle de Solicitud de Cotización....... ');
       Exit;
    end;

    dbgRA.datasource.dataset.DisableControls;
    for iX:= 0 to dbgRA.SelectedList.Count-1 do
    begin
      I := 0;
      dbgRA.datasource.dataset.GotoBookmark(dbgRA.SelectedList.items[iX]);
    end;

    dbgRA.datasource.dataset.EnableControls;
    if DMLOG.cdsArtPend.FieldByName('RQSFLAGUM').AsString = 'G' then
      log203.vflag := DMLOG.cdsArtPend.FieldByName('RQSFLAGUM').AsString
    else
      log203.vflag := 'U';

    FRegSolCot.dbcldArti.Text:=DMLOG.cdsArtPend.FieldByName('ARTID').AsString;

    sSQL:='ARTID = '''+DMLOG.cdsArtPend.FieldByName('ARTID').AsString+''' AND CIAID='''+DMLOG.cdsArtPend.FieldByName('CIAID').AsString+'''';
    FRegSolCot.dbeArti.Text:=Trim(DMLOG.displayDescrip('prvSQL','TGE205','ARTDES',sSQL,'ARTDES'));

    FRegSolCot.dbeCntS.Text:=trim(edSUMG.Text);
    if log203.vFlag = 'G' then
      FRegSolCot.dblcUNMID.text := DMLOG.cdsArtPend.FieldByName('UNMIDG').AsString
    else
    begin
      sSQL := 'ARTID=' + quotedStr(DMLOG.cdsArtPend.FieldByName('ARTID').AsString)+' AND CIAID=' + quotedStr(dblcCIA.Text);
      FRegSolCot.dblcUNMID.text := DMLOG.displaydescrip('prvSQL','TGE205','UNMIDU',sSQL,'UNMIDU');//DMLOG.cdsArtPend.FieldByName('UNMIDU').AsString;
    end;
    //FRegSolCot.vunmid := FRegSolCot.dblcUNMID.text;

    sSQL:='UNMID = '''+FRegSolCot.dblcUNMID.text+'''';
    FRegSolCot.edtUNMID.Text:=DMLOG.displayDescrip('prvSQL','TGE130','UNMDES',sSQL,'UNMDES');

    FRegSolCot.dbcbFLAG.text := log203.vFlag;
    sSQL:='ARTID = '+ quotedStr(FRegSolCot.dbcldArti.text);
    FRegSolCot.dbeArti.text := Trim(DMLOG.displayDescrip('prvSQL', 'TGE205', 'ARTDES', sSQL, 'ARTDES'));

    //FRegSolCot.DBMemo1.Text:=DMLOG.cdsArtPend.FieldByName('ARTID').AsString+'  '+FRegSolCot.dbeArti.Text;
    ModalResult := mrOK;
  end
  else
  if FADMovimientos.xProfAut = 'PROFORMA' then
  begin
    bExiste := DMLOG.cdsDSolCot.Locate ('CIAID;ARTID',VarArrayOf([DMLOG.cdsArtPend.FieldByName('CIAID').AsString,
                                                                DMLOG.cdsArtPend.FieldByName('ARTID').AsString]),[]);
    if bExiste then
    begin
       ErrorMsg( 'Error', 'No Pueden Existir Artículos Duplicados'+#13+#13+
                          'en el Detalle de Proforma Automatica....... ');
       Exit;
    end;

    dbgRA.datasource.dataset.DisableControls;
    for iX:= 0 to dbgRA.SelectedList.Count-1 do
    begin
      I := 0;
      dbgRA.datasource.dataset.GotoBookmark(dbgRA.SelectedList.items[iX]);
    end;

    dbgRA.datasource.dataset.EnableControls;
    if DMLOG.cdsArtPend.FieldByName('RQSFLAGUM').AsString = 'G' then
      log230.vflag := DMLOG.cdsArtPend.FieldByName('RQSFLAGUM').AsString
    else
      log230.vflag := 'U';

    FRegSolProfAut.dbcldArti.Text:=DMLOG.cdsArtPend.FieldByName('ARTID').AsString;

    sSQL:='ARTID = '''+DMLOG.cdsArtPend.FieldByName('ARTID').AsString+''' AND CIAID='''+DMLOG.cdsArtPend.FieldByName('CIAID').AsString+'''';
    FRegSolProfAut.dbeArti.Text:=Trim(DMLOG.displayDescrip('prvSQL','TGE205','ARTDES',sSQL,'ARTDES'));

    FRegSolProfAut.dbeCntS.Text:=trim(edSUMG.Text);
    if log230.vFlag = 'G' then
      FRegSolProfAut.dblcUNMID.text := DMLOG.cdsArtPend.FieldByName('UNMIDG').AsString
    else
    begin
      sSQL := 'ARTID=' + quotedStr(DMLOG.cdsArtPend.FieldByName('ARTID').AsString)+' AND CIAID=' + quotedStr(dblcCIA.Text);
      FRegSolProfAut.dblcUNMID.text := DMLOG.displaydescrip('prvSQL','TGE205','UNMIDU',sSQL,'UNMIDU');//DMLOG.cdsArtPend.FieldByName('UNMIDU').AsString;
    end;

    sSQL:='UNMID = '''+FRegSolProfAut.dblcUNMID.text+'''';
    FRegSolProfAut.edtUNMID.Text:=DMLOG.displayDescrip('prvSQL','TGE130','UNMDES',sSQL,'UNMDES');

    FRegSolProfAut.dbcbFLAG.text := log230.vFlag;
    sSQL:='ARTID = '+ quotedStr(FRegSolProfAut.dbcldArti.text);
    FRegSolProfAut.dbeArti.text := Trim(DMLOG.displayDescrip('prvSQL', 'TGE205', 'ARTDES', sSQL, 'ARTDES'));

    ModalResult := mrOK;
  end;
end;

procedure TFRqsArt.Z2btnSelAllClick(Sender: TObject);
begin
	dbgRA.SelectedList.Clear;
 	dbgRA.UnselectAll;
 	dbgRA.SelectAll;
 	edSUMG.Text := Format('%-8.4f',[DMLOG.cdsArtPend.FieldByName('RXACNTSG').AsFloat + DMLOG.cdsArtPend.FieldByName('RXACNTSU').AsFloat]);
end;

procedure TFRqsArt.Z2bbtnRegCancClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;


procedure TFRqsArt.dblcCIAChange(Sender: TObject);
begin
	{dbeCIA.Text     := DMLOG.cdsCIA.FieldByName('CIADES').AsString;
	sCIA := dblcCIA.Text;
	DMLOG.cdsLOC.Filtered := False;
	DMLOG.cdsLOC.Filter   := 'CIAID='''+sCIA+'''';
	DMLOG.cdsLOC.Filtered := True;

	sLOC := dblcLOC.Text;
	DMLOG.cdsALM.Filtered := False;
	DMLOG.cdsALM.Filter   := 'CIAID='''+sCIA+''' AND LOCID='''+sLOC+'''';
	DMLOG.cdsALM.Filtered := True;}
end;

procedure TFRqsArt.dblcExist(Sender: TObject);
var
 bRq : Boolean;
begin
  if TwwDBCustomLookupCombo(Sender).DataSource <> nil then
    bRq := TwwDBCustomLookupCombo(Sender).DataSource.DataSet.FieldByName(TwwDBCustomLookupCombo(Sender).DataField).Required;

  if (bRq) and (trim(TwwDBCustomLookupCombo(Sender).Text)='') then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFRqsArt.dblcLOCChange(Sender: TObject);
begin
	{sLOC := dblcLOC.Text;
	dbeLOC.Text     := DMLOG.cdsLOC.FieldByName('LOCDES').AsString;
	DMLOG.cdsALM.Filtered := False;
	DMLOG.cdsALM.Filter   := 'CIAID='''+sCIA+''' AND LOCID='''+sLOC+'''';
	DMLOG.cdsALM.Filtered := True;
	dcALM;}
end;

procedure TFRqsArt.dblcNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFRqsArt.dblcALMChange(Sender: TObject);
begin
 sALM := dblcALM.Text;
 dbeALM.Text := DMLOG.cdsALM.FieldByName('ALMDES').AsString;
end;

procedure TFRqsArt.cbAllClick(Sender: TObject);
var
	ck     : Boolean;
begin
	ck := cbAll.Checked;
	//dblcCIA.Enabled := not ck;
  dblcLOC.Enabled := not ck;
  dblcALM.Enabled := not ck;
	Z2bbtnAcepta.Enabled := not ck;

  if ck then
  begin
    dblcCIA.Text    := sCIA;
		//dbeCIA.Text     := '';
    dblcLOC.Text    := '';
    dbeLOC.Text     := '';
    dblcALM.Text    := '';
    dbeALM.Text     := '';
  end
  else begin
//   dcCIA;
     dcLOC;
     dcALM;
  end;
   Z2bbtnAceptaClick(nil);
end;

procedure TFRqsArt.dcALM;
begin
	{DMLOG.cdsALM.First;
	sALM := trim(DMLOG.cdsALM.FieldByName('ALMID').AsString);
	dblcALM.Text := sALM;
	dblcALM.Enabled := DMLOG.cdsALM.RecordCount > 1;}
end;

procedure TFRqsArt.dcCIA;
begin
	{DMLOG.cdsCIA.First;
	sCIA := trim(DMLOG.cdsCIA.FieldByName('CIAID').AsString);
	dblcCIA.Text := sCIA;
	dblcCIA.Enabled := DMLOG.cdsCIA.RecordCount > 1;}
end;

procedure TFRqsArt.dcLOC;
begin
	{DMLOG.cdsLOC.First;
	sLOC := trim(DMLOG.cdsLOC.FieldByName('LOCID').AsString);
	dblcLOC.Text := sLOC;
	dblcLOC.Enabled := DMLOG.cdsLOC.RecordCount > 1;}
end;


procedure TFRqsArt.Z2bbtnAceptaClick(Sender: TObject);
begin
 {if not cbAll.Checked then
 begin
// if trim(dblcCIA.Text)= '' then MsgErr := 'Debe seleccionar Compañía.'
// else MsgErr := '';
	 if trim(dblcLOC.Text)= '' then MsgErr := 'Debe seleccionar Localidad.'
	 else MsgErr := '';
	 if trim(dblcALM.Text)= '' then MsgErr := 'Debe seleccionar Almacén.'
	 else MsgErr := '';
	 if  trim(MsgErr) <> '' then
	 begin
		 ErrorMsg('Error',MsgErr);
		 Exit;
	 end;
// initSQL;
 end;
 if rbPendiente.Checked then
	 rbPendienteClick(nil)
 else
	 rbSPendienteClick(nil);
 edSUMG.Text := '';  //edSUMU.Text := '';}
end;

procedure TFRqsArt.dbgRAMultiSelectRecord(Grid: TwwDBGrid; Selecting: Boolean; var Accept: Boolean);
var
	fSumG : Double;
begin
	//edSUMG.Text := '';
  fSumG := 0;
  if edSUMG.Text <> '' then
   fSumG := StrToFloat(edSUMG.Text);
//  with Grid, Grid.datasource.dataset do
   begin
    if (Selecting = true) and (Accept = true) then
      fSumG := fSumg + DMLOG.cdsRqsArt.fieldbyname('LKCNTSOL').AsFloat
    else
      if fSumG <> 0 then
       fSumG := fSumg - DMLOG.cdsRqsArt.fieldbyname('LKCNTSOL').AsFloat;
   end;
   edSUMG.Text := Format('%-8.4f',[fSumG]);   
end;

procedure TFRqsArt.dbgArtPendRowChanged(Sender: TObject);
begin
   dbgRA.SelectedList.Clear;
   edSUMG.Text := '';
end;

procedure TFRqsArt.dbgRATitleButtonClick(Sender: TObject;  AFieldName: String);
begin
	//if AFieldName='RQSID' then DMLOG.cdsRqsArt.IndexFieldNames:='RQSID';
	//if AFieldName='RQSFREQ' then DMLOG.cdsRqsArt.IndexFieldNames:='RQSFREQ';
end;

procedure TFRqsArt.dbgRACalcTitleAttributes(Sender: TObject; AFieldName: String; AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
   if AFieldName='RQSID' then AFont.Color:=clred;
	 //if AFieldName='RQSFREQ' then AFont.Color:=clred;
end;

procedure TFRqsArt.dbgArtPendEnter(Sender: TObject);
begin
	pnlOrden.Visible:=False;
end;

procedure TFRqsArt.dbgRAEnter(Sender: TObject);
begin
	pnlOrden.Visible:=False;
end;

procedure TFRqsArt.dbgArtPendTitleButtonClick(Sender: TObject; AFieldName: String);
begin
	lblBusca.Caption:='XX';
	if AfieldName='ARTID' then
	begin
		DMLOG.cdsArtPend.IndexFieldNames:='ARTID';
		lblBusca.Caption:='Busca por Código:';
		isBusca.SearchField:='ARTID';
	end;
	if AfieldName='ARTDES' then
	begin
		DMLOG.cdsArtPend.IndexFieldNames:='ARTDES';
		lblBusca.Caption:='Busca por Descripción:';
		isBusca.SearchField:='ARTDES';
	end;
	if lblBusca.Caption<>'XX' then
	begin
		pnlOrden.Visible := True;
		isBusca.Text:='';
		isBusca.SetFocus;		
	end;
end;

procedure TFRqsArt.btnSalirClick(Sender: TObject);
begin
	pnlOrden.Visible := False;
end;

procedure TFRqsArt.FormShow(Sender: TObject);
begin
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.



unit LOG217;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls, Buttons, GridControl,
  Mask, wwdbedit, wwdblook, Wwkeycb, MsgDlgs;

type
  TFRqsSer = class(TForm)
    plnRA: TPanel;
    Z2bbtnRegOk: TBitBtn;
    Z2bbtnRegCanc: TBitBtn;
    dbgRA: TwwDBGrid;
    Panel3: TPanel;
    pnlOrden: TPanel;
    lblBusca: TLabel;
    Bevel2: TBevel;
    isBusca: TwwIncrementalSearch;
    btnSalir: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Z2bbtnRegCancClick(Sender: TObject);
    procedure Z2bbtnRegOkClick(Sender: TObject);
    procedure Z2btnTotalClick(Sender: TObject);
    procedure Z2btnSelAllClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgArtPendRowChanged(Sender: TObject);
    procedure dbgRACalcTitleAttributes(Sender: TObject; AFieldName: String; AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
    procedure dbgRATitleButtonClick(Sender: TObject; AFieldName: String);
    procedure btnSalirClick(Sender: TObject);
    procedure dbgRAEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vSQL, sSQL, sCIA, sLOC, sALM : String;
    procedure initSQL;
  public
    { Public declarations }
    function Execute ( const sA, sC  : String ) : Boolean ;
  end;

var
  FRqsSer: TFRqsSer;

implementation

uses LOGDM1, LOG203, LOG230, oaAD3000;

{$R *.DFM}

function TFRqsSer.Execute(const sA, sC: String): Boolean;
begin
	sCIA := sC;
  if(trim(sC)<>'') then
  	sSQL := sSQL + ' AND A.CIAID='''+sC+'''';
  if (trim(sA)<>'') then
		sSQL := sSQL + ' AND B.ARTID='''+sA+'''';

	dbgRA.UnselectAll;
	dbgRA.SelectedList.Clear;
	vSQL := '';
	initSQL;
	DMLOG.cdsSerPend.Close;
	sSQL := sSQL+' ORDER BY B.RQSID, B.ARTID, A.CIAID, B.UNMIDG, B.UNMIDU, B.RQSMARK'; //ORDER BY A.CIAID, A.RQSID, B.ARTID
	DMLOG.cdsSerPend.DataRequest(sSQL);
	DMLOG.cdsSerPend.Open;
	result := ShowModal=mrOK;
end;


procedure TFRqsSer.FormCreate(Sender: TObject);
begin
  DMLOG.FiltraTabla( DMLOG.cdsLoc,'TGE126','LOCID','LOCID');
	//DMLOG.cdsLoc.Open;
  vSql := '';
  initSQL;
  {if rbPendiente.Checked then
    rbPendienteClick(nil)
  else
    rbSPendienteClick(nil);
  edSUMG.Text := '';}
  //cbAllClick(Nil);
  sCIA := '';
  sALM := '';
  sLOC := '';
  {DMLOG.cdsSer.Close;
  DMLOG.cdsRqsSer.MasterSource   := DMLOG.dsArtPend;
  DMLOG.cdsRqsSer.MasterFields   := 'CIAID;ARTID';
  DMLOG.cdsRqsSer.IndexFieldNames:= 'CIAID;ARTID';
  DMLOG.cdsRqsSer.Open;}
end;

procedure TFRqsSer.initSQL;
begin
	sSQL:='SELECT B.RQSID, B.DRQSID, A.CIAID, A.TIPOADQ, B.UNMIDG, B.UNMIDU, B.ARTID, B.RQSMARK, B.RQSFLAGUM, B.DRQSID, ' +
  			'B.DRQSOBS, B.DRQSCNSG AS RXACNTSG, B.DRQSCNSU AS RXACNTSU,  B.DRQSCNAG AS RXACNTAG, B.DRQSCNAU AS RXACNTAU, '+
				'('+DMLOG.wReplacCeros+'(B.DRQSCNSG,0)-'+DMLOG.wReplacCeros+'(B.DRQSCNAG,0)) AS RXASALDOG, '+
				'('+DMLOG.wReplacCeros+'(B.DRQSCNSU,0)-'+DMLOG.wReplacCeros+'(B.DRQSCNAU,0)) AS RXASALDOU '+
				'FROM LOG308 A, LOG309 B, TGE203 D '+
				'WHERE A.CIAID=B.CIAID '+
				'AND A.LOCID=B.LOCID '+
				'AND A.RQSID=B.RQSID '+
				'AND A.CCOSID=D.CCOSID';
	if vSQL = '' then
	 sSQL := sSQL + ' AND ((A.RQSEST=''ACEPTADO'') OR (A.RQSEST=''PARCIAL'')) AND'+
									' NOT RQSVISADOR IS NULL'
	else
	 sSQL := sSQL + ' AND (('+DMLOG.wReplacCeros+'(B.DRQSCNSG,0)-'+DMLOG.wReplacCeros+'(B.DRQSCNAG,0)>0) '+
                  ' OR ('+DMLOG.wReplacCeros+'(B.DRQSCNSU,0)-'+DMLOG.wReplacCeros+'(B.DRQSCNAU,0)>0))';
  if sCIA <> '' then
    sSQL:=sSQL+' AND A.CIAID='''+sCIA+'''';
  if sALM <> '' then
    sSQL:=sSQL+' AND A.ALMID='''+sALM+'''';
  if sLOC <> '' then
  	sSQL:=sSQL+' AND A.LOCID='''+sLOC+'''';

  if FADMovimientos.xProfAut = 'SOLICITUD' then
  begin
    if FRegSolCot <> nil then
      sSQL:=sSQL+' AND A.TIPOADQ='''+FRegSolCot.dblcTipSol.Text+'''';
  end
  else
  if FADMovimientos.xProfAut = 'PROFORMA' then
  begin
    if FRegSolProfAut <> nil then
      sSQL:=sSQL+' AND A.TIPOADQ= '''+FRegSolProfAut.dblcTipSol.Text+'''';
  end;

  sSQL:=sSQL+' AND (('+DMLOG.wReplacCeros+'(B.DRQSCNSG,0)-'+DMLOG.wReplacCeros+'(B.DRQSCNAG,0)) > 0 OR ('+DMLOG.wReplacCeros+'(B.DRQSCNSU,0)-'+DMLOG.wReplacCeros+'(B.DRQSCNAU,0)) > 0)'
end;

procedure TFRqsSer.Z2bbtnRegCancClick(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TFRqsSer.Z2bbtnRegOkClick(Sender: TObject);
begin
  if DMLOG.cdsSerPend.RecordCount = 0 then
  begin
  	ErrorMsg('Error','No hay Requisiciones ...');
    Exit;
  end;
  log230.vflag := DMLOG.cdsSerPend.FieldByName('RQSFLAGUM').AsString;

  if FADMovimientos.xProfAut = 'SOLICITUD' then
  begin
    if FRegSolCot.dblcTipSol.Text = 'S' then
    begin
      FRegSolCot.DBMemo1Ser.Text := Trim(DMLOG.cdsSerPend.FieldByName('DRQSOBS').AsString);
      FRegSolCot.dbcbFLAG.value := vflag;
      FRegSolCot.dbeCntSSer.Text := Trim(DMLOG.cdsSerPend.FieldByName('RXASALDOG').AsString);
      if  vflag = 'G'  then
      begin
        ssql := 'UNMID=' + QuotedStr(DMLOG.cdsSerPend.FieldByName('UNMIDG').AsString);
        FRegSolCot.dblcUNMIDSer.Text := DMLOG.cdsSerPend.FieldByName('UNMIDG').AsString;
      end
      else
      begin
        ssql := 'UNMID=' + quotedStr(DMLOG.cdsSerPend.FieldByName('UNMIDU').AsString);
        FRegSolCot.dblcUNMIDSer.Text := DMLOG.cdsSerPend.FieldByName('UNMIDU').AsString
      end;
      //FRegSolCot.vunmid := FRegSolCot.dblcUNMIDSer.Text;
      FRegSolCot.edtUNMIDSer.text :=  DMLOG.displaydescrip('prvUMed','TGE130','*',ssql,'UNMDES');
      //FRegSolCot.dbeCntSSer.Enabled:=false;
      FRegSolCot.edtSer.Text:=DMLOG.cdsSerPend.FieldByName('ARTID').AsString;
    end
    else
    if FRegSolCot.dblcTipSol.Text = 'A' then
    begin
      FRegSolCot.DBMemo1Act.Text := Trim(DMLOG.cdsSerPend.FieldByName('DRQSOBS').AsString);
      FRegSolCot.dbcbFLAG.value := vflag; // DMLOG.cdsDReqs.FieldByName('RQSFLAGUM').AsString;
      FRegSolCot.dbeCntSAct.Text := DMLOG.cdsSerPend.FieldByName('RXACNTSG').AsString;
      if  vflag = 'G'  then
      begin
        ssql := 'UNMID=' + QuotedStr(DMLOG.cdsSerPend.FieldByName('UNMIDG').AsString);
        FRegSolCot.dblcUNMIDAct.Text := DMLOG.cdsSerPend.FieldByName('UNMIDG').AsString;
      end
      else
      begin
        ssql := 'UNMID=' + quotedStr(DMLOG.cdsSerPend.FieldByName('UNMIDU').AsString);
        FRegSolCot.dblcUNMIDAct.Text := DMLOG.cdsSerPend.FieldByName('UNMIDU').AsString;
      end;
      //FRegSolCot.vunmid := FRegSolCot.dblcUNMIDAct.Text;
      FRegSolCot.edtUNMIDAct.Text := DMLOG.displaydescrip('prvUMed','TGE130','*',ssql,'UNMDES');
      FRegSolCot.dbeCntSAct.Enabled:=True;
      FRegSolCot.edtActFij.Text:=DMLOG.cdsSerPend.FieldByName('ARTID').AsString;
    end;
  end
  else
  if FADMovimientos.xProfAut = 'PROFORMA' then
  begin
    if FRegSolProfAut.dblcTipSol.Text = 'S' then
    begin
      FRegSolProfAut.DBMemo1Ser.Text := Trim(DMLOG.cdsSerPend.FieldByName('DRQSOBS').AsString);
      FRegSolProfAut.dbcbFLAG.value := vflag;
      FRegSolProfAut.dbeCntSSer.Text := Trim(DMLOG.cdsSerPend.FieldByName('RXASALDOG').AsString);
      if  vflag = 'G'  then
      begin
        ssql := 'UNMID=' + QuotedStr(DMLOG.cdsSerPend.FieldByName('UNMIDG').AsString);
        FRegSolProfAut.dblcUNMIDSer.Text := DMLOG.cdsSerPend.FieldByName('UNMIDG').AsString;
      end
      else
      begin
        ssql := 'UNMID=' + quotedStr(DMLOG.cdsSerPend.FieldByName('UNMIDU').AsString);
        FRegSolProfAut.dblcUNMIDSer.Text := DMLOG.cdsSerPend.FieldByName('UNMIDU').AsString
      end;
      //FRegSolCot.vunmid := FRegSolCot.dblcUNMIDSer.Text;
      FRegSolProfAut.edtUNMIDSer.text :=  DMLOG.displaydescrip('prvUMed','TGE130','*',ssql,'UNMDES');
      //FRegSolCot.dbeCntSSer.Enabled:=false;
      FRegSolProfAut.edtSer.Text:=DMLOG.cdsSerPend.FieldByName('ARTID').AsString;
    end
    else
    if FRegSolProfAut.dblcTipSol.Text = 'A' then
    begin
      FRegSolProfAut.DBMemo1Act.Text := Trim(DMLOG.cdsSerPend.FieldByName('DRQSOBS').AsString);
      FRegSolProfAut.dbcbFLAG.value := vflag; // DMLOG.cdsDReqs.FieldByName('RQSFLAGUM').AsString;
      FRegSolProfAut.dbeCntSAct.Text := DMLOG.cdsSerPend.FieldByName('RXACNTSG').AsString;
      if  vflag = 'G'  then
      begin
        ssql := 'UNMID=' + QuotedStr(DMLOG.cdsSerPend.FieldByName('UNMIDG').AsString);
        FRegSolProfAut.dblcUNMIDAct.Text := DMLOG.cdsSerPend.FieldByName('UNMIDG').AsString;
      end
      else
      begin
        ssql := 'UNMID=' + quotedStr(DMLOG.cdsSerPend.FieldByName('UNMIDU').AsString);
        FRegSolProfAut.dblcUNMIDAct.Text := DMLOG.cdsSerPend.FieldByName('UNMIDU').AsString;
      end;
      //FRegSolCot.vunmid := FRegSolCot.dblcUNMIDAct.Text;
      FRegSolProfAut.edtUNMIDAct.Text := DMLOG.displaydescrip('prvUMed','TGE130','*',ssql,'UNMDES');
      FRegSolProfAut.dbeCntSAct.Enabled:=True;
      FRegSolProfAut.edtActFij.Text:=DMLOG.cdsSerPend.FieldByName('ARTID').AsString;
    end;
  end;
  ModalResult := mrOK;
end;

procedure TFRqsSer.Z2btnTotalClick(Sender: TObject);
//var
  //iX   : Integer;
  //fSumG : Double;
begin
	{fSumG := 0;
	//DisableControls;
  for iX:= 0 to dbgRA.SelectedList.Count-1 do
  begin
  	dbgRA.datasource.dataset.GotoBookmark(dbgRA.SelectedList.items[iX]);
    fSumG := dbgRA.datasource.dataset.FieldByName('DRQSCNSG').AsFloat + dbgRA.datasource.dataset.FieldByName('DRQSCNSU').AsFloat + fSumG;
  end;
	//EnableControls;
  edSUMG.Clear;
  edSUMG.Text := Format('%-8.2f',[fSumG]);}
end;

procedure TFRqsSer.Z2btnSelAllClick(Sender: TObject);
begin
	//dbgRA.SelectedList.Clear;
 	//dbgRA.UnselectAll;
 	//dbgRA.SelectAll;
 	//edSUMG.Text := Format('%-8.2f',[DMLOG.cdsArtPend.FieldByName('RXACNTSG').AsFloat + DMLOG.cdsArtPend.FieldByName('RXACNTSU').AsFloat]);
end;

procedure TFRqsSer.FormActivate(Sender: TObject);
begin
  dbgRA.SelectedList.Clear;

  if FADMovimientos.xProfAut = 'SOLICITUD' then
  begin
    if FRegSOLCOT.dblcTipSol.Text='S' then
    begin
      panel3.Caption := 'Requisiciones por Servicios Pendientes';
      Caption:='Servicio Pendiente';
    end
    else
    begin
      panel3.Caption := 'Requisiciones por Compra de Activos Fijos';
      Caption:='Articulo de Activo Fijo Pendiente';
    end;
  end
  else
  if FADMovimientos.xProfAut = 'PROFORMA' then
  begin
    if FRegSolProfAut.dblcTipSol.Text='S' then
    begin
      panel3.Caption := 'Requisiciones por Servicios Pendientes';
      Caption:='Servicio Pendiente';
    end
    else
    begin
      panel3.Caption := 'Requisiciones por Compra de Activos Fijos';
      Caption:='Articulo de Activo Fijo Pendiente';
    end;
  end;

	pnlOrden.Visible:=False;
end;

procedure TFRqsSer.dbgArtPendRowChanged(Sender: TObject);
begin
//	dbgRA.SelectedList.Clear;
//  edSUMG.Text := '';
end;

procedure TFRqsSer.dbgRACalcTitleAttributes(Sender: TObject; AFieldName: String; AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
	if AFieldName='RQSID' then
  	AFont.Color:=clred;
  if AFieldName='RQSFREQ' then
  	AFont.Color:=clred;
end;

procedure TFRqsSer.dbgRATitleButtonClick(Sender: TObject;	AFieldName: String);
begin
	lblBusca.Caption:='XX';
	if AfieldName='RQSID' then
	begin
		DMLOG.cdsSerPend.IndexFieldNames:='RQSID';
		lblBusca.Caption:='Busca por Requisición:';
		isBusca.SearchField:='RQSID';
	end;
	if lblBusca.Caption <> 'XX' then
	begin
		pnlOrden.Visible := True;
		isBusca.Text:='';
		isBusca.SetFocus;
	end;

	//if AFieldName='RQSID' then DMLOG.cdsSerPend.IndexFieldNames:='RQSID';
	//if AFieldName='RQSFREQ' then DMLOG.cdsSerPend.IndexFieldNames:='RQSFREQ';
end;

procedure TFRqsSer.btnSalirClick(Sender: TObject);
begin
	pnlOrden.Visible := False;
end;

procedure TFRqsSer.dbgRAEnter(Sender: TObject);
begin
	pnlOrden.Visible:=False;
end;

procedure TFRqsSer.FormShow(Sender: TObject);
begin
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.

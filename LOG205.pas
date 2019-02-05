unit LOG205;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, DBCtrls, Db, GridControl, ppProd, ppClass,
//  ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, Psock, NMMSG,
  ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe,
  ppBands, ppPrnabl, ppCtrls, ppVar, ppStrtch, ppMemo, ShellApi, ComCtrls,
//  wwriched, Wwkeycb, TXComp, FileCtrl;
  wwriched, Wwkeycb, FileCtrl, Variants, MsgDlgs;

type
  TFSCxP = class(TForm)
    pnlSol: TPanel;
    dbgSC: TwwDBGrid;
    pnlDetalleG: TPanel;
    dbgSCxP: TwwDBGrid;
    Z2dbgSCXPIButton: TwwIButton;
    Z2bbtnCanc2: TBitBtn;
    Z2bbtnGraba: TBitBtn;
    pnlProv: TPanel;
    dbgProv: TwwDBGrid;
    Z2bbtnOK: TBitBtn;
    Z2bbtnCancel: TBitBtn;
    bvl1: TBevel;
    pnlSCxP: TPanel;
    ckbAll: TCheckBox;
    Z2bbtnPrint: TBitBtn;
    bvlSxP: TBevel;
    dbtpFEnvio: TwwDBDateTimePicker;
    lblRUC: TLabel;
    lblRzP: TLabel;
    lblFEnvio: TLabel;
    dbeContacto: TwwDBEdit;
    lblContato: TLabel;
    dblcMedCon: TwwDBLookupCombo;
    lblMedCom: TLabel;
    dbmObs: TDBMemo;
    lblOBS: TLabel;
    Z2bbtnSCxPOk: TBitBtn;
    Z2bbtnSCxPCancel: TBitBtn;
    lblTitle: TLabel;
    bvl2: TBevel;
    stSCxP: TPanel;
    stProv: TPanel;
    stxTitulo: TPanel;
    Z2bbtnOkTodos: TBitBtn;
    pprSolicitud: TppReport;
    pnlClave: TPanel;
    Bevel1: TBevel;
    Z2bbtnOkUsu: TBitBtn;
    Z2bbtnCancelUsu: TBitBtn;
    Panel2: TPanel;
    lblNomUsu: TLabel;
    lblClvUsu: TLabel;
    edtClvUsu: TEdit;
    Z2bbtnOkVisto: TBitBtn;
    dblcComprador: TwwDBLookupCombo;
    pnlOrden: TPanel;
    lblBusca: TLabel;
    Bevel2: TBevel;
    isBusca: TwwIncrementalSearch;
    btnSalir: TBitBtn;
    rdgpTipProv: TRadioGroup;
    dblcTipProv: TwwDBLookupCombo;
    lblTipprov: TLabel;
    Z2bbtnSalir: TBitBtn;
    dbeRUC: TEdit;
    dbeMedCon: TEdit;
    wwDBEdit1: TwwDBEdit;
    ppHeaderBand1: TppHeaderBand;
    pps1: TppShape;
    ppLblSccid: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLblFecha: TppLabel;
    ppLblProvDes: TppLabel;
    ppLblProvDir: TppLabel;
    ppLblContacto: TppLabel;
    ppLnSuperior: TppLine;
    ppLnInferior: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBTCiades: TppDBText;
    ppDBTCiadire: TppDBText;
    ppDBTCiatlf: TppDBText;
    ppDBTciafax: TppDBText;
    ppLblciatlf: TppLabel;
    ppLblciafax: TppLabel;
    ppDBTSccid: TppDBText;
    ppDBTciaruc: TppDBText;
    ppLblciaruc: TppLabel;
    ppDBTprovdes: TppDBText;
    ppDBTprovrepr: TppDBText;
    ppDBTprovdir: TppDBText;
    ppLblprovtlf: TppLabel;
    ppDBTprovtlf: TppDBText;
    ppLblprovfax: TppLabel;
    ppDBTprovfax: TppDBText;
    ppLabel42: TppLabel;
    ppLabel44: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    pplLin1: TppLabel;
    pplLin2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBTCODART: TppDBText;
    ppDBText5: TppDBText;
    ppDBTextU: TppDBText;
    ppDBtUMG: TppDBText;
    ppDBTUMU: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppIMFIRMA: TppImage;
    ppMmpie: TppMemo;
    ppLnFirma: TppLine;
    ppLblAutor: TppLabel;
    pplFirma: TppLabel;
    procedure dbgDReqsIButtonClick(Sender: TObject);
    procedure dbgSCxPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Z2bbtnCancelClick(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure dbgSCxPDblClick(Sender: TObject);
    procedure Z2dbgSCXPIButtonClick(Sender: TObject);
    procedure cbkSelAllClick(Sender: TObject);
    procedure Z2bbtnOKClick(Sender: TObject);
    procedure Z2bbtnSCxPCancelClick(Sender: TObject);
    procedure Z2bbtnSCxPOkClick(Sender: TObject);
    procedure dblcMedConNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure Z2bbtnOkVistoClick(Sender: TObject);
    procedure Z2bbtnOkUsuClick(Sender: TObject);
    procedure Z2bbtnCancelUsuClick(Sender: TObject);
    procedure Z2bbtnPrintClick(Sender: TObject);
    procedure Z2bbtnCanc2Click(Sender: TObject);
    procedure dbgSCxPRowChanged(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Z2bbtnOkTodosClick(Sender: TObject);
    procedure dbgSCRowChanged(Sender: TObject);
    procedure dbgProvTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure isBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalirClick(Sender: TObject);
    procedure rdgpTipProvClick(Sender: TObject);
    procedure dblcTipProvExit(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dbgProvEnter(Sender: TObject);
    procedure Z2bbtnSalirClick(Sender: TObject);
    procedure dblcMedConExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    PAfterScroll : TDataSetNotifyEvent;
    procedure OnOffDetalle ( Value : Boolean );
//    procedure OnOffCabecera( Value : Boolean );
    procedure btnDetalle;
    procedure AfterScroll(DataSet: TDataSet);
    procedure MAILIMP;
  public
    { Public declarations }
    xFileRtm : String;
    ppDBPipeline1: TppDBPipeline;
    bTodos : Boolean;

  end;

var
  FSCxP: TFSCxP;


implementation

uses LOGDM1, oaAD3000, LOGREP;

{$R *.DFM}

procedure TFSCxP.dbgDReqsIButtonClick(Sender: TObject);
begin
 with DMLOG do
 begin

 end;

// OnOffDetalle(False);          // Desactivar el panel de detalle
{ .............................................................................
  | Mostrar el cuadro de los proveedores                                      |
  .............................................................................}
// btnDetalle;
end;

procedure TFSCxP.dbgSCxPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=$4D) and (ssCtrl in Shift)  then
  begin
    dbgSCxPDblClick(nil);
  end;

  if (Key=VK_DELETE) and (ssCtrl in Shift)  then
  begin
    DMLOG.cdsSCxProv.Delete;
  end;
  btnDetalle;
end;

procedure TFSCxP.Z2bbtnCancelClick(Sender: TObject);
begin
	pnlSol.Enabled := True;
 	pnlProv.Visible:= False;
	pnlOrden.Visible := False;  
 	OnOffDetalle(True);
 	btnDetalle;
end;

procedure TFSCxP.Z2bbtnGrabaClick(Sender: TObject);
begin
	try
		Screen.Cursor:=crHourGlass;
		//DMLOG.ControlTran;
		DMLOG.ControlTran( 9, Nil,'');
		//DMLOG.AplicaDatos([cdsSCxProv]);
   	pnlSol.Enabled := True;
   	OnOffDetalle(True);
   	btnDetalle;
  finally
  	Screen.Cursor:=crDefault;
  end;
end;

procedure TFSCxP.dbgSCxPDblClick(Sender: TObject);
var
	xSQL : String;
begin
  OnOffDetalle(False);          // Desactivar el panel de detalle
  pnlSCxP.Left := (Width - pnlSCxP.Left) div 4;
  pnlSCxP.Top  := (Height - pnlSCxP.Height) div 4;

  xSQL:='PROV='+QuotedStr(DMLOG.cdsSCxProv.FieldByname('PROV').AsString);
  dbeRUC.Text:=DMLOG.displaydescrip('prvSQL','TGE201','PROVRUC',xSQL,'PROVRUC');
  //dbeRazonSocial.Text:=DMLOG.displaydescrip('prvSQL','TGE201','PROVDES',xSQL,'PROVDES');
  dbeMedCon.Text:=DMLOG.displaydescrip('prvSQL','TGE141','MCDES','MCID='+QuotedStr(dblcMedCon.Text),'MCDES');

  pnlSCxP.Visible := true;
  pnlSol.Enabled  := False;

  if DMLOG.cdsSCxProv.State in [dsInsert, dsBrowse] then
     DMLOG.cdsSCxProv.Edit;
  btnDetalle;
end;

procedure TFSCxP.Z2dbgSCXPIButtonClick(Sender: TObject);
var
	sSQL, xProv : String;
begin
	try
    Screen.Cursor:=crHourGlass;
		xProv := DMLOG.DisplayDescrip('prvTGE','TGE102','CLAUXID','CLAUXLOG=''S''','CLAUXID');
    dbgProv.UnselectAll;
    OnOffDetalle(False);          // activar el panel de detalle
    pnlSol.Enabled  := False;
    pnlProv.Left := (Width  - pnlProv.Left) div 4;
    pnlProv.Top  := (Height - pnlProv.Height) div 4;
    if rdgpTipProv.ItemIndex = 0 then
    	sSQL:= 'SELECT * FROM TGE201 WHERE CLAUXID='+QuotedStr(xProv)+' ORDER BY PROV'
    else
      sSQL:='SELECT P.* '+
            'FROM TGE201 P, LOG201 L '+
            'WHERE P.CLAUXID = L.CLAUXID '+
            'AND P.PROV = L.PROV '+
            'AND P.CLAUXID='+QuotedStr(xProv)+' '+
            'AND TIPPROVID = '''+DMLOG.cdsTipProv.fieldbyname('TIPPROVID').AsString+'''';
//    DMLOG.DCOM1.AppServer.ParamDSPGraba('0', 'PROV');
    DMLOG.cdsProv.Close;
    DMLOG.cdsProv.DataRequest(sSQL);
    DMLOG.cdsProv.Open;
    pnlProv.Visible := True;
		pnlOrden.Visible:= False;
    dbgProv.SetFocus;
  finally
  	Screen.Cursor:=crDefault;
  end;
end;

procedure TFSCxP.cbkSelAllClick(Sender: TObject);
begin
dbgProv.SelectedList.Clear;
if ckbAll.Checked Then
  dbgProv.SelectAll
else
  dbgProv.UnselectAll;
end;

procedure TFSCxP.Z2bbtnOKClick(Sender: TObject);
var
	iX : Integer;
  sCIAID,sSCCID, sPROV, sPROVDes : String;
  bExiste	: Boolean;
begin
	try
  	Screen.Cursor:=crHourGlass;
    for iX := 0 to dbgProv.SelectedList.Count-1 do
    begin
     dbgProv.DataSource.DataSet.GotoBookmark(dbgProv.SelectedList.Items[iX]);
     DMLOG.cdsSCxProv.DisableControls;
     DMLOG.cdsMedCom.First; // inicio de la tabla de medio de comunicación
     sCIAID  := DMLOG.cdsSolCot.FieldByName('CIAID').AsString;
     sSCCID  := DMLOG.cdsSolCot.FieldByName('SCCID').AsString;
     sPROV   := dbgProv.DataSource.DataSet.FieldByName('PROV').AsString;
     sPROVDes:= dbgProv.DataSource.DataSet.FieldByName('PROVDES').AsString;     
     bExiste := DMLOG.cdsSCxProv.Locate ('CIAID;SCCID;PROV',VarArrayOf([sCIAID,sSCCID,sPROV]),[]);
     if not bExiste then
     begin
       DMLOG.cdsSCxProv.Insert;
       DMLOG.cdsSCxProv.FieldByName('PROV').AsString       := sPROV;
       DMLOG.cdsSCxProv.FieldByName('PROVDES').AsString    := sPROVDes;
       DMLOG.cdsSCxProv.FieldByName('SCCID').AsString      := sSCCID;
       DMLOG.cdsSCxProv.FieldByName('CIAID').AsString      := sCIAID;
       //DMLOG.cdsSCxProv.FieldByName('SCXPCNTO').AsString   := '';
       DMLOG.cdsSCxProv.FieldByName('SCXPFENV').AsDateTime := Date;
       DMLOG.cdsSCxProv.FieldByName('SCXPOBS').AsString    := '.';
       DMLOG.cdsSCxProv.FieldByName('MCID').AsString       := DMLOG.cdsMedCom.FieldByName('MCID').AsString;
       DMLOG.cdsSCxProv.FieldByName('SCXVISAD').AsString    := 'N';
       DMLOG.cdsSCxProv.Post;
     end;
     DMLOG.cdsSCxProv.EnableControls;
    end;
    pnlProv.Visible := False;
		pnlOrden.Visible := False;
    pnlSol.Enabled := True;
    OnOffDetalle(True);
    btnDetalle;
	finally
  	Screen.Cursor:=crDefault;
  end;
end;

procedure TFSCxP.Z2bbtnSCxPCancelClick(Sender: TObject);
begin
   with DMLOG.cdsSCxProv do
   begin
     Cancel;
   end;
   pnlSCxP.Visible := False;
   pnlSol.Enabled := True;
   OnOffDetalle(True);          // Desactivar el panel de detalle
end;

procedure TFSCxP.Z2bbtnSCxPOkClick(Sender: TObject);
begin
	try
  	Screen.Cursor:=crHourGlass;
    if DMLOG.cdsSCxProv.State in [dsEdit, dsInsert] then
    	DMLOG.cdsSCxProv.Post;
    OnOffDetalle(True); // Desactivar el panel de detalle
    btnDetalle;
    pnlSol.Enabled := True;
    pnlSCxP.Visible := False;
  finally
  	Screen.Cursor:=crDefault;
  end;
end;

procedure TFSCxP.btnDetalle;
var
  bDummy1 : Boolean;
begin
  bDummy1:=(DMLOG.cdsSCxProv.ChangeCount>0) or (DMLOG.cdsSCxProv.Modified);

  Z2bbtnGraba.Enabled  := bDummy1;
  Z2bbtnCanc2.Enabled  := bDummy1;
  Z2bbtnOkVisto.Enabled:= not bDummy1;
  Z2bbtnOkTodos.Enabled:= not bDummy1;
  Z2bbtnPrint.Enabled  := not bDummy1;

  If DMLOG.cdsSCxProv.FieldByName('SCXVISAD').AsString='S' then
     Z2bbtnOkVisto.Enabled := false;
end;

{procedure TFSCxP.OnOffCabecera(Value: Boolean);
begin
 pnlSol.Enabled := False;
end;}

procedure TFSCxP.OnOffDetalle(Value: Boolean);
begin
  pnlDetalleG.Enabled := Value;
  if Value then
    stxTitulo.Color := clHighlight
  else
    stxTitulo.Color := clGray;

  Z2bbtnGraba.Enabled  := Value;
  Z2bbtnCanc2.Enabled  := Value;
  Z2bbtnOkVisto.Enabled:= Value;
  Z2bbtnOkTodos.Enabled:= Value;
  Z2bbtnPrint.Enabled  := Value;
end;

procedure TFSCxP.AfterScroll(DataSet: TDataSet);
begin
  DMLOG.cdsSCxProv.Close;
  DMLOG.cdsSCxProv.Open;
end;

procedure TFSCxP.dblcMedConNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFSCxP.Z2bbtnOkVistoClick(Sender: TObject);
begin
	if DMLOG.cdsSCxProv.RecordCount = 0 then
  begin
  	ErrorMsg('Adquisiciones', ' No Existen Proveedores a Enviar... !!! ');
  	Exit;
  end;
	if DMLOG.cdsSCxProv.FieldByName('SCXVISAD').AsString = 'S' then
  begin
  	ErrorMsg('Adquisiciones', ' El Proveedor '+Trim(DMLOG.cdsSCxProv.FieldByName('PROVDES').AsString)+' ya se encuentra Visado... !!! ');
  	Exit;
  end;
  edtClvUsu.Text := '';
  if dbgSCxP.SelectedList.Count-1 <> 0 then
  begin
  	bTodos :=False;
    pnlClave.Visible := true;
    dblcComprador.SetFocus;
    DMLOG.cdsComprador.Open;
    Z2bbtnOkVisto.Enabled:= false;
    Z2bbtnOkTodos.Enabled:= false;
    Z2bbtnPrint.Enabled := false;
    Z2bbtnCanc2.Enabled := false;
    Z2bbtnGraba.Enabled := false;
  end;
end;

procedure TFSCxP.Z2bbtnOkUsuClick(Sender: TObject);
begin
	try
    if (Length(edtClvUsu.Text)=0) or (Length(dblcComprador.Text)=0) then Exit;
    if edtClvUsu.Text<>DMLOG.cdsComprador.FieldByName('COMPCLA').AsString then
    begin
      ErrorMsg('Adquisiciones', ' Clave no Existe ');
      edtClvUsu.Text := '';
      edtClvUsu.SetFocus;
      Exit;
    end;
  	Screen.Cursor:=crHourGlass;
    if bTodos then
    begin
    	DMLOG.cdsSCxProv.First;
      while not DMLOG.cdsSCxProv.Eof do
      begin
      	DMLOG.cdsSCxProv.Edit;
        DMLOG.cdsSCxProv.FieldByName('SCXAUTOR').AsString := DMLOG.cdsComprador.fieldbyname('COMPCID').AsString;
        DMLOG.cdsSCxProv.FieldByName('SCXVISAD').AsString := 'S';
        DMLOG.cdsSCxProv.FieldByName('SCXFVISA').Value := Date();
        DMLOG.cdsSCxProv.FieldByName('SCXHVISA').Value := Time();
        DMLOG.cdsSCxProv.Post;
        DMLOG.cdsSCxProv.Next;
      end;
    end
    else
    begin
      DMLOG.cdsSCxProv.Edit;
      DMLOG.cdsSCxProv.FieldByName('SCXAUTOR').AsString := DMLOG.cdsComprador.fieldbyname('COMPCID').AsString;
      DMLOG.cdsSCxProv.FieldByName('SCXVISAD').AsString := 'S';
      DMLOG.cdsSCxProv.FieldByName('SCXFVISA').Value := Date();
      DMLOG.cdsSCxProv.FieldByName('SCXHVISA').Value := Time();
      DMLOG.cdsSCxProv.Post;
    end;
    Z2bbtnCancelUsu.Click;
    Z2bbtnGraba.Click;
  finally
  	Screen.Cursor:=crDefault;
  end;
end;

procedure TFSCxP.Z2bbtnCancelUsuClick(Sender: TObject);
begin
   pnlClave.Visible   := false;
   DMLOG.cdsComprador.close;
   ppIMFIRMA.Picture  := nil;
   ppLblAutor.Caption := '';
   OnOffDetalle(True);
   btnDetalle;
end;

procedure TFSCxP.Z2bbtnPrintClick(Sender: TObject);
var
	xSQL, ssql, xFirma : String;
begin
	if DMLOG.cdsSCxProv.RecordCount = 0 then
  begin
  	ErrorMsg('Adquisiciones', ' No Existen Proveedores a Enviar... !!! ');
  	Exit;
  end;
  Screen.Cursor:=crHourGlass;

  if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'S' then
	begin
		pprSolicitud.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\RepSolicitudSA.rtm';
		pprSolicitud.Template.LoadFromFile;
	end
	else
	begin
		pprSolicitud.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\RepSolicitud.rtm';
		pprSolicitud.Template.LoadFromFile;
	end;

	if not DirectoryExists( 'C:\oaEjecuta\Cotiza' ) then
      if not CreateDir( 'C:\oaEjecuta\Cotiza' ) then
         raise Exception.Create('Error al Crear Directorio C:\SOL' );

  xFileRtm:='C:\oaEjecuta\Cotiza\'+DMLOG.cdsSolCot.fieldbyname('SCCID').AsString+DMLOG.cdsSCxProv.fieldbyname('PROV').AsString+'_.HTM';
	if dbgSCxP.SelectedList.Count-1 <> 0 then
  begin
  	pprSolicitud.TextFileName := xFileRtm;
  	pprSolicitud.AllowPrintToFile := true;
//    pprSolicitud.DeviceType := 'ReportTextFile';
    pprSolicitud.DeviceType := 'HTMLFile';
//    pprSolicitud.DeviceType := 'GraphicFile';
    if DMLOG.cdsSCxProv.FieldByname('SCXVISAD').AsString='S' then
    begin
    	ssql:='COMPCID='+QuotedStr(DMLOG.cdsSCxProv.FieldByname('SCXAUTOR').AsString);
      xFirma:=DMLOG.displaydescrip('prvSQL','TGE135','*',ssql,'COMPRUFIR');
      if FileExists(xFirma) then
      	ppIMFIRMA.Picture.LoadFromFile(xFirma);
      ppLblAutor.Caption:=DMLOG.DisplayDescrip('prvSQL','TGE135','*',ssql,'COMPDES');
    end
    else
    begin
    	ppIMFIRMA.Picture :=NIL;
      ppLblAutor.Caption:='';
    end;
    ppLblprovfax.Left := ppLblprovtlf.Width + ppDBTprovtlf.Width+10;
    ppDBTprovfax.Left := ppLblprovfax.left + ppLblprovfax.Width;
    MAILIMP;
    pprSolicitud.ShowPrintDialog:=False;
    pprSolicitud.ArchiveFileName:=xFileRtm;
    pprSolicitud.TextFileName   :=xFileRtm;
    xSQL := 'TMONID=' + QuotedStr(DMLOG.cdsSolCot.FieldByName('TMONID').AsString);
    ppLabel9.Caption:='en '+DMLOG.DisplayDescrip('prvSQL','TGE103','TMONDES',xsql,'TMONDES');

    {pplLin1.Visible     :=True;
    pplLin2.Visible     :=True;
    pplFirma.Visible    :=True;
    pps1.Visible        :=False;
    ppLnSuperior.Visible:=False;
    ppLnInferior.Visible:=False;
    ppLnFirma.Visible   :=False;}

    pprSolicitud.Print;

  end;
  {
  if not FileExists( xFileRtm ) then
  	Raise Exception.Create( ' Reporte no Existe ' );
  }

  {pplLin1.Visible     :=False;
  pplLin2.Visible     :=False;
  pplFirma.Visible    :=False;
  pps1.Visible        :=True;
  ppLnSuperior.Visible:=True;
  ppLnInferior.Visible:=True;
  ppLnFirma.Visible   :=True;}

	pprSolicitud.ShowPrintDialog  := True;
  pprSolicitud.AllowPrintToFile := False;
  Screen.Cursor:=crDefault;
  if DMLOG.cdsReporte.IsEmpty then
  begin
  	ErrorMsg('Adquisiciones', ' No existe datos que cumplan con la Condición ');
    Exit;
  end;

  xSQL := 'TMONID=' + QuotedStr(DMLOG.cdsSolCot.FieldByName('TMONID').AsString);
  ppLabel9.Caption:='en '+DMLOG.DisplayDescrip('prvSQL','TGE103','TMONDES',xsql,'TMONDES');

  FPreview:=TFPreview.Create(Self);
  try
  	FPreview.ShowModal;
  finally
  	FPreview.Free;
  end;
end;

procedure TFSCxP.MAILIMP;
var
	xProv, sSQL, xSQL : string;
 	vFlag, vProv, vSoli : String;
begin
	xProv := DMLOG.DisplayDescrip('prvTGE','TGE102','CLAUXID','CLAUXLOG=''S''','CLAUXID');
 	vSoli := DMLOG.cdsSolCot.FieldByName('SCCID').AsString;
 	vProv := DMLOG.cdsSCxProv.FieldByName('PROV').AsString;
 	xSQL := '';
  if (SRV_D = 'DB2NT') or
		 (SRV_D = 'DB2400') then
  begin
    xSQL:='SELECT TGE101.CIADES, TGE101.CIADIRE, TGE101.CIATLF, TGE101.CIAFAX, TGE101.CIARUC, TGE201.PROV, TGE201.PROVDES, '+
          'TGE201.PROVDIR, TGE201.PROVTELF, TGE201.PROVFAX, TGE201.PROVREPR, DSOL.SCCID, DSOL.ARTID, DSOL.DSCCCNTG, DSOL.DSCCCNTU, '+
          'DSOL.UNMIDG, DSOL.UNMIDU, TGE205.ARTDES, DSOL.DSCOBS, TGE130.UNMABR, T2.UNMABR AS UNMABRU FROM LOG303 DSOL '+
          'LEFT JOIN TGE205 ON    ( TGE205.CIAID = DSOL.CIAID AND TGE205.ARTID = DSOL.ARTID ) '+
          'LEFT JOIN TGE130 ON    ( TGE130.UNMID = DSOL.UNMIDG ) '+
          'LEFT JOIN TGE130 T2 ON ( T2.UNMID = DSOL.UNMIDU ) '+
          'LEFT JOIN TGE101 ON ( TGE101.CIAID = DSOL.CIAID ) '+
          'LEFT JOIN LOG302 ON ( LOG302.CIAID = DSOL.CIAID AND LOG302.SCCID = DSOL.SCCID ) '+
          'LEFT JOIN TGE201 ON ( TGE201.PROV  = '''+vProv+''' AND TGE201.CLAUXID='+QuotedStr(xProv)+') '+
          'WHERE LOG302.SCCID='''+vSoli+'''';
  end
  else
	if SRV_D = 'ORACLE' then
  begin
    xSQL:='SELECT TGE101.CIADES, TGE101.CIADIRE, TGE101.CIATLF, TGE101.CIAFAX, TGE101.CIARUC, TGE201.PROV, TGE201.PROVDES, '+
          'TGE201.PROVDIR, TGE201.PROVTELF, TGE201.PROVFAX, TGE201.PROVREPR, DSOL.SCCID, DSOL.ARTID, DSOL.DSCCCNTG, DSOL.DSCCCNTU, '+
          'DSOL.UNMIDG, DSOL.UNMIDU, TGE205.ARTDES, DSOL.DSCOBS, TGE130.UNMABR, T2.UNMABR AS UNMABRU '+
          'FROM LOG303 DSOL, TGE205, TGE130, TGE130 T2, TGE101, LOG302, TGE201 '+
          'WHERE LOG302.SCCID='''+vSoli+''' '+
          'AND TGE205.CIAID(+) = DSOL.CIAID AND TGE205.ARTID(+) = DSOL.ARTID '+
          'AND TGE130.UNMID(+) = DSOL.UNMIDG '+
          'AND T2.UNMID(+) = DSOL.UNMIDU '+
          'AND TGE101.CIAID(+) = DSOL.CIAID '+
          'AND LOG302.CIAID(+) = DSOL.CIAID AND LOG302.SCCID(+) = DSOL.SCCID '+
          'AND TGE201.PROV = '''+vProv+''' AND TGE201.CLAUXID='+QuotedStr(xProv);
  end;

  sSQL := 'CIAID='+QuotedStr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString)+' AND SCCID=' + QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString);
  vFlag := DMLOG.displaydescrip('prvSQL','LOG303','SCCFLAGUM',ssql,'SCCFLAGUM');
  if DMLOG.cdsSolCot.FieldByName('TIPOADQ').AsString = 'C' then
	begin
    if vflag <> 'G' Then
    begin
      ppDBTUMU.DataField := 'UNMABRU';
      ppDBTextU.DataField := 'DSCCCNTU';
    end;
  end;
  DMLOG.cdsReporte.Close;
  //DMLOG.cdsReporte.ProviderName:='prvReporte';
  DMLOG.cdsReporte.DataRequest(xSQL);
  DMLOG.cdsReporte.Open;
  { 	xSQL := 'SELECT TGE101.CIADES, TGE101.CIADIRE, TGE101.CIATLF, TGE101.CIAFAX, '+
                 'TGE101.CIARUC, LOG302.SCCID, TGE201.PROV, TGE201.PROVDES, '+
                 'TGE201.PROVDIR, TGE201.PROVTELF, TGE201.PROVFAX, TGE201.PROVREPR, '+
                 'LOG303.SCCID, LOG303.ARTID, LOG303.DSCCCNTG, LOG303.DSCCCNTU, '+
                 'LOG303.UNMIDG, LOG303.UNMIDU, TGE205.ARTID, TGE205.ARTDES, LOG303.DSCOBS, '+
                 'TGE130.UNMABR, T2.UNMABR AS UNMABRU '+
                 ' FROM TGE101, LOG302, TGE201, LOG303, TGE130, TGE130 T2'+
                 ' LEFT JOIN TGE205  ON ( TGE205.ARTID = LOG303.ARTID ) '+
                 ' WHERE LOG302.SCCID='+''''+vsoli+''''+
                 ' AND TGE201.PROV='+''''+vprov+''''+
                 ' AND LOG303.SCCID= LOG302.SCCID';

  ssql := 'SCCID=' + QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString);
  vflag := DMLOG.displaydescrip('prvDSolCot','LOG303','*',ssql,'SCCFLAGUM');
  if vflag = 'G' Then
  begin
  	xSQL := xSQL + ' AND TGE130.UNMID=LOG303.UNMIDG';
    xSQL := xSQL + ' AND T2.UNMID=LOG303.UNMIDG';
  end
  else
  begin
  	xSQL := xSQL + ' AND TGE130.UNMID=LOG303.UNMIDU';
    xSQL := xSQL + ' AND T2.UNMID=LOG303.UNMIDU';
    ppDBTUMU.DataField := 'UNMABRU';
    ppDBTextU.DataField := 'DSCCCNTU';
  end;
}
	//wwDBRichEditMSWord1.Lines.LoadFromFile
end;

procedure TFSCxP.Z2bbtnCanc2Click(Sender: TObject);
begin
	dbgProv.UnselectAll;
  dbgProv.SelectedList.Clear;
  DMLOG.cdsSCxProv.CancelUpdates;
  pnlSol.Enabled := True;
  pnlProv.Visible := False;
  DMLOG.cdsSCxProv.First;
  OnOffDetalle(True);
  btnDetalle;
end;

procedure TFSCxP.dbgSCxPRowChanged(Sender: TObject);
begin
   OnOffDetalle(True);
   btnDetalle;
   If DMLOG.cdsSCxProv.FieldByName('SCXVISAD').AsString = 'S' then
      Z2bbtnOkVisto.Enabled := false;
end;

procedure TFSCxP.BitBtn1Click(Sender: TObject);
begin
  xFileRtm := 'C:\oaEjecuta\Cotiza\' + DMLOG.cdsSolCot.fieldbyname('SCCID').AsString + DMLOG.cdsSCxProv.fieldbyname('PROV').AsString + '.HTM';
  if dbgSCxP.SelectedList.Count-1 <> 0 then begin
     pprSolicitud.TextFileName := xFileRtm;
     pprSolicitud.AllowPrintToFile := true;
     pprSolicitud.DeviceType := 'ReportTextFile';
     MAILIMP;
     pprSolicitud.ShowPrintDialog:=False;
     pprSolicitud.Print;
  end;

  If not FileExists( xFileRtm ) then
     Raise Exception.Create( ' Reporte no Existe ' );

   FPreview:=TFPreview.Create(Self);
   FPreview.ShowHint:=True;
   With FPreview Do
   Try
      ShowModal;
   Finally
      Free;
   End;

end;

procedure TFSCxP.Z2bbtnOkTodosClick(Sender: TObject);
var
	xConta : Integer;
begin
	if DMLOG.cdsSCxProv.RecordCount = 0 then
  begin
  	ErrorMsg('Adquisiciones', ' No Existen Proveedores a Enviar... !!! ');
  	Exit;
  end;
  xConta:=0;
  DMLOG.cdsSCxProv.DisableControls;
  DMLOG.cdsSCxProv.First;
  while not DMLOG.cdsSCxProv.Eof do
  begin
  	if DMLOG.cdsSCxProv.FieldByName('SCXVISAD').AsString <> 'S' then
    	xConta:=xConta+1;
    DMLOG.cdsSCxProv.Next;
  end;
  DMLOG.cdsSCxProv.EnableControls;
  if xConta = 0 then
  begin
  	ErrorMsg('Adquisiciones', ' Todos lor Proveedores ya se Encuentran visados ');
  	Exit;
  end;
  edtClvUsu.Text := '';
  if dbgSCxP.SelectedList.Count-1 <> 0 then
  begin
    bTodos := True;
    DMLOG.cdsComprador.Open;
    pnlClave.Visible := true;
    dblcComprador.SetFocus;
    Z2bbtnOkVisto.Enabled:= false;
    Z2bbtnOkTodos.Enabled:= false;
    Z2bbtnPrint.Enabled := false;
    Z2bbtnCanc2.Enabled := false;
    Z2bbtnGraba.Enabled := false;
  end;
end;

procedure TFSCxP.dbgSCRowChanged(Sender: TObject);
begin
	DMLOG.cdsSCxProv.CancelUpdates;
  OnOffDetalle(True);
  btnDetalle;
end;

procedure TFSCxP.dbgProvTitleButtonClick(Sender: TObject; AFieldName: String);
begin
	lblBusca.Caption:='XX';
	if AfieldName='PROV' then
	begin
		DMLOG.cdsPROV.IndexFieldNames:='PROV';
		lblBusca.Caption:='Busca por Código:';
		isBusca.SearchField:='PROV';
	end;
	if AfieldName='PROVDES' then
	begin
		DMLOG.cdsPROV.IndexFieldNames:='PROVDES';
		lblBusca.Caption:='Busca por Descripción:';
		isBusca.SearchField:='PROVDES';
	end;
	if AfieldName='PROVRUC' then
	begin
		DMLOG.cdsPROV.IndexFieldNames:='PROVRUC';
		lblBusca.Caption:='Busca por R.U.C. :';
		isBusca.SearchField:='PROVRUC';
	end;
	if lblBusca.Caption<>'XX' then
	begin
		pnlOrden.Visible := True;
		isBusca.Text:='';
		isBusca.SetFocus;
	end;
end;

procedure TFSCxP.isBuscaKeyPress(Sender: TObject; var Key: Char);
begin
	{if key=#13 then begin
  	pnlOrden.Visible := False;
    dbgPROV.SetFocus;
  end;}
end;

procedure TFSCxP.btnSalirClick(Sender: TObject);
begin
	pnlOrden.Visible := False;
end;

procedure TFSCxP.rdgpTipProvClick(Sender: TObject);
begin
	if rdgpTipProv.ItemIndex = 0 then
  begin
  	dblcTipProv.Visible:=false;
    lblTipprov.Visible:=false;
  end
  else
  begin
  	dblcTipProv.Visible:=true;
    lblTipprov.Caption:='';
    lblTipprov.Visible:=true;
    dblcTipProv.SetFocus;    
  end
end;

procedure TFSCxP.dblcTipProvExit(Sender: TObject);
begin
	lblTipprov.Caption := DMLOG.DisplayDescrip('prvSQL','TGE134','TIPPROVDES','TIPPROVID='+quotedStr(dblcTipProv.text),'TIPPROVDES');
end;

procedure TFSCxP.FormDeactivate(Sender: TObject);
var
	sSQL : string;
begin
//	DMLOG.DCOM1.AppServer.ParamDSPGraba('1', 'PROV');
	sSQL := 'SELECT * FROM TGE134';
	DMLOG.cdsTipProv.Close;
  DMLOG.cdsTipProv.DataRequest(sSQL);
  //DMLOG.cdsTipProv.Open;
  ppIMFIRMA.Picture := nil;
  ppLblAutor.Caption := '';
  DMLOG.cdsSCxProv.AfterScroll :=  PAfterScroll;
	//DMLOG.cdsSCxProv.Close;
	DMLOG.cdsComprador.Close;
end;

procedure TFSCxP.dbgProvEnter(Sender: TObject);
begin
	pnlOrden.Visible:=False;
end;

{procedure TFSCxP.MAILIMP;
var
	ssql,xsql : string;
 	vflag,vprov,vsoli : String;
begin
 	vsoli := DMLOG.cdsSolCot.FieldByName('SCCID').AsString;
 	vprov := DMLOG.cdsSCxProv.FieldByName('PROV').AsString;
 	xSQL := '';
 	xSQL := 'select TGE101.CIADES,TGE101.CIADIRE,TGE101.CIATLF,TGE101.CIAFAX,'+
                 'TGE101.CIARUC,LOG302.SCCID,TGE201.PROV,TGE201.PROVDES,'+
                 'TGE201.PROVDIR,TGE201.PROVTELF,TGE201.PROVFAX,TGE201.PROVREPR,'+
                 'LOG303.SCCID, LOG303.ARTID, LOG303.DSCCCNTG,LOG303.DSCCCNTU,'+
                 'LOG303.UNMIDG,LOG303.UNMIDU,TGE205.ARTID,TGE205.ARTDES,'+
                 'TGE130.UNMABR, T2.UNMABR AS UNMABRU'+
                 ' FROM TGE101, LOG302, TGE201, LOG303, TGE205,TGE130, TGE130 T2'+
LEFT JOIN TGE205  ON ( TGE205.ARTID = LOG303.ARTID )
                 ' WHERE LOG302.SCCID='+''''+vsoli+''''+
                 ' AND TGE201.PROV='+''''+vprov+''''+
                 ' AND LOG303.SCCID= LOG302.SCCID AND TGE205.ARTID=LOG303.ARTID';

  ssql := 'SCCID=' + QuotedStr(DMLOG.cdsSolCot.FieldByName('SCCID').AsString);
  vflag := DMLOG.displaydescrip('prvDSolCot','LOG303','*',ssql,'SCCFLAGUM');
  if vflag = 'G' Then
  begin
  	xSQL := xSQL + ' AND TGE130.UNMID=LOG303.UNMIDG';
    xSQL := xSQL + ' AND T2.UNMID=LOG303.UNMIDG';
  end
  else
  begin
  	xSQL := xSQL + ' AND TGE130.UNMID=LOG303.UNMIDU';
    xSQL := xSQL + ' AND T2.UNMID=LOG303.UNMIDU';
    ppDBTUMU.DataField := 'UNMABRU';
    ppDBTextU.DataField := 'DSCCCNTU';
  end;
  DMLOG.cdsReporte.Close;
  DMLOG.cdsReporte.ProviderName:='prvTGE';
  DMLOG.cdsReporte.DataRequest(xSQL);
  DMLOG.cdsReporte.Open;
	//wwDBRichEditMSWord1.Lines.LoadFromFile
end;
}

procedure TFSCxP.Z2bbtnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFSCxP.dblcMedConExit(Sender: TObject);
begin
  dbeMedCon.Text:=DMLOG.displaydescrip('prvSQL','TGE141','MCDES','MCID='+QuotedStr(dblcMedCon.Text),'MCDES');
end;

procedure TFSCxP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	DMLOG.cdsSCxProv.Close;
	DMLOG.cdsSCxProv.MasterSource   := Nil;
	DMLOG.cdsSCxProv.IndexFieldNames:= '';
	DMLOG.cdsSCxProv.MasterFields   := '';
	DMLOG.cdsMedCom.Close;
   //FVariables.w_AD_Registro := False;
   //FVariables.w_Num_Formas  := FVariables.w_Num_Formas-1;
   Action := CAFree;
end;

procedure TFSCxP.FormShow(Sender: TObject);
var
	sSQL : string;
begin
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
	//DMLOG.cdsSCxProv.Open;
	DMLOG.cdsComprador.Close;
	DMLOG.cdsComprador.dataRequest('SELECT * FROM TGE135 ORDER BY COMPCID');
	DMLOG.cdsComprador.Open;

	sSQL := 'SELECT * FROM TGE134';
	DMLOG.cdsTipProv.Close;
   DMLOG.cdsTipProv.DataRequest(sSQL);
   DMLOG.cdsTipProv.Open;
   sSQL := '';
   sSQL := 'SELECT * FROM LOG302 WHERE SCCEST=''ACEPTADO'' ORDER BY SCCID DESC';
   DMLOG.cdsSolCot.Close;
   DMLOG.cdsSolCot.DataRequest(sSQL);
   DMLOG.cdsSolCot.Open;
   DMLOG.cdsSolCot.refresh;
   DMLOG.cdsSCxProv.Close;
   DMLOG.cdsSCxProv.MasterSource := DMLOG.dsSolCot;
   DMLOG.cdsSCxProv.IndexFieldNames := 'SCCID;CIAID';
   DMLOG.cdsSCxProv.MasterFields := 'SCCID;CIAID';
   DMLOG.cdsSCxProv.Open;
 	PAfterScroll := DMLOG.cdsSolCot.AfterScroll;
 	DMLOG.cdsSolCot.AfterScroll :=  AfterScroll;
 	if DMLOG.cdsSCxProv.RecordCount = 0 then
      btnDetalle
 	else
   begin
  	   Z2bbtnOkVisto.Enabled := true;
   	Z2bbtnOkTodos.Enabled := True;
   	Z2bbtnPrint.Enabled   := true;
   end;
end;

end.

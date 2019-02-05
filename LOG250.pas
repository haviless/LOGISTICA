Unit LOG250;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Mask, wwdbedit, wwdblook, DBCtrls, Grids,
  Wwdbigrd, Wwdbgrid, Buttons, DB, wwdbdatetimepicker, ppCache, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands, ppCtrls,
  ppPrnabl, ppVar, ppViewr, ppTypes, MsgDlgs;

type
  TFMaesProv = class(TForm)
    ppReporte: TppReport;
    ppdbReporte: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel6: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppLabel2: TppLabel;
    ppLine2: TppLine;
    Panel1: TPanel;
    pcMaestro: TPageControl;
    tbshMaestro: TTabSheet;
    Panel3: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label24: TLabel;
    Label30: TLabel;
    Label40: TLabel;
    dbeProv: TwwDBEdit;
    dbeRazSoc: TwwDBEdit;
    dbeAbr: TwwDBEdit;
    dbeTelef: TwwDBEdit;
    dbeFax: TwwDBEdit;
    dbeMail: TwwDBEdit;
    dbeRuc: TwwDBEdit;
    dbeDirCom: TwwDBEdit;
    dbeGirador: TwwDBEdit;
    dbeRepre: TwwDBEdit;
    dblcPais: TwwDBLookupCombo;
    dblcDeparta: TwwDBLookupCombo;
    dblcProvinc: TwwDBLookupCombo;
    dblcDistrito: TwwDBLookupCombo;
    dbeMax: TwwDBEdit;
    dbeMin: TwwDBEdit;
    dblcSecEco: TwwDBLookupCombo;
    Z2bbtnOK: TBitBtn;
    Z2bbtnCancel: TBitBtn;
    dbeLugPag: TwwDBEdit;
    dblcClAux: TwwDBLookupCombo;
    dblcGiro: TwwDBLookupCombo;
    dblcClasif: TwwDBLookupCombo;
    Z2bbtnNuevo: TBitBtn;
    dbeClAux: TEdit;
    dbeGiro: TEdit;
    dbeClasif: TEdit;
    dbeSecEco: TEdit;
    dbePais: TEdit;
    dbeDeparta: TEdit;
    dbeProvinc: TEdit;
    dbeDistrito: TEdit;
    dbeDNI: TwwDBEdit;
    dblcTipper: TwwDBLookupCombo;
    dbetipper: TEdit;
    dbenombres: TwwDBEdit;
    dbeapepat: TwwDBEdit;
    dbeapemat: TwwDBEdit;
    wwDBEdit1: TwwDBEdit;
    Z2bbtnPrint: TBitBtn;
    dbeNomCom: TwwDBEdit;
    TabSheet2: TTabSheet;
    Label32: TLabel;
    dbgMiembros: TwwDBGrid;
    wwDBGrid2IButton: TwwIButton;
    pnlMiembros: TPanel;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    dbeMiembro: TwwDBEdit;
    dbeNombre: TwwDBEdit;
    dblcOcupac: TwwDBLookupCombo;
    dbeOcupac: TwwDBEdit;
    wwDBEdit11: TwwDBEdit;
    wwDBEdit16: TwwDBEdit;
    wwDBEdit20: TwwDBEdit;
    Z2bbtnCancel2: TBitBtn;
    Z2bbtnOK2: TBitBtn;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    tbshTipProv: TTabSheet;
    dbgTipProv: TwwDBGrid;
    wwDBGrid1IButton: TwwIButton;
    pnlTipProv: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    lblTipprov: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    Panel5: TPanel;
    Z2bbtnOKTP: TBitBtn;
    Z2bbtnCancelTP: TBitBtn;
    Z2bbtnNuevoTP: TBitBtn;
    dblcTipProv: TwwDBLookupCombo;
    tbshLinea: TTabSheet;
    dbgProvLinea: TwwDBGrid;
    dbgBbtnLinea: TwwIButton;
    pnlProvLinea: TPanel;
    DBText3: TDBText;
    DBText4: TDBText;
    Label42: TLabel;
    Label43: TLabel;
    lblGrArtID: TLabel;
    lblLineaDesc: TLabel;
    Panel6: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    dblcGrpArti: TwwDBLookupCombo;
    Label44: TLabel;
    dblcProced: TwwDBLookupCombo;
    edtProced: TEdit;
    procedure wwDBGrid2IButtonClick(Sender: TObject);
    procedure dbgMiembrosDblClick(Sender: TObject);
    procedure Z2bbtnCancel2Click(Sender: TObject);
    procedure Z2bbtnOK2Click(Sender: TObject);
    procedure Regresa2;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z2bbtnCancelClick(Sender: TObject);
    procedure Z2bbtnOKClick(Sender: TObject);
    procedure dblcOcupacChange(Sender: TObject);
    procedure dblcOcupacExit(Sender: TObject);
    procedure dbeMiembroExit(Sender: TObject);
    procedure dbeProvExit(Sender: TObject);
    procedure dblcGiroExit(Sender: TObject);
    procedure dblcClasifExit(Sender: TObject);
    procedure dblcPaisExit(Sender: TObject);
    procedure dblcDepartaExit(Sender: TObject);
    procedure dblcProvincExit(Sender: TObject);
    procedure dblcDistritoExit(Sender: TObject);
    procedure dblcSecEcoExit(Sender: TObject);
    procedure Z2bbtnNuevoClick(Sender: TObject);
    procedure dblcClAuxExit(Sender: TObject);
    procedure wwDBGrid1IButtonClick(Sender: TObject);
    procedure dbgTipProvDblClick(Sender: TObject);
    procedure Z2bbtnCancelTPClick(Sender: TObject);
    procedure Z2bbtnOKTPClick(Sender: TObject);
    procedure dblcTipProvExit(Sender: TObject);
    procedure pcMaestroEnter(Sender: TObject);
    procedure dbeRazSocExit(Sender: TObject);
    procedure dbeRucExit(Sender: TObject);
    procedure dblcTipperExit(Sender: TObject);

    procedure dbenombresExit(Sender: TObject);
    procedure dbeapepatExit(Sender: TObject);
    procedure dbeapematExit(Sender: TObject);
    procedure Z2bbtnPrintClick(Sender: TObject);
    procedure ppReportePreviewFormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dblcGrpArtiExit(Sender: TObject);
    procedure dbgBbtnLineaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dbgTipProvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgProvLineaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgProvLineaDblClick(Sender: TObject);
    procedure dbeDNIExit(Sender: TObject);
    procedure dblcTipperNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcClAuxNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcProcedExit(Sender: TObject);
  private
    { Private declarations }
     wModif : String;
  public
    { Public declarations }
    xFlagRuc: String;
    procedure RegistroNuevo;
    procedure ValidaProveedor;
  end;

var
  FMaesProv: TFMaesProv;

implementation

{$R *.DFM}

Uses LOGDM1, oaAD2000;

procedure TFMaesProv.RegistroNuevo;
begin
   dbePais.Text    := '';
   dbeDeparta.Text := '';;
   dbeProvinc.Text := '';
   dbeDistrito.Text:= '';
   dbeGiro.Text    := '';
   dbeClasif.Text  := '';
   dbeSecEco.Text  := '';
   dbeTipPer.Text  := '';
   dbeClAux.text   := '';
   DMLOG.cdsProv.Append;
   if DMLOG.wAnchoProv = 0 then
  	DMLOG.cdsProv.FieldByName('PROV').AsString := DMLOG.StrZero(DMLOG.MaxProv(DMLOG.cdsProv.FieldByName('CLAUXID').AsString),DMLOG.wAnchoProv);
   wModif := 'N';
   dblcClAux.Enabled := True;
   dbeProv.Enabled   := True;
   dblcClAux.SetFocus;
end;

procedure TFMaesProv.wwDBGrid2IButtonClick(Sender: TObject);
begin
   if (DMLOG.wModo = 'A') and (length(dbeProv.Text)=0) then
      Raise Exception.Create(' Proovedor no Registrado ');
   pnlMiembros.Visible := True;
   dbgMiembros.Enabled := False;

   {DMLOG.cdsMiemEmpre.Insert;
   DMLOG.cdsMiemEmpreClieId.Value:=dbeClie.Text;}

   dbeMiembro.Text:='';
   dbeMiembro.Setfocus;
end;

procedure TFMaesProv.dbgMiembrosDblClick(Sender: TObject);
begin
   //if DMLOG.cdsMiemEmpre.RecordCount=0 Then Exit;

   pnlMiembros.Visible :=True;
   pnlMiembros.SetFocus;
   dbgMiembros.Enabled :=False;
   dbeMiembro.Enabled:=False;
   //DMLOG.cdsMiemEmpre.Edit;
end;

procedure TFMaesProv.Z2bbtnCancel2Click(Sender: TObject);
begin
   //if DMLOG.cdsMiemEmpre.State=dsInsert then DMLOG.cdsMiemEmpre.Delete;
   Regresa2;
end;

procedure TFMaesProv.Z2bbtnOK2Click(Sender: TObject);
var
   xWhere, xMiembro : string;
begin
   xWhere :='PROV='+''''+dbeProv.Text+''''+' AND MIEMID = '+''''+dbeMiembro.Text+'''';
   xMiembro:=DMLOG.BuscaQry('prvTGE','TGE210','*',xWhere,'MIEMID');
   if (DMLOG.wModo = 'A') and (xMiembro=dbeMiembro.Text) then
      Raise Exception.Create(' Miembro ya Registrado ');

   if length(dbeNombre.Text)=0 then
      Raise Exception.Create(' Nombre no Registrado ');

   Screen.Cursor:=crHourGlass;

   //DMLOG.cdsMiemEmpre.ApplyUpdates(0);
   Regresa2;

   Screen.Cursor:=crDefault;
end;

procedure TFMaesProv.Regresa2;
begin
   dbgMiembros.Enabled:=True;
   pnlMiembros.Visible:=False;
   dbeMiembro.Enabled :=True;
   dbgMiembros.Setfocus;
end;


procedure TFMaesProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   pcMaestro.ActivePageIndex:=0;
   DMLOG.cdsprov.CancelUpdates;
   DMLOG.cdsTipProv.Close;
   DMLOG.cdsMTipProv.Close;
   DMLOG.cdsMTipProv.MasterSource     := nil;
   DMLOG.cdsMTipProv.MasterFields     := '';
   DMLOG.cdsMTipProv.IndexFieldNames  := '';
   //FVariables.w_AD_Registro := False;
   {if DMLOG.wTipoAdicion='xFiltro' then
   begin
      DMLOG.ActualizaFiltro(Mtx2000,DMLOG.cdsProv,DMLOG.wModo);
   end;}
   Action := caFree;
end;

procedure TFMaesProv.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key := #0;
      perform(CM_Dialogkey, VK_TAB, 0);
   end;
end;

procedure TFMaesProv.Z2bbtnCancelClick(Sender: TObject);
begin
	if DMLOG.cdsProv.State=dsInsert then
  	DMLOG.cdsprov.Cancel;
  	//DMLOG.cdsprov.CancelUpdates;
  	//DMLOG.cdsProv.Delete;
  Close;
end;

procedure TFMaesProv.Z2bbtnOKClick(Sender: TObject);
var
	xWhere, xProve, SQLFiltro, xSQL : string;
begin
   if (DMLOG.wModo='A') and (dblcClAux.Enabled) then
    begin
     xWhere := 'CLAUXID='''+dblcClAux.Text+''' and PROV='''+dbeProv.Text+'''';
     xProve := DMLOG.BuscaQry('prvTGE','TGE201','*',xWhere,'PROV');
     if xProve = dbeProv.Text then
      Raise Exception.Create('Proveedor ya Registrado ');
     dblcClAux.Enabled := False;
     dbeProv.Enabled   := False;
    end;
   ValidaProveedor;
   Screen.Cursor := crHourGlass;

  // Actualiza Flag de Retención IGV
  //JCC 26/06/2002

   xSQL := 'Select RUC From CXP203 Where RUC ='+quotedstr(DMLOG.cdsProv.FieldByName('PROVRUC').AsString);
   DMLOG.cdsQry2.Close;

   DMLOG.cdsQry2.Filter := '';
   DMLOG.cdsQry2.IndexFieldNames := '';
   DMLOG.cdsQry2.DataRequest(xSQL);
   DMLOG.cdsQry2.Open;
   if DMLOG.cdsQry2.RecordCount > 0 then
    DMLOG.cdsProv.FieldByName('PROVRETIGV').AsString := 'N'
   else
    DMLOG.cdsProv.FieldByName('PROVRETIGV').AsString := 'S';
   DMLOG.cdsQry2.Close;
   DMLOG.cdsQry2.Filter := '';
   DMLOG.cdsQry2.IndexFieldNames := '';

   SQLFiltro := 'SELECT * FROM  TGE201 WHERE '
               +' CLAUXID  ='''+ dblcClAux.Text  +''' and '
               +' PROV ='''+ dbeProv.Text+''' ' ;
   DMLOG.cdsProv.DataRequest( SQLFiltro ) ;

   DMLOG.cdsProv.ApplyUpdates(0);
  //DMLOG.ControlTran;
  //DMLOG.AplicaDatos(DMLOG.cdsProv, 'PROV' );

   DMLOG.GrabaAuxConta( DMLOG.cdsProv );

   Screen.Cursor := crDefault;
   ShowMessage('Grabación Exitosa');

   if DMLOG.wModo = 'A' then
    Z2bbtnNuevo.Enabled := True;

   if DMLOG.wTipoAdicion='xFiltro' then
   begin
      DMLOG.ActualizaFiltro(Mtx2000,DMLOG.cdsProv,DMLOG.wModo);
   end;
end;

procedure TFMaesProv.dblcOcupacChange(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'OCUPID = '+''''+dblcOcupac.Text+'''';
   dbeOcupac.Text:=DMLOG.BuscaQry('prvTGE','RRHH101','*',xWhere,'OCUPDES');
end;

procedure TFMaesProv.dblcOcupacExit(Sender: TObject);
begin
   if length(dbeOcupac.Text)=0 then
   begin
      ShowMessage('Falta Ocupación');
      dblcOcupac.SetFocus;
   end;
end;

procedure TFMaesProv.dbeMiembroExit(Sender: TObject);
begin
   if length(dbeMiembro.Text)=0 then
   begin
      ShowMessage('Falta Miembro');
      dbeMiembro.SetFocus;
   end;
end;

procedure TFMaesProv.dbeProvExit(Sender: TObject);
var
	xWhere : String;
begin
  if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then exit;
  if length(Trim(dbeProv.Text))=0 then
  begin
    ShowMessage('Falta Provedor');
    dbeProv.SetFocus;
    Exit;
  end;
   //** 06/06/2001 - pjsv, se setea el ancho con la variable wAnchoProv el DMLOG, antes estaba a 8
  if DMLOG.wAnchoProv = 0 then
  begin
  	Exit;
  end;
	DMLOG.cdsprov.FieldByName('PROV').AsString:=DMLOG.StrZero(Trim(dbeProv.Text),DMLOG.wAnchoProv);
   //**
  xWhere:='CLAUXID='''+dblcClAux.Text+''' and PROV='''+dbeProv.Text+'''';
  DMLOG.BuscaQry('prvTGE','TGE201','PROV',xWhere,'PROV');
  if DMLOG.cdsQry.RecordCount > 0 then
  begin
  	if Question('Confirmar', ' Proveedor ya Existe '+ #13+#13+
								' Desea adicionar el Código Automaticamente ') then
    begin
      //** 06/06/2001 - pjsv, se setea el ancho con la variable wAnchoProv el DMLOG, antes estaba a 8
			DMLOG.cdsProv.FieldByName('PROV').AsString := DMLOG.StrZero(DMLOG.MaxProv(DMLOG.cdsProv.FieldByName('CLAUXID').AsString),DMLOG.wAnchoProv);
      //**
      dbeRazSoc.SetFocus;
    end
    else
    	dbeProv.SetFocus;
  end;
end;

procedure TFMaesProv.dblcGiroExit(Sender: TObject);
var
  xWhere : String;
begin
	//   if Length( dblcGiro.Text )=0 then Exit;
  xWhere := 'GIROID='''+dblcGiro.Text+'''';
  dbeGiro.Text:=DMLOG.BuscaQry('prvTGE','TGE116','*',xWhere,'GIRODES');
end;

procedure TFMaesProv.dblcClasifExit(Sender: TObject);
var
   xWhere : String;
begin
//   if Length( dblcClasif.Text )=0 then Exit;
   xWhere := 'CLASIFID='''+dblcClasif.Text+'''';
   dbeClasif.Text:=DMLOG.BuscaQry('prvTGE','TGE132','*',xWhere,'CLASIFDES');
end;

procedure TFMaesProv.dblcPaisExit(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'PAISID = '+''''+dblcPais.Text+'''';
   dbePais.Text:=DMLOG.BuscaQry('prvTGE','TGE118','*',xWhere,'PAISDES');

   if length(dblcPais.Text)=0 then exit;
   xWhere := 'PAISID = '+''''+dblcPais.Text+'''';
   dbePais.Text:=DMLOG.BuscaQry('dspUltTGE','TGE118','*',xWhere,'PAISDES');
   if Length(dbePais.Text)=0 then
   begin
      ShowMessage('Código de País No Existe');
      dblcPais.Text:='';
      dblcPais.SetFocus;
      exit;
   end;

   if DMLOG.cdsQry.FieldByName('FNACIONAL').AsString<>'S' then
   begin
      dblcDeparta.Enabled:=False;
      dblcProvinc.Enabled:=False;
      dblcDistrito.Enabled:=False;
      DMLOG.cdsClie.FieldByName('DPTOID').AsString:='';
      DMLOG.cdsClie.FieldByName('CIUDID').AsString:='';
      DMLOG.cdsClie.FieldByName('CLIECZIP').AsString:='';
      dbeDeparta.Text:='';
      dbeProvinc.Text:='';
      dbeDistrito.Text:='';
   end
   else
   begin
      dblcDeparta.Enabled:=True;
      dblcProvinc.Enabled:=True;
      dblcDistrito.Enabled:=True;
   end;
end;

procedure TFMaesProv.dblcDepartaExit(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'DPTOID = '+''''+dblcDeparta.Text+'''';
   dbeDeparta.Text:=DMLOG.BuscaQry('prvTGE','TGE158','*',xWhere,'DPTODES');


   if length(dblcDeparta.Text)=0 then exit;

   DMLOG.cdsDpto.SetKey;
   DMLOG.cdsDpto.FieldByName('DPTOID').AsString:=dblcDeparta.Text;
   if not DMLOG.cdsDpto.GotoKey then
   begin
      ShowMessage('Código de Departamento No Existe');
      dblcDeparta.Text:='';
      dblcDeparta.SetFocus;
      exit;
   end;
   dbeDeparta.Text := DMLOG.cdsDpto.FieldByName('DPTODES').AsString;
   DMLOG.cdsProvinc.Filter:='DPTOID='+quotedstr(dblcDeparta.Text);
   DMLOG.cdsProvinc.Filtered:=True;
   DMLOG.cdsProvinc.First;
end;

procedure TFMaesProv.dblcProvincExit(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'CIUDID = '+''''+dblcProvinc.Text+'''';
   dbeProvinc.Text:=DMLOG.BuscaQry('prvTGE','TGE121','*',xWhere,'CIUDDES');

   if length(dblcProvinc.Text)=0 then exit;

   DMLOG.cdsProvinc.SetKey;
   DMLOG.cdsProvinc.FieldByName('CIUDID').AsString:=dblcProvinc.Text;
   if not DMLOG.cdsProvinc.GotoKey then
   begin
      ShowMessage('Código de Provincia No Existe');
      dblcProvinc.Text:='';
      dblcProvinc.SetFocus;
      exit;
   end;
   dbeProvinc.Text := DMLOG.cdsProvinc.FieldByName('CIUDDES').AsString;

   DMLOG.cdsDistrito.Filter:='DPTOID='+quotedstr(dblcDeparta.Text)
                     +' and CIUDID='+quotedstr(dblcProvinc.Text);
   DMLOG.cdsDistrito.Filtered:=True;
   DMLOG.cdsDistrito.First;
   
end;

procedure TFMaesProv.dblcDistritoExit(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'ZIPID = '+''''+dblcDistrito.Text+'''';
   dbeDistrito.Text:=DMLOG.BuscaQry('prvTGE','TGE122','*',xWhere,'ZIPDES');

   if length(dblcDistrito.Text)=0 then exit;

   DMLOG.cdsDistrito.SetKey;
   DMLOG.cdsDistrito.FieldByName('ZIPID').AsString:=dblcDistrito.Text;
   if not DMLOG.cdsDistrito.GotoKey then
   begin
      ShowMessage('Código de Distrito No Existe');
      dblcDistrito.Text:='';
      dblcDistrito.SetFocus;
      exit;
   end;
   dbeDistrito.Text := DMLOG.cdsDistrito.FieldByName('ZIPDES').AsString;

end;

procedure TFMaesProv.dblcSecEcoExit(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'SECECOID = '+''''+dblcSecEco.Text+'''';
   dbeSecEco.Text:=DMLOG.BuscaQry('prvTGE','TGE163','*',xWhere,'SECECODES');
end;

procedure TFMaesProv.Z2bbtnNuevoClick(Sender: TObject);
begin
//   DMLOG.Filtracds( DMLOG.cdsProv,'Select * from TGE201 Where PROV=''''' );
   RegistroNuevo;
   Z2bbtnNuevo.Enabled:=False;
end;

procedure TFMaesProv.dblcClAuxExit(Sender: TObject);
var
	xWhere : string;
begin
  If Z2bbtnCancel.Focused then exit;
  if length(dblcClAux.Text)=0 then
  begin
  	dblcClAux.SetFocus;
    Raise Exception.Create('Falta Clase Auxiliar');
  end;
  xWhere  :='CLAUXID = '+''''+dblcClAux.Text+'''';
  dbeClAux.Text:=DMLOG.BuscaQry('prvTGE','TGE102','*',xWhere,'CLAUXDES');
  xFlagRuc:=DMLOG.cdsQry.FieldByName('CLAUXRUC').AsString;
end;

procedure TFMaesProv.wwDBGrid1IButtonClick(Sender: TObject);
begin
	if DMLOG.cdsProv.FieldByName('CLAUXID').AsString = '' then
  begin
  	ErrorMsg('Adquisiciones', 'Inserte Datos Principales del Proveedor');
    exit;
  end;
	lblTipprov.Caption:='';
	pnlTipProv.Visible:=True;
  DMLOG.cdsMTipProv.Insert;
  DMLOG.cdsMTipProv.FieldByName('CLAUXID').AsString:=dblcClAux.Text;
  DMLOG.cdsMTipProv.FieldByName('CLAUXDES').AsString:=dbeClAux.Text;
  DMLOG.cdsMTipProv.FieldByName('PROV').AsString:=dbeProv.Text;
  DMLOG.cdsMTipProv.FieldByName('PROVDES').AsString:=dbeRazSoc.Text;
  DMLOG.cdsMTipProv.FieldByName('PROVRUC').AsString:=dbeRuc.Text;
end;

procedure TFMaesProv.dbgTipProvDblClick(Sender: TObject);
begin
	if Length(Trim(dblcTipProv.Text)) = 0 then
  begin
  	ErrorMsg('Adquisiciones', 'El Tipo de Proveedor no Puede Estar en Blanco');
  	Exit;
  End;
	lblTipprov.Caption:='';
  DMLOG.cdsMTipProv.Edit;
  //DMLOG.cdsMTipProv.FieldByName('CLAUXID').AsString:=dblcClAux.Text;
  DMLOG.cdsMTipProv.FieldByName('CLAUXDES').AsString:=dbeClAux.Text;
  //DMLOG.cdsMTipProv.FieldByName('PROV').AsString:=dbeProv.Text;
  DMLOG.cdsMTipProv.FieldByName('PROVDES').AsString:=dbeRazSoc.Text;
  lblTipprov.Caption:=DMLOG.cdsMTipProv.FieldByName('TIPPROVDES').AsString;
	pnlTipProv.Visible:=True;
end;

procedure TFMaesProv.Z2bbtnCancelTPClick(Sender: TObject);
begin
	DMLOG.cdsMTipProv.Cancel;
	pnlTipProv.Visible:=False;
end;

procedure TFMaesProv.Z2bbtnOKTPClick(Sender: TObject);
begin
	if Length(Trim(dblcTipProv.Text)) = 0 then
  begin
  	ErrorMsg('Adquisiciones', 'El Tipo de Proveedor no Puede Estar en Blanco');
  	Exit;
  End;
  DMLOG.cdsMTipProv.FieldByName('TIPPROVDES').AsString:=lblTipprov.Caption;
  DMLOG.AplicaDatos(DMLOG.cdsMTIPPROV, 'MTIPPROV'  );

	pnlTipProv.Visible:=False;
end;

procedure TFMaesProv.dblcTipProvExit(Sender: TObject);
begin
	lblTipprov.Caption := DMLOG.DisplayDescrip('prvSQL','TGE134','TIPPROVDES','TIPPROVID='+quotedStr(dblcTipProv.text),'TIPPROVDES');
end;

procedure TFMaesProv.pcMaestroEnter(Sender: TObject);
begin
	if pcMaestro.ActivePage = tbshMaestro then
  	DMLOG.cdsMTipProv.Cancel;
end;

procedure TFMaesProv.dbeRazSocExit(Sender: TObject);
begin
  if DMLOG.wModo='A' then
  begin
   DMLOG.cdsprov.edit;
   DMLOG.cdsprov.fieldByName('PROVGIRA').AsString:=dbeRazSoc.Text;
   dbeGirador.Text:=DMLOG.CDSPROV.FieldByName('PROVGIRA').AsString;

   DMLOG.cdsprov.fieldByName('PROVNOMCOM').AsString:=dbeRazSoc.Text;
   dbeNomCom.Text:=DMLOG.CDSPROV.FieldByName('PROVNOMCOM').AsString;
  end;
end;

procedure TFMaesProv.dbeRucExit(Sender: TObject);
var
   xWhere : String;
   xMsg   : String;
begin
  if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then exit;
  //xWhere:='CLAUXID='''+dblcClAux.Text+''' and PROV='''+dbeProv.Text+'''';
  xWhere:='PROVRUC='+quotedstr(dbeRuc.Text)+' AND PROV<>'+quotedstr(dbeprov.text)+' AND CLAUXID='''+dblcClAux.Text+'''';
  DMLOG.BuscaQry('prvTGE','TGE201','PROVRUC,PROV,PROVDES',xWhere,'PROV');
  if DMLOG.cdsQry.RecordCount > 1 then
  begin
  	xMsg:='';
    while not DMLOG.cdsQry.Eof do
    begin
    	xMsg:=xMsg+'Proveedor: '+DMLOG.cdsQry.FieldByName('PROV').AsString+'  '
                +Trim(DMLOG.cdsQry.FieldByName('PROVDES').AsString)+#13+#13;
      DMLOG.cdsQry.Next;
    end;
		//dbeDNI.SetFocus;
    dbeRuc.SetFocus;
    ShowMessage('            R.U.C. ya Fué Registrado       '+#13+#13+xMsg )
  end;
end;

procedure TFMaesProv.dblcTipperExit(Sender: TObject);
var
   xWhere : String;
begin
   if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then exit;
   If Z2bbtnCancel.Focused then exit;
   if (Length(dblcTipper.Text)=0) And (DMLOG.wModo <> 'M') then
    begin
     dblctipper.SetFocus;
     Raise Exception.Create('Falta Tipo de Persona');
    end;
   xWhere := 'TIPPERID='''+dblcTipPer.Text+'''';
   dbeTipPer.Text := DMLOG.BuscaQry('prvTGE', 'TGE109', '*', xWhere, 'TIPPERDES');

   if DMLOG.cdsQry.FieldByName('TIPPERS').AsString = 'S' then //Persona Natural
    begin
     DMLOG.cdsProv.FieldByName('PROVDES').AsString := trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
     DMLOG.cdsProv.FieldByName('PROVABR').AsString := '';
     dbenombres.enabled := True;
     dbeapepat.enabled  := True;
     dbeapemat.enabled  := True;
     dberazsoc.enabled  := False;
     dbeabr.enabled     := False;
    end
   else
    begin
     DMLOG.cdsProv.FieldByName('PROVNOMBRE').AsString := '';
     DMLOG.cdsProv.FieldByName('PROVAPEPAT').AsString := '';
     DMLOG.cdsProv.FieldByName('PROVAPEMAT').AsString := '';
     dbenombres.enabled := False;
     dbeapepat.enabled  := False;
     dbeapemat.enabled  := False;
     dberazsoc.enabled  := True;
     dbeabr.enabled     := True;
    end;
end;

procedure TFMaesProv.dbenombresExit(Sender: TObject);
begin
	DMLOG.cdsProv.FieldByName('PROVDES').AsString:=trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
	DMLOG.cdsProv.FieldByName('PROVNOMCOM').AsString:=trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
end;

procedure TFMaesProv.dbeapepatExit(Sender: TObject);
begin
	DMLOG.cdsProv.FieldByName('PROVDES').AsString:=trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
	DMLOG.cdsProv.FieldByName('PROVNOMCOM').AsString:=trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
end;

procedure TFMaesProv.dbeapematExit(Sender: TObject);
begin
  DMLOG.cdsProv.FieldByName('PROVDES').AsString:=trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
	DMLOG.cdsProv.FieldByName('PROVNOMCOM').AsString:=trim(dbenombres.text)+' '+trim(dbeapepat.text)+' '+trim(dbeapemat.text);
end;

procedure TFMaesProv.Z2bbtnPrintClick(Sender: TObject);
var
	sSQL : String;
begin
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    sSQL := 'SELECT A.CLAUXID, A.PROV, A.TIPPROVID, B.TIPPROVDES, C.PROVDES, C.PROVRUC, C.PROVDIR, C.PROVTELF, C.PROVFAX, C.PROVREPR '+
            'FROM LOG201 A '+
            'LEFT JOIN TGE134 B ON (A.TIPPROVID = B.TIPPROVID) '+
            'LEFT JOIN TGE201 C ON (C.CLAUXID = '+QuotedStr(dblcClAux.Text)+' AND C.PROV=A.PROV) '+
            'WHERE A.CLAUXID='+QuotedStr(dblcClAux.Text)+' '+
            'AND A.PROV='+QuotedStr(dbeProv.Text)+' '+
            'ORDER BY TIPPROVID';
  end
  else
	if SRV_D = 'ORACLE' then
  begin
    sSQL := 'SELECT A.CLAUXID, A.PROV, A.TIPPROVID, B.TIPPROVDES, C.PROVDES, C.PROVRUC,  C.PROVDIR, C.PROVTELF, C.PROVFAX, C.PROVREPR '+
						'FROM LOG201 A, TGE134 B, TGE201 C '+
						'WHERE A.CLAUXID='+QuotedStr(dblcClAux.Text)+' '+
						'AND A.PROV='+QuotedStr(dbeProv.Text)+' '+
						'AND A.TIPPROVID=B.TIPPROVID(+) '+
						'AND C.CLAUXID='+QuotedStr(dblcClAux.Text)+' '+
            'AND C.PROV=A.PROV(+) '+
						'ORDER BY TIPPROVID';
  end;
  DMLOG.cdsReporte.Close;
  DMLOG.cdsReporte.DataRequest(sSQL);
  DMLOG.cdsReporte.Open;

  if DMLOG.cdsReporte.RecordCount = 0 then
  begin
  	Information('Modulo De Compras','No Existe Información a Mostrar');
  	Exit;
  end;

  ppReporte.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\RepTipProv.rtm';
  ppReporte.Template.LoadFromFile;
  ppReporte.Print;
  ppReporte.Stop;
end;

procedure TFMaesProv.ppReportePreviewFormCreate(Sender: TObject);
begin
  ppReporte.PreviewForm.ClientHeight := 500;
  ppReporte.PreviewForm.ClientWidth := 650;
  tppviewer(ppReporte.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFMaesProv.BitBtn1Click(Sender: TObject);
begin

  if Length(Trim(dblcGrpArti.Text)) = 0 then
  begin
  	ErrorMsg('Adquisiciones', 'El Grupo de Línea no Puede Estar en Blanco');
  	Exit;
  End;
  DMLOG.cdsCCanje.FieldByName('GRARID').AsString:=dblcGrpArti.text;
  DMLOG.cdsCCanje.FieldByName('GRARDES').AsString:=lblLineaDesc.Caption;
  DMLOG.AplicaDatos(DMLOG.cdsCCanje, 'PROVLINEA'  );

	pnlProvLinea.Visible:=False;
end;

procedure TFMaesProv.dblcGrpArtiExit(Sender: TObject);
begin
	lblLineaDesc.Caption := DMLOG.DisplayDescrip('prvSQL','TGE131','GRARDES','GRARID='+quotedStr(dblcGrpArti.text),'GRARDES');
end;

procedure TFMaesProv.dbgBbtnLineaClick(Sender: TObject);
begin
	if DMLOG.cdsProv.FieldByName('CLAUXID').AsString = '' then
  begin
  	ErrorMsg('Adquisiciones', 'Inserte Datos Principales del Proveedor');
    exit;
  end;

  lblLineaDesc.Caption:='';
  pnlProvLinea.Visible:=True;
  DMLOG.cdsCCanje.Insert;
  DMLOG.cdsCCanje.FieldByName('CLAUXID').AsString  :=dblcClAux.Text;
  DMLOG.cdsCCanje.FieldByName('CLAUXDES').AsString :=dbeClAux.Text;
  DMLOG.cdsCCanje.FieldByName('PROV').AsString     :=dbeProv.Text;
  DMLOG.cdsCCanje.FieldByName('PROVDES').AsString  :=dbeRazSoc.Text;

end;

procedure TFMaesProv.BitBtn2Click(Sender: TObject);
begin
   DMLOG.cdsCCanje.Cancel;
	 pnlProvLinea.Visible := False;
end;

procedure TFMaesProv.dbgTipProvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key=VK_Delete) and (ssCtrl in Shift) then begin
      if MessageDlg( ' ¿ Eliminar Registro ? ' ,mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         DMLOG.cdsMTipProv.Delete;
         DMLOG.AplicaDatos(DMLOG.cdsMTIPPROV, 'MTIPPROV'  );
      end
   end;
end;

procedure TFMaesProv.dbgProvLineaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key=VK_Delete) and (ssCtrl in Shift) then begin
      if MessageDlg( ' ¿ Eliminar Registro ? ' ,mtConfirmation, [mbYes, mbNo], 0)=mrYes then begin
         DMLOG.cdsCCanje.Delete;
         DMLOG.AplicaDatos( DMLOG.cdsCCanje, 'PROVLINEA'  );
      end;
   end;
end;

procedure TFMaesProv.dbgProvLineaDblClick(Sender: TObject);
begin
	if Length(Trim(dblcTipProv.Text)) = 0 then
  begin
  	ErrorMsg('Adquisiciones', 'El Tipo de Proveedor no Puede Estar en Blanco');
  	Exit;
  End;
	lblLineaDesc.Caption:='';
  DMLOG.cdsCCanje.Edit;
  lblLineaDesc.Caption:=DMLOG.cdsCCanje.FieldByName('GRARDES').AsString;
	pnlProvLinea.Visible:=True;
end;

procedure TFMaesProv.dbeDNIExit(Sender: TObject);
begin
  if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then exit;

end;

procedure TFMaesProv.ValidaProveedor;
begin
  if dblcClAux.text='' then
  begin
    dblcClAux.SetFocus;
    Raise Exception.Create('Ingrese Clase Auxiliar');
  end;

  if dbeClAux.text='' then
  begin
    dblcClAux.SetFocus;
    Raise Exception.Create('Clase Auxiliar errada');
  end;

  if dbeProv.text='' then
  begin
    dbeProv.SetFocus;
    Raise Exception.Create('Ingrese Código de Proveedor');
  end;

  if dblctipper.text='' then
  begin
    dblctipper.SetFocus;
    Raise Exception.Create('Ingrese Tipo de Persona');
  end;

  if dbetipper.text='' then
  begin
    dblctipper.SetFocus;
    Raise Exception.Create('Tipo de Persona errada');
  end;

  DMLOG.DisplayDescrip('prvSQL','TGE109','TIPPERS','TIPPERID='+quotedStr(dblctipper.text),'TIPPERS');
  if DMLOG.cdsQry.FieldByName('TIPPERS').AsString='S' then
  begin
    if dbeDNI.text='' then
    begin
      dbeDNI.SetFocus;
      Raise Exception.Create('Ingrese DNI');
    end;
    if dbenombres.text='' then
    begin
      dbenombres.SetFocus;
      Raise Exception.Create('Ingrese Nombres');
    end;
    if dbeapepat.text='' then
    begin
      dbeapepat.SetFocus;
      Raise Exception.Create('Ingrese Apellido Paterno');
    end;
    if dbeapemat.text='' then
    begin
      dbeapemat.SetFocus;
      Raise Exception.Create('Ingrese Apellido Materno');
    end;
  end;
  if DMLOG.cdsQry.FieldByName('TIPPERS').AsString='N' then
  begin
    if dbeRuc.text='' then
    begin
      dbeRuc.SetFocus;
      Raise Exception.Create('Ingrese RUC');
    end;
  end;
  if dbeRazSoc.text='' then
  begin
    if DMLOG.cdsQry.FieldByName('TIPPERS').AsString<>'S' then
      dbeRazSoc.SetFocus;
    Raise Exception.Create('Ingrese Razón Social');
  end;
end;

procedure TFMaesProv.dblcTipperNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFMaesProv.dblcClAuxNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFMaesProv.FormShow(Sender: TObject);
begin
   pcMaestro.ActivePageIndex := 0;
   Z2bbtnNuevo.Enabled := False;
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );

   if DMLOG.wModo = 'A' then
   begin
      RegistroNuevo;
   end
   else
   begin
      wModif := 'S';
      DMLOG.cdsProv.Edit;
      dblcClAuxExit(Sender);
      dblcTipPerExit(Sender);
      dblcPaisExit(Sender);
      dblcDepartaExit(Sender);
      dblcProvincExit(Sender);
      dblcDistritoExit(Sender);
      dblcGiroExit(Sender);
      dblcClasifExit(Sender);
      dblcSecEcoExit(Sender);
      dblcProcedExit(Sender);
      dblcClAux.Enabled := False;
      dbeProv.Enabled   := False;
      dbeRuc.SetFocus;
   end;
end;

procedure TFMaesProv.FormCreate(Sender: TObject);
begin
   DMLOG.FiltraTabla( DMLOG.cdsSecEco,  'TGE163', 'SECECOID','SECECOID');
   dblcSecEco.LookupTable:=DMLOG.cdsSecEco;
   dblcSecEco.LookupField:='SECECOID';

   DMLOG.FiltraTabla( DMLOG.cdsGiro,    'TGE116', 'GIROID','GIROID');
   dblcGiro.LookupTable:=DMLOG.cdsGiro;
   dblcGiro.LookupField:='GIROID';

   DMLOG.FiltraTabla( DMLOG.cdsClasif,  'TGE132', 'CLASIFID','CLASIFID');
   dblcClasif.LookupTable:=DMLOG.cdsClasif;
   dblcClasif.LookupField:='CLASIFID';

//   DMLOG.FiltraTabla( DMLOG.cdsBanco,   'TGE105', 'BANCOID','BANCOID');
//   DMLOG.FiltraTabla( DMLOG.cdsSitua,   'CXC104', 'SITUAID','SITUAID');

   DMLOG.FiltraTabla( DMLOG.cdsTipProv, 'TGE134', 'TIPPROVID','TIPPROVID');
   dblcTipProv.LookupTable:=DMLOG.cdsTipProv;
   dblcTipProv.LookupField:='TIPPROVID';

   DMLOG.FiltraTabla( DMLOG.cdsClAux,   'TGE102', 'CLAUXID','CLAUXID');
   dblcClAux.LookupTable:=DMLOG.cdsClAux;
   dblcClAux.LookupField:='CLAUXID';

   DMLOG.FiltraTabla( DMLOG.cdsGArti,   'TGE131', 'GRARID','GRARID');
   dblcGrpArti.LookupTable:=DMLOG.cdsGArti;
   dblcGrpArti.LookupField:='GRARID';

   DMLOG.FiltraTabla( DMLOG.cdsTipPer,  'TGE109', 'TIPPERID', 'TIPPERID');
   dblcTipPer.LookupTable:=DMLOG.cdsTipPer;
   dblcTipPer.LookupField:='TIPPERID';

   //DMLOG.cdsNivel.IndexFieldNames:='Nivel';
   dbetipper.Text:='';
   pcMaestro.ActivePageIndex:=0;
   Z2bbtnNuevo.Enabled:=False;

   // cdsQry6 en Inventarios
   DMLOG.cdsMTipProv.DataRequest('SELECT * FROM LOG201');
   DMLOG.cdsMTipProv.MasterSource     := DMLOG.dsProv;
   DMLOG.cdsMTipProv.MasterFields     := 'CLAUXID;PROV';
   DMLOG.cdsMTipProv.IndexFieldNames  := 'CLAUXID;PROV';
   DMLOG.cdsMTipProv.Open;

   //CIM 20/11/2002

   // cdsQry5 en Inventarios
   DMLOG.cdsCCanje.Close;
   DMLOG.cdsCCanje.DataRequest('SELECT * FROM LOG202');
   DMLOG.cdsCCanje.MasterSource     := DMLOG.dsProv;
   DMLOG.cdsCCanje.MasterFields     := 'CLAUXID;PROV';
   DMLOG.cdsCCanje.IndexFieldNames  := 'CLAUXID;PROV';
   DMLOG.cdsCCanje.Open;
   dbgProvLinea.DataSource := DMLOG.dsCCanje;

   xSQL := 'Select * from TGE829';
   DMLOG.cdsQry3.IndexFieldNames:='';
   DMLOG.cdsQry3.Filter:='';
   DMLOG.cdsQry3.Filtered:=False;
   DMLOG.cdsQry3.Close;
   DMLOG.cdsQry3.datarequest(xSQL);
   DMLOG.cdsQry3.Open;
   dblcProced.LookupTable:=DMLOG.cdsQry3;
   dblcProced.LookupField:='ID';
   dblcProced.Selected.Clear;
   dblcProced.Selected.Add('ID'#9'3'#9'Id'#9'F');
   dblcProced.Selected.Add('DESCRIP'#9'30'#9'Procedencia'#9'F');

end;

procedure TFMaesProv.dblcProcedExit(Sender: TObject);
begin
   edtProced.Text := '';
//   if length(dblcProced.Text)>0 then
//   begin
      DMLOG.cdsQry3.IndexFieldNames:='ID';
      DMLOG.cdsQry3.SetKey;
      DMLOG.cdsQry3.FieldByName('ID').AsString:=dblcProced.Text;
      if not DMLOG.cdsQry3.GotoKey then
      begin
         ShowMessage('Procedencia no definida');
         dblcProced.SetFocus;
         exit;
      end;
      edtProced.Text := DMLOG.cdsQry3.FieldByName('DESCRIP').AsString;
//   end;
end;

end.

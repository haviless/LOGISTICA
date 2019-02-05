unit LOG221;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls, Buttons, Wwkeycb, MsgDlgs;

type
  TFArtOCxReqs = class(TForm)
    pnlArtPend: TPanel;
    dbgArtPend: TwwDBGrid;
    pnlDetRqs: TPanel;
    dbgRqsArtX: TwwDBGrid;
    Panel2: TPanel;
    pnlTitulo5: TPanel;
    bbtnCerrar: TBitBtn;
    bbtnAceptar: TBitBtn;
    pnlOrden: TPanel;
    lblBusca: TLabel;
    Bevel2: TBevel;
    isBusca: TwwIncrementalSearch;
    btnSalir: TBitBtn;
    pnlDetxReqs: TPanel;
    dbgDReqs: TwwDBGrid;
    bbtnCerrarDetReqs: TBitBtn;
    procedure bbtnAceptarClick(Sender: TObject);
    procedure bbtnCerrarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure dbgArtPendTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure dbgRqsArtXDblClick(Sender: TObject);
    procedure dbgRqsArtXEnter(Sender: TObject);
    procedure bbtnCerrarDetReqsClick(Sender: TObject);
    procedure dbgArtPendEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FArtOCxReqs: TFArtOCxReqs;

implementation

uses LOG210, LOGDM1, oaAD3100;

{$R *.DFM}

procedure TFArtOCxReqs.bbtnAceptarClick(Sender: TObject);
begin
  if dbgArtPend.DataSource.DataSet.RecordCount = 0 then
  begin
    ErrorMsg('Adquisiciones',  ' No hay Items a Transferir ' );
		ModalResult := mrCancel;
    Exit;
  end;
  //if Length(Trim(DMLOG.cdsArtPendX.FieldByName('RQSVISADOR').AsString)) = 0 then
  //begin
    //ErrorMsg('Adquisiciones',  ' La Requisición no ha Sido Visada, Sólo la Puede Visualizar como Referencia ' );
		//ModalResult := mrCancel;
  	//Exit;
  //end;
  ModalResult := mrOK;
end;

procedure TFArtOCxReqs.bbtnCerrarClick(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TFArtOCxReqs.btnSalirClick(Sender: TObject);
begin
	pnlOrden.Visible := False;
end;

procedure TFArtOCxReqs.dbgArtPendTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   //lblBusca.Caption:='XX';
   if AfieldName='ARTID' then
   begin
      DMLOG.cdsArtPendX.IndexFieldNames:='ARTID';
      lblBusca.Caption:='Busca por Articulo:';
      isBusca.SearchField:='ARTID';
   end;
   if AfieldName='ARTDES' then
   begin
      DMLOG.cdsArtPendX.IndexFieldNames:='ARTDES';
      lblBusca.Caption:='Busca por Detalle:';
      isBusca.SearchField:='ARTDES';
   end;
   if lblBusca.Caption<>'XX' then
   begin
      pnlOrden.Visible := True;
      isBusca.Text:='';
      isBusca.SetFocus;
   end
   else
   begin
      pnlOrden.Visible := False;
      DMLOG.cdsArtPendX.IndexFieldNames:='';
   end
end;

procedure TFArtOCxReqs.dbgRqsArtXDblClick(Sender: TObject);
var
	sSQL : String;
begin
	Screen.Cursor:=crHourGlass;
  sSQL := 'SELECT * FROM LOG309 WHERE RQSID= '''+ DMLOG.CdsRqsArtX.FieldByName('RQSID').AsString+''' ORDER BY CIAID,RQSID,LOCID,ALMID,DRQSID';
	DMLOG.cdsReporte.Close;
  DMLOG.cdsReporte.DataRequest(sSQL);
  DMLOG.cdsReporte.Open;
	pnlDetxReqs.Visible:=true;
	dbgDReqs.SetFocus;
	Screen.Cursor:=crDefault;
end;

procedure TFArtOCxReqs.dbgRqsArtXEnter(Sender: TObject);
begin
	pnlDetxReqs.Visible:=false;
end;

procedure TFArtOCxReqs.bbtnCerrarDetReqsClick(Sender: TObject);
begin
	pnlDetxReqs.Visible:=False;
end;

procedure TFArtOCxReqs.dbgArtPendEnter(Sender: TObject);
begin
	DMLOG.cdsArtPendX.IndexFieldNames:='';
	pnlOrden.Visible:=False;
end;

procedure TFArtOCxReqs.FormShow(Sender: TObject);
begin
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
	pnlOrden.Visible:=False;
	isBusca.Text:='';
   dbgArtPend.SetFocus;
end;

procedure TFArtOCxReqs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   try
   FOrdendeCompra.wTipoOC := '';
   except
   end;

   DMLOG.wModo := '';
   //FVariables.w_AD_Registro := False;
   //FVariables.w_Num_Formas  := FVariables.w_Num_Formas-1;
   Action := CAFree;
end;

end.

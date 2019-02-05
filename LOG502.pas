unit LOG502;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls, Db, DBClient,
  wwclient, Wwdatsrc, GridControl;

type
  TFVisOCReq = class(TForm)
    pnlDetalleG: TPanel;
    stxTitulo1: TStaticText;
    Panel1: TPanel;
    stxTitulo2: TStaticText;
    Z2bbtnSalir: TBitBtn;
    Bevel1: TBevel;
    dbgO: TwwDBGrid;
    dbgD: TwwDBGrid;
    cds: TwwClientDataSet;
    ds: TwwDataSource;
    dsCab: TwwDataSource;
    cdsCab: TwwClientDataSet;
    procedure Z2bbtnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    xModoVis : String[1] ;
    procedure cdsAfterScrollOC(DataSet: TDataSet);
    procedure cdsAfterScrollReq(DataSet: TDataSet);

  public
    { Public declarations }
    procedure ConfiguracionInicial(dbg : TwwDBGrid ) ;
  end;

var
  FVisOCReq: TFVisOCReq;

implementation

uses LOGDM1, oaAD3100;

{$R *.DFM}

procedure TFVisOCReq.cdsAfterScrollOC(DataSet: TDataSet);
begin
   cds.Filtered := False ;
   cds.Filter := 'ARTID = '''+ DataSet.fieldbyname('ARTID').AsString +
                 ''' AND ODCID = ''' + DataSet.fieldbyname('ODCID').AsString + ''' ' ;
   cds.Filtered := True ;
end;

procedure TFVisOCReq.cdsAfterScrollReq(DataSet: TDataSet);
begin
   cds.Filtered := False ;
   cds.Filter := 'ARTID = '''+ DataSet.FiELDBYNAME('ARTID').AsString +
                 ''' AND ODCID = ''' + DataSet.FiELDBYNAME('ODCID').AsString + ''' ' ;
   cds.Filtered := True ;
end;

procedure TFVisOCReq.ConfiguracionInicial;
var
   xSQL    ,
   xNumReq ,
   xNumOC  : String ;
begin
  dbgo.selected.Clear ;
  dbgO.Selected.Assign( dbg.selected ) ;
  cdsCab.CloneCursor( TwwClientDataset(dbg.datasource.dataset),false ) ;
  if dbg.Name = 'dbgDReqs' then
  begin
     xModoVis := 'R'   ;
     xNumReq  := dbg.DataSource.DataSet.fieldbyName('RQSID').AsString ;
     xSQL     := 'SELECT * FROM LOG305 WHERE ODCID IN '                              +
                     ' (SELECT ODCID FROM LOG309 WHERE RQSID = ''' + xNumReq + ''')' ;

     stxTitulo1.Caption := 'Detalles de Requisición' ;
     stxTitulo2.Caption := 'Ordenes de Compra' ;

  end
  else
  begin
     xModoVis := 'O' ;
     xNumOC   := dbg.DataSource.DataSet.fieldbyName('ODCID').AsString ;
     xSQL     := 'SELECT * FROM LOG309 WHERE ODCID = ''' + xNumOC + '''' ;

     stxTitulo1.Caption := 'Detalles de Orden de Compra' ;
     stxTitulo2.Caption := 'Requisiciones' ;

  end ;

  cds.RemoteServer := DMLOG.DCOM1 ;
  cds.ProviderName := 'prvLOG' ;
  cds.Active := False ;
  cds.DataRequest(xSQL) ;
  cds.Active := True ;

end;

procedure TFVisOCReq.Z2bbtnSalirClick(Sender: TObject);
begin
   Close ;
end;


procedure TFVisOCReq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    cdscab.AfterScroll := nil ;
    action := caHide ;
end;

procedure TFVisOCReq.FormShow(Sender: TObject);
begin
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
   Screen.Cursor:=crDefault;
   if xModoVis = 'O' then
      cdscab.AfterScroll := cdsAfterScrollOC
   else
      cdscab.AfterScroll := cdsAfterScrollReq ;
end;

end.

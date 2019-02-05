unit LOG722;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls,  wwdblook,
  wwdbdatetimepicker, ppEndUsr, ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppBands, ppCache, Mask;

type
  TFToolProvxArtDetOC = class(TForm)
    pnlTool: TPanel;
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dtpDesde: TwwDBDateTimePicker;
    dtpHasta: TwwDBDateTimePicker;
    bbtnRep2: TBitBtn;
    ppdb1: TppBDEPipeline;
    ppr1: TppReport;
    ppd1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    meArt: TMaskEdit;
    Label1: TLabel;
    cbDisenoRep: TCheckBox;
    sbDisenoRep: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnRep2Click(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolProvxArtDetOC: TFToolProvxArtDetOC;
  xAccesoBotones : Boolean;

implementation

uses LOGDM1, oaAD5000;

{$R *.DFM}

procedure TFToolProvxArtDetOC.FormCreate(Sender: TObject);
begin
   if DMLOG.cdsCia.Active=False then
      DMLOG.FiltraTabla( DMLOG.cdsCia,'TGE101','CIAID','CIAID');

   dblcCIA.LookUpField:='CIAID';
   dblcCIA.LookUpTable:=DMLOG.cdsCIA;

	dtpHasta.Date:=Date;
end;

procedure TFToolProvxArtDetOC.Timer1Timer(Sender: TObject);
begin
   //FVariables.w_NombreForma := 'FToolProvxArt';
   if (DMLOG.wAdmin='G') or (DMLOG.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMLOG.AccesosUsuariosR( DMLOG.wModulo,DMLOG.wUsuario,'2',FToolProvxArtdetOC);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

procedure TFToolProvxArtDetOC.dblcCiaExit(Sender: TObject);
begin
   edtCIA.text:=DMLOG.DisplayDescrip('prvSQL','TGE101','CIADES','CIAID='+quotedStr(dblcCIA.text),'CIADES');
end;

procedure TFToolProvxArtDetOC.bbtnRep2Click(Sender: TObject);
var
	xWhere, xOrder, xSQL, FRegDes, FRegHas : String;
  x, x10 : Integer;
begin

  xSQL:=Mtx5002.FMant.SQL;

  DMLOG.cdsReporte.Close;
  DMLOG.cdsReporte.DataRequest( xSQL );
  DMLOG.cdsReporte.Open;

  if DMLOG.cdsReporte.RecordCount=0 then
  begin
      Raise Exception.Create('No existen Registros a mostrar');
  end;

  ppdb1.DataSource:=DMLOG.dsReporte;
  ppR1.DataPipeline:=ppdb1;
  ppR1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\ComprasxProveedorDetOC.rtm' ;
  ppR1.template.LoadFromFile;

  if cbDisenoRep.Checked then
     ppd1.showmodal
  else
  begin
     ppR1.Print;

     ppR1.Stop;
     ppdb1.DataSource:=nil;

     x10:=Self.ComponentCount-1;
     while x10>=0 do
     begin
        if Self.Components[ x10 ].ClassName='TppGroup' then
        begin
           Self.Components[ x10 ].Free ;
        end;
        x10:=x10-1;
     end;
  end;
end;


procedure TFToolProvxArtDetOC.sbDisenoRepClick(Sender: TObject);
begin
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
end;

end.

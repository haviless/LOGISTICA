unit LOG505_1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFToolArtxProv_1 = class(TForm)
    pnlTool: TPanel;
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dtpDesde: TDateTimePicker;
    dtpHasta: TDateTimePicker;
    Z1sbPeriodo: TBitBtn;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Z1sbPeriodoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolArtxProv_1: TFToolArtxProv_1;
  xAccesoBotones : Boolean;

implementation

uses LOGDM1, oaAD5000;

{$R *.DFM}

procedure TFToolArtxProv_1.FormCreate(Sender: TObject);
begin
	dtpHasta.Date:=DateS;
end;

procedure TFToolArtxProv_1.Z1sbPeriodoClick(Sender: TObject);
var
	xSQL, FRegDes, FRegHas : String;
begin
  FRegDes:=quotedStr(formatdatetime(DMLOG.wFormatFecha,dtpDesde.DateTime));
  FRegHas:=quotedStr(formatdatetime(DMLOG.wFormatFecha,dtpHasta.DateTime));
  xSQL := '( B.PROFFREG>='+FRegDes+' AND B.PROFFREG<='+FRegHas+')';
  //MtxO.SetFilter(xSQL );
end;

procedure TFToolArtxProv_1.Timer1Timer(Sender: TObject);
begin
   //FVariables.w_NombreForma := 'FToolArtxProv';
   if (DMLOG.wAdmin='S') or (DMLOG.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMLOG.AccesosUsuariosR( DMLOG.wModulo,DMLOG.wUsuario,'2',FToolArtxProv_1);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

end.

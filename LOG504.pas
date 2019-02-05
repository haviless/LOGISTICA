unit LOG504;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ComCtrls, StdCtrls, ExtCtrls;

type
  TFToolDetMov = class(TForm)
    pnlTool: TPanel;
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dtpDesde: TDateTimePicker;
    dtpHasta: TDateTimePicker;
    Z1sbPeriodo: TBitBtn;
    Timer1: TTimer;
    procedure Z1sbTomaInvClick(Sender: TObject);
    procedure Z1sbResulInvClick(Sender: TObject);
    procedure Z1sbPeriodoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolDetMov: TFToolDetMov;
  xAccesoBotones : Boolean;

implementation

uses oaAD5000, LOGDM1;

{$R *.DFM}

procedure TFToolDetMov.Z1sbTomaInvClick(Sender: TObject);
begin
	FADConsultas.wCualODCReq:='ODC';
end;

procedure TFToolDetMov.Z1sbResulInvClick(Sender: TObject);
begin
	FADConsultas.wCualODCReq:='REQ';
end;

procedure TFToolDetMov.Z1sbPeriodoClick(Sender: TObject);
var
	xVar, xSQL, FRegDes, FRegHas : String;
begin
	if FADConsultas.wCualODCReq = 'ODC' then
   begin
      FRegDes:=quotedStr(formatdatetime(DMLOG.wFormatFecha,dtpDesde.DateTime));
      FRegHas:=quotedStr(formatdatetime(DMLOG.wFormatFecha,dtpHasta.DateTime));
      xSQL := '( C.ODCFREG>='+FRegDes+' AND C.ODCFREG<='+FRegHas+')';
      Mtx5000.SetFilter(xSQL );
   end
   else
   if FADConsultas.wCualODCReq = 'REQ' then
   begin
	   FRegDes:=quotedStr(formatdatetime(DMLOG.wFormatFecha,dtpDesde.DateTime));
      FRegHas:=quotedStr(formatdatetime(DMLOG.wFormatFecha,dtpHasta.DateTime));
      xSQL := '( C.RQSFREG>='+FRegDes+' AND C.RQSFREG<='+FRegHas+')';
      Mtx5000.SetFilter(xSQL );
   end;
   xVar:=Mtx5000.FMant.SQL;
end;

procedure TFToolDetMov.FormCreate(Sender: TObject);
begin
	dtpHasta.Date:=Date;
end;

procedure TFToolDetMov.Timer1Timer(Sender: TObject);
begin
   //FVariables.w_NombreForma := 'FToolDetMov';
   if (DMLOG.wAdmin='G') or (DMLOG.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMLOG.AccesosUsuariosR( DMLOG.wModulo,DMLOG.wUsuario,'2',FToolDetMov);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

end.

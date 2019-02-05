unit LOG120A;
// Inicio Uso Estándares: 01/08/2011
// Unidad               : LOG120A
// Formulario           : FTicketHistorico
// Fecha de Creación    : 09/09/2016
// Autor                : Ricardo Medina.
// Objetivo             : Historial de creación de Texto de los Tickets
// Actualizaciones      :
// HPC_201601_COB       : Creación de formulario

//Inicio HPC_201601_COB
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Wwkeycb, Buttons;

type
  TfTicketHistorico = class(TForm)
    GroupBox1: TGroupBox;
    dbgHistorico: TwwDBGrid;
    Label1: TLabel;
    IBuscar: TwwIncrementalSearch;
    btnSalir: TBitBtn;
    procedure dbgHistoricoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTicketHistorico: TfTicketHistorico;

implementation


{$R *.dfm}
Uses LOGDM1,LOG120;


procedure TfTicketHistorico.dbgHistoricoDblClick(Sender: TObject);
begin
 FTextoTickets.vmodo :='H' ;
 CLOSE;
end;

procedure TfTicketHistorico.FormCreate(Sender: TObject);
begin
   ibuscar.SearchField := 'LINEA';
  dbgHistorico.Selected.Clear;
  dbgHistorico.Selected.Add('CODTEX'#9'10'#9'CÓDIGO'#9#9);
  dbgHistorico.Selected.Add('REFERENCIA'#9'32'#9'REFERENCIA'#9#9);
  dbgHistorico.Selected.Add('ACTIVO'#9'2'#9'ACT'#9#9);
  dbgHistorico.Selected.Add('FECINI'#9'10'#9'F.INICIO'#9#9);
  dbgHistorico.Selected.Add('FECFIN'#9'10'#9'F.FINAL'#9#9);
  dbgHistorico.Selected.Add('USUCRE'#9'10'#9'USU.CREA'#9#9);
  dbgHistorico.Selected.Add('FECCRE'#9'10'#9'FEC.CREA'#9#9);
end;

procedure TfTicketHistorico.btnSalirClick(Sender: TObject);
begin
 close;
 FTextoTickets.vmodo :='N';
end;

end.
//Final HPC_201601_COB

Unit LOG121;
// Inicio Uso Estándares: 01/08/2011
// Unidad               : LOG120A
// Formulario           : FTicketHistorico
// Fecha de Creación    : 09/09/2016
// Autor                : Ricardo Medina.
// Objetivo             : Historial de creación de Texto de los Tickets
// Actualizaciones      :
// HPC_201601_LOG       : Creación de formulario

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Wwkeycb, Buttons;

Type
   TfTicketHistorico = Class(TForm)
      GroupBox1: TGroupBox;
      dbgHistorico: TwwDBGrid;
      Label1: TLabel;
      IBuscar: TwwIncrementalSearch;
      btnSalir: TBitBtn;
      Procedure dbgHistoricoDblClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure btnSalirClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   fTicketHistorico: TfTicketHistorico;

Implementation

{$R *.dfm}
Uses LOGDM1, LOG120;

Procedure TfTicketHistorico.dbgHistoricoDblClick(Sender: TObject);
Begin
   FTextoTickets.vmodo := 'H';
   CLOSE;
End;

Procedure TfTicketHistorico.FormCreate(Sender: TObject);
Begin
   ibuscar.SearchField := 'LINEA';
   dbgHistorico.Selected.Clear;
   dbgHistorico.Selected.Add('CODTEX'#9'10'#9'CÓDIGO'#9#9);
   dbgHistorico.Selected.Add('REFERENCIA'#9'32'#9'REFERENCIA'#9#9);
   dbgHistorico.Selected.Add('ACTIVO'#9'2'#9'ACT'#9#9);
   dbgHistorico.Selected.Add('FECINI'#9'10'#9'F.INICIO'#9#9);
   dbgHistorico.Selected.Add('FECFIN'#9'10'#9'F.FINAL'#9#9);
   dbgHistorico.Selected.Add('USUCRE'#9'10'#9'USU.CREA'#9#9);
   dbgHistorico.Selected.Add('FECCRE'#9'10'#9'FEC.CREA'#9#9);
End;

Procedure TfTicketHistorico.btnSalirClick(Sender: TObject);
Begin
   close;
   FTextoTickets.vmodo := 'N';
End;

End.


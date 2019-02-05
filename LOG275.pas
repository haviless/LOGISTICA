Unit LOG275;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG275
//Formulario               : FreferenciaOT
//Fecha de Creación        : 31/11/2013
//Autor                    : Ricardo Medina Zavaleta
//Objetivo                 : Formulario que muestra las Cotizaciones Ganadoras
//Actualizaciones          :
//HPC_201306_LOG           : Inicio de Formulario

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons;

Type
   TFreferenciaOT = Class(TForm)
      dbgReferencia: TwwDBGrid;
      BitBtn1: TBitBtn;
      Procedure FormCreate(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FreferenciaOT: TFreferenciaOT;

Implementation
Uses LOGDM1, LOG228;
{$R *.dfm}

Procedure TFreferenciaOT.FormCreate(Sender: TObject);
Begin
   dbgReferencia.Selected.Clear;
   dbgReferencia.Selected.Add('NUMCC'#9'10'#9'Cdr.Comp.'#9'F');
   dbgReferencia.Selected.Add('FECHA'#9'10'#9'Fecha'#9'F');
   dbgReferencia.Selected.Add('PROFORMA'#9'10'#9'Proforma'#9'F');
   dbgReferencia.Selected.Add('ESTADO'#9'10'#9'Condición'#9'F');
   dbgReferencia.Selected.Add('OBSERVACION'#9'50'#9'Observación'#9'F');
   dbgReferencia.Selected.Add('USUREG'#9'15'#9'Usu.Reg.'#9'F');
   dbgReferencia.DataSource := DMLOG.dsProformaLista;
End;

Procedure TFreferenciaOT.BitBtn1Click(Sender: TObject);
Begin
   FRegOrdCD.edtNumReferencia.Text := DMLOG.cdsProformaLista.FieldByname('PROFORMA').AsString;
   FRegOrdCD.EdtDescripReferencia.Text := DMLOG.cdsProformaLista.FieldByname('OBSERVACION').AsString;
   close;
End;

End.



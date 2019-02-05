Unit LOG130A;
// Inicio Uso Estándares: 01/08/2011
// Unidad               : LOG130A
// Formulario           : TfLstCtaBancaria
// Fecha de Creación    : 28/08/2017
// Autor                : Jesús Castillo Pampas
// Objetivo             : Creación de formulario para listar las cuentas bancarias del proveedor
// Actualizaciones      :
// HPC_201701_LOG        : Creación del Formulario

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid;

Type
   TfLstCtaBancaria = Class(TForm)
      dbgCtaBancaria: TwwDBGrid;
      Procedure dbgCtaBancariaDblClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   fLstCtaBancaria: TfLstCtaBancaria;

Implementation
Uses LOGDM1, LOG130;
{$R *.dfm}

Procedure TfLstCtaBancaria.dbgCtaBancariaDblClick(Sender: TObject);
Begin
   FOrdenPago.dblcBanco.Enabled := true;
   FOrdenPago.dbeBanco.Enabled := true;
   FOrdenPago.dblcTMon.Enabled := true;
   FOrdenPago.edtTMon.Enabled := true;
   FOrdenPago.dbeCtaCte.Enabled := true;
   FOrdenPago.dbeCodCtaInt.Enabled := true;

   FOrdenPago.dblcBanco.Text := DMLOG.cdsCtaBancaria.FieldbyName('BANCOID').AsString;
   FOrdenPago.dblcBancoExit(self);
   FOrdenPago.dblcTMon.Text := DMLOG.cdsCtaBancaria.FieldbyName('TMONID').AsString;
   FOrdenPago.dblcTMonExit(self);
   FOrdenPago.dbeCtaCte.Text := DMLOG.cdsCtaBancaria.FieldbyName('CCBCOID').AsString;
   FOrdenPago.dbeCodCtaInt.Text := DMLOG.cdsCtaBancaria.FieldbyName('CODBCOCCI').AsString;

   FOrdenPago.dblcBanco.Enabled := false;
   FOrdenPago.dbeBanco.Enabled := false;
   FOrdenPago.dblcTMon.Enabled := false;
   FOrdenPago.edtTMon.Enabled := false;
   FOrdenPago.dbeCtaCte.Enabled := false;
   FOrdenPago.dbeCodCtaInt.Enabled := false;

   close;
End;

Procedure TfLstCtaBancaria.FormCreate(Sender: TObject);
Begin
   dbgCtaBancaria.Selected.Clear;
   dbgCtaBancaria.Selected.Add('BANCONOM'#9'15'#9'Banco'#9'F');
   dbgCtaBancaria.Selected.Add('TMONID'#9'5'#9'T. Moneda'#9'F');
   dbgCtaBancaria.Selected.Add('CCBCOID'#9'15'#9'Cta. Bancaria'#9'F');
   dbgCtaBancaria.Selected.Add('CODBCOCCI'#9'20'#9'CCI'#9'F');
   dbgCtaBancaria.DataSource := DMLOG.dsCtaBancaria;
End;

End.


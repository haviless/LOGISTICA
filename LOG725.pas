Unit LOG725;
//*********************************************************
// CREADO POR            : Abelardo Sulca Palomino
// Nº HPP                : HPP_201105_LOG
// FECHA DE CREACION     : 23/06/2011
// DESCRIPCION           : Esta ventana permite visualizar el reporte de Ordenes de Pago
//                         registradas en el sistema
//*********************************************************
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Buttons;

Type
   TFToolOrdenPago = Class(TForm)
      pnlAct: TPanel;
      Z2bbtn_RptOrdenPago: TBitBtn;
      Z2bbtn_Pagos: TBitBtn;
      BitBtn1: TBitBtn;
      Procedure Z2bbtn_RptOrdenPagoClick(Sender: TObject);
      Procedure Z2bbtn_PagosClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolOrdenPago: TFToolOrdenPago;

Implementation
Uses LOG726, LOG727, LOG131, oaAD3100;
{$R *.dfm}

Procedure TFToolOrdenPago.Z2bbtn_RptOrdenPagoClick(Sender: TObject);
Begin
   Try
      FRptOrdenPago := TFRptOrdenPago.Create(Application); // LOG726
      FRptOrdenPago.ShowModal;
   Finally
      FRptOrdenPago.Free;
   End;
End;

Procedure TFToolOrdenPago.Z2bbtn_PagosClick(Sender: TObject);
Begin
   Try

      FPagosDocumentos := TFPagosDocumentos.Create(Application); // LOG727
      FPagosDocumentos.xs_compania := Mtx3100.FMant.cds2.FieldbyName('CPCIAID').AsString;
      FPagosDocumentos.xs_proveedor := Mtx3100.FMant.cds2.FieldbyName('PROV').AsString;
      FPagosDocumentos.xs_documento := Mtx3100.FMant.cds2.FieldbyName('DOCID').AsString;
      FPagosDocumentos.xs_serie := Mtx3100.FMant.cds2.FieldbyName('CPSERIE').AsString;
      FPagosDocumentos.xs_numero := Mtx3100.FMant.cds2.FieldbyName('CPNODOC').AsString;

      FPagosDocumentos.ShowModal;
   Finally
      FPagosDocumentos.Free;
   End;
End;

Procedure TFToolOrdenPago.BitBtn1Click(Sender: TObject);
Begin
   Try

      If Mtx3100.FMant.cds2.RecordCount = 0 Then
      Begin
         ShowMessage('No se seleccionó Orden de Compra');
         Exit;
      End;
      If Mtx3100.FMant.cds2.FieldbyName('ORDPAGEST').AsString <> 'INICIAL' Then
      Begin
         ShowMessage('El estado de Registro de las Ordenes de Pago no está en estado INICIAL');
         Exit;
      End;

      FOrdenPago_CerrarOC := TFOrdenPago_CerrarOC.Create(Application); // LOG131
      FOrdenPago_CerrarOC.xCia := Mtx3100.FMant.cds2.FieldbyName('OC_COMPANIA').AsString;
      FOrdenPago_CerrarOC.xNumOrdenCompra := Mtx3100.FMant.cds2.FieldbyName('ODCID').AsString;
      FOrdenPago_CerrarOC.ShowModal;
   Finally
      FOrdenPago_CerrarOC.Free;
   End;
End;

End.


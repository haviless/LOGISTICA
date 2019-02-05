unit LOG700;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, wwdblook, Wwdbdlg, Buttons;

type
  TFToolArti = class(TForm)
    pnlTools: TPanel;
    dbcldArti: TwwDBLookupComboDlg;
    edtArti: TEdit;
    dbePUnit: TEdit;
    Z2bbtnRegOk: TBitBtn;
    Z2bbtnRegCanc: TBitBtn;
    z1sbExporta: TBitBtn;
    lblArticulo: TLabel;
    lblPrecioCompra: TLabel;
    Timer1: TTimer;
    procedure z1sbExportaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   FToolArti: TFToolArti;
   xSQL : String;
   xAccesoBotones : Boolean;

implementation

uses LOGDM1, LOG229;

{$R *.DFM}

procedure TFToolArti.z1sbExportaClick(Sender: TObject);
begin
	FActPCompra := TFActPCompra.Create(self);
	Try
		FActPCompra.ShowModal;
	Finally
		FActPCompra.Free;
	End;
end;

procedure TFToolArti.Timer1Timer(Sender: TObject);
begin
   //FVariables.w_NombreForma := 'FToolArti';
   if (DMLOG.wAdmin='G') or (DMLOG.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMLOG.AccesosUsuariosR( DMLOG.wModulo,DMLOG.wUsuario,'2',FToolArti);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

end.


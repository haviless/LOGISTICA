unit LOG509;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFToolReqAut = class(TForm)
    pnlTool: TPanel;
    bbtnOCxProf: TBitBtn;
    bbtnOCxArt: TBitBtn;
    bbtnOCxRqs: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolReqAut: TFToolReqAut;
  xAccesoBotones : Boolean;

implementation

{$R *.DFM}

procedure TFToolReqAut.FormShow(Sender: TObject);
begin
   FVariables.w_NombreForma := 'FToolReqAut';
   if (DMLOG.wAdmin='G') or (DMLOG.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMLOG.AccesosUsuariosR( DMLOG.wModulo,DMLOG.wUsuario,'2',FToolReqAut);
      xAccesoBotones := True;
   end;
end;

end.

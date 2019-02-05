unit LOG216;
//*********************************************************
// MODIFICADO POR        : Abelardo Sulca Palomino
// Nº HPP                : HPP_201104_LOG
// FECHA DE MODIFICACION : 24/05/2011
// DESCRIPCION           : Se realiza correctamente la creación de la instancia
//                         de la ventana TFRegReqs para que no genere error al
//                         momento de Depurar las Ordenes de compra
//*********************************************************
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Buttons, Mant, StdCtrls, ExtCtrls, Wwdbigrd, Wwdbgrid, MsgDlgs;

type
  TFToolRqs = class(TForm)
    pnlBtn: TPanel;
    Z2bbtnGrabaRqs: TBitBtn;
    Z2bbtnGrabaOC: TBitBtn;
    pnlDepODC: TPanel;
    Timer1: TTimer;
    procedure Z2bbtnGrabaRqsClick(Sender: TObject);
    procedure Z2bbtnGrabaOCClick(Sender: TObject);
    procedure bbtnCerObsAnuClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    //grid : TwwDBGrid;
    //procedure ValidacionOEnv ;
    //procedure Validacion ;
    //procedure btnDetalle;
  public
    { Public declarations }
  end;

var
  FToolRqs: TFToolRqs;
  xAccesoBotones : Boolean;

implementation

uses oaAD4000, LOGDM1, LOG603, LOG602 ;

{$R *.DFM}

{procedure TFToolRqs.ValidacionOEnv;
begin

end;

procedure TFToolRqs.Validacion;
begin

end;}

procedure TFToolRqs.Z2bbtnGrabaRqsClick(Sender: TObject);
begin

  if Length(Trim(DMLOG.cdsReqs.FieldByName('RQSOBSDEP').AsString)) > 0 then
  begin
    FDepRqs.memObsDep.Text:=DMLOG.cdsReqs.FieldbyName('RQSOBSDEP').AsString;
    FDepRqs.bbtnAceObsAnu.Enabled:=False;
    FDepRqs.Show;
    Exit;
  end;

	if Question('Confirmar', ' Esta seguro de Depurar la(s) Requisición(es) Seleccionadas '+#13+#13+
							'Confirme para Continuar ' + #13+ #13 ) then
	begin
    FDepRqs.memObsDep.Text:='';
    FDepRqs.Show;
  end;
end;

procedure TFToolRqs.Z2bbtnGrabaOCClick(Sender: TObject);
begin
   {if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas+1; }

	xSQL:='select * from LOG304 '
        +'where CIAID='+QuotedStr(Mtx4000.FMant.cds2.FieldByName('CIAID').AsString)
		  +'  and ODCID='+QuotedStr(Mtx4000.FMant.cds2.FieldByName('ODCID').AsString);
   DMLOG.cdsOrdComp.Close;
   DMLOG.cdsOrdComp.IndexFieldNames:='';
   DMLOG.cdsOrdComp.Filter:='';
   DMLOG.cdsOrdComp.Filtered:=False;
   DMLOG.cdsOrdComp.DataRequest(xSQL);
   DMLOG.cdsOrdComp.Open;

//INICIO ALINEACION INICIAL
{   if Length(Trim(DMLOG.cdsOrdComp.FieldByName('ODCOBSDEP').AsString)) > 0 then
   begin
      FBarrDepODC.memObsDep.Text:=DMLOG.cdsOrdComp.FieldbyName('ODCOBSDEP').AsString;
      FBarrDepODC.bbtnAceObsAnu.Enabled:=False;
      FBarrDepODC.Show;
      Exit;
   end;
}
// FDepRqs
  try
     //INICIO HPP_201104_LOG
     FBarrDepODC := TFBarrDepODC.create(Application);
     //FIN HPP_201104_LOG
     FBarrDepODC.memObsDep.Text:=DMLOG.cdsOrdComp.FieldbyName('ODCOBSDEP').AsString;
     FBarrDepODC.bbtnAceObsAnu.Enabled:=True;
     if DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString = 'DEPURADO' then
        FBarrDepODC.bbtnAceObsAnu.Enabled:=False;
     FBarrDepODC.ShowModal;
     exit;
  finally
     FBarrDepODC.Free;
  end;

{
	if Question('Confirmar', ' Esta seguro de Depurar la(s) Orden(es) de Compra Seleccionadas '+#13+#13+
							'Confirme para Continuar ' + #13+ #13 ) then
	begin
      FBarrDepODC.memObsDep.Text:='';
      FBarrDepODC.Show;
   end;
}
//FIN ALINEACION INICIAL
end;

procedure TFToolRqs.bbtnCerObsAnuClick(Sender: TObject);
begin
   Mtx4000.FMant.pnlFRegistro.Visible:=False;
end;

procedure TFToolRqs.Timer1Timer(Sender: TObject);
begin
   //FVariables.w_NombreForma := 'FToolRqs';
   if (DMLOG.wAdmin='G') or (DMLOG.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMLOG.AccesosUsuariosR( DMLOG.wModulo,DMLOG.wUsuario,'2',FToolRqs);
      xAccesoBotones := True;
      Timer1.Destroy;
   end;
end;

end.

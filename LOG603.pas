unit LOG603;
//*********************************************************
// MODIFICADO POR        : Abelardo Sulca Palomino
// Nº HPP                : HPP_201104_LOG
// FECHA DE MODIFICACION : 24/05/2011
// DESCRIPCION           : Se cambia el Uses para que trabajar con el OAaD4000
//*********************************************************
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Wwdbigrd, Wwdbgrid, MsgDlgs;

type
  TFBarrDepODC = class(TForm)
    bbtnAceObsAnu: TBitBtn;
    bbtnCerObsAnu: TBitBtn;
    memObsDep: TMemo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnAceObsAnuClick(Sender: TObject);
    procedure bbtnCerObsAnuClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure memObsDepKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    grid : TwwDBGrid;
  public
    { Public declarations }
  end;

var
  FBarrDepODC: TFBarrDepODC;
  xSQL : String;

implementation
//INICIO HPP_201104_LOG
//uses LOGDM1, oaAD3100, MsgDlgs;
uses LOGDM1, oaAD4000;
//FIN HPP_201104_LOG
{$R *.DFM}

procedure TFBarrDepODC.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
    if self.ActiveControl Is TMemo then Exit;
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFBarrDepODC.bbtnCerObsAnuClick(Sender: TObject);
begin
  Close;
end;

procedure TFBarrDepODC.bbtnAceObsAnuClick(Sender: TObject);
var
	sCIAID, sODCID, sSQL : String;
  i : Integer;
begin
  if Length(Trim(memObsDep.Text)) = 0 then
  begin
    ErrorMsg('Adquisiciones', 'Tiene que Ingresar una Observación para Poder Continuar');
    Exit;
  end;

	if Question('Confirmar', ' Esta seguro de Cancelar la(s) Ordenes de Compra Seleccionadas '+#13+#13+
							'Confirme para Continuar ' + #13+ #13 ) then
	begin
    //INICIO HPP_201104_LOG
    //Grid := Mtx3100.FMant.dbgFiltro;
    Grid := Mtx4000.FMant.dbgFiltro;
    //FIN HPP_201104_LOG
    for i:= 0 to grid.SelectedList.Count-1 do
    begin
      Grid.Datasource.Dataset.GotoBookmark(Grid.SelectedList.items[i]);
      //Grid.Datasource.Dataset.Freebookmark(Grid.SelectedList.items[i]);
      sCIAID := Grid.Datasource.Dataset.FieldByName('CIAID').AsString;
      sODCID := Grid.Datasource.Dataset.FieldByName('ODCID').AsString;

      if Grid.Datasource.Dataset.FieldByName('ODCEST').AsString <> 'DEPURADO' then
      begin
        sSQL:= 'UPDATE LOG305 SET ODCEST=''DEPURADO'' WHERE CIAID='''+
               sCIAID+''' AND ODCID='''+sODCID+''' AND (DODCCSLD > 0 OR DODCCSLDU > 0)';
        Try
          DMLOG.ExecSQL( sSQL );
        Except
        end;

        DMLOG.cdsOrdComp.Edit;
        DMLOG.cdsOrdComp.FieldByName('ODCEST').AsString   := 'DEPURADO';
        DMLOG.cdsOrdComp.FieldByName('ODCDEPURA').AsString:= DMLOG.wUsuario;
        DMLOG.cdsOrdComp.FieldByName('ODCFATE').AsString  := xFec_Sis;
        DMLOG.cdsOrdComp.FieldByName('ODCOBSDEP').AsString:= Trim(copy(memObsDep.Text,1,100));

        {if ( SRV_D = 'DB2NT' ) or ( SRV_D = 'DB2400' ) then
          DMLOG.cdsOrdComp.FieldByName('URQANUHREG').AsString:= xHor_Sis
        else
        if SRV_D = 'ORACLE' then
          DMLOG.cdsOrdComp.FieldByName('URQANUHREG').AsString:= xHor_Sis;}

        DMLOG.cdsPost(DMLOG.cdsOrdComp);
        DMLOG.cdsOrdComp.Post;

        xSQL:=	'SELECT * FROM LOG304 '+
        			'WHERE CIAID='+QuotedStr(sCIAID)+' '+
               'AND ODCID='+QuotedStr(sODCID);
        DMLOG.cdsOrdComp.DataRequest(xSQL);

	     DMLOG.ControlTran( 9, DMLOG.cdsOrdComp,  'ORDCOMP');
        {sSQL:='UPDATE LOG304 '
             +'SET ODCEST=''DEPURADO'', ODCFATE='+DMLOG.wRepFecServi+', ODCDEPURA='+QuotedStr(DMLOG.wUsuario)
             +', ODCOBSDEP='+QuotedStr(Trim(copy(memObsDep.Text,1,100)))+' '
             +'WHERE CIAID='''+sCIAID+''' AND ODCID='''+sODCID+'''';
        Try
          DMLOG.ExecSQL( sSQL );
        Except
        end;}
      end;
    end;
    grid.SelectedList.clear;
    Screen.Cursor:=crDefault;
    //Mtx.FMant.cds2.Refresh;
    Close;
  end
	else
	begin
		//grid.SelectedList.clear;
	end;
end;

procedure TFBarrDepODC.FormActivate(Sender: TObject);
begin
   if SRV_D = 'DB2400' then
      xSQL:='SELECT CURRENT DATE FECHA, CURRENT TIME HORA FROM TGE901';
   if SRV_D = 'DB2NT' then
     xSQL:='SELECT '+Quotedstr(formatdatetime(DMLOG.wFormatFecha,Date))+' "FECHA", '+DMLOG.wRepHorServi+' HORA FROM TGE901'
   else
   if SRV_D = 'ORACLE' then
     xSQL:='SELECT '+wRepFuncChar+DMLOG.wRepFecServi+', '+QuotedStr(DMLOG.wFormatFecha)+') "FECHA", '+DMLOG.wRepFecServi+' HORA FROM DUAL';

   DMLOG.cdsReporte.Close;
   DMLOG.cdsReporte.DataRequest(xSQL);
   DMLOG.cdsReporte.Open;
   xFec_Sis := DMLOG.cdsReporte.FieldByName('FECHA').AsString;
   xHor_Sis := DMLOG.cdsReporte.FieldByName('HORA').AsString;

  	memObsDep.SetFocus;
end;

procedure TFBarrDepODC.memObsDepKeyPress(Sender: TObject; var Key: Char);
var
  sC : String;
begin
  sC := Key;
  sC := Uppercase(sC);
  Key:= sC[1];
end;

procedure TFBarrDepODC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action  := CAFree;

end;

procedure TFBarrDepODC.FormShow(Sender: TObject);
begin
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.

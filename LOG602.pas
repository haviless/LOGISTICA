unit LOG602;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Wwdbigrd, Wwdbgrid, MsgDlgs;

type
  TFDepRqs = class(TForm)
    bbtnAceObsAnu: TBitBtn;
    bbtnCerObsAnu: TBitBtn;
    memObsDep: TMemo;
    procedure bbtnCerObsAnuClick(Sender: TObject);
    procedure bbtnAceObsAnuClick(Sender: TObject);
    procedure memObsDepKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    grid : TwwDBGrid;    
  public
    { Public declarations }
  end;

var
  FDepRqs: TFDepRqs;

implementation

uses LOGDM1, oaAD4000;

{$R *.DFM}

procedure TFDepRqs.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
    if self.ActiveControl Is TMemo then Exit;
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFDepRqs.bbtnCerObsAnuClick(Sender: TObject);
begin
  Close;
end;

procedure TFDepRqs.bbtnAceObsAnuClick(Sender: TObject);
var
	sCIAID, sRQSID, sLOCID, sSQL : String;
	i : Integer;
begin
  if Length(Trim(memObsDep.Text)) = 0 then
  begin
    ErrorMsg('Adquisiciones', 'Tiene que Ingresar una Observación para Poder Continuar');
    Exit;
  end;

	if Question('Confirmar', ' Esta seguro de Cancelar la(s) Requisición(es) Seleccionadas '+#13+#13+
							'Confirme para Continuar ' + #13+ #13 ) then
	begin
		Grid := Mtx4000.FMant.dbgFiltro;
		for i:= 0 to grid.SelectedList.Count-1 do
		begin
			grid.datasource.dataset.GotoBookmark(grid.SelectedList.items[i]);
			//grid.datasource.dataset.Freebookmark(grid.SelectedList.items[i]);
			sCIAID := Grid.Datasource.Dataset.FieldByName('CIAID').AsString;
			sLOCID := Grid.Datasource.Dataset.FieldByName('LOCID').AsString;
			sRQSID := Grid.Datasource.Dataset.FieldByName('RQSID').AsString;
      if Grid.Datasource.Dataset.FieldByName('RQSEST').AsString <> 'DEPURADO' then
			begin
      	sSQL:='UPDATE LOG309 SET RQSEST=''DEPURADO'' '+
              'WHERE CIAID='+QuotedStr(sCIAID)+' '+
              'AND RQSID='+QuotedStr(sRQSID)+' '+
              'AND LOCID='+QuotedStr(sLOCID);
        try
      		DMLOG.ExecSQL( sSQL );
        Except
        end;

		    Screen.Cursor:=crHourGlass;
        DMLOG.cdsReqs.Edit;
        DMLOG.cdsReqs.FieldByName('RQSEST').AsString   := 'DEPURADO';
        DMLOG.cdsReqs.FieldByName('RQSDEPURA').AsString:= DMLOG.wUsuario;
        DMLOG.cdsReqs.FieldByName('RQSFATE').AsString  := xFec_Sis;
        DMLOG.cdsReqs.FieldByName('RQSOBSDEP').AsString:= Trim(copy(memObsDep.Text,1,100));

        DMLOG.cdsPost(DMLOG.cdsReqs);
        DMLOG.cdsReqs.Post;

        xSQL:=	'SELECT * FROM LOG308 '+
        			'WHERE CIAID='+QuotedStr(sCIAID)+' '+
              	'AND RQSID='+QuotedStr(sRQSID)+' '+
              	'AND LOCID='+QuotedStr(sLOCID);
        DMLOG.cdsReqs.DataRequest(xSQL);

	     DMLOG.ControlTran( 9, DMLOG.cdsReqs, 'DREQS' );

      	{sSQL:='UPDATE LOG308 '
             +'SET RQSEST=''DEPURADO'', RQSFATE='+DMLOG.wRepFecServi+', RQSDEPURA='+QuotedStr(DMLOG.wUsuario)
             +', RQSOBSDEP='+QuotedStr(Trim(copy(memObsDep.Text,1,100)))+' '
             +'WHERE CIAID='''+sCIAID+''' AND RQSID='''+sRQSID+''' AND LOCID='''+sLOCID+'''';
        try
      		DMLOG.ExecSQL( sSQL );
        Except
        End;}

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

procedure TFDepRqs.FormActivate(Sender: TObject);
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

procedure TFDepRqs.memObsDepKeyPress(Sender: TObject; var Key: Char);
var
  sC : String;
begin
  sC := Key;
  sC := Uppercase(sC);
  Key:= sC[1];
end;

procedure TFDepRqs.FormShow(Sender: TObject);
begin
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.

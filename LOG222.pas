unit LOG222;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Wwkeycb, MsgDlgs;

type
  TFArtOCxReqsTot = class(TForm)
    pnlArtPend: TPanel;
    pnlDetRqs: TPanel;
    Panel2: TPanel;
    bbtnCerrar: TBitBtn;
    bbtnAceptar: TBitBtn;
    pnlTitulo5: TPanel;
    dbgArtPend: TwwDBGrid;
    dbgRqsArtX: TwwDBGrid;
    pnlOrden: TPanel;
    lblBusca: TLabel;
    Bevel2: TBevel;
    isBusca: TwwIncrementalSearch;
    btnSalir: TBitBtn;
    procedure bbtnAceptarClick(Sender: TObject);
    procedure bbtnCerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgArtPendEnter(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure dbgArtPendTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FArtOCxReqsTot: TFArtOCxReqsTot;

implementation

uses LOGDM1;

{$R *.DFM}

procedure TFArtOCxReqsTot.bbtnAceptarClick(Sender: TObject);
begin
  if dbgArtPend.DataSource.DataSet.RecordCount = 0 then
  begin
    ErrorMsg('Adquisiciones',  ' No hay Requisiciones por Atender ' );
		ModalResult := mrCancel;
    Exit;
  end;
  if dbgRqsArtX.DataSource.DataSet.RecordCount = 0 then
  begin
    ErrorMsg('Adquisiciones',  ' No hay Items a Transferir en esta Requisición ' );
		//ModalResult := mrCancel;
    Exit;
  end;
  if Length(Trim(DMLOG.cdsArtPendXTot.FieldByName('RQSVISADOR').AsString)) = 0 then
  begin
    ErrorMsg('Adquisiciones',  ' La Requisición no ha Sido Visada, Solo la Puede Visualizar como Referencia ' );
		//ModalResult := mrCancel;
  	Exit;
  end;
  ModalResult := mrOK;
end;

procedure TFArtOCxReqsTot.bbtnCerrarClick(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TFArtOCxReqsTot.FormActivate(Sender: TObject);
begin
	pnlOrden.Visible:=False;
	isBusca.Text:='';
  dbgArtPend.SetFocus;
end;

procedure TFArtOCxReqsTot.dbgArtPendEnter(Sender: TObject);
begin
	DMLOG.cdsArtPendXTot.IndexFieldNames:='';
	pnlOrden.Visible:=False;
end;

procedure TFArtOCxReqsTot.btnSalirClick(Sender: TObject);
begin
	pnlOrden.Visible := False;
end;

procedure TFArtOCxReqsTot.dbgArtPendTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   lblBusca.Caption:='XX';
   if AfieldName='RQSID' then
   begin
      DMLOG.cdsArtPendXTot.IndexFieldNames:='RQSID';
      lblBusca.Caption:='Busca por Requisición:';
      isBusca.SearchField:='RQSID';
   end;
   if AfieldName='CCOSDES' then
   begin
      DMLOG.cdsArtPendXTot.IndexFieldNames:='CCOSDES';
      lblBusca.Caption:='Busca por Centro de Costo:';
      isBusca.SearchField:='CCOSDES';
   end;
   if lblBusca.Caption<>'XX' then
   begin
      dbgArtPend.RefreshDisplay;
      pnlOrden.Visible := True;
      isBusca.Text:='';
      isBusca.SetFocus;
   end
   else
   begin
      pnlOrden.Visible := False;
      DMLOG.cdsArtPendXTot.IndexFieldNames:='';
   end
end;

{ artpendx
SELECT A.CIAID, B.ARTID, B.UNMIDG, B.UNMIDU, B.RQSFLAGUM,
B.RQSMARK, SUBSTR(B.DRQSOBS,1,50) AS ARTDES, B.TIPOADQ, 
SUM('+DMLOG.wReplacCeros+'(B.DRQSCNSG,0)) AS RXACNTSG, 
SUM('+DMLOG.wReplacCeros+'(B.DRQSCNAG,0)) AS RXACNTAG, 
SUM('+DMLOG.wReplacCeros+'(B.DRQSCNSG,0)-'+DMLOG.wReplacCeros+'(B.DRQSCNAG,0)) AS RXASALDOG, 
SUM('+DMLOG.wReplacCeros+'(B.DRQSCNSU,0)) AS RXACNTSU, SUM('+DMLOG.wReplacCeros+'(B.DRQSCNAU,0)) AS RXACNTAU,
SUM('+DMLOG.wReplacCeros+'(B.DRQSCNSU,0)-'+DMLOG.wReplacCeros+'(B.DRQSCNAU,0)) AS RXASALDOU 
FROM LOG308 A INNER JOIN  LOG309 B ON ( A.CIAID=B.CIAID AND A.RQSID=B.RQSID ) left join TGE205 ON (B.ARTID = TGE205.ARTID) 
WHERE (( A.RQSEST='ACEPTADO' ) OR ( A.RQSEST='PARCIAL')) 
AND ( ('+DMLOG.wReplacCeros+'(B.DRQSCNSG,0)-'+DMLOG.wReplacCeros+'(B.DRQSCNAG,0)>0) OR ('+DMLOG.wReplacCeros+'(B.DRQSCNSU,0)-'+DMLOG.wReplacCeros+'(B.DRQSCNAU,0)>0) ) 
AND ( NOT A.RQSVISADOR IS NULL ) 
AND A.CIAID='01' 
GROUP BY  A.CIAID, B.ARTID, B.RQSFLAGUM, B.UNMIDG, B.UNMIDU, B.RQSMARK, SUBSTR(B.DRQSOBS,1,50), B.TIPOADQ

}

{ qryrqsartx
SELECT B.CIAID, B.RQSID, B.DRQSID, B.ARTID, B.RQSFLAGUM, 
B.DRQSCNSG, B.DRQSCNAG, B.TIPOADQ,  B.UNMIDG, B.DRQSCNSU, 
B.DRQSCNAU, B.UNMIDU, A.RQSFREQ, A.CCOSID, A.PRIOID,  
A.RQSSOLI, A.RQSAUTOR, A.RQSAPRO, A.RQSEST, A.RQSFATE, A.RQSFREG, A.LOCID,  C.GRARID, D.CCOSDES, G.UNMDES UNMGDES, H.UNMDES UNMUDES, substr(B.DRQSOBS,1,50) as ARTDES FROM LOG309 B LEFT JOIN LOG308 A ON (A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.RQSID=B.RQSID) LEFT JOIN TGE205 C ON ( B.ARTID  = C.ARTID ) LEFT JOIN TGE203 D ON ( A.CCOSID = D.CCOSID ) LEFT JOIN TGE130 G ON ( B.UNMIDG = G.UNMID) LEFT JOIN TGE130 H ON ( B.UNMIDU = H.UNMID) WHERE A.RQSEST <> 'ATENDIDO' AND ( '+DMLOG.wReplacCeros+'(B.DRQSCNSG,0) - '+DMLOG.wReplacCeros+'(B.DRQSCNAG,0) > 0  OR '+DMLOG.wReplacCeros+'(B.DRQSCNSU,0) - '+DMLOG.wReplacCeros+'(B.DRQSCNAU,0) > 0 ) AND B.CIAID='01'  AND ( NOT A.RQSVISADOR IS NULL ) ORDER BY SUBSTR(B.DRQSOBS,1,50)

}
procedure TFArtOCxReqsTot.FormShow(Sender: TObject);
begin
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.





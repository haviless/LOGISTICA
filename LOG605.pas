unit LOG605;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, wwdblook, Buttons, ComCtrls, Wwdbdlg, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppBands,
  ppPrnabl, ppCtrls, ppVar;

type
  TFToolReqPend = class(TForm)
    pnl: TPanel;
    bbtOk: TBitBtn;
    rgPeriodo: TRadioGroup;
    rgCondicion: TRadioGroup;
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dtpDesde: TDateTimePicker;
    dtpHasta: TDateTimePicker;
    gbLinea: TGroupBox;
    Label2: TLabel;
    dblcGrpArti: TwwDBLookupCombo;
    gbCCosto: TGroupBox;
    dblcdCCSoli: TwwDBLookupComboDlg;
    lblFAM: TLabel;
    dblcFAM: TwwDBLookupCombo;
    lblSUBFAM: TLabel;
    dblcSUBFAM: TwwDBLookupCombo;
    lblArti: TLabel;
    dbcldArti: TwwDBLookupComboDlg;
    lblTMON: TLabel;
    dblcTINID: TwwDBLookupCombo;
    gbCia: TGroupBox;
    dblcCIA: TwwDBLookupCombo;
    dbeCIA: TEdit;
    Label1: TLabel;
    dblcLOC: TwwDBLookupCombo;
    dbeLOC: TEdit;
    rgTipo: TRadioGroup;
    ppDBPCCosto: TppDBPipeline;
    ppRCCosto: TppReport;
    ppDBPArt: TppDBPipeline;
    ppRArt: TppReport;
    edtCCostoSoli: TEdit;
    ppHeaderBand2: TppHeaderBand;
    pplblTitulo2: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    pplblCia2: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLine2: TppLine;
    ppLabel23: TppLabel;
    ppDBText8: TppDBText;
    pplblUsuario2: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppDBText11: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand2: TppFooterBand;
    pplblRango2: TppLabel;
    ppDBText15: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    pplblTitulo: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    pplblCia: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    pplblCCosDes: TppLabel;
    pplblUsuario: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    pplblRango: TppLabel;
    Timer1: TTimer;
    procedure bbtOkClick(Sender: TObject);
    procedure rgCondicionClick(Sender: TObject);
    procedure dblcGrpArtiEnter(Sender: TObject);
    procedure dblcFAMEnter(Sender: TObject);
    procedure dblcSUBFAMEnter(Sender: TObject);
    procedure dbcldArtiEnter(Sender: TObject);
    procedure dblcdCCSoliEnter(Sender: TObject);
    procedure rgCondicionExit(Sender: TObject);
    procedure dblcTINIDEnter(Sender: TObject);
    procedure dblcCIAExit(Sender: TObject);
    procedure dblcLOCEnter(Sender: TObject);
    procedure dblcLOCExit(Sender: TObject);
    procedure dblcdCCSoliExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolReqPend: TFToolReqPend;
  xAccesoBotones : Boolean;

implementation

uses LOGDM1, oaAD5000, DBClient;

{$R *.DFM}

procedure TFToolReqPend.bbtOkClick(Sender: TObject);
var
   sSQL : string;
	sDesde, sHasta,sTitulo : String;
begin

    if length(dblcCIA.text)=0 then
       raise exception.Create('Ingrese Compañia');

    if length(dblcLOC.text)=0 then
       raise exception.Create('Ingrese Localidad');


    if rgCondicion.ItemIndex= 0 then  //Linea
    begin
      if ((length(dblcTINID.text)=0) or (length(dblcGrpArti.text)=0) or (length(dblcFAM.text)=0)
            or (length(dblcSUBFAM.text)=0)) and (length(dbcldArti.text)=0) then
         raise exception.Create('Ingrese el Código del Artículo');
    end
    else
      if rgCondicion.ItemIndex= 1 then //CCosto
      begin
         if length(dblcdCCSoli.text)=0 then
            raise exception.Create('Ingrese un Centro de Costo');
      end;
    if dtpDesde.DateTime>dtpHasta.DateTime then
       raise exception.Create('La Fecha Inicial no puede ser mayor a la Final');

    sDesde:=quotedStr(formatdatetime(DMLOG.wFormatFecha,dtpDesde.DateTime));
    sHasta:=quotedStr(formatdatetime(DMLOG.wFormatFecha,dtpHasta.DateTime));

    if rgCondicion.ItemIndex= 0 then   //POR ARTICULO
    begin
      if rgTipo.ItemIndex=0 then //DETALLADO
      begin
         sSQL:= ' SELECT  A.CCOSID,D.CCOSDES,A.ARTID,C.ARTDES,C.UNMIDG, '
               +' A.DURQCNAG,A.DURQCNAU,A.DURQCNATG,A.DURQCNATU,'
               +' A.DURQCNSLG,A.DURQCNSLU, A.URQID, B.URQFREG '
               +' FROM LOG307 A , LOG306 B, TGE205 C, TGE203 D '
               +' WHERE (B.CIAID=A.CIAID AND B.LOCID=A.LOCID AND B.CCOSID=A.CCOSID AND B.URQID=A.URQID) '
               +' AND (C.CIAID(+)=A.CIAID AND C.ARTID(+)=A.ARTID) '
               +' AND D.CCOSID=A.CCOSID'
               +' AND A.CIAID='+Quotedstr(dblcCIA.text)
               +' AND A.LOCID='+Quotedstr(dblcLOC.text);
         if length(dblcGrpArti.text)>0 then
            sSQL:= sSQL+' AND C.GRARID='+Quotedstr(dblcGrpArti.Text);
         if length(dblcFAM.text)>0 then
            sSQL:= sSQL+' AND C.FAMID='+Quotedstr(dblcFAM.Text);
         if length(dbcldArti.text)>0 then
            sSQL:= sSQL+' AND C.ARTID='+Quotedstr(dbcldArti.Text);

         sSQL:= sSQL+' AND (B.URQEST<>''INICIAL'' and  B.URQEST<>''ATENDIDO'') '
                    +' AND B.URQFREG>='+sDesde
                    +' AND B.URQFREG<='+sHasta;

         if rgPeriodo.ItemIndex=0 then//Anual
            sSQL:= sSQL+ ' AND NVL(B.REQANUAL,''X'')=''S'' '
         else
             if rgPeriodo.ItemIndex=1 then//Normal
                sSQL:= sSQL+ ' AND NVL(B.REQANUAL,''X'')<>''S'' ';

         sSQL:= sSQL+' AND( DURQCNSLG>0 OR DURQCNSLU>0)';
      end
      else
      begin
        if rgTipo.ItemIndex=1 then  //AGRUPADO
        begin
           sSQL:= ' SELECT  A.CCOSID,D.CCOSDES,A.ARTID,C.ARTDES,C.UNMIDG, '
                 +' SUM(A.DURQCNAG) DURQCNAG ,SUM(A.DURQCNAU) DURQCNAU, '
                 +' SUM(A.DURQCNATG) DURQCNATG,SUM(A.DURQCNATU) DURQCNATU,'
                 +' SUM(A.DURQCNSLG) DURQCNSLG,SUM(A.DURQCNSLU) DURQCNSLU, '''' URQID, '''' URQFREG '
                 +' FROM LOG307 A , LOG306 B, TGE205 C, TGE203 D '
                 +' WHERE (B.CIAID=A.CIAID AND B.LOCID=A.LOCID AND B.CCOSID=A.CCOSID AND B.URQID=A.URQID) '
                 +' AND (C.CIAID(+)=A.CIAID AND C.ARTID(+)=A.ARTID) '
                 +' AND D.CCOSID=A.CCOSID'
                 +' AND A.CIAID='+Quotedstr(dblcCIA.text)
                 +' AND A.LOCID='+Quotedstr(dblcLOC.text);
           if length(dblcGrpArti.text)>0 then
              sSQL:= sSQL+' AND C.GRARID='+Quotedstr(dblcGrpArti.Text);
           if length(dblcFAM.text)>0 then
              sSQL:= sSQL+' AND C.FAMID='+Quotedstr(dblcFAM.Text);
           if length(dbcldArti.text)>0 then
              sSQL:= sSQL+' AND C.ARTID='+Quotedstr(dbcldArti.Text);

           sSQL:= sSQL+' AND (B.URQEST<>''INICIAL'' and  B.URQEST<>''ATENDIDO'') '
                      +' AND B.URQFREG>='+sDesde
                      +' AND B.URQFREG<='+sHasta;

           if rgPeriodo.ItemIndex=0 then//Anual
              sSQL:= sSQL+ ' AND NVL(B.REQANUAL,''X'')=''S'' '
           else
               if rgPeriodo.ItemIndex=1 then//Normal
                  sSQL:= sSQL+ ' AND NVL(B.REQANUAL,''X'')<>''S'' ';
           sSQL:= sSQL+' AND( DURQCNSLG>0 OR DURQCNSLU>0)';
           sSQL:= sSQL+' GROUP BY A.CCOSID,D.CCOSDES,A.ARTID,C.ARTDES,C.UNMIDG ';
        end;
      end;
      Mtx5000.NoVisible.Clear;
      Mtx5000.NoVisible.Add('ARTID');
      Mtx5000.NoVisible.Add('ARTDES');
      Mtx5000.NoVisible.Add('UNMIDG');
      Mtx5000.NoVisible.Add('DURQCNAU');
      Mtx5000.NoVisible.Add('DURQCNATU');
      Mtx5000.NoVisible.Add('DURQCNSLU');
    end
    else  // CENTRO DE COSTO
    begin
      if rgCondicion.ItemIndex= 1 then
      begin
        if rgTipo.itemindex=0 then //DETALLADO
        begin
          sSQL:=  ' SELECT  A.CCOSID,'' '' CCOSDES,A.ARTID,C.ARTDES,C.UNMIDG,'
                 +' A.DURQCNAG,A.DURQCNAU,A.DURQCNATG,A.DURQCNATU, '
                 +' A.DURQCNSLG,A.DURQCNSLU, A.URQID, B.URQFREG '
                 +' FROM LOG307 A , LOG306 B, TGE205 C '
                 +' WHERE (B.CIAID=A.CIAID AND B.LOCID=A.LOCID AND B.CCOSID=A.CCOSID AND B.URQID=A.URQID) '
                 +' AND (C.CIAID(+)=A.CIAID AND C.ARTID(+)=A.ARTID) '
                 +' AND A.CIAID='+Quotedstr(dblcCIA.text)
                 +' AND A.LOCID='+Quotedstr(dblcLOC.text)
                 +' AND A.CCOSID='+Quotedstr(dblcdCCSoli.text);
          sSQL:= sSQL+' AND (B.URQEST<>''INICIAL'' and  B.URQEST<>''ATENDIDO'') '
                    +' AND B.URQFREG>='+sDesde
                    +' AND B.URQFREG<='+sHasta;

          if rgPeriodo.ItemIndex=0 then//Anual
             sSQL:= sSQL+ ' AND NVL(B.REQANUAL,''X'')=''S'' '
          else
             if rgPeriodo.ItemIndex=1 then//Normal
                sSQL:= sSQL+ ' AND NVL(B.REQANUAL,''X'')<>''S'' ';

          sSQL:= sSQL+' AND( DURQCNSLG>0 OR DURQCNSLU>0)';
        end
        else
        begin
          if rgTipo.itemindex=1 then //AGRUPADO
          begin
              sSQL:=  ' SELECT  A.CCOSID,'' '' CCOSDES,A.ARTID,C.ARTDES,C.UNMIDG,'
                     +' SUM(A.DURQCNAG) DURQCNAG,SUM(A.DURQCNAU) DURQCNAU, '
                     +' SUM(A.DURQCNATG) DURQCNATG, SUM(A.DURQCNATU) DURQCNATU, '
                     +' SUM(A.DURQCNSLG) DURQCNSLG, SUM(A.DURQCNSLU)  DURQCNSLU, '''' URQID, '''' URQFREG'
                     +' FROM LOG307 A , LOG306 B, TGE205 C '
                     +' WHERE (B.CIAID=A.CIAID AND B.LOCID=A.LOCID AND B.CCOSID=A.CCOSID AND B.URQID=A.URQID) '
                     +' AND (C.CIAID(+)=A.CIAID AND C.ARTID(+)=A.ARTID) '
                     +' AND A.CIAID='+Quotedstr(dblcCIA.text)
                     +' AND A.LOCID='+Quotedstr(dblcLOC.text)
                     +' AND A.CCOSID='+Quotedstr(dblcdCCSoli.text);
              sSQL:= sSQL+' AND (B.URQEST<>''INICIAL'' and  B.URQEST<>''ATENDIDO'') '
                        +' AND B.URQFREG>='+sDesde
                        +' AND B.URQFREG<='+sHasta;

              if rgPeriodo.ItemIndex=0 then//Anual
                 sSQL:= sSQL+ ' AND NVL(B.REQANUAL,''X'')=''S'' '
              else
                 if rgPeriodo.ItemIndex=1 then//Normal
                    sSQL:= sSQL+ ' AND NVL(B.REQANUAL,''X'')<>''S'' ';

              sSQL:= sSQL+' AND( DURQCNSLG>0 OR DURQCNSLU>0)';

              sSQL:= sSQL+' GROUP BY A.CCOSID,A.ARTID,C.ARTDES,C.UNMIDG'

          end;
        end;
        Mtx5000.NoVisible.Clear;
        Mtx5000.NoVisible.Add('CCOSID');
        Mtx5000.NoVisible.Add('CCOSDES');
        Mtx5000.NoVisible.Add('DURQCNAU');
        Mtx5000.NoVisible.Add('DURQCNATU');
        Mtx5000.NoVisible.Add('DURQCNSLU');
      end;
    end;

   mtx5000.UsuarioSQL.Clear;
   mtx5000.UsuarioSQL.Add(sSQL) ;
   mtx5000.NewQuery;

   DMLOG.cdsKdx.Data := Mtx5000.FMant.cds2.Data;

//   if Mtx5000.FMant.cds2.RecordCount= 0 then
   if DMLOG.cdsKdx.RecordCount= 0 then
   begin
      raise exception.Create('No existe Datos para esta consulta');
   end;

  sDesde:=formatdatetime(DMLOG.wFormatFecha,dtpDesde.DateTime);
  sHasta:=formatdatetime(DMLOG.wFormatFecha,dtpHasta.DateTime);

  if rgCondicion.ItemIndex=0 then //ARTICULO
  begin
    ppDBPArt.DataSource:= DMLOG.dsKDX;
    ppRArt.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\ReqPendArticulo.rtm' ;
    ppRArt.Template.LoadFromFile;

    sTitulo := 'REQUERIMIENTOS PENDIENTES POR ARTICULO ';
    if rgPeriodo.ItemIndex=0 then
       sTitulo:= sTitulo+ 'ANUAL'
    else
      if rgPeriodo.ItemIndex=1 then
         sTitulo:= sTitulo+ 'NORMAL'
      else
        if rgPeriodo.ItemIndex=2 then
           sTitulo:= sTitulo+ 'AMBOS';

    pplblCia2.Caption:= dbeCIA.text;
    pplblTitulo2.Caption := sTitulo;
    pplblRango2.Caption  := 'Desde:'+sDesde+' Hasta:'+sHasta;
    pplblUsuario2.Caption := DMLOG.wUsuario;
    ppRArt.Print;
  end
  else
  begin
    if rgCondicion.ItemIndex=1 then //CCOSTO
    begin
       ppDBPCCosto.DataSource:= DMLOG.dsKDX;
       ppRCCosto.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\ReqPendCCosto.rtm' ;
       ppRCCosto.Template.LoadFromFile;

       sTitulo := 'REQUERIMIENTOS PENDIENTES POR CENTRO COSTO ';
       if rgPeriodo.ItemIndex=0 then
          sTitulo:= sTitulo+ 'ANUAL'
       else
         if rgPeriodo.ItemIndex=1 then
            sTitulo:= sTitulo+ 'NORMAL'
         else
           if rgPeriodo.ItemIndex=2 then
              sTitulo:= sTitulo+ 'AMBOS';

       pplblTitulo.Caption := sTitulo;
       pplblRango.Caption  := 'Desde:'+sDesde+' Hasta:'+sHasta;
       pplblCia.Caption:= dbeCIA.text;
       pplblUsuario.Caption := DMLOG.wUsuario;
       pplblCCosdes.Caption := edtCCostoSoli.text;
       ppRCCosto.Print;
    end;
  end;
end;

procedure TFToolReqPend.rgCondicionClick(Sender: TObject);
begin
  if rgCondicion.itemindex=0 then//ARTICULO
  begin
     gbLinea.Visible := true;
     gbCCosto.visible:= False;
     dblcTINID.text :='';
     dblcGrpArti.text := '';
     dblcFAM.text :='';
     dblcSUBFAM.text := '';
     dbcldArti.text  := '';
  end
  else
     if rgCondicion.itemindex=1 then//CCOSTO
     begin
     gbLinea.Visible := False;
     gbCCosto.visible:= True;
     dblcdCCSoli.text:='';

     end;

end;

procedure TFToolReqPend.dblcGrpArtiEnter(Sender: TObject);
var
   sSQL : string;
begin
  sSQL := ' SELECT * FROM TGE131  '+
          ' WHERE CIAID='+Quotedstr(dblcCIA.text)+
          ' AND TINID='+Quotedstr(dblcTINID.text)+
          ' ORDER BY CIAID, TINID, GRARID';
  DMLOG.cdsGArti.Close;
  DMLOG.cdsGArti.DataRequest(sSQL);
  DMLOG.cdsGArti.Open;

end;

procedure TFToolReqPend.dblcFAMEnter(Sender: TObject);
var
   sSQL : string;
begin
	sSQL :=	 ' SELECT * FROM TGE169  '
          +' WHERE CIAID='+Quotedstr(dblcCIA.text)
          +' AND TINID='+Quotedstr(dblcTINID.text)
          +' AND GRARID='+QuotedStr(dblcGrpArti.text);
  DMLOG.cdsFAM.Close;
  DMLOG.cdsFAM.DataRequest(sSQL);
  DMLOG.cdsFAM.Open;

end;

procedure TFToolReqPend.dblcSUBFAMEnter(Sender: TObject);
var
  sSQL,sWhere: string;
begin
  sSQL := 'SELECT * FROM TGE170 '
         +' WHERE CIAID='+Quotedstr(dblcCIA.text)
         +' AND TINID='+Quotedstr(dblcTINID.text)
         +' AND GRARID='+QuotedStr(dblcGrpArti.text)
         +' AND FAMID='+QuotedStr(dblcFAM.text);
          
  DMLOG.cdsSUBFAM.Close;
  DMLOG.cdsSUBFAM.DataRequest(sSQL);
  DMLOG.cdsSUBFAM.Open;

end;

procedure TFToolReqPend.dbcldArtiEnter(Sender: TObject);
var
  sSQL,sWhere : string;
begin
  sSQL :=   ' SELECT ARTID,ARTDES,UNMIDG FROM TGE205'
           +' WHERE CIAID='+Quotedstr(dblcCIA.text)
           +' AND TINID='+Quotedstr(dblcTINID.text)
           +' AND GRARID='+Quotedstr(dblcGrpArti.text);

{  if (length(dblcFAM.text)>0) and (length(sWhere)=0) then
      sWhere:= ' WHERE FAMID='+Quotedstr(dblcFAM.text)
  else
     if (length(dblcFAM.text)>0) and (length(sWhere)>0) then
         sWhere:= sWhere+' AND FAMID='+Quotedstr(dblcFAM.text);

  if (length(dblcSUBFAM.text)>0) and (length(sWhere)=0) then
      sWhere:= ' WHERE FAMID='+Quotedstr(dblcSUBFAM.text)
  else
     if (length(dblcSUBFAM.text)>0) and (length(sWhere)>0) then
         sWhere:= sWhere+' AND FAMID='+Quotedstr(dblcSUBFAM.text);}

  sSQL:= sSQL+sWhere;
//  DMLOG.cdsArti.IndexFieldNames := '';
  DMLOG.cdsArti.Filter:='';
  DMLOG.cdsArti.Filtered:= False;
  DMLOG.cdsArti.Close;
  DMLOG.cdsArti.DataRequest(sSQL);
  DMLOG.cdsArti.Open;

end;

procedure TFToolReqPend.dblcdCCSoliEnter(Sender: TObject);
var
   sSQL : string;
begin
   sSQL:= 'SELECT CCOSID,CCOSDES,CCOSABR FROM TGE203';
   DMLOG.cdsCCost.Close;
   DMLOG.cdsCCost.DataRequest(sSQL);
   DMLOG.cdsCCost.Open;

end;

procedure TFToolReqPend.rgCondicionExit(Sender: TObject);
begin
{  if rgCondicion.itemindex=0 then
  begin
     gbLinea.Visible := true;
     gbCCosto.visible:= False;
  end
  else
     if rgCondicion.itemindex=1 then
     begin
     gbLinea.Visible := False;
     gbCCosto.visible:= True;

     end;}

end;

procedure TFToolReqPend.dblcTINIDEnter(Sender: TObject);
var
   sSQL : string;
begin
  sSQL :=' SELECT * FROM TGE152'+
         ' WHERE CIAID='+Quotedstr(dblcCIA.text);
         
  DMLOG.cdsTINID.Close;
  DMLOG.cdsTINID.DataRequest(sSQL);
  DMLOG.cdsTINID.Open;         

end;

procedure TFToolReqPend.dblcCIAExit(Sender: TObject);
begin
  dbeCia.text := DMLOG.DisplayDescrip('prvTGE','TGE101','CIADES','CIAID='+quotedstr(dblcCIA.text),'CIADES');
end;

procedure TFToolReqPend.dblcLOCEnter(Sender: TObject);
var
  sSQL : string;
                                       
begin
  sSQL:= ' SELECT * FROM TGE126 '
        +' WHERE CIAID='+Quotedstr(dblcCIA.text);
  DMLOG.cdsLOC.Close;
  DMLOG.cdsLOC.DataRequest( sSQL );
  DMLOG.cdsLOC.open;

end;

procedure TFToolReqPend.dblcLOCExit(Sender: TObject);
var
    sSQL : string;
begin
 
	sSQL:='LOCID='+quotedstr(dblcLOC.text)+' AND CIAID='+quotedstr(dblcCIA.text);
	dbeLoc.Text := DMLOG.DisplayDescrip('prvTGE','tge126','LOCDES',sSQL,'LOCDES');

end;

procedure TFToolReqPend.dblcdCCSoliExit(Sender: TObject);
var
  sSQL : string; 
begin
	sSQL:='CCOSID='+quotedStr(dblcdCCSoli.text)+' AND CCOSCIAS LIKE ''%'+dblcCIA.Text+'%''';
	DMLOG.DisplayDescrip('prvSQL','TGE203','CCOSDES, CCOSMOV',sSQL,'CCOSDES');
  edtCCostoSoli.Text := DMLOG.cdsQry.FieldByName('CCOSDES').ASString;

end;

procedure TFToolReqPend.Timer1Timer(Sender: TObject);
begin
   //FVariables.w_NombreForma := 'FToolReqPend';
   if (DMLOG.wAdmin='G') or (DMLOG.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMLOG.AccesosUsuariosR( DMLOG.wModulo,DMLOG.wUsuario,'2',FToolReqPend);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

end.
